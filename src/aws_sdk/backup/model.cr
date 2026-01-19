module AwsSdk
  module Backup
    module Model
      API_VERSION = "2018-11-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "backup"
      ENDPOINT_PREFIX = "backup"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://backup.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_BACKUP_VAULT_MPA_APPROVAL_TEAM = OperationModel.new(
        name: "AssociateBackupVaultMpaApprovalTeam",
        http_method: "PUT",
        request_uri: "/backup-vaults/{backupVaultName}/mpaApprovalTeam"
      )

      CANCEL_LEGAL_HOLD = OperationModel.new(
        name: "CancelLegalHold",
        http_method: "DELETE",
        request_uri: "/legal-holds/{legalHoldId}"
      )

      CREATE_BACKUP_PLAN = OperationModel.new(
        name: "CreateBackupPlan",
        http_method: "PUT",
        request_uri: "/backup/plans/"
      )

      CREATE_BACKUP_SELECTION = OperationModel.new(
        name: "CreateBackupSelection",
        http_method: "PUT",
        request_uri: "/backup/plans/{backupPlanId}/selections/"
      )

      CREATE_BACKUP_VAULT = OperationModel.new(
        name: "CreateBackupVault",
        http_method: "PUT",
        request_uri: "/backup-vaults/{backupVaultName}"
      )

      CREATE_FRAMEWORK = OperationModel.new(
        name: "CreateFramework",
        http_method: "POST",
        request_uri: "/audit/frameworks"
      )

      CREATE_LEGAL_HOLD = OperationModel.new(
        name: "CreateLegalHold",
        http_method: "POST",
        request_uri: "/legal-holds/"
      )

      CREATE_LOGICALLY_AIR_GAPPED_BACKUP_VAULT = OperationModel.new(
        name: "CreateLogicallyAirGappedBackupVault",
        http_method: "PUT",
        request_uri: "/logically-air-gapped-backup-vaults/{backupVaultName}"
      )

      CREATE_REPORT_PLAN = OperationModel.new(
        name: "CreateReportPlan",
        http_method: "POST",
        request_uri: "/audit/report-plans"
      )

      CREATE_RESTORE_ACCESS_BACKUP_VAULT = OperationModel.new(
        name: "CreateRestoreAccessBackupVault",
        http_method: "PUT",
        request_uri: "/restore-access-backup-vaults"
      )

      CREATE_RESTORE_TESTING_PLAN = OperationModel.new(
        name: "CreateRestoreTestingPlan",
        http_method: "PUT",
        request_uri: "/restore-testing/plans"
      )

      CREATE_RESTORE_TESTING_SELECTION = OperationModel.new(
        name: "CreateRestoreTestingSelection",
        http_method: "PUT",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}/selections"
      )

      CREATE_TIERING_CONFIGURATION = OperationModel.new(
        name: "CreateTieringConfiguration",
        http_method: "PUT",
        request_uri: "/tiering-configurations"
      )

      DELETE_BACKUP_PLAN = OperationModel.new(
        name: "DeleteBackupPlan",
        http_method: "DELETE",
        request_uri: "/backup/plans/{backupPlanId}"
      )

      DELETE_BACKUP_SELECTION = OperationModel.new(
        name: "DeleteBackupSelection",
        http_method: "DELETE",
        request_uri: "/backup/plans/{backupPlanId}/selections/{selectionId}"
      )

      DELETE_BACKUP_VAULT = OperationModel.new(
        name: "DeleteBackupVault",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}"
      )

      DELETE_BACKUP_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "DeleteBackupVaultAccessPolicy",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}/access-policy"
      )

      DELETE_BACKUP_VAULT_LOCK_CONFIGURATION = OperationModel.new(
        name: "DeleteBackupVaultLockConfiguration",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}/vault-lock"
      )

      DELETE_BACKUP_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "DeleteBackupVaultNotifications",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}/notification-configuration"
      )

      DELETE_FRAMEWORK = OperationModel.new(
        name: "DeleteFramework",
        http_method: "DELETE",
        request_uri: "/audit/frameworks/{frameworkName}"
      )

      DELETE_RECOVERY_POINT = OperationModel.new(
        name: "DeleteRecoveryPoint",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
      )

      DELETE_REPORT_PLAN = OperationModel.new(
        name: "DeleteReportPlan",
        http_method: "DELETE",
        request_uri: "/audit/report-plans/{reportPlanName}"
      )

      DELETE_RESTORE_TESTING_PLAN = OperationModel.new(
        name: "DeleteRestoreTestingPlan",
        http_method: "DELETE",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}"
      )

      DELETE_RESTORE_TESTING_SELECTION = OperationModel.new(
        name: "DeleteRestoreTestingSelection",
        http_method: "DELETE",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}/selections/{RestoreTestingSelectionName}"
      )

      DELETE_TIERING_CONFIGURATION = OperationModel.new(
        name: "DeleteTieringConfiguration",
        http_method: "DELETE",
        request_uri: "/tiering-configurations/{tieringConfigurationName}"
      )

      DESCRIBE_BACKUP_JOB = OperationModel.new(
        name: "DescribeBackupJob",
        http_method: "GET",
        request_uri: "/backup-jobs/{backupJobId}"
      )

      DESCRIBE_BACKUP_VAULT = OperationModel.new(
        name: "DescribeBackupVault",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}"
      )

      DESCRIBE_COPY_JOB = OperationModel.new(
        name: "DescribeCopyJob",
        http_method: "GET",
        request_uri: "/copy-jobs/{copyJobId}"
      )

      DESCRIBE_FRAMEWORK = OperationModel.new(
        name: "DescribeFramework",
        http_method: "GET",
        request_uri: "/audit/frameworks/{frameworkName}"
      )

      DESCRIBE_GLOBAL_SETTINGS = OperationModel.new(
        name: "DescribeGlobalSettings",
        http_method: "GET",
        request_uri: "/global-settings"
      )

      DESCRIBE_PROTECTED_RESOURCE = OperationModel.new(
        name: "DescribeProtectedResource",
        http_method: "GET",
        request_uri: "/resources/{resourceArn}"
      )

      DESCRIBE_RECOVERY_POINT = OperationModel.new(
        name: "DescribeRecoveryPoint",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
      )

      DESCRIBE_REGION_SETTINGS = OperationModel.new(
        name: "DescribeRegionSettings",
        http_method: "GET",
        request_uri: "/account-settings"
      )

      DESCRIBE_REPORT_JOB = OperationModel.new(
        name: "DescribeReportJob",
        http_method: "GET",
        request_uri: "/audit/report-jobs/{reportJobId}"
      )

      DESCRIBE_REPORT_PLAN = OperationModel.new(
        name: "DescribeReportPlan",
        http_method: "GET",
        request_uri: "/audit/report-plans/{reportPlanName}"
      )

      DESCRIBE_RESTORE_JOB = OperationModel.new(
        name: "DescribeRestoreJob",
        http_method: "GET",
        request_uri: "/restore-jobs/{restoreJobId}"
      )

      DESCRIBE_SCAN_JOB = OperationModel.new(
        name: "DescribeScanJob",
        http_method: "GET",
        request_uri: "/scan/jobs/{ScanJobId}"
      )

      DISASSOCIATE_BACKUP_VAULT_MPA_APPROVAL_TEAM = OperationModel.new(
        name: "DisassociateBackupVaultMpaApprovalTeam",
        http_method: "POST",
        request_uri: "/backup-vaults/{backupVaultName}/mpaApprovalTeam?delete"
      )

      DISASSOCIATE_RECOVERY_POINT = OperationModel.new(
        name: "DisassociateRecoveryPoint",
        http_method: "POST",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/disassociate"
      )

      DISASSOCIATE_RECOVERY_POINT_FROM_PARENT = OperationModel.new(
        name: "DisassociateRecoveryPointFromParent",
        http_method: "DELETE",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/parentAssociation"
      )

      EXPORT_BACKUP_PLAN_TEMPLATE = OperationModel.new(
        name: "ExportBackupPlanTemplate",
        http_method: "GET",
        request_uri: "/backup/plans/{backupPlanId}/toTemplate/"
      )

      GET_BACKUP_PLAN = OperationModel.new(
        name: "GetBackupPlan",
        http_method: "GET",
        request_uri: "/backup/plans/{backupPlanId}/"
      )

      GET_BACKUP_PLAN_FROM_JSON = OperationModel.new(
        name: "GetBackupPlanFromJSON",
        http_method: "POST",
        request_uri: "/backup/template/json/toPlan"
      )

      GET_BACKUP_PLAN_FROM_TEMPLATE = OperationModel.new(
        name: "GetBackupPlanFromTemplate",
        http_method: "GET",
        request_uri: "/backup/template/plans/{templateId}/toPlan"
      )

      GET_BACKUP_SELECTION = OperationModel.new(
        name: "GetBackupSelection",
        http_method: "GET",
        request_uri: "/backup/plans/{backupPlanId}/selections/{selectionId}"
      )

      GET_BACKUP_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "GetBackupVaultAccessPolicy",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/access-policy"
      )

      GET_BACKUP_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "GetBackupVaultNotifications",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/notification-configuration"
      )

      GET_LEGAL_HOLD = OperationModel.new(
        name: "GetLegalHold",
        http_method: "GET",
        request_uri: "/legal-holds/{legalHoldId}/"
      )

      GET_RECOVERY_POINT_INDEX_DETAILS = OperationModel.new(
        name: "GetRecoveryPointIndexDetails",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/index"
      )

      GET_RECOVERY_POINT_RESTORE_METADATA = OperationModel.new(
        name: "GetRecoveryPointRestoreMetadata",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/restore-metadata"
      )

      GET_RESTORE_JOB_METADATA = OperationModel.new(
        name: "GetRestoreJobMetadata",
        http_method: "GET",
        request_uri: "/restore-jobs/{restoreJobId}/metadata"
      )

      GET_RESTORE_TESTING_INFERRED_METADATA = OperationModel.new(
        name: "GetRestoreTestingInferredMetadata",
        http_method: "GET",
        request_uri: "/restore-testing/inferred-metadata"
      )

      GET_RESTORE_TESTING_PLAN = OperationModel.new(
        name: "GetRestoreTestingPlan",
        http_method: "GET",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}"
      )

      GET_RESTORE_TESTING_SELECTION = OperationModel.new(
        name: "GetRestoreTestingSelection",
        http_method: "GET",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}/selections/{RestoreTestingSelectionName}"
      )

      GET_SUPPORTED_RESOURCE_TYPES = OperationModel.new(
        name: "GetSupportedResourceTypes",
        http_method: "GET",
        request_uri: "/supported-resource-types"
      )

      GET_TIERING_CONFIGURATION = OperationModel.new(
        name: "GetTieringConfiguration",
        http_method: "GET",
        request_uri: "/tiering-configurations/{tieringConfigurationName}"
      )

      LIST_BACKUP_JOB_SUMMARIES = OperationModel.new(
        name: "ListBackupJobSummaries",
        http_method: "GET",
        request_uri: "/audit/backup-job-summaries"
      )

      LIST_BACKUP_JOBS = OperationModel.new(
        name: "ListBackupJobs",
        http_method: "GET",
        request_uri: "/backup-jobs/"
      )

      LIST_BACKUP_PLAN_TEMPLATES = OperationModel.new(
        name: "ListBackupPlanTemplates",
        http_method: "GET",
        request_uri: "/backup/template/plans"
      )

      LIST_BACKUP_PLAN_VERSIONS = OperationModel.new(
        name: "ListBackupPlanVersions",
        http_method: "GET",
        request_uri: "/backup/plans/{backupPlanId}/versions/"
      )

      LIST_BACKUP_PLANS = OperationModel.new(
        name: "ListBackupPlans",
        http_method: "GET",
        request_uri: "/backup/plans/"
      )

      LIST_BACKUP_SELECTIONS = OperationModel.new(
        name: "ListBackupSelections",
        http_method: "GET",
        request_uri: "/backup/plans/{backupPlanId}/selections/"
      )

      LIST_BACKUP_VAULTS = OperationModel.new(
        name: "ListBackupVaults",
        http_method: "GET",
        request_uri: "/backup-vaults/"
      )

      LIST_COPY_JOB_SUMMARIES = OperationModel.new(
        name: "ListCopyJobSummaries",
        http_method: "GET",
        request_uri: "/audit/copy-job-summaries"
      )

      LIST_COPY_JOBS = OperationModel.new(
        name: "ListCopyJobs",
        http_method: "GET",
        request_uri: "/copy-jobs/"
      )

      LIST_FRAMEWORKS = OperationModel.new(
        name: "ListFrameworks",
        http_method: "GET",
        request_uri: "/audit/frameworks"
      )

      LIST_INDEXED_RECOVERY_POINTS = OperationModel.new(
        name: "ListIndexedRecoveryPoints",
        http_method: "GET",
        request_uri: "/indexes/recovery-point/"
      )

      LIST_LEGAL_HOLDS = OperationModel.new(
        name: "ListLegalHolds",
        http_method: "GET",
        request_uri: "/legal-holds/"
      )

      LIST_PROTECTED_RESOURCES = OperationModel.new(
        name: "ListProtectedResources",
        http_method: "GET",
        request_uri: "/resources/"
      )

      LIST_PROTECTED_RESOURCES_BY_BACKUP_VAULT = OperationModel.new(
        name: "ListProtectedResourcesByBackupVault",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/resources/"
      )

      LIST_RECOVERY_POINTS_BY_BACKUP_VAULT = OperationModel.new(
        name: "ListRecoveryPointsByBackupVault",
        http_method: "GET",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/"
      )

      LIST_RECOVERY_POINTS_BY_LEGAL_HOLD = OperationModel.new(
        name: "ListRecoveryPointsByLegalHold",
        http_method: "GET",
        request_uri: "/legal-holds/{legalHoldId}/recovery-points"
      )

      LIST_RECOVERY_POINTS_BY_RESOURCE = OperationModel.new(
        name: "ListRecoveryPointsByResource",
        http_method: "GET",
        request_uri: "/resources/{resourceArn}/recovery-points/"
      )

      LIST_REPORT_JOBS = OperationModel.new(
        name: "ListReportJobs",
        http_method: "GET",
        request_uri: "/audit/report-jobs"
      )

      LIST_REPORT_PLANS = OperationModel.new(
        name: "ListReportPlans",
        http_method: "GET",
        request_uri: "/audit/report-plans"
      )

      LIST_RESTORE_ACCESS_BACKUP_VAULTS = OperationModel.new(
        name: "ListRestoreAccessBackupVaults",
        http_method: "GET",
        request_uri: "/logically-air-gapped-backup-vaults/{backupVaultName}/restore-access-backup-vaults/"
      )

      LIST_RESTORE_JOB_SUMMARIES = OperationModel.new(
        name: "ListRestoreJobSummaries",
        http_method: "GET",
        request_uri: "/audit/restore-job-summaries"
      )

      LIST_RESTORE_JOBS = OperationModel.new(
        name: "ListRestoreJobs",
        http_method: "GET",
        request_uri: "/restore-jobs/"
      )

      LIST_RESTORE_JOBS_BY_PROTECTED_RESOURCE = OperationModel.new(
        name: "ListRestoreJobsByProtectedResource",
        http_method: "GET",
        request_uri: "/resources/{resourceArn}/restore-jobs/"
      )

      LIST_RESTORE_TESTING_PLANS = OperationModel.new(
        name: "ListRestoreTestingPlans",
        http_method: "GET",
        request_uri: "/restore-testing/plans"
      )

      LIST_RESTORE_TESTING_SELECTIONS = OperationModel.new(
        name: "ListRestoreTestingSelections",
        http_method: "GET",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}/selections"
      )

      LIST_SCAN_JOB_SUMMARIES = OperationModel.new(
        name: "ListScanJobSummaries",
        http_method: "GET",
        request_uri: "/audit/scan-job-summaries"
      )

      LIST_SCAN_JOBS = OperationModel.new(
        name: "ListScanJobs",
        http_method: "GET",
        request_uri: "/scan/jobs"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}/"
      )

      LIST_TIERING_CONFIGURATIONS = OperationModel.new(
        name: "ListTieringConfigurations",
        http_method: "GET",
        request_uri: "/tiering-configurations/"
      )

      PUT_BACKUP_VAULT_ACCESS_POLICY = OperationModel.new(
        name: "PutBackupVaultAccessPolicy",
        http_method: "PUT",
        request_uri: "/backup-vaults/{backupVaultName}/access-policy"
      )

      PUT_BACKUP_VAULT_LOCK_CONFIGURATION = OperationModel.new(
        name: "PutBackupVaultLockConfiguration",
        http_method: "PUT",
        request_uri: "/backup-vaults/{backupVaultName}/vault-lock"
      )

      PUT_BACKUP_VAULT_NOTIFICATIONS = OperationModel.new(
        name: "PutBackupVaultNotifications",
        http_method: "PUT",
        request_uri: "/backup-vaults/{backupVaultName}/notification-configuration"
      )

      PUT_RESTORE_VALIDATION_RESULT = OperationModel.new(
        name: "PutRestoreValidationResult",
        http_method: "PUT",
        request_uri: "/restore-jobs/{restoreJobId}/validations"
      )

      REVOKE_RESTORE_ACCESS_BACKUP_VAULT = OperationModel.new(
        name: "RevokeRestoreAccessBackupVault",
        http_method: "DELETE",
        request_uri: "/logically-air-gapped-backup-vaults/{backupVaultName}/restore-access-backup-vaults/{restoreAccessBackupVaultArn}"
      )

      START_BACKUP_JOB = OperationModel.new(
        name: "StartBackupJob",
        http_method: "PUT",
        request_uri: "/backup-jobs"
      )

      START_COPY_JOB = OperationModel.new(
        name: "StartCopyJob",
        http_method: "PUT",
        request_uri: "/copy-jobs"
      )

      START_REPORT_JOB = OperationModel.new(
        name: "StartReportJob",
        http_method: "POST",
        request_uri: "/audit/report-jobs/{reportPlanName}"
      )

      START_RESTORE_JOB = OperationModel.new(
        name: "StartRestoreJob",
        http_method: "PUT",
        request_uri: "/restore-jobs"
      )

      START_SCAN_JOB = OperationModel.new(
        name: "StartScanJob",
        http_method: "PUT",
        request_uri: "/scan/job"
      )

      STOP_BACKUP_JOB = OperationModel.new(
        name: "StopBackupJob",
        http_method: "POST",
        request_uri: "/backup-jobs/{backupJobId}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untag/{resourceArn}"
      )

      UPDATE_BACKUP_PLAN = OperationModel.new(
        name: "UpdateBackupPlan",
        http_method: "POST",
        request_uri: "/backup/plans/{backupPlanId}"
      )

      UPDATE_FRAMEWORK = OperationModel.new(
        name: "UpdateFramework",
        http_method: "PUT",
        request_uri: "/audit/frameworks/{frameworkName}"
      )

      UPDATE_GLOBAL_SETTINGS = OperationModel.new(
        name: "UpdateGlobalSettings",
        http_method: "PUT",
        request_uri: "/global-settings"
      )

      UPDATE_RECOVERY_POINT_INDEX_SETTINGS = OperationModel.new(
        name: "UpdateRecoveryPointIndexSettings",
        http_method: "POST",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/index"
      )

      UPDATE_RECOVERY_POINT_LIFECYCLE = OperationModel.new(
        name: "UpdateRecoveryPointLifecycle",
        http_method: "POST",
        request_uri: "/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
      )

      UPDATE_REGION_SETTINGS = OperationModel.new(
        name: "UpdateRegionSettings",
        http_method: "PUT",
        request_uri: "/account-settings"
      )

      UPDATE_REPORT_PLAN = OperationModel.new(
        name: "UpdateReportPlan",
        http_method: "PUT",
        request_uri: "/audit/report-plans/{reportPlanName}"
      )

      UPDATE_RESTORE_TESTING_PLAN = OperationModel.new(
        name: "UpdateRestoreTestingPlan",
        http_method: "PUT",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}"
      )

      UPDATE_RESTORE_TESTING_SELECTION = OperationModel.new(
        name: "UpdateRestoreTestingSelection",
        http_method: "PUT",
        request_uri: "/restore-testing/plans/{RestoreTestingPlanName}/selections/{RestoreTestingSelectionName}"
      )

      UPDATE_TIERING_CONFIGURATION = OperationModel.new(
        name: "UpdateTieringConfiguration",
        http_method: "PUT",
        request_uri: "/tiering-configurations/{tieringConfigurationName}"
      )
    end
  end
end
