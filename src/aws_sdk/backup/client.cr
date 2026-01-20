module AwsSdk
  module Backup
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates an MPA approval team with a backup vault.

      def associate_backup_vault_mpa_approval_team(
        backup_vault_name : String,
        mpa_approval_team_arn : String,
        requester_comment : String? = nil
      ) : Protocol::Request
        input = Types::AssociateBackupVaultMpaApprovalTeamInput.new(backup_vault_name: backup_vault_name, mpa_approval_team_arn: mpa_approval_team_arn, requester_comment: requester_comment)
        associate_backup_vault_mpa_approval_team(input)
      end

      def associate_backup_vault_mpa_approval_team(input : Types::AssociateBackupVaultMpaApprovalTeamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_BACKUP_VAULT_MPA_APPROVAL_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified legal hold on a recovery point. This action can only be performed by a user
      # with sufficient permissions.

      def cancel_legal_hold(
        cancel_description : String,
        legal_hold_id : String,
        retain_record_in_days : Int64? = nil
      ) : Protocol::Request
        input = Types::CancelLegalHoldInput.new(cancel_description: cancel_description, legal_hold_id: legal_hold_id, retain_record_in_days: retain_record_in_days)
        cancel_legal_hold(input)
      end

      def cancel_legal_hold(input : Types::CancelLegalHoldInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_LEGAL_HOLD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a backup plan using a backup plan name and backup rules. A backup plan is a document that
      # contains information that Backup uses to schedule tasks that create recovery points for resources.
      # If you call CreateBackupPlan with a plan that already exists, you receive an AlreadyExistsException
      # exception.

      def create_backup_plan(
        backup_plan : Types::BackupPlanInput,
        backup_plan_tags : Hash(String, String)? = nil,
        creator_request_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackupPlanInput.new(backup_plan: backup_plan, backup_plan_tags: backup_plan_tags, creator_request_id: creator_request_id)
        create_backup_plan(input)
      end

      def create_backup_plan(input : Types::CreateBackupPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKUP_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a JSON document that specifies a set of resources to assign to a backup plan. For examples,
      # see Assigning resources programmatically .

      def create_backup_selection(
        backup_plan_id : String,
        backup_selection : Types::BackupSelection,
        creator_request_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackupSelectionInput.new(backup_plan_id: backup_plan_id, backup_selection: backup_selection, creator_request_id: creator_request_id)
        create_backup_selection(input)
      end

      def create_backup_selection(input : Types::CreateBackupSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKUP_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a logical container where backups are stored. A CreateBackupVault request includes a name,
      # optionally one or more resource tags, an encryption key, and a request ID. Do not include sensitive
      # data, such as passport numbers, in the name of a backup vault.

      def create_backup_vault(
        backup_vault_name : String,
        backup_vault_tags : Hash(String, String)? = nil,
        creator_request_id : String? = nil,
        encryption_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateBackupVaultInput.new(backup_vault_name: backup_vault_name, backup_vault_tags: backup_vault_tags, creator_request_id: creator_request_id, encryption_key_arn: encryption_key_arn)
        create_backup_vault(input)
      end

      def create_backup_vault(input : Types::CreateBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a framework with one or more controls. A framework is a collection of controls that you can
      # use to evaluate your backup practices. By using pre-built customizable controls to define your
      # policies, you can evaluate whether your backup practices comply with your policies and which
      # resources are not yet in compliance.

      def create_framework(
        framework_controls : Array(Types::FrameworkControl),
        framework_name : String,
        framework_description : String? = nil,
        framework_tags : Hash(String, String)? = nil,
        idempotency_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateFrameworkInput.new(framework_controls: framework_controls, framework_name: framework_name, framework_description: framework_description, framework_tags: framework_tags, idempotency_token: idempotency_token)
        create_framework(input)
      end

      def create_framework(input : Types::CreateFrameworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a legal hold on a recovery point (backup). A legal hold is a restraint on altering or
      # deleting a backup until an authorized user cancels the legal hold. Any actions to delete or
      # disassociate a recovery point will fail with an error if one or more active legal holds are on the
      # recovery point.

      def create_legal_hold(
        description : String,
        title : String,
        idempotency_token : String? = nil,
        recovery_point_selection : Types::RecoveryPointSelection? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLegalHoldInput.new(description: description, title: title, idempotency_token: idempotency_token, recovery_point_selection: recovery_point_selection, tags: tags)
        create_legal_hold(input)
      end

      def create_legal_hold(input : Types::CreateLegalHoldInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LEGAL_HOLD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a logical container to where backups may be copied. This request includes a name, the
      # Region, the maximum number of retention days, the minimum number of retention days, and optionally
      # can include tags and a creator request ID. Do not include sensitive data, such as passport numbers,
      # in the name of a backup vault.

      def create_logically_air_gapped_backup_vault(
        backup_vault_name : String,
        max_retention_days : Int64,
        min_retention_days : Int64,
        backup_vault_tags : Hash(String, String)? = nil,
        creator_request_id : String? = nil,
        encryption_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateLogicallyAirGappedBackupVaultInput.new(backup_vault_name: backup_vault_name, max_retention_days: max_retention_days, min_retention_days: min_retention_days, backup_vault_tags: backup_vault_tags, creator_request_id: creator_request_id, encryption_key_arn: encryption_key_arn)
        create_logically_air_gapped_backup_vault(input)
      end

      def create_logically_air_gapped_backup_vault(input : Types::CreateLogicallyAirGappedBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LOGICALLY_AIR_GAPPED_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a report plan. A report plan is a document that contains information about the contents of
      # the report and where Backup will deliver it. If you call CreateReportPlan with a plan that already
      # exists, you receive an AlreadyExistsException exception.

      def create_report_plan(
        report_delivery_channel : Types::ReportDeliveryChannel,
        report_plan_name : String,
        report_setting : Types::ReportSetting,
        idempotency_token : String? = nil,
        report_plan_description : String? = nil,
        report_plan_tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReportPlanInput.new(report_delivery_channel: report_delivery_channel, report_plan_name: report_plan_name, report_setting: report_setting, idempotency_token: idempotency_token, report_plan_description: report_plan_description, report_plan_tags: report_plan_tags)
        create_report_plan(input)
      end

      def create_report_plan(input : Types::CreateReportPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPORT_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a restore access backup vault that provides temporary access to recovery points in a
      # logically air-gapped backup vault, subject to MPA approval.

      def create_restore_access_backup_vault(
        source_backup_vault_arn : String,
        backup_vault_name : String? = nil,
        backup_vault_tags : Hash(String, String)? = nil,
        creator_request_id : String? = nil,
        requester_comment : String? = nil
      ) : Protocol::Request
        input = Types::CreateRestoreAccessBackupVaultInput.new(source_backup_vault_arn: source_backup_vault_arn, backup_vault_name: backup_vault_name, backup_vault_tags: backup_vault_tags, creator_request_id: creator_request_id, requester_comment: requester_comment)
        create_restore_access_backup_vault(input)
      end

      def create_restore_access_backup_vault(input : Types::CreateRestoreAccessBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESTORE_ACCESS_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a restore testing plan. The first of two steps to create a restore testing plan. After this
      # request is successful, finish the procedure using CreateRestoreTestingSelection.

      def create_restore_testing_plan(
        restore_testing_plan : Types::RestoreTestingPlanForCreate,
        creator_request_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRestoreTestingPlanInput.new(restore_testing_plan: restore_testing_plan, creator_request_id: creator_request_id, tags: tags)
        create_restore_testing_plan(input)
      end

      def create_restore_testing_plan(input : Types::CreateRestoreTestingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESTORE_TESTING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request can be sent after CreateRestoreTestingPlan request returns successfully. This is the
      # second part of creating a resource testing plan, and it must be completed sequentially. This
      # consists of RestoreTestingSelectionName , ProtectedResourceType , and one of the following:
      # ProtectedResourceArns ProtectedResourceConditions Each protected resource type can have one single
      # value. A restore testing selection can include a wildcard value ("*") for ProtectedResourceArns
      # along with ProtectedResourceConditions . Alternatively, you can include up to 30 specific protected
      # resource ARNs in ProtectedResourceArns . Cannot select by both protected resource types AND specific
      # ARNs. Request will fail if both are included.

      def create_restore_testing_selection(
        restore_testing_plan_name : String,
        restore_testing_selection : Types::RestoreTestingSelectionForCreate,
        creator_request_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateRestoreTestingSelectionInput.new(restore_testing_plan_name: restore_testing_plan_name, restore_testing_selection: restore_testing_selection, creator_request_id: creator_request_id)
        create_restore_testing_selection(input)
      end

      def create_restore_testing_selection(input : Types::CreateRestoreTestingSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESTORE_TESTING_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a tiering configuration. A tiering configuration enables automatic movement of backup data
      # to a lower-cost storage tier based on the age of backed-up objects in the backup vault. Each vault
      # can only have one vault-specific tiering configuration, in addition to any global configuration that
      # applies to all vaults.

      def create_tiering_configuration(
        tiering_configuration : Types::TieringConfigurationInputForCreate,
        creator_request_id : String? = nil,
        tiering_configuration_tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTieringConfigurationInput.new(tiering_configuration: tiering_configuration, creator_request_id: creator_request_id, tiering_configuration_tags: tiering_configuration_tags)
        create_tiering_configuration(input)
      end

      def create_tiering_configuration(input : Types::CreateTieringConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TIERING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a backup plan. A backup plan can only be deleted after all associated selections of
      # resources have been deleted. Deleting a backup plan deletes the current version of a backup plan.
      # Previous versions, if any, will still exist.

      def delete_backup_plan(
        backup_plan_id : String
      ) : Protocol::Request
        input = Types::DeleteBackupPlanInput.new(backup_plan_id: backup_plan_id)
        delete_backup_plan(input)
      end

      def delete_backup_plan(input : Types::DeleteBackupPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource selection associated with a backup plan that is specified by the SelectionId .

      def delete_backup_selection(
        backup_plan_id : String,
        selection_id : String
      ) : Protocol::Request
        input = Types::DeleteBackupSelectionInput.new(backup_plan_id: backup_plan_id, selection_id: selection_id)
        delete_backup_selection(input)
      end

      def delete_backup_selection(input : Types::DeleteBackupSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the backup vault identified by its name. A vault can be deleted only if it is empty.

      def delete_backup_vault(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::DeleteBackupVaultInput.new(backup_vault_name: backup_vault_name)
        delete_backup_vault(input)
      end

      def delete_backup_vault(input : Types::DeleteBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the policy document that manages permissions on a backup vault.

      def delete_backup_vault_access_policy(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::DeleteBackupVaultAccessPolicyInput.new(backup_vault_name: backup_vault_name)
        delete_backup_vault_access_policy(input)
      end

      def delete_backup_vault_access_policy(input : Types::DeleteBackupVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes Backup Vault Lock from a backup vault specified by a backup vault name. If the Vault Lock
      # configuration is immutable, then you cannot delete Vault Lock using API operations, and you will
      # receive an InvalidRequestException if you attempt to do so. For more information, see Vault Lock in
      # the Backup Developer Guide .

      def delete_backup_vault_lock_configuration(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::DeleteBackupVaultLockConfigurationInput.new(backup_vault_name: backup_vault_name)
        delete_backup_vault_lock_configuration(input)
      end

      def delete_backup_vault_lock_configuration(input : Types::DeleteBackupVaultLockConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_VAULT_LOCK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes event notifications for the specified backup vault.

      def delete_backup_vault_notifications(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::DeleteBackupVaultNotificationsInput.new(backup_vault_name: backup_vault_name)
        delete_backup_vault_notifications(input)
      end

      def delete_backup_vault_notifications(input : Types::DeleteBackupVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BACKUP_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the framework specified by a framework name.

      def delete_framework(
        framework_name : String
      ) : Protocol::Request
        input = Types::DeleteFrameworkInput.new(framework_name: framework_name)
        delete_framework(input)
      end

      def delete_framework(input : Types::DeleteFrameworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the recovery point specified by a recovery point ID. If the recovery point ID belongs to a
      # continuous backup, calling this endpoint deletes the existing continuous backup and stops future
      # continuous backup. When an IAM role's permissions are insufficient to call this API, the service
      # sends back an HTTP 200 response with an empty HTTP body, but the recovery point is not deleted.
      # Instead, it enters an EXPIRED state. EXPIRED recovery points can be deleted with this API once the
      # IAM role has the iam:CreateServiceLinkedRole action. To learn more about adding this role, see
      # Troubleshooting manual deletions . If the user or role is deleted or the permission within the role
      # is removed, the deletion will not be successful and will enter an EXPIRED state.

      def delete_recovery_point(
        backup_vault_name : String,
        recovery_point_arn : String
      ) : Protocol::Request
        input = Types::DeleteRecoveryPointInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn)
        delete_recovery_point(input)
      end

      def delete_recovery_point(input : Types::DeleteRecoveryPointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOVERY_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the report plan specified by a report plan name.

      def delete_report_plan(
        report_plan_name : String
      ) : Protocol::Request
        input = Types::DeleteReportPlanInput.new(report_plan_name: report_plan_name)
        delete_report_plan(input)
      end

      def delete_report_plan(input : Types::DeleteReportPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPORT_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request deletes the specified restore testing plan. Deletion can only successfully occur if all
      # associated restore testing selections are deleted first.

      def delete_restore_testing_plan(
        restore_testing_plan_name : String
      ) : Protocol::Request
        input = Types::DeleteRestoreTestingPlanInput.new(restore_testing_plan_name: restore_testing_plan_name)
        delete_restore_testing_plan(input)
      end

      def delete_restore_testing_plan(input : Types::DeleteRestoreTestingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESTORE_TESTING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Input the Restore Testing Plan name and Restore Testing Selection name. All testing selections
      # associated with a restore testing plan must be deleted before the restore testing plan can be
      # deleted.

      def delete_restore_testing_selection(
        restore_testing_plan_name : String,
        restore_testing_selection_name : String
      ) : Protocol::Request
        input = Types::DeleteRestoreTestingSelectionInput.new(restore_testing_plan_name: restore_testing_plan_name, restore_testing_selection_name: restore_testing_selection_name)
        delete_restore_testing_selection(input)
      end

      def delete_restore_testing_selection(input : Types::DeleteRestoreTestingSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESTORE_TESTING_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the tiering configuration specified by a tiering configuration name.

      def delete_tiering_configuration(
        tiering_configuration_name : String
      ) : Protocol::Request
        input = Types::DeleteTieringConfigurationInput.new(tiering_configuration_name: tiering_configuration_name)
        delete_tiering_configuration(input)
      end

      def delete_tiering_configuration(input : Types::DeleteTieringConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TIERING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns backup job details for the specified BackupJobId .

      def describe_backup_job(
        backup_job_id : String
      ) : Protocol::Request
        input = Types::DescribeBackupJobInput.new(backup_job_id: backup_job_id)
        describe_backup_job(input)
      end

      def describe_backup_job(input : Types::DescribeBackupJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BACKUP_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata about a backup vault specified by its name.

      def describe_backup_vault(
        backup_vault_name : String,
        backup_vault_account_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeBackupVaultInput.new(backup_vault_name: backup_vault_name, backup_vault_account_id: backup_vault_account_id)
        describe_backup_vault(input)
      end

      def describe_backup_vault(input : Types::DescribeBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata associated with creating a copy of a resource.

      def describe_copy_job(
        copy_job_id : String
      ) : Protocol::Request
        input = Types::DescribeCopyJobInput.new(copy_job_id: copy_job_id)
        describe_copy_job(input)
      end

      def describe_copy_job(input : Types::DescribeCopyJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COPY_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the framework details for the specified FrameworkName .

      def describe_framework(
        framework_name : String
      ) : Protocol::Request
        input = Types::DescribeFrameworkInput.new(framework_name: framework_name)
        describe_framework(input)
      end

      def describe_framework(input : Types::DescribeFrameworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes whether the Amazon Web Services account is opted in to cross-account backup. Returns an
      # error if the account is not a member of an Organizations organization. Example:
      # describe-global-settings --region us-west-2

      def describe_global_settings : Protocol::Request
        input = Types::DescribeGlobalSettingsInput.new
        describe_global_settings(input)
      end

      def describe_global_settings(input : Types::DescribeGlobalSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GLOBAL_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a saved resource, including the last time it was backed up, its Amazon
      # Resource Name (ARN), and the Amazon Web Services service type of the saved resource.

      def describe_protected_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DescribeProtectedResourceInput.new(resource_arn: resource_arn)
        describe_protected_resource(input)
      end

      def describe_protected_resource(input : Types::DescribeProtectedResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROTECTED_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata associated with a recovery point, including ID, status, encryption, and lifecycle.

      def describe_recovery_point(
        backup_vault_name : String,
        recovery_point_arn : String,
        backup_vault_account_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRecoveryPointInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn, backup_vault_account_id: backup_vault_account_id)
        describe_recovery_point(input)
      end

      def describe_recovery_point(input : Types::DescribeRecoveryPointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RECOVERY_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current service opt-in settings for the Region. If service opt-in is enabled for a
      # service, Backup tries to protect that service's resources in this Region, when the resource is
      # included in an on-demand backup or scheduled backup plan. Otherwise, Backup does not try to protect
      # that service's resources in this Region.

      def describe_region_settings : Protocol::Request
        input = Types::DescribeRegionSettingsInput.new
        describe_region_settings(input)
      end

      def describe_region_settings(input : Types::DescribeRegionSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REGION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details associated with creating a report as specified by its ReportJobId .

      def describe_report_job(
        report_job_id : String
      ) : Protocol::Request
        input = Types::DescribeReportJobInput.new(report_job_id: report_job_id)
        describe_report_job(input)
      end

      def describe_report_job(input : Types::DescribeReportJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all report plans for an Amazon Web Services account and Amazon Web Services
      # Region.

      def describe_report_plan(
        report_plan_name : String
      ) : Protocol::Request
        input = Types::DescribeReportPlanInput.new(report_plan_name: report_plan_name)
        describe_report_plan(input)
      end

      def describe_report_plan(input : Types::DescribeReportPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPORT_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata associated with a restore job that is specified by a job ID.

      def describe_restore_job(
        restore_job_id : String
      ) : Protocol::Request
        input = Types::DescribeRestoreJobInput.new(restore_job_id: restore_job_id)
        describe_restore_job(input)
      end

      def describe_restore_job(input : Types::DescribeRestoreJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESTORE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns scan job details for the specified ScanJobID.

      def describe_scan_job(
        scan_job_id : String
      ) : Protocol::Request
        input = Types::DescribeScanJobInput.new(scan_job_id: scan_job_id)
        describe_scan_job(input)
      end

      def describe_scan_job(input : Types::DescribeScanJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCAN_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between an MPA approval team and a backup vault, disabling the MPA approval
      # workflow for restore operations.

      def disassociate_backup_vault_mpa_approval_team(
        backup_vault_name : String,
        requester_comment : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateBackupVaultMpaApprovalTeamInput.new(backup_vault_name: backup_vault_name, requester_comment: requester_comment)
        disassociate_backup_vault_mpa_approval_team(input)
      end

      def disassociate_backup_vault_mpa_approval_team(input : Types::DisassociateBackupVaultMpaApprovalTeamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_BACKUP_VAULT_MPA_APPROVAL_TEAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified continuous backup recovery point from Backup and releases control of that
      # continuous backup to the source service, such as Amazon RDS. The source service will continue to
      # create and retain continuous backups using the lifecycle that you specified in your original backup
      # plan. Does not support snapshot backup recovery points.

      def disassociate_recovery_point(
        backup_vault_name : String,
        recovery_point_arn : String
      ) : Protocol::Request
        input = Types::DisassociateRecoveryPointInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn)
        disassociate_recovery_point(input)
      end

      def disassociate_recovery_point(input : Types::DisassociateRecoveryPointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RECOVERY_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action to a specific child (nested) recovery point removes the relationship between the
      # specified recovery point and its parent (composite) recovery point.

      def disassociate_recovery_point_from_parent(
        backup_vault_name : String,
        recovery_point_arn : String
      ) : Protocol::Request
        input = Types::DisassociateRecoveryPointFromParentInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn)
        disassociate_recovery_point_from_parent(input)
      end

      def disassociate_recovery_point_from_parent(input : Types::DisassociateRecoveryPointFromParentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RECOVERY_POINT_FROM_PARENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the backup plan that is specified by the plan ID as a backup template.

      def export_backup_plan_template(
        backup_plan_id : String
      ) : Protocol::Request
        input = Types::ExportBackupPlanTemplateInput.new(backup_plan_id: backup_plan_id)
        export_backup_plan_template(input)
      end

      def export_backup_plan_template(input : Types::ExportBackupPlanTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_BACKUP_PLAN_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns BackupPlan details for the specified BackupPlanId . The details are the body of a backup
      # plan in JSON format, in addition to plan metadata.

      def get_backup_plan(
        backup_plan_id : String,
        max_scheduled_runs_preview : Int32? = nil,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::GetBackupPlanInput.new(backup_plan_id: backup_plan_id, max_scheduled_runs_preview: max_scheduled_runs_preview, version_id: version_id)
        get_backup_plan(input)
      end

      def get_backup_plan(input : Types::GetBackupPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a valid JSON document specifying a backup plan or an error.

      def get_backup_plan_from_json(
        backup_plan_template_json : String
      ) : Protocol::Request
        input = Types::GetBackupPlanFromJSONInput.new(backup_plan_template_json: backup_plan_template_json)
        get_backup_plan_from_json(input)
      end

      def get_backup_plan_from_json(input : Types::GetBackupPlanFromJSONInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_PLAN_FROM_JSON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the template specified by its templateId as a backup plan.

      def get_backup_plan_from_template(
        backup_plan_template_id : String
      ) : Protocol::Request
        input = Types::GetBackupPlanFromTemplateInput.new(backup_plan_template_id: backup_plan_template_id)
        get_backup_plan_from_template(input)
      end

      def get_backup_plan_from_template(input : Types::GetBackupPlanFromTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_PLAN_FROM_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns selection metadata and a document in JSON format that specifies a list of resources that are
      # associated with a backup plan.

      def get_backup_selection(
        backup_plan_id : String,
        selection_id : String
      ) : Protocol::Request
        input = Types::GetBackupSelectionInput.new(backup_plan_id: backup_plan_id, selection_id: selection_id)
        get_backup_selection(input)
      end

      def get_backup_selection(input : Types::GetBackupSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the access policy document that is associated with the named backup vault.

      def get_backup_vault_access_policy(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::GetBackupVaultAccessPolicyInput.new(backup_vault_name: backup_vault_name)
        get_backup_vault_access_policy(input)
      end

      def get_backup_vault_access_policy(input : Types::GetBackupVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns event notifications for the specified backup vault.

      def get_backup_vault_notifications(
        backup_vault_name : String
      ) : Protocol::Request
        input = Types::GetBackupVaultNotificationsInput.new(backup_vault_name: backup_vault_name)
        get_backup_vault_notifications(input)
      end

      def get_backup_vault_notifications(input : Types::GetBackupVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BACKUP_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action returns details for a specified legal hold. The details are the body of a legal hold in
      # JSON format, in addition to metadata.

      def get_legal_hold(
        legal_hold_id : String
      ) : Protocol::Request
        input = Types::GetLegalHoldInput.new(legal_hold_id: legal_hold_id)
        get_legal_hold(input)
      end

      def get_legal_hold(input : Types::GetLegalHoldInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LEGAL_HOLD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns the metadata and details specific to the backup index associated with the
      # specified recovery point.

      def get_recovery_point_index_details(
        backup_vault_name : String,
        recovery_point_arn : String
      ) : Protocol::Request
        input = Types::GetRecoveryPointIndexDetailsInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn)
        get_recovery_point_index_details(input)
      end

      def get_recovery_point_index_details(input : Types::GetRecoveryPointIndexDetailsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOVERY_POINT_INDEX_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a set of metadata key-value pairs that were used to create the backup.

      def get_recovery_point_restore_metadata(
        backup_vault_name : String,
        recovery_point_arn : String,
        backup_vault_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetRecoveryPointRestoreMetadataInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn, backup_vault_account_id: backup_vault_account_id)
        get_recovery_point_restore_metadata(input)
      end

      def get_recovery_point_restore_metadata(input : Types::GetRecoveryPointRestoreMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOVERY_POINT_RESTORE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request returns the metadata for the specified restore job.

      def get_restore_job_metadata(
        restore_job_id : String
      ) : Protocol::Request
        input = Types::GetRestoreJobMetadataInput.new(restore_job_id: restore_job_id)
        get_restore_job_metadata(input)
      end

      def get_restore_job_metadata(input : Types::GetRestoreJobMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESTORE_JOB_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request returns the minimal required set of metadata needed to start a restore job with secure
      # default settings. BackupVaultName and RecoveryPointArn are required parameters. BackupVaultAccountId
      # is an optional parameter.

      def get_restore_testing_inferred_metadata(
        backup_vault_name : String,
        recovery_point_arn : String,
        backup_vault_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetRestoreTestingInferredMetadataInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn, backup_vault_account_id: backup_vault_account_id)
        get_restore_testing_inferred_metadata(input)
      end

      def get_restore_testing_inferred_metadata(input : Types::GetRestoreTestingInferredMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESTORE_TESTING_INFERRED_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns RestoreTestingPlan details for the specified RestoreTestingPlanName . The details are the
      # body of a restore testing plan in JSON format, in addition to plan metadata.

      def get_restore_testing_plan(
        restore_testing_plan_name : String
      ) : Protocol::Request
        input = Types::GetRestoreTestingPlanInput.new(restore_testing_plan_name: restore_testing_plan_name)
        get_restore_testing_plan(input)
      end

      def get_restore_testing_plan(input : Types::GetRestoreTestingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESTORE_TESTING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns RestoreTestingSelection, which displays resources and elements of the restore testing plan.

      def get_restore_testing_selection(
        restore_testing_plan_name : String,
        restore_testing_selection_name : String
      ) : Protocol::Request
        input = Types::GetRestoreTestingSelectionInput.new(restore_testing_plan_name: restore_testing_plan_name, restore_testing_selection_name: restore_testing_selection_name)
        get_restore_testing_selection(input)
      end

      def get_restore_testing_selection(input : Types::GetRestoreTestingSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESTORE_TESTING_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the Amazon Web Services resource types supported by Backup.


      def get_supported_resource_types : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUPPORTED_RESOURCE_TYPES, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns TieringConfiguration details for the specified TieringConfigurationName . The details are
      # the body of a tiering configuration in JSON format, in addition to configuration metadata.

      def get_tiering_configuration(
        tiering_configuration_name : String
      ) : Protocol::Request
        input = Types::GetTieringConfigurationInput.new(tiering_configuration_name: tiering_configuration_name)
        get_tiering_configuration(input)
      end

      def get_tiering_configuration(input : Types::GetTieringConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TIERING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This is a request for a summary of backup jobs created or running within the most recent 30 days.
      # You can include parameters AccountID, State, ResourceType, MessageCategory, AggregationPeriod,
      # MaxResults, or NextToken to filter results. This request returns a summary that contains Region,
      # Account, State, ResourceType, MessageCategory, StartTime, EndTime, and Count of included jobs.

      def list_backup_job_summaries(
        account_id : String? = nil,
        aggregation_period : String? = nil,
        max_results : Int32? = nil,
        message_category : String? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupJobSummariesInput.new(account_id: account_id, aggregation_period: aggregation_period, max_results: max_results, message_category: message_category, next_token: next_token, resource_type: resource_type, state: state)
        list_backup_job_summaries(input)
      end

      def list_backup_job_summaries(input : Types::ListBackupJobSummariesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_JOB_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing backup jobs for an authenticated account for the last 30 days. For a
      # longer period of time, consider using these monitoring tools .

      def list_backup_jobs(
        by_account_id : String? = nil,
        by_backup_vault_name : String? = nil,
        by_complete_after : Time? = nil,
        by_complete_before : Time? = nil,
        by_created_after : Time? = nil,
        by_created_before : Time? = nil,
        by_message_category : String? = nil,
        by_parent_job_id : String? = nil,
        by_resource_arn : String? = nil,
        by_resource_type : String? = nil,
        by_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupJobsInput.new(by_account_id: by_account_id, by_backup_vault_name: by_backup_vault_name, by_complete_after: by_complete_after, by_complete_before: by_complete_before, by_created_after: by_created_after, by_created_before: by_created_before, by_message_category: by_message_category, by_parent_job_id: by_parent_job_id, by_resource_arn: by_resource_arn, by_resource_type: by_resource_type, by_state: by_state, max_results: max_results, next_token: next_token)
        list_backup_jobs(input)
      end

      def list_backup_jobs(input : Types::ListBackupJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the backup plan templates.

      def list_backup_plan_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupPlanTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_backup_plan_templates(input)
      end

      def list_backup_plan_templates(input : Types::ListBackupPlanTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_PLAN_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns version metadata of your backup plans, including Amazon Resource Names (ARNs), backup plan
      # IDs, creation and deletion dates, plan names, and version IDs.

      def list_backup_plan_versions(
        backup_plan_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupPlanVersionsInput.new(backup_plan_id: backup_plan_id, max_results: max_results, next_token: next_token)
        list_backup_plan_versions(input)
      end

      def list_backup_plan_versions(input : Types::ListBackupPlanVersionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_PLAN_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the active backup plans for the account.

      def list_backup_plans(
        include_deleted : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupPlansInput.new(include_deleted: include_deleted, max_results: max_results, next_token: next_token)
        list_backup_plans(input)
      end

      def list_backup_plans(input : Types::ListBackupPlansInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array containing metadata of the resources associated with the target backup plan.

      def list_backup_selections(
        backup_plan_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupSelectionsInput.new(backup_plan_id: backup_plan_id, max_results: max_results, next_token: next_token)
        list_backup_selections(input)
      end

      def list_backup_selections(input : Types::ListBackupSelectionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_SELECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of recovery point storage containers along with information about them.

      def list_backup_vaults(
        by_shared : Bool? = nil,
        by_vault_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBackupVaultsInput.new(by_shared: by_shared, by_vault_type: by_vault_type, max_results: max_results, next_token: next_token)
        list_backup_vaults(input)
      end

      def list_backup_vaults(input : Types::ListBackupVaultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BACKUP_VAULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request obtains a list of copy jobs created or running within the the most recent 30 days. You
      # can include parameters AccountID, State, ResourceType, MessageCategory, AggregationPeriod,
      # MaxResults, or NextToken to filter results. This request returns a summary that contains Region,
      # Account, State, RestourceType, MessageCategory, StartTime, EndTime, and Count of included jobs.

      def list_copy_job_summaries(
        account_id : String? = nil,
        aggregation_period : String? = nil,
        max_results : Int32? = nil,
        message_category : String? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListCopyJobSummariesInput.new(account_id: account_id, aggregation_period: aggregation_period, max_results: max_results, message_category: message_category, next_token: next_token, resource_type: resource_type, state: state)
        list_copy_job_summaries(input)
      end

      def list_copy_job_summaries(input : Types::ListCopyJobSummariesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COPY_JOB_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata about your copy jobs.

      def list_copy_jobs(
        by_account_id : String? = nil,
        by_complete_after : Time? = nil,
        by_complete_before : Time? = nil,
        by_created_after : Time? = nil,
        by_created_before : Time? = nil,
        by_destination_vault_arn : String? = nil,
        by_message_category : String? = nil,
        by_parent_job_id : String? = nil,
        by_resource_arn : String? = nil,
        by_resource_type : String? = nil,
        by_source_recovery_point_arn : String? = nil,
        by_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCopyJobsInput.new(by_account_id: by_account_id, by_complete_after: by_complete_after, by_complete_before: by_complete_before, by_created_after: by_created_after, by_created_before: by_created_before, by_destination_vault_arn: by_destination_vault_arn, by_message_category: by_message_category, by_parent_job_id: by_parent_job_id, by_resource_arn: by_resource_arn, by_resource_type: by_resource_type, by_source_recovery_point_arn: by_source_recovery_point_arn, by_state: by_state, max_results: max_results, next_token: next_token)
        list_copy_jobs(input)
      end

      def list_copy_jobs(input : Types::ListCopyJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COPY_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all frameworks for an Amazon Web Services account and Amazon Web Services Region.

      def list_frameworks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFrameworksInput.new(max_results: max_results, next_token: next_token)
        list_frameworks(input)
      end

      def list_frameworks(input : Types::ListFrameworksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FRAMEWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of recovery points that have an associated index, belonging to the
      # specified account. Optional parameters you can include are: MaxResults; NextToken;
      # SourceResourceArns; CreatedBefore; CreatedAfter; and ResourceType.

      def list_indexed_recovery_points(
        created_after : Time? = nil,
        created_before : Time? = nil,
        index_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        source_resource_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListIndexedRecoveryPointsInput.new(created_after: created_after, created_before: created_before, index_status: index_status, max_results: max_results, next_token: next_token, resource_type: resource_type, source_resource_arn: source_resource_arn)
        list_indexed_recovery_points(input)
      end

      def list_indexed_recovery_points(input : Types::ListIndexedRecoveryPointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDEXED_RECOVERY_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action returns metadata about active and previous legal holds.

      def list_legal_holds(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLegalHoldsInput.new(max_results: max_results, next_token: next_token)
        list_legal_holds(input)
      end

      def list_legal_holds(input : Types::ListLegalHoldsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LEGAL_HOLDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array of resources successfully backed up by Backup, including the time the resource was
      # saved, an Amazon Resource Name (ARN) of the resource, and a resource type.

      def list_protected_resources(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProtectedResourcesInput.new(max_results: max_results, next_token: next_token)
        list_protected_resources(input)
      end

      def list_protected_resources(input : Types::ListProtectedResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROTECTED_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request lists the protected resources corresponding to each backup vault.

      def list_protected_resources_by_backup_vault(
        backup_vault_name : String,
        backup_vault_account_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProtectedResourcesByBackupVaultInput.new(backup_vault_name: backup_vault_name, backup_vault_account_id: backup_vault_account_id, max_results: max_results, next_token: next_token)
        list_protected_resources_by_backup_vault(input)
      end

      def list_protected_resources_by_backup_vault(input : Types::ListProtectedResourcesByBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROTECTED_RESOURCES_BY_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about the recovery points stored in a backup vault.

      def list_recovery_points_by_backup_vault(
        backup_vault_name : String,
        backup_vault_account_id : String? = nil,
        by_backup_plan_id : String? = nil,
        by_created_after : Time? = nil,
        by_created_before : Time? = nil,
        by_parent_recovery_point_arn : String? = nil,
        by_resource_arn : String? = nil,
        by_resource_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecoveryPointsByBackupVaultInput.new(backup_vault_name: backup_vault_name, backup_vault_account_id: backup_vault_account_id, by_backup_plan_id: by_backup_plan_id, by_created_after: by_created_after, by_created_before: by_created_before, by_parent_recovery_point_arn: by_parent_recovery_point_arn, by_resource_arn: by_resource_arn, by_resource_type: by_resource_type, max_results: max_results, next_token: next_token)
        list_recovery_points_by_backup_vault(input)
      end

      def list_recovery_points_by_backup_vault(input : Types::ListRecoveryPointsByBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOVERY_POINTS_BY_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action returns recovery point ARNs (Amazon Resource Names) of the specified legal hold.

      def list_recovery_points_by_legal_hold(
        legal_hold_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecoveryPointsByLegalHoldInput.new(legal_hold_id: legal_hold_id, max_results: max_results, next_token: next_token)
        list_recovery_points_by_legal_hold(input)
      end

      def list_recovery_points_by_legal_hold(input : Types::ListRecoveryPointsByLegalHoldInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOVERY_POINTS_BY_LEGAL_HOLD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The information about the recovery points of the type specified by a resource Amazon Resource Name
      # (ARN). For Amazon EFS and Amazon EC2, this action only lists recovery points created by Backup.

      def list_recovery_points_by_resource(
        resource_arn : String,
        managed_by_aws_backup_only : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecoveryPointsByResourceInput.new(resource_arn: resource_arn, managed_by_aws_backup_only: managed_by_aws_backup_only, max_results: max_results, next_token: next_token)
        list_recovery_points_by_resource(input)
      end

      def list_recovery_points_by_resource(input : Types::ListRecoveryPointsByResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOVERY_POINTS_BY_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about your report jobs.

      def list_report_jobs(
        by_creation_after : Time? = nil,
        by_creation_before : Time? = nil,
        by_report_plan_name : String? = nil,
        by_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReportJobsInput.new(by_creation_after: by_creation_after, by_creation_before: by_creation_before, by_report_plan_name: by_report_plan_name, by_status: by_status, max_results: max_results, next_token: next_token)
        list_report_jobs(input)
      end

      def list_report_jobs(input : Types::ListReportJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of your report plans. For detailed information about a single report plan, use
      # DescribeReportPlan .

      def list_report_plans(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReportPlansInput.new(max_results: max_results, next_token: next_token)
        list_report_plans(input)
      end

      def list_report_plans(input : Types::ListReportPlansInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPORT_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of restore access backup vaults associated with a specified backup vault.

      def list_restore_access_backup_vaults(
        backup_vault_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreAccessBackupVaultsInput.new(backup_vault_name: backup_vault_name, max_results: max_results, next_token: next_token)
        list_restore_access_backup_vaults(input)
      end

      def list_restore_access_backup_vaults(input : Types::ListRestoreAccessBackupVaultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_ACCESS_BACKUP_VAULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request obtains a summary of restore jobs created or running within the the most recent 30
      # days. You can include parameters AccountID, State, ResourceType, AggregationPeriod, MaxResults, or
      # NextToken to filter results. This request returns a summary that contains Region, Account, State,
      # RestourceType, MessageCategory, StartTime, EndTime, and Count of included jobs.

      def list_restore_job_summaries(
        account_id : String? = nil,
        aggregation_period : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreJobSummariesInput.new(account_id: account_id, aggregation_period: aggregation_period, max_results: max_results, next_token: next_token, resource_type: resource_type, state: state)
        list_restore_job_summaries(input)
      end

      def list_restore_job_summaries(input : Types::ListRestoreJobSummariesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_JOB_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of jobs that Backup initiated to restore a saved resource, including details about
      # the recovery process.

      def list_restore_jobs(
        by_account_id : String? = nil,
        by_complete_after : Time? = nil,
        by_complete_before : Time? = nil,
        by_created_after : Time? = nil,
        by_created_before : Time? = nil,
        by_parent_job_id : String? = nil,
        by_resource_type : String? = nil,
        by_restore_testing_plan_arn : String? = nil,
        by_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreJobsInput.new(by_account_id: by_account_id, by_complete_after: by_complete_after, by_complete_before: by_complete_before, by_created_after: by_created_after, by_created_before: by_created_before, by_parent_job_id: by_parent_job_id, by_resource_type: by_resource_type, by_restore_testing_plan_arn: by_restore_testing_plan_arn, by_status: by_status, max_results: max_results, next_token: next_token)
        list_restore_jobs(input)
      end

      def list_restore_jobs(input : Types::ListRestoreJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This returns restore jobs that contain the specified protected resource. You must include
      # ResourceArn . You can optionally include NextToken , ByStatus , MaxResults ,
      # ByRecoveryPointCreationDateAfter , and ByRecoveryPointCreationDateBefore .

      def list_restore_jobs_by_protected_resource(
        resource_arn : String,
        by_recovery_point_creation_date_after : Time? = nil,
        by_recovery_point_creation_date_before : Time? = nil,
        by_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreJobsByProtectedResourceInput.new(resource_arn: resource_arn, by_recovery_point_creation_date_after: by_recovery_point_creation_date_after, by_recovery_point_creation_date_before: by_recovery_point_creation_date_before, by_status: by_status, max_results: max_results, next_token: next_token)
        list_restore_jobs_by_protected_resource(input)
      end

      def list_restore_jobs_by_protected_resource(input : Types::ListRestoreJobsByProtectedResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_JOBS_BY_PROTECTED_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of restore testing plans.

      def list_restore_testing_plans(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreTestingPlansInput.new(max_results: max_results, next_token: next_token)
        list_restore_testing_plans(input)
      end

      def list_restore_testing_plans(input : Types::ListRestoreTestingPlansInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_TESTING_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of restore testing selections. Can be filtered by MaxResults and
      # RestoreTestingPlanName .

      def list_restore_testing_selections(
        restore_testing_plan_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRestoreTestingSelectionsInput.new(restore_testing_plan_name: restore_testing_plan_name, max_results: max_results, next_token: next_token)
        list_restore_testing_selections(input)
      end

      def list_restore_testing_selections(input : Types::ListRestoreTestingSelectionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESTORE_TESTING_SELECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This is a request for a summary of scan jobs created or running within the most recent 30 days.

      def list_scan_job_summaries(
        account_id : String? = nil,
        aggregation_period : String? = nil,
        malware_scanner : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        scan_result_status : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListScanJobSummariesInput.new(account_id: account_id, aggregation_period: aggregation_period, malware_scanner: malware_scanner, max_results: max_results, next_token: next_token, resource_type: resource_type, scan_result_status: scan_result_status, state: state)
        list_scan_job_summaries(input)
      end

      def list_scan_job_summaries(input : Types::ListScanJobSummariesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCAN_JOB_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing scan jobs for an authenticated account for the last 30 days.

      def list_scan_jobs(
        by_account_id : String? = nil,
        by_backup_vault_name : String? = nil,
        by_complete_after : Time? = nil,
        by_complete_before : Time? = nil,
        by_malware_scanner : String? = nil,
        by_recovery_point_arn : String? = nil,
        by_resource_arn : String? = nil,
        by_resource_type : String? = nil,
        by_scan_result_status : String? = nil,
        by_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScanJobsInput.new(by_account_id: by_account_id, by_backup_vault_name: by_backup_vault_name, by_complete_after: by_complete_after, by_complete_before: by_complete_before, by_malware_scanner: by_malware_scanner, by_recovery_point_arn: by_recovery_point_arn, by_resource_arn: by_resource_arn, by_resource_type: by_resource_type, by_scan_result_status: by_scan_result_status, by_state: by_state, max_results: max_results, next_token: next_token)
        list_scan_jobs(input)
      end

      def list_scan_jobs(input : Types::ListScanJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCAN_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the tags assigned to the resource, such as a target recovery point, backup plan, or backup
      # vault. This operation returns results depending on the resource type used in the value for
      # resourceArn . For example, recovery points of Amazon DynamoDB with Advanced Settings have an ARN
      # (Amazon Resource Name) that begins with arn:aws:backup . Recovery points (backups) of DynamoDB
      # without Advanced Settings enabled have an ARN that begins with arn:aws:dynamodb . When this
      # operation is called and when you include values of resourceArn that have an ARN other than
      # arn:aws:backup , it may return one of the exceptions listed below. To prevent this exception,
      # include only values representing resource types that are fully managed by Backup. These have an ARN
      # that begins arn:aws:backup and they are noted in the Feature availability by resource table.

      def list_tags(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tiering configurations.

      def list_tiering_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTieringConfigurationsInput.new(max_results: max_results, next_token: next_token)
        list_tiering_configurations(input)
      end

      def list_tiering_configurations(input : Types::ListTieringConfigurationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TIERING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets a resource-based policy that is used to manage access permissions on the target backup vault.
      # Requires a backup vault name and an access policy document in JSON format.

      def put_backup_vault_access_policy(
        backup_vault_name : String,
        policy : String? = nil
      ) : Protocol::Request
        input = Types::PutBackupVaultAccessPolicyInput.new(backup_vault_name: backup_vault_name, policy: policy)
        put_backup_vault_access_policy(input)
      end

      def put_backup_vault_access_policy(input : Types::PutBackupVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BACKUP_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies Backup Vault Lock to a backup vault, preventing attempts to delete any recovery point stored
      # in or created in a backup vault. Vault Lock also prevents attempts to update the lifecycle policy
      # that controls the retention period of any recovery point currently stored in a backup vault. If
      # specified, Vault Lock enforces a minimum and maximum retention period for future backup and copy
      # jobs that target a backup vault. Backup Vault Lock has been assessed by Cohasset Associates for use
      # in environments that are subject to SEC 17a-4, CFTC, and FINRA regulations. For more information
      # about how Backup Vault Lock relates to these regulations, see the Cohasset Associates Compliance
      # Assessment. For more information, see Backup Vault Lock .

      def put_backup_vault_lock_configuration(
        backup_vault_name : String,
        changeable_for_days : Int64? = nil,
        max_retention_days : Int64? = nil,
        min_retention_days : Int64? = nil
      ) : Protocol::Request
        input = Types::PutBackupVaultLockConfigurationInput.new(backup_vault_name: backup_vault_name, changeable_for_days: changeable_for_days, max_retention_days: max_retention_days, min_retention_days: min_retention_days)
        put_backup_vault_lock_configuration(input)
      end

      def put_backup_vault_lock_configuration(input : Types::PutBackupVaultLockConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BACKUP_VAULT_LOCK_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Turns on notifications on a backup vault for the specified topic and events.

      def put_backup_vault_notifications(
        backup_vault_events : Array(String),
        backup_vault_name : String,
        sns_topic_arn : String
      ) : Protocol::Request
        input = Types::PutBackupVaultNotificationsInput.new(backup_vault_events: backup_vault_events, backup_vault_name: backup_vault_name, sns_topic_arn: sns_topic_arn)
        put_backup_vault_notifications(input)
      end

      def put_backup_vault_notifications(input : Types::PutBackupVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_BACKUP_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request allows you to send your independent self-run restore test validation results.
      # RestoreJobId and ValidationStatus are required. Optionally, you can input a ValidationStatusMessage
      # .

      def put_restore_validation_result(
        restore_job_id : String,
        validation_status : String,
        validation_status_message : String? = nil
      ) : Protocol::Request
        input = Types::PutRestoreValidationResultInput.new(restore_job_id: restore_job_id, validation_status: validation_status, validation_status_message: validation_status_message)
        put_restore_validation_result(input)
      end

      def put_restore_validation_result(input : Types::PutRestoreValidationResultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESTORE_VALIDATION_RESULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes access to a restore access backup vault, removing the ability to restore from its recovery
      # points and permanently deleting the vault.

      def revoke_restore_access_backup_vault(
        backup_vault_name : String,
        restore_access_backup_vault_arn : String,
        requester_comment : String? = nil
      ) : Protocol::Request
        input = Types::RevokeRestoreAccessBackupVaultInput.new(backup_vault_name: backup_vault_name, restore_access_backup_vault_arn: restore_access_backup_vault_arn, requester_comment: requester_comment)
        revoke_restore_access_backup_vault(input)
      end

      def revoke_restore_access_backup_vault(input : Types::RevokeRestoreAccessBackupVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_RESTORE_ACCESS_BACKUP_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an on-demand backup job for the specified resource.

      def start_backup_job(
        backup_vault_name : String,
        iam_role_arn : String,
        resource_arn : String,
        backup_options : Hash(String, String)? = nil,
        complete_window_minutes : Int64? = nil,
        idempotency_token : String? = nil,
        index : String? = nil,
        lifecycle : Types::Lifecycle? = nil,
        logically_air_gapped_backup_vault_arn : String? = nil,
        recovery_point_tags : Hash(String, String)? = nil,
        start_window_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::StartBackupJobInput.new(backup_vault_name: backup_vault_name, iam_role_arn: iam_role_arn, resource_arn: resource_arn, backup_options: backup_options, complete_window_minutes: complete_window_minutes, idempotency_token: idempotency_token, index: index, lifecycle: lifecycle, logically_air_gapped_backup_vault_arn: logically_air_gapped_backup_vault_arn, recovery_point_tags: recovery_point_tags, start_window_minutes: start_window_minutes)
        start_backup_job(input)
      end

      def start_backup_job(input : Types::StartBackupJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_BACKUP_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a job to create a one-time copy of the specified resource. Does not support continuous
      # backups. See Copy job retry for information on how Backup retries copy job operations.

      def start_copy_job(
        destination_backup_vault_arn : String,
        iam_role_arn : String,
        recovery_point_arn : String,
        source_backup_vault_name : String,
        idempotency_token : String? = nil,
        lifecycle : Types::Lifecycle? = nil
      ) : Protocol::Request
        input = Types::StartCopyJobInput.new(destination_backup_vault_arn: destination_backup_vault_arn, iam_role_arn: iam_role_arn, recovery_point_arn: recovery_point_arn, source_backup_vault_name: source_backup_vault_name, idempotency_token: idempotency_token, lifecycle: lifecycle)
        start_copy_job(input)
      end

      def start_copy_job(input : Types::StartCopyJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_COPY_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an on-demand report job for the specified report plan.

      def start_report_job(
        report_plan_name : String,
        idempotency_token : String? = nil
      ) : Protocol::Request
        input = Types::StartReportJobInput.new(report_plan_name: report_plan_name, idempotency_token: idempotency_token)
        start_report_job(input)
      end

      def start_report_job(input : Types::StartReportJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_REPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Recovers the saved resource identified by an Amazon Resource Name (ARN).

      def start_restore_job(
        metadata : Hash(String, String),
        recovery_point_arn : String,
        copy_source_tags_to_restored_resource : Bool? = nil,
        iam_role_arn : String? = nil,
        idempotency_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::StartRestoreJobInput.new(metadata: metadata, recovery_point_arn: recovery_point_arn, copy_source_tags_to_restored_resource: copy_source_tags_to_restored_resource, iam_role_arn: iam_role_arn, idempotency_token: idempotency_token, resource_type: resource_type)
        start_restore_job(input)
      end

      def start_restore_job(input : Types::StartRestoreJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RESTORE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts scanning jobs for specific resources.

      def start_scan_job(
        backup_vault_name : String,
        iam_role_arn : String,
        malware_scanner : String,
        recovery_point_arn : String,
        scan_mode : String,
        scanner_role_arn : String,
        idempotency_token : String? = nil,
        scan_base_recovery_point_arn : String? = nil
      ) : Protocol::Request
        input = Types::StartScanJobInput.new(backup_vault_name: backup_vault_name, iam_role_arn: iam_role_arn, malware_scanner: malware_scanner, recovery_point_arn: recovery_point_arn, scan_mode: scan_mode, scanner_role_arn: scanner_role_arn, idempotency_token: idempotency_token, scan_base_recovery_point_arn: scan_base_recovery_point_arn)
        start_scan_job(input)
      end

      def start_scan_job(input : Types::StartScanJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SCAN_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attempts to cancel a job to create a one-time backup of a resource. This action is not supported for
      # the following services: Amazon Aurora Amazon DocumentDB (with MongoDB compatibility) Amazon FSx for
      # Lustre Amazon FSx for NetApp ONTAP Amazon FSx for OpenZFS Amazon FSx for Windows File Server Amazon
      # Neptune SAP HANA databases on Amazon EC2 instances Amazon RDS

      def stop_backup_job(
        backup_job_id : String
      ) : Protocol::Request
        input = Types::StopBackupJobInput.new(backup_job_id: backup_job_id)
        stop_backup_job(input)
      end

      def stop_backup_job(input : Types::StopBackupJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_BACKUP_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns a set of key-value pairs to a resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a set of key-value pairs from a recovery point, backup plan, or backup vault identified by
      # an Amazon Resource Name (ARN) This API is not supported for recovery points for resource types
      # including Aurora, Amazon DocumentDB. Amazon EBS, Amazon FSx, Neptune, and Amazon RDS.

      def untag_resource(
        resource_arn : String,
        tag_key_list : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_key_list: tag_key_list)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified backup plan. The new version is uniquely identified by its ID.

      def update_backup_plan(
        backup_plan : Types::BackupPlanInput,
        backup_plan_id : String
      ) : Protocol::Request
        input = Types::UpdateBackupPlanInput.new(backup_plan: backup_plan, backup_plan_id: backup_plan_id)
        update_backup_plan(input)
      end

      def update_backup_plan(input : Types::UpdateBackupPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BACKUP_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified framework.

      def update_framework(
        framework_name : String,
        framework_controls : Array(Types::FrameworkControl)? = nil,
        framework_description : String? = nil,
        idempotency_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFrameworkInput.new(framework_name: framework_name, framework_controls: framework_controls, framework_description: framework_description, idempotency_token: idempotency_token)
        update_framework(input)
      end

      def update_framework(input : Types::UpdateFrameworkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates whether the Amazon Web Services account is opted in to cross-account backup. Returns an
      # error if the account is not an Organizations management account. Use the DescribeGlobalSettings API
      # to determine the current settings.

      def update_global_settings(
        global_settings : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalSettingsInput.new(global_settings: global_settings)
        update_global_settings(input)
      end

      def update_global_settings(input : Types::UpdateGlobalSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation updates the settings of a recovery point index. Required: BackupVaultName,
      # RecoveryPointArn, and IAMRoleArn

      def update_recovery_point_index_settings(
        backup_vault_name : String,
        index : String,
        recovery_point_arn : String,
        iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRecoveryPointIndexSettingsInput.new(backup_vault_name: backup_vault_name, index: index, recovery_point_arn: recovery_point_arn, iam_role_arn: iam_role_arn)
        update_recovery_point_index_settings(input)
      end

      def update_recovery_point_index_settings(input : Types::UpdateRecoveryPointIndexSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOVERY_POINT_INDEX_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the transition lifecycle of a recovery point. The lifecycle defines when a protected resource
      # is transitioned to cold storage and when it expires. Backup transitions and expires backups
      # automatically according to the lifecycle that you define. Resource types that can transition to cold
      # storage are listed in the Feature availability by resource table. Backup ignores this expression for
      # other resource types. Backups transitioned to cold storage must be stored in cold storage for a
      # minimum of 90 days. Therefore, the “retention” setting must be 90 days greater than the “transition
      # to cold after days” setting. The “transition to cold after days” setting cannot be changed after a
      # backup has been transitioned to cold. If your lifecycle currently uses the parameters
      # DeleteAfterDays and MoveToColdStorageAfterDays , include these parameters and their values when you
      # call this operation. Not including them may result in your plan updating with null values. This
      # operation does not support continuous backups.

      def update_recovery_point_lifecycle(
        backup_vault_name : String,
        recovery_point_arn : String,
        lifecycle : Types::Lifecycle? = nil
      ) : Protocol::Request
        input = Types::UpdateRecoveryPointLifecycleInput.new(backup_vault_name: backup_vault_name, recovery_point_arn: recovery_point_arn, lifecycle: lifecycle)
        update_recovery_point_lifecycle(input)
      end

      def update_recovery_point_lifecycle(input : Types::UpdateRecoveryPointLifecycleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOVERY_POINT_LIFECYCLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the current service opt-in settings for the Region. Use the DescribeRegionSettings API to
      # determine the resource types that are supported.

      def update_region_settings(
        resource_type_management_preference : Hash(String, Bool)? = nil,
        resource_type_opt_in_preference : Hash(String, Bool)? = nil
      ) : Protocol::Request
        input = Types::UpdateRegionSettingsInput.new(resource_type_management_preference: resource_type_management_preference, resource_type_opt_in_preference: resource_type_opt_in_preference)
        update_region_settings(input)
      end

      def update_region_settings(input : Types::UpdateRegionSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REGION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified report plan.

      def update_report_plan(
        report_plan_name : String,
        idempotency_token : String? = nil,
        report_delivery_channel : Types::ReportDeliveryChannel? = nil,
        report_plan_description : String? = nil,
        report_setting : Types::ReportSetting? = nil
      ) : Protocol::Request
        input = Types::UpdateReportPlanInput.new(report_plan_name: report_plan_name, idempotency_token: idempotency_token, report_delivery_channel: report_delivery_channel, report_plan_description: report_plan_description, report_setting: report_setting)
        update_report_plan(input)
      end

      def update_report_plan(input : Types::UpdateReportPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPORT_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request will send changes to your specified restore testing plan. RestoreTestingPlanName cannot
      # be updated after it is created. RecoveryPointSelection can contain: Algorithm ExcludeVaults
      # IncludeVaults RecoveryPointTypes SelectionWindowDays

      def update_restore_testing_plan(
        restore_testing_plan : Types::RestoreTestingPlanForUpdate,
        restore_testing_plan_name : String
      ) : Protocol::Request
        input = Types::UpdateRestoreTestingPlanInput.new(restore_testing_plan: restore_testing_plan, restore_testing_plan_name: restore_testing_plan_name)
        update_restore_testing_plan(input)
      end

      def update_restore_testing_plan(input : Types::UpdateRestoreTestingPlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESTORE_TESTING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified restore testing selection. Most elements except the
      # RestoreTestingSelectionName can be updated with this request. You can use either protected resource
      # ARNs or conditions, but not both.

      def update_restore_testing_selection(
        restore_testing_plan_name : String,
        restore_testing_selection : Types::RestoreTestingSelectionForUpdate,
        restore_testing_selection_name : String
      ) : Protocol::Request
        input = Types::UpdateRestoreTestingSelectionInput.new(restore_testing_plan_name: restore_testing_plan_name, restore_testing_selection: restore_testing_selection, restore_testing_selection_name: restore_testing_selection_name)
        update_restore_testing_selection(input)
      end

      def update_restore_testing_selection(input : Types::UpdateRestoreTestingSelectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESTORE_TESTING_SELECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This request will send changes to your specified tiering configuration. TieringConfigurationName
      # cannot be updated after it is created. ResourceSelection can contain: Resources
      # TieringDownSettingsInDays ResourceType

      def update_tiering_configuration(
        tiering_configuration : Types::TieringConfigurationInputForUpdate,
        tiering_configuration_name : String
      ) : Protocol::Request
        input = Types::UpdateTieringConfigurationInput.new(tiering_configuration: tiering_configuration, tiering_configuration_name: tiering_configuration_name)
        update_tiering_configuration(input)
      end

      def update_tiering_configuration(input : Types::UpdateTieringConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TIERING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
