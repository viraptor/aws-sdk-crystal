module AwsSdk
  module Mq
    module Model
      API_VERSION = "2017-11-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mq"
      ENDPOINT_PREFIX = "mq"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mq-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mq-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mq.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mq.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BROKER = OperationModel.new(
        name: "CreateBroker",
        http_method: "POST",
        request_uri: "/v1/brokers"
      )

      CREATE_CONFIGURATION = OperationModel.new(
        name: "CreateConfiguration",
        http_method: "POST",
        request_uri: "/v1/configurations"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/v1/tags/{resource-arn}"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/v1/brokers/{broker-id}/users/{username}"
      )

      DELETE_BROKER = OperationModel.new(
        name: "DeleteBroker",
        http_method: "DELETE",
        request_uri: "/v1/brokers/{broker-id}"
      )

      DELETE_CONFIGURATION = OperationModel.new(
        name: "DeleteConfiguration",
        http_method: "DELETE",
        request_uri: "/v1/configurations/{configuration-id}"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resource-arn}"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "DELETE",
        request_uri: "/v1/brokers/{broker-id}/users/{username}"
      )

      DESCRIBE_BROKER = OperationModel.new(
        name: "DescribeBroker",
        http_method: "GET",
        request_uri: "/v1/brokers/{broker-id}"
      )

      DESCRIBE_BROKER_ENGINE_TYPES = OperationModel.new(
        name: "DescribeBrokerEngineTypes",
        http_method: "GET",
        request_uri: "/v1/broker-engine-types"
      )

      DESCRIBE_BROKER_INSTANCE_OPTIONS = OperationModel.new(
        name: "DescribeBrokerInstanceOptions",
        http_method: "GET",
        request_uri: "/v1/broker-instance-options"
      )

      DESCRIBE_CONFIGURATION = OperationModel.new(
        name: "DescribeConfiguration",
        http_method: "GET",
        request_uri: "/v1/configurations/{configuration-id}"
      )

      DESCRIBE_CONFIGURATION_REVISION = OperationModel.new(
        name: "DescribeConfigurationRevision",
        http_method: "GET",
        request_uri: "/v1/configurations/{configuration-id}/revisions/{configuration-revision}"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "GET",
        request_uri: "/v1/brokers/{broker-id}/users/{username}"
      )

      LIST_BROKERS = OperationModel.new(
        name: "ListBrokers",
        http_method: "GET",
        request_uri: "/v1/brokers"
      )

      LIST_CONFIGURATION_REVISIONS = OperationModel.new(
        name: "ListConfigurationRevisions",
        http_method: "GET",
        request_uri: "/v1/configurations/{configuration-id}/revisions"
      )

      LIST_CONFIGURATIONS = OperationModel.new(
        name: "ListConfigurations",
        http_method: "GET",
        request_uri: "/v1/configurations"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "GET",
        request_uri: "/v1/tags/{resource-arn}"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/v1/brokers/{broker-id}/users"
      )

      PROMOTE = OperationModel.new(
        name: "Promote",
        http_method: "POST",
        request_uri: "/v1/brokers/{broker-id}/promote"
      )

      REBOOT_BROKER = OperationModel.new(
        name: "RebootBroker",
        http_method: "POST",
        request_uri: "/v1/brokers/{broker-id}/reboot"
      )

      UPDATE_BROKER = OperationModel.new(
        name: "UpdateBroker",
        http_method: "PUT",
        request_uri: "/v1/brokers/{broker-id}"
      )

      UPDATE_CONFIGURATION = OperationModel.new(
        name: "UpdateConfiguration",
        http_method: "PUT",
        request_uri: "/v1/configurations/{configuration-id}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PUT",
        request_uri: "/v1/brokers/{broker-id}/users/{username}"
      )
    end
  end
end
