use strict;
use warnings;
use OPCUA::Open62541;

use Test::More tests => 29;
use Test::Deep;
use Test::Exception;
use Test::LeakTrace;
use Test::NoWarnings;

ok(my $server = OPCUA::Open62541::Server->new(), "server new");
ok(my $config = $server->getConfig(), "config get");
is($config->setDefault(), "Good", "default set");
no_leaks_ok { $config->setDefault() } "default set leak";

throws_ok { OPCUA::Open62541::ServerConfig::setDefault() }
    (qr/OPCUA::Open62541::ServerConfig::setDefault\(config\) /,
    "config missing");
no_leaks_ok { eval { OPCUA::Open62541::ServerConfig::setDefault() } }
    "config missing leak";

throws_ok { OPCUA::Open62541::ServerConfig::setDefault(1) }
    (qr/Self config is not a OPCUA::Open62541::ServerConfig /,
    "config type");
no_leaks_ok { eval { OPCUA::Open62541::ServerConfig::setDefault(1) } }
    "config type leak";

lives_ok { $config->setCustomHostname("foo\0bar") }
    "custom hostname";
no_leaks_ok { $config->setCustomHostname("foo\0bar") }
    "custom hostname leak";

ok(my $buildinfo = $config->getBuildInfo(), "buildinfo get");
no_leaks_ok { $config->getBuildInfo() } "buildinfo leak";
my %info = (
    BuildInfo_buildDate => re(qr/^\d+$/),  # '132325380645571530',
    BuildInfo_buildNumber => re(qr/^\w+$/),  # 'deb',
    BuildInfo_manufacturerName => 'open62541',
    BuildInfo_productName => 'open62541 OPC UA Server',
    BuildInfo_productUri => 'http://open62541.org',
    BuildInfo_softwareVersion => re(qr/^1\./)  # '1.0.1'
);
cmp_deeply($buildinfo, \%info, "buildinfo hash");

lives_ok { $config->setMaxSessions(42) }
    "custom max sessions";
no_leaks_ok { $config->setMaxSessions(42) }
    "custom max sessions leak";

ok(my $maxsessions = $config->getMaxSessions(), "max sessions get");
no_leaks_ok { $config->getMaxSessions() } "max sessions leak";
is($maxsessions, 42, "max sessions");

lives_ok { $config->setMaxSessionTimeout(30000) }
    "custom max session timeout";
no_leaks_ok { $config->setMaxSessionTimeout(30000) }
    "custom max session timeout leak";

ok(my $maxsessiontimeout = $config->getMaxSessionTimeout(),
    "max session timeout get");
no_leaks_ok { $config->getMaxSessionTimeout() } "max session timeout leak";
is($maxsessiontimeout, 30000, "max session timeout");

lives_ok { $config->setMaxSecureChannels(23) }
    "custom max secure channels";
no_leaks_ok { $config->setMaxSecureChannels(23) }
    "custom max secure channels leak";

ok(my $maxsecurechannels = $config->getMaxSecureChannels(),
    "max secure channels get");
no_leaks_ok { $config->getMaxSecureChannels() } "max secure channels leak";
is($maxsecurechannels, 23, "max secure channels");
