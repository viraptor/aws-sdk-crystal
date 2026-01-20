module AwsSdk
  module LicenseManagerLinuxSubscriptions
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "license-manager-linux-subscriptions"
      ENDPOINT_PREFIX = "license-manager-linux-subscriptions"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-linux-subscriptions-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-linux-subscriptions-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-linux-subscriptions.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-linux-subscriptions.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DEREGISTER_SUBSCRIPTION_PROVIDER = OperationModel.new(
        name: "DeregisterSubscriptionProvider",
        http_method: "POST",
        request_uri: "/subscription/DeregisterSubscriptionProvider"
      )

      GET_REGISTERED_SUBSCRIPTION_PROVIDER = OperationModel.new(
        name: "GetRegisteredSubscriptionProvider",
        http_method: "POST",
        request_uri: "/subscription/GetRegisteredSubscriptionProvider"
      )

      GET_SERVICE_SETTINGS = OperationModel.new(
        name: "GetServiceSettings",
        http_method: "POST",
        request_uri: "/subscription/GetServiceSettings"
      )

      LIST_LINUX_SUBSCRIPTION_INSTANCES = OperationModel.new(
        name: "ListLinuxSubscriptionInstances",
        http_method: "POST",
        request_uri: "/subscription/ListLinuxSubscriptionInstances"
      )

      LIST_LINUX_SUBSCRIPTIONS = OperationModel.new(
        name: "ListLinuxSubscriptions",
        http_method: "POST",
        request_uri: "/subscription/ListLinuxSubscriptions"
      )

      LIST_REGISTERED_SUBSCRIPTION_PROVIDERS = OperationModel.new(
        name: "ListRegisteredSubscriptionProviders",
        http_method: "POST",
        request_uri: "/subscription/ListRegisteredSubscriptionProviders"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REGISTER_SUBSCRIPTION_PROVIDER = OperationModel.new(
        name: "RegisterSubscriptionProvider",
        http_method: "POST",
        request_uri: "/subscription/RegisterSubscriptionProvider"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_SERVICE_SETTINGS = OperationModel.new(
        name: "UpdateServiceSettings",
        http_method: "POST",
        request_uri: "/subscription/UpdateServiceSettings"
      )
    end
  end
end
