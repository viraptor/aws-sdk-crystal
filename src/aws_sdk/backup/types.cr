require "json"
require "time"

module AwsSdk
  module Backup
    module Types

      # The backup options for each resource type.
      struct AdvancedBackupSetting
        include JSON::Serializable

        # Specifies the backup option for a selected resource. This option is available for Windows VSS backup
        # jobs and S3 backups. Valid values: Set to "WindowsVSS":"enabled" to enable the WindowsVSS backup
        # option and create a Windows VSS backup. Set to "WindowsVSS":"disabled" to create a regular backup.
        # The WindowsVSS option is not enabled by default. For S3 backups, set to "S3BackupACLs":"disabled" to
        # exclude ACLs from the backup, or "S3BackupObjectTags":"disabled" to exclude object tags from the
        # backup. By default, both ACLs and object tags are included in S3 backups. If you specify an invalid
        # option, you get an InvalidParameterValueException exception. For more information about Windows VSS
        # backups, see Creating a VSS-Enabled Windows Backup .
        @[JSON::Field(key: "BackupOptions")]
        getter backup_options : Hash(String, String)?

        # Specifies an object containing resource type and backup options. The only supported resource type is
        # Amazon EC2 instances with Windows Volume Shadow Copy Service (VSS). For a CloudFormation example,
        # see the sample CloudFormation template to enable Windows VSS in the Backup User Guide . Valid
        # values: EC2 .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @backup_options : Hash(String, String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Contains aggregated scan results across multiple scan operations, providing a summary of scan status
      # and findings.
      struct AggregatedScanResult
        include JSON::Serializable

        # A Boolean value indicating whether any of the aggregated scans failed.
        @[JSON::Field(key: "FailedScan")]
        getter failed_scan : Bool?

        # An array of findings discovered across all aggregated scans.
        @[JSON::Field(key: "Findings")]
        getter findings : Array(String)?

        # The timestamp when the aggregated scan result was last computed, in Unix format and Coordinated
        # Universal Time (UTC).
        @[JSON::Field(key: "LastComputed")]
        getter last_computed : Time?

        def initialize(
          @failed_scan : Bool? = nil,
          @findings : Array(String)? = nil,
          @last_computed : Time? = nil
        )
        end
      end

      # The required resource already exists.
      struct AlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @code : String? = nil,
          @context : String? = nil,
          @creator_request_id : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct AssociateBackupVaultMpaApprovalTeamInput
        include JSON::Serializable

        # The name of the backup vault to associate with the MPA approval team.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The Amazon Resource Name (ARN) of the MPA approval team to associate with the backup vault.
        @[JSON::Field(key: "MpaApprovalTeamArn")]
        getter mpa_approval_team_arn : String

        # A comment provided by the requester explaining the association request.
        @[JSON::Field(key: "RequesterComment")]
        getter requester_comment : String?

        def initialize(
          @backup_vault_name : String,
          @mpa_approval_team_arn : String,
          @requester_comment : String? = nil
        )
        end
      end

      # Contains detailed information about a backup job.
      struct BackupJob
        include JSON::Serializable

        # The account ID that owns the backup job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "BackupJobId")]
        getter backup_job_id : String?

        # Specifies the backup option for a selected resource. This option is only available for Windows
        # Volume Shadow Copy Service (VSS) backup jobs. Valid values: Set to "WindowsVSS":"enabled" to enable
        # the WindowsVSS backup option and create a Windows VSS backup. Set to "WindowsVSS":"disabled" to
        # create a regular backup. If you specify an invalid option, you get an InvalidParameterValueException
        # exception.
        @[JSON::Field(key: "BackupOptions")]
        getter backup_options : Hash(String, String)?

        # The size, in bytes, of a backup (recovery point). This value can render differently depending on the
        # resource type as Backup pulls in data information from other Amazon Web Services services. For
        # example, the value returned may show a value of 0 , which may differ from the anticipated value. The
        # expected behavior for values by resource type are described as follows: Amazon Aurora, Amazon
        # DocumentDB, and Amazon Neptune do not have this value populate from the operation GetBackupJobStatus
        # . For Amazon DynamoDB with advanced features, this value refers to the size of the recovery point
        # (backup). Amazon EC2 and Amazon EBS show volume size (provisioned storage) returned as part of this
        # value. Amazon EBS does not return backup size information; snapshot size will have the same value as
        # the original resource that was backed up. For Amazon EFS, this value refers to the delta bytes
        # transferred during a backup. Amazon FSx does not populate this value from the operation
        # GetBackupJobStatus for FSx file systems. An Amazon RDS instance will show as 0 . For virtual
        # machines running VMware, this value is passed to Backup through an asynchronous workflow, which can
        # mean this displayed value can under-represent the actual backup size.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # Represents the type of backup for a backup job.
        @[JSON::Field(key: "BackupType")]
        getter backup_type : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The size in bytes transferred to a backup vault at the time that the job status was queried.
        @[JSON::Field(key: "BytesTransferred")]
        getter bytes_transferred : Int64?

        # The date and time a job to create a backup job is completed, in Unix format and Coordinated
        # Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # Contains identifying information about the creation of a backup job, including the BackupPlanArn ,
        # BackupPlanId , BackupPlanVersion , and BackupRuleId of the backup plan used to create it.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RecoveryPointCreator?

        # The date and time a backup job is created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the backup. This can be a
        # customer-managed key or an Amazon Web Services managed key, depending on the vault configuration.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The date and time a job to back up resources is expected to be completed, in Unix format and
        # Coordinated Universal Time (UTC). The value of ExpectedCompletionDate is accurate to milliseconds.
        # For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "ExpectedCompletionDate")]
        getter expected_completion_date : Time?

        # Specifies the IAM role ARN used to create the target recovery point. IAM roles other than the
        # default role must include either AWSBackup or AwsBackup in the role name. For example,
        # arn:aws:iam::123456789012:role/AWSBackupRDSAccess . Role names without those strings lack
        # permissions to perform backup jobs.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The date on which the backup job was initiated.
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # A boolean value indicating whether the backup is encrypted. All backups in Backup are encrypted, but
        # this field indicates the encryption status for transparency.
        @[JSON::Field(key: "IsEncrypted")]
        getter is_encrypted : Bool?

        # This is a boolean value indicating this is a parent (composite) backup job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # This parameter is the job count for the specified message category. Example strings may include
        # AccessDenied , SUCCESS , AGGREGATE_ALL , and INVALIDPARAMETERS . See Monitoring for a list of
        # MessageCategory strings. The the value ANY returns count of all message categories. AGGREGATE_ALL
        # aggregates job counts for all message categories and returns the sum.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # This uniquely identifies a request to Backup to back up a resource. The return will be the parent
        # (composite) job ID.
        @[JSON::Field(key: "ParentJobId")]
        getter parent_job_id : String?

        # Contains an estimated percentage complete of a job at the time the job status was queried.
        @[JSON::Field(key: "PercentDone")]
        getter percent_done : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        @[JSON::Field(key: "RecoveryPointLifecycle")]
        getter recovery_point_lifecycle : Types::Lifecycle?

        # An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource to be backed up; for example, an Amazon Elastic Block Store
        # (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database. For Windows
        # Volume Shadow Copy Service (VSS) backups, the only supported resource type is Amazon EC2.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be
        # started before it is canceled. The value is calculated by adding the start window to the scheduled
        # time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the StartBy time would
        # be 8:00 PM on the date specified. The value of StartBy is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartBy")]
        getter start_by : Time?

        # The current state of a backup job.
        @[JSON::Field(key: "State")]
        getter state : String?

        # A detailed message explaining the status of the job to back up a resource.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The lock state of the backup vault. For logically air-gapped vaults, this indicates whether the
        # vault is locked in compliance mode. Valid values include LOCKED and UNLOCKED .
        @[JSON::Field(key: "VaultLockState")]
        getter vault_lock_state : String?

        # The type of backup vault where the recovery point is stored. Valid values are BACKUP_VAULT for
        # standard backup vaults and LOGICALLY_AIR_GAPPED_BACKUP_VAULT for logically air-gapped vaults.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @account_id : String? = nil,
          @backup_job_id : String? = nil,
          @backup_options : Hash(String, String)? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @backup_type : String? = nil,
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @bytes_transferred : Int64? = nil,
          @completion_date : Time? = nil,
          @created_by : Types::RecoveryPointCreator? = nil,
          @creation_date : Time? = nil,
          @encryption_key_arn : String? = nil,
          @expected_completion_date : Time? = nil,
          @iam_role_arn : String? = nil,
          @initiation_date : Time? = nil,
          @is_encrypted : Bool? = nil,
          @is_parent : Bool? = nil,
          @message_category : String? = nil,
          @parent_job_id : String? = nil,
          @percent_done : String? = nil,
          @recovery_point_arn : String? = nil,
          @recovery_point_lifecycle : Types::Lifecycle? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @start_by : Time? = nil,
          @state : String? = nil,
          @status_message : String? = nil,
          @vault_lock_state : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      # This is a summary of jobs created or running within the most recent 30 days. The returned summary
      # may contain the following: Region, Account, State, RestourceType, MessageCategory, StartTime,
      # EndTime, and Count of included jobs.
      struct BackupJobSummary
        include JSON::Serializable

        # The account ID that owns the jobs within the summary.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The value as a number of jobs in a job summary.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of time in number format of a job end time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # This parameter is the job count for the specified message category. Example strings include
        # AccessDenied , Success , and InvalidParameters . See Monitoring for a list of MessageCategory
        # strings. The the value ANY returns count of all message categories. AGGREGATE_ALL aggregates job
        # counts for all message categories and returns the sum.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # The Amazon Web Services Regions within the job summary.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # This value is the job count for the specified resource type. The request GetSupportedResourceTypes
        # returns strings for supported resource types.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The value of time in number format of a job start time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # This value is job count for jobs with the specified state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @count : Int32? = nil,
          @end_time : Time? = nil,
          @message_category : String? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains an optional backup plan display name and an array of BackupRule objects, each of which
      # specifies a backup rule. Each rule in a backup plan is a separate scheduled task and can back up a
      # different selection of Amazon Web Services resources.
      struct BackupPlan
        include JSON::Serializable

        # The display name of a backup plan. Must contain only alphanumeric or '-_.' special characters. If
        # this is set in the console, it can contain 1 to 50 characters; if this is set through CLI or API, it
        # can contain 1 to 200 characters.
        @[JSON::Field(key: "BackupPlanName")]
        getter backup_plan_name : String

        # An array of BackupRule objects, each of which specifies a scheduled task that is used to back up a
        # selection of resources.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::BackupRule)

        # Contains a list of BackupOptions for each resource type.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # Contains your scanning configuration for the backup plan and includes the Malware scanner, your
        # selected resources, and scanner role.
        @[JSON::Field(key: "ScanSettings")]
        getter scan_settings : Array(Types::ScanSetting)?

        def initialize(
          @backup_plan_name : String,
          @rules : Array(Types::BackupRule),
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @scan_settings : Array(Types::ScanSetting)? = nil
        )
        end
      end

      # Contains an optional backup plan display name and an array of BackupRule objects, each of which
      # specifies a backup rule. Each rule in a backup plan is a separate scheduled task.
      struct BackupPlanInput
        include JSON::Serializable

        # The display name of a backup plan. Must contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "BackupPlanName")]
        getter backup_plan_name : String

        # An array of BackupRule objects, each of which specifies a scheduled task that is used to back up a
        # selection of resources.
        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::BackupRuleInput)

        # Specifies a list of BackupOptions for each resource type. These settings are only available for
        # Windows Volume Shadow Copy Service (VSS) backup jobs.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # Contains your scanning configuration for the backup rule and includes the malware scanner, and scan
        # mode of either full or incremental.
        @[JSON::Field(key: "ScanSettings")]
        getter scan_settings : Array(Types::ScanSetting)?

        def initialize(
          @backup_plan_name : String,
          @rules : Array(Types::BackupRuleInput),
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @scan_settings : Array(Types::ScanSetting)? = nil
        )
        end
      end

      # An object specifying metadata associated with a backup plan template.
      struct BackupPlanTemplatesListMember
        include JSON::Serializable

        # Uniquely identifies a stored backup plan template.
        @[JSON::Field(key: "BackupPlanTemplateId")]
        getter backup_plan_template_id : String?

        # The optional display name of a backup plan template.
        @[JSON::Field(key: "BackupPlanTemplateName")]
        getter backup_plan_template_name : String?

        def initialize(
          @backup_plan_template_id : String? = nil,
          @backup_plan_template_name : String? = nil
        )
        end
      end

      # Contains metadata about a backup plan.
      struct BackupPlansListMember
        include JSON::Serializable

        # Contains a list of BackupOptions for a resource type.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The display name of a saved backup plan.
        @[JSON::Field(key: "BackupPlanName")]
        getter backup_plan_name : String?

        # The date and time a resource backup plan is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The
        # value of DeletionDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "DeletionDate")]
        getter deletion_date : Time?

        # The last time this backup plan was run. A date and time, in Unix format and Coordinated Universal
        # Time (UTC). The value of LastExecutionDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastExecutionDate")]
        getter last_execution_date : Time?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version IDs cannot be edited.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @backup_plan_name : String? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @deletion_date : Time? = nil,
          @last_execution_date : Time? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Specifies a scheduled task used to back up a selection of resources.
      struct BackupRule
        include JSON::Serializable

        # A display name for a backup rule. Must contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "TargetBackupVaultName")]
        getter target_backup_vault_name : String

        # A value in minutes after a backup job is successfully started before it must be completed or it will
        # be canceled by Backup. This value is optional.
        @[JSON::Field(key: "CompletionWindowMinutes")]
        getter completion_window_minutes : Int64?

        # An array of CopyAction objects, which contains the details of the copy operation.
        @[JSON::Field(key: "CopyActions")]
        getter copy_actions : Array(Types::CopyAction)?

        # Specifies whether Backup creates continuous backups. True causes Backup to create continuous backups
        # capable of point-in-time restore (PITR). False (or not specified) causes Backup to create snapshot
        # backups.
        @[JSON::Field(key: "EnableContinuousBackup")]
        getter enable_continuous_backup : Bool?

        # IndexActions is an array you use to specify how backup data should be indexed. eEach BackupRule can
        # have 0 or 1 IndexAction, as each backup can have up to one index associated with it. Within the
        # array is ResourceType. Only one will be accepted for each BackupRule.
        @[JSON::Field(key: "IndexActions")]
        getter index_actions : Array(Types::IndexAction)?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup transitions and expires backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold. Resource types that can transition to cold storage are listed in the Feature
        # availability by resource table. Backup ignores this expression for other resource types.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # The tags that are assigned to resources that are associated with this rule when restored from
        # backup.
        @[JSON::Field(key: "RecoveryPointTags")]
        getter recovery_point_tags : Hash(String, String)?

        # Uniquely identifies a rule that is used to schedule the backup of a selection of resources.
        @[JSON::Field(key: "RuleId")]
        getter rule_id : String?

        # Contains your scanning configuration for the backup rule and includes the malware scanner, and scan
        # mode of either full or incremental.
        @[JSON::Field(key: "ScanActions")]
        getter scan_actions : Array(Types::ScanAction)?

        # A cron expression in UTC specifying when Backup initiates a backup job. When no CRON expression is
        # provided, Backup will use the default expression cron(0 5 ? * * *) . For more information about
        # Amazon Web Services cron expressions, see Schedule Expressions for Rules in the Amazon CloudWatch
        # Events User Guide . Two examples of Amazon Web Services cron expressions are 15 * ? * * * (take a
        # backup every hour at 15 minutes past the hour) and 0 12 * * ? * (take a backup every day at 12 noon
        # UTC). For a table of examples, click the preceding link and scroll down the page.
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # The timezone in which the schedule expression is set. By default, ScheduleExpressions are in UTC.
        # You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start
        # successfully. This value is optional. If this value is included, it must be at least 60 minutes to
        # avoid errors. During the start window, the backup job status remains in CREATED status until it has
        # successfully begun or until the start window time has run out. If within the start window time
        # Backup receives an error that allows the job to be retried, Backup will automatically retry to begin
        # the job at least every 10 minutes until the backup successfully begins (the job status changes to
        # RUNNING ) or until the job status changes to EXPIRED (which is expected to occur when the start
        # window time is over).
        @[JSON::Field(key: "StartWindowMinutes")]
        getter start_window_minutes : Int64?

        # The ARN of a logically air-gapped vault. ARN must be in the same account and Region. If provided,
        # supported fully managed resources back up directly to logically air-gapped vault, while other
        # supported resources create a temporary (billable) snapshot in backup vault, then copy it to
        # logically air-gapped vault. Unsupported resources only back up to the specified backup vault.
        @[JSON::Field(key: "TargetLogicallyAirGappedBackupVaultArn")]
        getter target_logically_air_gapped_backup_vault_arn : String?

        def initialize(
          @rule_name : String,
          @target_backup_vault_name : String,
          @completion_window_minutes : Int64? = nil,
          @copy_actions : Array(Types::CopyAction)? = nil,
          @enable_continuous_backup : Bool? = nil,
          @index_actions : Array(Types::IndexAction)? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @recovery_point_tags : Hash(String, String)? = nil,
          @rule_id : String? = nil,
          @scan_actions : Array(Types::ScanAction)? = nil,
          @schedule_expression : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_window_minutes : Int64? = nil,
          @target_logically_air_gapped_backup_vault_arn : String? = nil
        )
        end
      end

      # Specifies a scheduled task used to back up a selection of resources.
      struct BackupRuleInput
        include JSON::Serializable

        # A display name for a backup rule. Must contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "TargetBackupVaultName")]
        getter target_backup_vault_name : String

        # A value in minutes after a backup job is successfully started before it must be completed or it will
        # be canceled by Backup. This value is optional.
        @[JSON::Field(key: "CompletionWindowMinutes")]
        getter completion_window_minutes : Int64?

        # An array of CopyAction objects, which contains the details of the copy operation.
        @[JSON::Field(key: "CopyActions")]
        getter copy_actions : Array(Types::CopyAction)?

        # Specifies whether Backup creates continuous backups. True causes Backup to create continuous backups
        # capable of point-in-time restore (PITR). False (or not specified) causes Backup to create snapshot
        # backups.
        @[JSON::Field(key: "EnableContinuousBackup")]
        getter enable_continuous_backup : Bool?

        # There can up to one IndexAction in each BackupRule, as each backup can have 0 or 1 backup index
        # associated with it. Within the array is ResourceTypes. Only 1 resource type will be accepted for
        # each BackupRule. Valid values: EBS for Amazon Elastic Block Store S3 for Amazon Simple Storage
        # Service (Amazon S3)
        @[JSON::Field(key: "IndexActions")]
        getter index_actions : Array(Types::IndexAction)?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup will transition and expire backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold storage. Resource types that can transition to cold storage are listed in the
        # Feature availability by resource table. Backup ignores this expression for other resource types.
        # This parameter has a maximum value of 100 years (36,500 days).
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # The tags to assign to the resources.
        @[JSON::Field(key: "RecoveryPointTags")]
        getter recovery_point_tags : Hash(String, String)?

        # Contains your scanning configuration for the backup rule and includes the malware scanner, and scan
        # mode of either full or incremental.
        @[JSON::Field(key: "ScanActions")]
        getter scan_actions : Array(Types::ScanAction)?

        # A CRON expression in UTC specifying when Backup initiates a backup job. When no CRON expression is
        # provided, Backup will use the default expression cron(0 5 ? * * *) .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # The timezone in which the schedule expression is set. By default, ScheduleExpressions are in UTC.
        # You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start
        # successfully. This value is optional. If this value is included, it must be at least 60 minutes to
        # avoid errors. This parameter has a maximum value of 100 years (52,560,000 minutes). During the start
        # window, the backup job status remains in CREATED status until it has successfully begun or until the
        # start window time has run out. If within the start window time Backup receives an error that allows
        # the job to be retried, Backup will automatically retry to begin the job at least every 10 minutes
        # until the backup successfully begins (the job status changes to RUNNING ) or until the job status
        # changes to EXPIRED (which is expected to occur when the start window time is over).
        @[JSON::Field(key: "StartWindowMinutes")]
        getter start_window_minutes : Int64?

        # The ARN of a logically air-gapped vault. ARN must be in the same account and Region. If provided,
        # supported fully managed resources back up directly to logically air-gapped vault, while other
        # supported resources create a temporary (billable) snapshot in backup vault, then copy it to
        # logically air-gapped vault. Unsupported resources only back up to the specified backup vault.
        @[JSON::Field(key: "TargetLogicallyAirGappedBackupVaultArn")]
        getter target_logically_air_gapped_backup_vault_arn : String?

        def initialize(
          @rule_name : String,
          @target_backup_vault_name : String,
          @completion_window_minutes : Int64? = nil,
          @copy_actions : Array(Types::CopyAction)? = nil,
          @enable_continuous_backup : Bool? = nil,
          @index_actions : Array(Types::IndexAction)? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @recovery_point_tags : Hash(String, String)? = nil,
          @scan_actions : Array(Types::ScanAction)? = nil,
          @schedule_expression : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_window_minutes : Int64? = nil,
          @target_logically_air_gapped_backup_vault_arn : String? = nil
        )
        end
      end

      # Used to specify a set of resources to a backup plan. We recommend that you specify conditions, tags,
      # or resources to include or exclude. Otherwise, Backup attempts to select all supported and opted-in
      # storage resources, which could have unintended cost implications. For more information, see
      # Assigning resources programmatically .
      struct BackupSelection
        include JSON::Serializable

        # The ARN of the IAM role that Backup uses to authenticate when backing up the target resource; for
        # example, arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The display name of a resource selection document. Must contain 1 to 50 alphanumeric or '-_.'
        # characters.
        @[JSON::Field(key: "SelectionName")]
        getter selection_name : String

        # The conditions that you define to assign resources to your backup plans using tags. For example,
        # "StringEquals": { "ConditionKey": "aws:ResourceTag/backup", "ConditionValue": "daily" } . Conditions
        # supports StringEquals , StringLike , StringNotEquals , and StringNotLike . Condition operators are
        # case sensitive. If you specify multiple conditions, the resources much match all conditions (AND
        # logic).
        @[JSON::Field(key: "Conditions")]
        getter conditions : Types::Conditions?

        # The conditions that you define to assign resources to your backup plans using tags. For example,
        # "StringEquals": { "ConditionKey": "backup", "ConditionValue": "daily"} . ListOfTags supports only
        # StringEquals . Condition operators are case sensitive. If you specify multiple conditions, the
        # resources much match any of the conditions (OR logic).
        @[JSON::Field(key: "ListOfTags")]
        getter list_of_tags : Array(Types::Condition)?

        # The Amazon Resource Names (ARNs) of the resources to exclude from a backup plan. The maximum number
        # of ARNs is 500 without wildcards, or 30 ARNs with wildcards. If you need to exclude many resources
        # from a backup plan, consider a different resource selection strategy, such as assigning only one or
        # a few resource types or refining your resource selection using tags.
        @[JSON::Field(key: "NotResources")]
        getter not_resources : Array(String)?

        # The Amazon Resource Names (ARNs) of the resources to assign to a backup plan. The maximum number of
        # ARNs is 500 without wildcards, or 30 ARNs with wildcards. If you need to assign many resources to a
        # backup plan, consider a different resource selection strategy, such as assigning all resources of a
        # resource type or refining your resource selection using tags. If you specify multiple ARNs, the
        # resources much match any of the ARNs (OR logic).
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @iam_role_arn : String,
          @selection_name : String,
          @conditions : Types::Conditions? = nil,
          @list_of_tags : Array(Types::Condition)? = nil,
          @not_resources : Array(String)? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Contains metadata about a BackupSelection object.
      struct BackupSelectionsListMember
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # Specifies the IAM role Amazon Resource Name (ARN) to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # Uniquely identifies a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "SelectionId")]
        getter selection_id : String?

        # The display name of a resource selection document.
        @[JSON::Field(key: "SelectionName")]
        getter selection_name : String?

        def initialize(
          @backup_plan_id : String? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @iam_role_arn : String? = nil,
          @selection_id : String? = nil,
          @selection_name : String? = nil
        )
        end
      end

      # Contains metadata about a backup vault.
      struct BackupVaultListMember
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time a resource backup is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A server-side encryption key you can specify to encrypt your backups from services that support full
        # Backup management; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab . If you specify a key,
        # you must specify its ARN, not its alias. If you do not specify a key, Backup creates a KMS key for
        # you by default. To learn which Backup services support full Backup management and how Backup handles
        # encryption for backups from services that do not yet support full Backup, see Encryption for backups
        # in Backup
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption key used for the backup vault. Valid values are CUSTOMER_MANAGED_KMS_KEY for
        # customer-managed keys or Amazon Web Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
        @[JSON::Field(key: "EncryptionKeyType")]
        getter encryption_key_type : String?

        # The date and time when Backup Vault Lock configuration becomes immutable, meaning it cannot be
        # changed or deleted. If you applied Vault Lock to your vault without specifying a lock date, you can
        # change your Vault Lock settings, or delete Vault Lock from the vault entirely, at any time. This
        # value is in Unix format, Coordinated Universal Time (UTC), and accurate to milliseconds. For
        # example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LockDate")]
        getter lock_date : Time?

        # A Boolean value that indicates whether Backup Vault Lock applies to the selected backup vault. If
        # true , Vault Lock prevents delete and update operations on the recovery points in the selected
        # vault.
        @[JSON::Field(key: "Locked")]
        getter locked : Bool?

        # The Backup Vault Lock setting that specifies the maximum retention period that the vault retains its
        # recovery points. If this parameter is not specified, Vault Lock does not enforce a maximum retention
        # period on the recovery points in the vault (allowing indefinite storage). If specified, any backup
        # or copy job to the vault must have a lifecycle policy with a retention period equal to or shorter
        # than the maximum retention period. If the job's retention period is longer than that maximum
        # retention period, then the vault fails the backup or copy job, and you should either modify your
        # lifecycle settings or use a different vault. Recovery points already stored in the vault prior to
        # Vault Lock are not affected.
        @[JSON::Field(key: "MaxRetentionDays")]
        getter max_retention_days : Int64?

        # The Backup Vault Lock setting that specifies the minimum retention period that the vault retains its
        # recovery points. If this parameter is not specified, Vault Lock does not enforce a minimum retention
        # period. If specified, any backup or copy job to the vault must have a lifecycle policy with a
        # retention period equal to or longer than the minimum retention period. If the job's retention period
        # is shorter than that minimum retention period, then the vault fails the backup or copy job, and you
        # should either modify your lifecycle settings or use a different vault. Recovery points already
        # stored in the vault prior to Vault Lock are not affected.
        @[JSON::Field(key: "MinRetentionDays")]
        getter min_retention_days : Int64?

        # The number of recovery points that are stored in a backup vault.
        @[JSON::Field(key: "NumberOfRecoveryPoints")]
        getter number_of_recovery_points : Int64?

        # The current state of the vault.
        @[JSON::Field(key: "VaultState")]
        getter vault_state : String?

        # The type of vault in which the described recovery point is stored.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_key_type : String? = nil,
          @lock_date : Time? = nil,
          @locked : Bool? = nil,
          @max_retention_days : Int64? = nil,
          @min_retention_days : Int64? = nil,
          @number_of_recovery_points : Int64? = nil,
          @vault_state : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      # Contains DeleteAt and MoveToColdStorageAt timestamps, which are used to specify a lifecycle for a
      # recovery point. The lifecycle defines when a protected resource is transitioned to cold storage and
      # when it expires. Backup transitions and expires backups automatically according to the lifecycle
      # that you define. Backups transitioned to cold storage must be stored in cold storage for a minimum
      # of 90 days. Therefore, the “retention” setting must be 90 days greater than the “transition to cold
      # after days” setting. The “transition to cold after days” setting cannot be changed after a backup
      # has been transitioned to cold. Resource types that can transition to cold storage are listed in the
      # Feature availability by resource table. Backup ignores this expression for other resource types.
      struct CalculatedLifecycle
        include JSON::Serializable

        # A timestamp that specifies when to delete a recovery point.
        @[JSON::Field(key: "DeleteAt")]
        getter delete_at : Time?

        # A timestamp that specifies when to transition a recovery point to cold storage.
        @[JSON::Field(key: "MoveToColdStorageAt")]
        getter move_to_cold_storage_at : Time?

        def initialize(
          @delete_at : Time? = nil,
          @move_to_cold_storage_at : Time? = nil
        )
        end
      end

      struct CancelLegalHoldInput
        include JSON::Serializable

        # A string the describes the reason for removing the legal hold.
        @[JSON::Field(key: "cancelDescription")]
        getter cancel_description : String

        # The ID of the legal hold.
        @[JSON::Field(key: "legalHoldId")]
        getter legal_hold_id : String

        # The integer amount, in days, after which to remove legal hold.
        @[JSON::Field(key: "retainRecordInDays")]
        getter retain_record_in_days : Int64?

        def initialize(
          @cancel_description : String,
          @legal_hold_id : String,
          @retain_record_in_days : Int64? = nil
        )
        end
      end

      struct CancelLegalHoldOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Contains an array of triplets made up of a condition type (such as StringEquals ), a key, and a
      # value. Used to filter resources using their tags and assign them to a backup plan. Case sensitive.
      struct Condition
        include JSON::Serializable

        # The key in a key-value pair. For example, in the tag Department: Accounting , Department is the key.
        @[JSON::Field(key: "ConditionKey")]
        getter condition_key : String

        # An operation applied to a key-value pair used to assign resources to your backup plan. Condition
        # only supports StringEquals . For more flexible assignment options, including StringLike and the
        # ability to exclude resources from your backup plan, use Conditions (with an "s" on the end) for your
        # BackupSelection .
        @[JSON::Field(key: "ConditionType")]
        getter condition_type : String

        # The value in a key-value pair. For example, in the tag Department: Accounting , Accounting is the
        # value.
        @[JSON::Field(key: "ConditionValue")]
        getter condition_value : String

        def initialize(
          @condition_key : String,
          @condition_type : String,
          @condition_value : String
        )
        end
      end

      # Includes information about tags you define to assign tagged resources to a backup plan. Include the
      # prefix aws:ResourceTag in your tags. For example, "aws:ResourceTag/TagKey1": "Value1" .
      struct ConditionParameter
        include JSON::Serializable

        # The key in a key-value pair. For example, in the tag Department: Accounting , Department is the key.
        @[JSON::Field(key: "ConditionKey")]
        getter condition_key : String?

        # The value in a key-value pair. For example, in the tag Department: Accounting , Accounting is the
        # value.
        @[JSON::Field(key: "ConditionValue")]
        getter condition_value : String?

        def initialize(
          @condition_key : String? = nil,
          @condition_value : String? = nil
        )
        end
      end

      # Contains information about which resources to include or exclude from a backup plan using their
      # tags. Conditions are case sensitive.
      struct Conditions
        include JSON::Serializable

        # Filters the values of your tagged resources for only those resources that you tagged with the same
        # value. Also called "exact matching."
        @[JSON::Field(key: "StringEquals")]
        getter string_equals : Array(Types::ConditionParameter)?

        # Filters the values of your tagged resources for matching tag values with the use of a wildcard
        # character (*) anywhere in the string. For example, "prod*" or "*rod*" matches the tag value
        # "production".
        @[JSON::Field(key: "StringLike")]
        getter string_like : Array(Types::ConditionParameter)?

        # Filters the values of your tagged resources for only those resources that you tagged that do not
        # have the same value. Also called "negated matching."
        @[JSON::Field(key: "StringNotEquals")]
        getter string_not_equals : Array(Types::ConditionParameter)?

        # Filters the values of your tagged resources for non-matching tag values with the use of a wildcard
        # character (*) anywhere in the string.
        @[JSON::Field(key: "StringNotLike")]
        getter string_not_like : Array(Types::ConditionParameter)?

        def initialize(
          @string_equals : Array(Types::ConditionParameter)? = nil,
          @string_like : Array(Types::ConditionParameter)? = nil,
          @string_not_equals : Array(Types::ConditionParameter)? = nil,
          @string_not_like : Array(Types::ConditionParameter)? = nil
        )
        end
      end

      # Backup can't perform the action that you requested until it finishes performing a previous action.
      # Try again later.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The parameters for a control. A control can have zero, one, or more than one parameter. An example
      # of a control with two parameters is: "backup plan frequency is at least daily and the retention
      # period is at least 1 year ". The first parameter is daily . The second parameter is 1 year .
      struct ControlInputParameter
        include JSON::Serializable

        # The name of a parameter, for example, BackupPlanFrequency .
        @[JSON::Field(key: "ParameterName")]
        getter parameter_name : String?

        # The value of parameter, for example, hourly .
        @[JSON::Field(key: "ParameterValue")]
        getter parameter_value : String?

        def initialize(
          @parameter_name : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end

      # A framework consists of one or more controls. Each control has its own control scope. The control
      # scope can include one or more resource types, a combination of a tag key and value, or a combination
      # of one resource type and one resource ID. If no scope is specified, evaluations for the rule are
      # triggered when any resource in your recording group changes in configuration. To set a control scope
      # that includes all of a particular resource, leave the ControlScope empty or do not pass it when
      # calling CreateFramework .
      struct ControlScope
        include JSON::Serializable

        # The ID of the only Amazon Web Services resource that you want your control scope to contain.
        @[JSON::Field(key: "ComplianceResourceIds")]
        getter compliance_resource_ids : Array(String)?

        # Describes whether the control scope includes one or more types of resources, such as EFS or RDS .
        @[JSON::Field(key: "ComplianceResourceTypes")]
        getter compliance_resource_types : Array(String)?

        # The tag key-value pair applied to those Amazon Web Services resources that you want to trigger an
        # evaluation for a rule. A maximum of one key-value pair can be provided. The tag value is optional,
        # but it cannot be an empty string if you are creating or editing a framework from the console (though
        # the value can be an empty string when included in a CloudFormation template). The structure to
        # assign a tag is: [{"Key":"string","Value":"string"}] .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @compliance_resource_ids : Array(String)? = nil,
          @compliance_resource_types : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The details of the copy operation.
      struct CopyAction
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied
        # backup. For example, arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "DestinationBackupVaultArn")]
        getter destination_backup_vault_arn : String

        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        def initialize(
          @destination_backup_vault_arn : String,
          @lifecycle : Types::Lifecycle? = nil
        )
        end
      end

      # Contains detailed information about a copy job.
      struct CopyJob
        include JSON::Serializable

        # The account ID that owns the copy job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The size, in bytes, of a copy job.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # This returns the statistics of the included child (nested) copy jobs.
        @[JSON::Field(key: "ChildJobsInState")]
        getter child_jobs_in_state : Hash(String, Int64)?

        # The date and time a copy job is completed, in Unix format and Coordinated Universal Time (UTC). The
        # value of CompletionDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # The identifier of a resource within a composite group, such as nested (child) recovery point
        # belonging to a composite (parent) stack. The ID is transferred from the logical ID within a stack.
        @[JSON::Field(key: "CompositeMemberIdentifier")]
        getter composite_member_identifier : String?

        # Uniquely identifies a copy job.
        @[JSON::Field(key: "CopyJobId")]
        getter copy_job_id : String?

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RecoveryPointCreator?

        # The backup job ID that initiated this copy job. Only applicable to scheduled copy jobs and automatic
        # copy jobs to logically air-gapped vault.
        @[JSON::Field(key: "CreatedByBackupJobId")]
        getter created_by_backup_job_id : String?

        # The date and time a copy job is created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies a destination copy vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "DestinationBackupVaultArn")]
        getter destination_backup_vault_arn : String?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the copied backup in the destination
        # vault. This can be a customer-managed key or an Amazon Web Services managed key.
        @[JSON::Field(key: "DestinationEncryptionKeyArn")]
        getter destination_encryption_key_arn : String?

        # An ARN that uniquely identifies a destination recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "DestinationRecoveryPointArn")]
        getter destination_recovery_point_arn : String?

        @[JSON::Field(key: "DestinationRecoveryPointLifecycle")]
        getter destination_recovery_point_lifecycle : Types::Lifecycle?

        # The lock state of the destination backup vault. For logically air-gapped vaults, this indicates
        # whether the vault is locked in compliance mode. Valid values include LOCKED and UNLOCKED .
        @[JSON::Field(key: "DestinationVaultLockState")]
        getter destination_vault_lock_state : String?

        # The type of destination backup vault where the copied recovery point is stored. Valid values are
        # BACKUP_VAULT for standard backup vaults and LOGICALLY_AIR_GAPPED_BACKUP_VAULT for logically
        # air-gapped vaults.
        @[JSON::Field(key: "DestinationVaultType")]
        getter destination_vault_type : String?

        # Specifies the IAM role ARN used to copy the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is a boolean value indicating this is a parent (composite) copy job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # This parameter is the job count for the specified message category. Example strings may include
        # AccessDenied , SUCCESS , AGGREGATE_ALL , and InvalidParameters . See Monitoring for a list of
        # MessageCategory strings. The the value ANY returns count of all message categories. AGGREGATE_ALL
        # aggregates job counts for all message categories and returns the sum
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # The number of child (nested) copy jobs.
        @[JSON::Field(key: "NumberOfChildJobs")]
        getter number_of_child_jobs : Int64?

        # This uniquely identifies a request to Backup to copy a resource. The return will be the parent
        # (composite) job ID.
        @[JSON::Field(key: "ParentJobId")]
        getter parent_job_id : String?

        # The Amazon Web Services resource to be copied; for example, an Amazon Elastic Block Store (Amazon
        # EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource to be copied; for example, an Amazon Elastic Block Store
        # (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a source copy vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "SourceBackupVaultArn")]
        getter source_backup_vault_arn : String?

        # An ARN that uniquely identifies a source recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "SourceRecoveryPointArn")]
        getter source_recovery_point_arn : String?

        # The current state of a copy job.
        @[JSON::Field(key: "State")]
        getter state : String?

        # A detailed message explaining the status of the job to copy a resource.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @account_id : String? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @child_jobs_in_state : Hash(String, Int64)? = nil,
          @completion_date : Time? = nil,
          @composite_member_identifier : String? = nil,
          @copy_job_id : String? = nil,
          @created_by : Types::RecoveryPointCreator? = nil,
          @created_by_backup_job_id : String? = nil,
          @creation_date : Time? = nil,
          @destination_backup_vault_arn : String? = nil,
          @destination_encryption_key_arn : String? = nil,
          @destination_recovery_point_arn : String? = nil,
          @destination_recovery_point_lifecycle : Types::Lifecycle? = nil,
          @destination_vault_lock_state : String? = nil,
          @destination_vault_type : String? = nil,
          @iam_role_arn : String? = nil,
          @is_parent : Bool? = nil,
          @message_category : String? = nil,
          @number_of_child_jobs : Int64? = nil,
          @parent_job_id : String? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @source_backup_vault_arn : String? = nil,
          @source_recovery_point_arn : String? = nil,
          @state : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # This is a summary of copy jobs created or running within the most recent 30 days. The returned
      # summary may contain the following: Region, Account, State, RestourceType, MessageCategory,
      # StartTime, EndTime, and Count of included jobs.
      struct CopyJobSummary
        include JSON::Serializable

        # The account ID that owns the jobs within the summary.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The value as a number of jobs in a job summary.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of time in number format of a job end time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # This parameter is the job count for the specified message category. Example strings include
        # AccessDenied , Success , and InvalidParameters . See Monitoring for a list of MessageCategory
        # strings. The the value ANY returns count of all message categories. AGGREGATE_ALL aggregates job
        # counts for all message categories and returns the sum.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # The Amazon Web Services Regions within the job summary.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # This value is the job count for the specified resource type. The request GetSupportedResourceTypes
        # returns strings for supported resource types
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The value of time in number format of a job start time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # This value is job count for jobs with the specified state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @count : Int32? = nil,
          @end_time : Time? = nil,
          @message_category : String? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      struct CreateBackupPlanInput
        include JSON::Serializable

        # The body of a backup plan. Includes a BackupPlanName and one or more sets of Rules .
        @[JSON::Field(key: "BackupPlan")]
        getter backup_plan : Types::BackupPlanInput

        # The tags to assign to the backup plan.
        @[JSON::Field(key: "BackupPlanTags")]
        getter backup_plan_tags : Hash(String, String)?

        # Identifies the request and allows failed requests to be retried without the risk of running the
        # operation twice. If the request includes a CreatorRequestId that matches an existing backup plan,
        # that plan is returned. This parameter is optional. If used, this parameter must contain 1 to 50
        # alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        def initialize(
          @backup_plan : Types::BackupPlanInput,
          @backup_plan_tags : Hash(String, String)? = nil,
          @creator_request_id : String? = nil
        )
        end
      end

      struct CreateBackupPlanOutput
        include JSON::Serializable

        # The settings for a resource type. This option is only available for Windows Volume Shadow Copy
        # Service (VSS) backup jobs.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # The ID of the backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time that a backup plan is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long. They
        # cannot be edited.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @creation_date : Time? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct CreateBackupSelectionInput
        include JSON::Serializable

        # The ID of the backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # The body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "BackupSelection")]
        getter backup_selection : Types::BackupSelection

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        def initialize(
          @backup_plan_id : String,
          @backup_selection : Types::BackupSelection,
          @creator_request_id : String? = nil
        )
        end
      end

      struct CreateBackupSelectionOutput
        include JSON::Serializable

        # The ID of the backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time a backup selection is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Uniquely identifies the body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "SelectionId")]
        getter selection_id : String?

        def initialize(
          @backup_plan_id : String? = nil,
          @creation_date : Time? = nil,
          @selection_id : String? = nil
        )
        end
      end

      struct CreateBackupVaultInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created. They consist of letters, numbers, and hyphens.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The tags to assign to the backup vault.
        @[JSON::Field(key: "BackupVaultTags")]
        getter backup_vault_tags : Hash(String, String)?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The server-side encryption key that is used to protect your backups; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @backup_vault_name : String,
          @backup_vault_tags : Hash(String, String)? = nil,
          @creator_request_id : String? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      struct CreateBackupVaultOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created. They consist of
        # lowercase letters, numbers, and hyphens.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time a backup vault is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_date : Time? = nil
        )
        end
      end

      struct CreateFrameworkInput
        include JSON::Serializable

        # The controls that make up the framework. Each control in the list has a name, input parameters, and
        # scope.
        @[JSON::Field(key: "FrameworkControls")]
        getter framework_controls : Array(Types::FrameworkControl)

        # The unique name of the framework. The name must be between 1 and 256 characters, starting with a
        # letter, and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "FrameworkName")]
        getter framework_name : String

        # An optional description of the framework with a maximum of 1,024 characters.
        @[JSON::Field(key: "FrameworkDescription")]
        getter framework_description : String?

        # The tags to assign to the framework.
        @[JSON::Field(key: "FrameworkTags")]
        getter framework_tags : Hash(String, String)?

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # CreateFrameworkInput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @framework_controls : Array(Types::FrameworkControl),
          @framework_name : String,
          @framework_description : String? = nil,
          @framework_tags : Hash(String, String)? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct CreateFrameworkOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "FrameworkArn")]
        getter framework_arn : String?

        # The unique name of the framework. The name must be between 1 and 256 characters, starting with a
        # letter, and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "FrameworkName")]
        getter framework_name : String?

        def initialize(
          @framework_arn : String? = nil,
          @framework_name : String? = nil
        )
        end
      end

      struct CreateLegalHoldInput
        include JSON::Serializable

        # The description of the legal hold.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The title of the legal hold.
        @[JSON::Field(key: "Title")]
        getter title : String

        # This is a user-chosen string used to distinguish between otherwise identical calls. Retrying a
        # successful request with the same idempotency token results in a success message with no action
        # taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The criteria to assign a set of resources, such as resource types or backup vaults.
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RecoveryPointSelection?

        # Optional tags to include. A tag is a key-value pair you can use to manage, filter, and search for
        # your resources. Allowed characters include UTF-8 letters, numbers, spaces, and the following
        # characters: + - = . _ : /.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @title : String,
          @idempotency_token : String? = nil,
          @recovery_point_selection : Types::RecoveryPointSelection? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateLegalHoldOutput
        include JSON::Serializable

        # The time when the legal hold was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of the legal hold.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the legal hold.
        @[JSON::Field(key: "LegalHoldArn")]
        getter legal_hold_arn : String?

        # The ID of the legal hold.
        @[JSON::Field(key: "LegalHoldId")]
        getter legal_hold_id : String?

        # The criteria to assign to a set of resources, such as resource types or backup vaults.
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RecoveryPointSelection?

        # The status of the legal hold.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The title of the legal hold.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @creation_date : Time? = nil,
          @description : String? = nil,
          @legal_hold_arn : String? = nil,
          @legal_hold_id : String? = nil,
          @recovery_point_selection : Types::RecoveryPointSelection? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct CreateLogicallyAirGappedBackupVaultInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Logically air-gapped backup vaults are
        # identified by names that are unique to the account used to create them and the Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The maximum retention period that the vault retains its recovery points.
        @[JSON::Field(key: "MaxRetentionDays")]
        getter max_retention_days : Int64

        # This setting specifies the minimum retention period that the vault retains its recovery points. The
        # minimum value accepted is 7 days.
        @[JSON::Field(key: "MinRetentionDays")]
        getter min_retention_days : Int64

        # The tags to assign to the vault.
        @[JSON::Field(key: "BackupVaultTags")]
        getter backup_vault_tags : Hash(String, String)?

        # The ID of the creation request. This parameter is optional. If used, this parameter must contain 1
        # to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The ARN of the customer-managed KMS key to use for encrypting the logically air-gapped backup vault.
        # If not specified, the vault will be encrypted with an Amazon Web Services-owned key managed by
        # Amazon Web Services Backup.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @backup_vault_name : String,
          @max_retention_days : Int64,
          @min_retention_days : Int64,
          @backup_vault_tags : Hash(String, String)? = nil,
          @creator_request_id : String? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      struct CreateLogicallyAirGappedBackupVaultOutput
        include JSON::Serializable

        # The ARN (Amazon Resource Name) of the vault.
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Logically air-gapped backup vaults are
        # identified by names that are unique to the account used to create them and the Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time when the vault was created. This value is in Unix format, Coordinated Universal
        # Time (UTC), and accurate to milliseconds. For example, the value 1516925490.087 represents Friday,
        # January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The current state of the vault.
        @[JSON::Field(key: "VaultState")]
        getter vault_state : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_date : Time? = nil,
          @vault_state : String? = nil
        )
        end
      end

      struct CreateReportPlanInput
        include JSON::Serializable

        # A structure that contains information about where and how to deliver your reports, specifically your
        # Amazon S3 bucket name, S3 key prefix, and the formats of your reports.
        @[JSON::Field(key: "ReportDeliveryChannel")]
        getter report_delivery_channel : Types::ReportDeliveryChannel

        # The unique name of the report plan. The name must be between 1 and 256 characters, starting with a
        # letter, and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "ReportPlanName")]
        getter report_plan_name : String

        # Identifies the report template for the report. Reports are built using a report template. The report
        # templates are: RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT | BACKUP_JOB_REPORT |
        # COPY_JOB_REPORT | RESTORE_JOB_REPORT | SCAN_JOB_REPORT If the report template is
        # RESOURCE_COMPLIANCE_REPORT or CONTROL_COMPLIANCE_REPORT , this API resource also describes the
        # report coverage by Amazon Web Services Regions and frameworks.
        @[JSON::Field(key: "ReportSetting")]
        getter report_setting : Types::ReportSetting

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # CreateReportPlanInput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # An optional description of the report plan with a maximum of 1,024 characters.
        @[JSON::Field(key: "ReportPlanDescription")]
        getter report_plan_description : String?

        # The tags to assign to the report plan.
        @[JSON::Field(key: "ReportPlanTags")]
        getter report_plan_tags : Hash(String, String)?

        def initialize(
          @report_delivery_channel : Types::ReportDeliveryChannel,
          @report_plan_name : String,
          @report_setting : Types::ReportSetting,
          @idempotency_token : String? = nil,
          @report_plan_description : String? = nil,
          @report_plan_tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateReportPlanOutput
        include JSON::Serializable

        # The date and time a backup vault is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ReportPlanArn")]
        getter report_plan_arn : String?

        # The unique name of the report plan.
        @[JSON::Field(key: "ReportPlanName")]
        getter report_plan_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @report_plan_arn : String? = nil,
          @report_plan_name : String? = nil
        )
        end
      end

      struct CreateRestoreAccessBackupVaultInput
        include JSON::Serializable

        # The ARN of the source backup vault containing the recovery points to which temporary access is
        # requested.
        @[JSON::Field(key: "SourceBackupVaultArn")]
        getter source_backup_vault_arn : String

        # The name of the backup vault to associate with an MPA approval team.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # Optional tags to assign to the restore access backup vault.
        @[JSON::Field(key: "BackupVaultTags")]
        getter backup_vault_tags : Hash(String, String)?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of executing the operation twice.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A comment explaining the reason for requesting restore access to the backup vault.
        @[JSON::Field(key: "RequesterComment")]
        getter requester_comment : String?

        def initialize(
          @source_backup_vault_arn : String,
          @backup_vault_name : String? = nil,
          @backup_vault_tags : Hash(String, String)? = nil,
          @creator_request_id : String? = nil,
          @requester_comment : String? = nil
        )
        end
      end

      struct CreateRestoreAccessBackupVaultOutput
        include JSON::Serializable

        # &gt;The date and time when the restore access backup vault was created, in Unix format and
        # Coordinated Universal Time
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The ARN that uniquely identifies the created restore access backup vault.
        @[JSON::Field(key: "RestoreAccessBackupVaultArn")]
        getter restore_access_backup_vault_arn : String?

        # The name of the created restore access backup vault.
        @[JSON::Field(key: "RestoreAccessBackupVaultName")]
        getter restore_access_backup_vault_name : String?

        # The current state of the restore access backup vault.
        @[JSON::Field(key: "VaultState")]
        getter vault_state : String?

        def initialize(
          @creation_date : Time? = nil,
          @restore_access_backup_vault_arn : String? = nil,
          @restore_access_backup_vault_name : String? = nil,
          @vault_state : String? = nil
        )
        end
      end

      struct CreateRestoreTestingPlanInput
        include JSON::Serializable

        # A restore testing plan must contain a unique RestoreTestingPlanName string you create and must
        # contain a ScheduleExpression cron. You may optionally include a StartWindowHours integer and a
        # CreatorRequestId string. The RestoreTestingPlanName is a unique string that is the name of the
        # restore testing plan. This cannot be changed after creation, and it must consist of only
        # alphanumeric characters and underscores.
        @[JSON::Field(key: "RestoreTestingPlan")]
        getter restore_testing_plan : Types::RestoreTestingPlanForCreate

        # This is a unique string that identifies the request and allows failed requests to be retriedwithout
        # the risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The tags to assign to the restore testing plan.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @restore_testing_plan : Types::RestoreTestingPlanForCreate,
          @creator_request_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateRestoreTestingPlanOutput
        include JSON::Serializable

        # The date and time a restore testing plan was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # An Amazon Resource Name (ARN) that uniquely identifies the created restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # This unique string is the name of the restore testing plan. The name cannot be changed after
        # creation. The name consists of only alphanumeric characters and underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        def initialize(
          @creation_time : Time,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String
        )
        end
      end

      struct CreateRestoreTestingSelectionInput
        include JSON::Serializable

        # Input the restore testing plan name that was returned from the related CreateRestoreTestingPlan
        # request.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # This consists of RestoreTestingSelectionName , ProtectedResourceType , and one of the following:
        # ProtectedResourceArns ProtectedResourceConditions Each protected resource type can have one single
        # value. A restore testing selection can include a wildcard value ("*") for ProtectedResourceArns
        # along with ProtectedResourceConditions . Alternatively, you can include up to 30 specific protected
        # resource ARNs in ProtectedResourceArns .
        @[JSON::Field(key: "RestoreTestingSelection")]
        getter restore_testing_selection : Types::RestoreTestingSelectionForCreate

        # This is an optional unique string that identifies the request and allows failed requests to be
        # retried without the risk of running the operation twice. If used, this parameter must contain 1 to
        # 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        def initialize(
          @restore_testing_plan_name : String,
          @restore_testing_selection : Types::RestoreTestingSelectionForCreate,
          @creator_request_id : String? = nil
        )
        end
      end

      struct CreateRestoreTestingSelectionOutput
        include JSON::Serializable

        # The time that the resource testing selection was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The ARN of the restore testing plan with which the restore testing selection is associated.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # The name of the restore testing plan. The name cannot be changed after creation. The name consists
        # of only alphanumeric characters and underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # The name of the restore testing selection for the related restore testing plan. The name cannot be
        # changed after creation. The name consists of only alphanumeric characters and underscores. Maximum
        # length is 50.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        def initialize(
          @creation_time : Time,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String
        )
        end
      end

      struct CreateTieringConfigurationInput
        include JSON::Serializable

        # A tiering configuration must contain a unique TieringConfigurationName string you create and must
        # contain a BackupVaultName and ResourceSelection . You may optionally include a CreatorRequestId
        # string. The TieringConfigurationName is a unique string that is the name of the tiering
        # configuration. This cannot be changed after creation, and it must consist of only alphanumeric
        # characters and underscores.
        @[JSON::Field(key: "TieringConfiguration")]
        getter tiering_configuration : Types::TieringConfigurationInputForCreate

        # This is a unique string that identifies the request and allows failed requests to be retried without
        # the risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The tags to assign to the tiering configuration.
        @[JSON::Field(key: "TieringConfigurationTags")]
        getter tiering_configuration_tags : Hash(String, String)?

        def initialize(
          @tiering_configuration : Types::TieringConfigurationInputForCreate,
          @creator_request_id : String? = nil,
          @tiering_configuration_tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTieringConfigurationOutput
        include JSON::Serializable

        # The date and time a tiering configuration was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies the created tiering configuration.
        @[JSON::Field(key: "TieringConfigurationArn")]
        getter tiering_configuration_arn : String?

        # This unique string is the name of the tiering configuration. The name cannot be changed after
        # creation. The name consists of only alphanumeric characters and underscores. Maximum length is 200.
        @[JSON::Field(key: "TieringConfigurationName")]
        getter tiering_configuration_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @tiering_configuration_arn : String? = nil,
          @tiering_configuration_name : String? = nil
        )
        end
      end

      # This is a resource filter containing FromDate: DateTime and ToDate: DateTime. Both values are
      # required. Future DateTime values are not permitted. The date and time are in Unix format and
      # Coordinated Universal Time (UTC), and it is accurate to milliseconds ((milliseconds are optional).
      # For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
      struct DateRange
        include JSON::Serializable

        # This value is the beginning date, inclusive. The date and time are in Unix format and Coordinated
        # Universal Time (UTC), and it is accurate to milliseconds (milliseconds are optional).
        @[JSON::Field(key: "FromDate")]
        getter from_date : Time

        # This value is the end date, inclusive. The date and time are in Unix format and Coordinated
        # Universal Time (UTC), and it is accurate to milliseconds (milliseconds are optional).
        @[JSON::Field(key: "ToDate")]
        getter to_date : Time

        def initialize(
          @from_date : Time,
          @to_date : Time
        )
        end
      end

      struct DeleteBackupPlanInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        def initialize(
          @backup_plan_id : String
        )
        end
      end

      struct DeleteBackupPlanOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time a backup plan is deleted, in Unix format and Coordinated Universal Time (UTC). The
        # value of DeletionDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "DeletionDate")]
        getter deletion_date : Time?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version IDs cannot be edited.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @deletion_date : Time? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct DeleteBackupSelectionInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # Uniquely identifies the body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "selectionId")]
        getter selection_id : String

        def initialize(
          @backup_plan_id : String,
          @selection_id : String
        )
        end
      end

      struct DeleteBackupVaultAccessPolicyInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created. They consist of lowercase letters, numbers, and hyphens.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct DeleteBackupVaultInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct DeleteBackupVaultLockConfigurationInput
        include JSON::Serializable

        # The name of the backup vault from which to delete Backup Vault Lock.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct DeleteBackupVaultNotificationsInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct DeleteFrameworkInput
        include JSON::Serializable

        # The unique name of a framework.
        @[JSON::Field(key: "frameworkName")]
        getter framework_name : String

        def initialize(
          @framework_name : String
        )
        end
      end

      struct DeleteRecoveryPointInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String
        )
        end
      end

      struct DeleteReportPlanInput
        include JSON::Serializable

        # The unique name of a report plan.
        @[JSON::Field(key: "reportPlanName")]
        getter report_plan_name : String

        def initialize(
          @report_plan_name : String
        )
        end
      end

      struct DeleteRestoreTestingPlanInput
        include JSON::Serializable

        # Required unique name of the restore testing plan you wish to delete.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        def initialize(
          @restore_testing_plan_name : String
        )
        end
      end

      struct DeleteRestoreTestingSelectionInput
        include JSON::Serializable

        # Required unique name of the restore testing plan that contains the restore testing selection you
        # wish to delete.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # Required unique name of the restore testing selection you wish to delete.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        def initialize(
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String
        )
        end
      end

      struct DeleteTieringConfigurationInput
        include JSON::Serializable

        # The unique name of a tiering configuration.
        @[JSON::Field(key: "tieringConfigurationName")]
        getter tiering_configuration_name : String

        def initialize(
          @tiering_configuration_name : String
        )
        end
      end

      struct DeleteTieringConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A dependent Amazon Web Services service or resource returned an error to the Backup service, and the
      # action cannot be completed.
      struct DependencyFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeBackupJobInput
        include JSON::Serializable

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "backupJobId")]
        getter backup_job_id : String

        def initialize(
          @backup_job_id : String
        )
        end
      end

      struct DescribeBackupJobOutput
        include JSON::Serializable

        # Returns the account ID that owns the backup job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "BackupJobId")]
        getter backup_job_id : String?

        # Represents the options specified as part of backup plan or on-demand backup job.
        @[JSON::Field(key: "BackupOptions")]
        getter backup_options : Hash(String, String)?

        # The size, in bytes, of a backup (recovery point). This value can render differently depending on the
        # resource type as Backup pulls in data information from other Amazon Web Services services. For
        # example, the value returned may show a value of 0 , which may differ from the anticipated value. The
        # expected behavior for values by resource type are described as follows: Amazon Aurora, Amazon
        # DocumentDB, and Amazon Neptune do not have this value populate from the operation GetBackupJobStatus
        # . For Amazon DynamoDB with advanced features, this value refers to the size of the recovery point
        # (backup). Amazon EC2 and Amazon EBS show volume size (provisioned storage) returned as part of this
        # value. Amazon EBS does not return backup size information; snapshot size will have the same value as
        # the original resource that was backed up. For Amazon EFS, this value refers to the delta bytes
        # transferred during a backup. Amazon FSx does not populate this value from the operation
        # GetBackupJobStatus for FSx file systems. An Amazon RDS instance will show as 0 . For virtual
        # machines running VMware, this value is passed to Backup through an asynchronous workflow, which can
        # mean this displayed value can under-represent the actual backup size.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # Represents the actual backup type selected for a backup job. For example, if a successful Windows
        # Volume Shadow Copy Service (VSS) backup was taken, BackupType returns "WindowsVSS" . If BackupType
        # is empty, then the backup type was a regular backup.
        @[JSON::Field(key: "BackupType")]
        getter backup_type : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The size in bytes transferred to a backup vault at the time that the job status was queried.
        @[JSON::Field(key: "BytesTransferred")]
        getter bytes_transferred : Int64?

        # This returns the statistics of the included child (nested) backup jobs.
        @[JSON::Field(key: "ChildJobsInState")]
        getter child_jobs_in_state : Hash(String, Int64)?

        # The date and time that a job to create a backup job is completed, in Unix format and Coordinated
        # Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # Contains identifying information about the creation of a backup job, including the BackupPlanArn ,
        # BackupPlanId , BackupPlanVersion , and BackupRuleId of the backup plan that is used to create it.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RecoveryPointCreator?

        # The date and time that a backup job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the backup. This can be a
        # customer-managed key or an Amazon Web Services managed key, depending on the vault configuration.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The date and time that a job to back up resources is expected to be completed, in Unix format and
        # Coordinated Universal Time (UTC). The value of ExpectedCompletionDate is accurate to milliseconds.
        # For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "ExpectedCompletionDate")]
        getter expected_completion_date : Time?

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The date a backup job was initiated.
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # A boolean value indicating whether the backup is encrypted. All backups in Backup are encrypted, but
        # this field indicates the encryption status for transparency.
        @[JSON::Field(key: "IsEncrypted")]
        getter is_encrypted : Bool?

        # This returns the boolean value that a backup job is a parent (composite) job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # The job count for the specified message category. Example strings may include AccessDenied , SUCCESS
        # , AGGREGATE_ALL , and INVALIDPARAMETERS . View Monitoring for a list of accepted MessageCategory
        # strings.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # This returns the number of child (nested) backup jobs.
        @[JSON::Field(key: "NumberOfChildJobs")]
        getter number_of_child_jobs : Int64?

        # This returns the parent (composite) resource backup job ID.
        @[JSON::Field(key: "ParentJobId")]
        getter parent_job_id : String?

        # Contains an estimated percentage that is complete of a job at the time the job status was queried.
        @[JSON::Field(key: "PercentDone")]
        getter percent_done : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        @[JSON::Field(key: "RecoveryPointLifecycle")]
        getter recovery_point_lifecycle : Types::Lifecycle?

        # An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource
        # type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource to be backed up; for example, an Amazon Elastic Block Store
        # (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Specifies the time in Unix format and Coordinated Universal Time (UTC) when a backup job must be
        # started before it is canceled. The value is calculated by adding the start window to the scheduled
        # time. So if the scheduled time were 6:00 PM and the start window is 2 hours, the StartBy time would
        # be 8:00 PM on the date specified. The value of StartBy is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartBy")]
        getter start_by : Time?

        # The current state of a backup job.
        @[JSON::Field(key: "State")]
        getter state : String?

        # A detailed message explaining the status of the job to back up a resource.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The lock state of the backup vault. For logically air-gapped vaults, this indicates whether the
        # vault is locked in compliance mode. Valid values include LOCKED and UNLOCKED .
        @[JSON::Field(key: "VaultLockState")]
        getter vault_lock_state : String?

        # The type of backup vault where the recovery point is stored. Valid values are BACKUP_VAULT for
        # standard backup vaults and LOGICALLY_AIR_GAPPED_BACKUP_VAULT for logically air-gapped vaults.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @account_id : String? = nil,
          @backup_job_id : String? = nil,
          @backup_options : Hash(String, String)? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @backup_type : String? = nil,
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @bytes_transferred : Int64? = nil,
          @child_jobs_in_state : Hash(String, Int64)? = nil,
          @completion_date : Time? = nil,
          @created_by : Types::RecoveryPointCreator? = nil,
          @creation_date : Time? = nil,
          @encryption_key_arn : String? = nil,
          @expected_completion_date : Time? = nil,
          @iam_role_arn : String? = nil,
          @initiation_date : Time? = nil,
          @is_encrypted : Bool? = nil,
          @is_parent : Bool? = nil,
          @message_category : String? = nil,
          @number_of_child_jobs : Int64? = nil,
          @parent_job_id : String? = nil,
          @percent_done : String? = nil,
          @recovery_point_arn : String? = nil,
          @recovery_point_lifecycle : Types::Lifecycle? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @start_by : Time? = nil,
          @state : String? = nil,
          @status_message : String? = nil,
          @vault_lock_state : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      struct DescribeBackupVaultInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The account ID of the specified backup vault.
        @[JSON::Field(key: "backupVaultAccountId")]
        getter backup_vault_account_id : String?

        def initialize(
          @backup_vault_name : String,
          @backup_vault_account_id : String? = nil
        )
        end
      end

      struct DescribeBackupVaultOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time that a backup vault is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice. This parameter is optional. If used, this parameter must
        # contain 1 to 50 alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The server-side encryption key that is used to protect your backups; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption key used for the backup vault. Valid values are CUSTOMER_MANAGED_KMS_KEY for
        # customer-managed keys or Amazon Web Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
        @[JSON::Field(key: "EncryptionKeyType")]
        getter encryption_key_type : String?

        # Information about the latest update to the MPA approval team association for this backup vault.
        @[JSON::Field(key: "LatestMpaApprovalTeamUpdate")]
        getter latest_mpa_approval_team_update : Types::LatestMpaApprovalTeamUpdate?

        # The date and time when Backup Vault Lock configuration cannot be changed or deleted. If you applied
        # Vault Lock to your vault without specifying a lock date, you can change any of your Vault Lock
        # settings, or delete Vault Lock from the vault entirely, at any time. This value is in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LockDate")]
        getter lock_date : Time?

        # A Boolean that indicates whether Backup Vault Lock is currently protecting the backup vault. True
        # means that Vault Lock causes delete or update operations on the recovery points stored in the vault
        # to fail.
        @[JSON::Field(key: "Locked")]
        getter locked : Bool?

        # The Backup Vault Lock setting that specifies the maximum retention period that the vault retains its
        # recovery points. If this parameter is not specified, Vault Lock does not enforce a maximum retention
        # period on the recovery points in the vault (allowing indefinite storage). If specified, any backup
        # or copy job to the vault must have a lifecycle policy with a retention period equal to or shorter
        # than the maximum retention period. If the job's retention period is longer than that maximum
        # retention period, then the vault fails the backup or copy job, and you should either modify your
        # lifecycle settings or use a different vault. Recovery points already stored in the vault prior to
        # Vault Lock are not affected.
        @[JSON::Field(key: "MaxRetentionDays")]
        getter max_retention_days : Int64?

        # The Backup Vault Lock setting that specifies the minimum retention period that the vault retains its
        # recovery points. If this parameter is not specified, Vault Lock will not enforce a minimum retention
        # period. If specified, any backup or copy job to the vault must have a lifecycle policy with a
        # retention period equal to or longer than the minimum retention period. If the job's retention period
        # is shorter than that minimum retention period, then the vault fails the backup or copy job, and you
        # should either modify your lifecycle settings or use a different vault. Recovery points already
        # stored in the vault prior to Vault Lock are not affected.
        @[JSON::Field(key: "MinRetentionDays")]
        getter min_retention_days : Int64?

        # The ARN of the MPA approval team associated with this backup vault.
        @[JSON::Field(key: "MpaApprovalTeamArn")]
        getter mpa_approval_team_arn : String?

        # The ARN of the MPA session associated with this backup vault.
        @[JSON::Field(key: "MpaSessionArn")]
        getter mpa_session_arn : String?

        # The number of recovery points that are stored in a backup vault. Recovery point count value
        # displayed in the console can be an approximation. Use ListRecoveryPointsByBackupVault API to obtain
        # the exact count.
        @[JSON::Field(key: "NumberOfRecoveryPoints")]
        getter number_of_recovery_points : Int64?

        # The ARN of the source backup vault from which this restore access backup vault was created.
        @[JSON::Field(key: "SourceBackupVaultArn")]
        getter source_backup_vault_arn : String?

        # The current state of the vault.-&gt;
        @[JSON::Field(key: "VaultState")]
        getter vault_state : String?

        # The type of vault described.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_key_type : String? = nil,
          @latest_mpa_approval_team_update : Types::LatestMpaApprovalTeamUpdate? = nil,
          @lock_date : Time? = nil,
          @locked : Bool? = nil,
          @max_retention_days : Int64? = nil,
          @min_retention_days : Int64? = nil,
          @mpa_approval_team_arn : String? = nil,
          @mpa_session_arn : String? = nil,
          @number_of_recovery_points : Int64? = nil,
          @source_backup_vault_arn : String? = nil,
          @vault_state : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      struct DescribeCopyJobInput
        include JSON::Serializable

        # Uniquely identifies a copy job.
        @[JSON::Field(key: "copyJobId")]
        getter copy_job_id : String

        def initialize(
          @copy_job_id : String
        )
        end
      end

      struct DescribeCopyJobOutput
        include JSON::Serializable

        # Contains detailed information about a copy job.
        @[JSON::Field(key: "CopyJob")]
        getter copy_job : Types::CopyJob?

        def initialize(
          @copy_job : Types::CopyJob? = nil
        )
        end
      end

      struct DescribeFrameworkInput
        include JSON::Serializable

        # The unique name of a framework.
        @[JSON::Field(key: "frameworkName")]
        getter framework_name : String

        def initialize(
          @framework_name : String
        )
        end
      end

      struct DescribeFrameworkOutput
        include JSON::Serializable

        # The date and time that a framework is created, in ISO 8601 representation. The value of CreationTime
        # is accurate to milliseconds. For example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July
        # 2020 at 3:00 PM 8 hours behind UTC.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The deployment status of a framework. The statuses are: CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS |
        # DELETE_IN_PROGRESS | COMPLETED | FAILED
        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "FrameworkArn")]
        getter framework_arn : String?

        # The controls that make up the framework. Each control in the list has a name, input parameters, and
        # scope.
        @[JSON::Field(key: "FrameworkControls")]
        getter framework_controls : Array(Types::FrameworkControl)?

        # An optional description of the framework.
        @[JSON::Field(key: "FrameworkDescription")]
        getter framework_description : String?

        # The unique name of a framework.
        @[JSON::Field(key: "FrameworkName")]
        getter framework_name : String?

        # A framework consists of one or more controls. Each control governs a resource, such as backup plans,
        # backup selections, backup vaults, or recovery points. You can also turn Config recording on or off
        # for each resource. The statuses are: ACTIVE when recording is turned on for all resources governed
        # by the framework. PARTIALLY_ACTIVE when recording is turned off for at least one resource governed
        # by the framework. INACTIVE when recording is turned off for all resources governed by the framework.
        # UNAVAILABLE when Backup is unable to validate recording status at this time.
        @[JSON::Field(key: "FrameworkStatus")]
        getter framework_status : String?

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # DescribeFrameworkOutput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @creation_time : Time? = nil,
          @deployment_status : String? = nil,
          @framework_arn : String? = nil,
          @framework_controls : Array(Types::FrameworkControl)? = nil,
          @framework_description : String? = nil,
          @framework_name : String? = nil,
          @framework_status : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct DescribeGlobalSettingsInput
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeGlobalSettingsOutput
        include JSON::Serializable

        # The status of the flags isCrossAccountBackupEnabled , isMpaEnabled ('Mpa' refers to multi-party
        # approval), and isDelegatedAdministratorEnabled .
        @[JSON::Field(key: "GlobalSettings")]
        getter global_settings : Hash(String, String)?

        # The date and time that the flag isCrossAccountBackupEnabled was last updated. This update is in Unix
        # format and Coordinated Universal Time (UTC). The value of LastUpdateTime is accurate to
        # milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087
        # AM.
        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        def initialize(
          @global_settings : Hash(String, String)? = nil,
          @last_update_time : Time? = nil
        )
        end
      end

      struct DescribeProtectedResourceInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DescribeProtectedResourceOutput
        include JSON::Serializable

        # The date and time that a resource was last backed up, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastBackupTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastBackupTime")]
        getter last_backup_time : Time?

        # The ARN (Amazon Resource Name) of the backup vault that contains the most recent backup recovery
        # point.
        @[JSON::Field(key: "LastBackupVaultArn")]
        getter last_backup_vault_arn : String?

        # The ARN (Amazon Resource Name) of the most recent recovery point.
        @[JSON::Field(key: "LastRecoveryPointArn")]
        getter last_recovery_point_arn : String?

        # The time, in minutes, that the most recent restore job took to complete.
        @[JSON::Field(key: "LatestRestoreExecutionTimeMinutes")]
        getter latest_restore_execution_time_minutes : Int64?

        # The creation date of the most recent restore job.
        @[JSON::Field(key: "LatestRestoreJobCreationDate")]
        getter latest_restore_job_creation_date : Time?

        # The date the most recent recovery point was created.
        @[JSON::Field(key: "LatestRestoreRecoveryPointCreationDate")]
        getter latest_restore_recovery_point_creation_date : Time?

        # An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource saved as a recovery point; for example, an Amazon EBS
        # volume or an Amazon RDS database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @last_backup_time : Time? = nil,
          @last_backup_vault_arn : String? = nil,
          @last_recovery_point_arn : String? = nil,
          @latest_restore_execution_time_minutes : Int64? = nil,
          @latest_restore_job_creation_date : Time? = nil,
          @latest_restore_recovery_point_creation_date : Time? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct DescribeRecoveryPointInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        # The account ID of the specified backup vault.
        @[JSON::Field(key: "backupVaultAccountId")]
        getter backup_vault_account_id : String?

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String,
          @backup_vault_account_id : String? = nil
        )
        end
      end

      struct DescribeRecoveryPointOutput
        include JSON::Serializable

        # The size, in bytes, of a backup.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # An ARN that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # A CalculatedLifecycle object containing DeleteAt and MoveToColdStorageAt timestamps.
        @[JSON::Field(key: "CalculatedLifecycle")]
        getter calculated_lifecycle : Types::CalculatedLifecycle?

        # The date and time that a job to create a recovery point is completed, in Unix format and Coordinated
        # Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # The identifier of a resource within a composite group, such as nested (child) recovery point
        # belonging to a composite (parent) stack. The ID is transferred from the logical ID within a stack.
        @[JSON::Field(key: "CompositeMemberIdentifier")]
        getter composite_member_identifier : String?

        # Contains identifying information about the creation of a recovery point, including the BackupPlanArn
        # , BackupPlanId , BackupPlanVersion , and BackupRuleId of the backup plan used to create it.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RecoveryPointCreator?

        # The date and time that a recovery point is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The server-side encryption key used to protect your backups; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption key used for the recovery point. Valid values are CUSTOMER_MANAGED_KMS_KEY
        # for customer-managed keys or Amazon Web Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
        @[JSON::Field(key: "EncryptionKeyType")]
        getter encryption_key_type : String?

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # A string in the form of a detailed message explaining the status of a backup index associated with
        # the recovery point.
        @[JSON::Field(key: "IndexStatusMessage")]
        getter index_status_message : String?

        # The date and time when the backup job that created this recovery point was initiated, in Unix format
        # and Coordinated Universal Time (UTC).
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # A Boolean value that is returned as TRUE if the specified recovery point is encrypted, or FALSE if
        # the recovery point is not encrypted.
        @[JSON::Field(key: "IsEncrypted")]
        getter is_encrypted : Bool?

        # This returns the boolean value that a recovery point is a parent (composite) job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # The date and time that a recovery point was last restored, in Unix format and Coordinated Universal
        # Time (UTC). The value of LastRestoreTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastRestoreTime")]
        getter last_restore_time : Time?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup transitions and expires backups automatically according to the lifecycle that you define.
        # Backups that are transitioned to cold storage must be stored in cold storage for a minimum of 90
        # days. Therefore, the “retention” setting must be 90 days greater than the “transition to cold after
        # days” setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold. Resource types that can transition to cold storage are listed in the Feature
        # availability by resource table. Backup ignores this expression for other resource types.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # This is an ARN that uniquely identifies a parent (composite) recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "ParentRecoveryPointArn")]
        getter parent_recovery_point_arn : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # An ARN that uniquely identifies a saved resource. The format of the ARN depends on the resource
        # type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource to save as a recovery point; for example, an Amazon Elastic
        # Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Contains the latest scanning results against the recovery point and currently include MalwareScanner
        # , ScanJobState , Findings , and LastScanTimestamp
        @[JSON::Field(key: "ScanResults")]
        getter scan_results : Array(Types::ScanResult)?

        # An Amazon Resource Name (ARN) that uniquely identifies the source vault where the resource was
        # originally backed up in; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault . If the recovery is restored to the
        # same Amazon Web Services account or Region, this value will be null .
        @[JSON::Field(key: "SourceBackupVaultArn")]
        getter source_backup_vault_arn : String?

        # A status code specifying the state of the recovery point. For more information, see Recovery point
        # status in the Backup Developer Guide . CREATING status indicates that an Backup job has been
        # initiated for a resource. The backup process has started and is actively processing a backup job for
        # the associated recovery point. AVAILABLE status indicates that the backup was successfully created
        # for the recovery point. The backup process has completed without any issues, and the recovery point
        # is now ready for use. PARTIAL status indicates a composite recovery point has one or more nested
        # recovery points that were not in the backup. EXPIRED status indicates that the recovery point has
        # exceeded its retention period, but Backup lacks permission or is otherwise unable to delete it. To
        # manually delete these recovery points, see Step 3: Delete the recovery points in the Clean up
        # resources section of Getting started . STOPPED status occurs on a continuous backup where a user has
        # taken some action that causes the continuous backup to be disabled. This can be caused by the
        # removal of permissions, turning off versioning, turning off events being sent to EventBridge, or
        # disabling the EventBridge rules that are put in place by Backup. For recovery points of Amazon S3,
        # Amazon RDS, and Amazon Aurora resources, this status occurs when the retention period of a
        # continuous backup rule is changed. To resolve STOPPED status, ensure that all requested permissions
        # are in place and that versioning is enabled on the S3 bucket. Once these conditions are met, the
        # next instance of a backup rule running will result in a new continuous recovery point being created.
        # The recovery points with STOPPED status do not need to be deleted. For SAP HANA on Amazon EC2
        # STOPPED status occurs due to user action, application misconfiguration, or backup failure. To ensure
        # that future continuous backups succeed, refer to the recovery point status and check SAP HANA for
        # details.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A status message explaining the status of the recovery point.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Specifies the storage class of the recovery point. Valid values are WARM or COLD .
        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # The type of vault in which the described recovery point is stored.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @backup_size_in_bytes : Int64? = nil,
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @calculated_lifecycle : Types::CalculatedLifecycle? = nil,
          @completion_date : Time? = nil,
          @composite_member_identifier : String? = nil,
          @created_by : Types::RecoveryPointCreator? = nil,
          @creation_date : Time? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_key_type : String? = nil,
          @iam_role_arn : String? = nil,
          @index_status : String? = nil,
          @index_status_message : String? = nil,
          @initiation_date : Time? = nil,
          @is_encrypted : Bool? = nil,
          @is_parent : Bool? = nil,
          @last_restore_time : Time? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @parent_recovery_point_arn : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @scan_results : Array(Types::ScanResult)? = nil,
          @source_backup_vault_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @storage_class : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      struct DescribeRegionSettingsInput
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeRegionSettingsOutput
        include JSON::Serializable

        # Returns whether Backup fully manages the backups for a resource type. For the benefits of full
        # Backup management, see Full Backup management . For a list of resource types and whether each
        # supports full Backup management, see the Feature availability by resource table. If "DynamoDB":false
        # , you can enable full Backup management for DynamoDB backup by enabling Backup's advanced DynamoDB
        # backup features .
        @[JSON::Field(key: "ResourceTypeManagementPreference")]
        getter resource_type_management_preference : Hash(String, Bool)?

        # The services along with the opt-in preferences in the Region.
        @[JSON::Field(key: "ResourceTypeOptInPreference")]
        getter resource_type_opt_in_preference : Hash(String, Bool)?

        def initialize(
          @resource_type_management_preference : Hash(String, Bool)? = nil,
          @resource_type_opt_in_preference : Hash(String, Bool)? = nil
        )
        end
      end

      struct DescribeReportJobInput
        include JSON::Serializable

        # The identifier of the report job. A unique, randomly generated, Unicode, UTF-8 encoded string that
        # is at most 1,024 bytes long. The report job ID cannot be edited.
        @[JSON::Field(key: "reportJobId")]
        getter report_job_id : String

        def initialize(
          @report_job_id : String
        )
        end
      end

      struct DescribeReportJobOutput
        include JSON::Serializable

        # The information about a report job, including its completion and creation times, report destination,
        # unique report job ID, Amazon Resource Name (ARN), report template, status, and status message.
        @[JSON::Field(key: "ReportJob")]
        getter report_job : Types::ReportJob?

        def initialize(
          @report_job : Types::ReportJob? = nil
        )
        end
      end

      struct DescribeReportPlanInput
        include JSON::Serializable

        # The unique name of a report plan.
        @[JSON::Field(key: "reportPlanName")]
        getter report_plan_name : String

        def initialize(
          @report_plan_name : String
        )
        end
      end

      struct DescribeReportPlanOutput
        include JSON::Serializable

        # Returns details about the report plan that is specified by its name. These details include the
        # report plan's Amazon Resource Name (ARN), description, settings, delivery channel, deployment
        # status, creation time, and last attempted and successful run times.
        @[JSON::Field(key: "ReportPlan")]
        getter report_plan : Types::ReportPlan?

        def initialize(
          @report_plan : Types::ReportPlan? = nil
        )
        end
      end

      struct DescribeRestoreJobInput
        include JSON::Serializable

        # Uniquely identifies the job that restores a recovery point.
        @[JSON::Field(key: "restoreJobId")]
        getter restore_job_id : String

        def initialize(
          @restore_job_id : String
        )
        end
      end

      struct DescribeRestoreJobOutput
        include JSON::Serializable

        # Returns the account ID that owns the restore job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The size, in bytes, of the restored resource.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # The Amazon Resource Name (ARN) of the backup vault containing the recovery point being restored.
        # This helps identify vault access policies and permissions.
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The date and time that a job to restore a recovery point is completed, in Unix format and
        # Coordinated Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For
        # example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # Contains identifying information about the creation of a restore job.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RestoreJobCreator?

        # The Amazon Resource Name (ARN) of the resource that was created by the restore job. The format of
        # the ARN depends on the resource type of the backed-up resource.
        @[JSON::Field(key: "CreatedResourceArn")]
        getter created_resource_arn : String?

        # The date and time that a restore job is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The status of the data generated by the restore test.
        @[JSON::Field(key: "DeletionStatus")]
        getter deletion_status : String?

        # This describes the restore job deletion status.
        @[JSON::Field(key: "DeletionStatusMessage")]
        getter deletion_status_message : String?

        # The amount of time in minutes that a job restoring a recovery point is expected to take.
        @[JSON::Field(key: "ExpectedCompletionTimeMinutes")]
        getter expected_completion_time_minutes : Int64?

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is a boolean value indicating whether the restore job is a parent (composite) restore job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # This is the unique identifier of the parent restore job for the selected restore job.
        @[JSON::Field(key: "ParentJobId")]
        getter parent_job_id : String?

        # Contains an estimated percentage that is complete of a job at the time the job status was queried.
        @[JSON::Field(key: "PercentDone")]
        getter percent_done : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The creation date of the recovery point made by the specifed restore job.
        @[JSON::Field(key: "RecoveryPointCreationDate")]
        getter recovery_point_creation_date : Time?

        # Returns metadata associated with a restore job listed by resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Uniquely identifies the job that restores a recovery point.
        @[JSON::Field(key: "RestoreJobId")]
        getter restore_job_id : String?

        # The Amazon Resource Name (ARN) of the original resource that was backed up. This provides context
        # about what resource is being restored.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        # Status code specifying the state of the job that is initiated by Backup to restore a recovery point.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message showing the status of a job to restore a recovery point.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The status of validation run on the indicated restore job.
        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String?

        # The status message.
        @[JSON::Field(key: "ValidationStatusMessage")]
        getter validation_status_message : String?

        def initialize(
          @account_id : String? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @backup_vault_arn : String? = nil,
          @completion_date : Time? = nil,
          @created_by : Types::RestoreJobCreator? = nil,
          @created_resource_arn : String? = nil,
          @creation_date : Time? = nil,
          @deletion_status : String? = nil,
          @deletion_status_message : String? = nil,
          @expected_completion_time_minutes : Int64? = nil,
          @iam_role_arn : String? = nil,
          @is_parent : Bool? = nil,
          @parent_job_id : String? = nil,
          @percent_done : String? = nil,
          @recovery_point_arn : String? = nil,
          @recovery_point_creation_date : Time? = nil,
          @resource_type : String? = nil,
          @restore_job_id : String? = nil,
          @source_resource_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @validation_status : String? = nil,
          @validation_status_message : String? = nil
        )
        end
      end

      struct DescribeScanJobInput
        include JSON::Serializable

        # Uniquely identifies a request to Backup to scan a resource.
        @[JSON::Field(key: "ScanJobId")]
        getter scan_job_id : String

        def initialize(
          @scan_job_id : String
        )
        end
      end

      struct DescribeScanJobOutput
        include JSON::Serializable

        # Returns the account ID that owns the scan job. Pattern: ^[0-9]{12}$
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created. Pattern: ^[a-zA-Z0-9\-\_\.]{2,50}$
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::ScanJobCreator

        # The date and time that a backup index finished creation, in Unix format and Coordinated Universal
        # Time (UTC). The value of CreationDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The scanning engine used for the corresponding scan job. Currently only GUARDUTY is supported.
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String

        # An ARN that uniquely identifies the target recovery point for scanning.; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # An ARN that uniquely identifies the source resource of the corresponding recovery point ARN.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The type of Amazon Web Services Resource to be backed up; for example, an Amazon Elastic Block Store
        # (Amazon EBS) volume. Pattern: ^[a-zA-Z0-9\-\_\.]{1,50}$
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The scan job ID that uniquely identified the request to Backup.
        @[JSON::Field(key: "ScanJobId")]
        getter scan_job_id : String

        # Specifies the scan type used for the scan job.
        @[JSON::Field(key: "ScanMode")]
        getter scan_mode : String

        # Specifies the scanner IAM role ARN used to for the scan job.
        @[JSON::Field(key: "ScannerRoleArn")]
        getter scanner_role_arn : String

        # The current state of a scan job.
        @[JSON::Field(key: "State")]
        getter state : String

        # The date and time that a backup index finished creation, in Unix format and Coordinated Universal
        # Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # An ARN that uniquely identifies the base recovery point for scanning. This field will only be
        # populated when an incremental scan job has taken place.
        @[JSON::Field(key: "ScanBaseRecoveryPointArn")]
        getter scan_base_recovery_point_arn : String?

        # The scan ID generated by Amazon GuardDuty for the corresponding Scan Job ID request from Backup.
        @[JSON::Field(key: "ScanId")]
        getter scan_id : String?

        # Contains the ScanResultsStatus for the scanning job and returns THREATS_FOUND or NO_THREATS_FOUND
        # for completed jobs.
        @[JSON::Field(key: "ScanResult")]
        getter scan_result : Types::ScanResultInfo?

        # A detailed message explaining the status of the job to back up a resource.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @account_id : String,
          @backup_vault_arn : String,
          @backup_vault_name : String,
          @created_by : Types::ScanJobCreator,
          @creation_date : Time,
          @iam_role_arn : String,
          @malware_scanner : String,
          @recovery_point_arn : String,
          @resource_arn : String,
          @resource_name : String,
          @resource_type : String,
          @scan_job_id : String,
          @scan_mode : String,
          @scanner_role_arn : String,
          @state : String,
          @completion_date : Time? = nil,
          @scan_base_recovery_point_arn : String? = nil,
          @scan_id : String? = nil,
          @scan_result : Types::ScanResultInfo? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct DisassociateBackupVaultMpaApprovalTeamInput
        include JSON::Serializable

        # The name of the backup vault from which to disassociate the MPA approval team.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An optional comment explaining the reason for disassociating the MPA approval team from the backup
        # vault.
        @[JSON::Field(key: "RequesterComment")]
        getter requester_comment : String?

        def initialize(
          @backup_vault_name : String,
          @requester_comment : String? = nil
        )
        end
      end

      struct DisassociateRecoveryPointFromParentInput
        include JSON::Serializable

        # The name of a logical container where the child (nested) recovery point is stored. Backup vaults are
        # identified by names that are unique to the account used to create them and the Amazon Web Services
        # Region where they are created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The Amazon Resource Name (ARN) that uniquely identifies the child (nested) recovery point; for
        # example, arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String
        )
        end
      end

      struct DisassociateRecoveryPointInput
        include JSON::Serializable

        # The unique name of an Backup vault.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies an Backup recovery point.
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String
        )
        end
      end

      struct ExportBackupPlanTemplateInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        def initialize(
          @backup_plan_id : String
        )
        end
      end

      struct ExportBackupPlanTemplateOutput
        include JSON::Serializable

        # The body of a backup plan template in JSON format. This is a signed JSON document that cannot be
        # modified before being passed to GetBackupPlanFromJSON.
        @[JSON::Field(key: "BackupPlanTemplateJson")]
        getter backup_plan_template_json : String?

        def initialize(
          @backup_plan_template_json : String? = nil
        )
        end
      end

      # Contains detailed information about a framework. Frameworks contain controls, which evaluate and
      # report on your backup events and resources. Frameworks generate daily compliance results.
      struct Framework
        include JSON::Serializable

        # The date and time that a framework is created, in ISO 8601 representation. The value of CreationTime
        # is accurate to milliseconds. For example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July
        # 2020 at 3:00 PM 8 hours behind UTC.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The deployment status of a framework. The statuses are: CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS |
        # DELETE_IN_PROGRESS | COMPLETED | FAILED
        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "FrameworkArn")]
        getter framework_arn : String?

        # An optional description of the framework with a maximum 1,024 characters.
        @[JSON::Field(key: "FrameworkDescription")]
        getter framework_description : String?

        # The unique name of a framework. This name is between 1 and 256 characters, starting with a letter,
        # and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "FrameworkName")]
        getter framework_name : String?

        # The number of controls contained by the framework.
        @[JSON::Field(key: "NumberOfControls")]
        getter number_of_controls : Int32?

        def initialize(
          @creation_time : Time? = nil,
          @deployment_status : String? = nil,
          @framework_arn : String? = nil,
          @framework_description : String? = nil,
          @framework_name : String? = nil,
          @number_of_controls : Int32? = nil
        )
        end
      end

      # Contains detailed information about all of the controls of a framework. Each framework must contain
      # at least one control.
      struct FrameworkControl
        include JSON::Serializable

        # The name of a control. This name is between 1 and 256 characters.
        @[JSON::Field(key: "ControlName")]
        getter control_name : String

        # The name/value pairs.
        @[JSON::Field(key: "ControlInputParameters")]
        getter control_input_parameters : Array(Types::ControlInputParameter)?

        # The scope of a control. The control scope defines what the control will evaluate. Three examples of
        # control scopes are: a specific backup plan, all backup plans with a specific tag, or all backup
        # plans. For more information, see ControlScope .
        @[JSON::Field(key: "ControlScope")]
        getter control_scope : Types::ControlScope?

        def initialize(
          @control_name : String,
          @control_input_parameters : Array(Types::ControlInputParameter)? = nil,
          @control_scope : Types::ControlScope? = nil
        )
        end
      end

      struct GetBackupPlanFromJSONInput
        include JSON::Serializable

        # A customer-supplied backup plan document in JSON format.
        @[JSON::Field(key: "BackupPlanTemplateJson")]
        getter backup_plan_template_json : String

        def initialize(
          @backup_plan_template_json : String
        )
        end
      end

      struct GetBackupPlanFromJSONOutput
        include JSON::Serializable

        # Specifies the body of a backup plan. Includes a BackupPlanName and one or more sets of Rules .
        @[JSON::Field(key: "BackupPlan")]
        getter backup_plan : Types::BackupPlan?

        def initialize(
          @backup_plan : Types::BackupPlan? = nil
        )
        end
      end

      struct GetBackupPlanFromTemplateInput
        include JSON::Serializable

        # Uniquely identifies a stored backup plan template.
        @[JSON::Field(key: "templateId")]
        getter backup_plan_template_id : String

        def initialize(
          @backup_plan_template_id : String
        )
        end
      end

      struct GetBackupPlanFromTemplateOutput
        include JSON::Serializable

        # Returns the body of a backup plan based on the target template, including the name, rules, and
        # backup vault of the plan.
        @[JSON::Field(key: "BackupPlanDocument")]
        getter backup_plan_document : Types::BackupPlan?

        def initialize(
          @backup_plan_document : Types::BackupPlan? = nil
        )
        end
      end

      struct GetBackupPlanInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # Number of future scheduled backup runs to preview. When set to 0 (default), no scheduled runs
        # preview is included in the response. Valid range is 0-10.
        @[JSON::Field(key: "MaxScheduledRunsPreview")]
        getter max_scheduled_runs_preview : Int32?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version IDs cannot be edited.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @backup_plan_id : String,
          @max_scheduled_runs_preview : Int32? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct GetBackupPlanOutput
        include JSON::Serializable

        # Contains a list of BackupOptions for each resource type. The list is populated only if the advanced
        # option is set for the backup plan.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # Specifies the body of a backup plan. Includes a BackupPlanName and one or more sets of Rules .
        @[JSON::Field(key: "BackupPlan")]
        getter backup_plan : Types::BackupPlan?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time that a backup plan is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The date and time that a backup plan is deleted, in Unix format and Coordinated Universal Time
        # (UTC). The value of DeletionDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "DeletionDate")]
        getter deletion_date : Time?

        # The last time this backup plan was run. A date and time, in Unix format and Coordinated Universal
        # Time (UTC). The value of LastExecutionDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastExecutionDate")]
        getter last_execution_date : Time?

        # List of upcoming scheduled backup runs. Only included when MaxScheduledRunsPreview parameter is
        # greater than 0. Contains up to 10 future backup executions with their scheduled times, execution
        # types, and associated rule IDs.
        @[JSON::Field(key: "ScheduledRunsPreview")]
        getter scheduled_runs_preview : Array(Types::ScheduledPlanExecutionMember)?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version IDs cannot be edited.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @backup_plan : Types::BackupPlan? = nil,
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @deletion_date : Time? = nil,
          @last_execution_date : Time? = nil,
          @scheduled_runs_preview : Array(Types::ScheduledPlanExecutionMember)? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct GetBackupSelectionInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # Uniquely identifies the body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "selectionId")]
        getter selection_id : String

        def initialize(
          @backup_plan_id : String,
          @selection_id : String
        )
        end
      end

      struct GetBackupSelectionOutput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # Specifies the body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "BackupSelection")]
        getter backup_selection : Types::BackupSelection?

        # The date and time a backup selection is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # A unique string that identifies the request and allows failed requests to be retried without the
        # risk of running the operation twice.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # Uniquely identifies the body of a request to assign a set of resources to a backup plan.
        @[JSON::Field(key: "SelectionId")]
        getter selection_id : String?

        def initialize(
          @backup_plan_id : String? = nil,
          @backup_selection : Types::BackupSelection? = nil,
          @creation_date : Time? = nil,
          @creator_request_id : String? = nil,
          @selection_id : String? = nil
        )
        end
      end

      struct GetBackupVaultAccessPolicyInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct GetBackupVaultAccessPolicyOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The backup vault access policy document in JSON format.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @policy : String? = nil
        )
        end
      end

      struct GetBackupVaultNotificationsInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        def initialize(
          @backup_vault_name : String
        )
        end
      end

      struct GetBackupVaultNotificationsOutput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # An array of events that indicate the status of jobs to back up resources to the backup vault.
        @[JSON::Field(key: "BackupVaultEvents")]
        getter backup_vault_events : Array(String)?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # An ARN that uniquely identifies an Amazon Simple Notification Service (Amazon SNS) topic; for
        # example, arn:aws:sns:us-west-2:111122223333:MyTopic .
        @[JSON::Field(key: "SNSTopicArn")]
        getter sns_topic_arn : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @backup_vault_events : Array(String)? = nil,
          @backup_vault_name : String? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      struct GetLegalHoldInput
        include JSON::Serializable

        # The ID of the legal hold.
        @[JSON::Field(key: "legalHoldId")]
        getter legal_hold_id : String

        def initialize(
          @legal_hold_id : String
        )
        end
      end

      struct GetLegalHoldOutput
        include JSON::Serializable

        # The reason for removing the legal hold.
        @[JSON::Field(key: "CancelDescription")]
        getter cancel_description : String?

        # The time when the legal hold was cancelled.
        @[JSON::Field(key: "CancellationDate")]
        getter cancellation_date : Time?

        # The time when the legal hold was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of the legal hold.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The framework ARN for the specified legal hold. The format of the ARN depends on the resource type.
        @[JSON::Field(key: "LegalHoldArn")]
        getter legal_hold_arn : String?

        # The ID of the legal hold.
        @[JSON::Field(key: "LegalHoldId")]
        getter legal_hold_id : String?

        # The criteria to assign a set of resources, such as resource types or backup vaults.
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RecoveryPointSelection?

        # The date and time until which the legal hold record is retained.
        @[JSON::Field(key: "RetainRecordUntil")]
        getter retain_record_until : Time?

        # The status of the legal hold.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The title of the legal hold.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @cancel_description : String? = nil,
          @cancellation_date : Time? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @legal_hold_arn : String? = nil,
          @legal_hold_id : String? = nil,
          @recovery_point_selection : Types::RecoveryPointSelection? = nil,
          @retain_record_until : Time? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct GetRecoveryPointIndexDetailsInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created. Accepted
        # characters include lowercase letters, numbers, and hyphens.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String
        )
        end
      end

      struct GetRecoveryPointIndexDetailsOutput
        include JSON::Serializable

        # An ARN that uniquely identifies the backup vault where the recovery point index is stored. For
        # example, arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The date and time that a backup index finished creation, in Unix format and Coordinated Universal
        # Time (UTC). The value of CreationDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "IndexCompletionDate")]
        getter index_completion_date : Time?

        # The date and time that a backup index was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "IndexCreationDate")]
        getter index_creation_date : Time?

        # The date and time that a backup index was deleted, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "IndexDeletionDate")]
        getter index_deletion_date : Time?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # A detailed message explaining the status of a backup index associated with the recovery point.
        @[JSON::Field(key: "IndexStatusMessage")]
        getter index_status_message : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # A string of the Amazon Resource Name (ARN) that uniquely identifies the source resource.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        # Count of items within the backup index associated with the recovery point.
        @[JSON::Field(key: "TotalItemsIndexed")]
        getter total_items_indexed : Int64?

        def initialize(
          @backup_vault_arn : String? = nil,
          @index_completion_date : Time? = nil,
          @index_creation_date : Time? = nil,
          @index_deletion_date : Time? = nil,
          @index_status : String? = nil,
          @index_status_message : String? = nil,
          @recovery_point_arn : String? = nil,
          @source_resource_arn : String? = nil,
          @total_items_indexed : Int64? = nil
        )
        end
      end

      struct GetRecoveryPointRestoreMetadataInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        # The account ID of the specified backup vault.
        @[JSON::Field(key: "backupVaultAccountId")]
        getter backup_vault_account_id : String?

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String,
          @backup_vault_account_id : String? = nil
        )
        end
      end

      struct GetRecoveryPointRestoreMetadataOutput
        include JSON::Serializable

        # An ARN that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The resource type of the recovery point.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The set of metadata key-value pairs that describe the original configuration of the backed-up
        # resource. These values vary depending on the service that is being restored.
        @[JSON::Field(key: "RestoreMetadata")]
        getter restore_metadata : Hash(String, String)?

        def initialize(
          @backup_vault_arn : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_type : String? = nil,
          @restore_metadata : Hash(String, String)? = nil
        )
        end
      end

      struct GetRestoreJobMetadataInput
        include JSON::Serializable

        # This is a unique identifier of a restore job within Backup.
        @[JSON::Field(key: "restoreJobId")]
        getter restore_job_id : String

        def initialize(
          @restore_job_id : String
        )
        end
      end

      struct GetRestoreJobMetadataOutput
        include JSON::Serializable

        # This contains the metadata of the specified backup job.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # This is a unique identifier of a restore job within Backup.
        @[JSON::Field(key: "RestoreJobId")]
        getter restore_job_id : String?

        def initialize(
          @metadata : Hash(String, String)? = nil,
          @restore_job_id : String? = nil
        )
        end
      end

      struct GetRestoreTestingInferredMetadataInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web ServicesRegion where they are
        # created. They consist of letters, numbers, and hyphens.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # The account ID of the specified backup vault.
        @[JSON::Field(key: "BackupVaultAccountId")]
        getter backup_vault_account_id : String?

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String,
          @backup_vault_account_id : String? = nil
        )
        end
      end

      struct GetRestoreTestingInferredMetadataOutput
        include JSON::Serializable

        # This is a string map of the metadata inferred from the request.
        @[JSON::Field(key: "InferredMetadata")]
        getter inferred_metadata : Hash(String, String)

        def initialize(
          @inferred_metadata : Hash(String, String)
        )
        end
      end

      struct GetRestoreTestingPlanInput
        include JSON::Serializable

        # Required unique name of the restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        def initialize(
          @restore_testing_plan_name : String
        )
        end
      end

      struct GetRestoreTestingPlanOutput
        include JSON::Serializable

        # Specifies the body of a restore testing plan. Includes RestoreTestingPlanName .
        @[JSON::Field(key: "RestoreTestingPlan")]
        getter restore_testing_plan : Types::RestoreTestingPlanForGet

        def initialize(
          @restore_testing_plan : Types::RestoreTestingPlanForGet
        )
        end
      end

      struct GetRestoreTestingSelectionInput
        include JSON::Serializable

        # Required unique name of the restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # Required unique name of the restore testing selection.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        def initialize(
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String
        )
        end
      end

      struct GetRestoreTestingSelectionOutput
        include JSON::Serializable

        # Unique name of the restore testing selection.
        @[JSON::Field(key: "RestoreTestingSelection")]
        getter restore_testing_selection : Types::RestoreTestingSelectionForGet

        def initialize(
          @restore_testing_selection : Types::RestoreTestingSelectionForGet
        )
        end
      end

      struct GetSupportedResourceTypesOutput
        include JSON::Serializable

        # Contains a string with the supported Amazon Web Services resource types: Aurora for Amazon Aurora
        # CloudFormation for CloudFormation DocumentDB for Amazon DocumentDB (with MongoDB compatibility)
        # DynamoDB for Amazon DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon Elastic Compute Cloud
        # EFS for Amazon Elastic File System FSx for Amazon FSx Neptune for Amazon Neptune RDS for Amazon
        # Relational Database Service Redshift for Amazon Redshift S3 for Amazon Simple Storage Service
        # (Amazon S3) SAP HANA on Amazon EC2 for SAP HANA databases on Amazon Elastic Compute Cloud instances
        # Storage Gateway for Storage Gateway Timestream for Amazon Timestream VirtualMachine for VMware
        # virtual machines
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @resource_types : Array(String)? = nil
        )
        end
      end

      struct GetTieringConfigurationInput
        include JSON::Serializable

        # The unique name of a tiering configuration.
        @[JSON::Field(key: "tieringConfigurationName")]
        getter tiering_configuration_name : String

        def initialize(
          @tiering_configuration_name : String
        )
        end
      end

      struct GetTieringConfigurationOutput
        include JSON::Serializable

        # Specifies the body of a tiering configuration. Includes TieringConfigurationName .
        @[JSON::Field(key: "TieringConfiguration")]
        getter tiering_configuration : Types::TieringConfiguration?

        def initialize(
          @tiering_configuration : Types::TieringConfiguration? = nil
        )
        end
      end

      # This is an optional array within a BackupRule. IndexAction consists of one ResourceTypes.
      struct IndexAction
        include JSON::Serializable

        # 0 or 1 index action will be accepted for each BackupRule. Valid values: EBS for Amazon Elastic Block
        # Store S3 for Amazon Simple Storage Service (Amazon S3)
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @resource_types : Array(String)? = nil
        )
        end
      end

      # This is a recovery point that has an associated backup index. Only recovery points with a backup
      # index can be included in a search.
      struct IndexedRecoveryPoint
        include JSON::Serializable

        # The date and time that a backup was created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "BackupCreationDate")]
        getter backup_creation_date : Time?

        # An ARN that uniquely identifies the backup vault where the recovery point index is stored. For
        # example, arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # This specifies the IAM role ARN used for this operation. For example,
        # arn:aws:iam::123456789012:role/S3Access
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The date and time that a backup index was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "IndexCreationDate")]
        getter index_creation_date : Time?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # A string in the form of a detailed message explaining the status of a backup index associated with
        # the recovery point.
        @[JSON::Field(key: "IndexStatusMessage")]
        getter index_status_message : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The resource type of the indexed recovery point. EBS for Amazon Elastic Block Store S3 for Amazon
        # Simple Storage Service (Amazon S3)
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # A string of the Amazon Resource Name (ARN) that uniquely identifies the source resource.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        def initialize(
          @backup_creation_date : Time? = nil,
          @backup_vault_arn : String? = nil,
          @iam_role_arn : String? = nil,
          @index_creation_date : Time? = nil,
          @index_status : String? = nil,
          @index_status_message : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_type : String? = nil,
          @source_resource_arn : String? = nil
        )
        end
      end

      # Indicates that something is wrong with a parameter's value. For example, the value is out of range.
      struct InvalidParameterValueException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Indicates that something is wrong with the input to the request. For example, a parameter is of the
      # wrong type.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Backup is already performing an action on this recovery point. It can't perform the action you
      # requested until the first action finishes. Try again later.
      struct InvalidResourceStateException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Pair of two related strings. Allowed characters are letters, white space, and numbers that can be
      # represented in UTF-8 and the following characters: + - = . _ : /
      struct KeyValue
        include JSON::Serializable

        # The tag key (String). The key can't start with aws: . Length Constraints: Minimum length of 1.
        # Maximum length of 128. Pattern: ^(?![aA]{1}[wW]{1}[sS]{1}:)([\p{L}\p{Z}\p{N}_.:/=+\-@]+)$
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key. Length Constraints: Maximum length of 256. Pattern:
        # ^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Contains information about the latest update to an MPA approval team association.
      struct LatestMpaApprovalTeamUpdate
        include JSON::Serializable

        # The date and time when the MPA approval team update will expire.
        @[JSON::Field(key: "ExpiryDate")]
        getter expiry_date : Time?

        # The date and time when the MPA approval team update was initiated.
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # The ARN of the MPA session associated with this update.
        @[JSON::Field(key: "MpaSessionArn")]
        getter mpa_session_arn : String?

        # The current status of the MPA approval team update.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message describing the current status of the MPA approval team update.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @expiry_date : Time? = nil,
          @initiation_date : Time? = nil,
          @mpa_session_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains information about the latest request to revoke access to a backup vault.
      struct LatestRevokeRequest
        include JSON::Serializable

        # The date and time when the revoke request will expire.
        @[JSON::Field(key: "ExpiryDate")]
        getter expiry_date : Time?

        # The date and time when the revoke request was initiated.
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # The ARN of the MPA session associated with this revoke request.
        @[JSON::Field(key: "MpaSessionArn")]
        getter mpa_session_arn : String?

        # The current status of the revoke request.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message describing the current status of the revoke request.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @expiry_date : Time? = nil,
          @initiation_date : Time? = nil,
          @mpa_session_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A legal hold is an administrative tool that helps prevent backups from being deleted while under a
      # hold. While the hold is in place, backups under a hold cannot be deleted and lifecycle policies that
      # would alter the backup status (such as transition to cold storage) are delayed until the legal hold
      # is removed. A backup can have more than one legal hold. Legal holds are applied to one or more
      # backups (also known as recovery points). These backups can be filtered by resource types and by
      # resource IDs.
      struct LegalHold
        include JSON::Serializable

        # The time when the legal hold was cancelled.
        @[JSON::Field(key: "CancellationDate")]
        getter cancellation_date : Time?

        # The time when the legal hold was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of a legal hold.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the legal hold; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "LegalHoldArn")]
        getter legal_hold_arn : String?

        # The ID of the legal hold.
        @[JSON::Field(key: "LegalHoldId")]
        getter legal_hold_id : String?

        # The status of the legal hold.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The title of a legal hold.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @cancellation_date : Time? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @legal_hold_arn : String? = nil,
          @legal_hold_id : String? = nil,
          @status : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Specifies the time period, in days, before a recovery point transitions to cold storage or is
      # deleted. Backups transitioned to cold storage must be stored in cold storage for a minimum of 90
      # days. Therefore, on the console, the retention setting must be 90 days greater than the transition
      # to cold after days setting. The transition to cold after days setting can't be changed after a
      # backup has been transitioned to cold. Resource types that can transition to cold storage are listed
      # in the Feature availability by resource table. Backup ignores this expression for other resource
      # types. To remove the existing lifecycle and retention periods and keep your recovery points
      # indefinitely, specify -1 for MoveToColdStorageAfterDays and DeleteAfterDays .
      struct Lifecycle
        include JSON::Serializable

        # The number of days after creation that a recovery point is deleted. This value must be at least 90
        # days after the number of days specified in MoveToColdStorageAfterDays .
        @[JSON::Field(key: "DeleteAfterDays")]
        getter delete_after_days : Int64?

        # The event after which a recovery point is deleted. A recovery point with both DeleteAfterDays and
        # DeleteAfterEvent will delete after whichever condition is satisfied first. Not valid as an input.
        @[JSON::Field(key: "DeleteAfterEvent")]
        getter delete_after_event : String?

        # The number of days after creation that a recovery point is moved to cold storage.
        @[JSON::Field(key: "MoveToColdStorageAfterDays")]
        getter move_to_cold_storage_after_days : Int64?

        # If the value is true, your backup plan transitions supported resources to archive (cold) storage
        # tier in accordance with your lifecycle settings.
        @[JSON::Field(key: "OptInToArchiveForSupportedResources")]
        getter opt_in_to_archive_for_supported_resources : Bool?

        def initialize(
          @delete_after_days : Int64? = nil,
          @delete_after_event : String? = nil,
          @move_to_cold_storage_after_days : Int64? = nil,
          @opt_in_to_archive_for_supported_resources : Bool? = nil
        )
        end
      end

      # A limit in the request has been exceeded; for example, a maximum number of items allowed in a
      # request.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListBackupJobSummariesInput
        include JSON::Serializable

        # Returns the job count for the specified account. If the request is sent from a member account or an
        # account not part of Amazon Web Services Organizations, jobs within requestor's account will be
        # returned. Root, admin, and delegated administrator accounts can use the value ANY to return job
        # counts from every account in the organization. AGGREGATE_ALL aggregates job counts from all accounts
        # within the authenticated organization, then returns the sum.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The maximum number of items to be returned. The value is an integer. Range of accepted values is
        # from 1 to 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This parameter returns the job count for the specified message category. Example accepted strings
        # include AccessDenied , Success , and InvalidParameters . See Monitoring for a list of accepted
        # MessageCategory strings. The the value ANY returns count of all message categories. AGGREGATE_ALL
        # aggregates job counts for all message categories and returns the sum.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the job count for the specified resource type. Use request GetSupportedResourceTypes to
        # obtain strings for supported resource types. The the value ANY returns count of all resource types.
        # AGGREGATE_ALL aggregates job counts for all resource types and returns the sum. The type of Amazon
        # Web Services resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS)
        # volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # This parameter returns the job count for jobs with the specified state. The the value ANY returns
        # count of all states. AGGREGATE_ALL aggregates job counts for all states and returns the sum.
        # Completed with issues is a status found only in the Backup console. For API, this status refers to
        # jobs with a state of COMPLETED and a MessageCategory with a value other than SUCCESS ; that is, the
        # status is completed but comes with a status message. To obtain the job count for Completed with
        # issues , run two GET requests, and subtract the second, smaller number: GET
        # /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&amp;State=COMPLETED GET
        # /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&amp;MessageCategory=SUCCESS&amp;State=COMPLETED
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @aggregation_period : String? = nil,
          @max_results : Int32? = nil,
          @message_category : String? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListBackupJobSummariesOutput
        include JSON::Serializable

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The summary information.
        @[JSON::Field(key: "BackupJobSummaries")]
        getter backup_job_summaries : Array(Types::BackupJobSummary)?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregation_period : String? = nil,
          @backup_job_summaries : Array(Types::BackupJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupJobsInput
        include JSON::Serializable

        # The account ID to list the jobs from. Returns only backup jobs associated with the specified account
        # ID. If used from an Organizations management account, passing * returns all jobs across the
        # organization.
        @[JSON::Field(key: "accountId")]
        getter by_account_id : String?

        # Returns only backup jobs that will be stored in the specified backup vault. Backup vaults are
        # identified by names that are unique to the account used to create them and the Amazon Web Services
        # Region where they are created.
        @[JSON::Field(key: "backupVaultName")]
        getter by_backup_vault_name : String?

        # Returns only backup jobs completed after a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeAfter")]
        getter by_complete_after : Time?

        # Returns only backup jobs completed before a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeBefore")]
        getter by_complete_before : Time?

        # Returns only backup jobs that were created after the specified date.
        @[JSON::Field(key: "createdAfter")]
        getter by_created_after : Time?

        # Returns only backup jobs that were created before the specified date.
        @[JSON::Field(key: "createdBefore")]
        getter by_created_before : Time?

        # This is an optional parameter that can be used to filter out jobs with a MessageCategory which
        # matches the value you input. Example strings may include AccessDenied , SUCCESS , AGGREGATE_ALL ,
        # and InvalidParameters . View Monitoring The wildcard () returns count of all message categories.
        # AGGREGATE_ALL aggregates job counts for all message categories and returns the sum.
        @[JSON::Field(key: "messageCategory")]
        getter by_message_category : String?

        # This is a filter to list child (nested) jobs based on parent job ID.
        @[JSON::Field(key: "parentJobId")]
        getter by_parent_job_id : String?

        # Returns only backup jobs that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter by_resource_arn : String?

        # Returns only backup jobs for the specified resources: Aurora for Amazon Aurora CloudFormation for
        # CloudFormation DocumentDB for Amazon DocumentDB (with MongoDB compatibility) DynamoDB for Amazon
        # DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon Elastic Compute Cloud EFS for Amazon
        # Elastic File System FSx for Amazon FSx Neptune for Amazon Neptune RDS for Amazon Relational Database
        # Service Redshift for Amazon Redshift S3 for Amazon Simple Storage Service (Amazon S3) SAP HANA on
        # Amazon EC2 for SAP HANA databases on Amazon Elastic Compute Cloud instances Storage Gateway for
        # Storage Gateway Timestream for Amazon Timestream VirtualMachine for VMware virtual machines
        @[JSON::Field(key: "resourceType")]
        getter by_resource_type : String?

        # Returns only backup jobs that are in the specified state. Completed with issues is a status found
        # only in the Backup console. For API, this status refers to jobs with a state of COMPLETED and a
        # MessageCategory with a value other than SUCCESS ; that is, the status is completed but comes with a
        # status message. To obtain the job count for Completed with issues , run two GET requests, and
        # subtract the second, smaller number: GET /backup-jobs/?state=COMPLETED GET
        # /backup-jobs/?messageCategory=SUCCESS&amp;state=COMPLETED
        @[JSON::Field(key: "state")]
        getter by_state : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @by_account_id : String? = nil,
          @by_backup_vault_name : String? = nil,
          @by_complete_after : Time? = nil,
          @by_complete_before : Time? = nil,
          @by_created_after : Time? = nil,
          @by_created_before : Time? = nil,
          @by_message_category : String? = nil,
          @by_parent_job_id : String? = nil,
          @by_resource_arn : String? = nil,
          @by_resource_type : String? = nil,
          @by_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupJobsOutput
        include JSON::Serializable

        # An array of structures containing metadata about your backup jobs returned in JSON format.
        @[JSON::Field(key: "BackupJobs")]
        getter backup_jobs : Array(Types::BackupJob)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_jobs : Array(Types::BackupJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlanTemplatesInput
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlanTemplatesOutput
        include JSON::Serializable

        # An array of template list items containing metadata about your saved templates.
        @[JSON::Field(key: "BackupPlanTemplatesList")]
        getter backup_plan_templates_list : Array(Types::BackupPlanTemplatesListMember)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_plan_templates_list : Array(Types::BackupPlanTemplatesListMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlanVersionsInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backup_plan_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlanVersionsOutput
        include JSON::Serializable

        # An array of version list items containing metadata about your backup plans.
        @[JSON::Field(key: "BackupPlanVersionsList")]
        getter backup_plan_versions_list : Array(Types::BackupPlansListMember)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_plan_versions_list : Array(Types::BackupPlansListMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlansInput
        include JSON::Serializable

        # A Boolean value with a default value of FALSE that returns deleted backup plans when set to TRUE .
        @[JSON::Field(key: "includeDeleted")]
        getter include_deleted : Bool?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @include_deleted : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupPlansOutput
        include JSON::Serializable

        # Information about the backup plans.
        @[JSON::Field(key: "BackupPlansList")]
        getter backup_plans_list : Array(Types::BackupPlansListMember)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_plans_list : Array(Types::BackupPlansListMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupSelectionsInput
        include JSON::Serializable

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backup_plan_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupSelectionsOutput
        include JSON::Serializable

        # An array of backup selection list items containing metadata about each resource in the list.
        @[JSON::Field(key: "BackupSelectionsList")]
        getter backup_selections_list : Array(Types::BackupSelectionsListMember)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_selections_list : Array(Types::BackupSelectionsListMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupVaultsInput
        include JSON::Serializable

        # This parameter will sort the list of vaults by shared vaults.
        @[JSON::Field(key: "shared")]
        getter by_shared : Bool?

        # This parameter will sort the list of vaults by vault type.
        @[JSON::Field(key: "vaultType")]
        getter by_vault_type : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @by_shared : Bool? = nil,
          @by_vault_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackupVaultsOutput
        include JSON::Serializable

        # An array of backup vault list members containing vault metadata, including Amazon Resource Name
        # (ARN), display name, creation date, number of saved recovery points, and encryption information if
        # the resources saved in the backup vault are encrypted.
        @[JSON::Field(key: "BackupVaultList")]
        getter backup_vault_list : Array(Types::BackupVaultListMember)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @backup_vault_list : Array(Types::BackupVaultListMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCopyJobSummariesInput
        include JSON::Serializable

        # Returns the job count for the specified account. If the request is sent from a member account or an
        # account not part of Amazon Web Services Organizations, jobs within requestor's account will be
        # returned. Root, admin, and delegated administrator accounts can use the value ANY to return job
        # counts from every account in the organization. AGGREGATE_ALL aggregates job counts from all accounts
        # within the authenticated organization, then returns the sum.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # This parameter sets the maximum number of items to be returned. The value is an integer. Range of
        # accepted values is from 1 to 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # This parameter returns the job count for the specified message category. Example accepted strings
        # include AccessDenied , Success , and InvalidParameters . See Monitoring for a list of accepted
        # MessageCategory strings. The the value ANY returns count of all message categories. AGGREGATE_ALL
        # aggregates job counts for all message categories and returns the sum.
        @[JSON::Field(key: "MessageCategory")]
        getter message_category : String?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the job count for the specified resource type. Use request GetSupportedResourceTypes to
        # obtain strings for supported resource types. The the value ANY returns count of all resource types.
        # AGGREGATE_ALL aggregates job counts for all resource types and returns the sum. The type of Amazon
        # Web Services resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS)
        # volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # This parameter returns the job count for jobs with the specified state. The the value ANY returns
        # count of all states. AGGREGATE_ALL aggregates job counts for all states and returns the sum.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @aggregation_period : String? = nil,
          @max_results : Int32? = nil,
          @message_category : String? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListCopyJobSummariesOutput
        include JSON::Serializable

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # This return shows a summary that contains Region, Account, State, ResourceType, MessageCategory,
        # StartTime, EndTime, and Count of included jobs.
        @[JSON::Field(key: "CopyJobSummaries")]
        getter copy_job_summaries : Array(Types::CopyJobSummary)?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aggregation_period : String? = nil,
          @copy_job_summaries : Array(Types::CopyJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCopyJobsInput
        include JSON::Serializable

        # The account ID to list the jobs from. Returns only copy jobs associated with the specified account
        # ID.
        @[JSON::Field(key: "accountId")]
        getter by_account_id : String?

        # Returns only copy jobs completed after a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeAfter")]
        getter by_complete_after : Time?

        # Returns only copy jobs completed before a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeBefore")]
        getter by_complete_before : Time?

        # Returns only copy jobs that were created after the specified date.
        @[JSON::Field(key: "createdAfter")]
        getter by_created_after : Time?

        # Returns only copy jobs that were created before the specified date.
        @[JSON::Field(key: "createdBefore")]
        getter by_created_before : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies a source backup vault to copy from; for
        # example, arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "destinationVaultArn")]
        getter by_destination_vault_arn : String?

        # This is an optional parameter that can be used to filter out jobs with a MessageCategory which
        # matches the value you input. Example strings may include AccessDenied , SUCCESS , AGGREGATE_ALL ,
        # and INVALIDPARAMETERS . View Monitoring for a list of accepted strings. The the value ANY returns
        # count of all message categories. AGGREGATE_ALL aggregates job counts for all message categories and
        # returns the sum.
        @[JSON::Field(key: "messageCategory")]
        getter by_message_category : String?

        # This is a filter to list child (nested) jobs based on parent job ID.
        @[JSON::Field(key: "parentJobId")]
        getter by_parent_job_id : String?

        # Returns only copy jobs that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter by_resource_arn : String?

        # Returns only backup jobs for the specified resources: Aurora for Amazon Aurora CloudFormation for
        # CloudFormation DocumentDB for Amazon DocumentDB (with MongoDB compatibility) DynamoDB for Amazon
        # DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon Elastic Compute Cloud EFS for Amazon
        # Elastic File System FSx for Amazon FSx Neptune for Amazon Neptune RDS for Amazon Relational Database
        # Service Redshift for Amazon Redshift S3 for Amazon Simple Storage Service (Amazon S3) SAP HANA on
        # Amazon EC2 for SAP HANA databases on Amazon Elastic Compute Cloud instances Storage Gateway for
        # Storage Gateway Timestream for Amazon Timestream VirtualMachine for VMware virtual machines
        @[JSON::Field(key: "resourceType")]
        getter by_resource_type : String?

        # Filters copy jobs by the specified source recovery point ARN.
        @[JSON::Field(key: "sourceRecoveryPointArn")]
        getter by_source_recovery_point_arn : String?

        # Returns only copy jobs that are in the specified state.
        @[JSON::Field(key: "state")]
        getter by_state : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @by_account_id : String? = nil,
          @by_complete_after : Time? = nil,
          @by_complete_before : Time? = nil,
          @by_created_after : Time? = nil,
          @by_created_before : Time? = nil,
          @by_destination_vault_arn : String? = nil,
          @by_message_category : String? = nil,
          @by_parent_job_id : String? = nil,
          @by_resource_arn : String? = nil,
          @by_resource_type : String? = nil,
          @by_source_recovery_point_arn : String? = nil,
          @by_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCopyJobsOutput
        include JSON::Serializable

        # An array of structures containing metadata about your copy jobs returned in JSON format.
        @[JSON::Field(key: "CopyJobs")]
        getter copy_jobs : Array(Types::CopyJob)?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @copy_jobs : Array(Types::CopyJob)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFrameworksInput
        include JSON::Serializable

        # The number of desired results from 1 to 1000. Optional. If unspecified, the query will return 1 MB
        # of data.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFrameworksOutput
        include JSON::Serializable

        # The frameworks with details for each framework, including the framework name, Amazon Resource Name
        # (ARN), description, number of controls, creation time, and deployment status.
        @[JSON::Field(key: "Frameworks")]
        getter frameworks : Array(Types::Framework)?

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @frameworks : Array(Types::Framework)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIndexedRecoveryPointsInput
        include JSON::Serializable

        # Returns only indexed recovery points that were created after the specified date.
        @[JSON::Field(key: "createdAfter")]
        getter created_after : Time?

        # Returns only indexed recovery points that were created before the specified date.
        @[JSON::Field(key: "createdBefore")]
        getter created_before : Time?

        # Include this parameter to filter the returned list by the indicated statuses. Accepted values:
        # PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the status of ACTIVE
        # can be included in a search.
        @[JSON::Field(key: "indexStatus")]
        getter index_status : String?

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned recovery points. For example, if a request is
        # made to return MaxResults number of indexed recovery points, NextToken allows you to return more
        # items in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Returns a list of indexed recovery points for the specified resource type(s). Accepted values
        # include: EBS for Amazon Elastic Block Store S3 for Amazon Simple Storage Service (Amazon S3)
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A string of the Amazon Resource Name (ARN) that uniquely identifies the source resource.
        @[JSON::Field(key: "sourceResourceArn")]
        getter source_resource_arn : String?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @index_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @source_resource_arn : String? = nil
        )
        end
      end

      struct ListIndexedRecoveryPointsOutput
        include JSON::Serializable

        # This is a list of recovery points that have an associated index, belonging to the specified account.
        @[JSON::Field(key: "IndexedRecoveryPoints")]
        getter indexed_recovery_points : Array(Types::IndexedRecoveryPoint)?

        # The next item following a partial list of returned recovery points. For example, if a request is
        # made to return MaxResults number of indexed recovery points, NextToken allows you to return more
        # items in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @indexed_recovery_points : Array(Types::IndexedRecoveryPoint)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLegalHoldsInput
        include JSON::Serializable

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLegalHoldsOutput
        include JSON::Serializable

        # This is an array of returned legal holds, both active and previous.
        @[JSON::Field(key: "LegalHolds")]
        getter legal_holds : Array(Types::LegalHold)?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @legal_holds : Array(Types::LegalHold)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectedResourcesByBackupVaultInput
        include JSON::Serializable

        # The list of protected resources by backup vault within the vault(s) you specify by name.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The list of protected resources by backup vault within the vault(s) you specify by account ID.
        @[JSON::Field(key: "backupVaultAccountId")]
        getter backup_vault_account_id : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backup_vault_name : String,
          @backup_vault_account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectedResourcesByBackupVaultOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # These are the results returned for the request ListProtectedResourcesByBackupVault.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::ProtectedResource)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::ProtectedResource)? = nil
        )
        end
      end

      struct ListProtectedResourcesInput
        include JSON::Serializable

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProtectedResourcesOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of resources successfully backed up by Backup including the time the resource was saved, an
        # Amazon Resource Name (ARN) of the resource, and a resource type.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::ProtectedResource)?

        def initialize(
          @next_token : String? = nil,
          @results : Array(Types::ProtectedResource)? = nil
        )
        end
      end

      struct ListRecoveryPointsByBackupVaultInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created. Backup vault name might not be available when a supported service creates the backup.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # This parameter will sort the list of recovery points by account ID.
        @[JSON::Field(key: "backupVaultAccountId")]
        getter backup_vault_account_id : String?

        # Returns only recovery points that match the specified backup plan ID.
        @[JSON::Field(key: "backupPlanId")]
        getter by_backup_plan_id : String?

        # Returns only recovery points that were created after the specified timestamp.
        @[JSON::Field(key: "createdAfter")]
        getter by_created_after : Time?

        # Returns only recovery points that were created before the specified timestamp.
        @[JSON::Field(key: "createdBefore")]
        getter by_created_before : Time?

        # This returns only recovery points that match the specified parent (composite) recovery point Amazon
        # Resource Name (ARN).
        @[JSON::Field(key: "parentRecoveryPointArn")]
        getter by_parent_recovery_point_arn : String?

        # Returns only recovery points that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter by_resource_arn : String?

        # Returns only recovery points that match the specified resource type(s): Aurora for Amazon Aurora
        # CloudFormation for CloudFormation DocumentDB for Amazon DocumentDB (with MongoDB compatibility)
        # DynamoDB for Amazon DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon Elastic Compute Cloud
        # EFS for Amazon Elastic File System FSx for Amazon FSx Neptune for Amazon Neptune RDS for Amazon
        # Relational Database Service Redshift for Amazon Redshift S3 for Amazon Simple Storage Service
        # (Amazon S3) SAP HANA on Amazon EC2 for SAP HANA databases on Amazon Elastic Compute Cloud instances
        # Storage Gateway for Storage Gateway Timestream for Amazon Timestream VirtualMachine for VMware
        # virtual machines
        @[JSON::Field(key: "resourceType")]
        getter by_resource_type : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backup_vault_name : String,
          @backup_vault_account_id : String? = nil,
          @by_backup_plan_id : String? = nil,
          @by_created_after : Time? = nil,
          @by_created_before : Time? = nil,
          @by_parent_recovery_point_arn : String? = nil,
          @by_resource_arn : String? = nil,
          @by_resource_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRecoveryPointsByBackupVaultOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that contain detailed information about recovery points saved in a backup vault.
        @[JSON::Field(key: "RecoveryPoints")]
        getter recovery_points : Array(Types::RecoveryPointByBackupVault)?

        def initialize(
          @next_token : String? = nil,
          @recovery_points : Array(Types::RecoveryPointByBackupVault)? = nil
        )
        end
      end

      struct ListRecoveryPointsByLegalHoldInput
        include JSON::Serializable

        # The ID of the legal hold.
        @[JSON::Field(key: "legalHoldId")]
        getter legal_hold_id : String

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @legal_hold_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRecoveryPointsByLegalHoldOutput
        include JSON::Serializable

        # The next item following a partial list of returned resources.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The recovery points.
        @[JSON::Field(key: "RecoveryPoints")]
        getter recovery_points : Array(Types::RecoveryPointMember)?

        def initialize(
          @next_token : String? = nil,
          @recovery_points : Array(Types::RecoveryPointMember)? = nil
        )
        end
      end

      struct ListRecoveryPointsByResourceInput
        include JSON::Serializable

        # An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # This attribute filters recovery points based on ownership. If this is set to TRUE , the response
        # will contain recovery points associated with the selected resources that are managed by Backup. If
        # this is set to FALSE , the response will contain all recovery points associated with the selected
        # resource. Type: Boolean
        @[JSON::Field(key: "managedByAWSBackupOnly")]
        getter managed_by_aws_backup_only : Bool?

        # The maximum number of items to be returned. Amazon RDS requires a value of at least 20.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @managed_by_aws_backup_only : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRecoveryPointsByResourceOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that contain detailed information about recovery points of the specified
        # resource type. Only Amazon EFS and Amazon EC2 recovery points return BackupVaultName.
        @[JSON::Field(key: "RecoveryPoints")]
        getter recovery_points : Array(Types::RecoveryPointByResource)?

        def initialize(
          @next_token : String? = nil,
          @recovery_points : Array(Types::RecoveryPointByResource)? = nil
        )
        end
      end

      struct ListReportJobsInput
        include JSON::Serializable

        # Returns only report jobs that were created after the date and time specified in Unix format and
        # Coordinated Universal Time (UTC). For example, the value 1516925490 represents Friday, January 26,
        # 2018 12:11:30 AM.
        @[JSON::Field(key: "CreationAfter")]
        getter by_creation_after : Time?

        # Returns only report jobs that were created before the date and time specified in Unix format and
        # Coordinated Universal Time (UTC). For example, the value 1516925490 represents Friday, January 26,
        # 2018 12:11:30 AM.
        @[JSON::Field(key: "CreationBefore")]
        getter by_creation_before : Time?

        # Returns only report jobs with the specified report plan name.
        @[JSON::Field(key: "ReportPlanName")]
        getter by_report_plan_name : String?

        # Returns only report jobs that are in the specified status. The statuses are: CREATED | RUNNING |
        # COMPLETED | FAILED | COMPLETED_WITH_ISSUES Please note that only scanning jobs finish with state
        # completed with issues. For backup jobs this is a console interpretation of a job that finishes in
        # completed state and has a status message.
        @[JSON::Field(key: "Status")]
        getter by_status : String?

        # The number of desired results from 1 to 1000. Optional. If unspecified, the query will return 1 MB
        # of data.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @by_creation_after : Time? = nil,
          @by_creation_before : Time? = nil,
          @by_report_plan_name : String? = nil,
          @by_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReportJobsOutput
        include JSON::Serializable

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Details about your report jobs in JSON format.
        @[JSON::Field(key: "ReportJobs")]
        getter report_jobs : Array(Types::ReportJob)?

        def initialize(
          @next_token : String? = nil,
          @report_jobs : Array(Types::ReportJob)? = nil
        )
        end
      end

      struct ListReportPlansInput
        include JSON::Serializable

        # The number of desired results from 1 to 1000. Optional. If unspecified, the query will return 1 MB
        # of data.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListReportPlansOutput
        include JSON::Serializable

        # An identifier that was returned from the previous call to this operation, which can be used to
        # return the next set of items in the list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The report plans with detailed information for each plan. This information includes the Amazon
        # Resource Name (ARN), report plan name, description, settings, delivery channel, deployment status,
        # creation time, and last times the report plan attempted to and successfully ran.
        @[JSON::Field(key: "ReportPlans")]
        getter report_plans : Array(Types::ReportPlan)?

        def initialize(
          @next_token : String? = nil,
          @report_plans : Array(Types::ReportPlan)? = nil
        )
        end
      end

      struct ListRestoreAccessBackupVaultsInput
        include JSON::Serializable

        # The name of the backup vault for which to list associated restore access backup vaults.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The maximum number of items to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @backup_vault_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreAccessBackupVaultsOutput
        include JSON::Serializable

        # The pagination token to use in a subsequent request to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of restore access backup vaults associated with the specified backup vault.
        @[JSON::Field(key: "RestoreAccessBackupVaults")]
        getter restore_access_backup_vaults : Array(Types::RestoreAccessBackupVaultListMember)?

        def initialize(
          @next_token : String? = nil,
          @restore_access_backup_vaults : Array(Types::RestoreAccessBackupVaultListMember)? = nil
        )
        end
      end

      struct ListRestoreJobSummariesInput
        include JSON::Serializable

        # Returns the job count for the specified account. If the request is sent from a member account or an
        # account not part of Amazon Web Services Organizations, jobs within requestor's account will be
        # returned. Root, admin, and delegated administrator accounts can use the value ANY to return job
        # counts from every account in the organization. AGGREGATE_ALL aggregates job counts from all accounts
        # within the authenticated organization, then returns the sum.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # This parameter sets the maximum number of items to be returned. The value is an integer. Range of
        # accepted values is from 1 to 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the job count for the specified resource type. Use request GetSupportedResourceTypes to
        # obtain strings for supported resource types. The the value ANY returns count of all resource types.
        # AGGREGATE_ALL aggregates job counts for all resource types and returns the sum. The type of Amazon
        # Web Services resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS)
        # volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # This parameter returns the job count for jobs with the specified state. The the value ANY returns
        # count of all states. AGGREGATE_ALL aggregates job counts for all states and returns the sum.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @aggregation_period : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListRestoreJobSummariesOutput
        include JSON::Serializable

        # The period for the returned results. ONE_DAY - The daily job count for the prior 14 days. SEVEN_DAYS
        # - The aggregated job count for the prior 7 days. FOURTEEN_DAYS - The aggregated job count for prior
        # 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # This return contains a summary that contains Region, Account, State, ResourceType, MessageCategory,
        # StartTime, EndTime, and Count of included jobs.
        @[JSON::Field(key: "RestoreJobSummaries")]
        getter restore_job_summaries : Array(Types::RestoreJobSummary)?

        def initialize(
          @aggregation_period : String? = nil,
          @next_token : String? = nil,
          @restore_job_summaries : Array(Types::RestoreJobSummary)? = nil
        )
        end
      end

      struct ListRestoreJobsByProtectedResourceInput
        include JSON::Serializable

        # Returns only restore jobs that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Returns only restore jobs of recovery points that were created after the specified date.
        @[JSON::Field(key: "recoveryPointCreationDateAfter")]
        getter by_recovery_point_creation_date_after : Time?

        # Returns only restore jobs of recovery points that were created before the specified date.
        @[JSON::Field(key: "recoveryPointCreationDateBefore")]
        getter by_recovery_point_creation_date_before : Time?

        # Returns only restore jobs associated with the specified job status.
        @[JSON::Field(key: "status")]
        getter by_status : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request ismade to return
        # MaxResults number of items, NextToken allows you to return more items in your list starting at the
        # location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @by_recovery_point_creation_date_after : Time? = nil,
          @by_recovery_point_creation_date_before : Time? = nil,
          @by_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreJobsByProtectedResourceOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows youto return more items in your list starting at
        # the location pointed to by the next token
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that contain detailed information about jobs to restore saved resources.&gt;
        @[JSON::Field(key: "RestoreJobs")]
        getter restore_jobs : Array(Types::RestoreJobsListMember)?

        def initialize(
          @next_token : String? = nil,
          @restore_jobs : Array(Types::RestoreJobsListMember)? = nil
        )
        end
      end

      struct ListRestoreJobsInput
        include JSON::Serializable

        # The account ID to list the jobs from. Returns only restore jobs associated with the specified
        # account ID.
        @[JSON::Field(key: "accountId")]
        getter by_account_id : String?

        # Returns only copy jobs completed after a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeAfter")]
        getter by_complete_after : Time?

        # Returns only copy jobs completed before a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "completeBefore")]
        getter by_complete_before : Time?

        # Returns only restore jobs that were created after the specified date.
        @[JSON::Field(key: "createdAfter")]
        getter by_created_after : Time?

        # Returns only restore jobs that were created before the specified date.
        @[JSON::Field(key: "createdBefore")]
        getter by_created_before : Time?

        # This is a filter to list child (nested) restore jobs based on parent restore job ID.
        @[JSON::Field(key: "parentJobId")]
        getter by_parent_job_id : String?

        # Include this parameter to return only restore jobs for the specified resources: Aurora for Amazon
        # Aurora CloudFormation for CloudFormation DocumentDB for Amazon DocumentDB (with MongoDB
        # compatibility) DynamoDB for Amazon DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon
        # Elastic Compute Cloud EFS for Amazon Elastic File System FSx for Amazon FSx Neptune for Amazon
        # Neptune RDS for Amazon Relational Database Service Redshift for Amazon Redshift S3 for Amazon Simple
        # Storage Service (Amazon S3) SAP HANA on Amazon EC2 for SAP HANA databases on Amazon Elastic Compute
        # Cloud instances Storage Gateway for Storage Gateway Timestream for Amazon Timestream VirtualMachine
        # for VMware virtual machines
        @[JSON::Field(key: "resourceType")]
        getter by_resource_type : String?

        # This returns only restore testing jobs that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "restoreTestingPlanArn")]
        getter by_restore_testing_plan_arn : String?

        # Returns only restore jobs associated with the specified job status.
        @[JSON::Field(key: "status")]
        getter by_status : String?

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @by_account_id : String? = nil,
          @by_complete_after : Time? = nil,
          @by_complete_before : Time? = nil,
          @by_created_after : Time? = nil,
          @by_created_before : Time? = nil,
          @by_parent_job_id : String? = nil,
          @by_resource_type : String? = nil,
          @by_restore_testing_plan_arn : String? = nil,
          @by_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreJobsOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that contain detailed information about jobs to restore saved resources.
        @[JSON::Field(key: "RestoreJobs")]
        getter restore_jobs : Array(Types::RestoreJobsListMember)?

        def initialize(
          @next_token : String? = nil,
          @restore_jobs : Array(Types::RestoreJobsListMember)? = nil
        )
        end
      end

      struct ListRestoreTestingPlansInput
        include JSON::Serializable

        # The maximum number of items to be returned.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the nexttoken.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreTestingPlansOutput
        include JSON::Serializable

        # This is a returned list of restore testing plans.
        @[JSON::Field(key: "RestoreTestingPlans")]
        getter restore_testing_plans : Array(Types::RestoreTestingPlanForList)

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the nexttoken.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @restore_testing_plans : Array(Types::RestoreTestingPlanForList),
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreTestingSelectionsInput
        include JSON::Serializable

        # Returns restore testing selections by the specified restore testing plan name.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # The maximum number of items to be returned.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the nexttoken.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @restore_testing_plan_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRestoreTestingSelectionsOutput
        include JSON::Serializable

        # The returned restore testing selections associated with the restore testing plan.
        @[JSON::Field(key: "RestoreTestingSelections")]
        getter restore_testing_selections : Array(Types::RestoreTestingSelectionForList)

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the nexttoken.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @restore_testing_selections : Array(Types::RestoreTestingSelectionForList),
          @next_token : String? = nil
        )
        end
      end

      struct ListScanJobSummariesInput
        include JSON::Serializable

        # Returns the job count for the specified account. If the request is sent from a member account or an
        # account not part of Amazon Web Services Organizations, jobs within requestor's account will be
        # returned. Root, admin, and delegated administrator accounts can use the value ANY to return job
        # counts from every account in the organization. AGGREGATE_ALL aggregates job counts from all accounts
        # within the authenticated organization, then returns the sum.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The period for the returned results. ONE_DAY The daily job count for the prior 1 day. SEVEN_DAYS The
        # daily job count for the prior 7 days. FOURTEEN_DAYS The daily job count for the prior 14 days.
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # Returns only the scan jobs for the specified malware scanner. Currently the only MalwareScanner is
        # GUARDDUTY . But the field also supports ANY , and AGGREGATE_ALL .
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String?

        # The maximum number of items to be returned. The value is an integer. Range of accepted values is
        # from 1 to 500.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the job count for the specified resource type. Use request GetSupportedResourceTypes to
        # obtain strings for supported resource types. The the value ANY returns count of all resource types.
        # AGGREGATE_ALL aggregates job counts for all resource types and returns the sum.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Returns only the scan jobs for the specified scan results.
        @[JSON::Field(key: "ScanResultStatus")]
        getter scan_result_status : String?

        # Returns only the scan jobs for the specified scanning job state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @aggregation_period : String? = nil,
          @malware_scanner : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil,
          @scan_result_status : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListScanJobSummariesOutput
        include JSON::Serializable

        # The period for the returned results. ONE_DAY The daily job count for the prior 1 day. SEVEN_DAYS The
        # daily job count for the prior 7 days. FOURTEEN_DAYS The daily job count for the prior 14 days. Valid
        # Values: 'ONE_DAY' | 'SEVEN_DAYS' | 'FOURTEEN_DAYS'
        @[JSON::Field(key: "AggregationPeriod")]
        getter aggregation_period : String?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The summary information.
        @[JSON::Field(key: "ScanJobSummaries")]
        getter scan_job_summaries : Array(Types::ScanJobSummary)?

        def initialize(
          @aggregation_period : String? = nil,
          @next_token : String? = nil,
          @scan_job_summaries : Array(Types::ScanJobSummary)? = nil
        )
        end
      end

      struct ListScanJobsInput
        include JSON::Serializable

        # The account ID to list the jobs from. Returns only backup jobs associated with the specified account
        # ID. If used from an Amazon Web Services Organizations management account, passing * returns all jobs
        # across the organization. Pattern: ^[0-9]{12}$
        @[JSON::Field(key: "ByAccountId")]
        getter by_account_id : String?

        # Returns only scan jobs that will be stored in the specified backup vault. Backup vaults are
        # identified by names that are unique to the account used to create them and the Amazon Web Services
        # Region where they are created. Pattern: ^[a-zA-Z0-9\-\_\.]{2,50}$
        @[JSON::Field(key: "ByBackupVaultName")]
        getter by_backup_vault_name : String?

        # Returns only scan jobs completed after a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "ByCompleteAfter")]
        getter by_complete_after : Time?

        # Returns only backup jobs completed before a date expressed in Unix format and Coordinated Universal
        # Time (UTC).
        @[JSON::Field(key: "ByCompleteBefore")]
        getter by_complete_before : Time?

        # Returns only the scan jobs for the specified malware scanner. Currently only supports GUARDDUTY .
        @[JSON::Field(key: "ByMalwareScanner")]
        getter by_malware_scanner : String?

        # Returns only the scan jobs that are ran against the specified recovery point.
        @[JSON::Field(key: "ByRecoveryPointArn")]
        getter by_recovery_point_arn : String?

        # Returns only scan jobs that match the specified resource Amazon Resource Name (ARN).
        @[JSON::Field(key: "ByResourceArn")]
        getter by_resource_arn : String?

        # Returns restore testing selections by the specified restore testing plan name. EBS for Amazon
        # Elastic Block Store EC2 for Amazon Elastic Compute Cloud S3 for Amazon Simple Storage Service
        # (Amazon S3) Pattern: ^[a-zA-Z0-9\-\_\.]{1,50}$
        @[JSON::Field(key: "ByResourceType")]
        getter by_resource_type : String?

        # Returns only the scan jobs for the specified scan results: THREATS_FOUND NO_THREATS_FOUND
        @[JSON::Field(key: "ByScanResultStatus")]
        getter by_scan_result_status : String?

        # Returns only the scan jobs for the specified scanning job state.
        @[JSON::Field(key: "ByState")]
        getter by_state : String?

        # The maximum number of items to be returned. Valid Range: Minimum value of 1. Maximum value of 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @by_account_id : String? = nil,
          @by_backup_vault_name : String? = nil,
          @by_complete_after : Time? = nil,
          @by_complete_before : Time? = nil,
          @by_malware_scanner : String? = nil,
          @by_recovery_point_arn : String? = nil,
          @by_resource_arn : String? = nil,
          @by_resource_type : String? = nil,
          @by_scan_result_status : String? = nil,
          @by_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScanJobsOutput
        include JSON::Serializable

        # An array of structures containing metadata about your scan jobs returned in JSON format.
        @[JSON::Field(key: "ScanJobs")]
        getter scan_jobs : Array(Types::ScanJob)

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @scan_jobs : Array(Types::ScanJob),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the type of resource. Valid targets for ListTags are recovery points, backup plans, and backup
        # vaults.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTieringConfigurationsInput
        include JSON::Serializable

        # The maximum number of items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTieringConfigurationsOutput
        include JSON::Serializable

        # The next item following a partial list of returned items. For example, if a request is made to
        # return MaxResults number of items, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of tiering configurations returned by the ListTieringConfigurations call.
        @[JSON::Field(key: "TieringConfigurations")]
        getter tiering_configurations : Array(Types::TieringConfigurationsListMember)?

        def initialize(
          @next_token : String? = nil,
          @tiering_configurations : Array(Types::TieringConfigurationsListMember)? = nil
        )
        end
      end

      # Indicates that a required parameter is missing.
      struct MissingParameterValueException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that contains information about a backed-up resource.
      struct ProtectedResource
        include JSON::Serializable

        # The date and time a resource was last backed up, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastBackupTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastBackupTime")]
        getter last_backup_time : Time?

        # The ARN (Amazon Resource Name) of the backup vault that contains the most recent backup recovery
        # point.
        @[JSON::Field(key: "LastBackupVaultArn")]
        getter last_backup_vault_arn : String?

        # The ARN (Amazon Resource Name) of the most recent recovery point.
        @[JSON::Field(key: "LastRecoveryPointArn")]
        getter last_recovery_point_arn : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource; for example, an Amazon Elastic Block Store (Amazon EBS)
        # volume or an Amazon Relational Database Service (Amazon RDS) database. For Windows Volume Shadow
        # Copy Service (VSS) backups, the only supported resource type is Amazon EC2.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @last_backup_time : Time? = nil,
          @last_backup_vault_arn : String? = nil,
          @last_recovery_point_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The conditions that you define for resources in your restore testing plan using tags.
      struct ProtectedResourceConditions
        include JSON::Serializable

        # Filters the values of your tagged resources for only those resources that you tagged with the same
        # value. Also called "exact matching."
        @[JSON::Field(key: "StringEquals")]
        getter string_equals : Array(Types::KeyValue)?

        # Filters the values of your tagged resources for only those resources that you tagged that do not
        # have the same value. Also called "negated matching."
        @[JSON::Field(key: "StringNotEquals")]
        getter string_not_equals : Array(Types::KeyValue)?

        def initialize(
          @string_equals : Array(Types::KeyValue)? = nil,
          @string_not_equals : Array(Types::KeyValue)? = nil
        )
        end
      end

      struct PutBackupVaultAccessPolicyInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The backup vault access policy document in JSON format.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @backup_vault_name : String,
          @policy : String? = nil
        )
        end
      end

      struct PutBackupVaultLockConfigurationInput
        include JSON::Serializable

        # The Backup Vault Lock configuration that specifies the name of the backup vault it protects.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The Backup Vault Lock configuration that specifies the number of days before the lock date. For
        # example, setting ChangeableForDays to 30 on Jan. 1, 2022 at 8pm UTC will set the lock date to Jan.
        # 31, 2022 at 8pm UTC. Backup enforces a 72-hour cooling-off period before Vault Lock takes effect and
        # becomes immutable. Therefore, you must set ChangeableForDays to 3 or greater. Before the lock date,
        # you can delete Vault Lock from the vault using DeleteBackupVaultLockConfiguration or change the
        # Vault Lock configuration using PutBackupVaultLockConfiguration . On and after the lock date, the
        # Vault Lock becomes immutable and cannot be changed or deleted. If this parameter is not specified,
        # you can delete Vault Lock from the vault using DeleteBackupVaultLockConfiguration or change the
        # Vault Lock configuration using PutBackupVaultLockConfiguration at any time.
        @[JSON::Field(key: "ChangeableForDays")]
        getter changeable_for_days : Int64?

        # The Backup Vault Lock configuration that specifies the maximum retention period that the vault
        # retains its recovery points. This setting can be useful if, for example, your organization's
        # policies require you to destroy certain data after retaining it for four years (1460 days). If this
        # parameter is not included, Vault Lock does not enforce a maximum retention period on the recovery
        # points in the vault. If this parameter is included without a value, Vault Lock will not enforce a
        # maximum retention period. If this parameter is specified, any backup or copy job to the vault must
        # have a lifecycle policy with a retention period equal to or shorter than the maximum retention
        # period. If the job's retention period is longer than that maximum retention period, then the vault
        # fails the backup or copy job, and you should either modify your lifecycle settings or use a
        # different vault. The longest maximum retention period you can specify is 36500 days (approximately
        # 100 years). Recovery points already saved in the vault prior to Vault Lock are not affected.
        @[JSON::Field(key: "MaxRetentionDays")]
        getter max_retention_days : Int64?

        # The Backup Vault Lock configuration that specifies the minimum retention period that the vault
        # retains its recovery points. This setting can be useful if, for example, your organization's
        # policies require you to retain certain data for at least seven years (2555 days). This parameter is
        # required when a vault lock is created through CloudFormation; otherwise, this parameter is optional.
        # If this parameter is not specified, Vault Lock will not enforce a minimum retention period. If this
        # parameter is specified, any backup or copy job to the vault must have a lifecycle policy with a
        # retention period equal to or longer than the minimum retention period. If the job's retention period
        # is shorter than that minimum retention period, then the vault fails that backup or copy job, and you
        # should either modify your lifecycle settings or use a different vault. The shortest minimum
        # retention period you can specify is 1 day. Recovery points already saved in the vault prior to Vault
        # Lock are not affected.
        @[JSON::Field(key: "MinRetentionDays")]
        getter min_retention_days : Int64?

        def initialize(
          @backup_vault_name : String,
          @changeable_for_days : Int64? = nil,
          @max_retention_days : Int64? = nil,
          @min_retention_days : Int64? = nil
        )
        end
      end

      struct PutBackupVaultNotificationsInput
        include JSON::Serializable

        # An array of events that indicate the status of jobs to back up resources to the backup vault. For
        # the list of supported events, common use cases, and code samples, see Notification options with
        # Backup .
        @[JSON::Field(key: "BackupVaultEvents")]
        getter backup_vault_events : Array(String)

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The Amazon Resource Name (ARN) that specifies the topic for a backup vault’s events; for example,
        # arn:aws:sns:us-west-2:111122223333:MyVaultTopic .
        @[JSON::Field(key: "SNSTopicArn")]
        getter sns_topic_arn : String

        def initialize(
          @backup_vault_events : Array(String),
          @backup_vault_name : String,
          @sns_topic_arn : String
        )
        end
      end

      struct PutRestoreValidationResultInput
        include JSON::Serializable

        # This is a unique identifier of a restore job within Backup.
        @[JSON::Field(key: "restoreJobId")]
        getter restore_job_id : String

        # The status of your restore validation.
        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String

        # This is an optional message string you can input to describe the validation status for the restore
        # test validation.
        @[JSON::Field(key: "ValidationStatusMessage")]
        getter validation_status_message : String?

        def initialize(
          @restore_job_id : String,
          @validation_status : String,
          @validation_status_message : String? = nil
        )
        end
      end

      # Contains detailed information about the recovery points stored in a backup vault.
      struct RecoveryPointByBackupVault
        include JSON::Serializable

        # Contains the latest scanning results against the recovery point and currently include FailedScan ,
        # Findings , LastComputed .
        @[JSON::Field(key: "AggregatedScanResult")]
        getter aggregated_scan_result : Types::AggregatedScanResult?

        # The size, in bytes, of a backup.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # An ARN that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # A CalculatedLifecycle object containing DeleteAt and MoveToColdStorageAt timestamps.
        @[JSON::Field(key: "CalculatedLifecycle")]
        getter calculated_lifecycle : Types::CalculatedLifecycle?

        # The date and time a job to restore a recovery point is completed, in Unix format and Coordinated
        # Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # The identifier of a resource within a composite group, such as nested (child) recovery point
        # belonging to a composite (parent) stack. The ID is transferred from the logical ID within a stack.
        @[JSON::Field(key: "CompositeMemberIdentifier")]
        getter composite_member_identifier : String?

        # Contains identifying information about the creation of a recovery point, including the BackupPlanArn
        # , BackupPlanId , BackupPlanVersion , and BackupRuleId of the backup plan that is used to create it.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RecoveryPointCreator?

        # The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The server-side encryption key that is used to protect your backups; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption key used for the recovery point. Valid values are CUSTOMER_MANAGED_KMS_KEY
        # for customer-managed keys or Amazon Web Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
        @[JSON::Field(key: "EncryptionKeyType")]
        getter encryption_key_type : String?

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # A string in the form of a detailed message explaining the status of a backup index associated with
        # the recovery point.
        @[JSON::Field(key: "IndexStatusMessage")]
        getter index_status_message : String?

        # The date and time when the backup job that created this recovery point was initiated, in Unix format
        # and Coordinated Universal Time (UTC).
        @[JSON::Field(key: "InitiationDate")]
        getter initiation_date : Time?

        # A Boolean value that is returned as TRUE if the specified recovery point is encrypted, or FALSE if
        # the recovery point is not encrypted.
        @[JSON::Field(key: "IsEncrypted")]
        getter is_encrypted : Bool?

        # This is a boolean value indicating this is a parent (composite) recovery point.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # The date and time a recovery point was last restored, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastRestoreTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastRestoreTime")]
        getter last_restore_time : Time?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup transitions and expires backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold. Resource types that can transition to cold storage are listed in the Feature
        # availability by resource table. Backup ignores this expression for other resource types.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # The Amazon Resource Name (ARN) of the parent (composite) recovery point.
        @[JSON::Field(key: "ParentRecoveryPointArn")]
        getter parent_recovery_point_arn : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # An ARN that uniquely identifies a resource. The format of the ARN depends on the resource type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The type of Amazon Web Services resource saved as a recovery point; for example, an Amazon Elastic
        # Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database. For
        # Windows Volume Shadow Copy Service (VSS) backups, the only supported resource type is Amazon EC2.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The backup vault where the recovery point was originally copied from. If the recovery point is
        # restored to the same account this value will be null .
        @[JSON::Field(key: "SourceBackupVaultArn")]
        getter source_backup_vault_arn : String?

        # A status code specifying the state of the recovery point.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message explaining the current status of the recovery point.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The type of vault in which the described recovery point is stored.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @aggregated_scan_result : Types::AggregatedScanResult? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @backup_vault_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @calculated_lifecycle : Types::CalculatedLifecycle? = nil,
          @completion_date : Time? = nil,
          @composite_member_identifier : String? = nil,
          @created_by : Types::RecoveryPointCreator? = nil,
          @creation_date : Time? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_key_type : String? = nil,
          @iam_role_arn : String? = nil,
          @index_status : String? = nil,
          @index_status_message : String? = nil,
          @initiation_date : Time? = nil,
          @is_encrypted : Bool? = nil,
          @is_parent : Bool? = nil,
          @last_restore_time : Time? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @parent_recovery_point_arn : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @source_backup_vault_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      # Contains detailed information about a saved recovery point.
      struct RecoveryPointByResource
        include JSON::Serializable

        # Contains the latest scanning results against the recovery point and currently include FailedScan ,
        # Findings , LastComputed .
        @[JSON::Field(key: "AggregatedScanResult")]
        getter aggregated_scan_result : Types::AggregatedScanResult?

        # The size, in bytes, of a backup.
        @[JSON::Field(key: "BackupSizeBytes")]
        getter backup_size_bytes : Int64?

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time a recovery point is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The server-side encryption key that is used to protect your backups; for example,
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # The type of encryption key used for the recovery point. Valid values are CUSTOMER_MANAGED_KMS_KEY
        # for customer-managed keys or Amazon Web Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
        @[JSON::Field(key: "EncryptionKeyType")]
        getter encryption_key_type : String?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # A string in the form of a detailed message explaining the status of a backup index associated with
        # the recovery point.
        @[JSON::Field(key: "IndexStatusMessage")]
        getter index_status_message : String?

        # This is a boolean value indicating this is a parent (composite) recovery point.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # The Amazon Resource Name (ARN) of the parent (composite) recovery point.
        @[JSON::Field(key: "ParentRecoveryPointArn")]
        getter parent_recovery_point_arn : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # A status code specifying the state of the recovery point.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message explaining the current status of the recovery point.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The type of vault in which the described recovery point is stored.
        @[JSON::Field(key: "VaultType")]
        getter vault_type : String?

        def initialize(
          @aggregated_scan_result : Types::AggregatedScanResult? = nil,
          @backup_size_bytes : Int64? = nil,
          @backup_vault_name : String? = nil,
          @creation_date : Time? = nil,
          @encryption_key_arn : String? = nil,
          @encryption_key_type : String? = nil,
          @index_status : String? = nil,
          @index_status_message : String? = nil,
          @is_parent : Bool? = nil,
          @parent_recovery_point_arn : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vault_type : String? = nil
        )
        end
      end

      # Contains information about the backup plan and rule that Backup used to initiate the recovery point
      # backup.
      struct RecoveryPointCreator
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The name of the backup plan that created this recovery point. This provides human-readable context
        # about which backup plan was responsible for the backup job.
        @[JSON::Field(key: "BackupPlanName")]
        getter backup_plan_name : String?

        # Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024
        # bytes long. They cannot be edited.
        @[JSON::Field(key: "BackupPlanVersion")]
        getter backup_plan_version : String?

        # The cron expression that defines the schedule for the backup rule. This shows the frequency and
        # timing of when backups are automatically triggered.
        @[JSON::Field(key: "BackupRuleCron")]
        getter backup_rule_cron : String?

        # Uniquely identifies a rule used to schedule the backup of a selection of resources.
        @[JSON::Field(key: "BackupRuleId")]
        getter backup_rule_id : String?

        # The name of the backup rule within the backup plan that created this recovery point. This helps
        # identify which specific rule triggered the backup job.
        @[JSON::Field(key: "BackupRuleName")]
        getter backup_rule_name : String?

        # The timezone used for the backup rule schedule. This provides context for when backups are scheduled
        # to run in the specified timezone.
        @[JSON::Field(key: "BackupRuleTimezone")]
        getter backup_rule_timezone : String?

        def initialize(
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @backup_plan_name : String? = nil,
          @backup_plan_version : String? = nil,
          @backup_rule_cron : String? = nil,
          @backup_rule_id : String? = nil,
          @backup_rule_name : String? = nil,
          @backup_rule_timezone : String? = nil
        )
        end
      end

      # This is a recovery point which is a child (nested) recovery point of a parent (composite) recovery
      # point. These recovery points can be disassociated from their parent (composite) recovery point, in
      # which case they will no longer be a member.
      struct RecoveryPointMember
        include JSON::Serializable

        # The name of the backup vault (the logical container in which backups are stored).
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The Amazon Resource Name (ARN) of the parent (composite) recovery point.
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The Amazon Resource Name (ARN) that uniquely identifies a saved resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The Amazon Web Services resource type that is saved as a recovery point.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @backup_vault_name : String? = nil,
          @recovery_point_arn : String? = nil,
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # This specifies criteria to assign a set of resources, such as resource types or backup vaults.
      struct RecoveryPointSelection
        include JSON::Serializable

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::DateRange?

        # These are the resources included in the resource selection (including type of resources and vaults).
        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(String)?

        # These are the names of the vaults in which the selected recovery points are contained.
        @[JSON::Field(key: "VaultNames")]
        getter vault_names : Array(String)?

        def initialize(
          @date_range : Types::DateRange? = nil,
          @resource_identifiers : Array(String)? = nil,
          @vault_names : Array(String)? = nil
        )
        end
      end

      # Contains information from your report plan about where to deliver your reports, specifically your
      # Amazon S3 bucket name, S3 key prefix, and the formats of your reports.
      struct ReportDeliveryChannel
        include JSON::Serializable

        # The unique name of the S3 bucket that receives your reports.
        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The format of your reports: CSV , JSON , or both. If not specified, the default format is CSV .
        @[JSON::Field(key: "Formats")]
        getter formats : Array(String)?

        # The prefix for where Backup Audit Manager delivers your reports to Amazon S3. The prefix is this
        # part of the following path: s3://your-bucket-name/ prefix
        # /Backup/us-west-2/year/month/day/report-name. If not specified, there is no prefix.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket_name : String,
          @formats : Array(String)? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # Contains information from your report job about your report destination.
      struct ReportDestination
        include JSON::Serializable

        # The unique name of the Amazon S3 bucket that receives your reports.
        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # The object key that uniquely identifies your reports in your S3 bucket.
        @[JSON::Field(key: "S3Keys")]
        getter s3_keys : Array(String)?

        def initialize(
          @s3_bucket_name : String? = nil,
          @s3_keys : Array(String)? = nil
        )
        end
      end

      # Contains detailed information about a report job. A report job compiles a report based on a report
      # plan and publishes it to Amazon S3.
      struct ReportJob
        include JSON::Serializable

        # The date and time that a report job is completed, in Unix format and Coordinated Universal Time
        # (UTC). The value of CompletionTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # The date and time that a report job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The S3 bucket name and S3 keys for the destination where the report job publishes the report.
        @[JSON::Field(key: "ReportDestination")]
        getter report_destination : Types::ReportDestination?

        # The identifier for a report job. A unique, randomly generated, Unicode, UTF-8 encoded string that is
        # at most 1,024 bytes long. Report job IDs cannot be edited.
        @[JSON::Field(key: "ReportJobId")]
        getter report_job_id : String?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ReportPlanArn")]
        getter report_plan_arn : String?

        # Identifies the report template for the report. Reports are built using a report template. The report
        # templates are: RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT | BACKUP_JOB_REPORT |
        # COPY_JOB_REPORT | RESTORE_JOB_REPORT
        @[JSON::Field(key: "ReportTemplate")]
        getter report_template : String?

        # The status of a report job. The statuses are: CREATED | RUNNING | COMPLETED | FAILED COMPLETED means
        # that the report is available for your review at your designated destination. If the status is FAILED
        # , review the StatusMessage for the reason.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message explaining the status of the report job.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @report_destination : Types::ReportDestination? = nil,
          @report_job_id : String? = nil,
          @report_plan_arn : String? = nil,
          @report_template : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains detailed information about a report plan.
      struct ReportPlan
        include JSON::Serializable

        # The date and time that a report plan is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The deployment status of a report plan. The statuses are: CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS |
        # DELETE_IN_PROGRESS | COMPLETED
        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # The date and time that a report job associated with this report plan last attempted to run, in Unix
        # format and Coordinated Universal Time (UTC). The value of LastAttemptedExecutionTime is accurate to
        # milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087
        # AM.
        @[JSON::Field(key: "LastAttemptedExecutionTime")]
        getter last_attempted_execution_time : Time?

        # The date and time that a report job associated with this report plan last successfully ran, in Unix
        # format and Coordinated Universal Time (UTC). The value of LastSuccessfulExecutionTime is accurate to
        # milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087
        # AM.
        @[JSON::Field(key: "LastSuccessfulExecutionTime")]
        getter last_successful_execution_time : Time?

        # Contains information about where and how to deliver your reports, specifically your Amazon S3 bucket
        # name, S3 key prefix, and the formats of your reports.
        @[JSON::Field(key: "ReportDeliveryChannel")]
        getter report_delivery_channel : Types::ReportDeliveryChannel?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ReportPlanArn")]
        getter report_plan_arn : String?

        # An optional description of the report plan with a maximum 1,024 characters.
        @[JSON::Field(key: "ReportPlanDescription")]
        getter report_plan_description : String?

        # The unique name of the report plan. This name is between 1 and 256 characters starting with a
        # letter, and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "ReportPlanName")]
        getter report_plan_name : String?

        # Identifies the report template for the report. Reports are built using a report template. The report
        # templates are: RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT | BACKUP_JOB_REPORT |
        # COPY_JOB_REPORT | RESTORE_JOB_REPORT If the report template is RESOURCE_COMPLIANCE_REPORT or
        # CONTROL_COMPLIANCE_REPORT , this API resource also describes the report coverage by Amazon Web
        # Services Regions and frameworks.
        @[JSON::Field(key: "ReportSetting")]
        getter report_setting : Types::ReportSetting?

        def initialize(
          @creation_time : Time? = nil,
          @deployment_status : String? = nil,
          @last_attempted_execution_time : Time? = nil,
          @last_successful_execution_time : Time? = nil,
          @report_delivery_channel : Types::ReportDeliveryChannel? = nil,
          @report_plan_arn : String? = nil,
          @report_plan_description : String? = nil,
          @report_plan_name : String? = nil,
          @report_setting : Types::ReportSetting? = nil
        )
        end
      end

      # Contains detailed information about a report setting.
      struct ReportSetting
        include JSON::Serializable

        # Identifies the report template for the report. Reports are built using a report template. The report
        # templates are: RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT | BACKUP_JOB_REPORT |
        # COPY_JOB_REPORT | RESTORE_JOB_REPORT | SCAN_JOB_REPORT
        @[JSON::Field(key: "ReportTemplate")]
        getter report_template : String

        # These are the accounts to be included in the report. Use string value of ROOT to include all
        # organizational units.
        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(String)?

        # The Amazon Resource Names (ARNs) of the frameworks a report covers.
        @[JSON::Field(key: "FrameworkArns")]
        getter framework_arns : Array(String)?

        # The number of frameworks a report covers.
        @[JSON::Field(key: "NumberOfFrameworks")]
        getter number_of_frameworks : Int32?

        # These are the Organizational Units to be included in the report.
        @[JSON::Field(key: "OrganizationUnits")]
        getter organization_units : Array(String)?

        # These are the Regions to be included in the report. Use the wildcard as the string value to include
        # all Regions.
        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @report_template : String,
          @accounts : Array(String)? = nil,
          @framework_arns : Array(String)? = nil,
          @number_of_frameworks : Int32? = nil,
          @organization_units : Array(String)? = nil,
          @regions : Array(String)? = nil
        )
        end
      end

      # A resource that is required for the action doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # This contains metadata about resource selection for tiering configurations. You can specify up to 5
      # different resource selections per tiering configuration. Data moved to lower-cost tier remains there
      # until deletion (one-way transition).
      struct ResourceSelection
        include JSON::Serializable

        # The type of Amazon Web Services resource; for example, S3 for Amazon S3. For tiering configurations,
        # this is currently limited to S3 .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # An array of strings that either contains ARNs of the associated resources or contains a wildcard *
        # to specify all resources. You can specify up to 100 specific resources per tiering configuration.
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)

        # The number of days after creation within a backup vault that an object can transition to the low
        # cost warm storage tier. Must be a positive integer between 60 and 36500 days.
        @[JSON::Field(key: "TieringDownSettingsInDays")]
        getter tiering_down_settings_in_days : Int32

        def initialize(
          @resource_type : String,
          @resources : Array(String),
          @tiering_down_settings_in_days : Int32
        )
        end
      end

      # Contains information about a restore access backup vault.
      struct RestoreAccessBackupVaultListMember
        include JSON::Serializable

        # The date and time when the restore access backup vault was approved.
        @[JSON::Field(key: "ApprovalDate")]
        getter approval_date : Time?

        # The date and time when the restore access backup vault was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Information about the latest request to revoke access to this backup vault.
        @[JSON::Field(key: "LatestRevokeRequest")]
        getter latest_revoke_request : Types::LatestRevokeRequest?

        # The ARN of the restore access backup vault.
        @[JSON::Field(key: "RestoreAccessBackupVaultArn")]
        getter restore_access_backup_vault_arn : String?

        # The current state of the restore access backup vault.
        @[JSON::Field(key: "VaultState")]
        getter vault_state : String?

        def initialize(
          @approval_date : Time? = nil,
          @creation_date : Time? = nil,
          @latest_revoke_request : Types::LatestRevokeRequest? = nil,
          @restore_access_backup_vault_arn : String? = nil,
          @vault_state : String? = nil
        )
        end
      end

      # Contains information about the restore testing plan that Backup used to initiate the restore job.
      struct RestoreJobCreator
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String?

        def initialize(
          @restore_testing_plan_arn : String? = nil
        )
        end
      end

      # This is a summary of restore jobs created or running within the most recent 30 days. The returned
      # summary may contain the following: Region, Account, State, ResourceType, MessageCategory, StartTime,
      # EndTime, and Count of included jobs.
      struct RestoreJobSummary
        include JSON::Serializable

        # The account ID that owns the jobs within the summary.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The value as a number of jobs in a job summary.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of time in number format of a job end time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The Amazon Web Services Regions within the job summary.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # This value is the job count for the specified resource type. The request GetSupportedResourceTypes
        # returns strings for supported resource types.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The value of time in number format of a job start time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # This value is job count for jobs with the specified state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @count : Int32? = nil,
          @end_time : Time? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains metadata about a restore job.
      struct RestoreJobsListMember
        include JSON::Serializable

        # The account ID that owns the restore job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The size, in bytes, of the restored resource.
        @[JSON::Field(key: "BackupSizeInBytes")]
        getter backup_size_in_bytes : Int64?

        # The Amazon Resource Name (ARN) of the backup vault containing the recovery point being restored.
        # This helps identify vault access policies and permissions.
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # The date and time a job to restore a recovery point is completed, in Unix format and Coordinated
        # Universal Time (UTC). The value of CompletionDate is accurate to milliseconds. For example, the
        # value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # Contains identifying information about the creation of a restore job.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::RestoreJobCreator?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "CreatedResourceArn")]
        getter created_resource_arn : String?

        # The date and time a restore job is created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # This notes the status of the data generated by the restore test. The status may be Deleting , Failed
        # , or Successful .
        @[JSON::Field(key: "DeletionStatus")]
        getter deletion_status : String?

        # This describes the restore job deletion status.
        @[JSON::Field(key: "DeletionStatusMessage")]
        getter deletion_status_message : String?

        # The amount of time in minutes that a job restoring a recovery point is expected to take.
        @[JSON::Field(key: "ExpectedCompletionTimeMinutes")]
        getter expected_completion_time_minutes : Int64?

        # The IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is a boolean value indicating whether the restore job is a parent (composite) restore job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # This is the unique identifier of the parent restore job for the selected restore job.
        @[JSON::Field(key: "ParentJobId")]
        getter parent_job_id : String?

        # Contains an estimated percentage complete of a job at the time the job status was queried.
        @[JSON::Field(key: "PercentDone")]
        getter percent_done : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        # The date on which a recovery point was created.
        @[JSON::Field(key: "RecoveryPointCreationDate")]
        getter recovery_point_creation_date : Time?

        # The resource type of the listed restore jobs; for example, an Amazon Elastic Block Store (Amazon
        # EBS) volume or an Amazon Relational Database Service (Amazon RDS) database. For Windows Volume
        # Shadow Copy Service (VSS) backups, the only supported resource type is Amazon EC2.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Uniquely identifies the job that restores a recovery point.
        @[JSON::Field(key: "RestoreJobId")]
        getter restore_job_id : String?

        # The Amazon Resource Name (ARN) of the original resource that was backed up. This provides context
        # about what resource is being restored.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        # A status code specifying the state of the job initiated by Backup to restore a recovery point.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed message explaining the status of the job to restore a recovery point.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The status of validation run on the indicated restore job.
        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String?

        # This describes the status of validation run on the indicated restore job.
        @[JSON::Field(key: "ValidationStatusMessage")]
        getter validation_status_message : String?

        def initialize(
          @account_id : String? = nil,
          @backup_size_in_bytes : Int64? = nil,
          @backup_vault_arn : String? = nil,
          @completion_date : Time? = nil,
          @created_by : Types::RestoreJobCreator? = nil,
          @created_resource_arn : String? = nil,
          @creation_date : Time? = nil,
          @deletion_status : String? = nil,
          @deletion_status_message : String? = nil,
          @expected_completion_time_minutes : Int64? = nil,
          @iam_role_arn : String? = nil,
          @is_parent : Bool? = nil,
          @parent_job_id : String? = nil,
          @percent_done : String? = nil,
          @recovery_point_arn : String? = nil,
          @recovery_point_creation_date : Time? = nil,
          @resource_type : String? = nil,
          @restore_job_id : String? = nil,
          @source_resource_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @validation_status : String? = nil,
          @validation_status_message : String? = nil
        )
        end
      end

      # This contains metadata about a restore testing plan.
      struct RestoreTestingPlanForCreate
        include JSON::Serializable

        # RecoveryPointSelection has five parameters (three required and two optional). The values you specify
        # determine which recovery point is included in the restore test. You must indicate with Algorithm if
        # you want the latest recovery point within your SelectionWindowDays or if you want a random recovery
        # point, and you must indicate through IncludeVaults from which vaults the recovery points can be
        # chosen. Algorithm ( required ) Valid values: " LATEST_WITHIN_WINDOW " or " RANDOM_WITHIN_WINDOW ".
        # Recovery point types ( required ) Valid values: " SNAPSHOT " and/or " CONTINUOUS ". Include SNAPSHOT
        # to restore only snapshot recovery points; include CONTINUOUS to restore continuous recovery points
        # (point in time restore / PITR); use both to restore either a snapshot or a continuous recovery
        # point. The recovery point will be determined by the value for Algorithm . IncludeVaults ( required
        # ). You must include one or more backup vaults. Use the wildcard ["*"] or specific ARNs.
        # SelectionWindowDays ( optional ) Value must be an integer (in days) from 1 to 365. If not included,
        # the value defaults to 30 . ExcludeVaults ( optional ). You can choose to input one or more specific
        # backup vault ARNs to exclude those vaults' contents from restore eligibility. Or, you can include a
        # list of selectors. If this parameter and its value are not included, it defaults to empty list.
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RestoreTestingRecoveryPointSelection

        # The RestoreTestingPlanName is a unique string that is the name of the restore testing plan. This
        # cannot be changed after creation, and it must consist of only alphanumeric characters and
        # underscores.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # A CRON expression in specified timezone when a restore testing plan is executed. When no CRON
        # expression is provided, Backup will use the default expression cron(0 5 ? * * *) .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # Optional. This is the timezone in which the schedule expression is set. By default,
        # ScheduleExpressions are in UTC. You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # Defaults to 24 hours. A value in hours after a restore test is scheduled before a job will be
        # canceled if it doesn't start successfully. This value is optional. If this value is included, this
        # parameter has a maximum value of 168 hours (one week).
        @[JSON::Field(key: "StartWindowHours")]
        getter start_window_hours : Int32?

        def initialize(
          @recovery_point_selection : Types::RestoreTestingRecoveryPointSelection,
          @restore_testing_plan_name : String,
          @schedule_expression : String,
          @schedule_expression_timezone : String? = nil,
          @start_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing plan.
      struct RestoreTestingPlanForGet
        include JSON::Serializable

        # The date and time that a restore testing plan was created, in Unix format and Coordinated Universal
        # Time (UTC). The value of CreationTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The specified criteria to assign a set of resources, such as recovery point types or backup vaults.
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RestoreTestingRecoveryPointSelection

        # An Amazon Resource Name (ARN) that uniquely identifies a restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # The restore testing plan name.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # A CRON expression in specified timezone when a restore testing plan is executed. When no CRON
        # expression is provided, Backup will use the default expression cron(0 5 ? * * *) .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # This identifies the request and allows failed requests to be retried without the risk of running the
        # operation twice. If the request includes a CreatorRequestId that matches an existing backup plan,
        # that plan is returned. This parameter is optional. If used, this parameter must contain 1 to 50
        # alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The last time a restore test was run with the specified restore testing plan. A date and time, in
        # Unix format and Coordinated Universal Time (UTC). The value of LastExecutionDate is accurate to
        # milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087
        # AM.
        @[JSON::Field(key: "LastExecutionTime")]
        getter last_execution_time : Time?

        # The date and time that the restore testing plan was updated. This update is in Unix format and
        # Coordinated Universal Time (UTC). The value of LastUpdateTime is accurate to milliseconds. For
        # example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        # Optional. This is the timezone in which the schedule expression is set. By default,
        # ScheduleExpressions are in UTC. You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # Defaults to 24 hours. A value in hours after a restore test is scheduled before a job will be
        # canceled if it doesn't start successfully. This value is optional. If this value is included, this
        # parameter has a maximum value of 168 hours (one week).
        @[JSON::Field(key: "StartWindowHours")]
        getter start_window_hours : Int32?

        def initialize(
          @creation_time : Time,
          @recovery_point_selection : Types::RestoreTestingRecoveryPointSelection,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String,
          @schedule_expression : String,
          @creator_request_id : String? = nil,
          @last_execution_time : Time? = nil,
          @last_update_time : Time? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing plan.
      struct RestoreTestingPlanForList
        include JSON::Serializable

        # The date and time that a restore testing plan was created, in Unix format and Coordinated Universal
        # Time (UTC). The value of CreationTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # An Amazon Resource Name (ARN) that uniquely identifiesa restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # The restore testing plan name.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # A CRON expression in specified timezone when a restore testing plan is executed. When no CRON
        # expression is provided, Backup will use the default expression cron(0 5 ? * * *) .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # The last time a restore test was run with the specified restore testing plan. A date and time, in
        # Unix format and Coordinated Universal Time (UTC). The value of LastExecutionDate is accurate to
        # milliseconds. For example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087
        # AM.
        @[JSON::Field(key: "LastExecutionTime")]
        getter last_execution_time : Time?

        # The date and time that the restore testing plan was updated. This update is in Unix format and
        # Coordinated Universal Time (UTC). The value of LastUpdateTime is accurate to milliseconds. For
        # example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        # Optional. This is the timezone in which the schedule expression is set. By default,
        # ScheduleExpressions are in UTC. You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # Defaults to 24 hours. A value in hours after a restore test is scheduled before a job will be
        # canceled if it doesn't start successfully. This value is optional. If this value is included, this
        # parameter has a maximum value of 168 hours (one week).
        @[JSON::Field(key: "StartWindowHours")]
        getter start_window_hours : Int32?

        def initialize(
          @creation_time : Time,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String,
          @schedule_expression : String,
          @last_execution_time : Time? = nil,
          @last_update_time : Time? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing plan.
      struct RestoreTestingPlanForUpdate
        include JSON::Serializable

        # Required: Algorithm ; RecoveryPointTypes ; IncludeVaults ( one or more ). Optional:
        # SelectionWindowDays ( '30' if not specified ); ExcludeVaults (defaults to empty list if not listed).
        @[JSON::Field(key: "RecoveryPointSelection")]
        getter recovery_point_selection : Types::RestoreTestingRecoveryPointSelection?

        # A CRON expression in specified timezone when a restore testing plan is executed. When no CRON
        # expression is provided, Backup will use the default expression cron(0 5 ? * * *) .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Optional. This is the timezone in which the schedule expression is set. By default,
        # ScheduleExpressions are in UTC. You can modify this to a specified timezone.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # Defaults to 24 hours. A value in hours after a restore test is scheduled before a job will be
        # canceled if it doesn't start successfully. This value is optional. If this value is included, this
        # parameter has a maximum value of 168 hours (one week).
        @[JSON::Field(key: "StartWindowHours")]
        getter start_window_hours : Int32?

        def initialize(
          @recovery_point_selection : Types::RestoreTestingRecoveryPointSelection? = nil,
          @schedule_expression : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_window_hours : Int32? = nil
        )
        end
      end

      # RecoveryPointSelection has five parameters (three required and two optional). The values you specify
      # determine which recovery point is included in the restore test. You must indicate with Algorithm if
      # you want the latest recovery point within your SelectionWindowDays or if you want a random recovery
      # point, and you must indicate through IncludeVaults from which vaults the recovery points can be
      # chosen. Algorithm ( required ) Valid values: " LATEST_WITHIN_WINDOW " or " RANDOM_WITHIN_WINDOW ".
      # Recovery point types ( required ) Valid values: " SNAPSHOT " and/or " CONTINUOUS ". Include SNAPSHOT
      # to restore only snapshot recovery points; include CONTINUOUS to restore continuous recovery points
      # (point in time restore / PITR); use both to restore either a snapshot or a continuous recovery
      # point. The recovery point will be determined by the value for Algorithm . IncludeVaults ( required
      # ). You must include one or more backup vaults. Use the wildcard ["*"] or specific ARNs.
      # SelectionWindowDays ( optional ) Value must be an integer (in days) from 1 to 365. If not included,
      # the value defaults to 30 . ExcludeVaults ( optional ). You can choose to input one or more specific
      # backup vault ARNs to exclude those vaults' contents from restore eligibility. Or, you can include a
      # list of selectors. If this parameter and its value are not included, it defaults to empty list.
      struct RestoreTestingRecoveryPointSelection
        include JSON::Serializable

        # Acceptable values include "LATEST_WITHIN_WINDOW" or "RANDOM_WITHIN_WINDOW"
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String?

        # Accepted values include specific ARNs or list of selectors. Defaults to empty list if not listed.
        @[JSON::Field(key: "ExcludeVaults")]
        getter exclude_vaults : Array(String)?

        # Accepted values include wildcard ["*"] or by specific ARNs or ARN wilcard replacement
        # ["arn:aws:backup:us-west-2:123456789012:backup-vault:asdf", ...]
        # ["arn:aws:backup:*:*:backup-vault:asdf-*", ...]
        @[JSON::Field(key: "IncludeVaults")]
        getter include_vaults : Array(String)?

        # These are the types of recovery points. Include SNAPSHOT to restore only snapshot recovery points;
        # include CONTINUOUS to restore continuous recovery points (point in time restore / PITR); use both to
        # restore either a snapshot or a continuous recovery point. The recovery point will be determined by
        # the value for Algorithm .
        @[JSON::Field(key: "RecoveryPointTypes")]
        getter recovery_point_types : Array(String)?

        # Accepted values are integers from 1 to 365.
        @[JSON::Field(key: "SelectionWindowDays")]
        getter selection_window_days : Int32?

        def initialize(
          @algorithm : String? = nil,
          @exclude_vaults : Array(String)? = nil,
          @include_vaults : Array(String)? = nil,
          @recovery_point_types : Array(String)? = nil,
          @selection_window_days : Int32? = nil
        )
        end
      end

      # This contains metadata about a specific restore testing selection. ProtectedResourceType is
      # required, such as Amazon EBS or Amazon EC2. This consists of RestoreTestingSelectionName ,
      # ProtectedResourceType , and one of the following: ProtectedResourceArns ProtectedResourceConditions
      # Each protected resource type can have one single value. A restore testing selection can include a
      # wildcard value ("*") for ProtectedResourceArns along with ProtectedResourceConditions .
      # Alternatively, you can include up to 30 specific protected resource ARNs in ProtectedResourceArns .
      # ProtectedResourceConditions examples include as StringEquals and StringNotEquals .
      struct RestoreTestingSelectionForCreate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that Backup uses to create the target resource; for
        # example: arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The type of Amazon Web Services resource included in a restore testing selection; for example, an
        # Amazon EBS volume or an Amazon RDS database. Supported resource types accepted include: Aurora for
        # Amazon Aurora DocumentDB for Amazon DocumentDB (with MongoDB compatibility) DynamoDB for Amazon
        # DynamoDB EBS for Amazon Elastic Block Store EC2 for Amazon Elastic Compute Cloud EFS for Amazon
        # Elastic File System FSx for Amazon FSx Neptune for Amazon Neptune RDS for Amazon Relational Database
        # Service S3 for Amazon S3
        @[JSON::Field(key: "ProtectedResourceType")]
        getter protected_resource_type : String

        # The unique name of the restore testing selection that belongs to the related restore testing plan.
        # The name consists of only alphanumeric characters and underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        # Each protected resource can be filtered by its specific ARNs, such as ProtectedResourceArns:
        # ["arn:aws:...", "arn:aws:..."] or by a wildcard: ProtectedResourceArns: ["*"] , but not both.
        @[JSON::Field(key: "ProtectedResourceArns")]
        getter protected_resource_arns : Array(String)?

        # If you have included the wildcard in ProtectedResourceArns, you can include resource conditions,
        # such as ProtectedResourceConditions: { StringEquals: [{ key: "XXXX", value: "YYYY" }] .
        @[JSON::Field(key: "ProtectedResourceConditions")]
        getter protected_resource_conditions : Types::ProtectedResourceConditions?

        # You can override certain restore metadata keys by including the parameter RestoreMetadataOverrides
        # in the body of RestoreTestingSelection . Key values are not case sensitive. See the complete list of
        # restore testing inferred metadata .
        @[JSON::Field(key: "RestoreMetadataOverrides")]
        getter restore_metadata_overrides : Hash(String, String)?

        # This is amount of hours (0 to 168) available to run a validation script on the data. The data will
        # be deleted upon the completion of the validation script or the end of the specified retention
        # period, whichever comes first.
        @[JSON::Field(key: "ValidationWindowHours")]
        getter validation_window_hours : Int32?

        def initialize(
          @iam_role_arn : String,
          @protected_resource_type : String,
          @restore_testing_selection_name : String,
          @protected_resource_arns : Array(String)? = nil,
          @protected_resource_conditions : Types::ProtectedResourceConditions? = nil,
          @restore_metadata_overrides : Hash(String, String)? = nil,
          @validation_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing selection.
      struct RestoreTestingSelectionForGet
        include JSON::Serializable

        # The date and time that a restore testing selection was created, in Unix format and Coordinated
        # Universal Time (UTC). The value of CreationTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 201812:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the IAM role that Backup uses to create the target resource; for
        # example: arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The type of Amazon Web Services resource included in a resource testing selection; for example, an
        # Amazon EBS volume or an Amazon RDS database.
        @[JSON::Field(key: "ProtectedResourceType")]
        getter protected_resource_type : String

        # The RestoreTestingPlanName is a unique string that is the name of the restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # The unique name of the restore testing selection that belongs to the related restore testing plan.
        # The name consists of only alphanumeric characters and underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        # This identifies the request and allows failed requests to be retried without the risk of running the
        # operation twice. If the request includes a CreatorRequestId that matches an existing backup plan,
        # that plan is returned. This parameter is optional. If used, this parameter must contain 1 to 50
        # alphanumeric or '-_.' characters.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # You can include specific ARNs, such as ProtectedResourceArns: ["arn:aws:...", "arn:aws:..."] or you
        # can include a wildcard: ProtectedResourceArns: ["*"] , but not both.
        @[JSON::Field(key: "ProtectedResourceArns")]
        getter protected_resource_arns : Array(String)?

        # In a resource testing selection, this parameter filters by specific conditions such as StringEquals
        # or StringNotEquals .
        @[JSON::Field(key: "ProtectedResourceConditions")]
        getter protected_resource_conditions : Types::ProtectedResourceConditions?

        # You can override certain restore metadata keys by including the parameter RestoreMetadataOverrides
        # in the body of RestoreTestingSelection . Key values are not case sensitive. See the complete list of
        # restore testing inferred metadata .
        @[JSON::Field(key: "RestoreMetadataOverrides")]
        getter restore_metadata_overrides : Hash(String, String)?

        # This is amount of hours (1 to 168) available to run a validation script on the data. The data will
        # be deleted upon the completion of the validation script or the end of the specified retention
        # period, whichever comes first.
        @[JSON::Field(key: "ValidationWindowHours")]
        getter validation_window_hours : Int32?

        def initialize(
          @creation_time : Time,
          @iam_role_arn : String,
          @protected_resource_type : String,
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String,
          @creator_request_id : String? = nil,
          @protected_resource_arns : Array(String)? = nil,
          @protected_resource_conditions : Types::ProtectedResourceConditions? = nil,
          @restore_metadata_overrides : Hash(String, String)? = nil,
          @validation_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing selection.
      struct RestoreTestingSelectionForList
        include JSON::Serializable

        # The date and time that a restore testing selection was created, in Unix format and Coordinated
        # Universal Time (UTC). The value of CreationTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26,2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the IAM role that Backup uses to create the target resource; for
        # example: arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The type of Amazon Web Services resource included in a restore testing selection; for example, an
        # Amazon EBS volume or an Amazon RDS database.
        @[JSON::Field(key: "ProtectedResourceType")]
        getter protected_resource_type : String

        # Unique string that is the name of the restore testing plan. The name cannot be changed after
        # creation. The name must consist of only alphanumeric characters and underscores. Maximum length is
        # 50.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # Unique name of a restore testing selection. The name consists of only alphanumeric characters and
        # underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        # This value represents the time, in hours, data is retained after a restore test so that optional
        # validation can be completed. Accepted value is an integer between 0 and 168 (the hourly equivalent
        # of seven days).
        @[JSON::Field(key: "ValidationWindowHours")]
        getter validation_window_hours : Int32?

        def initialize(
          @creation_time : Time,
          @iam_role_arn : String,
          @protected_resource_type : String,
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String,
          @validation_window_hours : Int32? = nil
        )
        end
      end

      # This contains metadata about a restore testing selection.
      struct RestoreTestingSelectionForUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that Backup uses to create the target resource; for
        # example: arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # You can include a list of specific ARNs, such as ProtectedResourceArns: ["arn:aws:...",
        # "arn:aws:..."] or you can include a wildcard: ProtectedResourceArns: ["*"] , but not both.
        @[JSON::Field(key: "ProtectedResourceArns")]
        getter protected_resource_arns : Array(String)?

        # The conditions that you define for resources in your restore testing plan using tags.
        @[JSON::Field(key: "ProtectedResourceConditions")]
        getter protected_resource_conditions : Types::ProtectedResourceConditions?

        # You can override certain restore metadata keys by including the parameter RestoreMetadataOverrides
        # in the body of RestoreTestingSelection . Key values are not case sensitive. See the complete list of
        # restore testing inferred metadata .
        @[JSON::Field(key: "RestoreMetadataOverrides")]
        getter restore_metadata_overrides : Hash(String, String)?

        # This value represents the time, in hours, data is retained after a restore test so that optional
        # validation can be completed. Accepted value is an integer between 0 and 168 (the hourly equivalent
        # of seven days).
        @[JSON::Field(key: "ValidationWindowHours")]
        getter validation_window_hours : Int32?

        def initialize(
          @iam_role_arn : String? = nil,
          @protected_resource_arns : Array(String)? = nil,
          @protected_resource_conditions : Types::ProtectedResourceConditions? = nil,
          @restore_metadata_overrides : Hash(String, String)? = nil,
          @validation_window_hours : Int32? = nil
        )
        end
      end

      struct RevokeRestoreAccessBackupVaultInput
        include JSON::Serializable

        # The name of the source backup vault associated with the restore access backup vault to be revoked.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # The ARN of the restore access backup vault to revoke.
        @[JSON::Field(key: "restoreAccessBackupVaultArn")]
        getter restore_access_backup_vault_arn : String

        # A comment explaining the reason for revoking access to the restore access backup vault.
        @[JSON::Field(key: "requesterComment")]
        getter requester_comment : String?

        def initialize(
          @backup_vault_name : String,
          @restore_access_backup_vault_arn : String,
          @requester_comment : String? = nil
        )
        end
      end

      # Defines a scanning action that specifies the malware scanner and scan mode to use.
      struct ScanAction
        include JSON::Serializable

        # The malware scanner to use for the scan action. Currently only GUARDDUTY is supported.
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String?

        # The scanning mode to use for the scan action. Valid values: FULL_SCAN | INCREMENTAL_SCAN .
        @[JSON::Field(key: "ScanMode")]
        getter scan_mode : String?

        def initialize(
          @malware_scanner : String? = nil,
          @scan_mode : String? = nil
        )
        end
      end

      # Contains metadata about a scan job, including information about the scanning process, results, and
      # associated resources.
      struct ScanJob
        include JSON::Serializable

        # The account ID that owns the scan job.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # Contains identifying information about the creation of a scan job.
        @[JSON::Field(key: "CreatedBy")]
        getter created_by : Types::ScanJobCreator

        # The date and time that a scan job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # Specifies the IAM role ARN used to create the scan job; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The scanning engine used for the scan job. Currently only GUARDDUTY is supported.
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String

        # An ARN that uniquely identifies the recovery point being scanned; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # An ARN that uniquely identifies the source resource of the recovery point being scanned.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The non-unique name of the resource that belongs to the specified backup.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String

        # The type of Amazon Web Services resource being scanned; for example, an Amazon Elastic Block Store
        # (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The unique identifier that identifies the scan job request to Backup.
        @[JSON::Field(key: "ScanJobId")]
        getter scan_job_id : String

        # Specifies the scan type use for the scan job. Includes: FULL_SCAN will scan the entire data lineage
        # within the backup. INCREMENTAL_SCAN will scan the data difference between the target recovery point
        # and base recovery point ARN.
        @[JSON::Field(key: "ScanMode")]
        getter scan_mode : String

        # Specifies the scanner IAM role ARN used for the scan job.
        @[JSON::Field(key: "ScannerRoleArn")]
        getter scanner_role_arn : String

        # The date and time that a scan job is completed, in Unix format and Coordinated Universal Time (UTC).
        # The value of CompletionDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # An ARN that uniquely identifies the base recovery point for scanning. This field is populated when
        # an incremental scan job has taken place.
        @[JSON::Field(key: "ScanBaseRecoveryPointArn")]
        getter scan_base_recovery_point_arn : String?

        # The scan ID generated by the malware scanner for the corresponding scan job.
        @[JSON::Field(key: "ScanId")]
        getter scan_id : String?

        # Contains the scan results information, including the status of threats found during scanning.
        @[JSON::Field(key: "ScanResult")]
        getter scan_result : Types::ScanResultInfo?

        # The current state of the scan job. Valid values: CREATED | RUNNING | COMPLETED |
        # COMPLETED_WITH_ISSUES | FAILED | CANCELED .
        @[JSON::Field(key: "State")]
        getter state : String?

        # A detailed message explaining the status of the scan job.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @account_id : String,
          @backup_vault_arn : String,
          @backup_vault_name : String,
          @created_by : Types::ScanJobCreator,
          @creation_date : Time,
          @iam_role_arn : String,
          @malware_scanner : String,
          @recovery_point_arn : String,
          @resource_arn : String,
          @resource_name : String,
          @resource_type : String,
          @scan_job_id : String,
          @scan_mode : String,
          @scanner_role_arn : String,
          @completion_date : Time? = nil,
          @scan_base_recovery_point_arn : String? = nil,
          @scan_id : String? = nil,
          @scan_result : Types::ScanResultInfo? = nil,
          @state : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains identifying information about the creation of a scan job, including the backup plan and
      # rule that initiated the scan.
      struct ScanJobCreator
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String

        # The ID of the backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version IDs cannot be edited.
        @[JSON::Field(key: "BackupPlanVersion")]
        getter backup_plan_version : String

        # Uniquely identifies the backup rule that initiated the scan job.
        @[JSON::Field(key: "BackupRuleId")]
        getter backup_rule_id : String

        def initialize(
          @backup_plan_arn : String,
          @backup_plan_id : String,
          @backup_plan_version : String,
          @backup_rule_id : String
        )
        end
      end

      # Contains summary information about scan jobs, including counts and metadata for a specific time
      # period and criteria.
      struct ScanJobSummary
        include JSON::Serializable

        # The account ID that owns the scan jobs included in this summary.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The number of scan jobs that match the specified criteria.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of time in number format of a job end time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # Specifies the malware scanner used during the scan job. Currently only supports GUARDDUTY .
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String?

        # The Amazon Web Services Region where the scan jobs were executed.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The type of Amazon Web Services resource for the scan jobs included in this summary.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The scan result status for the scan jobs included in this summary. Valid values: THREATS_FOUND |
        # NO_THREATS_FOUND .
        @[JSON::Field(key: "ScanResultStatus")]
        getter scan_result_status : String?

        # The value of time in number format of a job start time. This value is the time in Unix format,
        # Coordinated Universal Time (UTC), and accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # The state of the scan jobs included in this summary. Valid values: CREATED | RUNNING | COMPLETED |
        # COMPLETED_WITH_ISSUES | FAILED | CANCELED .
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account_id : String? = nil,
          @count : Int32? = nil,
          @end_time : Time? = nil,
          @malware_scanner : String? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @scan_result_status : String? = nil,
          @start_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the results of a security scan, including scanner information, scan state, and any findings
      # discovered.
      struct ScanResult
        include JSON::Serializable

        # An array of findings discovered during the scan.
        @[JSON::Field(key: "Findings")]
        getter findings : Array(String)?

        # The timestamp of when the last scan was performed, in Unix format and Coordinated Universal Time
        # (UTC).
        @[JSON::Field(key: "LastScanTimestamp")]
        getter last_scan_timestamp : Time?

        # The malware scanner used to perform the scan. Currently only GUARDDUTY is supported.
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String?

        # The final state of the scan job. Valid values: COMPLETED | FAILED | CANCELED .
        @[JSON::Field(key: "ScanJobState")]
        getter scan_job_state : String?

        def initialize(
          @findings : Array(String)? = nil,
          @last_scan_timestamp : Time? = nil,
          @malware_scanner : String? = nil,
          @scan_job_state : String? = nil
        )
        end
      end

      # Contains information about the results of a scan job.
      struct ScanResultInfo
        include JSON::Serializable

        # The status of the scan results. Valid values: THREATS_FOUND | NO_THREATS_FOUND .
        @[JSON::Field(key: "ScanResultStatus")]
        getter scan_result_status : String

        def initialize(
          @scan_result_status : String
        )
        end
      end

      # Contains configuration settings for malware scanning, including the scanner type, target resource
      # types, and scanner role.
      struct ScanSetting
        include JSON::Serializable

        # The malware scanner to use for scanning. Currently only GUARDDUTY is supported.
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String?

        # An array of resource types to be scanned for malware.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The Amazon Resource Name (ARN) of the IAM role that the scanner uses to access resources; for
        # example, arn:aws:iam::123456789012:role/ScannerRole .
        @[JSON::Field(key: "ScannerRoleArn")]
        getter scanner_role_arn : String?

        def initialize(
          @malware_scanner : String? = nil,
          @resource_types : Array(String)? = nil,
          @scanner_role_arn : String? = nil
        )
        end
      end

      # Contains information about a scheduled backup plan execution, including the execution time, rule
      # type, and associated rule identifier.
      struct ScheduledPlanExecutionMember
        include JSON::Serializable

        # The timestamp when the backup is scheduled to run, in Unix format and Coordinated Universal Time
        # (UTC). The value is accurate to milliseconds.
        @[JSON::Field(key: "ExecutionTime")]
        getter execution_time : Time?

        # The type of backup rule execution. Valid values are CONTINUOUS (point-in-time recovery), SNAPSHOTS
        # (snapshot backups), or CONTINUOUS_AND_SNAPSHOTS (both types combined).
        @[JSON::Field(key: "RuleExecutionType")]
        getter rule_execution_type : String?

        # The unique identifier of the backup rule that will execute at the scheduled time.
        @[JSON::Field(key: "RuleId")]
        getter rule_id : String?

        def initialize(
          @execution_time : Time? = nil,
          @rule_execution_type : String? = nil,
          @rule_id : String? = nil
        )
        end
      end

      # The request failed due to a temporary failure of the server.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Context")]
        getter context : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code : String? = nil,
          @context : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct StartBackupJobInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The backup option for a selected resource. This option is only available for Windows Volume Shadow
        # Copy Service (VSS) backup jobs. Valid values: Set to "WindowsVSS":"enabled" to enable the WindowsVSS
        # backup option and create a Windows VSS backup. Set to "WindowsVSS""disabled" to create a regular
        # backup. The WindowsVSS option is not enabled by default.
        @[JSON::Field(key: "BackupOptions")]
        getter backup_options : Hash(String, String)?

        # A value in minutes during which a successfully started backup must complete, or else Backup will
        # cancel the job. This value is optional. This value begins counting down from when the backup was
        # scheduled. It does not add additional time for StartWindowMinutes , or if the backup started later
        # than scheduled. Like StartWindowMinutes , this parameter has a maximum value of 100 years
        # (52,560,000 minutes).
        @[JSON::Field(key: "CompleteWindowMinutes")]
        getter complete_window_minutes : Int64?

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # StartBackupJob . Retrying a successful request with the same idempotency token results in a success
        # message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Include this parameter to enable index creation if your backup job has a resource type that supports
        # backup indexes. Resource types that support backup indexes include: EBS for Amazon Elastic Block
        # Store S3 for Amazon Simple Storage Service (Amazon S3) Index can have 1 of 2 possible values, either
        # ENABLED or DISABLED . To create a backup index for an eligible ACTIVE recovery point that does not
        # yet have a backup index, set value to ENABLED . To delete a backup index, set value to DISABLED .
        @[JSON::Field(key: "Index")]
        getter index : String?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup will transition and expire backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold. Resource types that can transition to cold storage are listed in the Feature
        # availability by resource table. Backup ignores this expression for other resource types. This
        # parameter has a maximum value of 100 years (36,500 days).
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # The ARN of a logically air-gapped vault. ARN must be in the same account and Region. If provided,
        # supported fully managed resources back up directly to logically air-gapped vault, while other
        # supported resources create a temporary (billable) snapshot in backup vault, then copy it to
        # logically air-gapped vault. Unsupported resources only back up to the specified backup vault.
        @[JSON::Field(key: "LogicallyAirGappedBackupVaultArn")]
        getter logically_air_gapped_backup_vault_arn : String?

        # The tags to assign to the resources.
        @[JSON::Field(key: "RecoveryPointTags")]
        getter recovery_point_tags : Hash(String, String)?

        # A value in minutes after a backup is scheduled before a job will be canceled if it doesn't start
        # successfully. This value is optional, and the default is 8 hours. If this value is included, it must
        # be at least 60 minutes to avoid errors. This parameter has a maximum value of 100 years (52,560,000
        # minutes). During the start window, the backup job status remains in CREATED status until it has
        # successfully begun or until the start window time has run out. If within the start window time
        # Backup receives an error that allows the job to be retried, Backup will automatically retry to begin
        # the job at least every 10 minutes until the backup successfully begins (the job status changes to
        # RUNNING ) or until the job status changes to EXPIRED (which is expected to occur when the start
        # window time is over).
        @[JSON::Field(key: "StartWindowMinutes")]
        getter start_window_minutes : Int64?

        def initialize(
          @backup_vault_name : String,
          @iam_role_arn : String,
          @resource_arn : String,
          @backup_options : Hash(String, String)? = nil,
          @complete_window_minutes : Int64? = nil,
          @idempotency_token : String? = nil,
          @index : String? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @logically_air_gapped_backup_vault_arn : String? = nil,
          @recovery_point_tags : Hash(String, String)? = nil,
          @start_window_minutes : Int64? = nil
        )
        end
      end

      struct StartBackupJobOutput
        include JSON::Serializable

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "BackupJobId")]
        getter backup_job_id : String?

        # The date and time that a backup job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # This is a returned boolean value indicating this is a parent (composite) backup job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        # Note: This field is only returned for Amazon EFS and Advanced DynamoDB resources. An ARN that
        # uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        def initialize(
          @backup_job_id : String? = nil,
          @creation_date : Time? = nil,
          @is_parent : Bool? = nil,
          @recovery_point_arn : String? = nil
        )
        end
      end

      struct StartCopyJobInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies a destination backup vault to copy to; for
        # example, arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "DestinationBackupVaultArn")]
        getter destination_backup_vault_arn : String

        # Specifies the IAM role ARN used to copy the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # An ARN that uniquely identifies a recovery point to use for the copy job; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # The name of a logical source container where backups are stored. Backup vaults are identified by
        # names that are unique to the account used to create them and the Amazon Web Services Region where
        # they are created.
        @[JSON::Field(key: "SourceBackupVaultName")]
        getter source_backup_vault_name : String

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # StartCopyJob . Retrying a successful request with the same idempotency token results in a success
        # message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        def initialize(
          @destination_backup_vault_arn : String,
          @iam_role_arn : String,
          @recovery_point_arn : String,
          @source_backup_vault_name : String,
          @idempotency_token : String? = nil,
          @lifecycle : Types::Lifecycle? = nil
        )
        end
      end

      struct StartCopyJobOutput
        include JSON::Serializable

        # Uniquely identifies a copy job.
        @[JSON::Field(key: "CopyJobId")]
        getter copy_job_id : String?

        # The date and time that a copy job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # This is a returned boolean value indicating this is a parent (composite) copy job.
        @[JSON::Field(key: "IsParent")]
        getter is_parent : Bool?

        def initialize(
          @copy_job_id : String? = nil,
          @creation_date : Time? = nil,
          @is_parent : Bool? = nil
        )
        end
      end

      struct StartReportJobInput
        include JSON::Serializable

        # The unique name of a report plan.
        @[JSON::Field(key: "reportPlanName")]
        getter report_plan_name : String

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # StartReportJobInput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @report_plan_name : String,
          @idempotency_token : String? = nil
        )
        end
      end

      struct StartReportJobOutput
        include JSON::Serializable

        # The identifier of the report job. A unique, randomly generated, Unicode, UTF-8 encoded string that
        # is at most 1,024 bytes long. The report job ID cannot be edited.
        @[JSON::Field(key: "ReportJobId")]
        getter report_job_id : String?

        def initialize(
          @report_job_id : String? = nil
        )
        end
      end

      struct StartRestoreJobInput
        include JSON::Serializable

        # A set of metadata key-value pairs. You can get configuration metadata about a resource at the time
        # it was backed up by calling GetRecoveryPointRestoreMetadata . However, values in addition to those
        # provided by GetRecoveryPointRestoreMetadata might be required to restore a resource. For example,
        # you might need to provide a new resource name if the original already exists. For more information
        # about the metadata for each resource, see the following: Metadata for Amazon Aurora Metadata for
        # Amazon DocumentDB Metadata for CloudFormation Metadata for Amazon DynamoDB Metadata for Amazon EBS
        # Metadata for Amazon EC2 Metadata for Amazon EFS Metadata for Amazon FSx Metadata for Amazon Neptune
        # Metadata for Amazon RDS Metadata for Amazon Redshift Metadata for Storage Gateway Metadata for
        # Amazon S3 Metadata for Amazon Timestream Metadata for virtual machines
        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # This is an optional parameter. If this equals True , tags included in the backup will be copied to
        # the restored resource. This can only be applied to backups created through Backup.
        @[JSON::Field(key: "CopySourceTagsToRestoredResource")]
        getter copy_source_tags_to_restored_resource : Bool?

        # The Amazon Resource Name (ARN) of the IAM role that Backup uses to create the target resource; for
        # example: arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # StartRestoreJob . Retrying a successful request with the same idempotency token results in a success
        # message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Starts a job to restore a recovery point for one of the following resources: Aurora - Amazon Aurora
        # DocumentDB - Amazon DocumentDB CloudFormation - CloudFormation DynamoDB - Amazon DynamoDB EBS -
        # Amazon Elastic Block Store EC2 - Amazon Elastic Compute Cloud EFS - Amazon Elastic File System FSx -
        # Amazon FSx Neptune - Amazon Neptune RDS - Amazon Relational Database Service Redshift - Amazon
        # Redshift Storage Gateway - Storage Gateway S3 - Amazon Simple Storage Service Timestream - Amazon
        # Timestream VirtualMachine - Virtual machines
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @metadata : Hash(String, String),
          @recovery_point_arn : String,
          @copy_source_tags_to_restored_resource : Bool? = nil,
          @iam_role_arn : String? = nil,
          @idempotency_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct StartRestoreJobOutput
        include JSON::Serializable

        # Uniquely identifies the job that restores a recovery point.
        @[JSON::Field(key: "RestoreJobId")]
        getter restore_job_id : String?

        def initialize(
          @restore_job_id : String? = nil
        )
        end
      end

      struct StartScanJobInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created. Pattern: ^[a-zA-Z0-9\-\_]{2,50}$
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # Specifies the IAM role ARN used to create the target recovery point; for example,
        # arn:aws:iam::123456789012:role/S3Access .
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # Specifies the malware scanner used during the scan job. Currently only supports GUARDDUTY .
        @[JSON::Field(key: "MalwareScanner")]
        getter malware_scanner : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point. This is your target
        # recovery point for a full scan. If you are running an incremental scan, this will be your a recovery
        # point which has been created after your base recovery point selection.
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String

        # Specifies the scan type use for the scan job. Includes: FULL_SCAN will scan the entire data lineage
        # within the backup. INCREMENTAL_SCAN will scan the data difference between the target recovery point
        # and base recovery point ARN.
        @[JSON::Field(key: "ScanMode")]
        getter scan_mode : String

        # Specified the IAM scanner role ARN.
        @[JSON::Field(key: "ScannerRoleArn")]
        getter scanner_role_arn : String

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # StartScanJob . Retrying a successful request with the same idempotency token results in a success
        # message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # An ARN that uniquely identifies the base recovery point to be used for incremental scanning.
        @[JSON::Field(key: "ScanBaseRecoveryPointArn")]
        getter scan_base_recovery_point_arn : String?

        def initialize(
          @backup_vault_name : String,
          @iam_role_arn : String,
          @malware_scanner : String,
          @recovery_point_arn : String,
          @scan_mode : String,
          @scanner_role_arn : String,
          @idempotency_token : String? = nil,
          @scan_base_recovery_point_arn : String? = nil
        )
        end
      end

      struct StartScanJobOutput
        include JSON::Serializable

        # The date and time that a backup job is created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "ScanJobId")]
        getter scan_job_id : String

        def initialize(
          @creation_date : Time,
          @scan_job_id : String
        )
        end
      end

      struct StopBackupJobInput
        include JSON::Serializable

        # Uniquely identifies a request to Backup to back up a resource.
        @[JSON::Field(key: "backupJobId")]
        getter backup_job_id : String

        def initialize(
          @backup_job_id : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The ARN that uniquely identifies the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Key-value pairs that are used to help organize your resources. You can assign your own metadata to
        # the resources you create. For clarity, this is the structure to assign tags:
        # [{"Key":"string","Value":"string"}] .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # This contains metadata about a tiering configuration.
      struct TieringConfiguration
        include JSON::Serializable

        # The name of the backup vault where the tiering configuration applies. Use * to apply to all backup
        # vaults.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # An array of resource selection objects that specify which resources are included in the tiering
        # configuration and their tiering settings.
        @[JSON::Field(key: "ResourceSelection")]
        getter resource_selection : Array(Types::ResourceSelection)

        # The unique name of the tiering configuration. This cannot be changed after creation, and it must
        # consist of only alphanumeric characters and underscores.
        @[JSON::Field(key: "TieringConfigurationName")]
        getter tiering_configuration_name : String

        # The date and time a tiering configuration was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # This is a unique string that identifies the request and allows failed requests to be retried without
        # the risk of running the operation twice.
        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The date and time a tiering configuration was updated, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastUpdatedTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies the tiering configuration.
        @[JSON::Field(key: "TieringConfigurationArn")]
        getter tiering_configuration_arn : String?

        def initialize(
          @backup_vault_name : String,
          @resource_selection : Array(Types::ResourceSelection),
          @tiering_configuration_name : String,
          @creation_time : Time? = nil,
          @creator_request_id : String? = nil,
          @last_updated_time : Time? = nil,
          @tiering_configuration_arn : String? = nil
        )
        end
      end

      # This contains metadata about a tiering configuration for create operations.
      struct TieringConfigurationInputForCreate
        include JSON::Serializable

        # The name of the backup vault where the tiering configuration applies. Use * to apply to all backup
        # vaults.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # An array of resource selection objects that specify which resources are included in the tiering
        # configuration and their tiering settings.
        @[JSON::Field(key: "ResourceSelection")]
        getter resource_selection : Array(Types::ResourceSelection)

        # The unique name of the tiering configuration. This cannot be changed after creation, and it must
        # consist of only alphanumeric characters and underscores.
        @[JSON::Field(key: "TieringConfigurationName")]
        getter tiering_configuration_name : String

        def initialize(
          @backup_vault_name : String,
          @resource_selection : Array(Types::ResourceSelection),
          @tiering_configuration_name : String
        )
        end
      end

      # This contains metadata about a tiering configuration for update operations.
      struct TieringConfigurationInputForUpdate
        include JSON::Serializable

        # The name of the backup vault where the tiering configuration applies. Use * to apply to all backup
        # vaults.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String

        # An array of resource selection objects that specify which resources are included in the tiering
        # configuration and their tiering settings.
        @[JSON::Field(key: "ResourceSelection")]
        getter resource_selection : Array(Types::ResourceSelection)

        def initialize(
          @backup_vault_name : String,
          @resource_selection : Array(Types::ResourceSelection)
        )
        end
      end

      # This contains metadata about a tiering configuration returned in a list.
      struct TieringConfigurationsListMember
        include JSON::Serializable

        # The name of the backup vault where the tiering configuration applies. Use * to apply to all backup
        # vaults.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # The date and time a tiering configuration was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The date and time a tiering configuration was updated, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastUpdatedTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies the tiering configuration.
        @[JSON::Field(key: "TieringConfigurationArn")]
        getter tiering_configuration_arn : String?

        # The unique name of the tiering configuration.
        @[JSON::Field(key: "TieringConfigurationName")]
        getter tiering_configuration_name : String?

        def initialize(
          @backup_vault_name : String? = nil,
          @creation_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @tiering_configuration_arn : String? = nil,
          @tiering_configuration_name : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # An ARN that uniquely identifies a resource. The format of the ARN depends on the type of the tagged
        # resource. ARNs that do not include backup are incompatible with tagging. TagResource and
        # UntagResource with invalid ARNs will result in an error. Acceptable ARN content can include
        # arn:aws:backup:us-east . Invalid ARN content may look like arn:aws:ec2:us-east .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys to identify which key-value tags to remove from a resource.
        @[JSON::Field(key: "TagKeyList")]
        getter tag_key_list : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_key_list : Array(String)
        )
        end
      end

      struct UpdateBackupPlanInput
        include JSON::Serializable

        # The body of a backup plan. Includes a BackupPlanName and one or more sets of Rules .
        @[JSON::Field(key: "BackupPlan")]
        getter backup_plan : Types::BackupPlanInput

        # The ID of the backup plan.
        @[JSON::Field(key: "backupPlanId")]
        getter backup_plan_id : String

        def initialize(
          @backup_plan : Types::BackupPlanInput,
          @backup_plan_id : String
        )
        end
      end

      struct UpdateBackupPlanOutput
        include JSON::Serializable

        # Contains a list of BackupOptions for each resource type.
        @[JSON::Field(key: "AdvancedBackupSettings")]
        getter advanced_backup_settings : Array(Types::AdvancedBackupSetting)?

        # An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for example,
        # arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50 .
        @[JSON::Field(key: "BackupPlanArn")]
        getter backup_plan_arn : String?

        # Uniquely identifies a backup plan.
        @[JSON::Field(key: "BackupPlanId")]
        getter backup_plan_id : String?

        # The date and time a backup plan is created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CreationDate is accurate to milliseconds. For example, the value 1516925490.087 represents
        # Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Contains your scanning configuration for the backup plan and includes the Malware scanner, your
        # selected resources, and scanner role.
        @[JSON::Field(key: "ScanSettings")]
        getter scan_settings : Array(Types::ScanSetting)?

        # Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most 1,024 bytes long.
        # Version Ids cannot be edited.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @advanced_backup_settings : Array(Types::AdvancedBackupSetting)? = nil,
          @backup_plan_arn : String? = nil,
          @backup_plan_id : String? = nil,
          @creation_date : Time? = nil,
          @scan_settings : Array(Types::ScanSetting)? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct UpdateFrameworkInput
        include JSON::Serializable

        # The unique name of a framework. This name is between 1 and 256 characters, starting with a letter,
        # and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "frameworkName")]
        getter framework_name : String

        # The controls that make up the framework. Each control in the list has a name, input parameters, and
        # scope.
        @[JSON::Field(key: "FrameworkControls")]
        getter framework_controls : Array(Types::FrameworkControl)?

        # An optional description of the framework with a maximum 1,024 characters.
        @[JSON::Field(key: "FrameworkDescription")]
        getter framework_description : String?

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # UpdateFrameworkInput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @framework_name : String,
          @framework_controls : Array(Types::FrameworkControl)? = nil,
          @framework_description : String? = nil,
          @idempotency_token : String? = nil
        )
        end
      end

      struct UpdateFrameworkOutput
        include JSON::Serializable

        # The date and time that a framework is created, in ISO 8601 representation. The value of CreationTime
        # is accurate to milliseconds. For example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July
        # 2020 at 3:00 PM 8 hours behind UTC.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "FrameworkArn")]
        getter framework_arn : String?

        # The unique name of a framework. This name is between 1 and 256 characters, starting with a letter,
        # and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "FrameworkName")]
        getter framework_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @framework_arn : String? = nil,
          @framework_name : String? = nil
        )
        end
      end

      struct UpdateGlobalSettingsInput
        include JSON::Serializable

        # Inputs can include: A value for isCrossAccountBackupEnabled and a Region. Example:
        # update-global-settings --global-settings isCrossAccountBackupEnabled=false --region us-west-2 . A
        # value for Multi-party approval, styled as "Mpa": isMpaEnabled . Values can be true or false.
        # Example: update-global-settings --global-settings isMpaEnabled=false --region us-west-2 . A value
        # for Backup Service-Linked Role creation, styled as isDelegatedAdministratorEnabled . Values can be
        # true or false. Example: update-global-settings --global-settings
        # isDelegatedAdministratorEnabled=false --region us-west-2 .
        @[JSON::Field(key: "GlobalSettings")]
        getter global_settings : Hash(String, String)?

        def initialize(
          @global_settings : Hash(String, String)? = nil
        )
        end
      end

      struct UpdateRecoveryPointIndexSettingsInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created. Accepted
        # characters include lowercase letters, numbers, and hyphens.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # Index can have 1 of 2 possible values, either ENABLED or DISABLED . To create a backup index for an
        # eligible ACTIVE recovery point that does not yet have a backup index, set value to ENABLED . To
        # delete a backup index, set value to DISABLED .
        @[JSON::Field(key: "Index")]
        getter index : String

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        # This specifies the IAM role ARN used for this operation. For example,
        # arn:aws:iam::123456789012:role/S3Access
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        def initialize(
          @backup_vault_name : String,
          @index : String,
          @recovery_point_arn : String,
          @iam_role_arn : String? = nil
        )
        end
      end

      struct UpdateRecoveryPointIndexSettingsOutput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Region where they are created.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # Index can have 1 of 2 possible values, either ENABLED or DISABLED . A value of ENABLED means a
        # backup index for an eligible ACTIVE recovery point has been created. A value of DISABLED means a
        # backup index was deleted.
        @[JSON::Field(key: "Index")]
        getter index : String?

        # This is the current status for the backup index associated with the specified recovery point.
        # Statuses are: PENDING | ACTIVE | FAILED | DELETING A recovery point with an index that has the
        # status of ACTIVE can be included in a search.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # An ARN that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        def initialize(
          @backup_vault_name : String? = nil,
          @index : String? = nil,
          @index_status : String? = nil,
          @recovery_point_arn : String? = nil
        )
        end
      end

      struct UpdateRecoveryPointLifecycleInput
        include JSON::Serializable

        # The name of a logical container where backups are stored. Backup vaults are identified by names that
        # are unique to the account used to create them and the Amazon Web Services Region where they are
        # created.
        @[JSON::Field(key: "backupVaultName")]
        getter backup_vault_name : String

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "recoveryPointArn")]
        getter recovery_point_arn : String

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup transitions and expires backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        def initialize(
          @backup_vault_name : String,
          @recovery_point_arn : String,
          @lifecycle : Types::Lifecycle? = nil
        )
        end
      end

      struct UpdateRecoveryPointLifecycleOutput
        include JSON::Serializable

        # An ARN that uniquely identifies a backup vault; for example,
        # arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault .
        @[JSON::Field(key: "BackupVaultArn")]
        getter backup_vault_arn : String?

        # A CalculatedLifecycle object containing DeleteAt and MoveToColdStorageAt timestamps.
        @[JSON::Field(key: "CalculatedLifecycle")]
        getter calculated_lifecycle : Types::CalculatedLifecycle?

        # The lifecycle defines when a protected resource is transitioned to cold storage and when it expires.
        # Backup transitions and expires backups automatically according to the lifecycle that you define.
        # Backups transitioned to cold storage must be stored in cold storage for a minimum of 90 days.
        # Therefore, the “retention” setting must be 90 days greater than the “transition to cold after days”
        # setting. The “transition to cold after days” setting cannot be changed after a backup has been
        # transitioned to cold. Resource types that can transition to cold storage are listed in the Feature
        # availability by resource table. Backup ignores this expression for other resource types.
        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : Types::Lifecycle?

        # An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for example,
        # arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45 .
        @[JSON::Field(key: "RecoveryPointArn")]
        getter recovery_point_arn : String?

        def initialize(
          @backup_vault_arn : String? = nil,
          @calculated_lifecycle : Types::CalculatedLifecycle? = nil,
          @lifecycle : Types::Lifecycle? = nil,
          @recovery_point_arn : String? = nil
        )
        end
      end

      struct UpdateRegionSettingsInput
        include JSON::Serializable

        # Enables or disables full Backup management of backups for a resource type. To enable full Backup
        # management for DynamoDB along with Backup's advanced DynamoDB backup features , follow the procedure
        # to enable advanced DynamoDB backup programmatically .
        @[JSON::Field(key: "ResourceTypeManagementPreference")]
        getter resource_type_management_preference : Hash(String, Bool)?

        # Updates the list of services along with the opt-in preferences for the Region. If resource
        # assignments are only based on tags, then service opt-in settings are applied. If a resource type is
        # explicitly assigned to a backup plan, such as Amazon S3, Amazon EC2, or Amazon RDS, it will be
        # included in the backup even if the opt-in is not enabled for that particular service. If both a
        # resource type and tags are specified in a resource assignment, the resource type specified in the
        # backup plan takes priority over the tag condition. Service opt-in settings are disregarded in this
        # situation.
        @[JSON::Field(key: "ResourceTypeOptInPreference")]
        getter resource_type_opt_in_preference : Hash(String, Bool)?

        def initialize(
          @resource_type_management_preference : Hash(String, Bool)? = nil,
          @resource_type_opt_in_preference : Hash(String, Bool)? = nil
        )
        end
      end

      struct UpdateReportPlanInput
        include JSON::Serializable

        # The unique name of the report plan. This name is between 1 and 256 characters, starting with a
        # letter, and consisting of letters (a-z, A-Z), numbers (0-9), and underscores (_).
        @[JSON::Field(key: "reportPlanName")]
        getter report_plan_name : String

        # A customer-chosen string that you can use to distinguish between otherwise identical calls to
        # UpdateReportPlanInput . Retrying a successful request with the same idempotency token results in a
        # success message with no action taken.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The information about where to deliver your reports, specifically your Amazon S3 bucket name, S3 key
        # prefix, and the formats of your reports.
        @[JSON::Field(key: "ReportDeliveryChannel")]
        getter report_delivery_channel : Types::ReportDeliveryChannel?

        # An optional description of the report plan with a maximum 1,024 characters.
        @[JSON::Field(key: "ReportPlanDescription")]
        getter report_plan_description : String?

        # The report template for the report. Reports are built using a report template. The report templates
        # are: RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT | BACKUP_JOB_REPORT | COPY_JOB_REPORT |
        # RESTORE_JOB_REPORT If the report template is RESOURCE_COMPLIANCE_REPORT or CONTROL_COMPLIANCE_REPORT
        # , this API resource also describes the report coverage by Amazon Web Services Regions and
        # frameworks.
        @[JSON::Field(key: "ReportSetting")]
        getter report_setting : Types::ReportSetting?

        def initialize(
          @report_plan_name : String,
          @idempotency_token : String? = nil,
          @report_delivery_channel : Types::ReportDeliveryChannel? = nil,
          @report_plan_description : String? = nil,
          @report_setting : Types::ReportSetting? = nil
        )
        end
      end

      struct UpdateReportPlanOutput
        include JSON::Serializable

        # The date and time that a report plan is created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies a resource. The format of the ARN depends on
        # the resource type.
        @[JSON::Field(key: "ReportPlanArn")]
        getter report_plan_arn : String?

        # The unique name of the report plan.
        @[JSON::Field(key: "ReportPlanName")]
        getter report_plan_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @report_plan_arn : String? = nil,
          @report_plan_name : String? = nil
        )
        end
      end

      struct UpdateRestoreTestingPlanInput
        include JSON::Serializable

        # Specifies the body of a restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlan")]
        getter restore_testing_plan : Types::RestoreTestingPlanForUpdate

        # The name of the restore testing plan name.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        def initialize(
          @restore_testing_plan : Types::RestoreTestingPlanForUpdate,
          @restore_testing_plan_name : String
        )
        end
      end

      struct UpdateRestoreTestingPlanOutput
        include JSON::Serializable

        # The time the resource testing plan was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # Unique ARN (Amazon Resource Name) of the restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # The name cannot be changed after creation. The name consists of only alphanumeric characters and
        # underscores. Maximum length is 50.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # The time the update completed for the restore testing plan.
        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String,
          @update_time : Time
        )
        end
      end

      struct UpdateRestoreTestingSelectionInput
        include JSON::Serializable

        # The restore testing plan name is required to update the indicated testing plan.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # To update your restore testing selection, you can use either protected resource ARNs or conditions,
        # but not both. That is, if your selection has ProtectedResourceArns , requesting an update with the
        # parameter ProtectedResourceConditions will be unsuccessful.
        @[JSON::Field(key: "RestoreTestingSelection")]
        getter restore_testing_selection : Types::RestoreTestingSelectionForUpdate

        # The required restore testing selection name of the restore testing selection you wish to update.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        def initialize(
          @restore_testing_plan_name : String,
          @restore_testing_selection : Types::RestoreTestingSelectionForUpdate,
          @restore_testing_selection_name : String
        )
        end
      end

      struct UpdateRestoreTestingSelectionOutput
        include JSON::Serializable

        # The time the resource testing selection was updated successfully.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # Unique string that is the name of the restore testing plan.
        @[JSON::Field(key: "RestoreTestingPlanArn")]
        getter restore_testing_plan_arn : String

        # The restore testing plan with which the updated restore testing selection is associated.
        @[JSON::Field(key: "RestoreTestingPlanName")]
        getter restore_testing_plan_name : String

        # The returned restore testing selection name.
        @[JSON::Field(key: "RestoreTestingSelectionName")]
        getter restore_testing_selection_name : String

        # The time the update completed for the restore testing selection.
        @[JSON::Field(key: "UpdateTime")]
        getter update_time : Time

        def initialize(
          @creation_time : Time,
          @restore_testing_plan_arn : String,
          @restore_testing_plan_name : String,
          @restore_testing_selection_name : String,
          @update_time : Time
        )
        end
      end

      struct UpdateTieringConfigurationInput
        include JSON::Serializable

        # Specifies the body of a tiering configuration.
        @[JSON::Field(key: "TieringConfiguration")]
        getter tiering_configuration : Types::TieringConfigurationInputForUpdate

        # The name of a tiering configuration to update.
        @[JSON::Field(key: "tieringConfigurationName")]
        getter tiering_configuration_name : String

        def initialize(
          @tiering_configuration : Types::TieringConfigurationInputForUpdate,
          @tiering_configuration_name : String
        )
        end
      end

      struct UpdateTieringConfigurationOutput
        include JSON::Serializable

        # The date and time a tiering configuration was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The date and time a tiering configuration was updated, in Unix format and Coordinated Universal Time
        # (UTC). The value of LastUpdatedTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087AM.
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # An Amazon Resource Name (ARN) that uniquely identifies the updated tiering configuration.
        @[JSON::Field(key: "TieringConfigurationArn")]
        getter tiering_configuration_arn : String?

        # This unique string is the name of the tiering configuration.
        @[JSON::Field(key: "TieringConfigurationName")]
        getter tiering_configuration_name : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @tiering_configuration_arn : String? = nil,
          @tiering_configuration_name : String? = nil
        )
        end
      end
    end
  end
end
