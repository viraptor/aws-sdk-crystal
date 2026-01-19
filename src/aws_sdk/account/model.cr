module AwsSdk
  module Account
    module Model
      API_VERSION = "2021-02-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "account"
      ENDPOINT_PREFIX = "account"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://account-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://account-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://account.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://account.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_PRIMARY_EMAIL_UPDATE = OperationModel.new(
        name: "AcceptPrimaryEmailUpdate",
        http_method: "POST",
        request_uri: "/acceptPrimaryEmailUpdate"
      )

      DELETE_ALTERNATE_CONTACT = OperationModel.new(
        name: "DeleteAlternateContact",
        http_method: "POST",
        request_uri: "/deleteAlternateContact"
      )

      DISABLE_REGION = OperationModel.new(
        name: "DisableRegion",
        http_method: "POST",
        request_uri: "/disableRegion"
      )

      ENABLE_REGION = OperationModel.new(
        name: "EnableRegion",
        http_method: "POST",
        request_uri: "/enableRegion"
      )

      GET_ACCOUNT_INFORMATION = OperationModel.new(
        name: "GetAccountInformation",
        http_method: "POST",
        request_uri: "/getAccountInformation"
      )

      GET_ALTERNATE_CONTACT = OperationModel.new(
        name: "GetAlternateContact",
        http_method: "POST",
        request_uri: "/getAlternateContact"
      )

      GET_CONTACT_INFORMATION = OperationModel.new(
        name: "GetContactInformation",
        http_method: "POST",
        request_uri: "/getContactInformation"
      )

      GET_GOV_CLOUD_ACCOUNT_INFORMATION = OperationModel.new(
        name: "GetGovCloudAccountInformation",
        http_method: "POST",
        request_uri: "/getGovCloudAccountInformation"
      )

      GET_PRIMARY_EMAIL = OperationModel.new(
        name: "GetPrimaryEmail",
        http_method: "POST",
        request_uri: "/getPrimaryEmail"
      )

      GET_REGION_OPT_STATUS = OperationModel.new(
        name: "GetRegionOptStatus",
        http_method: "POST",
        request_uri: "/getRegionOptStatus"
      )

      LIST_REGIONS = OperationModel.new(
        name: "ListRegions",
        http_method: "POST",
        request_uri: "/listRegions"
      )

      PUT_ACCOUNT_NAME = OperationModel.new(
        name: "PutAccountName",
        http_method: "POST",
        request_uri: "/putAccountName"
      )

      PUT_ALTERNATE_CONTACT = OperationModel.new(
        name: "PutAlternateContact",
        http_method: "POST",
        request_uri: "/putAlternateContact"
      )

      PUT_CONTACT_INFORMATION = OperationModel.new(
        name: "PutContactInformation",
        http_method: "POST",
        request_uri: "/putContactInformation"
      )

      START_PRIMARY_EMAIL_UPDATE = OperationModel.new(
        name: "StartPrimaryEmailUpdate",
        http_method: "POST",
        request_uri: "/startPrimaryEmailUpdate"
      )
    end
  end
end
