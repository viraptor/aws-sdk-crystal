module Aws
  module Schemas
    module Model
      API_VERSION = "2019-12-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "schemas"
      ENDPOINT_PREFIX = "schemas"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://schemas-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://schemas-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://schemas.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://schemas.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_DISCOVERER = OperationModel.new(
        name: "CreateDiscoverer",
        http_method: "POST",
        request_uri: "/v1/discoverers"
      )

      CREATE_REGISTRY = OperationModel.new(
        name: "CreateRegistry",
        http_method: "POST",
        request_uri: "/v1/registries/name/{registryName}"
      )

      CREATE_SCHEMA = OperationModel.new(
        name: "CreateSchema",
        http_method: "POST",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}"
      )

      DELETE_DISCOVERER = OperationModel.new(
        name: "DeleteDiscoverer",
        http_method: "DELETE",
        request_uri: "/v1/discoverers/id/{discovererId}"
      )

      DELETE_REGISTRY = OperationModel.new(
        name: "DeleteRegistry",
        http_method: "DELETE",
        request_uri: "/v1/registries/name/{registryName}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/v1/policy"
      )

      DELETE_SCHEMA = OperationModel.new(
        name: "DeleteSchema",
        http_method: "DELETE",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}"
      )

      DELETE_SCHEMA_VERSION = OperationModel.new(
        name: "DeleteSchemaVersion",
        http_method: "DELETE",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/version/{schemaVersion}"
      )

      DESCRIBE_CODE_BINDING = OperationModel.new(
        name: "DescribeCodeBinding",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}"
      )

      DESCRIBE_DISCOVERER = OperationModel.new(
        name: "DescribeDiscoverer",
        http_method: "GET",
        request_uri: "/v1/discoverers/id/{discovererId}"
      )

      DESCRIBE_REGISTRY = OperationModel.new(
        name: "DescribeRegistry",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}"
      )

      DESCRIBE_SCHEMA = OperationModel.new(
        name: "DescribeSchema",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}"
      )

      EXPORT_SCHEMA = OperationModel.new(
        name: "ExportSchema",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/export"
      )

      GET_CODE_BINDING_SOURCE = OperationModel.new(
        name: "GetCodeBindingSource",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}/source"
      )

      GET_DISCOVERED_SCHEMA = OperationModel.new(
        name: "GetDiscoveredSchema",
        http_method: "POST",
        request_uri: "/v1/discover"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/v1/policy"
      )

      LIST_DISCOVERERS = OperationModel.new(
        name: "ListDiscoverers",
        http_method: "GET",
        request_uri: "/v1/discoverers"
      )

      LIST_REGISTRIES = OperationModel.new(
        name: "ListRegistries",
        http_method: "GET",
        request_uri: "/v1/registries"
      )

      LIST_SCHEMA_VERSIONS = OperationModel.new(
        name: "ListSchemaVersions",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/versions"
      )

      LIST_SCHEMAS = OperationModel.new(
        name: "ListSchemas",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resource-arn}"
      )

      PUT_CODE_BINDING = OperationModel.new(
        name: "PutCodeBinding",
        http_method: "POST",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/v1/policy"
      )

      SEARCH_SCHEMAS = OperationModel.new(
        name: "SearchSchemas",
        http_method: "GET",
        request_uri: "/v1/registries/name/{registryName}/schemas/search"
      )

      START_DISCOVERER = OperationModel.new(
        name: "StartDiscoverer",
        http_method: "POST",
        request_uri: "/v1/discoverers/id/{discovererId}/start"
      )

      STOP_DISCOVERER = OperationModel.new(
        name: "StopDiscoverer",
        http_method: "POST",
        request_uri: "/v1/discoverers/id/{discovererId}/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource-arn}"
      )

      UPDATE_DISCOVERER = OperationModel.new(
        name: "UpdateDiscoverer",
        http_method: "PUT",
        request_uri: "/v1/discoverers/id/{discovererId}"
      )

      UPDATE_REGISTRY = OperationModel.new(
        name: "UpdateRegistry",
        http_method: "PUT",
        request_uri: "/v1/registries/name/{registryName}"
      )

      UPDATE_SCHEMA = OperationModel.new(
        name: "UpdateSchema",
        http_method: "PUT",
        request_uri: "/v1/registries/name/{registryName}/schemas/name/{schemaName}"
      )
    end
  end
end
