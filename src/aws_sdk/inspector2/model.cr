module AwsSdk
  module Inspector2
    module Model
      API_VERSION = "2020-06-08"
      TARGET_PREFIX = ""
      SIGNING_NAME = "inspector2"
      ENDPOINT_PREFIX = "inspector2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://inspector2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://inspector2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_MEMBER = OperationModel.new(
        name: "AssociateMember",
        http_method: "POST",
        request_uri: "/members/associate"
      )

      BATCH_ASSOCIATE_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "BatchAssociateCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/batch/associate"
      )

      BATCH_DISASSOCIATE_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "BatchDisassociateCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/batch/disassociate"
      )

      BATCH_GET_ACCOUNT_STATUS = OperationModel.new(
        name: "BatchGetAccountStatus",
        http_method: "POST",
        request_uri: "/status/batch/get"
      )

      BATCH_GET_CODE_SNIPPET = OperationModel.new(
        name: "BatchGetCodeSnippet",
        http_method: "POST",
        request_uri: "/codesnippet/batchget"
      )

      BATCH_GET_FINDING_DETAILS = OperationModel.new(
        name: "BatchGetFindingDetails",
        http_method: "POST",
        request_uri: "/findings/details/batch/get"
      )

      BATCH_GET_FREE_TRIAL_INFO = OperationModel.new(
        name: "BatchGetFreeTrialInfo",
        http_method: "POST",
        request_uri: "/freetrialinfo/batchget"
      )

      BATCH_GET_MEMBER_EC2_DEEP_INSPECTION_STATUS = OperationModel.new(
        name: "BatchGetMemberEc2DeepInspectionStatus",
        http_method: "POST",
        request_uri: "/ec2deepinspectionstatus/member/batch/get"
      )

      BATCH_UPDATE_MEMBER_EC2_DEEP_INSPECTION_STATUS = OperationModel.new(
        name: "BatchUpdateMemberEc2DeepInspectionStatus",
        http_method: "POST",
        request_uri: "/ec2deepinspectionstatus/member/batch/update"
      )

      CANCEL_FINDINGS_REPORT = OperationModel.new(
        name: "CancelFindingsReport",
        http_method: "POST",
        request_uri: "/reporting/cancel"
      )

      CANCEL_SBOM_EXPORT = OperationModel.new(
        name: "CancelSbomExport",
        http_method: "POST",
        request_uri: "/sbomexport/cancel"
      )

      CREATE_CIS_SCAN_CONFIGURATION = OperationModel.new(
        name: "CreateCisScanConfiguration",
        http_method: "POST",
        request_uri: "/cis/scan-configuration/create"
      )

      CREATE_CODE_SECURITY_INTEGRATION = OperationModel.new(
        name: "CreateCodeSecurityIntegration",
        http_method: "POST",
        request_uri: "/codesecurity/integration/create"
      )

      CREATE_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "CreateCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/create"
      )

      CREATE_FILTER = OperationModel.new(
        name: "CreateFilter",
        http_method: "POST",
        request_uri: "/filters/create"
      )

      CREATE_FINDINGS_REPORT = OperationModel.new(
        name: "CreateFindingsReport",
        http_method: "POST",
        request_uri: "/reporting/create"
      )

      CREATE_SBOM_EXPORT = OperationModel.new(
        name: "CreateSbomExport",
        http_method: "POST",
        request_uri: "/sbomexport/create"
      )

      DELETE_CIS_SCAN_CONFIGURATION = OperationModel.new(
        name: "DeleteCisScanConfiguration",
        http_method: "POST",
        request_uri: "/cis/scan-configuration/delete"
      )

      DELETE_CODE_SECURITY_INTEGRATION = OperationModel.new(
        name: "DeleteCodeSecurityIntegration",
        http_method: "POST",
        request_uri: "/codesecurity/integration/delete"
      )

      DELETE_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "DeleteCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/delete"
      )

      DELETE_FILTER = OperationModel.new(
        name: "DeleteFilter",
        http_method: "POST",
        request_uri: "/filters/delete"
      )

      DESCRIBE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/organizationconfiguration/describe"
      )

      DISABLE = OperationModel.new(
        name: "Disable",
        http_method: "POST",
        request_uri: "/disable"
      )

      DISABLE_DELEGATED_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableDelegatedAdminAccount",
        http_method: "POST",
        request_uri: "/delegatedadminaccounts/disable"
      )

      DISASSOCIATE_MEMBER = OperationModel.new(
        name: "DisassociateMember",
        http_method: "POST",
        request_uri: "/members/disassociate"
      )

      ENABLE = OperationModel.new(
        name: "Enable",
        http_method: "POST",
        request_uri: "/enable"
      )

      ENABLE_DELEGATED_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableDelegatedAdminAccount",
        http_method: "POST",
        request_uri: "/delegatedadminaccounts/enable"
      )

      GET_CIS_SCAN_REPORT = OperationModel.new(
        name: "GetCisScanReport",
        http_method: "POST",
        request_uri: "/cis/scan/report/get"
      )

      GET_CIS_SCAN_RESULT_DETAILS = OperationModel.new(
        name: "GetCisScanResultDetails",
        http_method: "POST",
        request_uri: "/cis/scan-result/details/get"
      )

      GET_CLUSTERS_FOR_IMAGE = OperationModel.new(
        name: "GetClustersForImage",
        http_method: "POST",
        request_uri: "/cluster/get"
      )

      GET_CODE_SECURITY_INTEGRATION = OperationModel.new(
        name: "GetCodeSecurityIntegration",
        http_method: "POST",
        request_uri: "/codesecurity/integration/get"
      )

      GET_CODE_SECURITY_SCAN = OperationModel.new(
        name: "GetCodeSecurityScan",
        http_method: "POST",
        request_uri: "/codesecurity/scan/get"
      )

      GET_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "GetCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/get"
      )

      GET_CONFIGURATION = OperationModel.new(
        name: "GetConfiguration",
        http_method: "POST",
        request_uri: "/configuration/get"
      )

      GET_DELEGATED_ADMIN_ACCOUNT = OperationModel.new(
        name: "GetDelegatedAdminAccount",
        http_method: "POST",
        request_uri: "/delegatedadminaccounts/get"
      )

      GET_EC2_DEEP_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "GetEc2DeepInspectionConfiguration",
        http_method: "POST",
        request_uri: "/ec2deepinspectionconfiguration/get"
      )

      GET_ENCRYPTION_KEY = OperationModel.new(
        name: "GetEncryptionKey",
        http_method: "GET",
        request_uri: "/encryptionkey/get"
      )

      GET_FINDINGS_REPORT_STATUS = OperationModel.new(
        name: "GetFindingsReportStatus",
        http_method: "POST",
        request_uri: "/reporting/status/get"
      )

      GET_MEMBER = OperationModel.new(
        name: "GetMember",
        http_method: "POST",
        request_uri: "/members/get"
      )

      GET_SBOM_EXPORT = OperationModel.new(
        name: "GetSbomExport",
        http_method: "POST",
        request_uri: "/sbomexport/get"
      )

      LIST_ACCOUNT_PERMISSIONS = OperationModel.new(
        name: "ListAccountPermissions",
        http_method: "POST",
        request_uri: "/accountpermissions/list"
      )

      LIST_CIS_SCAN_CONFIGURATIONS = OperationModel.new(
        name: "ListCisScanConfigurations",
        http_method: "POST",
        request_uri: "/cis/scan-configuration/list"
      )

      LIST_CIS_SCAN_RESULTS_AGGREGATED_BY_CHECKS = OperationModel.new(
        name: "ListCisScanResultsAggregatedByChecks",
        http_method: "POST",
        request_uri: "/cis/scan-result/check/list"
      )

      LIST_CIS_SCAN_RESULTS_AGGREGATED_BY_TARGET_RESOURCE = OperationModel.new(
        name: "ListCisScanResultsAggregatedByTargetResource",
        http_method: "POST",
        request_uri: "/cis/scan-result/resource/list"
      )

      LIST_CIS_SCANS = OperationModel.new(
        name: "ListCisScans",
        http_method: "POST",
        request_uri: "/cis/scan/list"
      )

      LIST_CODE_SECURITY_INTEGRATIONS = OperationModel.new(
        name: "ListCodeSecurityIntegrations",
        http_method: "POST",
        request_uri: "/codesecurity/integration/list"
      )

      LIST_CODE_SECURITY_SCAN_CONFIGURATION_ASSOCIATIONS = OperationModel.new(
        name: "ListCodeSecurityScanConfigurationAssociations",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/associations/list"
      )

      LIST_CODE_SECURITY_SCAN_CONFIGURATIONS = OperationModel.new(
        name: "ListCodeSecurityScanConfigurations",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/list"
      )

      LIST_COVERAGE = OperationModel.new(
        name: "ListCoverage",
        http_method: "POST",
        request_uri: "/coverage/list"
      )

      LIST_COVERAGE_STATISTICS = OperationModel.new(
        name: "ListCoverageStatistics",
        http_method: "POST",
        request_uri: "/coverage/statistics/list"
      )

      LIST_DELEGATED_ADMIN_ACCOUNTS = OperationModel.new(
        name: "ListDelegatedAdminAccounts",
        http_method: "POST",
        request_uri: "/delegatedadminaccounts/list"
      )

      LIST_FILTERS = OperationModel.new(
        name: "ListFilters",
        http_method: "POST",
        request_uri: "/filters/list"
      )

      LIST_FINDING_AGGREGATIONS = OperationModel.new(
        name: "ListFindingAggregations",
        http_method: "POST",
        request_uri: "/findings/aggregation/list"
      )

      LIST_FINDINGS = OperationModel.new(
        name: "ListFindings",
        http_method: "POST",
        request_uri: "/findings/list"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "POST",
        request_uri: "/members/list"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_USAGE_TOTALS = OperationModel.new(
        name: "ListUsageTotals",
        http_method: "POST",
        request_uri: "/usage/list"
      )

      RESET_ENCRYPTION_KEY = OperationModel.new(
        name: "ResetEncryptionKey",
        http_method: "PUT",
        request_uri: "/encryptionkey/reset"
      )

      SEARCH_VULNERABILITIES = OperationModel.new(
        name: "SearchVulnerabilities",
        http_method: "POST",
        request_uri: "/vulnerabilities/search"
      )

      SEND_CIS_SESSION_HEALTH = OperationModel.new(
        name: "SendCisSessionHealth",
        http_method: "PUT",
        request_uri: "/cissession/health/send"
      )

      SEND_CIS_SESSION_TELEMETRY = OperationModel.new(
        name: "SendCisSessionTelemetry",
        http_method: "PUT",
        request_uri: "/cissession/telemetry/send"
      )

      START_CIS_SESSION = OperationModel.new(
        name: "StartCisSession",
        http_method: "PUT",
        request_uri: "/cissession/start"
      )

      START_CODE_SECURITY_SCAN = OperationModel.new(
        name: "StartCodeSecurityScan",
        http_method: "POST",
        request_uri: "/codesecurity/scan/start"
      )

      STOP_CIS_SESSION = OperationModel.new(
        name: "StopCisSession",
        http_method: "PUT",
        request_uri: "/cissession/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_CIS_SCAN_CONFIGURATION = OperationModel.new(
        name: "UpdateCisScanConfiguration",
        http_method: "POST",
        request_uri: "/cis/scan-configuration/update"
      )

      UPDATE_CODE_SECURITY_INTEGRATION = OperationModel.new(
        name: "UpdateCodeSecurityIntegration",
        http_method: "POST",
        request_uri: "/codesecurity/integration/update"
      )

      UPDATE_CODE_SECURITY_SCAN_CONFIGURATION = OperationModel.new(
        name: "UpdateCodeSecurityScanConfiguration",
        http_method: "POST",
        request_uri: "/codesecurity/scan-configuration/update"
      )

      UPDATE_CONFIGURATION = OperationModel.new(
        name: "UpdateConfiguration",
        http_method: "POST",
        request_uri: "/configuration/update"
      )

      UPDATE_EC2_DEEP_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "UpdateEc2DeepInspectionConfiguration",
        http_method: "POST",
        request_uri: "/ec2deepinspectionconfiguration/update"
      )

      UPDATE_ENCRYPTION_KEY = OperationModel.new(
        name: "UpdateEncryptionKey",
        http_method: "PUT",
        request_uri: "/encryptionkey/update"
      )

      UPDATE_FILTER = OperationModel.new(
        name: "UpdateFilter",
        http_method: "POST",
        request_uri: "/filters/update"
      )

      UPDATE_ORG_EC2_DEEP_INSPECTION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrgEc2DeepInspectionConfiguration",
        http_method: "POST",
        request_uri: "/ec2deepinspectionconfiguration/org/update"
      )

      UPDATE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/organizationconfiguration/update"
      )
    end
  end
end
