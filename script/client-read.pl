#!/usr/bin/perl
# Generate UA_Client_read..._async() function wrapper.

use strict;
use warnings;

my @asyncreads = qw(
    ValueAttribute				Variant
    NodeIdAttribute				NodeId
    NodeClassAttribute				NodeClass
    BrowseNameAttribute				QualifiedName
    DisplayNameAttribute			LocalizedText
    DescriptionAttribute			LocalizedText
    WriteMaskAttribute				UInt32
    UserWriteMaskAttribute			UInt32
    IsAbstractAttribute				Boolean
    SymmetricAttribute				Boolean
    InverseNameAttribute			LocalizedText
    ContainsNoLoopsAttribute			Boolean
    EventNotifierAttribute			Byte
    ValueRankAttribute				Int32
    AccessLevelAttribute			Byte
    UserAccessLevelAttribute			Byte
    MinimumSamplingIntervalAttribute		Double
    HistorizingAttribute			Boolean
    ExecutableAttribute				Boolean
    UserExecutableAttribute			Boolean
);

open(my $cf, '>', "Open62541-client-read-callback.xsh")
    or die "Open 'Open62541-client-read-callback.xsh' for writing failed: $!";
print $cf "/* begin generated by $0 */\n\n";
open(my $rf, '>', "Open62541-client-read.xsh")
    or die "Open 'Open62541-client-read.xsh' for writing failed: $!";
print $rf "# begin generated by $0\n\n";

my (%names, %types);
while (@asyncreads) {
    my $name = shift @asyncreads;
    my $type = shift @asyncreads;
    $names{$name} = $type;
    $types{$type} = 1;
}
foreach my $name (sort keys %names) {
    my $type = $names{$name};
    print_xsasync($rf, $name, $type);
}
foreach my $type (sort keys %types) {
    print_xscallback($cf, $type);
}

print $cf "/* end generated by $0 */\n";
close($cf) or die
    "Close 'Open62541-client-read-callback.xsh' after writing failed: $!";
print $rf "# end generated by $0\n";
close($rf) or die
    "Close 'Open62541-client-read.xsh' after writing failed: $!";

exit(0);

########################################################################
sub print_xsasync {
    my ($xsf, $name, $type) = @_;
    print $xsf <<"EOXSFUNC";
UA_StatusCode
UA_Client_read${name}_async(client, nodeId, callback, data, outoptReqId)
	OPCUA_Open62541_Client		client
	OPCUA_Open62541_NodeId		nodeId
	SV *				callback
	SV *				data
	OPCUA_Open62541_UInt32		outoptReqId
    PREINIT:
	ClientCallbackData		ccd;
    CODE:
	ccd = newClientCallbackData(callback, ST(0), data);
	RETVAL = UA_Client_read${name}_async(client->cl_client,
	    *nodeId, clientAsyncRead${type}Callback, ccd, outoptReqId);
	if (RETVAL != UA_STATUSCODE_GOOD)
		deleteClientCallbackData(ccd);
	if (outoptReqId != NULL)
		XS_pack_UA_UInt32(SvRV(ST(4)), *outoptReqId);
    OUTPUT:
	RETVAL

EOXSFUNC
}

########################################################################
sub print_xscallback {
    my ($xsf, $type) = @_;
    print $xsf <<"EOXSFUNC";
static void
clientAsyncRead${type}Callback(UA_Client *client, void *userdata,
    UA_UInt32 requestId, UA_${type} *var)
{
	dTHX;
	SV *sv;

	sv = newSV(0);
	if (var != NULL)
		XS_pack_UA_${type}(sv, *var);

	clientCallbackPerl(client, userdata, requestId, sv);
}

EOXSFUNC
}
