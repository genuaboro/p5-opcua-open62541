package OPCUA::Open62541;

use 5.026001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

my @types = qw(
    TYPES_BOOLEAN
    TYPES_SBYTE
    TYPES_BYTE
    TYPES_INT16
    TYPES_UINT16
    TYPES_INT32
    TYPES_UINT32
    TYPES_INT64
    TYPES_UINT64
    TYPES_FLOAT
    TYPES_DOUBLE
    TYPES_STRING
    TYPES_DATETIME
    TYPES_GUID
    TYPES_BYTESTRING
    TYPES_XMLELEMENT
    TYPES_NODEID
    TYPES_EXPANDEDNODEID
    TYPES_STATUSCODE
    TYPES_QUALIFIEDNAME
    TYPES_LOCALIZEDTEXT
    TYPES_EXTENSIONOBJECT
    TYPES_DATAVALUE
    TYPES_VARIANT
    TYPES_DIAGNOSTICINFO
    TYPES_NODECLASS
    TYPES_ARGUMENT
    TYPES_ENUMVALUETYPE
    TYPES_DURATION
    TYPES_UTCTIME
    TYPES_LOCALEID
    TYPES_APPLICATIONTYPE
    TYPES_APPLICATIONDESCRIPTION
    TYPES_REQUESTHEADER
    TYPES_RESPONSEHEADER
    TYPES_SERVICEFAULT
    TYPES_FINDSERVERSREQUEST
    TYPES_FINDSERVERSRESPONSE
    TYPES_SERVERONNETWORK
    TYPES_FINDSERVERSONNETWORKREQUEST
    TYPES_FINDSERVERSONNETWORKRESPONSE
    TYPES_MESSAGESECURITYMODE
    TYPES_USERTOKENTYPE
    TYPES_USERTOKENPOLICY
    TYPES_ENDPOINTDESCRIPTION
    TYPES_GETENDPOINTSREQUEST
    TYPES_GETENDPOINTSRESPONSE
    TYPES_REGISTEREDSERVER
    TYPES_REGISTERSERVERREQUEST
    TYPES_REGISTERSERVERRESPONSE
    TYPES_DISCOVERYCONFIGURATION
    TYPES_MDNSDISCOVERYCONFIGURATION
    TYPES_REGISTERSERVER2REQUEST
    TYPES_REGISTERSERVER2RESPONSE
    TYPES_SECURITYTOKENREQUESTTYPE
    TYPES_CHANNELSECURITYTOKEN
    TYPES_OPENSECURECHANNELREQUEST
    TYPES_OPENSECURECHANNELRESPONSE
    TYPES_CLOSESECURECHANNELREQUEST
    TYPES_CLOSESECURECHANNELRESPONSE
    TYPES_SIGNEDSOFTWARECERTIFICATE
    TYPES_SIGNATUREDATA
    TYPES_CREATESESSIONREQUEST
    TYPES_CREATESESSIONRESPONSE
    TYPES_USERIDENTITYTOKEN
    TYPES_ANONYMOUSIDENTITYTOKEN
    TYPES_USERNAMEIDENTITYTOKEN
    TYPES_X509IDENTITYTOKEN
    TYPES_ISSUEDIDENTITYTOKEN
    TYPES_ACTIVATESESSIONREQUEST
    TYPES_ACTIVATESESSIONRESPONSE
    TYPES_CLOSESESSIONREQUEST
    TYPES_CLOSESESSIONRESPONSE
    TYPES_NODEATTRIBUTESMASK
    TYPES_NODEATTRIBUTES
    TYPES_OBJECTATTRIBUTES
    TYPES_VARIABLEATTRIBUTES
    TYPES_METHODATTRIBUTES
    TYPES_OBJECTTYPEATTRIBUTES
    TYPES_VARIABLETYPEATTRIBUTES
    TYPES_REFERENCETYPEATTRIBUTES
    TYPES_DATATYPEATTRIBUTES
    TYPES_VIEWATTRIBUTES
    TYPES_ADDNODESITEM
    TYPES_ADDNODESRESULT
    TYPES_ADDNODESREQUEST
    TYPES_ADDNODESRESPONSE
    TYPES_ADDREFERENCESITEM
    TYPES_ADDREFERENCESREQUEST
    TYPES_ADDREFERENCESRESPONSE
    TYPES_DELETENODESITEM
    TYPES_DELETENODESREQUEST
    TYPES_DELETENODESRESPONSE
    TYPES_DELETEREFERENCESITEM
    TYPES_DELETEREFERENCESREQUEST
    TYPES_DELETEREFERENCESRESPONSE
    TYPES_BROWSEDIRECTION
    TYPES_VIEWDESCRIPTION
    TYPES_BROWSEDESCRIPTION
    TYPES_BROWSERESULTMASK
    TYPES_REFERENCEDESCRIPTION
    TYPES_BROWSERESULT
    TYPES_BROWSEREQUEST
    TYPES_BROWSERESPONSE
    TYPES_BROWSENEXTREQUEST
    TYPES_BROWSENEXTRESPONSE
    TYPES_RELATIVEPATHELEMENT
    TYPES_RELATIVEPATH
    TYPES_BROWSEPATH
    TYPES_BROWSEPATHTARGET
    TYPES_BROWSEPATHRESULT
    TYPES_TRANSLATEBROWSEPATHSTONODEIDSREQUEST
    TYPES_TRANSLATEBROWSEPATHSTONODEIDSRESPONSE
    TYPES_REGISTERNODESREQUEST
    TYPES_REGISTERNODESRESPONSE
    TYPES_UNREGISTERNODESREQUEST
    TYPES_UNREGISTERNODESRESPONSE
    TYPES_FILTEROPERATOR
    TYPES_CONTENTFILTERELEMENT
    TYPES_CONTENTFILTER
    TYPES_FILTEROPERAND
    TYPES_ELEMENTOPERAND
    TYPES_LITERALOPERAND
    TYPES_ATTRIBUTEOPERAND
    TYPES_SIMPLEATTRIBUTEOPERAND
    TYPES_CONTENTFILTERELEMENTRESULT
    TYPES_CONTENTFILTERRESULT
    TYPES_TIMESTAMPSTORETURN
    TYPES_READVALUEID
    TYPES_READREQUEST
    TYPES_READRESPONSE
    TYPES_WRITEVALUE
    TYPES_WRITEREQUEST
    TYPES_WRITERESPONSE
    TYPES_CALLMETHODREQUEST
    TYPES_CALLMETHODRESULT
    TYPES_CALLREQUEST
    TYPES_CALLRESPONSE
    TYPES_MONITORINGMODE
    TYPES_DATACHANGETRIGGER
    TYPES_DEADBANDTYPE
    TYPES_DATACHANGEFILTER
    TYPES_EVENTFILTER
    TYPES_AGGREGATECONFIGURATION
    TYPES_AGGREGATEFILTER
    TYPES_EVENTFILTERRESULT
    TYPES_MONITORINGPARAMETERS
    TYPES_MONITOREDITEMCREATEREQUEST
    TYPES_MONITOREDITEMCREATERESULT
    TYPES_CREATEMONITOREDITEMSREQUEST
    TYPES_CREATEMONITOREDITEMSRESPONSE
    TYPES_MONITOREDITEMMODIFYREQUEST
    TYPES_MONITOREDITEMMODIFYRESULT
    TYPES_MODIFYMONITOREDITEMSREQUEST
    TYPES_MODIFYMONITOREDITEMSRESPONSE
    TYPES_SETMONITORINGMODEREQUEST
    TYPES_SETMONITORINGMODERESPONSE
    TYPES_SETTRIGGERINGREQUEST
    TYPES_SETTRIGGERINGRESPONSE
    TYPES_DELETEMONITOREDITEMSREQUEST
    TYPES_DELETEMONITOREDITEMSRESPONSE
    TYPES_CREATESUBSCRIPTIONREQUEST
    TYPES_CREATESUBSCRIPTIONRESPONSE
    TYPES_MODIFYSUBSCRIPTIONREQUEST
    TYPES_MODIFYSUBSCRIPTIONRESPONSE
    TYPES_SETPUBLISHINGMODEREQUEST
    TYPES_SETPUBLISHINGMODERESPONSE
    TYPES_NOTIFICATIONMESSAGE
    TYPES_MONITOREDITEMNOTIFICATION
    TYPES_EVENTFIELDLIST
    TYPES_STATUSCHANGENOTIFICATION
    TYPES_SUBSCRIPTIONACKNOWLEDGEMENT
    TYPES_PUBLISHREQUEST
    TYPES_PUBLISHRESPONSE
    TYPES_REPUBLISHREQUEST
    TYPES_REPUBLISHRESPONSE
    TYPES_DELETESUBSCRIPTIONSREQUEST
    TYPES_DELETESUBSCRIPTIONSRESPONSE
    TYPES_BUILDINFO
    TYPES_REDUNDANCYSUPPORT
    TYPES_SERVERSTATE
    TYPES_SERVERDIAGNOSTICSSUMMARYDATATYPE
    TYPES_SERVERSTATUSDATATYPE
    TYPES_RANGE
    TYPES_DATACHANGENOTIFICATION
    TYPES_EVENTNOTIFICATIONLIST
);

