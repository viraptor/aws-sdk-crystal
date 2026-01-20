module Aws
  module WAFRegional
    module Model
      API_VERSION = "2016-11-28"
      TARGET_PREFIX = "AWSWAF_Regional_20161128"
      SIGNING_NAME = "waf-regional"
      ENDPOINT_PREFIX = "waf-regional"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://waf-regional-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://waf-regional-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://waf-regional.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://waf-regional.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
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

      CREATE_BYTE_MATCH_SET = OperationModel.new(
        name: "CreateByteMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GEO_MATCH_SET = OperationModel.new(
        name: "CreateGeoMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IP_SET = OperationModel.new(
        name: "CreateIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RATE_BASED_RULE = OperationModel.new(
        name: "CreateRateBasedRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGEX_MATCH_SET = OperationModel.new(
        name: "CreateRegexMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REGEX_PATTERN_SET = OperationModel.new(
        name: "CreateRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE_GROUP = OperationModel.new(
        name: "CreateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SIZE_CONSTRAINT_SET = OperationModel.new(
        name: "CreateSizeConstraintSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SQL_INJECTION_MATCH_SET = OperationModel.new(
        name: "CreateSqlInjectionMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WEB_ACL = OperationModel.new(
        name: "CreateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WEB_ACL_MIGRATION_STACK = OperationModel.new(
        name: "CreateWebACLMigrationStack",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_XSS_MATCH_SET = OperationModel.new(
        name: "CreateXssMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BYTE_MATCH_SET = OperationModel.new(
        name: "DeleteByteMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GEO_MATCH_SET = OperationModel.new(
        name: "DeleteGeoMatchSet",
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

      DELETE_RATE_BASED_RULE = OperationModel.new(
        name: "DeleteRateBasedRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGEX_MATCH_SET = OperationModel.new(
        name: "DeleteRegexMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGEX_PATTERN_SET = OperationModel.new(
        name: "DeleteRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE_GROUP = OperationModel.new(
        name: "DeleteRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SIZE_CONSTRAINT_SET = OperationModel.new(
        name: "DeleteSizeConstraintSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SQL_INJECTION_MATCH_SET = OperationModel.new(
        name: "DeleteSqlInjectionMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEB_ACL = OperationModel.new(
        name: "DeleteWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_XSS_MATCH_SET = OperationModel.new(
        name: "DeleteXssMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_WEB_ACL = OperationModel.new(
        name: "DisassociateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BYTE_MATCH_SET = OperationModel.new(
        name: "GetByteMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CHANGE_TOKEN = OperationModel.new(
        name: "GetChangeToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CHANGE_TOKEN_STATUS = OperationModel.new(
        name: "GetChangeTokenStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GEO_MATCH_SET = OperationModel.new(
        name: "GetGeoMatchSet",
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

      GET_PERMISSION_POLICY = OperationModel.new(
        name: "GetPermissionPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RATE_BASED_RULE = OperationModel.new(
        name: "GetRateBasedRule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RATE_BASED_RULE_MANAGED_KEYS = OperationModel.new(
        name: "GetRateBasedRuleManagedKeys",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGEX_MATCH_SET = OperationModel.new(
        name: "GetRegexMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGEX_PATTERN_SET = OperationModel.new(
        name: "GetRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RULE = OperationModel.new(
        name: "GetRule",
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

      GET_SIZE_CONSTRAINT_SET = OperationModel.new(
        name: "GetSizeConstraintSet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SQL_INJECTION_MATCH_SET = OperationModel.new(
        name: "GetSqlInjectionMatchSet",
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

      GET_XSS_MATCH_SET = OperationModel.new(
        name: "GetXssMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTIVATED_RULES_IN_RULE_GROUP = OperationModel.new(
        name: "ListActivatedRulesInRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BYTE_MATCH_SETS = OperationModel.new(
        name: "ListByteMatchSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GEO_MATCH_SETS = OperationModel.new(
        name: "ListGeoMatchSets",
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

      LIST_RATE_BASED_RULES = OperationModel.new(
        name: "ListRateBasedRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REGEX_MATCH_SETS = OperationModel.new(
        name: "ListRegexMatchSets",
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

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SIZE_CONSTRAINT_SETS = OperationModel.new(
        name: "ListSizeConstraintSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SQL_INJECTION_MATCH_SETS = OperationModel.new(
        name: "ListSqlInjectionMatchSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUBSCRIBED_RULE_GROUPS = OperationModel.new(
        name: "ListSubscribedRuleGroups",
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

      LIST_XSS_MATCH_SETS = OperationModel.new(
        name: "ListXssMatchSets",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LOGGING_CONFIGURATION = OperationModel.new(
        name: "PutLoggingConfiguration",
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

      UPDATE_BYTE_MATCH_SET = OperationModel.new(
        name: "UpdateByteMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GEO_MATCH_SET = OperationModel.new(
        name: "UpdateGeoMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IP_SET = OperationModel.new(
        name: "UpdateIPSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RATE_BASED_RULE = OperationModel.new(
        name: "UpdateRateBasedRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REGEX_MATCH_SET = OperationModel.new(
        name: "UpdateRegexMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REGEX_PATTERN_SET = OperationModel.new(
        name: "UpdateRegexPatternSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE = OperationModel.new(
        name: "UpdateRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RULE_GROUP = OperationModel.new(
        name: "UpdateRuleGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SIZE_CONSTRAINT_SET = OperationModel.new(
        name: "UpdateSizeConstraintSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SQL_INJECTION_MATCH_SET = OperationModel.new(
        name: "UpdateSqlInjectionMatchSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WEB_ACL = OperationModel.new(
        name: "UpdateWebACL",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_XSS_MATCH_SET = OperationModel.new(
        name: "UpdateXssMatchSet",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
