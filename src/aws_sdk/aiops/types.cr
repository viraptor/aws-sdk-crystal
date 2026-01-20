require "json"

module AwsSdk
  module AIOps
    module Types

      # You don't have sufficient permissions to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation couldn't be completed because of a conflict in resource states.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateInvestigationGroupInput
        include JSON::Serializable

        # Provides a name for the investigation group.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify the ARN of the IAM role that CloudWatch investigations will use when it gathers
        # investigation data. The permissions in this role determine which of your resources that CloudWatch
        # investigations will have access to during investigations. For more information, see How to control
        # what data CloudWatch investigations has access to during investigations .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Use this structure to integrate CloudWatch investigations with chat applications. This structure is
        # a string array. For the first string, specify the ARN of an Amazon SNS topic. For the array of
        # strings, specify the ARNs of one or more chat applications configurations that you want to associate
        # with that topic. For more information about these configuration ARNs, see Getting started with
        # Amazon Q in chat applications and Resource type defined by Amazon Web Services Chatbot .

        @[JSON::Field(key: "chatbotNotificationChannel")]
        getter chatbot_notification_channel : Hash(String, Array(String))?

        # List of sourceRoleArn values that have been configured for cross-account access.

        @[JSON::Field(key: "crossAccountConfigurations")]
        getter cross_account_configurations : Array(Types::CrossAccountConfiguration)?

        # Use this structure if you want to use a customer managed KMS key to encrypt your investigation data.
        # If you omit this parameter, CloudWatch investigations will use an Amazon Web Services key to encrypt
        # the data. For more information, see Encryption of investigation data .

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Specify true to enable CloudWatch investigations to have access to change events that are recorded
        # by CloudTrail. The default is true .

        @[JSON::Field(key: "isCloudTrailEventHistoryEnabled")]
        getter is_cloud_trail_event_history_enabled : Bool?

        # Specify how long that investigation data is kept. For more information, see Operational
        # investigation data retention . If you omit this parameter, the default of 90 days is used.

        @[JSON::Field(key: "retentionInDays")]
        getter retention_in_days : Int64?

        # Enter the existing custom tag keys for custom applications in your system. Resource tags help
        # CloudWatch investigations narrow the search space when it is unable to discover definite
        # relationships between resources. For example, to discover that an Amazon ECS service depends on an
        # Amazon RDS database, CloudWatch investigations can discover this relationship using data sources
        # such as X-Ray and CloudWatch Application Signals. However, if you haven't deployed these features,
        # CloudWatch investigations will attempt to identify possible relationships. Tag boundaries can be
        # used to narrow the resources that will be discovered by CloudWatch investigations in these cases.
        # You don't need to enter tags created by myApplications or CloudFormation, because CloudWatch
        # investigations can automatically detect those tags.

        @[JSON::Field(key: "tagKeyBoundaries")]
        getter tag_key_boundaries : Array(String)?

        # A list of key-value pairs to associate with the investigation group. You can associate as many as 50
        # tags with an investigation group. To be able to associate tags when you create the investigation
        # group, you must have the cloudwatch:TagResource permission. Tags can help you organize and
        # categorize your resources. You can also use them to scope user permissions by granting a user
        # permission to access or change only resources with certain tag values.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @role_arn : String,
          @chatbot_notification_channel : Hash(String, Array(String))? = nil,
          @cross_account_configurations : Array(Types::CrossAccountConfiguration)? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @is_cloud_trail_event_history_enabled : Bool? = nil,
          @retention_in_days : Int64? = nil,
          @tag_key_boundaries : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateInvestigationGroupOutput
        include JSON::Serializable

        # The ARN of the investigation group that you just created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # This structure contains information about the cross-account configuration in the account.

      struct CrossAccountConfiguration
        include JSON::Serializable

        # The ARN of an existing role which will be used to do investigations on your behalf.

        @[JSON::Field(key: "sourceRoleArn")]
        getter source_role_arn : String?

        def initialize(
          @source_role_arn : String? = nil
        )
        end
      end


      struct DeleteInvestigationGroupPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteInvestigationGroupPolicyRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to remove the policy
        # from.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteInvestigationGroupRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to delete.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # Use this structure to specify a customer managed KMS key to use to encrypt investigation data.

      struct EncryptionConfiguration
        include JSON::Serializable

        # If the investigation group uses a customer managed key for encryption, this field displays the ID of
        # that key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # Displays whether investigation data is encrypted by a customer managed key or an Amazon Web Services
        # owned key.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @kms_key_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Access id denied for this operation, or this operation is not valid for the specified resource.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetInvestigationGroupPolicyRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to view the policy of.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetInvestigationGroupPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the investigation group that you want to view the policy of.

        @[JSON::Field(key: "investigationGroupArn")]
        getter investigation_group_arn : String?

        # The policy, in JSON format.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @investigation_group_arn : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct GetInvestigationGroupRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to view. This is used to
        # set the name of the investigation group.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetInvestigationGroupResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the investigation group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # This structure is a string array. The first string is the ARN of a Amazon SNS topic. The array of
        # strings display the ARNs of chat applications configurations that are associated with that topic.
        # For more information about these configuration ARNs, see Getting started with Amazon Q in chat
        # applications and Resource type defined by Amazon Web Services Chatbot .

        @[JSON::Field(key: "chatbotNotificationChannel")]
        getter chatbot_notification_channel : Hash(String, Array(String))?

        # The date and time that the investigation group was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # The name of the user who created the investigation group.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # Lists the AWSAccountId of the accounts configured for cross-account access and the results of the
        # last scan performed on each account.

        @[JSON::Field(key: "crossAccountConfigurations")]
        getter cross_account_configurations : Array(Types::CrossAccountConfiguration)?

        # Specifies the customer managed KMS key that the investigation group uses to encrypt data, if there
        # is one. If not, the investigation group uses an Amazon Web Services key to encrypt the data.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Specifies whether CloudWatch investigationshas access to change events that are recorded by
        # CloudTrail.

        @[JSON::Field(key: "isCloudTrailEventHistoryEnabled")]
        getter is_cloud_trail_event_history_enabled : Bool?

        # The date and time that the investigation group was most recently modified.

        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Int64?

        # The name of the user who created the investigation group.

        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The name of the investigation group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies how long that investigation data is kept.

        @[JSON::Field(key: "retentionInDays")]
        getter retention_in_days : Int64?

        # The ARN of the IAM role that the investigation group uses for permissions to gather data.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Displays the custom tag keys for custom applications in your system that you have specified in the
        # investigation group. Resource tags help CloudWatch investigations narrow the search space when it is
        # unable to discover definite relationships between resources.

        @[JSON::Field(key: "tagKeyBoundaries")]
        getter tag_key_boundaries : Array(String)?

        def initialize(
          @arn : String? = nil,
          @chatbot_notification_channel : Hash(String, Array(String))? = nil,
          @created_at : Int64? = nil,
          @created_by : String? = nil,
          @cross_account_configurations : Array(Types::CrossAccountConfiguration)? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @is_cloud_trail_event_history_enabled : Bool? = nil,
          @last_modified_at : Int64? = nil,
          @last_modified_by : String? = nil,
          @name : String? = nil,
          @retention_in_days : Int64? = nil,
          @role_arn : String? = nil,
          @tag_key_boundaries : Array(String)? = nil
        )
        end
      end

      # An internal server error occurred. You can try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListInvestigationGroupsInput
        include JSON::Serializable

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # operations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # This structure contains information about one investigation group in the account.

      struct ListInvestigationGroupsModel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the investigation group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the investigation group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct ListInvestigationGroupsOutput
        include JSON::Serializable

        # An array of structures, where each structure contains the information about one investigation group
        # in the account.

        @[JSON::Field(key: "investigationGroups")]
        getter investigation_groups : Array(Types::ListInvestigationGroupsModel)?

        # Include this value in your next use of this operation to get the next set of service operations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @investigation_groups : Array(Types::ListInvestigationGroupsModel)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tag keys and values associated with the resource you specified.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch investigations resource that you want to view tags for. You can use the
        # ListInvestigationGroups operation to find the ARNs of investigation groups. The ARN format for an
        # investigation group is arn:aws:aiops: Region : account-id :investigation-group:
        # investigation-group-id .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct PutInvestigationGroupPolicyRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to assign the policy to.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The policy, in JSON format.

        @[JSON::Field(key: "policy")]
        getter policy : String

        def initialize(
          @identifier : String,
          @policy : String
        )
        end
      end


      struct PutInvestigationGroupPolicyResponse
        include JSON::Serializable

        # The ARN of the investigation group that will use this policy.

        @[JSON::Field(key: "investigationGroupArn")]
        getter investigation_group_arn : String?

        def initialize(
          @investigation_group_arn : String? = nil
        )
        end
      end

      # The specified resource doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This request exceeds a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # This quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The resource that caused the quota exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource that caused the quota exception.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # This name of the service associated with the error.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to apply the tags to. You can use the
        # ListInvestigationGroups operation to find the ARNs of investigation groups.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.

        @[JSON::Field(key: "tags")]
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

      # The request was throttled because of quota limits. You can try again later.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove the tags from. You can use
        # the ListInvestigationGroups operation to find the ARNs of investigation groups.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.

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


      struct UpdateInvestigationGroupOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateInvestigationGroupRequest
        include JSON::Serializable

        # Specify either the name or the ARN of the investigation group that you want to modify.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Use this structure to integrate CloudWatch investigations with chat applications. This structure is
        # a string array. For the first string, specify the ARN of an Amazon SNS topic. For the array of
        # strings, specify the ARNs of one or more chat applications configurations that you want to associate
        # with that topic. For more information about these configuration ARNs, see Getting started with
        # Amazon Q in chat applications and Resource type defined by Amazon Web Services Chatbot .

        @[JSON::Field(key: "chatbotNotificationChannel")]
        getter chatbot_notification_channel : Hash(String, Array(String))?

        # Used to configure cross-account access for an investigation group. It allows the investigation group
        # to access resources in other accounts.

        @[JSON::Field(key: "crossAccountConfigurations")]
        getter cross_account_configurations : Array(Types::CrossAccountConfiguration)?

        # Use this structure if you want to use a customer managed KMS key to encrypt your investigation data.
        # If you omit this parameter, CloudWatch investigations will use an Amazon Web Services key to encrypt
        # the data. For more information, see Encryption of investigation data .

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Specify true to enable CloudWatch investigations to have access to change events that are recorded
        # by CloudTrail. The default is true .

        @[JSON::Field(key: "isCloudTrailEventHistoryEnabled")]
        getter is_cloud_trail_event_history_enabled : Bool?

        # Specify this field if you want to change the IAM role that CloudWatch investigations will use when
        # it gathers investigation data. To do so, specify the ARN of the new role. The permissions in this
        # role determine which of your resources that CloudWatch investigations will have access to during
        # investigations. For more information, see How to control what data CloudWatch investigations has
        # access to during investigations .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Enter the existing custom tag keys for custom applications in your system. Resource tags help
        # CloudWatch investigations narrow the search space when it is unable to discover definite
        # relationships between resources. For example, to discover that an Amazon ECS service depends on an
        # Amazon RDS database, CloudWatch investigations can discover this relationship using data sources
        # such as X-Ray and CloudWatch Application Signals. However, if you haven't deployed these features,
        # CloudWatch investigations will attempt to identify possible relationships. Tag boundaries can be
        # used to narrow the resources that will be discovered by CloudWatch investigations in these cases.
        # You don't need to enter tags created by myApplications or CloudFormation, because CloudWatch
        # investigations can automatically detect those tags.

        @[JSON::Field(key: "tagKeyBoundaries")]
        getter tag_key_boundaries : Array(String)?

        def initialize(
          @identifier : String,
          @chatbot_notification_channel : Hash(String, Array(String))? = nil,
          @cross_account_configurations : Array(Types::CrossAccountConfiguration)? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @is_cloud_trail_event_history_enabled : Bool? = nil,
          @role_arn : String? = nil,
          @tag_key_boundaries : Array(String)? = nil
        )
        end
      end

      # This operation or its parameters aren't formatted correctly.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
