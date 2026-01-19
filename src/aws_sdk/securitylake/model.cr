module AwsSdk
  module SecurityLake
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "securitylake"
      ENDPOINT_PREFIX = "securitylake"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://securitylake-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://securitylake-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://securitylake.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://securitylake.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_AWS_LOG_SOURCE = OperationModel.new(
        name: "CreateAwsLogSource",
        http_method: "POST",
        request_uri: "/v1/datalake/logsources/aws"
      )

      CREATE_CUSTOM_LOG_SOURCE = OperationModel.new(
        name: "CreateCustomLogSource",
        http_method: "POST",
        request_uri: "/v1/datalake/logsources/custom"
      )

      CREATE_DATA_LAKE = OperationModel.new(
        name: "CreateDataLake",
        http_method: "POST",
        request_uri: "/v1/datalake"
      )

      CREATE_DATA_LAKE_EXCEPTION_SUBSCRIPTION = OperationModel.new(
        name: "CreateDataLakeExceptionSubscription",
        http_method: "POST",
        request_uri: "/v1/datalake/exceptions/subscription"
      )

      CREATE_DATA_LAKE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "CreateDataLakeOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/v1/datalake/organization/configuration"
      )

      CREATE_SUBSCRIBER = OperationModel.new(
        name: "CreateSubscriber",
        http_method: "POST",
        request_uri: "/v1/subscribers"
      )

      CREATE_SUBSCRIBER_NOTIFICATION = OperationModel.new(
        name: "CreateSubscriberNotification",
        http_method: "POST",
        request_uri: "/v1/subscribers/{subscriberId}/notification"
      )

      DELETE_AWS_LOG_SOURCE = OperationModel.new(
        name: "DeleteAwsLogSource",
        http_method: "POST",
        request_uri: "/v1/datalake/logsources/aws/delete"
      )

      DELETE_CUSTOM_LOG_SOURCE = OperationModel.new(
        name: "DeleteCustomLogSource",
        http_method: "DELETE",
        request_uri: "/v1/datalake/logsources/custom/{sourceName}"
      )

      DELETE_DATA_LAKE = OperationModel.new(
        name: "DeleteDataLake",
        http_method: "POST",
        request_uri: "/v1/datalake/delete"
      )

      DELETE_DATA_LAKE_EXCEPTION_SUBSCRIPTION = OperationModel.new(
        name: "DeleteDataLakeExceptionSubscription",
        http_method: "DELETE",
        request_uri: "/v1/datalake/exceptions/subscription"
      )

      DELETE_DATA_LAKE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DeleteDataLakeOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/v1/datalake/organization/configuration/delete"
      )

      DELETE_SUBSCRIBER = OperationModel.new(
        name: "DeleteSubscriber",
        http_method: "DELETE",
        request_uri: "/v1/subscribers/{subscriberId}"
      )

      DELETE_SUBSCRIBER_NOTIFICATION = OperationModel.new(
        name: "DeleteSubscriberNotification",
        http_method: "DELETE",
        request_uri: "/v1/subscribers/{subscriberId}/notification"
      )

      DEREGISTER_DATA_LAKE_DELEGATED_ADMINISTRATOR = OperationModel.new(
        name: "DeregisterDataLakeDelegatedAdministrator",
        http_method: "DELETE",
        request_uri: "/v1/datalake/delegate"
      )

      GET_DATA_LAKE_EXCEPTION_SUBSCRIPTION = OperationModel.new(
        name: "GetDataLakeExceptionSubscription",
        http_method: "GET",
        request_uri: "/v1/datalake/exceptions/subscription"
      )

      GET_DATA_LAKE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "GetDataLakeOrganizationConfiguration",
        http_method: "GET",
        request_uri: "/v1/datalake/organization/configuration"
      )

      GET_DATA_LAKE_SOURCES = OperationModel.new(
        name: "GetDataLakeSources",
        http_method: "POST",
        request_uri: "/v1/datalake/sources"
      )

      GET_SUBSCRIBER = OperationModel.new(
        name: "GetSubscriber",
        http_method: "GET",
        request_uri: "/v1/subscribers/{subscriberId}"
      )

      LIST_DATA_LAKE_EXCEPTIONS = OperationModel.new(
        name: "ListDataLakeExceptions",
        http_method: "POST",
        request_uri: "/v1/datalake/exceptions"
      )

      LIST_DATA_LAKES = OperationModel.new(
        name: "ListDataLakes",
        http_method: "GET",
        request_uri: "/v1/datalakes"
      )

      LIST_LOG_SOURCES = OperationModel.new(
        name: "ListLogSources",
        http_method: "POST",
        request_uri: "/v1/datalake/logsources/list"
      )

      LIST_SUBSCRIBERS = OperationModel.new(
        name: "ListSubscribers",
        http_method: "GET",
        request_uri: "/v1/subscribers"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      REGISTER_DATA_LAKE_DELEGATED_ADMINISTRATOR = OperationModel.new(
        name: "RegisterDataLakeDelegatedAdministrator",
        http_method: "POST",
        request_uri: "/v1/datalake/delegate"
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

      UPDATE_DATA_LAKE = OperationModel.new(
        name: "UpdateDataLake",
        http_method: "PUT",
        request_uri: "/v1/datalake"
      )

      UPDATE_DATA_LAKE_EXCEPTION_SUBSCRIPTION = OperationModel.new(
        name: "UpdateDataLakeExceptionSubscription",
        http_method: "PUT",
        request_uri: "/v1/datalake/exceptions/subscription"
      )

      UPDATE_SUBSCRIBER = OperationModel.new(
        name: "UpdateSubscriber",
        http_method: "PUT",
        request_uri: "/v1/subscribers/{subscriberId}"
      )

      UPDATE_SUBSCRIBER_NOTIFICATION = OperationModel.new(
        name: "UpdateSubscriberNotification",
        http_method: "PUT",
        request_uri: "/v1/subscribers/{subscriberId}/notification"
      )
    end
  end
end
