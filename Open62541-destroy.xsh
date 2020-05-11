MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::UInt32	PREFIX = UA_UInt32_

void
UA_UInt32_DESTROY(uInt32)
	OPCUA_Open62541_UInt32	uInt32
    CODE:
	DPRINTF("uInt32 %p", uInt32);
	UA_UInt32_delete(uInt32);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::String	PREFIX = UA_String_

void
UA_String_DESTROY(string)
	OPCUA_Open62541_String	string
    CODE:
	DPRINTF("string %p", string);
	UA_String_delete(string);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ByteString	PREFIX = UA_ByteString_

void
UA_ByteString_DESTROY(byteString)
	OPCUA_Open62541_ByteString	byteString
    CODE:
	DPRINTF("byteString %p", byteString);
	UA_ByteString_delete(byteString);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::BrowseDescription	PREFIX = UA_BrowseDescription_

void
UA_BrowseDescription_DESTROY(browseDescription)
	OPCUA_Open62541_BrowseDescription	browseDescription
    CODE:
	DPRINTF("browseDescription %p", browseDescription);
	UA_BrowseDescription_delete(browseDescription);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::BrowseNextRequest	PREFIX = UA_BrowseNextRequest_

void
UA_BrowseNextRequest_DESTROY(browseNextRequest)
	OPCUA_Open62541_BrowseNextRequest	browseNextRequest
    CODE:
	DPRINTF("browseNextRequest %p", browseNextRequest);
	UA_BrowseNextRequest_delete(browseNextRequest);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::BrowseRequest	PREFIX = UA_BrowseRequest_

void
UA_BrowseRequest_DESTROY(browseRequest)
	OPCUA_Open62541_BrowseRequest	browseRequest
    CODE:
	DPRINTF("browseRequest %p", browseRequest);
	UA_BrowseRequest_delete(browseRequest);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::NodeId	PREFIX = UA_NodeId_

void
UA_NodeId_DESTROY(nodeId)
	OPCUA_Open62541_NodeId	nodeId
    CODE:
	DPRINTF("nodeId %p", nodeId);
	UA_NodeId_delete(nodeId);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ExpandedNodeId	PREFIX = UA_ExpandedNodeId_

void
UA_ExpandedNodeId_DESTROY(expandedNodeId)
	OPCUA_Open62541_ExpandedNodeId	expandedNodeId
    CODE:
	DPRINTF("expandedNodeId %p", expandedNodeId);
	UA_ExpandedNodeId_delete(expandedNodeId);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::LocalizedText	PREFIX = UA_LocalizedText_

void
UA_LocalizedText_DESTROY(localizedText)
	OPCUA_Open62541_LocalizedText	localizedText
    CODE:
	DPRINTF("localizedText %p", localizedText);
	UA_LocalizedText_delete(localizedText);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::QualifiedName	PREFIX = UA_QualifiedName_

void
UA_QualifiedName_DESTROY(qualifiedName)
	OPCUA_Open62541_QualifiedName	qualifiedName
    CODE:
	DPRINTF("qualifiedName %p", qualifiedName);
	UA_QualifiedName_delete(qualifiedName);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::Variant	PREFIX = UA_Variant_

void
UA_Variant_DESTROY(variant)
	OPCUA_Open62541_Variant	variant
    CODE:
	DPRINTF("variant %p", variant);
	UA_Variant_delete(variant);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::DataTypeAttributes	PREFIX = UA_DataTypeAttributes_

void
UA_DataTypeAttributes_DESTROY(dataTypeAttributes)
	OPCUA_Open62541_DataTypeAttributes	dataTypeAttributes
    CODE:
	DPRINTF("dataTypeAttributes %p", dataTypeAttributes);
	UA_DataTypeAttributes_delete(dataTypeAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ObjectAttributes	PREFIX = UA_ObjectAttributes_

void
UA_ObjectAttributes_DESTROY(objectAttributes)
	OPCUA_Open62541_ObjectAttributes	objectAttributes
    CODE:
	DPRINTF("objectAttributes %p", objectAttributes);
	UA_ObjectAttributes_delete(objectAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ObjectTypeAttributes	PREFIX = UA_ObjectTypeAttributes_

void
UA_ObjectTypeAttributes_DESTROY(objectTypeAttributes)
	OPCUA_Open62541_ObjectTypeAttributes	objectTypeAttributes
    CODE:
	DPRINTF("objectTypeAttributes %p", objectTypeAttributes);
	UA_ObjectTypeAttributes_delete(objectTypeAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ReferenceTypeAttributes	PREFIX = UA_ReferenceTypeAttributes_

void
UA_ReferenceTypeAttributes_DESTROY(referenceTypeAttributes)
	OPCUA_Open62541_ReferenceTypeAttributes	referenceTypeAttributes
    CODE:
	DPRINTF("referenceTypeAttributes %p", referenceTypeAttributes);
	UA_ReferenceTypeAttributes_delete(referenceTypeAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::VariableAttributes	PREFIX = UA_VariableAttributes_

void
UA_VariableAttributes_DESTROY(variableAttributes)
	OPCUA_Open62541_VariableAttributes	variableAttributes
    CODE:
	DPRINTF("variableAttributes %p", variableAttributes);
	UA_VariableAttributes_delete(variableAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::VariableTypeAttributes	PREFIX = UA_VariableTypeAttributes_

void
UA_VariableTypeAttributes_DESTROY(variableTypeAttributes)
	OPCUA_Open62541_VariableTypeAttributes	variableTypeAttributes
    CODE:
	DPRINTF("variableTypeAttributes %p", variableTypeAttributes);
	UA_VariableTypeAttributes_delete(variableTypeAttributes);

MODULE = OPCUA::Open62541	PACKAGE = OPCUA::Open62541::ViewAttributes	PREFIX = UA_ViewAttributes_

void
UA_ViewAttributes_DESTROY(viewAttributes)
	OPCUA_Open62541_ViewAttributes	viewAttributes
    CODE:
	DPRINTF("viewAttributes %p", viewAttributes);
	UA_ViewAttributes_delete(viewAttributes);

