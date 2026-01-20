require "json"
require "time"

module AwsSdk
  module Rbin
    module Types

      # The specified retention rule lock request can't be completed.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct CreateRuleRequest
        include JSON::Serializable

        # The resource type to be retained by the retention rule. Currently, only EBS volumes, EBS snapshots,
        # and EBS-backed AMIs are supported. To retain EBS volumes, specify EBS_VOLUME . To retain EBS
        # snapshots, specify EBS_SNAPSHOT To retain EBS-backed AMIs, specify EC2_IMAGE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Information about the retention period for which the retention rule is to retain resources.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Specifies the exclusion tags to use to identify resources that
        # are to be excluded, or ignored, by a Region-level retention rule. Resources that have any of these
        # tags are not retained by the retention rule upon deletion. You can't specify exclusion tags for
        # tag-level retention rules.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration?

        # [Tag-level retention rules only] Specifies the resource tags to use to identify resources that are
        # to be retained by a tag-level retention rule. For tag-level retention rules, only deleted resources,
        # of the specified resource type, that have one or more of the specified tag key and value pairs are
        # retained. If a resource is deleted, but it does not have any of the specified tag key and value
        # pairs, it is immediately deleted without being retained by the retention rule. You can add the same
        # tag key and value pair to a maximum or five retention rules. To create a Region-level retention
        # rule, omit this parameter. A Region-level retention rule does not have any resource tags specified.
        # It retains all deleted resources of the specified resource type in the Region in which the rule is
        # created, even if the resources are not tagged.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # Information about the tags to assign to the retention rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_type : String,
          @retention_period : Types::RetentionPeriod,
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @lock_configuration : Types::LockConfiguration? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleResponse
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The resource type retained by the retention rule.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The state of the retention rule. Only retention rules that are in the available state retain
        # resources.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Information about the tags assigned to the retention rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @identifier : String? = nil,
          @lock_configuration : Types::LockConfiguration? = nil,
          @lock_state : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct DeleteRuleRequest
        include JSON::Serializable

        # The unique ID of the retention rule.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteRuleResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetRuleRequest
        include JSON::Serializable

        # The unique ID of the retention rule.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetRuleResponse
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration?

        # The date and time at which the unlock delay is set to expire. Only returned for retention rules that
        # have been unlocked and that are still within the unlock delay period.

        @[JSON::Field(key: "LockEndTime")]
        getter lock_end_time : Time?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The resource type retained by the retention rule.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Information about the retention period for which the retention rule is to retain resources.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The state of the retention rule. Only retention rules that are in the available state retain
        # resources.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @identifier : String? = nil,
          @lock_configuration : Types::LockConfiguration? = nil,
          @lock_end_time : Time? = nil,
          @lock_state : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The service could not respond to the request due to an internal problem.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListRulesRequest
        include JSON::Serializable

        # The resource type retained by the retention rule. Only retention rules that retain the specified
        # resource type are listed. Currently, only EBS volumes, EBS snapshots, and EBS-backed AMIs are
        # supported. To list retention rules that retain EBS volumes, specify EBS_VOLUME . To list retention
        # rules that retain EBS snapshots, specify EBS_SNAPSHOT . To list retention rules that retain
        # EBS-backed AMIs, specify EC2_IMAGE .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The lock state of the retention rules to list. Only retention rules with the specified lock state
        # are returned.

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned NextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @resource_type : String,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @lock_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct ListRulesResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the retention rules.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::RuleSummary)?

        def initialize(
          @next_token : String? = nil,
          @rules : Array(Types::RuleSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Information about the tags assigned to the retention rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about a retention rule lock configuration.

      struct LockConfiguration
        include JSON::Serializable

        # Information about the retention rule unlock delay.

        @[JSON::Field(key: "UnlockDelay")]
        getter unlock_delay : Types::UnlockDelay

        def initialize(
          @unlock_delay : Types::UnlockDelay
        )
        end
      end


      struct LockRuleRequest
        include JSON::Serializable

        # The unique ID of the retention rule.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration

        def initialize(
          @identifier : String,
          @lock_configuration : Types::LockConfiguration
        )
        end
      end


      struct LockRuleResponse
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The resource type retained by the retention rule.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The state of the retention rule. Only retention rules that are in the available state retain
        # resources.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @identifier : String? = nil,
          @lock_configuration : Types::LockConfiguration? = nil,
          @lock_state : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # [Tag-level retention rules only] Information about the resource tags used to identify resources that
      # are retained by the retention rule.

      struct ResourceTag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "ResourceTagKey")]
        getter resource_tag_key : String

        # The tag value.

        @[JSON::Field(key: "ResourceTagValue")]
        getter resource_tag_value : String?

        def initialize(
          @resource_tag_key : String,
          @resource_tag_value : String? = nil
        )
        end
      end

      # Information about the retention period for which the retention rule is to retain resources.

      struct RetentionPeriod
        include JSON::Serializable

        # The unit of time in which the retention period is measured. Currently, only DAYS is supported.

        @[JSON::Field(key: "RetentionPeriodUnit")]
        getter retention_period_unit : String

        # The period value for which the retention rule is to retain resources, measured in days. The
        # supported retention periods are: EBS volumes: 1 - 7 days EBS snapshots and EBS-backed AMIs: 1 - 365
        # days

        @[JSON::Field(key: "RetentionPeriodValue")]
        getter retention_period_value : Int32

        def initialize(
          @retention_period_unit : String,
          @retention_period_value : Int32
        )
        end
      end

      # Information about a Recycle Bin retention rule.

      struct RuleSummary
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # Information about the retention period for which the retention rule is to retain resources.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @description : String? = nil,
          @identifier : String? = nil,
          @lock_state : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil
        )
        end
      end

      # The request would cause a service quota for the number of tags per resource to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Information about the tags to assign to the retention rule.

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

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Information about the tags to assign to the retention rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the retention rule unlock delay. The unlock delay is the period after which a
      # retention rule can be modified or edited after it has been unlocked by a user with the required
      # permissions. The retention rule can't be modified or deleted during the unlock delay.

      struct UnlockDelay
        include JSON::Serializable

        # The unit of time in which to measure the unlock delay. Currently, the unlock delay can be measured
        # only in days.

        @[JSON::Field(key: "UnlockDelayUnit")]
        getter unlock_delay_unit : String

        # The unlock delay period, measured in the unit specified for UnlockDelayUnit .

        @[JSON::Field(key: "UnlockDelayValue")]
        getter unlock_delay_value : Int32

        def initialize(
          @unlock_delay_unit : String,
          @unlock_delay_value : Int32
        )
        end
      end


      struct UnlockRuleRequest
        include JSON::Serializable

        # The unique ID of the retention rule.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct UnlockRuleResponse
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # Information about the retention rule lock configuration.

        @[JSON::Field(key: "LockConfiguration")]
        getter lock_configuration : Types::LockConfiguration?

        # The date and time at which the unlock delay is set to expire. Only returned for retention rules that
        # have been unlocked and that are still within the unlock delay period.

        @[JSON::Field(key: "LockEndTime")]
        getter lock_end_time : Time?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The resource type retained by the retention rule.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The state of the retention rule. Only retention rules that are in the available state retain
        # resources.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @identifier : String? = nil,
          @lock_configuration : Types::LockConfiguration? = nil,
          @lock_end_time : Time? = nil,
          @lock_state : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys of the tags to unassign. All tags that have the specified tag key are unassigned.

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


      struct UpdateRuleRequest
        include JSON::Serializable

        # The unique ID of the retention rule.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Specifies the exclusion tags to use to identify resources that
        # are to be excluded, or ignored, by a Region-level retention rule. Resources that have any of these
        # tags are not retained by the retention rule upon deletion. You can't specify exclusion tags for
        # tag-level retention rules.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # [Tag-level retention rules only] Specifies the resource tags to use to identify resources that are
        # to be retained by a tag-level retention rule. For tag-level retention rules, only deleted resources,
        # of the specified resource type, that have one or more of the specified tag key and value pairs are
        # retained. If a resource is deleted, but it does not have any of the specified tag key and value
        # pairs, it is immediately deleted without being retained by the retention rule. You can add the same
        # tag key and value pair to a maximum or five retention rules. To create a Region-level retention
        # rule, omit this parameter. A Region-level retention rule does not have any resource tags specified.
        # It retains all deleted resources of the specified resource type in the Region in which the rule is
        # created, even if the resources are not tagged.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # This parameter is currently not supported. You can't update a retention rule's resource type after
        # creation.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Information about the retention period for which the retention rule is to retain resources.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        def initialize(
          @identifier : String,
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil
        )
        end
      end


      struct UpdateRuleResponse
        include JSON::Serializable

        # The retention rule description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # [Region-level retention rules only] Information about the exclusion tags used to identify resources
        # that are to be excluded, or ignored, by the retention rule.

        @[JSON::Field(key: "ExcludeResourceTags")]
        getter exclude_resource_tags : Array(Types::ResourceTag)?

        # The unique ID of the retention rule.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        # The date and time at which the unlock delay is set to expire. Only returned for retention rules that
        # have been unlocked and that are still within the unlock delay period.

        @[JSON::Field(key: "LockEndTime")]
        getter lock_end_time : Time?

        # [Region-level retention rules only] The lock state for the retention rule. locked - The retention
        # rule is locked and can't be modified or deleted. pending_unlock - The retention rule has been
        # unlocked but it is still within the unlock delay period. The retention rule can be modified or
        # deleted only after the unlock delay period has expired. unlocked - The retention rule is unlocked
        # and it can be modified or deleted by any user with the required permissions. null - The retention
        # rule has never been locked. Once a retention rule has been locked, it can transition between the
        # locked and unlocked states only; it can never transition back to null .

        @[JSON::Field(key: "LockState")]
        getter lock_state : String?

        # [Tag-level retention rules only] Information about the resource tags used to identify resources that
        # are retained by the retention rule.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The resource type retained by the retention rule.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?


        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : Types::RetentionPeriod?

        # The Amazon Resource Name (ARN) of the retention rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        # The state of the retention rule. Only retention rules that are in the available state retain
        # resources.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @description : String? = nil,
          @exclude_resource_tags : Array(Types::ResourceTag)? = nil,
          @identifier : String? = nil,
          @lock_end_time : Time? = nil,
          @lock_state : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @resource_type : String? = nil,
          @retention_period : Types::RetentionPeriod? = nil,
          @rule_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # One or more of the parameters in the request is not valid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The reason for the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
