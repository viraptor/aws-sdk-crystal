module AwsSdk
  module AppSync
    module Model
      API_VERSION = "2017-07-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "appsync"
      ENDPOINT_PREFIX = "appsync"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appsync-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appsync-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appsync.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://appsync.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_API = OperationModel.new(
        name: "AssociateApi",
        http_method: "POST",
        request_uri: "/v1/domainnames/{domainName}/apiassociation"
      )

      ASSOCIATE_MERGED_GRAPHQL_API = OperationModel.new(
        name: "AssociateMergedGraphqlApi",
        http_method: "POST",
        request_uri: "/v1/sourceApis/{sourceApiIdentifier}/mergedApiAssociations"
      )

      ASSOCIATE_SOURCE_GRAPHQL_API = OperationModel.new(
        name: "AssociateSourceGraphqlApi",
        http_method: "POST",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations"
      )

      CREATE_API = OperationModel.new(
        name: "CreateApi",
        http_method: "POST",
        request_uri: "/v2/apis"
      )

      CREATE_API_CACHE = OperationModel.new(
        name: "CreateApiCache",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/ApiCaches"
      )

      CREATE_API_KEY = OperationModel.new(
        name: "CreateApiKey",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/apikeys"
      )

      CREATE_CHANNEL_NAMESPACE = OperationModel.new(
        name: "CreateChannelNamespace",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/channelNamespaces"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/datasources"
      )

      CREATE_DOMAIN_NAME = OperationModel.new(
        name: "CreateDomainName",
        http_method: "POST",
        request_uri: "/v1/domainnames"
      )

      CREATE_FUNCTION = OperationModel.new(
        name: "CreateFunction",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/functions"
      )

      CREATE_GRAPHQL_API = OperationModel.new(
        name: "CreateGraphqlApi",
        http_method: "POST",
        request_uri: "/v1/apis"
      )

      CREATE_RESOLVER = OperationModel.new(
        name: "CreateResolver",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/types/{typeName}/resolvers"
      )

      CREATE_TYPE = OperationModel.new(
        name: "CreateType",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/types"
      )

      DELETE_API = OperationModel.new(
        name: "DeleteApi",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}"
      )

      DELETE_API_CACHE = OperationModel.new(
        name: "DeleteApiCache",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/ApiCaches"
      )

      DELETE_API_KEY = OperationModel.new(
        name: "DeleteApiKey",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/apikeys/{id}"
      )

      DELETE_CHANNEL_NAMESPACE = OperationModel.new(
        name: "DeleteChannelNamespace",
        http_method: "DELETE",
        request_uri: "/v2/apis/{apiId}/channelNamespaces/{name}"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/datasources/{name}"
      )

      DELETE_DOMAIN_NAME = OperationModel.new(
        name: "DeleteDomainName",
        http_method: "DELETE",
        request_uri: "/v1/domainnames/{domainName}"
      )

      DELETE_FUNCTION = OperationModel.new(
        name: "DeleteFunction",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/functions/{functionId}"
      )

      DELETE_GRAPHQL_API = OperationModel.new(
        name: "DeleteGraphqlApi",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}"
      )

      DELETE_RESOLVER = OperationModel.new(
        name: "DeleteResolver",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/types/{typeName}/resolvers/{fieldName}"
      )

      DELETE_TYPE = OperationModel.new(
        name: "DeleteType",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/types/{typeName}"
      )

      DISASSOCIATE_API = OperationModel.new(
        name: "DisassociateApi",
        http_method: "DELETE",
        request_uri: "/v1/domainnames/{domainName}/apiassociation"
      )

      DISASSOCIATE_MERGED_GRAPHQL_API = OperationModel.new(
        name: "DisassociateMergedGraphqlApi",
        http_method: "DELETE",
        request_uri: "/v1/sourceApis/{sourceApiIdentifier}/mergedApiAssociations/{associationId}"
      )

      DISASSOCIATE_SOURCE_GRAPHQL_API = OperationModel.new(
        name: "DisassociateSourceGraphqlApi",
        http_method: "DELETE",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations/{associationId}"
      )

      EVALUATE_CODE = OperationModel.new(
        name: "EvaluateCode",
        http_method: "POST",
        request_uri: "/v1/dataplane-evaluatecode"
      )

      EVALUATE_MAPPING_TEMPLATE = OperationModel.new(
        name: "EvaluateMappingTemplate",
        http_method: "POST",
        request_uri: "/v1/dataplane-evaluatetemplate"
      )

      FLUSH_API_CACHE = OperationModel.new(
        name: "FlushApiCache",
        http_method: "DELETE",
        request_uri: "/v1/apis/{apiId}/FlushCache"
      )

      GET_API = OperationModel.new(
        name: "GetApi",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}"
      )

      GET_API_ASSOCIATION = OperationModel.new(
        name: "GetApiAssociation",
        http_method: "GET",
        request_uri: "/v1/domainnames/{domainName}/apiassociation"
      )

      GET_API_CACHE = OperationModel.new(
        name: "GetApiCache",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/ApiCaches"
      )

      GET_CHANNEL_NAMESPACE = OperationModel.new(
        name: "GetChannelNamespace",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/channelNamespaces/{name}"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/datasources/{name}"
      )

      GET_DATA_SOURCE_INTROSPECTION = OperationModel.new(
        name: "GetDataSourceIntrospection",
        http_method: "GET",
        request_uri: "/v1/datasources/introspections/{introspectionId}"
      )

      GET_DOMAIN_NAME = OperationModel.new(
        name: "GetDomainName",
        http_method: "GET",
        request_uri: "/v1/domainnames/{domainName}"
      )

      GET_FUNCTION = OperationModel.new(
        name: "GetFunction",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/functions/{functionId}"
      )

      GET_GRAPHQL_API = OperationModel.new(
        name: "GetGraphqlApi",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}"
      )

      GET_GRAPHQL_API_ENVIRONMENT_VARIABLES = OperationModel.new(
        name: "GetGraphqlApiEnvironmentVariables",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/environmentVariables"
      )

      GET_INTROSPECTION_SCHEMA = OperationModel.new(
        name: "GetIntrospectionSchema",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/schema"
      )

      GET_RESOLVER = OperationModel.new(
        name: "GetResolver",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/types/{typeName}/resolvers/{fieldName}"
      )

      GET_SCHEMA_CREATION_STATUS = OperationModel.new(
        name: "GetSchemaCreationStatus",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/schemacreation"
      )

      GET_SOURCE_API_ASSOCIATION = OperationModel.new(
        name: "GetSourceApiAssociation",
        http_method: "GET",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations/{associationId}"
      )

      GET_TYPE = OperationModel.new(
        name: "GetType",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/types/{typeName}"
      )

      LIST_API_KEYS = OperationModel.new(
        name: "ListApiKeys",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/apikeys"
      )

      LIST_APIS = OperationModel.new(
        name: "ListApis",
        http_method: "GET",
        request_uri: "/v2/apis"
      )

      LIST_CHANNEL_NAMESPACES = OperationModel.new(
        name: "ListChannelNamespaces",
        http_method: "GET",
        request_uri: "/v2/apis/{apiId}/channelNamespaces"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/datasources"
      )

      LIST_DOMAIN_NAMES = OperationModel.new(
        name: "ListDomainNames",
        http_method: "GET",
        request_uri: "/v1/domainnames"
      )

      LIST_FUNCTIONS = OperationModel.new(
        name: "ListFunctions",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/functions"
      )

      LIST_GRAPHQL_APIS = OperationModel.new(
        name: "ListGraphqlApis",
        http_method: "GET",
        request_uri: "/v1/apis"
      )

      LIST_RESOLVERS = OperationModel.new(
        name: "ListResolvers",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/types/{typeName}/resolvers"
      )

      LIST_RESOLVERS_BY_FUNCTION = OperationModel.new(
        name: "ListResolversByFunction",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/functions/{functionId}/resolvers"
      )

      LIST_SOURCE_API_ASSOCIATIONS = OperationModel.new(
        name: "ListSourceApiAssociations",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/sourceApiAssociations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      LIST_TYPES = OperationModel.new(
        name: "ListTypes",
        http_method: "GET",
        request_uri: "/v1/apis/{apiId}/types"
      )

      LIST_TYPES_BY_ASSOCIATION = OperationModel.new(
        name: "ListTypesByAssociation",
        http_method: "GET",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations/{associationId}/types"
      )

      PUT_GRAPHQL_API_ENVIRONMENT_VARIABLES = OperationModel.new(
        name: "PutGraphqlApiEnvironmentVariables",
        http_method: "PUT",
        request_uri: "/v1/apis/{apiId}/environmentVariables"
      )

      START_DATA_SOURCE_INTROSPECTION = OperationModel.new(
        name: "StartDataSourceIntrospection",
        http_method: "POST",
        request_uri: "/v1/datasources/introspections"
      )

      START_SCHEMA_CREATION = OperationModel.new(
        name: "StartSchemaCreation",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/schemacreation"
      )

      START_SCHEMA_MERGE = OperationModel.new(
        name: "StartSchemaMerge",
        http_method: "POST",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations/{associationId}/merge"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UPDATE_API = OperationModel.new(
        name: "UpdateApi",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}"
      )

      UPDATE_API_CACHE = OperationModel.new(
        name: "UpdateApiCache",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/ApiCaches/update"
      )

      UPDATE_API_KEY = OperationModel.new(
        name: "UpdateApiKey",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/apikeys/{id}"
      )

      UPDATE_CHANNEL_NAMESPACE = OperationModel.new(
        name: "UpdateChannelNamespace",
        http_method: "POST",
        request_uri: "/v2/apis/{apiId}/channelNamespaces/{name}"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/datasources/{name}"
      )

      UPDATE_DOMAIN_NAME = OperationModel.new(
        name: "UpdateDomainName",
        http_method: "POST",
        request_uri: "/v1/domainnames/{domainName}"
      )

      UPDATE_FUNCTION = OperationModel.new(
        name: "UpdateFunction",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/functions/{functionId}"
      )

      UPDATE_GRAPHQL_API = OperationModel.new(
        name: "UpdateGraphqlApi",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}"
      )

      UPDATE_RESOLVER = OperationModel.new(
        name: "UpdateResolver",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/types/{typeName}/resolvers/{fieldName}"
      )

      UPDATE_SOURCE_API_ASSOCIATION = OperationModel.new(
        name: "UpdateSourceApiAssociation",
        http_method: "POST",
        request_uri: "/v1/mergedApis/{mergedApiIdentifier}/sourceApiAssociations/{associationId}"
      )

      UPDATE_TYPE = OperationModel.new(
        name: "UpdateType",
        http_method: "POST",
        request_uri: "/v1/apis/{apiId}/types/{typeName}"
      )
    end
  end
end
