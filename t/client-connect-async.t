use strict;
use warnings;
use OPCUA::Open62541 qw(:STATUSCODE :CLIENTSTATE);
use IO::Socket::INET;
use Scalar::Util qw(looks_like_number);
use Time::HiRes qw(sleep);

use OPCUA::Open62541::Test::Server;
use OPCUA::Open62541::Test::Client;
use Test::More;
BEGIN {
    if (OPCUA::Open62541::Client->can('connect_async')) {
	plan tests =>
	    OPCUA::Open62541::Test::Server::planning() +
	    OPCUA::Open62541::Test::Client::planning() * 4 + 8;
    } else {
	plan skip_all => "No UA_Client_connect_async in open62541";
    }
}
use Test::Exception;
use Test::NoWarnings;
use Test::LeakTrace;

my $server = OPCUA::Open62541::Test::Server->new();
$server->start();

# There is a bug in open62541 1.0.1 that crashes the client with a
# segmentation fault.  It happens when the client delete() tries to
# free an uninitialized addrinfo.  It is triggered by destroying a
# client that never did a name lookup.  The OpenBSD port has a patch
# that fixes the bug.  Use the buildinfo from the library to figure
# out if we are affected.  Then skip the tests that trigger it.
# https://github.com/open62541/open62541/commit/
#   f9ceec7be7940495cf2ee091bed1bb5acec74551

my $skip_freeaddrinfo;
ok(my $buildinfo = $server->{config}->getBuildInfo());
note explain $buildinfo;
if ($^O ne 'openbsd' && $buildinfo->{BuildInfo_softwareVersion} =~ /^1\.0\./) {
    $skip_freeaddrinfo = "freeaddrinfo bug in ".
	"library '$buildinfo->{BuildInfo_manufacturerName}' ".
	"version '$buildinfo->{BuildInfo_softwareVersion}' ".
	"operating system '$^O'";
}

my $client = OPCUA::Open62541::Test::Client->new(port => $server->port());
$client->start();
$server->run();

my $data = ['foo'];
my $connected = 0;
is($client->{client}->connect_async(
    $client->url(),
    sub {
	my ($c, $d, $i, $r) = @_;

	is($c->getState(), CLIENTSTATE_SESSION, "callback client state");
	is($d->[0], "foo", "callback data in");
	push @$d, 'bar';
	ok(looks_like_number $i, "callback request id")
	    or diag "request id not a number: $i";
	is($r, STATUSCODE_GOOD, "callback response");

	$connected = 1;
    },
    $data
), STATUSCODE_GOOD, "connect async");
# wait an initial 100ms for open62541 to start the timer that creates the socket
sleep .1;
$client->iterate(\$connected, "connect");
is($client->{client}->getState(), CLIENTSTATE_SESSION, "client state");
is($data->[1], "bar", "callback data out");

$client->stop();

$client = OPCUA::Open62541::Test::Client->new(port => $server->port());
$client->start();

# Run the test again, check for leaks, no check within leak detection.
# Although no_leaks_ok runs the code block multiple times, the callback
# is only called once.
$connected = 0;
no_leaks_ok {
    $client->{client}->connect_async(
	$client->url(),
	sub {
	    my ($c, $d, $i, $r) = @_;
	    $connected = 1;
	},
	$data
    );
    sleep .1;
    $client->iterate(\$connected);
} "connect async leak";

$client->stop();

# run test without connect callback
$client = OPCUA::Open62541::Test::Client->new(port => $server->port());
$client->start();

is($client->{client}->connect_async($client->url(), undef, undef),
    STATUSCODE_GOOD, "connect async undef callback");
sleep .1;
$client->iterate(sub {
    return $client->{client}->getState() == CLIENTSTATE_SESSION;
}, "connect undef callback");

$client->stop();

# the connection itself gets established in run_iterate. so this call should
# also succeed if no server is running
no_leaks_ok { $client->{client}->connect_async($client->url(), undef, undef) }
    "connect async no callback leak";

$server->stop();

# Run test without callback being called due to nonexisting target.
# The connect_async() call must succeed, but iterate() must fail.
# A non OPC UA server accepting TCP will do the job.

my $tcp_server = IO::Socket::INET->new(
    LocalAddr	=> "localhost",
    Proto	=> "tcp",
    Listen	=> 1,
);
ok($tcp_server, "tcp server") or diag "tcp server new and listen failed: $!";
my $tcp_port = $tcp_server->sockport();

$client = OPCUA::Open62541::Test::Client->new(port => $tcp_port);
$client->start();

is($client->{client}->connect_async(
    $client->url(),
    sub {
	my ($c, $d, $i, $r) = @_;
    },
    undef,
), STATUSCODE_GOOD, "connect async bad url");
undef $tcp_server;
sleep .1;
$client->iterate(undef, "connect bad url");
is($client->{client}->getState(), CLIENTSTATE_DISCONNECTED,
    "client bad connection");

no_leaks_ok {
    $tcp_server = IO::Socket::INET->new(
	LocalAddr	=> "localhost",
	LocalPort	=> $tcp_port,
	Proto		=> "tcp",
	Listen		=> 1,
    );
    $client->{client}->connect_async(
	$client->url(),
	sub {
	    my ($c, $d, $i, $r) = @_;
	},
	undef,
    );
    undef $tcp_server;
    sleep .1;
    $client->iterate(undef);
} "connect async bad url leak";

SKIP: {
    skip $skip_freeaddrinfo, 3 if $skip_freeaddrinfo;

# connect to invalid url fails, check that it does not leak
$data = "foo";
is($client->{client}->connect_async(
    "opc.tcp://localhost:",
    sub {
	my ($c, $d, $i, $r) = @_;
	fail "callback called";
    },
    \$data,
), STATUSCODE_BADCONNECTIONCLOSED, "connect async fail");
is($data, "foo", "data fail");
no_leaks_ok {
    $client->{client}->connect_async(
	"opc.tcp://localhost:",
	sub {
	    my ($c, $d, $i, $r) = @_;
	},
	\$data,
    );
} "connect async fail leak";

}  # SKIP

throws_ok { $client->{client}->connect_async($client->url(), "foo", undef) }
    (qr/Callback 'foo' is not a CODE reference /,
    "callback not reference");
no_leaks_ok {
    eval { $client->{client}->connect_async($client->url(), "foo", undef) }
} "callback not reference leak";

throws_ok { $client->{client}->connect_async($client->url(), [], undef) }
    (qr/Callback 'ARRAY.*' is not a CODE reference /,
    "callback not code reference");
no_leaks_ok {
    eval { $client->{client}->connect_async($client->url(), [], undef) }
} "callback not code reference leak";
