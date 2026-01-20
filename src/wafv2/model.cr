module Aws
  module WAFV2
    module Model
      API_VERSION = "2019-07-29"
      TARGET_PREFIX = "AWSWAF_20190729"
      SIGNING_NAME = "wafv2"
      ENDPOINT_PREFIX = "wafv2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wafv2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wafv2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wafv2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://wafv2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_WEB_ACL = OperationModel.new(
        name: "AssociateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_CAPACITY = OperationModel.new(
        name: "CheckCapacity",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_API_KEY = OperationModel.new(
        name: "CreateAPIKey",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IP_SET = OperationModel.new(
        name: "CreateIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGEX_PATTERN_SET = OperationModel.new(
        name: "CreateRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE_GROUP = OperationModel.new(
        name: "CreateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WEB_ACL = OperationModel.new(
        name: "CreateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_API_KEY = OperationModel.new(
        name: "DeleteAPIKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FIREWALL_MANAGER_RULE_GROUPS = OperationModel.new(
        name: "DeleteFirewallManagerRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IP_SET = OperationModel.new(
        name: "DeleteIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PERMISSION_POLICY = OperationModel.new(
        name: "DeletePermissionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGEX_PATTERN_SET = OperationModel.new(
        name: "DeleteRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE_GROUP = OperationModel.new(
        name: "DeleteRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEB_ACL = OperationModel.new(
        name: "DeleteWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ALL_MANAGED_PRODUCTS = OperationModel.new(
        name: "DescribeAllManagedProducts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MANAGED_PRODUCTS_BY_VENDOR = OperationModel.new(
        name: "DescribeManagedProductsByVendor",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MANAGED_RULE_GROUP = OperationModel.new(
        name: "DescribeManagedRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_WEB_ACL = OperationModel.new(
        name: "DisassociateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_MOBILE_SDK_RELEASE_URL = OperationModel.new(
        name: "GenerateMobileSdkReleaseUrl",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DECRYPTED_API_KEY = OperationModel.new(
        name: "GetDecryptedAPIKey",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IP_SET = OperationModel.new(
        name: "GetIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOGGING_CONFIGURATION = OperationModel.new(
        name: "GetLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MANAGED_RULE_SET = OperationModel.new(
        name: "GetManagedRuleSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MOBILE_SDK_RELEASE = OperationModel.new(
        name: "GetMobileSdkRelease",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PERMISSION_POLICY = OperationModel.new(
        name: "GetPermissionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RATE_BASED_STATEMENT_MANAGED_KEYS = OperationModel.new(
        name: "GetRateBasedStatementManagedKeys",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGEX_PATTERN_SET = OperationModel.new(
        name: "GetRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RULE_GROUP = OperationModel.new(
        name: "GetRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SAMPLED_REQUESTS = OperationModel.new(
        name: "GetSampledRequests",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WEB_ACL = OperationModel.new(
        name: "GetWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WEB_ACL_FOR_RESOURCE = OperationModel.new(
        name: "GetWebACLForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_API_KEYS = OperationModel.new(
        name: "ListAPIKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABLE_MANAGED_RULE_GROUP_VERSIONS = OperationModel.new(
        name: "ListAvailableManagedRuleGroupVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABLE_MANAGED_RULE_GROUPS = OperationModel.new(
        name: "ListAvailableManagedRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IP_SETS = OperationModel.new(
        name: "ListIPSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOGGING_CONFIGURATIONS = OperationModel.new(
        name: "ListLoggingConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MANAGED_RULE_SETS = OperationModel.new(
        name: "ListManagedRuleSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MOBILE_SDK_RELEASES = OperationModel.new(
        name: "ListMobileSdkReleases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REGEX_PATTERN_SETS = OperationModel.new(
        name: "ListRegexPatternSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESOURCES_FOR_WEB_ACL = OperationModel.new(
        name: "ListResourcesForWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_GROUPS = OperationModel.new(
        name: "ListRuleGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WEB_AC_LS = OperationModel.new(
        name: "ListWebACLs",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LOGGING_CONFIGURATION = OperationModel.new(
        name: "PutLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MANAGED_RULE_SET_VERSIONS = OperationModel.new(
        name: "PutManagedRuleSetVersions",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PERMISSION_POLICY = OperationModel.new(
        name: "PutPermissionPolicy",
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

      UPDATE_IP_SET = OperationModel.new(
        name: "UpdateIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MANAGED_RULE_SET_VERSION_EXPIRY_DATE = OperationModel.new(
        name: "UpdateManagedRuleSetVersionExpiryDate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REGEX_PATTERN_SET = OperationModel.new(
        name: "UpdateRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_GROUP = OperationModel.new(
        name: "UpdateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WEB_ACL = OperationModel.new(
        name: "UpdateWebACL",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
