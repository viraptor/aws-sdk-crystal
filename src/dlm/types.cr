require "json"
require "time"

module Aws
  module DLM
    module Types

      # [Event-based policies only] Specifies an action for an event-based policy.

      struct Action
        include JSON::Serializable

        # The rule for copying shared snapshots across Regions.

        @[JSON::Field(key: "CrossRegionCopy")]
        getter cross_region_copy : Array(Types::CrossRegionCopyAction)

        # A descriptive name for the action.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @cross_region_copy : Array(Types::CrossRegionCopyAction),
          @name : String
        )
        end
      end

      # [Custom snapshot policies only] Specifies information about the archive storage tier retention
      # period.

      struct ArchiveRetainRule
        include JSON::Serializable

        # Information about retention period in the Amazon EBS Snapshots Archive. For more information, see
        # Archive Amazon EBS snapshots .

        @[JSON::Field(key: "RetentionArchiveTier")]
        getter retention_archive_tier : Types::RetentionArchiveTier

        def initialize(
          @retention_archive_tier : Types::RetentionArchiveTier
        )
        end
      end

      # [Custom snapshot policies only] Specifies a snapshot archiving rule for a schedule.

      struct ArchiveRule
        include JSON::Serializable

        # Information about the retention period for the snapshot archiving rule.

        @[JSON::Field(key: "RetainRule")]
        getter retain_rule : Types::ArchiveRetainRule

        def initialize(
          @retain_rule : Types::ArchiveRetainRule
        )
        end
      end


      struct CreateLifecyclePolicyRequest
        include JSON::Serializable

        # A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+$ are supported.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle
        # policy.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The activation state of the lifecycle policy after creation.

        @[JSON::Field(key: "State")]
        getter state : String

        # [Default policies only] Indicates whether the policy should copy tags from the source resource to
        # the snapshot or AMI. If you do not specify a value, the default is false . Default: false

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # [Default policies only] Specifies how often the policy should run and create snapshots or AMIs. The
        # creation frequency can range from 1 to 7 days. If you do not specify a value, the default is 1.
        # Default: 1

        @[JSON::Field(key: "CreateInterval")]
        getter create_interval : Int32?

        # [Default policies only] Specifies destination Regions for snapshot or AMI copies. You can specify up
        # to 3 destination Regions. If you do not want to create cross-Region copies, omit this parameter.

        @[JSON::Field(key: "CrossRegionCopyTargets")]
        getter cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)?

        # [Default policies only] Specify the type of default policy to create. To create a default policy for
        # EBS snapshots, that creates snapshots of all volumes in the Region that do not have recent backups,
        # specify VOLUME . To create a default policy for EBS-backed AMIs, that creates EBS-backed AMIs from
        # all instances in the Region that do not have recent backups, specify INSTANCE .

        @[JSON::Field(key: "DefaultPolicy")]
        getter default_policy : String?

        # [Default policies only] Specifies exclusion parameters for volumes or instances for which you do not
        # want to create snapshots or AMIs. The policy will not create snapshots or AMIs for target resources
        # that match any of the specified exclusion parameters.

        @[JSON::Field(key: "Exclusions")]
        getter exclusions : Types::Exclusions?

        # [Default policies only] Defines the snapshot or AMI retention behavior for the policy if the source
        # volume or instance is deleted, or if the policy enters the error, disabled, or deleted state. By
        # default ( ExtendDeletion=false ): If a source resource is deleted, Amazon Data Lifecycle Manager
        # will continue to delete previously created snapshots or AMIs, up to but not including the last one,
        # based on the specified retention period. If you want Amazon Data Lifecycle Manager to delete all
        # snapshots or AMIs, including the last one, specify true . If a policy enters the error, disabled, or
        # deleted state, Amazon Data Lifecycle Manager stops deleting snapshots and AMIs. If you want Amazon
        # Data Lifecycle Manager to continue deleting snapshots or AMIs, including the last one, if the policy
        # enters one of these states, specify true . If you enable extended deletion ( ExtendDeletion=true ),
        # you override both default behaviors simultaneously. If you do not specify a value, the default is
        # false . Default: false

        @[JSON::Field(key: "ExtendDeletion")]
        getter extend_deletion : Bool?

        # The configuration details of the lifecycle policy. If you create a default policy, you can specify
        # the request parameters either in the request body, or in the PolicyDetails request structure, but
        # not both.

        @[JSON::Field(key: "PolicyDetails")]
        getter policy_details : Types::PolicyDetails?

        # [Default policies only] Specifies how long the policy should retain snapshots or AMIs before
        # deleting them. The retention period can range from 2 to 14 days, but it must be greater than the
        # creation frequency to ensure that the policy retains at least 1 snapshot or AMI at any given time.
        # If you do not specify a value, the default is 7. Default: 7

        @[JSON::Field(key: "RetainInterval")]
        getter retain_interval : Int32?

        # The tags to apply to the lifecycle policy during creation.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @execution_role_arn : String,
          @state : String,
          @copy_tags : Bool? = nil,
          @create_interval : Int32? = nil,
          @cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)? = nil,
          @default_policy : String? = nil,
          @exclusions : Types::Exclusions? = nil,
          @extend_deletion : Bool? = nil,
          @policy_details : Types::PolicyDetails? = nil,
          @retain_interval : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLifecyclePolicyResponse
        include JSON::Serializable

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        def initialize(
          @policy_id : String? = nil
        )
        end
      end

      # [Custom snapshot and AMI policies only] Specifies when the policy should create snapshots or AMIs.
      # You must specify either CronExpression , or Interval , IntervalUnit , and Times . If you need to
      # specify an ArchiveRule for the schedule, then you must specify a creation frequency of at least 28
      # days.

      struct CreateRule
        include JSON::Serializable

        # The schedule, as a Cron expression. The schedule interval must be between 1 hour and 1 year. For
        # more information, see the Cron expressions reference in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String?

        # The interval between snapshots. The supported values are 1, 2, 3, 4, 6, 8, 12, and 24.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The interval unit.

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        # [Custom snapshot policies only] Specifies the destination for snapshots created by the policy. The
        # allowed destinations depend on the location of the targeted resources. If the policy targets
        # resources in a Region, then you must create snapshots in the same Region as the source resource. If
        # the policy targets resources in a Local Zone, you can create snapshots in the same Local Zone or in
        # its parent Region. If the policy targets resources on an Outpost, then you can create snapshots on
        # the same Outpost or in its parent Region. Specify one of the following values: To create snapshots
        # in the same Region as the source resource, specify CLOUD . To create snapshots in the same Local
        # Zone as the source resource, specify LOCAL_ZONE . To create snapshots on the same Outpost as the
        # source resource, specify OUTPOST_LOCAL . Default: CLOUD

        @[JSON::Field(key: "Location")]
        getter location : String?

        # [Custom snapshot policies that target instances only] Specifies pre and/or post scripts for a
        # snapshot lifecycle policy that targets instances. This is useful for creating application-consistent
        # snapshots, or for performing specific administrative tasks before or after Amazon Data Lifecycle
        # Manager initiates snapshot creation. For more information, see Automating application-consistent
        # snapshots with pre and post scripts .

        @[JSON::Field(key: "Scripts")]
        getter scripts : Array(Types::Script)?

        # The time, in UTC, to start the operation. The supported format is hh:mm. The operation occurs within
        # a one-hour window following the specified time. If you do not specify a time, Amazon Data Lifecycle
        # Manager selects a time within the next 24 hours.

        @[JSON::Field(key: "Times")]
        getter times : Array(String)?

        def initialize(
          @cron_expression : String? = nil,
          @interval : Int32? = nil,
          @interval_unit : String? = nil,
          @location : String? = nil,
          @scripts : Array(Types::Script)? = nil,
          @times : Array(String)? = nil
        )
        end
      end

      # [Event-based policies only] Specifies a cross-Region copy action for event-based policies. To
      # specify a cross-Region copy rule for snapshot and AMI policies, use CrossRegionCopyRule .

      struct CrossRegionCopyAction
        include JSON::Serializable

        # The encryption settings for the copied snapshot.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration

        # The target Region.

        @[JSON::Field(key: "Target")]
        getter target : String


        @[JSON::Field(key: "RetainRule")]
        getter retain_rule : Types::CrossRegionCopyRetainRule?

        def initialize(
          @encryption_configuration : Types::EncryptionConfiguration,
          @target : String,
          @retain_rule : Types::CrossRegionCopyRetainRule? = nil
        )
        end
      end

      # [Custom AMI policies only] Specifies an AMI deprecation rule for cross-Region AMI copies created by
      # an AMI policy.

      struct CrossRegionCopyDeprecateRule
        include JSON::Serializable

        # The period after which to deprecate the cross-Region AMI copies. The period must be less than or
        # equal to the cross-Region AMI copy retention period, and it can't be greater than 10 years. This is
        # equivalent to 120 months, 520 weeks, or 3650 days.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time in which to measure the Interval . For example, to deprecate a cross-Region AMI
        # copy after 3 months, specify Interval=3 and IntervalUnit=MONTHS .

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end

      # Specifies a retention rule for cross-Region snapshot copies created by snapshot or event-based
      # policies, or cross-Region AMI copies created by AMI policies. After the retention period expires,
      # the cross-Region copy is deleted.

      struct CrossRegionCopyRetainRule
        include JSON::Serializable

        # The amount of time to retain a cross-Region snapshot or AMI copy. The maximum is 100 years. This is
        # equivalent to 1200 months, 5200 weeks, or 36500 days.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time for time-based retention. For example, to retain a cross-Region copy for 3 months,
        # specify Interval=3 and IntervalUnit=MONTHS .

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end

      # [Custom snapshot and AMI policies only] Specifies a cross-Region copy rule for a snapshot and AMI
      # policies. To specify a cross-Region copy action for event-based polices, use CrossRegionCopyAction .

      struct CrossRegionCopyRule
        include JSON::Serializable

        # To encrypt a copy of an unencrypted snapshot if encryption by default is not enabled, enable
        # encryption using this parameter. Copies of encrypted snapshots are encrypted, even if this parameter
        # is false or if encryption by default is not enabled.

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool

        # The Amazon Resource Name (ARN) of the KMS key to use for EBS encryption. If this parameter is not
        # specified, the default KMS key for the account is used.

        @[JSON::Field(key: "CmkArn")]
        getter cmk_arn : String?

        # Indicates whether to copy all user-defined tags from the source snapshot or AMI to the cross-Region
        # copy.

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # [Custom AMI policies only] The AMI deprecation rule for cross-Region AMI copies created by the rule.

        @[JSON::Field(key: "DeprecateRule")]
        getter deprecate_rule : Types::CrossRegionCopyDeprecateRule?

        # The retention rule that indicates how long the cross-Region snapshot or AMI copies are to be
        # retained in the destination Region.

        @[JSON::Field(key: "RetainRule")]
        getter retain_rule : Types::CrossRegionCopyRetainRule?

        # Use this parameter for snapshot policies only. For AMI policies, use TargetRegion instead. [Custom
        # snapshot policies only] The target Region or the Amazon Resource Name (ARN) of the target Outpost
        # for the snapshot copies.

        @[JSON::Field(key: "Target")]
        getter target : String?

        # Use this parameter for AMI policies only. For snapshot policies, use Target instead. For snapshot
        # policies created before the Target parameter was introduced, this parameter indicates the target
        # Region for snapshot copies. [Custom AMI policies only] The target Region or the Amazon Resource Name
        # (ARN) of the target Outpost for the snapshot copies.

        @[JSON::Field(key: "TargetRegion")]
        getter target_region : String?

        def initialize(
          @encrypted : Bool,
          @cmk_arn : String? = nil,
          @copy_tags : Bool? = nil,
          @deprecate_rule : Types::CrossRegionCopyDeprecateRule? = nil,
          @retain_rule : Types::CrossRegionCopyRetainRule? = nil,
          @target : String? = nil,
          @target_region : String? = nil
        )
        end
      end

      # [Default policies only] Specifies a destination Region for cross-Region copy actions.

      struct CrossRegionCopyTarget
        include JSON::Serializable

        # The target Region, for example us-east-1 .

        @[JSON::Field(key: "TargetRegion")]
        getter target_region : String?

        def initialize(
          @target_region : String? = nil
        )
        end
      end


      struct DeleteLifecyclePolicyRequest
        include JSON::Serializable

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end


      struct DeleteLifecyclePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # [Custom AMI policies only] Specifies an AMI deprecation rule for AMIs created by an AMI lifecycle
      # policy. For age-based schedules, you must specify Interval and IntervalUnit . For count-based
      # schedules, you must specify Count .

      struct DeprecateRule
        include JSON::Serializable

        # If the schedule has a count-based retention rule, this parameter specifies the number of oldest AMIs
        # to deprecate. The count must be less than or equal to the schedule's retention count, and it can't
        # be greater than 1000.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # If the schedule has an age-based retention rule, this parameter specifies the period after which to
        # deprecate AMIs created by the schedule. The period must be less than or equal to the schedule's
        # retention period, and it can't be greater than 10 years. This is equivalent to 120 months, 520
        # weeks, or 3650 days.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time in which to measure the Interval .

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @count : Int32? = nil,
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end

      # [Event-based policies only] Specifies the encryption settings for cross-Region snapshot copies
      # created by event-based policies.

      struct EncryptionConfiguration
        include JSON::Serializable

        # To encrypt a copy of an unencrypted snapshot when encryption by default is not enabled, enable
        # encryption using this parameter. Copies of encrypted snapshots are encrypted, even if this parameter
        # is false or when encryption by default is not enabled.

        @[JSON::Field(key: "Encrypted")]
        getter encrypted : Bool

        # The Amazon Resource Name (ARN) of the KMS key to use for EBS encryption. If this parameter is not
        # specified, the default KMS key for the account is used.

        @[JSON::Field(key: "CmkArn")]
        getter cmk_arn : String?

        def initialize(
          @encrypted : Bool,
          @cmk_arn : String? = nil
        )
        end
      end

      # [Event-based policies only] Specifies an event that activates an event-based policy.

      struct EventParameters
        include JSON::Serializable

        # The snapshot description that can trigger the policy. The description pattern is specified using a
        # regular expression. The policy runs only if a snapshot with a description that matches the specified
        # pattern is shared with your account. For example, specifying ^.*Created for policy:
        # policy-1234567890abcdef0.*$ configures the policy to run only if snapshots created by policy
        # policy-1234567890abcdef0 are shared with your account.

        @[JSON::Field(key: "DescriptionRegex")]
        getter description_regex : String

        # The type of event. Currently, only snapshot sharing events are supported.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The IDs of the Amazon Web Services accounts that can trigger policy by sharing snapshots with your
        # account. The policy only runs if one of the specified Amazon Web Services accounts shares a snapshot
        # with your account.

        @[JSON::Field(key: "SnapshotOwner")]
        getter snapshot_owner : Array(String)

        def initialize(
          @description_regex : String,
          @event_type : String,
          @snapshot_owner : Array(String)
        )
        end
      end

      # [Event-based policies only] Specifies an event that activates an event-based policy.

      struct EventSource
        include JSON::Serializable

        # The source of the event. Currently only managed CloudWatch Events rules are supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Information about the event.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Types::EventParameters?

        def initialize(
          @type : String,
          @parameters : Types::EventParameters? = nil
        )
        end
      end

      # [Default policies only] Specifies exclusion parameters for volumes or instances for which you do not
      # want to create snapshots or AMIs. The policy will not create snapshots or AMIs for target resources
      # that match any of the specified exclusion parameters.

      struct Exclusions
        include JSON::Serializable

        # [Default policies for EBS snapshots only] Indicates whether to exclude volumes that are attached to
        # instances as the boot volume. If you exclude boot volumes, only volumes attached as data (non-boot)
        # volumes will be backed up by the policy. To exclude boot volumes, specify true .

        @[JSON::Field(key: "ExcludeBootVolumes")]
        getter exclude_boot_volumes : Bool?

        # [Default policies for EBS-backed AMIs only] Specifies whether to exclude volumes that have specific
        # tags.

        @[JSON::Field(key: "ExcludeTags")]
        getter exclude_tags : Array(Types::Tag)?

        # [Default policies for EBS snapshots only] Specifies the volume types to exclude. Volumes of the
        # specified types will not be targeted by the policy.

        @[JSON::Field(key: "ExcludeVolumeTypes")]
        getter exclude_volume_types : Array(String)?

        def initialize(
          @exclude_boot_volumes : Bool? = nil,
          @exclude_tags : Array(Types::Tag)? = nil,
          @exclude_volume_types : Array(String)? = nil
        )
        end
      end

      # [Custom snapshot policies only] Specifies a rule for enabling fast snapshot restore for snapshots
      # created by snapshot policies. You can enable fast snapshot restore based on either a count or a time
      # interval.

      struct FastRestoreRule
        include JSON::Serializable

        # The Availability Zones in which to enable fast snapshot restore.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)

        # The number of snapshots to be enabled with fast snapshot restore.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The amount of time to enable fast snapshot restore. The maximum is 100 years. This is equivalent to
        # 1200 months, 5200 weeks, or 36500 days.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time for enabling fast snapshot restore.

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @availability_zones : Array(String),
          @count : Int32? = nil,
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end


      struct GetLifecyclePoliciesRequest
        include JSON::Serializable

        # [Default policies only] Specifies the type of default policy to get. Specify one of the following:
        # VOLUME - To get only the default policy for EBS snapshots INSTANCE - To get only the default policy
        # for EBS-backed AMIs ALL - To get all default policies

        @[JSON::Field(key: "defaultPolicyType")]
        getter default_policy_type : String?

        # The identifiers of the data lifecycle policies.

        @[JSON::Field(key: "policyIds")]
        getter policy_ids : Array(String)?

        # The resource type.

        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        # The activation state.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The tags to add to objects created by the policy. Tags are strings in the format key=value . These
        # user-defined tags are added in addition to the Amazon Web Services-added lifecycle tags.

        @[JSON::Field(key: "tagsToAdd")]
        getter tags_to_add : Array(String)?

        # The target tag for a policy. Tags are strings in the format key=value .

        @[JSON::Field(key: "targetTags")]
        getter target_tags : Array(String)?

        def initialize(
          @default_policy_type : String? = nil,
          @policy_ids : Array(String)? = nil,
          @resource_types : Array(String)? = nil,
          @state : String? = nil,
          @tags_to_add : Array(String)? = nil,
          @target_tags : Array(String)? = nil
        )
        end
      end


      struct GetLifecyclePoliciesResponse
        include JSON::Serializable

        # Summary information about the lifecycle policies.

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::LifecyclePolicySummary)?

        def initialize(
          @policies : Array(Types::LifecyclePolicySummary)? = nil
        )
        end
      end


      struct GetLifecyclePolicyRequest
        include JSON::Serializable

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        def initialize(
          @policy_id : String
        )
        end
      end


      struct GetLifecyclePolicyResponse
        include JSON::Serializable

        # Detailed information about the lifecycle policy.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::LifecyclePolicy?

        def initialize(
          @policy : Types::LifecyclePolicy? = nil
        )
        end
      end

      # The service failed in an unexpected way.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Bad request. The request is missing required parameters or has invalid parameters.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request included parameters that cannot be provided together.

        @[JSON::Field(key: "MutuallyExclusiveParameters")]
        getter mutually_exclusive_parameters : Array(String)?

        # The request omitted one or more required parameters.

        @[JSON::Field(key: "RequiredParameters")]
        getter required_parameters : Array(String)?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @mutually_exclusive_parameters : Array(String)? = nil,
          @required_parameters : Array(String)? = nil
        )
        end
      end

      # Information about a lifecycle policy.

      struct LifecyclePolicy
        include JSON::Serializable

        # The local date and time when the lifecycle policy was created.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The local date and time when the lifecycle policy was last modified.

        @[JSON::Field(key: "DateModified")]
        getter date_modified : Time?

        # Indicates whether the policy is a default lifecycle policy or a custom lifecycle policy. true - the
        # policy is a default policy. false - the policy is a custom policy.

        @[JSON::Field(key: "DefaultPolicy")]
        getter default_policy : Bool?

        # The description of the lifecycle policy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle
        # policy.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The Amazon Resource Name (ARN) of the policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        # The configuration of the lifecycle policy

        @[JSON::Field(key: "PolicyDetails")]
        getter policy_details : Types::PolicyDetails?

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The activation state of the lifecycle policy.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The description of the status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @date_created : Time? = nil,
          @date_modified : Time? = nil,
          @default_policy : Bool? = nil,
          @description : String? = nil,
          @execution_role_arn : String? = nil,
          @policy_arn : String? = nil,
          @policy_details : Types::PolicyDetails? = nil,
          @policy_id : String? = nil,
          @state : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about a lifecycle policy.

      struct LifecyclePolicySummary
        include JSON::Serializable

        # [Default policies only] The type of default policy. Values include: VOLUME - Default policy for EBS
        # snapshots INSTANCE - Default policy for EBS-backed AMIs

        @[JSON::Field(key: "DefaultPolicy")]
        getter default_policy : Bool?

        # The description of the lifecycle policy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The type of policy. EBS_SNAPSHOT_MANAGEMENT indicates that the policy manages the lifecycle of
        # Amazon EBS snapshots. IMAGE_MANAGEMENT indicates that the policy manages the lifecycle of EBS-backed
        # AMIs. EVENT_BASED_POLICY indicates that the policy automates cross-account snapshot copies for
        # snapshots that are shared with your account.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # The activation state of the lifecycle policy.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @default_policy : Bool? = nil,
          @description : String? = nil,
          @policy_id : String? = nil,
          @policy_type : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The request failed because a limit was exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Value is the type of resource for which a limit was exceeded.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Information about the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # [Custom snapshot and AMI policies only] Specifies optional parameters for snapshot and AMI policies.
      # The set of valid parameters depends on the combination of policy type and target resource type. If
      # you choose to exclude boot volumes and you specify tags that consequently exclude all of the
      # additional data volumes attached to an instance, then Amazon Data Lifecycle Manager will not create
      # any snapshots for the affected instance, and it will emit a SnapshotsCreateFailed Amazon CloudWatch
      # metric. For more information, see Monitor your policies using Amazon CloudWatch .

      struct Parameters
        include JSON::Serializable

        # [Custom snapshot policies that target instances only] Indicates whether to exclude the root volume
        # from multi-volume snapshot sets. The default is false . If you specify true , then the root volumes
        # attached to targeted instances will be excluded from the multi-volume snapshot sets created by the
        # policy.

        @[JSON::Field(key: "ExcludeBootVolume")]
        getter exclude_boot_volume : Bool?

        # [Custom snapshot policies that target instances only] The tags used to identify data (non-root)
        # volumes to exclude from multi-volume snapshot sets. If you create a snapshot lifecycle policy that
        # targets instances and you specify tags for this parameter, then data volumes with the specified tags
        # that are attached to targeted instances will be excluded from the multi-volume snapshot sets created
        # by the policy.

        @[JSON::Field(key: "ExcludeDataVolumeTags")]
        getter exclude_data_volume_tags : Array(Types::Tag)?

        # [Custom AMI policies only] Indicates whether targeted instances are rebooted when the lifecycle
        # policy runs. true indicates that targeted instances are not rebooted when the policy runs. false
        # indicates that target instances are rebooted when the policy runs. The default is true (instances
        # are not rebooted).

        @[JSON::Field(key: "NoReboot")]
        getter no_reboot : Bool?

        def initialize(
          @exclude_boot_volume : Bool? = nil,
          @exclude_data_volume_tags : Array(Types::Tag)? = nil,
          @no_reboot : Bool? = nil
        )
        end
      end

      # Specifies the configuration of a lifecycle policy.

      struct PolicyDetails
        include JSON::Serializable

        # [Event-based policies only] The actions to be performed when the event-based policy is activated.
        # You can specify only one action per policy.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::Action)?

        # [Default policies only] Indicates whether the policy should copy tags from the source resource to
        # the snapshot or AMI. If you do not specify a value, the default is false . Default: false

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # [Default policies only] Specifies how often the policy should run and create snapshots or AMIs. The
        # creation frequency can range from 1 to 7 days. If you do not specify a value, the default is 1.
        # Default: 1

        @[JSON::Field(key: "CreateInterval")]
        getter create_interval : Int32?

        # [Default policies only] Specifies destination Regions for snapshot or AMI copies. You can specify up
        # to 3 destination Regions. If you do not want to create cross-Region copies, omit this parameter.

        @[JSON::Field(key: "CrossRegionCopyTargets")]
        getter cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)?

        # [Event-based policies only] The event that activates the event-based policy.

        @[JSON::Field(key: "EventSource")]
        getter event_source : Types::EventSource?

        # [Default policies only] Specifies exclusion parameters for volumes or instances for which you do not
        # want to create snapshots or AMIs. The policy will not create snapshots or AMIs for target resources
        # that match any of the specified exclusion parameters.

        @[JSON::Field(key: "Exclusions")]
        getter exclusions : Types::Exclusions?

        # [Default policies only] Defines the snapshot or AMI retention behavior for the policy if the source
        # volume or instance is deleted, or if the policy enters the error, disabled, or deleted state. By
        # default ( ExtendDeletion=false ): If a source resource is deleted, Amazon Data Lifecycle Manager
        # will continue to delete previously created snapshots or AMIs, up to but not including the last one,
        # based on the specified retention period. If you want Amazon Data Lifecycle Manager to delete all
        # snapshots or AMIs, including the last one, specify true . If a policy enters the error, disabled, or
        # deleted state, Amazon Data Lifecycle Manager stops deleting snapshots and AMIs. If you want Amazon
        # Data Lifecycle Manager to continue deleting snapshots or AMIs, including the last one, if the policy
        # enters one of these states, specify true . If you enable extended deletion ( ExtendDeletion=true ),
        # you override both default behaviors simultaneously. If you do not specify a value, the default is
        # false . Default: false

        @[JSON::Field(key: "ExtendDeletion")]
        getter extend_deletion : Bool?

        # [Custom snapshot and AMI policies only] A set of optional parameters for snapshot and AMI lifecycle
        # policies. If you are modifying a policy that was created or previously modified using the Amazon
        # Data Lifecycle Manager console, then you must include this parameter and specify either the default
        # values or the new values that you require. You can't omit this parameter or set its values to null.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Types::Parameters?

        # The type of policy to create. Specify one of the following: SIMPLIFIED To create a default policy.
        # STANDARD To create a custom policy.

        @[JSON::Field(key: "PolicyLanguage")]
        getter policy_language : String?

        # The type of policy. Specify EBS_SNAPSHOT_MANAGEMENT to create a lifecycle policy that manages the
        # lifecycle of Amazon EBS snapshots. Specify IMAGE_MANAGEMENT to create a lifecycle policy that
        # manages the lifecycle of EBS-backed AMIs. Specify EVENT_BASED_POLICY to create an event-based policy
        # that performs specific actions when a defined event occurs in your Amazon Web Services account. The
        # default is EBS_SNAPSHOT_MANAGEMENT .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        # [Custom snapshot and AMI policies only] The location of the resources to backup. If the source
        # resources are located in a Region, specify CLOUD . In this case, the policy targets all resources of
        # the specified type with matching target tags across all Availability Zones in the Region. [Custom
        # snapshot policies only] If the source resources are located in a Local Zone, specify LOCAL_ZONE . In
        # this case, the policy targets all resources of the specified type with matching target tags across
        # all Local Zones in the Region. If the source resources are located on an Outpost in your account,
        # specify OUTPOST . In this case, the policy targets all resources of the specified type with matching
        # target tags across all of the Outposts in your account.

        @[JSON::Field(key: "ResourceLocations")]
        getter resource_locations : Array(String)?

        # [Default policies only] Specify the type of default policy to create. To create a default policy for
        # EBS snapshots, that creates snapshots of all volumes in the Region that do not have recent backups,
        # specify VOLUME . To create a default policy for EBS-backed AMIs, that creates EBS-backed AMIs from
        # all instances in the Region that do not have recent backups, specify INSTANCE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # [Custom snapshot policies only] The target resource type for snapshot and AMI lifecycle policies.
        # Use VOLUME to create snapshots of individual volumes or use INSTANCE to create multi-volume
        # snapshots from the volumes for an instance.

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # [Default policies only] Specifies how long the policy should retain snapshots or AMIs before
        # deleting them. The retention period can range from 2 to 14 days, but it must be greater than the
        # creation frequency to ensure that the policy retains at least 1 snapshot or AMI at any given time.
        # If you do not specify a value, the default is 7. Default: 7

        @[JSON::Field(key: "RetainInterval")]
        getter retain_interval : Int32?

        # [Custom snapshot and AMI policies only] The schedules of policy-defined actions for snapshot and AMI
        # lifecycle policies. A policy can have up to four schedules—one mandatory schedule and up to three
        # optional schedules.

        @[JSON::Field(key: "Schedules")]
        getter schedules : Array(Types::Schedule)?

        # [Custom snapshot and AMI policies only] The single tag that identifies targeted resources for this
        # policy.

        @[JSON::Field(key: "TargetTags")]
        getter target_tags : Array(Types::Tag)?

        def initialize(
          @actions : Array(Types::Action)? = nil,
          @copy_tags : Bool? = nil,
          @create_interval : Int32? = nil,
          @cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)? = nil,
          @event_source : Types::EventSource? = nil,
          @exclusions : Types::Exclusions? = nil,
          @extend_deletion : Bool? = nil,
          @parameters : Types::Parameters? = nil,
          @policy_language : String? = nil,
          @policy_type : String? = nil,
          @resource_locations : Array(String)? = nil,
          @resource_type : String? = nil,
          @resource_types : Array(String)? = nil,
          @retain_interval : Int32? = nil,
          @schedules : Array(Types::Schedule)? = nil,
          @target_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A requested resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Value is a list of resource IDs that were not found.

        @[JSON::Field(key: "ResourceIds")]
        getter resource_ids : Array(String)?

        # Value is the type of resource that was not found.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @resource_ids : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # [Custom snapshot and AMI policies only] Specifies a retention rule for snapshots created by snapshot
      # policies, or for AMIs created by AMI policies. For snapshot policies that have an ArchiveRule , this
      # retention rule applies to standard tier retention. When the retention threshold is met, snapshots
      # are moved from the standard to the archive tier. For snapshot policies that do not have an
      # ArchiveRule , snapshots are permanently deleted when this retention threshold is met. You can retain
      # snapshots based on either a count or a time interval. Count-based retention You must specify Count .
      # If you specify an ArchiveRule for the schedule, then you can specify a retention count of 0 to
      # archive snapshots immediately after creation. If you specify a FastRestoreRule , ShareRule , or a
      # CrossRegionCopyRule , then you must specify a retention count of 1 or more. Age-based retention You
      # must specify Interval and IntervalUnit . If you specify an ArchiveRule for the schedule, then you
      # can specify a retention interval of 0 days to archive snapshots immediately after creation. If you
      # specify a FastRestoreRule , ShareRule , or a CrossRegionCopyRule , then you must specify a retention
      # interval of 1 day or more.

      struct RetainRule
        include JSON::Serializable

        # The number of snapshots to retain for each volume, up to a maximum of 1000. For example if you want
        # to retain a maximum of three snapshots, specify 3 . When the fourth snapshot is created, the oldest
        # retained snapshot is deleted, or it is moved to the archive tier if you have specified an
        # ArchiveRule .

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The amount of time to retain each snapshot. The maximum is 100 years. This is equivalent to 1200
        # months, 5200 weeks, or 36500 days.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time for time-based retention. For example, to retain snapshots for 3 months, specify
        # Interval=3 and IntervalUnit=MONTHS . Once the snapshot has been retained for 3 months, it is
        # deleted, or it is moved to the archive tier if you have specified an ArchiveRule .

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @count : Int32? = nil,
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end

      # [Custom snapshot policies only] Describes the retention rule for archived snapshots. Once the
      # archive retention threshold is met, the snapshots are permanently deleted from the archive tier. The
      # archive retention rule must retain snapshots in the archive tier for a minimum of 90 days. For
      # count-based schedules , you must specify Count . For age-based schedules , you must specify Interval
      # and IntervalUnit . For more information about using snapshot archiving, see Considerations for
      # snapshot lifecycle policies .

      struct RetentionArchiveTier
        include JSON::Serializable

        # The maximum number of snapshots to retain in the archive storage tier for each volume. The count
        # must ensure that each snapshot remains in the archive tier for at least 90 days. For example, if the
        # schedule creates snapshots every 30 days, you must specify a count of 3 or more to ensure that each
        # snapshot is archived for at least 90 days.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # Specifies the period of time to retain snapshots in the archive tier. After this period expires, the
        # snapshot is permanently deleted.

        @[JSON::Field(key: "Interval")]
        getter interval : Int32?

        # The unit of time in which to measure the Interval . For example, to retain a snapshots in the
        # archive tier for 6 months, specify Interval=6 and IntervalUnit=MONTHS .

        @[JSON::Field(key: "IntervalUnit")]
        getter interval_unit : String?

        def initialize(
          @count : Int32? = nil,
          @interval : Int32? = nil,
          @interval_unit : String? = nil
        )
        end
      end

      # [Custom snapshot and AMI policies only] Specifies a schedule for a snapshot or AMI lifecycle policy.

      struct Schedule
        include JSON::Serializable

        # [Custom snapshot policies that target volumes only] The snapshot archiving rule for the schedule.
        # When you specify an archiving rule, snapshots are automatically moved from the standard tier to the
        # archive tier once the schedule's retention threshold is met. Snapshots are then retained in the
        # archive tier for the archive retention period that you specify. For more information about using
        # snapshot archiving, see Considerations for snapshot lifecycle policies .

        @[JSON::Field(key: "ArchiveRule")]
        getter archive_rule : Types::ArchiveRule?

        # Copy all user-defined tags on a source volume to snapshots of the volume created by this policy.

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # The creation rule.

        @[JSON::Field(key: "CreateRule")]
        getter create_rule : Types::CreateRule?

        # Specifies a rule for copying snapshots or AMIs across Regions. You can't specify cross-Region copy
        # rules for policies that create snapshots on an Outpost or in a Local Zone. If the policy creates
        # snapshots in a Region, then snapshots can be copied to up to three Regions or Outposts.

        @[JSON::Field(key: "CrossRegionCopyRules")]
        getter cross_region_copy_rules : Array(Types::CrossRegionCopyRule)?

        # [Custom AMI policies only] The AMI deprecation rule for the schedule.

        @[JSON::Field(key: "DeprecateRule")]
        getter deprecate_rule : Types::DeprecateRule?

        # [Custom snapshot policies only] The rule for enabling fast snapshot restore.

        @[JSON::Field(key: "FastRestoreRule")]
        getter fast_restore_rule : Types::FastRestoreRule?

        # The name of the schedule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The retention rule for snapshots or AMIs created by the policy.

        @[JSON::Field(key: "RetainRule")]
        getter retain_rule : Types::RetainRule?

        # [Custom snapshot policies only] The rule for sharing snapshots with other Amazon Web Services
        # accounts.

        @[JSON::Field(key: "ShareRules")]
        getter share_rules : Array(Types::ShareRule)?

        # The tags to apply to policy-created resources. These user-defined tags are in addition to the Amazon
        # Web Services-added lifecycle tags.

        @[JSON::Field(key: "TagsToAdd")]
        getter tags_to_add : Array(Types::Tag)?

        # [AMI policies and snapshot policies that target instances only] A collection of key/value pairs with
        # values determined dynamically when the policy is executed. Keys may be any valid Amazon EC2 tag key.
        # Values must be in one of the two following formats: $(instance-id) or $(timestamp) . Variable tags
        # are only valid for EBS Snapshot Management – Instance policies.

        @[JSON::Field(key: "VariableTags")]
        getter variable_tags : Array(Types::Tag)?

        def initialize(
          @archive_rule : Types::ArchiveRule? = nil,
          @copy_tags : Bool? = nil,
          @create_rule : Types::CreateRule? = nil,
          @cross_region_copy_rules : Array(Types::CrossRegionCopyRule)? = nil,
          @deprecate_rule : Types::DeprecateRule? = nil,
          @fast_restore_rule : Types::FastRestoreRule? = nil,
          @name : String? = nil,
          @retain_rule : Types::RetainRule? = nil,
          @share_rules : Array(Types::ShareRule)? = nil,
          @tags_to_add : Array(Types::Tag)? = nil,
          @variable_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # [Custom snapshot policies that target instances only] Information about pre and/or post scripts for
      # a snapshot lifecycle policy that targets instances. For more information, see Automating
      # application-consistent snapshots with pre and post scripts .

      struct Script
        include JSON::Serializable

        # The SSM document that includes the pre and/or post scripts to run. If you are automating VSS
        # backups, specify AWS_VSS_BACKUP . In this case, Amazon Data Lifecycle Manager automatically uses the
        # AWSEC2-CreateVssSnapshot SSM document. If you are automating application-consistent snapshots for
        # SAP HANA workloads, specify AWSSystemsManagerSAP-CreateDLMSnapshotForSAPHANA . If you are using a
        # custom SSM document that you own, specify either the name or ARN of the SSM document. If you are
        # using a custom SSM document that is shared with you, specify the ARN of the SSM document.

        @[JSON::Field(key: "ExecutionHandler")]
        getter execution_handler : String

        # Indicates whether Amazon Data Lifecycle Manager should default to crash-consistent snapshots if the
        # pre script fails. To default to crash consistent snapshot if the pre script fails, specify true . To
        # skip the instance for snapshot creation if the pre script fails, specify false . This parameter is
        # supported only if you run a pre script. If you run a post script only, omit this parameter. Default:
        # true

        @[JSON::Field(key: "ExecuteOperationOnScriptFailure")]
        getter execute_operation_on_script_failure : Bool?

        # Indicates the service used to execute the pre and/or post scripts. If you are using custom SSM
        # documents or automating application-consistent snapshots of SAP HANA workloads, specify
        # AWS_SYSTEMS_MANAGER . If you are automating VSS Backups, omit this parameter. Default:
        # AWS_SYSTEMS_MANAGER

        @[JSON::Field(key: "ExecutionHandlerService")]
        getter execution_handler_service : String?

        # Specifies a timeout period, in seconds, after which Amazon Data Lifecycle Manager fails the script
        # run attempt if it has not completed. If a script does not complete within its timeout period, Amazon
        # Data Lifecycle Manager fails the attempt. The timeout period applies to the pre and post scripts
        # individually. If you are automating VSS Backups, omit this parameter. Default: 10

        @[JSON::Field(key: "ExecutionTimeout")]
        getter execution_timeout : Int32?

        # Specifies the number of times Amazon Data Lifecycle Manager should retry scripts that fail. If the
        # pre script fails, Amazon Data Lifecycle Manager retries the entire snapshot creation process,
        # including running the pre and post scripts. If the post script fails, Amazon Data Lifecycle Manager
        # retries the post script only; in this case, the pre script will have completed and the snapshot
        # might have been created. If you do not want Amazon Data Lifecycle Manager to retry failed scripts,
        # specify 0 . Default: 0

        @[JSON::Field(key: "MaximumRetryCount")]
        getter maximum_retry_count : Int32?

        # Indicate which scripts Amazon Data Lifecycle Manager should run on target instances. Pre scripts run
        # before Amazon Data Lifecycle Manager initiates snapshot creation. Post scripts run after Amazon Data
        # Lifecycle Manager initiates snapshot creation. To run a pre script only, specify PRE . In this case,
        # Amazon Data Lifecycle Manager calls the SSM document with the pre-script parameter before initiating
        # snapshot creation. To run a post script only, specify POST . In this case, Amazon Data Lifecycle
        # Manager calls the SSM document with the post-script parameter after initiating snapshot creation. To
        # run both pre and post scripts, specify both PRE and POST . In this case, Amazon Data Lifecycle
        # Manager calls the SSM document with the pre-script parameter before initiating snapshot creation,
        # and then it calls the SSM document again with the post-script parameter after initiating snapshot
        # creation. If you are automating VSS Backups, omit this parameter. Default: PRE and POST

        @[JSON::Field(key: "Stages")]
        getter stages : Array(String)?

        def initialize(
          @execution_handler : String,
          @execute_operation_on_script_failure : Bool? = nil,
          @execution_handler_service : String? = nil,
          @execution_timeout : Int32? = nil,
          @maximum_retry_count : Int32? = nil,
          @stages : Array(String)? = nil
        )
        end
      end

      # [Custom snapshot policies only] Specifies a rule for sharing snapshots across Amazon Web Services
      # accounts.

      struct ShareRule
        include JSON::Serializable

        # The IDs of the Amazon Web Services accounts with which to share the snapshots.

        @[JSON::Field(key: "TargetAccounts")]
        getter target_accounts : Array(String)

        # The period after which snapshots that are shared with other Amazon Web Services accounts are
        # automatically unshared.

        @[JSON::Field(key: "UnshareInterval")]
        getter unshare_interval : Int32?

        # The unit of time for the automatic unsharing interval.

        @[JSON::Field(key: "UnshareIntervalUnit")]
        getter unshare_interval_unit : String?

        def initialize(
          @target_accounts : Array(String),
          @unshare_interval : Int32? = nil,
          @unshare_interval_unit : String? = nil
        )
        end
      end

      # Specifies a tag for a resource.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLifecyclePolicyRequest
        include JSON::Serializable

        # The identifier of the lifecycle policy.

        @[JSON::Field(key: "policyId")]
        getter policy_id : String

        # [Default policies only] Indicates whether the policy should copy tags from the source resource to
        # the snapshot or AMI.

        @[JSON::Field(key: "CopyTags")]
        getter copy_tags : Bool?

        # [Default policies only] Specifies how often the policy should run and create snapshots or AMIs. The
        # creation frequency can range from 1 to 7 days.

        @[JSON::Field(key: "CreateInterval")]
        getter create_interval : Int32?

        # [Default policies only] Specifies destination Regions for snapshot or AMI copies. You can specify up
        # to 3 destination Regions. If you do not want to create cross-Region copies, omit this parameter.

        @[JSON::Field(key: "CrossRegionCopyTargets")]
        getter cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)?

        # A description of the lifecycle policy.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Default policies only] Specifies exclusion parameters for volumes or instances for which you do not
        # want to create snapshots or AMIs. The policy will not create snapshots or AMIs for target resources
        # that match any of the specified exclusion parameters.

        @[JSON::Field(key: "Exclusions")]
        getter exclusions : Types::Exclusions?

        # The Amazon Resource Name (ARN) of the IAM role used to run the operations specified by the lifecycle
        # policy.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # [Default policies only] Defines the snapshot or AMI retention behavior for the policy if the source
        # volume or instance is deleted, or if the policy enters the error, disabled, or deleted state. By
        # default ( ExtendDeletion=false ): If a source resource is deleted, Amazon Data Lifecycle Manager
        # will continue to delete previously created snapshots or AMIs, up to but not including the last one,
        # based on the specified retention period. If you want Amazon Data Lifecycle Manager to delete all
        # snapshots or AMIs, including the last one, specify true . If a policy enters the error, disabled, or
        # deleted state, Amazon Data Lifecycle Manager stops deleting snapshots and AMIs. If you want Amazon
        # Data Lifecycle Manager to continue deleting snapshots or AMIs, including the last one, if the policy
        # enters one of these states, specify true . If you enable extended deletion ( ExtendDeletion=true ),
        # you override both default behaviors simultaneously. Default: false

        @[JSON::Field(key: "ExtendDeletion")]
        getter extend_deletion : Bool?

        # The configuration of the lifecycle policy. You cannot update the policy type or the resource type.

        @[JSON::Field(key: "PolicyDetails")]
        getter policy_details : Types::PolicyDetails?

        # [Default policies only] Specifies how long the policy should retain snapshots or AMIs before
        # deleting them. The retention period can range from 2 to 14 days, but it must be greater than the
        # creation frequency to ensure that the policy retains at least 1 snapshot or AMI at any given time.

        @[JSON::Field(key: "RetainInterval")]
        getter retain_interval : Int32?

        # The desired activation state of the lifecycle policy after creation.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @policy_id : String,
          @copy_tags : Bool? = nil,
          @create_interval : Int32? = nil,
          @cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)? = nil,
          @description : String? = nil,
          @exclusions : Types::Exclusions? = nil,
          @execution_role_arn : String? = nil,
          @extend_deletion : Bool? = nil,
          @policy_details : Types::PolicyDetails? = nil,
          @retain_interval : Int32? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateLifecyclePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