my @limits = qw(
    TRUE
    FALSE
    SBYTE_MIN
    SBYTE_MAX
    BYTE_MIN
    BYTE_MAX
    INT16_MIN
    INT16_MAX
    UINT16_MIN
    UINT16_MAX
    INT32_MIN
    INT32_MAX
    UINT32_MIN
    UINT32_MAX
    INT64_MIN
    INT64_MAX
    UINT64_MIN
    UINT64_MAX
);

my @statuscodes = qw(
    STATUSCODE_GOOD
    STATUSCODE_INFOTYPE_DATAVALUE
    STATUSCODE_INFOBITS_OVERFLOW
    STATUSCODE_BADUNEXPECTEDERROR
    STATUSCODE_BADINTERNALERROR
    STATUSCODE_BADOUTOFMEMORY
    STATUSCODE_BADRESOURCEUNAVAILABLE
    STATUSCODE_BADCOMMUNICATIONERROR
    STATUSCODE_BADENCODINGERROR
    STATUSCODE_BADDECODINGERROR
    STATUSCODE_BADENCODINGLIMITSEXCEEDED
    STATUSCODE_BADREQUESTTOOLARGE
    STATUSCODE_BADRESPONSETOOLARGE
    STATUSCODE_BADUNKNOWNRESPONSE
    STATUSCODE_BADTIMEOUT
    STATUSCODE_BADSERVICEUNSUPPORTED
    STATUSCODE_BADSHUTDOWN
    STATUSCODE_BADSERVERNOTCONNECTED
    STATUSCODE_BADSERVERHALTED
    STATUSCODE_BADNOTHINGTODO
    STATUSCODE_BADTOOMANYOPERATIONS
    STATUSCODE_BADTOOMANYMONITOREDITEMS
    STATUSCODE_BADDATATYPEIDUNKNOWN
    STATUSCODE_BADCERTIFICATEINVALID
    STATUSCODE_BADSECURITYCHECKSFAILED
    STATUSCODE_BADCERTIFICATEPOLICYCHECKFAILED
    STATUSCODE_BADCERTIFICATETIMEINVALID
    STATUSCODE_BADCERTIFICATEISSUERTIMEINVALID
    STATUSCODE_BADCERTIFICATEHOSTNAMEINVALID
    STATUSCODE_BADCERTIFICATEURIINVALID
    STATUSCODE_BADCERTIFICATEUSENOTALLOWED
    STATUSCODE_BADCERTIFICATEISSUERUSENOTALLOWED
    STATUSCODE_BADCERTIFICATEUNTRUSTED
    STATUSCODE_BADCERTIFICATEREVOCATIONUNKNOWN
    STATUSCODE_BADCERTIFICATEISSUERREVOCATIONUNKNOWN
    STATUSCODE_BADCERTIFICATEREVOKED
    STATUSCODE_BADCERTIFICATEISSUERREVOKED
    STATUSCODE_BADCERTIFICATECHAININCOMPLETE
    STATUSCODE_BADUSERACCESSDENIED
    STATUSCODE_BADIDENTITYTOKENINVALID
    STATUSCODE_BADIDENTITYTOKENREJECTED
    STATUSCODE_BADSECURECHANNELIDINVALID
    STATUSCODE_BADINVALIDTIMESTAMP
    STATUSCODE_BADNONCEINVALID
    STATUSCODE_BADSESSIONIDINVALID
    STATUSCODE_BADSESSIONCLOSED
    STATUSCODE_BADSESSIONNOTACTIVATED
    STATUSCODE_BADSUBSCRIPTIONIDINVALID
    STATUSCODE_BADREQUESTHEADERINVALID
    STATUSCODE_BADTIMESTAMPSTORETURNINVALID
    STATUSCODE_BADREQUESTCANCELLEDBYCLIENT
    STATUSCODE_BADTOOMANYARGUMENTS
    STATUSCODE_BADLICENSEEXPIRED
    STATUSCODE_BADLICENSELIMITSEXCEEDED
    STATUSCODE_BADLICENSENOTAVAILABLE
    STATUSCODE_GOODSUBSCRIPTIONTRANSFERRED
    STATUSCODE_GOODCOMPLETESASYNCHRONOUSLY
    STATUSCODE_GOODOVERLOAD
    STATUSCODE_GOODCLAMPED
    STATUSCODE_BADNOCOMMUNICATION
    STATUSCODE_BADWAITINGFORINITIALDATA
    STATUSCODE_BADNODEIDINVALID
    STATUSCODE_BADNODEIDUNKNOWN
    STATUSCODE_BADATTRIBUTEIDINVALID
    STATUSCODE_BADINDEXRANGEINVALID
    STATUSCODE_BADINDEXRANGENODATA
    STATUSCODE_BADDATAENCODINGINVALID
    STATUSCODE_BADDATAENCODINGUNSUPPORTED
    STATUSCODE_BADNOTREADABLE
    STATUSCODE_BADNOTWRITABLE
    STATUSCODE_BADOUTOFRANGE
    STATUSCODE_BADNOTSUPPORTED
    STATUSCODE_BADNOTFOUND
    STATUSCODE_BADOBJECTDELETED
    STATUSCODE_BADNOTIMPLEMENTED
    STATUSCODE_BADMONITORINGMODEINVALID
    STATUSCODE_BADMONITOREDITEMIDINVALID
    STATUSCODE_BADMONITOREDITEMFILTERINVALID
    STATUSCODE_BADMONITOREDITEMFILTERUNSUPPORTED
    STATUSCODE_BADFILTERNOTALLOWED
    STATUSCODE_BADSTRUCTUREMISSING
    STATUSCODE_BADEVENTFILTERINVALID
    STATUSCODE_BADCONTENTFILTERINVALID
    STATUSCODE_BADFILTEROPERATORINVALID
    STATUSCODE_BADFILTEROPERATORUNSUPPORTED
    STATUSCODE_BADFILTEROPERANDCOUNTMISMATCH
    STATUSCODE_BADFILTEROPERANDINVALID
    STATUSCODE_BADFILTERELEMENTINVALID
    STATUSCODE_BADFILTERLITERALINVALID
    STATUSCODE_BADCONTINUATIONPOINTINVALID
    STATUSCODE_BADNOCONTINUATIONPOINTS
    STATUSCODE_BADREFERENCETYPEIDINVALID
    STATUSCODE_BADBROWSEDIRECTIONINVALID
    STATUSCODE_BADNODENOTINVIEW
    STATUSCODE_BADNUMERICOVERFLOW
    STATUSCODE_BADSERVERURIINVALID
    STATUSCODE_BADSERVERNAMEMISSING
    STATUSCODE_BADDISCOVERYURLMISSING
    STATUSCODE_BADSEMPAHOREFILEMISSING
    STATUSCODE_BADREQUESTTYPEINVALID
    STATUSCODE_BADSECURITYMODEREJECTED
    STATUSCODE_BADSECURITYPOLICYREJECTED
    STATUSCODE_BADTOOMANYSESSIONS
    STATUSCODE_BADUSERSIGNATUREINVALID
    STATUSCODE_BADAPPLICATIONSIGNATUREINVALID
    STATUSCODE_BADNOVALIDCERTIFICATES
    STATUSCODE_BADIDENTITYCHANGENOTSUPPORTED
    STATUSCODE_BADREQUESTCANCELLEDBYREQUEST
    STATUSCODE_BADPARENTNODEIDINVALID
    STATUSCODE_BADREFERENCENOTALLOWED
    STATUSCODE_BADNODEIDREJECTED
    STATUSCODE_BADNODEIDEXISTS
    STATUSCODE_BADNODECLASSINVALID
    STATUSCODE_BADBROWSENAMEINVALID
    STATUSCODE_BADBROWSENAMEDUPLICATED
    STATUSCODE_BADNODEATTRIBUTESINVALID
    STATUSCODE_BADTYPEDEFINITIONINVALID
    STATUSCODE_BADSOURCENODEIDINVALID
    STATUSCODE_BADTARGETNODEIDINVALID
    STATUSCODE_BADDUPLICATEREFERENCENOTALLOWED
    STATUSCODE_BADINVALIDSELFREFERENCE
    STATUSCODE_BADREFERENCELOCALONLY
    STATUSCODE_BADNODELETERIGHTS
    STATUSCODE_UNCERTAINREFERENCENOTDELETED
    STATUSCODE_BADSERVERINDEXINVALID
    STATUSCODE_BADVIEWIDUNKNOWN
    STATUSCODE_BADVIEWTIMESTAMPINVALID
    STATUSCODE_BADVIEWPARAMETERMISMATCH
    STATUSCODE_BADVIEWVERSIONINVALID
    STATUSCODE_UNCERTAINNOTALLNODESAVAILABLE
    STATUSCODE_GOODRESULTSMAYBEINCOMPLETE
    STATUSCODE_BADNOTTYPEDEFINITION
    STATUSCODE_UNCERTAINREFERENCEOUTOFSERVER
    STATUSCODE_BADTOOMANYMATCHES
    STATUSCODE_BADQUERYTOOCOMPLEX
    STATUSCODE_BADNOMATCH
    STATUSCODE_BADMAXAGEINVALID
    STATUSCODE_BADSECURITYMODEINSUFFICIENT
    STATUSCODE_BADHISTORYOPERATIONINVALID
    STATUSCODE_BADHISTORYOPERATIONUNSUPPORTED
    STATUSCODE_BADINVALIDTIMESTAMPARGUMENT
    STATUSCODE_BADWRITENOTSUPPORTED
    STATUSCODE_BADTYPEMISMATCH
    STATUSCODE_BADMETHODINVALID
    STATUSCODE_BADARGUMENTSMISSING
    STATUSCODE_BADNOTEXECUTABLE
    STATUSCODE_BADTOOMANYSUBSCRIPTIONS
    STATUSCODE_BADTOOMANYPUBLISHREQUESTS
    STATUSCODE_BADNOSUBSCRIPTION
    STATUSCODE_BADSEQUENCENUMBERUNKNOWN
    STATUSCODE_BADMESSAGENOTAVAILABLE
    STATUSCODE_BADINSUFFICIENTCLIENTPROFILE
    STATUSCODE_BADSTATENOTACTIVE
    STATUSCODE_BADALREADYEXISTS
    STATUSCODE_BADTCPSERVERTOOBUSY
    STATUSCODE_BADTCPMESSAGETYPEINVALID
    STATUSCODE_BADTCPSECURECHANNELUNKNOWN
    STATUSCODE_BADTCPMESSAGETOOLARGE
    STATUSCODE_BADTCPNOTENOUGHRESOURCES
    STATUSCODE_BADTCPINTERNALERROR
    STATUSCODE_BADTCPENDPOINTURLINVALID
    STATUSCODE_BADREQUESTINTERRUPTED
    STATUSCODE_BADREQUESTTIMEOUT
    STATUSCODE_BADSECURECHANNELCLOSED
    STATUSCODE_BADSECURECHANNELTOKENUNKNOWN
    STATUSCODE_BADSEQUENCENUMBERINVALID
    STATUSCODE_BADPROTOCOLVERSIONUNSUPPORTED
    STATUSCODE_BADCONFIGURATIONERROR
    STATUSCODE_BADNOTCONNECTED
    STATUSCODE_BADDEVICEFAILURE
    STATUSCODE_BADSENSORFAILURE
    STATUSCODE_BADOUTOFSERVICE
    STATUSCODE_BADDEADBANDFILTERINVALID
    STATUSCODE_UNCERTAINNOCOMMUNICATIONLASTUSABLEVALUE
    STATUSCODE_UNCERTAINLASTUSABLEVALUE
    STATUSCODE_UNCERTAINSUBSTITUTEVALUE
    STATUSCODE_UNCERTAININITIALVALUE
    STATUSCODE_UNCERTAINSENSORNOTACCURATE
    STATUSCODE_UNCERTAINENGINEERINGUNITSEXCEEDED
    STATUSCODE_UNCERTAINSUBNORMAL
    STATUSCODE_GOODLOCALOVERRIDE
    STATUSCODE_BADREFRESHINPROGRESS
    STATUSCODE_BADCONDITIONALREADYDISABLED
    STATUSCODE_BADCONDITIONALREADYENABLED
    STATUSCODE_BADCONDITIONDISABLED
    STATUSCODE_BADEVENTIDUNKNOWN
    STATUSCODE_BADEVENTNOTACKNOWLEDGEABLE
    STATUSCODE_BADDIALOGNOTACTIVE
    STATUSCODE_BADDIALOGRESPONSEINVALID
    STATUSCODE_BADCONDITIONBRANCHALREADYACKED
    STATUSCODE_BADCONDITIONBRANCHALREADYCONFIRMED
    STATUSCODE_BADCONDITIONALREADYSHELVED
    STATUSCODE_BADCONDITIONNOTSHELVED
    STATUSCODE_BADSHELVINGTIMEOUTOFRANGE
    STATUSCODE_BADNODATA
    STATUSCODE_BADBOUNDNOTFOUND
    STATUSCODE_BADBOUNDNOTSUPPORTED
    STATUSCODE_BADDATALOST
    STATUSCODE_BADDATAUNAVAILABLE
    STATUSCODE_BADENTRYEXISTS
    STATUSCODE_BADNOENTRYEXISTS
    STATUSCODE_BADTIMESTAMPNOTSUPPORTED
    STATUSCODE_GOODENTRYINSERTED
    STATUSCODE_GOODENTRYREPLACED
    STATUSCODE_UNCERTAINDATASUBNORMAL
    STATUSCODE_GOODNODATA
    STATUSCODE_GOODMOREDATA
    STATUSCODE_BADAGGREGATELISTMISMATCH
    STATUSCODE_BADAGGREGATENOTSUPPORTED
    STATUSCODE_BADAGGREGATEINVALIDINPUTS
    STATUSCODE_BADAGGREGATECONFIGURATIONREJECTED
    STATUSCODE_GOODDATAIGNORED
    STATUSCODE_BADREQUESTNOTALLOWED
    STATUSCODE_BADREQUESTNOTCOMPLETE
    STATUSCODE_GOODEDITED
    STATUSCODE_GOODPOSTACTIONFAILED
    STATUSCODE_UNCERTAINDOMINANTVALUECHANGED
    STATUSCODE_GOODDEPENDENTVALUECHANGED
    STATUSCODE_BADDOMINANTVALUECHANGED
    STATUSCODE_UNCERTAINDEPENDENTVALUECHANGED
    STATUSCODE_BADDEPENDENTVALUECHANGED
    STATUSCODE_GOODCOMMUNICATIONEVENT
    STATUSCODE_GOODSHUTDOWNEVENT
    STATUSCODE_GOODCALLAGAIN
    STATUSCODE_GOODNONCRITICALTIMEOUT
    STATUSCODE_BADINVALIDARGUMENT
    STATUSCODE_BADCONNECTIONREJECTED
    STATUSCODE_BADDISCONNECT
    STATUSCODE_BADCONNECTIONCLOSED
    STATUSCODE_BADINVALIDSTATE
    STATUSCODE_BADENDOFSTREAM
    STATUSCODE_BADNODATAAVAILABLE
    STATUSCODE_BADWAITINGFORRESPONSE
    STATUSCODE_BADOPERATIONABANDONED
    STATUSCODE_BADEXPECTEDSTREAMTOBLOCK
    STATUSCODE_BADWOULDBLOCK
    STATUSCODE_BADSYNTAXERROR
    STATUSCODE_BADMAXCONNECTIONSREACHED
);

