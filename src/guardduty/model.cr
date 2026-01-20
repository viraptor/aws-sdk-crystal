module Aws
  module GuardDuty
    module Model
      API_VERSION = "2017-11-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "guardduty"
      ENDPOINT_PREFIX = "guardduty"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://guardduty-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://guardduty.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://guardduty-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://guardduty.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://guardduty.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ADMINISTRATOR_INVITATION = OperationModel.new(
        name: "AcceptAdministratorInvitation",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/administrator"
      )

      ACCEPT_INVITATION = OperationModel.new(
        name: "AcceptInvitation",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/master"
      )

      ARCHIVE_FINDINGS = OperationModel.new(
        name: "ArchiveFindings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/archive"
      )

      CREATE_DETECTOR = OperationModel.new(
        name: "CreateDetector",
        http_method: "POST",
        request_uri: "/detector"
      )

      CREATE_FILTER = OperationModel.new(
        name: "CreateFilter",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/filter"
      )

      CREATE_IP_SET = OperationModel.new(
        name: "CreateIPSet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/ipset"
      )

      CREATE_MALWARE_PROTECTION_PLAN = OperationModel.new(
        name: "CreateMalwareProtectionPlan",
        http_method: "POST",
        request_uri: "/malware-protection-plan"
      )

      CREATE_MEMBERS = OperationModel.new(
        name: "CreateMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member"
      )

      CREATE_PUBLISHING_DESTINATION = OperationModel.new(
        name: "CreatePublishingDestination",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/publishingDestination"
      )

      CREATE_SAMPLE_FINDINGS = OperationModel.new(
        name: "CreateSampleFindings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/create"
      )

      CREATE_THREAT_ENTITY_SET = OperationModel.new(
        name: "CreateThreatEntitySet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/threatentityset"
      )

      CREATE_THREAT_INTEL_SET = OperationModel.new(
        name: "CreateThreatIntelSet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/threatintelset"
      )

      CREATE_TRUSTED_ENTITY_SET = OperationModel.new(
        name: "CreateTrustedEntitySet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/trustedentityset"
      )

      DECLINE_INVITATIONS = OperationModel.new(
        name: "DeclineInvitations",
        http_method: "POST",
        request_uri: "/invitation/decline"
      )

      DELETE_DETECTOR = OperationModel.new(
        name: "DeleteDetector",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}"
      )

      DELETE_FILTER = OperationModel.new(
        name: "DeleteFilter",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/filter/{filterName}"
      )

      DELETE_IP_SET = OperationModel.new(
        name: "DeleteIPSet",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/ipset/{ipSetId}"
      )

      DELETE_INVITATIONS = OperationModel.new(
        name: "DeleteInvitations",
        http_method: "POST",
        request_uri: "/invitation/delete"
      )

      DELETE_MALWARE_PROTECTION_PLAN = OperationModel.new(
        name: "DeleteMalwareProtectionPlan",
        http_method: "DELETE",
        request_uri: "/malware-protection-plan/{malwareProtectionPlanId}"
      )

      DELETE_MEMBERS = OperationModel.new(
        name: "DeleteMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/delete"
      )

      DELETE_PUBLISHING_DESTINATION = OperationModel.new(
        name: "DeletePublishingDestination",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/publishingDestination/{destinationId}"
      )

      DELETE_THREAT_ENTITY_SET = OperationModel.new(
        name: "DeleteThreatEntitySet",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/threatentityset/{threatEntitySetId}"
      )

      DELETE_THREAT_INTEL_SET = OperationModel.new(
        name: "DeleteThreatIntelSet",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/threatintelset/{threatIntelSetId}"
      )

      DELETE_TRUSTED_ENTITY_SET = OperationModel.new(
        name: "DeleteTrustedEntitySet",
        http_method: "DELETE",
        request_uri: "/detector/{detectorId}/trustedentityset/{trustedEntitySetId}"
      )

      DESCRIBE_MALWARE_SCANS = OperationModel.new(
        name: "DescribeMalwareScans",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/malware-scans"
      )

      DESCRIBE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeOrganizationConfiguration",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/admin"
      )

      DESCRIBE_PUBLISHING_DESTINATION = OperationModel.new(
        name: "DescribePublishingDestination",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/publishingDestination/{destinationId}"
      )

      DISABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/admin/disable"
      )

      DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "DisassociateFromAdministratorAccount",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/administrator/disassociate"
      )

      DISASSOCIATE_FROM_MASTER_ACCOUNT = OperationModel.new(
        name: "DisassociateFromMasterAccount",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/master/disassociate"
      )

      DISASSOCIATE_MEMBERS = OperationModel.new(
        name: "DisassociateMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/disassociate"
      )

      ENABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/admin/enable"
      )

      GET_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "GetAdministratorAccount",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/administrator"
      )

      GET_COVERAGE_STATISTICS = OperationModel.new(
        name: "GetCoverageStatistics",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/coverage/statistics"
      )

      GET_DETECTOR = OperationModel.new(
        name: "GetDetector",
        http_method: "GET",
        request_uri: "/detector/{detectorId}"
      )

      GET_FILTER = OperationModel.new(
        name: "GetFilter",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/filter/{filterName}"
      )

      GET_FINDINGS = OperationModel.new(
        name: "GetFindings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/get"
      )

      GET_FINDINGS_STATISTICS = OperationModel.new(
        name: "GetFindingsStatistics",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/statistics"
      )

      GET_IP_SET = OperationModel.new(
        name: "GetIPSet",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/ipset/{ipSetId}"
      )

      GET_INVITATIONS_COUNT = OperationModel.new(
        name: "GetInvitationsCount",
        http_method: "GET",
        request_uri: "/invitation/count"
      )

      GET_MALWARE_PROTECTION_PLAN = OperationModel.new(
        name: "GetMalwareProtectionPlan",
        http_method: "GET",
        request_uri: "/malware-protection-plan/{malwareProtectionPlanId}"
      )

      GET_MALWARE_SCAN = OperationModel.new(
        name: "GetMalwareScan",
        http_method: "GET",
        request_uri: "/malware-scan/{scanId}"
      )

      GET_MALWARE_SCAN_SETTINGS = OperationModel.new(
        name: "GetMalwareScanSettings",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/malware-scan-settings"
      )

      GET_MASTER_ACCOUNT = OperationModel.new(
        name: "GetMasterAccount",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/master"
      )

      GET_MEMBER_DETECTORS = OperationModel.new(
        name: "GetMemberDetectors",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/detector/get"
      )

      GET_MEMBERS = OperationModel.new(
        name: "GetMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/get"
      )

      GET_ORGANIZATION_STATISTICS = OperationModel.new(
        name: "GetOrganizationStatistics",
        http_method: "GET",
        request_uri: "/organization/statistics"
      )

      GET_REMAINING_FREE_TRIAL_DAYS = OperationModel.new(
        name: "GetRemainingFreeTrialDays",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/freeTrial/daysRemaining"
      )

      GET_THREAT_ENTITY_SET = OperationModel.new(
        name: "GetThreatEntitySet",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/threatentityset/{threatEntitySetId}"
      )

      GET_THREAT_INTEL_SET = OperationModel.new(
        name: "GetThreatIntelSet",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/threatintelset/{threatIntelSetId}"
      )

      GET_TRUSTED_ENTITY_SET = OperationModel.new(
        name: "GetTrustedEntitySet",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/trustedentityset/{trustedEntitySetId}"
      )

      GET_USAGE_STATISTICS = OperationModel.new(
        name: "GetUsageStatistics",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/usage/statistics"
      )

      INVITE_MEMBERS = OperationModel.new(
        name: "InviteMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/invite"
      )

      LIST_COVERAGE = OperationModel.new(
        name: "ListCoverage",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/coverage"
      )

      LIST_DETECTORS = OperationModel.new(
        name: "ListDetectors",
        http_method: "GET",
        request_uri: "/detector"
      )

      LIST_FILTERS = OperationModel.new(
        name: "ListFilters",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/filter"
      )

      LIST_FINDINGS = OperationModel.new(
        name: "ListFindings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings"
      )

      LIST_IP_SETS = OperationModel.new(
        name: "ListIPSets",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/ipset"
      )

      LIST_INVITATIONS = OperationModel.new(
        name: "ListInvitations",
        http_method: "GET",
        request_uri: "/invitation"
      )

      LIST_MALWARE_PROTECTION_PLANS = OperationModel.new(
        name: "ListMalwareProtectionPlans",
        http_method: "GET",
        request_uri: "/malware-protection-plan"
      )

      LIST_MALWARE_SCANS = OperationModel.new(
        name: "ListMalwareScans",
        http_method: "POST",
        request_uri: "/malware-scan"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/member"
      )

      LIST_ORGANIZATION_ADMIN_ACCOUNTS = OperationModel.new(
        name: "ListOrganizationAdminAccounts",
        http_method: "GET",
        request_uri: "/admin"
      )

      LIST_PUBLISHING_DESTINATIONS = OperationModel.new(
        name: "ListPublishingDestinations",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/publishingDestination"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_THREAT_ENTITY_SETS = OperationModel.new(
        name: "ListThreatEntitySets",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/threatentityset"
      )

      LIST_THREAT_INTEL_SETS = OperationModel.new(
        name: "ListThreatIntelSets",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/threatintelset"
      )

      LIST_TRUSTED_ENTITY_SETS = OperationModel.new(
        name: "ListTrustedEntitySets",
        http_method: "GET",
        request_uri: "/detector/{detectorId}/trustedentityset"
      )

      SEND_OBJECT_MALWARE_SCAN = OperationModel.new(
        name: "SendObjectMalwareScan",
        http_method: "POST",
        request_uri: "/object-malware-scan/send"
      )

      START_MALWARE_SCAN = OperationModel.new(
        name: "StartMalwareScan",
        http_method: "POST",
        request_uri: "/malware-scan/start"
      )

      START_MONITORING_MEMBERS = OperationModel.new(
        name: "StartMonitoringMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/start"
      )

      STOP_MONITORING_MEMBERS = OperationModel.new(
        name: "StopMonitoringMembers",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNARCHIVE_FINDINGS = OperationModel.new(
        name: "UnarchiveFindings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/unarchive"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_DETECTOR = OperationModel.new(
        name: "UpdateDetector",
        http_method: "POST",
        request_uri: "/detector/{detectorId}"
      )

      UPDATE_FILTER = OperationModel.new(
        name: "UpdateFilter",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/filter/{filterName}"
      )

      UPDATE_FINDINGS_FEEDBACK = OperationModel.new(
        name: "UpdateFindingsFeedback",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/findings/feedback"
      )

      UPDATE_IP_SET = OperationModel.new(
        name: "UpdateIPSet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/ipset/{ipSetId}"
      )

      UPDATE_MALWARE_PROTECTION_PLAN = OperationModel.new(
        name: "UpdateMalwareProtectionPlan",
        http_method: "PATCH",
        request_uri: "/malware-protection-plan/{malwareProtectionPlanId}"
      )

      UPDATE_MALWARE_SCAN_SETTINGS = OperationModel.new(
        name: "UpdateMalwareScanSettings",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/malware-scan-settings"
      )

      UPDATE_MEMBER_DETECTORS = OperationModel.new(
        name: "UpdateMemberDetectors",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/member/detector/update"
      )

      UPDATE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrganizationConfiguration",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/admin"
      )

      UPDATE_PUBLISHING_DESTINATION = OperationModel.new(
        name: "UpdatePublishingDestination",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/publishingDestination/{destinationId}"
      )

      UPDATE_THREAT_ENTITY_SET = OperationModel.new(
        name: "UpdateThreatEntitySet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/threatentityset/{threatEntitySetId}"
      )

      UPDATE_THREAT_INTEL_SET = OperationModel.new(
        name: "UpdateThreatIntelSet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/threatintelset/{threatIntelSetId}"
      )

      UPDATE_TRUSTED_ENTITY_SET = OperationModel.new(
        name: "UpdateTrustedEntitySet",
        http_method: "POST",
        request_uri: "/detector/{detectorId}/trustedentityset/{trustedEntitySetId}"
      )
    end
  end
end
