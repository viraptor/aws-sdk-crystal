module Aws
  module LicenseManager
    module Model
      API_VERSION = "2018-08-01"
      TARGET_PREFIX = "AWSLicenseManager"
      SIGNING_NAME = "license-manager"
      ENDPOINT_PREFIX = "license-manager"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://license-manager.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://license-manager.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_GRANT = OperationModel.new(
        name: "AcceptGrant",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_IN_LICENSE = OperationModel.new(
        name: "CheckInLicense",
        http_method: "POST",
        request_uri: "/"
      )

      CHECKOUT_BORROW_LICENSE = OperationModel.new(
        name: "CheckoutBorrowLicense",
        http_method: "POST",
        request_uri: "/"
      )

      CHECKOUT_LICENSE = OperationModel.new(
        name: "CheckoutLicense",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GRANT = OperationModel.new(
        name: "CreateGrant",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GRANT_VERSION = OperationModel.new(
        name: "CreateGrantVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE = OperationModel.new(
        name: "CreateLicense",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_ASSET_GROUP = OperationModel.new(
        name: "CreateLicenseAssetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_ASSET_RULESET = OperationModel.new(
        name: "CreateLicenseAssetRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_CONFIGURATION = OperationModel.new(
        name: "CreateLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_CONVERSION_TASK_FOR_RESOURCE = OperationModel.new(
        name: "CreateLicenseConversionTaskForResource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_MANAGER_REPORT_GENERATOR = OperationModel.new(
        name: "CreateLicenseManagerReportGenerator",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LICENSE_VERSION = OperationModel.new(
        name: "CreateLicenseVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TOKEN = OperationModel.new(
        name: "CreateToken",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GRANT = OperationModel.new(
        name: "DeleteGrant",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LICENSE = OperationModel.new(
        name: "DeleteLicense",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LICENSE_ASSET_GROUP = OperationModel.new(
        name: "DeleteLicenseAssetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LICENSE_ASSET_RULESET = OperationModel.new(
        name: "DeleteLicenseAssetRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LICENSE_CONFIGURATION = OperationModel.new(
        name: "DeleteLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LICENSE_MANAGER_REPORT_GENERATOR = OperationModel.new(
        name: "DeleteLicenseManagerReportGenerator",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TOKEN = OperationModel.new(
        name: "DeleteToken",
        http_method: "POST",
        request_uri: "/"
      )

      EXTEND_LICENSE_CONSUMPTION = OperationModel.new(
        name: "ExtendLicenseConsumption",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCESS_TOKEN = OperationModel.new(
        name: "GetAccessToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GRANT = OperationModel.new(
        name: "GetGrant",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE = OperationModel.new(
        name: "GetLicense",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_ASSET_GROUP = OperationModel.new(
        name: "GetLicenseAssetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_ASSET_RULESET = OperationModel.new(
        name: "GetLicenseAssetRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_CONFIGURATION = OperationModel.new(
        name: "GetLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_CONVERSION_TASK = OperationModel.new(
        name: "GetLicenseConversionTask",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_MANAGER_REPORT_GENERATOR = OperationModel.new(
        name: "GetLicenseManagerReportGenerator",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_USAGE = OperationModel.new(
        name: "GetLicenseUsage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_SETTINGS = OperationModel.new(
        name: "GetServiceSettings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSETS_FOR_LICENSE_ASSET_GROUP = OperationModel.new(
        name: "ListAssetsForLicenseAssetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATIONS_FOR_LICENSE_CONFIGURATION = OperationModel.new(
        name: "ListAssociationsForLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DISTRIBUTED_GRANTS = OperationModel.new(
        name: "ListDistributedGrants",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FAILURES_FOR_LICENSE_CONFIGURATION_OPERATIONS = OperationModel.new(
        name: "ListFailuresForLicenseConfigurationOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_ASSET_GROUPS = OperationModel.new(
        name: "ListLicenseAssetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_ASSET_RULESETS = OperationModel.new(
        name: "ListLicenseAssetRulesets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_CONFIGURATIONS = OperationModel.new(
        name: "ListLicenseConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_CONFIGURATIONS_FOR_ORGANIZATION = OperationModel.new(
        name: "ListLicenseConfigurationsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_CONVERSION_TASKS = OperationModel.new(
        name: "ListLicenseConversionTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_MANAGER_REPORT_GENERATORS = OperationModel.new(
        name: "ListLicenseManagerReportGenerators",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_SPECIFICATIONS_FOR_RESOURCE = OperationModel.new(
        name: "ListLicenseSpecificationsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSE_VERSIONS = OperationModel.new(
        name: "ListLicenseVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LICENSES = OperationModel.new(
        name: "ListLicenses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIVED_GRANTS = OperationModel.new(
        name: "ListReceivedGrants",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIVED_GRANTS_FOR_ORGANIZATION = OperationModel.new(
        name: "ListReceivedGrantsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIVED_LICENSES = OperationModel.new(
        name: "ListReceivedLicenses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECEIVED_LICENSES_FOR_ORGANIZATION = OperationModel.new(
        name: "ListReceivedLicensesForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCE_INVENTORY = OperationModel.new(
        name: "ListResourceInventory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TOKENS = OperationModel.new(
        name: "ListTokens",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USAGE_FOR_LICENSE_CONFIGURATION = OperationModel.new(
        name: "ListUsageForLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_GRANT = OperationModel.new(
        name: "RejectGrant",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LICENSE_ASSET_GROUP = OperationModel.new(
        name: "UpdateLicenseAssetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LICENSE_ASSET_RULESET = OperationModel.new(
        name: "UpdateLicenseAssetRuleset",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LICENSE_CONFIGURATION = OperationModel.new(
        name: "UpdateLicenseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LICENSE_MANAGER_REPORT_GENERATOR = OperationModel.new(
        name: "UpdateLicenseManagerReportGenerator",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LICENSE_SPECIFICATIONS_FOR_RESOURCE = OperationModel.new(
        name: "UpdateLicenseSpecificationsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_SETTINGS = OperationModel.new(
        name: "UpdateServiceSettings",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
