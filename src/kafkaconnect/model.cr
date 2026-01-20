module Aws
  module KafkaConnect
    module Model
      API_VERSION = "2021-09-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "kafkaconnect"
      ENDPOINT_PREFIX = "kafkaconnect"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://kafkaconnect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://kafkaconnect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kafkaconnect-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kafkaconnect-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kafkaconnect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kafkaconnect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CONNECTOR = OperationModel.new(
        name: "CreateConnector",
        http_method: "POST",
        request_uri: "/v1/connectors"
      )

      CREATE_CUSTOM_PLUGIN = OperationModel.new(
        name: "CreateCustomPlugin",
        http_method: "POST",
        request_uri: "/v1/custom-plugins"
      )

      CREATE_WORKER_CONFIGURATION = OperationModel.new(
        name: "CreateWorkerConfiguration",
        http_method: "POST",
        request_uri: "/v1/worker-configurations"
      )

      DELETE_CONNECTOR = OperationModel.new(
        name: "DeleteConnector",
        http_method: "DELETE",
        request_uri: "/v1/connectors/{connectorArn}"
      )

      DELETE_CUSTOM_PLUGIN = OperationModel.new(
        name: "DeleteCustomPlugin",
        http_method: "DELETE",
        request_uri: "/v1/custom-plugins/{customPluginArn}"
      )

      DELETE_WORKER_CONFIGURATION = OperationModel.new(
        name: "DeleteWorkerConfiguration",
        http_method: "DELETE",
        request_uri: "/v1/worker-configurations/{workerConfigurationArn}"
      )

      DESCRIBE_CONNECTOR = OperationModel.new(
        name: "DescribeConnector",
        http_method: "GET",
        request_uri: "/v1/connectors/{connectorArn}"
      )

      DESCRIBE_CONNECTOR_OPERATION = OperationModel.new(
        name: "DescribeConnectorOperation",
        http_method: "GET",
        request_uri: "/v1/connectorOperations/{connectorOperationArn}"
      )

      DESCRIBE_CUSTOM_PLUGIN = OperationModel.new(
        name: "DescribeCustomPlugin",
        http_method: "GET",
        request_uri: "/v1/custom-plugins/{customPluginArn}"
      )

      DESCRIBE_WORKER_CONFIGURATION = OperationModel.new(
        name: "DescribeWorkerConfiguration",
        http_method: "GET",
        request_uri: "/v1/worker-configurations/{workerConfigurationArn}"
      )

      LIST_CONNECTOR_OPERATIONS = OperationModel.new(
        name: "ListConnectorOperations",
        http_method: "GET",
        request_uri: "/v1/connectors/{connectorArn}/operations"
      )

      LIST_CONNECTORS = OperationModel.new(
        name: "ListConnectors",
        http_method: "GET",
        request_uri: "/v1/connectors"
      )

      LIST_CUSTOM_PLUGINS = OperationModel.new(
        name: "ListCustomPlugins",
        http_method: "GET",
        request_uri: "/v1/custom-plugins"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      LIST_WORKER_CONFIGURATIONS = OperationModel.new(
        name: "ListWorkerConfigurations",
        http_method: "GET",
        request_uri: "/v1/worker-configurations"
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

      UPDATE_CONNECTOR = OperationModel.new(
        name: "UpdateConnector",
        http_method: "PUT",
        request_uri: "/v1/connectors/{connectorArn}"
      )
    end
  end
end
