module Aws
  module QuickSight
    module Model
      API_VERSION = "2018-04-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "quicksight"
      ENDPOINT_PREFIX = "quicksight"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://quicksight-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://quicksight-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://quicksight.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://quicksight.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_TOPIC_REVIEWED_ANSWER = OperationModel.new(
        name: "BatchCreateTopicReviewedAnswer",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/batch-create-reviewed-answers"
      )

      BATCH_DELETE_TOPIC_REVIEWED_ANSWER = OperationModel.new(
        name: "BatchDeleteTopicReviewedAnswer",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/batch-delete-reviewed-answers"
      )

      CANCEL_INGESTION = OperationModel.new(
        name: "CancelIngestion",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
      )

      CREATE_ACCOUNT_CUSTOMIZATION = OperationModel.new(
        name: "CreateAccountCustomization",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/customizations"
      )

      CREATE_ACCOUNT_SUBSCRIPTION = OperationModel.new(
        name: "CreateAccountSubscription",
        http_method: "POST",
        request_uri: "/account/{AwsAccountId}"
      )

      CREATE_ACTION_CONNECTOR = OperationModel.new(
        name: "CreateActionConnector",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/action-connectors"
      )

      CREATE_ANALYSIS = OperationModel.new(
        name: "CreateAnalysis",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}"
      )

      CREATE_BRAND = OperationModel.new(
        name: "CreateBrand",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}"
      )

      CREATE_CUSTOM_PERMISSIONS = OperationModel.new(
        name: "CreateCustomPermissions",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/custom-permissions"
      )

      CREATE_DASHBOARD = OperationModel.new(
        name: "CreateDashboard",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}"
      )

      CREATE_DATA_SET = OperationModel.new(
        name: "CreateDataSet",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/data-sets"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/data-sources"
      )

      CREATE_FOLDER = OperationModel.new(
        name: "CreateFolder",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}"
      )

      CREATE_FOLDER_MEMBERSHIP = OperationModel.new(
        name: "CreateFolderMembership",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/members/{MemberType}/{MemberId}"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups"
      )

      CREATE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "CreateGroupMembership",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}"
      )

      CREATE_IAM_POLICY_ASSIGNMENT = OperationModel.new(
        name: "CreateIAMPolicyAssignment",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/"
      )

      CREATE_INGESTION = OperationModel.new(
        name: "CreateIngestion",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
      )

      CREATE_NAMESPACE = OperationModel.new(
        name: "CreateNamespace",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}"
      )

      CREATE_REFRESH_SCHEDULE = OperationModel.new(
        name: "CreateRefreshSchedule",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-schedules"
      )

      CREATE_ROLE_MEMBERSHIP = OperationModel.new(
        name: "CreateRoleMembership",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/members/{MemberName}"
      )

      CREATE_TEMPLATE = OperationModel.new(
        name: "CreateTemplate",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}"
      )

      CREATE_TEMPLATE_ALIAS = OperationModel.new(
        name: "CreateTemplateAlias",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
      )

      CREATE_THEME = OperationModel.new(
        name: "CreateTheme",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}"
      )

      CREATE_THEME_ALIAS = OperationModel.new(
        name: "CreateThemeAlias",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/aliases/{AliasName}"
      )

      CREATE_TOPIC = OperationModel.new(
        name: "CreateTopic",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/topics"
      )

      CREATE_TOPIC_REFRESH_SCHEDULE = OperationModel.new(
        name: "CreateTopicRefreshSchedule",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/schedules"
      )

      CREATE_VPC_CONNECTION = OperationModel.new(
        name: "CreateVPCConnection",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/vpc-connections"
      )

      DELETE_ACCOUNT_CUSTOM_PERMISSION = OperationModel.new(
        name: "DeleteAccountCustomPermission",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/custom-permission"
      )

      DELETE_ACCOUNT_CUSTOMIZATION = OperationModel.new(
        name: "DeleteAccountCustomization",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/customizations"
      )

      DELETE_ACCOUNT_SUBSCRIPTION = OperationModel.new(
        name: "DeleteAccountSubscription",
        http_method: "DELETE",
        request_uri: "/account/{AwsAccountId}"
      )

      DELETE_ACTION_CONNECTOR = OperationModel.new(
        name: "DeleteActionConnector",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/action-connectors/{ActionConnectorId}"
      )

      DELETE_ANALYSIS = OperationModel.new(
        name: "DeleteAnalysis",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}"
      )

      DELETE_BRAND = OperationModel.new(
        name: "DeleteBrand",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}"
      )

      DELETE_BRAND_ASSIGNMENT = OperationModel.new(
        name: "DeleteBrandAssignment",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/brandassignments"
      )

      DELETE_CUSTOM_PERMISSIONS = OperationModel.new(
        name: "DeleteCustomPermissions",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/custom-permissions/{CustomPermissionsName}"
      )

      DELETE_DASHBOARD = OperationModel.new(
        name: "DeleteDashboard",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}"
      )

      DELETE_DATA_SET = OperationModel.new(
        name: "DeleteDataSet",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}"
      )

      DELETE_DATA_SET_REFRESH_PROPERTIES = OperationModel.new(
        name: "DeleteDataSetRefreshProperties",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-properties"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
      )

      DELETE_DEFAULT_Q_BUSINESS_APPLICATION = OperationModel.new(
        name: "DeleteDefaultQBusinessApplication",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/default-qbusiness-application"
      )

      DELETE_FOLDER = OperationModel.new(
        name: "DeleteFolder",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}"
      )

      DELETE_FOLDER_MEMBERSHIP = OperationModel.new(
        name: "DeleteFolderMembership",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/members/{MemberType}/{MemberId}"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
      )

      DELETE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "DeleteGroupMembership",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}"
      )

      DELETE_IAM_POLICY_ASSIGNMENT = OperationModel.new(
        name: "DeleteIAMPolicyAssignment",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespace/{Namespace}/iam-policy-assignments/{AssignmentName}"
      )

      DELETE_IDENTITY_PROPAGATION_CONFIG = OperationModel.new(
        name: "DeleteIdentityPropagationConfig",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/identity-propagation-config/{Service}"
      )

      DELETE_NAMESPACE = OperationModel.new(
        name: "DeleteNamespace",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}"
      )

      DELETE_REFRESH_SCHEDULE = OperationModel.new(
        name: "DeleteRefreshSchedule",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-schedules/{ScheduleId}"
      )

      DELETE_ROLE_CUSTOM_PERMISSION = OperationModel.new(
        name: "DeleteRoleCustomPermission",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/custom-permission"
      )

      DELETE_ROLE_MEMBERSHIP = OperationModel.new(
        name: "DeleteRoleMembership",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/members/{MemberName}"
      )

      DELETE_TEMPLATE = OperationModel.new(
        name: "DeleteTemplate",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}"
      )

      DELETE_TEMPLATE_ALIAS = OperationModel.new(
        name: "DeleteTemplateAlias",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
      )

      DELETE_THEME = OperationModel.new(
        name: "DeleteTheme",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}"
      )

      DELETE_THEME_ALIAS = OperationModel.new(
        name: "DeleteThemeAlias",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/aliases/{AliasName}"
      )

      DELETE_TOPIC = OperationModel.new(
        name: "DeleteTopic",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}"
      )

      DELETE_TOPIC_REFRESH_SCHEDULE = OperationModel.new(
        name: "DeleteTopicRefreshSchedule",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/schedules/{DatasetId}"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
      )

      DELETE_USER_BY_PRINCIPAL_ID = OperationModel.new(
        name: "DeleteUserByPrincipalId",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/user-principals/{PrincipalId}"
      )

      DELETE_USER_CUSTOM_PERMISSION = OperationModel.new(
        name: "DeleteUserCustomPermission",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/custom-permission"
      )

      DELETE_VPC_CONNECTION = OperationModel.new(
        name: "DeleteVPCConnection",
        http_method: "DELETE",
        request_uri: "/accounts/{AwsAccountId}/vpc-connections/{VPCConnectionId}"
      )

      DESCRIBE_ACCOUNT_CUSTOM_PERMISSION = OperationModel.new(
        name: "DescribeAccountCustomPermission",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/custom-permission"
      )

      DESCRIBE_ACCOUNT_CUSTOMIZATION = OperationModel.new(
        name: "DescribeAccountCustomization",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/customizations"
      )

      DESCRIBE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "DescribeAccountSettings",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/settings"
      )

      DESCRIBE_ACCOUNT_SUBSCRIPTION = OperationModel.new(
        name: "DescribeAccountSubscription",
        http_method: "GET",
        request_uri: "/account/{AwsAccountId}"
      )

      DESCRIBE_ACTION_CONNECTOR = OperationModel.new(
        name: "DescribeActionConnector",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/action-connectors/{ActionConnectorId}"
      )

      DESCRIBE_ACTION_CONNECTOR_PERMISSIONS = OperationModel.new(
        name: "DescribeActionConnectorPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/action-connectors/{ActionConnectorId}/permissions"
      )

      DESCRIBE_ANALYSIS = OperationModel.new(
        name: "DescribeAnalysis",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}"
      )

      DESCRIBE_ANALYSIS_DEFINITION = OperationModel.new(
        name: "DescribeAnalysisDefinition",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}/definition"
      )

      DESCRIBE_ANALYSIS_PERMISSIONS = OperationModel.new(
        name: "DescribeAnalysisPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}/permissions"
      )

      DESCRIBE_ASSET_BUNDLE_EXPORT_JOB = OperationModel.new(
        name: "DescribeAssetBundleExportJob",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-export-jobs/{AssetBundleExportJobId}"
      )

      DESCRIBE_ASSET_BUNDLE_IMPORT_JOB = OperationModel.new(
        name: "DescribeAssetBundleImportJob",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-import-jobs/{AssetBundleImportJobId}"
      )

      DESCRIBE_BRAND = OperationModel.new(
        name: "DescribeBrand",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}"
      )

      DESCRIBE_BRAND_ASSIGNMENT = OperationModel.new(
        name: "DescribeBrandAssignment",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/brandassignments"
      )

      DESCRIBE_BRAND_PUBLISHED_VERSION = OperationModel.new(
        name: "DescribeBrandPublishedVersion",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}/publishedversion"
      )

      DESCRIBE_CUSTOM_PERMISSIONS = OperationModel.new(
        name: "DescribeCustomPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/custom-permissions/{CustomPermissionsName}"
      )

      DESCRIBE_DASHBOARD = OperationModel.new(
        name: "DescribeDashboard",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}"
      )

      DESCRIBE_DASHBOARD_DEFINITION = OperationModel.new(
        name: "DescribeDashboardDefinition",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/definition"
      )

      DESCRIBE_DASHBOARD_PERMISSIONS = OperationModel.new(
        name: "DescribeDashboardPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions"
      )

      DESCRIBE_DASHBOARD_SNAPSHOT_JOB = OperationModel.new(
        name: "DescribeDashboardSnapshotJob",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/snapshot-jobs/{SnapshotJobId}"
      )

      DESCRIBE_DASHBOARD_SNAPSHOT_JOB_RESULT = OperationModel.new(
        name: "DescribeDashboardSnapshotJobResult",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/snapshot-jobs/{SnapshotJobId}/result"
      )

      DESCRIBE_DASHBOARDS_QA_CONFIGURATION = OperationModel.new(
        name: "DescribeDashboardsQAConfiguration",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards-qa-configuration"
      )

      DESCRIBE_DATA_SET = OperationModel.new(
        name: "DescribeDataSet",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}"
      )

      DESCRIBE_DATA_SET_PERMISSIONS = OperationModel.new(
        name: "DescribeDataSetPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions"
      )

      DESCRIBE_DATA_SET_REFRESH_PROPERTIES = OperationModel.new(
        name: "DescribeDataSetRefreshProperties",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-properties"
      )

      DESCRIBE_DATA_SOURCE = OperationModel.new(
        name: "DescribeDataSource",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
      )

      DESCRIBE_DATA_SOURCE_PERMISSIONS = OperationModel.new(
        name: "DescribeDataSourcePermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions"
      )

      DESCRIBE_DEFAULT_Q_BUSINESS_APPLICATION = OperationModel.new(
        name: "DescribeDefaultQBusinessApplication",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/default-qbusiness-application"
      )

      DESCRIBE_FOLDER = OperationModel.new(
        name: "DescribeFolder",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}"
      )

      DESCRIBE_FOLDER_PERMISSIONS = OperationModel.new(
        name: "DescribeFolderPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/permissions"
      )

      DESCRIBE_FOLDER_RESOLVED_PERMISSIONS = OperationModel.new(
        name: "DescribeFolderResolvedPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/resolved-permissions"
      )

      DESCRIBE_GROUP = OperationModel.new(
        name: "DescribeGroup",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
      )

      DESCRIBE_GROUP_MEMBERSHIP = OperationModel.new(
        name: "DescribeGroupMembership",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}"
      )

      DESCRIBE_IAM_POLICY_ASSIGNMENT = OperationModel.new(
        name: "DescribeIAMPolicyAssignment",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}"
      )

      DESCRIBE_INGESTION = OperationModel.new(
        name: "DescribeIngestion",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
      )

      DESCRIBE_IP_RESTRICTION = OperationModel.new(
        name: "DescribeIpRestriction",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/ip-restriction"
      )

      DESCRIBE_KEY_REGISTRATION = OperationModel.new(
        name: "DescribeKeyRegistration",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/key-registration"
      )

      DESCRIBE_NAMESPACE = OperationModel.new(
        name: "DescribeNamespace",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}"
      )

      DESCRIBE_Q_PERSONALIZATION_CONFIGURATION = OperationModel.new(
        name: "DescribeQPersonalizationConfiguration",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/q-personalization-configuration"
      )

      DESCRIBE_QUICK_SIGHT_Q_SEARCH_CONFIGURATION = OperationModel.new(
        name: "DescribeQuickSightQSearchConfiguration",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/quicksight-q-search-configuration"
      )

      DESCRIBE_REFRESH_SCHEDULE = OperationModel.new(
        name: "DescribeRefreshSchedule",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-schedules/{ScheduleId}"
      )

      DESCRIBE_ROLE_CUSTOM_PERMISSION = OperationModel.new(
        name: "DescribeRoleCustomPermission",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/custom-permission"
      )

      DESCRIBE_SELF_UPGRADE_CONFIGURATION = OperationModel.new(
        name: "DescribeSelfUpgradeConfiguration",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/self-upgrade-configuration"
      )

      DESCRIBE_TEMPLATE = OperationModel.new(
        name: "DescribeTemplate",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}"
      )

      DESCRIBE_TEMPLATE_ALIAS = OperationModel.new(
        name: "DescribeTemplateAlias",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
      )

      DESCRIBE_TEMPLATE_DEFINITION = OperationModel.new(
        name: "DescribeTemplateDefinition",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/definition"
      )

      DESCRIBE_TEMPLATE_PERMISSIONS = OperationModel.new(
        name: "DescribeTemplatePermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/permissions"
      )

      DESCRIBE_THEME = OperationModel.new(
        name: "DescribeTheme",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}"
      )

      DESCRIBE_THEME_ALIAS = OperationModel.new(
        name: "DescribeThemeAlias",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/aliases/{AliasName}"
      )

      DESCRIBE_THEME_PERMISSIONS = OperationModel.new(
        name: "DescribeThemePermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/permissions"
      )

      DESCRIBE_TOPIC = OperationModel.new(
        name: "DescribeTopic",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}"
      )

      DESCRIBE_TOPIC_PERMISSIONS = OperationModel.new(
        name: "DescribeTopicPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/permissions"
      )

      DESCRIBE_TOPIC_REFRESH = OperationModel.new(
        name: "DescribeTopicRefresh",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/refresh/{RefreshId}"
      )

      DESCRIBE_TOPIC_REFRESH_SCHEDULE = OperationModel.new(
        name: "DescribeTopicRefreshSchedule",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/schedules/{DatasetId}"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
      )

      DESCRIBE_VPC_CONNECTION = OperationModel.new(
        name: "DescribeVPCConnection",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/vpc-connections/{VPCConnectionId}"
      )

      GENERATE_EMBED_URL_FOR_ANONYMOUS_USER = OperationModel.new(
        name: "GenerateEmbedUrlForAnonymousUser",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/embed-url/anonymous-user"
      )

      GENERATE_EMBED_URL_FOR_REGISTERED_USER = OperationModel.new(
        name: "GenerateEmbedUrlForRegisteredUser",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/embed-url/registered-user"
      )

      GENERATE_EMBED_URL_FOR_REGISTERED_USER_WITH_IDENTITY = OperationModel.new(
        name: "GenerateEmbedUrlForRegisteredUserWithIdentity",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/embed-url/registered-user-with-identity"
      )

      GET_DASHBOARD_EMBED_URL = OperationModel.new(
        name: "GetDashboardEmbedUrl",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/embed-url"
      )

      GET_FLOW_METADATA = OperationModel.new(
        name: "GetFlowMetadata",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/flows/{FlowId}/metadata"
      )

      GET_FLOW_PERMISSIONS = OperationModel.new(
        name: "GetFlowPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/flows/{FlowId}/permissions"
      )

      GET_IDENTITY_CONTEXT = OperationModel.new(
        name: "GetIdentityContext",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/identity-context"
      )

      GET_SESSION_EMBED_URL = OperationModel.new(
        name: "GetSessionEmbedUrl",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/session-embed-url"
      )

      LIST_ACTION_CONNECTORS = OperationModel.new(
        name: "ListActionConnectors",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/action-connectors"
      )

      LIST_ANALYSES = OperationModel.new(
        name: "ListAnalyses",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/analyses"
      )

      LIST_ASSET_BUNDLE_EXPORT_JOBS = OperationModel.new(
        name: "ListAssetBundleExportJobs",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-export-jobs"
      )

      LIST_ASSET_BUNDLE_IMPORT_JOBS = OperationModel.new(
        name: "ListAssetBundleImportJobs",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-import-jobs"
      )

      LIST_BRANDS = OperationModel.new(
        name: "ListBrands",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/brands"
      )

      LIST_CUSTOM_PERMISSIONS = OperationModel.new(
        name: "ListCustomPermissions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/custom-permissions"
      )

      LIST_DASHBOARD_VERSIONS = OperationModel.new(
        name: "ListDashboardVersions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions"
      )

      LIST_DASHBOARDS = OperationModel.new(
        name: "ListDashboards",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/dashboards"
      )

      LIST_DATA_SETS = OperationModel.new(
        name: "ListDataSets",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sources"
      )

      LIST_FLOWS = OperationModel.new(
        name: "ListFlows",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/flows"
      )

      LIST_FOLDER_MEMBERS = OperationModel.new(
        name: "ListFolderMembers",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/members"
      )

      LIST_FOLDERS = OperationModel.new(
        name: "ListFolders",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/folders"
      )

      LIST_FOLDERS_FOR_RESOURCE = OperationModel.new(
        name: "ListFoldersForResource",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/resource/{ResourceArn}/folders"
      )

      LIST_GROUP_MEMBERSHIPS = OperationModel.new(
        name: "ListGroupMemberships",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups"
      )

      LIST_IAM_POLICY_ASSIGNMENTS = OperationModel.new(
        name: "ListIAMPolicyAssignments",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/v2/iam-policy-assignments"
      )

      LIST_IAM_POLICY_ASSIGNMENTS_FOR_USER = OperationModel.new(
        name: "ListIAMPolicyAssignmentsForUser",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/iam-policy-assignments"
      )

      LIST_IDENTITY_PROPAGATION_CONFIGS = OperationModel.new(
        name: "ListIdentityPropagationConfigs",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/identity-propagation-config"
      )

      LIST_INGESTIONS = OperationModel.new(
        name: "ListIngestions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions"
      )

      LIST_NAMESPACES = OperationModel.new(
        name: "ListNamespaces",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces"
      )

      LIST_REFRESH_SCHEDULES = OperationModel.new(
        name: "ListRefreshSchedules",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-schedules"
      )

      LIST_ROLE_MEMBERSHIPS = OperationModel.new(
        name: "ListRoleMemberships",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/members"
      )

      LIST_SELF_UPGRADES = OperationModel.new(
        name: "ListSelfUpgrades",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/self-upgrade-requests"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/resources/{ResourceArn}/tags"
      )

      LIST_TEMPLATE_ALIASES = OperationModel.new(
        name: "ListTemplateAliases",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases"
      )

      LIST_TEMPLATE_VERSIONS = OperationModel.new(
        name: "ListTemplateVersions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/versions"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/templates"
      )

      LIST_THEME_ALIASES = OperationModel.new(
        name: "ListThemeAliases",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/aliases"
      )

      LIST_THEME_VERSIONS = OperationModel.new(
        name: "ListThemeVersions",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/versions"
      )

      LIST_THEMES = OperationModel.new(
        name: "ListThemes",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/themes"
      )

      LIST_TOPIC_REFRESH_SCHEDULES = OperationModel.new(
        name: "ListTopicRefreshSchedules",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/schedules"
      )

      LIST_TOPIC_REVIEWED_ANSWERS = OperationModel.new(
        name: "ListTopicReviewedAnswers",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/reviewed-answers"
      )

      LIST_TOPICS = OperationModel.new(
        name: "ListTopics",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/topics"
      )

      LIST_USER_GROUPS = OperationModel.new(
        name: "ListUserGroups",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/groups"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users"
      )

      LIST_VPC_CONNECTIONS = OperationModel.new(
        name: "ListVPCConnections",
        http_method: "GET",
        request_uri: "/accounts/{AwsAccountId}/vpc-connections"
      )

      PREDICT_QA_RESULTS = OperationModel.new(
        name: "PredictQAResults",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/qa/predict"
      )

      PUT_DATA_SET_REFRESH_PROPERTIES = OperationModel.new(
        name: "PutDataSetRefreshProperties",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-properties"
      )

      REGISTER_USER = OperationModel.new(
        name: "RegisterUser",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users"
      )

      RESTORE_ANALYSIS = OperationModel.new(
        name: "RestoreAnalysis",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/restore/analyses/{AnalysisId}"
      )

      SEARCH_ACTION_CONNECTORS = OperationModel.new(
        name: "SearchActionConnectors",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/action-connectors"
      )

      SEARCH_ANALYSES = OperationModel.new(
        name: "SearchAnalyses",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/analyses"
      )

      SEARCH_DASHBOARDS = OperationModel.new(
        name: "SearchDashboards",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/dashboards"
      )

      SEARCH_DATA_SETS = OperationModel.new(
        name: "SearchDataSets",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/data-sets"
      )

      SEARCH_DATA_SOURCES = OperationModel.new(
        name: "SearchDataSources",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/data-sources"
      )

      SEARCH_FLOWS = OperationModel.new(
        name: "SearchFlows",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/flows/searchFlows"
      )

      SEARCH_FOLDERS = OperationModel.new(
        name: "SearchFolders",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/folders"
      )

      SEARCH_GROUPS = OperationModel.new(
        name: "SearchGroups",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups-search"
      )

      SEARCH_TOPICS = OperationModel.new(
        name: "SearchTopics",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/search/topics"
      )

      START_ASSET_BUNDLE_EXPORT_JOB = OperationModel.new(
        name: "StartAssetBundleExportJob",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-export-jobs/export"
      )

      START_ASSET_BUNDLE_IMPORT_JOB = OperationModel.new(
        name: "StartAssetBundleImportJob",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/asset-bundle-import-jobs/import"
      )

      START_DASHBOARD_SNAPSHOT_JOB = OperationModel.new(
        name: "StartDashboardSnapshotJob",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/snapshot-jobs"
      )

      START_DASHBOARD_SNAPSHOT_JOB_SCHEDULE = OperationModel.new(
        name: "StartDashboardSnapshotJobSchedule",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/schedules/{ScheduleId}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/resources/{ResourceArn}/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/resources/{ResourceArn}/tags"
      )

      UPDATE_ACCOUNT_CUSTOM_PERMISSION = OperationModel.new(
        name: "UpdateAccountCustomPermission",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/custom-permission"
      )

      UPDATE_ACCOUNT_CUSTOMIZATION = OperationModel.new(
        name: "UpdateAccountCustomization",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/customizations"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/settings"
      )

      UPDATE_ACTION_CONNECTOR = OperationModel.new(
        name: "UpdateActionConnector",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/action-connectors/{ActionConnectorId}"
      )

      UPDATE_ACTION_CONNECTOR_PERMISSIONS = OperationModel.new(
        name: "UpdateActionConnectorPermissions",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/action-connectors/{ActionConnectorId}/permissions"
      )

      UPDATE_ANALYSIS = OperationModel.new(
        name: "UpdateAnalysis",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}"
      )

      UPDATE_ANALYSIS_PERMISSIONS = OperationModel.new(
        name: "UpdateAnalysisPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/analyses/{AnalysisId}/permissions"
      )

      UPDATE_APPLICATION_WITH_TOKEN_EXCHANGE_GRANT = OperationModel.new(
        name: "UpdateApplicationWithTokenExchangeGrant",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/application-with-token-exchange-grant"
      )

      UPDATE_BRAND = OperationModel.new(
        name: "UpdateBrand",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}"
      )

      UPDATE_BRAND_ASSIGNMENT = OperationModel.new(
        name: "UpdateBrandAssignment",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/brandassignments"
      )

      UPDATE_BRAND_PUBLISHED_VERSION = OperationModel.new(
        name: "UpdateBrandPublishedVersion",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/brands/{BrandId}/publishedversion"
      )

      UPDATE_CUSTOM_PERMISSIONS = OperationModel.new(
        name: "UpdateCustomPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/custom-permissions/{CustomPermissionsName}"
      )

      UPDATE_DASHBOARD = OperationModel.new(
        name: "UpdateDashboard",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}"
      )

      UPDATE_DASHBOARD_LINKS = OperationModel.new(
        name: "UpdateDashboardLinks",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/linked-entities"
      )

      UPDATE_DASHBOARD_PERMISSIONS = OperationModel.new(
        name: "UpdateDashboardPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions"
      )

      UPDATE_DASHBOARD_PUBLISHED_VERSION = OperationModel.new(
        name: "UpdateDashboardPublishedVersion",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions/{VersionNumber}"
      )

      UPDATE_DASHBOARDS_QA_CONFIGURATION = OperationModel.new(
        name: "UpdateDashboardsQAConfiguration",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/dashboards-qa-configuration"
      )

      UPDATE_DATA_SET = OperationModel.new(
        name: "UpdateDataSet",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}"
      )

      UPDATE_DATA_SET_PERMISSIONS = OperationModel.new(
        name: "UpdateDataSetPermissions",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
      )

      UPDATE_DATA_SOURCE_PERMISSIONS = OperationModel.new(
        name: "UpdateDataSourcePermissions",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions"
      )

      UPDATE_DEFAULT_Q_BUSINESS_APPLICATION = OperationModel.new(
        name: "UpdateDefaultQBusinessApplication",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/default-qbusiness-application"
      )

      UPDATE_FLOW_PERMISSIONS = OperationModel.new(
        name: "UpdateFlowPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/flows/{FlowId}/permissions"
      )

      UPDATE_FOLDER = OperationModel.new(
        name: "UpdateFolder",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}"
      )

      UPDATE_FOLDER_PERMISSIONS = OperationModel.new(
        name: "UpdateFolderPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/folders/{FolderId}/permissions"
      )

      UPDATE_GROUP = OperationModel.new(
        name: "UpdateGroup",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
      )

      UPDATE_IAM_POLICY_ASSIGNMENT = OperationModel.new(
        name: "UpdateIAMPolicyAssignment",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}"
      )

      UPDATE_IDENTITY_PROPAGATION_CONFIG = OperationModel.new(
        name: "UpdateIdentityPropagationConfig",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/identity-propagation-config/{Service}"
      )

      UPDATE_IP_RESTRICTION = OperationModel.new(
        name: "UpdateIpRestriction",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/ip-restriction"
      )

      UPDATE_KEY_REGISTRATION = OperationModel.new(
        name: "UpdateKeyRegistration",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/key-registration"
      )

      UPDATE_PUBLIC_SHARING_SETTINGS = OperationModel.new(
        name: "UpdatePublicSharingSettings",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/public-sharing-settings"
      )

      UPDATE_Q_PERSONALIZATION_CONFIGURATION = OperationModel.new(
        name: "UpdateQPersonalizationConfiguration",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/q-personalization-configuration"
      )

      UPDATE_QUICK_SIGHT_Q_SEARCH_CONFIGURATION = OperationModel.new(
        name: "UpdateQuickSightQSearchConfiguration",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/quicksight-q-search-configuration"
      )

      UPDATE_REFRESH_SCHEDULE = OperationModel.new(
        name: "UpdateRefreshSchedule",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/data-sets/{DataSetId}/refresh-schedules"
      )

      UPDATE_ROLE_CUSTOM_PERMISSION = OperationModel.new(
        name: "UpdateRoleCustomPermission",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/roles/{Role}/custom-permission"
      )

      UPDATE_SPICE_CAPACITY_CONFIGURATION = OperationModel.new(
        name: "UpdateSPICECapacityConfiguration",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/spice-capacity-configuration"
      )

      UPDATE_SELF_UPGRADE = OperationModel.new(
        name: "UpdateSelfUpgrade",
        http_method: "POST",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/update-self-upgrade-request"
      )

      UPDATE_SELF_UPGRADE_CONFIGURATION = OperationModel.new(
        name: "UpdateSelfUpgradeConfiguration",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/self-upgrade-configuration"
      )

      UPDATE_TEMPLATE = OperationModel.new(
        name: "UpdateTemplate",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}"
      )

      UPDATE_TEMPLATE_ALIAS = OperationModel.new(
        name: "UpdateTemplateAlias",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
      )

      UPDATE_TEMPLATE_PERMISSIONS = OperationModel.new(
        name: "UpdateTemplatePermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/templates/{TemplateId}/permissions"
      )

      UPDATE_THEME = OperationModel.new(
        name: "UpdateTheme",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}"
      )

      UPDATE_THEME_ALIAS = OperationModel.new(
        name: "UpdateThemeAlias",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/aliases/{AliasName}"
      )

      UPDATE_THEME_PERMISSIONS = OperationModel.new(
        name: "UpdateThemePermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/themes/{ThemeId}/permissions"
      )

      UPDATE_TOPIC = OperationModel.new(
        name: "UpdateTopic",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}"
      )

      UPDATE_TOPIC_PERMISSIONS = OperationModel.new(
        name: "UpdateTopicPermissions",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/permissions"
      )

      UPDATE_TOPIC_REFRESH_SCHEDULE = OperationModel.new(
        name: "UpdateTopicRefreshSchedule",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/topics/{TopicId}/schedules/{DatasetId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
      )

      UPDATE_USER_CUSTOM_PERMISSION = OperationModel.new(
        name: "UpdateUserCustomPermission",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/custom-permission"
      )

      UPDATE_VPC_CONNECTION = OperationModel.new(
        name: "UpdateVPCConnection",
        http_method: "PUT",
        request_uri: "/accounts/{AwsAccountId}/vpc-connections/{VPCConnectionId}"
      )
    end
  end
end