my @nodeidtypes = qw(
    NODEIDTYPE_NUMERIC
    NODEIDTYPE_STRING
    NODEIDTYPE_GUID
    NODEIDTYPE_BYTESTRING
);

my @accesslevelmasks = qw(
    ACCESSLEVELMASK_READ
    ACCESSLEVELMASK_WRITE
    ACCESSLEVELMASK_HISTORYREAD
    ACCESSLEVELMASK_HISTORYWRITE
    ACCESSLEVELMASK_SEMANTICCHANGE
    ACCESSLEVELMASK_STATUSWRITE
    ACCESSLEVELMASK_TIMESTAMPWRITE
);

my @clientstates = qw(
    CLIENTSTATE_DISCONNECTED
    CLIENTSTATE_WAITING_FOR_ACK
    CLIENTSTATE_CONNECTED
    CLIENTSTATE_SECURECHANNEL
    CLIENTSTATE_SESSION
    CLIENTSTATE_SESSION_DISCONNECTED
    CLIENTSTATE_SESSION_RENEWED
);

our %EXPORT_TAGS = (
    'all' => [ @types, @limits, @statuscodes, @nodeidtypes, @accesslevelmasks,
	@clientstates ],
    'accesslevelmask' => [ @accesslevelmasks ],
    'clientstate' => [ @clientstates ],
    'limit' => [ @limits ],
    'nodeidtype' => [ @nodeidtypes ],
    'statuscode' => [ @statuscodes ],
    'type' => [ @types ],
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.003';

require XSLoader;
XSLoader::load('OPCUA::Open62541', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

OPCUA::Open62541 - Perl XS wrapper for open62541 OPC UA library

=head1 SYNOPSIS

  use OPCUA::Open62541;

  my $server = OPCUA::Open62541::Server->new();

  my $client = OPCUA::Open62541::Client->new();

=head1 DESCRIPTION

The open62541 is a library implementing an OPC UA client and server.
This module provides access to the C functionality from Perl programs.

=head2 EXPORT

=over 4

=item :all

Everything of the exports below.

=item :accesslevelmask

    ACCESSLEVELMASK_READ
    ACCESSLEVELMASK_WRITE
    ...
    ACCESSLEVELMASK_TIMESTAMPWRITE

=item :clientstate

    CLIENTSTATE_DISCONNECTED
    CLIENTSTATE_WAITING_FOR_ACK
    ...
    CLIENTSTATE_SESSION_RENEWED

=item :limit

Symbol names of minimum and maximum limits for the OPC UA data
types.

    TRUE
    FALSE
    SBYTE_MIN
    ...
    UINT64_MAX

=item :nodeidtype

Symbolic names for the OPC UA node id types.

    NODEIDTYPE_NUMERIC
    NODEIDTYPE_STRING
    ...
    NODEIDTYPE_BYTESTRING

=item :statuscode

Symbolic names for the OPC UA status codes.

    STATUSCODE_GOOD
    STATUSCODE_INFOTYPE_DATAVALUE
    ...
    STATUSCODE_BADMAXCONNECTIONSREACHED

=item :type

Symbolic names for the OPC UA types.

    TYPES_BOOLEAN
    TYPES_SBYTE
    ...
    TYPES_EVENTNOTIFICATIONLIST

=back

=head2 METHODS

Refer to the open62541 documentation for the semantic of classes
and methods.

=head3 Variant

=over 4

=item $variant = OPCUA::Open62541::Variant->new()

=item $variant->isEmpty()

=item $variant->isScalar()

=item $variant->hasScalarType($data_type)

=item $variant->hasArrayType($data_type)

=item $variant->setScalar($p, $data_type)

=back

=head3 VariableAttributes

This type is converted automatically from a hash.
The key that are recognized are:

=over 4

=item VariableAttributes_value

=back

=head3 Server

=over 4

=item $server = OPCUA::Open62541::Server->new()

=item $server = OPCUA::Open62541::Server->newWithConfig($server_config)

=item $server_config = $server->getConfig()

=item $status_code = $server->run($server, $running)

$running should be TRUE at statup.
When set to FALSE during method invocation, the server stops
magically.

=item $status_code = $server->run_startup($server)

=item $wait_ms = $server->run_iterate($server, $wait_internal)

=item $status_code = $server->run_shutdown($server)

=back

=head3 ServerConfig

=over 4

=item $status_code = $server_config->setDefault()

=item $status_code = $server_config->setMinimal($port, $certificate)

=item $server_config->clean()

=item $server_config->setCustomHostname($custom_hostname)

=back

=head3 Client

=over 4

=item $client = OPCUA::Open62541::Client->new()

=item $client_config = $client->getConfig()

=item $status_code = $client->connect($url)

=item $status_code = $client->connect_async($endpointUrl, $callback, $userdata)

=item $status_code = $client->run_iterate($timeout)

=item $client_state = $client->getState()

=item $status_code = $client->disconnect()

=back

=head3 ClientConfig

=over 4

=item $status_code = $client_config->setDefault()

=back

=head1 SEE ALSO

OPC UA library, L<https://open62541.org/>

OPC Foundation, L<https://opcfoundation.org/>

=head1 AUTHORS

Alexander Bluhm E<lt>bluhm@genua.deE<gt>
Anton Borowka
Marvin Knoblauch E<lt>mknob@genua.deE<gt>

=head1 CAVEATS

This interface is far from complete.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2020 Alexander Bluhm E<lt>bluhm@genua.deE<gt>
Copyright (c) 2020 Anton Borowka
Copyright (c) 2020 Marvin Knoblauch E<lt>mknob@genua.deE<gt>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

Thanks to genua GmbH, https://www.genua.de/ for sponsoring this work.

=cut
