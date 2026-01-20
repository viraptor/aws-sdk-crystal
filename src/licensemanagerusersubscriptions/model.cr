module Aws
  module LicenseManagerUserSubscriptions
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "license-manager-user-subscriptions"
      ENDPOINT_PREFIX = "license-manager-user-subscriptions"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-user-subscriptions-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-user-subscriptions-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-user-subscriptions.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://license-manager-user-subscriptions.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_USER = OperationModel.new(
        name: "AssociateUser",
        http_method: "POST",
        request_uri: "/user/AssociateUser"
      )

      CREATE_LICENSE_SERVER_ENDPOINT = OperationModel.new(
        name: "CreateLicenseServerEndpoint",
        http_method: "POST",
        request_uri: "/license-server/CreateLicenseServerEndpoint"
      )

      DELETE_LICENSE_SERVER_ENDPOINT = OperationModel.new(
        name: "DeleteLicenseServerEndpoint",
        http_method: "POST",
        request_uri: "/license-server/DeleteLicenseServerEndpoint"
      )

      DEREGISTER_IDENTITY_PROVIDER = OperationModel.new(
        name: "DeregisterIdentityProvider",
        http_method: "POST",
        request_uri: "/identity-provider/DeregisterIdentityProvider"
      )

      DISASSOCIATE_USER = OperationModel.new(
        name: "DisassociateUser",
        http_method: "POST",
        request_uri: "/user/DisassociateUser"
      )

      LIST_IDENTITY_PROVIDERS = OperationModel.new(
        name: "ListIdentityProviders",
        http_method: "POST",
        request_uri: "/identity-provider/ListIdentityProviders"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "POST",
        request_uri: "/instance/ListInstances"
      )

      LIST_LICENSE_SERVER_ENDPOINTS = OperationModel.new(
        name: "ListLicenseServerEndpoints",
        http_method: "POST",
        request_uri: "/license-server/ListLicenseServerEndpoints"
      )

      LIST_PRODUCT_SUBSCRIPTIONS = OperationModel.new(
        name: "ListProductSubscriptions",
        http_method: "POST",
        request_uri: "/user/ListProductSubscriptions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      LIST_USER_ASSOCIATIONS = OperationModel.new(
        name: "ListUserAssociations",
        http_method: "POST",
        request_uri: "/user/ListUserAssociations"
      )

      REGISTER_IDENTITY_PROVIDER = OperationModel.new(
        name: "RegisterIdentityProvider",
        http_method: "POST",
        request_uri: "/identity-provider/RegisterIdentityProvider"
      )

      START_PRODUCT_SUBSCRIPTION = OperationModel.new(
        name: "StartProductSubscription",
        http_method: "POST",
        request_uri: "/user/StartProductSubscription"
      )

      STOP_PRODUCT_SUBSCRIPTION = OperationModel.new(
        name: "StopProductSubscription",
        http_method: "POST",
        request_uri: "/user/StopProductSubscription"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_IDENTITY_PROVIDER_SETTINGS = OperationModel.new(
        name: "UpdateIdentityProviderSettings",
        http_method: "POST",
        request_uri: "/identity-provider/UpdateIdentityProviderSettings"
      )
    end
  end
end
