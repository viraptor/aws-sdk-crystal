module AwsSdk
  module Macie2
    module Model
      API_VERSION = "2020-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "macie2"
      ENDPOINT_PREFIX = "macie2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://macie2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://macie2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://macie2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://macie2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_INVITATION = OperationModel.new(
        name: "AcceptInvitation",
        http_method: "POST",
        request_uri: "/invitations/accept"
      )

      BATCH_GET_CUSTOM_DATA_IDENTIFIERS = OperationModel.new(
        name: "BatchGetCustomDataIdentifiers",
        http_method: "POST",
        request_uri: "/custom-data-identifiers/get"
      )

      BATCH_UPDATE_AUTOMATED_DISCOVERY_ACCOUNTS = OperationModel.new(
        name: "BatchUpdateAutomatedDiscoveryAccounts",
        http_method: "PATCH",
        request_uri: "/automated-discovery/accounts"
      )

      CREATE_ALLOW_LIST = OperationModel.new(
        name: "CreateAllowList",
        http_method: "POST",
        request_uri: "/allow-lists"
      )

      CREATE_CLASSIFICATION_JOB = OperationModel.new(
        name: "CreateClassificationJob",
        http_method: "POST",
        request_uri: "/jobs"
      )

      CREATE_CUSTOM_DATA_IDENTIFIER = OperationModel.new(
        name: "CreateCustomDataIdentifier",
        http_method: "POST",
        request_uri: "/custom-data-identifiers"
      )

      CREATE_FINDINGS_FILTER = OperationModel.new(
        name: "CreateFindingsFilter",
        http_method: "POST",
        request_uri: "/findingsfilters"
      )

      CREATE_INVITATIONS = OperationModel.new(
        name: "CreateInvitations",
        http_method: "POST",
        request_uri: "/invitations"
      )

      CREATE_MEMBER = OperationModel.new(
        name: "CreateMember",
        http_method: "POST",
        request_uri: "/members"
      )

      CREATE_SAMPLE_FINDINGS = OperationModel.new(
        name: "CreateSampleFindings",
        http_method: "POST",
        request_uri: "/findings/sample"
      )

      DECLINE_INVITATIONS = OperationModel.new(
        name: "DeclineInvitations",
        http_method: "POST",
        request_uri: "/invitations/decline"
      )

      DELETE_ALLOW_LIST = OperationModel.new(
        name: "DeleteAllowList",
        http_method: "DELETE",
        request_uri: "/allow-lists/{id}"
      )

      DELETE_CUSTOM_DATA_IDENTIFIER = OperationModel.new(
        name: "DeleteCustomDataIdentifier",
        http_method: "DELETE",
        request_uri: "/custom-data-identifiers/{id}"
      )

      DELETE_FINDINGS_FILTER = OperationModel.new(
        name: "DeleteFindingsFilter",
        http_method: "DELETE",
        request_uri: "/findingsfilters/{id}"
      )

      DELETE_INVITATIONS = OperationModel.new(
        name: "DeleteInvitations",
        http_method: "POST",
        request_uri: "/invitations/delete"
      )

      DELETE_MEMBER = OperationModel.new(
        name: "DeleteMember",
        http_method: "DELETE",
        request_uri: "/members/{id}"
      )

      DESCRIBE_BUCKETS = OperationModel.new(
        name: "DescribeBuckets",
        http_method: "POST",
        request_uri: "/datasources/s3"
      )

      DESCRIBE_CLASSIFICATION_JOB = OperationModel.new(
        name: "DescribeClassificationJob",
        http_method: "GET",
        request_uri: "/jobs/{jobId}"
      )

      DESCRIBE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeOrganizationConfiguration",
        http_method: "GET",
        request_uri: "/admin/configuration"
      )

      DISABLE_MACIE = OperationModel.new(
        name: "DisableMacie",
        http_method: "DELETE",
        request_uri: "/macie"
      )

      DISABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableOrganizationAdminAccount",
        http_method: "DELETE",
        request_uri: "/admin"
      )

      DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "DisassociateFromAdministratorAccount",
        http_method: "POST",
        request_uri: "/administrator/disassociate"
      )

      DISASSOCIATE_FROM_MASTER_ACCOUNT = OperationModel.new(
        name: "DisassociateFromMasterAccount",
        http_method: "POST",
        request_uri: "/master/disassociate"
      )

      DISASSOCIATE_MEMBER = OperationModel.new(
        name: "DisassociateMember",
        http_method: "POST",
        request_uri: "/members/disassociate/{id}"
      )

      ENABLE_MACIE = OperationModel.new(
        name: "EnableMacie",
        http_method: "POST",
        request_uri: "/macie"
      )

      ENABLE_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/admin"
      )

      GET_ADMINISTRATOR_ACCOUNT = OperationModel.new(
        name: "GetAdministratorAccount",
        http_method: "GET",
        request_uri: "/administrator"
      )

      GET_ALLOW_LIST = OperationModel.new(
        name: "GetAllowList",
        http_method: "GET",
        request_uri: "/allow-lists/{id}"
      )

      GET_AUTOMATED_DISCOVERY_CONFIGURATION = OperationModel.new(
        name: "GetAutomatedDiscoveryConfiguration",
        http_method: "GET",
        request_uri: "/automated-discovery/configuration"
      )

      GET_BUCKET_STATISTICS = OperationModel.new(
        name: "GetBucketStatistics",
        http_method: "POST",
        request_uri: "/datasources/s3/statistics"
      )

      GET_CLASSIFICATION_EXPORT_CONFIGURATION = OperationModel.new(
        name: "GetClassificationExportConfiguration",
        http_method: "GET",
        request_uri: "/classification-export-configuration"
      )

      GET_CLASSIFICATION_SCOPE = OperationModel.new(
        name: "GetClassificationScope",
        http_method: "GET",
        request_uri: "/classification-scopes/{id}"
      )

      GET_CUSTOM_DATA_IDENTIFIER = OperationModel.new(
        name: "GetCustomDataIdentifier",
        http_method: "GET",
        request_uri: "/custom-data-identifiers/{id}"
      )

      GET_FINDING_STATISTICS = OperationModel.new(
        name: "GetFindingStatistics",
        http_method: "POST",
        request_uri: "/findings/statistics"
      )

      GET_FINDINGS = OperationModel.new(
        name: "GetFindings",
        http_method: "POST",
        request_uri: "/findings/describe"
      )

      GET_FINDINGS_FILTER = OperationModel.new(
        name: "GetFindingsFilter",
        http_method: "GET",
        request_uri: "/findingsfilters/{id}"
      )

      GET_FINDINGS_PUBLICATION_CONFIGURATION = OperationModel.new(
        name: "GetFindingsPublicationConfiguration",
        http_method: "GET",
        request_uri: "/findings-publication-configuration"
      )

      GET_INVITATIONS_COUNT = OperationModel.new(
        name: "GetInvitationsCount",
        http_method: "GET",
        request_uri: "/invitations/count"
      )

      GET_MACIE_SESSION = OperationModel.new(
        name: "GetMacieSession",
        http_method: "GET",
        request_uri: "/macie"
      )

      GET_MASTER_ACCOUNT = OperationModel.new(
        name: "GetMasterAccount",
        http_method: "GET",
        request_uri: "/master"
      )

      GET_MEMBER = OperationModel.new(
        name: "GetMember",
        http_method: "GET",
        request_uri: "/members/{id}"
      )

      GET_RESOURCE_PROFILE = OperationModel.new(
        name: "GetResourceProfile",
        http_method: "GET",
        request_uri: "/resource-profiles"
      )

      GET_REVEAL_CONFIGURATION = OperationModel.new(
        name: "GetRevealConfiguration",
        http_method: "GET",
        request_uri: "/reveal-configuration"
      )

      GET_SENSITIVE_DATA_OCCURRENCES = OperationModel.new(
        name: "GetSensitiveDataOccurrences",
        http_method: "GET",
        request_uri: "/findings/{findingId}/reveal"
      )

      GET_SENSITIVE_DATA_OCCURRENCES_AVAILABILITY = OperationModel.new(
        name: "GetSensitiveDataOccurrencesAvailability",
        http_method: "GET",
        request_uri: "/findings/{findingId}/reveal/availability"
      )

      GET_SENSITIVITY_INSPECTION_TEMPLATE = OperationModel.new(
        name: "GetSensitivityInspectionTemplate",
        http_method: "GET",
        request_uri: "/templates/sensitivity-inspections/{id}"
      )

      GET_USAGE_STATISTICS = OperationModel.new(
        name: "GetUsageStatistics",
        http_method: "POST",
        request_uri: "/usage/statistics"
      )

      GET_USAGE_TOTALS = OperationModel.new(
        name: "GetUsageTotals",
        http_method: "GET",
        request_uri: "/usage"
      )

      LIST_ALLOW_LISTS = OperationModel.new(
        name: "ListAllowLists",
        http_method: "GET",
        request_uri: "/allow-lists"
      )

      LIST_AUTOMATED_DISCOVERY_ACCOUNTS = OperationModel.new(
        name: "ListAutomatedDiscoveryAccounts",
        http_method: "GET",
        request_uri: "/automated-discovery/accounts"
      )

      LIST_CLASSIFICATION_JOBS = OperationModel.new(
        name: "ListClassificationJobs",
        http_method: "POST",
        request_uri: "/jobs/list"
      )

      LIST_CLASSIFICATION_SCOPES = OperationModel.new(
        name: "ListClassificationScopes",
        http_method: "GET",
        request_uri: "/classification-scopes"
      )

      LIST_CUSTOM_DATA_IDENTIFIERS = OperationModel.new(
        name: "ListCustomDataIdentifiers",
        http_method: "POST",
        request_uri: "/custom-data-identifiers/list"
      )

      LIST_FINDINGS = OperationModel.new(
        name: "ListFindings",
        http_method: "POST",
        request_uri: "/findings"
      )

      LIST_FINDINGS_FILTERS = OperationModel.new(
        name: "ListFindingsFilters",
        http_method: "GET",
        request_uri: "/findingsfilters"
      )

      LIST_INVITATIONS = OperationModel.new(
        name: "ListInvitations",
        http_method: "GET",
        request_uri: "/invitations"
      )

      LIST_MANAGED_DATA_IDENTIFIERS = OperationModel.new(
        name: "ListManagedDataIdentifiers",
        http_method: "POST",
        request_uri: "/managed-data-identifiers/list"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "GET",
        request_uri: "/members"
      )

      LIST_ORGANIZATION_ADMIN_ACCOUNTS = OperationModel.new(
        name: "ListOrganizationAdminAccounts",
        http_method: "GET",
        request_uri: "/admin"
      )

      LIST_RESOURCE_PROFILE_ARTIFACTS = OperationModel.new(
        name: "ListResourceProfileArtifacts",
        http_method: "GET",
        request_uri: "/resource-profiles/artifacts"
      )

      LIST_RESOURCE_PROFILE_DETECTIONS = OperationModel.new(
        name: "ListResourceProfileDetections",
        http_method: "GET",
        request_uri: "/resource-profiles/detections"
      )

      LIST_SENSITIVITY_INSPECTION_TEMPLATES = OperationModel.new(
        name: "ListSensitivityInspectionTemplates",
        http_method: "GET",
        request_uri: "/templates/sensitivity-inspections"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_CLASSIFICATION_EXPORT_CONFIGURATION = OperationModel.new(
        name: "PutClassificationExportConfiguration",
        http_method: "PUT",
        request_uri: "/classification-export-configuration"
      )

      PUT_FINDINGS_PUBLICATION_CONFIGURATION = OperationModel.new(
        name: "PutFindingsPublicationConfiguration",
        http_method: "PUT",
        request_uri: "/findings-publication-configuration"
      )

      SEARCH_RESOURCES = OperationModel.new(
        name: "SearchResources",
        http_method: "POST",
        request_uri: "/datasources/search-resources"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TEST_CUSTOM_DATA_IDENTIFIER = OperationModel.new(
        name: "TestCustomDataIdentifier",
        http_method: "POST",
        request_uri: "/custom-data-identifiers/test"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_ALLOW_LIST = OperationModel.new(
        name: "UpdateAllowList",
        http_method: "PUT",
        request_uri: "/allow-lists/{id}"
      )

      UPDATE_AUTOMATED_DISCOVERY_CONFIGURATION = OperationModel.new(
        name: "UpdateAutomatedDiscoveryConfiguration",
        http_method: "PUT",
        request_uri: "/automated-discovery/configuration"
      )

      UPDATE_CLASSIFICATION_JOB = OperationModel.new(
        name: "UpdateClassificationJob",
        http_method: "PATCH",
        request_uri: "/jobs/{jobId}"
      )

      UPDATE_CLASSIFICATION_SCOPE = OperationModel.new(
        name: "UpdateClassificationScope",
        http_method: "PATCH",
        request_uri: "/classification-scopes/{id}"
      )

      UPDATE_FINDINGS_FILTER = OperationModel.new(
        name: "UpdateFindingsFilter",
        http_method: "PATCH",
        request_uri: "/findingsfilters/{id}"
      )

      UPDATE_MACIE_SESSION = OperationModel.new(
        name: "UpdateMacieSession",
        http_method: "PATCH",
        request_uri: "/macie"
      )

      UPDATE_MEMBER_SESSION = OperationModel.new(
        name: "UpdateMemberSession",
        http_method: "PATCH",
        request_uri: "/macie/members/{id}"
      )

      UPDATE_ORGANIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateOrganizationConfiguration",
        http_method: "PATCH",
        request_uri: "/admin/configuration"
      )

      UPDATE_RESOURCE_PROFILE = OperationModel.new(
        name: "UpdateResourceProfile",
        http_method: "PATCH",
        request_uri: "/resource-profiles"
      )

      UPDATE_RESOURCE_PROFILE_DETECTIONS = OperationModel.new(
        name: "UpdateResourceProfileDetections",
        http_method: "PATCH",
        request_uri: "/resource-profiles/detections"
      )

      UPDATE_REVEAL_CONFIGURATION = OperationModel.new(
        name: "UpdateRevealConfiguration",
        http_method: "PUT",
        request_uri: "/reveal-configuration"
      )

      UPDATE_SENSITIVITY_INSPECTION_TEMPLATE = OperationModel.new(
        name: "UpdateSensitivityInspectionTemplate",
        http_method: "PUT",
        request_uri: "/templates/sensitivity-inspections/{id}"
      )
    end
  end
end
