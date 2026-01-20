require "json"
require "time"

module Aws
  module MailManager
    module Types

      # Occurs when a user is denied access to a specific resource or action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action to add a header to a message. When executed, this action will add the given header to the
      # message.

      struct AddHeaderAction
        include JSON::Serializable

        # The name of the header to add to an email. The header must be prefixed with "X-". Headers are added
        # regardless of whether the header name pre-existed in the email.

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String

        # The value of the header to add to the email.

        @[JSON::Field(key: "HeaderValue")]
        getter header_value : String

        def initialize(
          @header_name : String,
          @header_value : String
        )
        end
      end

      # An Add On instance represents a specific configuration of an Add On.

      struct AddonInstance
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Add On instance.

        @[JSON::Field(key: "AddonInstanceArn")]
        getter addon_instance_arn : String?

        # The unique ID of the Add On instance.

        @[JSON::Field(key: "AddonInstanceId")]
        getter addon_instance_id : String?

        # The name of the Add On for the instance.

        @[JSON::Field(key: "AddonName")]
        getter addon_name : String?

        # The subscription ID for the instance.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String?

        # The timestamp of when the Add On instance was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        def initialize(
          @addon_instance_arn : String? = nil,
          @addon_instance_id : String? = nil,
          @addon_name : String? = nil,
          @addon_subscription_id : String? = nil,
          @created_timestamp : Time? = nil
        )
        end
      end

      # A subscription for an Add On representing the acceptance of its terms of use and additional pricing.

      struct AddonSubscription
        include JSON::Serializable

        # The name of the Add On.

        @[JSON::Field(key: "AddonName")]
        getter addon_name : String?

        # The Amazon Resource Name (ARN) of the Add On subscription.

        @[JSON::Field(key: "AddonSubscriptionArn")]
        getter addon_subscription_arn : String?

        # The unique ID of the Add On subscription.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String?

        # The timestamp of when the Add On subscription was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        def initialize(
          @addon_name : String? = nil,
          @addon_subscription_arn : String? = nil,
          @addon_subscription_id : String? = nil,
          @created_timestamp : Time? = nil
        )
        end
      end

      # Filtering options for ListMembersOfAddressList operation.

      struct AddressFilter
        include JSON::Serializable

        # Filter to limit the results to addresses having the provided prefix.

        @[JSON::Field(key: "AddressPrefix")]
        getter address_prefix : String?

        def initialize(
          @address_prefix : String? = nil
        )
        end
      end

      # An address list contains a list of emails and domains that are used in MailManager Ingress endpoints
      # and Rules for email management.

      struct AddressList
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the address list.

        @[JSON::Field(key: "AddressListArn")]
        getter address_list_arn : String

        # The identifier of the address list.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # The user-friendly name of the address list.

        @[JSON::Field(key: "AddressListName")]
        getter address_list_name : String

        # The timestamp of when the address list was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The timestamp of when the address list was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time

        def initialize(
          @address_list_arn : String,
          @address_list_id : String,
          @address_list_name : String,
          @created_timestamp : Time,
          @last_updated_timestamp : Time
        )
        end
      end

      # The result of an analysis can be used in conditions to trigger actions. Analyses can inspect the
      # email content and report a certain aspect of the email.

      struct Analysis
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Add On.

        @[JSON::Field(key: "Analyzer")]
        getter analyzer : String

        # The returned value from an Add On.

        @[JSON::Field(key: "ResultField")]
        getter result_field : String

        def initialize(
          @analyzer : String,
          @result_field : String
        )
        end
      end

      # An archive resource for storing and retaining emails.

      struct Archive
        include JSON::Serializable

        # The unique identifier of the archive.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # The unique name assigned to the archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String?

        # The current state of the archive: ACTIVE – The archive is ready and available for use.
        # PENDING_DELETION – The archive has been marked for deletion and will be permanently deleted in 30
        # days. No further modifications can be made in this state.

        @[JSON::Field(key: "ArchiveState")]
        getter archive_state : String?

        # The timestamp of when the archive was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        def initialize(
          @archive_id : String,
          @archive_name : String? = nil,
          @archive_state : String? = nil,
          @last_updated_timestamp : Time? = nil
        )
        end
      end

      # The action to archive the email by delivering the email to an Amazon SES archive.

      struct ArchiveAction
        include JSON::Serializable

        # The identifier of the archive to send the email to.

        @[JSON::Field(key: "TargetArchive")]
        getter target_archive : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the specified archive has been deleted.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        def initialize(
          @target_archive : String,
          @action_failure_policy : String? = nil
        )
        end
      end

      # A boolean expression to evaluate email attribute values.

      struct ArchiveBooleanExpression
        include JSON::Serializable

        # The email attribute value to evaluate.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::ArchiveBooleanToEvaluate

        # The boolean operator to use for evaluation.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        def initialize(
          @evaluate : Types::ArchiveBooleanToEvaluate,
          @operator : String
        )
        end
      end

      # The attribute to evaluate in a boolean expression.

      struct ArchiveBooleanToEvaluate
        include JSON::Serializable

        # The name of the email attribute to evaluate.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # A filter condition used to include or exclude emails when exporting from or searching an archive.

      struct ArchiveFilterCondition
        include JSON::Serializable

        # A boolean expression to evaluate against email attributes.

        @[JSON::Field(key: "BooleanExpression")]
        getter boolean_expression : Types::ArchiveBooleanExpression?

        # A string expression to evaluate against email attributes.

        @[JSON::Field(key: "StringExpression")]
        getter string_expression : Types::ArchiveStringExpression?

        def initialize(
          @boolean_expression : Types::ArchiveBooleanExpression? = nil,
          @string_expression : Types::ArchiveStringExpression? = nil
        )
        end
      end

      # A set of filter conditions to include and/or exclude emails.

      struct ArchiveFilters
        include JSON::Serializable

        # The filter conditions for emails to include.

        @[JSON::Field(key: "Include")]
        getter include : Array(Types::ArchiveFilterCondition)?

        # The filter conditions for emails to exclude.

        @[JSON::Field(key: "Unless")]
        getter unless : Array(Types::ArchiveFilterCondition)?

        def initialize(
          @include : Array(Types::ArchiveFilterCondition)? = nil,
          @unless : Array(Types::ArchiveFilterCondition)? = nil
        )
        end
      end

      # The retention policy for an email archive that specifies how long emails are kept before being
      # automatically deleted.

      struct ArchiveRetention
        include JSON::Serializable

        # The enum value sets the period for retaining emails in an archive.

        @[JSON::Field(key: "RetentionPeriod")]
        getter retention_period : String?

        def initialize(
          @retention_period : String? = nil
        )
        end
      end

      # A string expression to evaluate an email attribute value against one or more string values.

      struct ArchiveStringExpression
        include JSON::Serializable

        # The attribute of the email to evaluate.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::ArchiveStringToEvaluate

        # The operator to use when evaluating the string values.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The list of string values to evaluate the email attribute against.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::ArchiveStringToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # Specifies the email attribute to evaluate in a string expression.

      struct ArchiveStringToEvaluate
        include JSON::Serializable

        # The name of the email attribute to evaluate.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # The request configuration has conflicts. For details, see the accompanying error message.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateAddonInstanceRequest
        include JSON::Serializable

        # The unique ID of a previously created subscription that an Add On instance is created for. You can
        # only have one instance per subscription.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @addon_subscription_id : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAddonInstanceResponse
        include JSON::Serializable

        # The unique ID of the Add On instance created by this API.

        @[JSON::Field(key: "AddonInstanceId")]
        getter addon_instance_id : String

        def initialize(
          @addon_instance_id : String
        )
        end
      end


      struct CreateAddonSubscriptionRequest
        include JSON::Serializable

        # The name of the Add On to subscribe to. You can only have one subscription for each Add On name.

        @[JSON::Field(key: "AddonName")]
        getter addon_name : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @addon_name : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAddonSubscriptionResponse
        include JSON::Serializable

        # The unique ID of the Add On subscription created by this API.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String

        def initialize(
          @addon_subscription_id : String
        )
        end
      end


      struct CreateAddressListImportJobRequest
        include JSON::Serializable

        # The unique identifier of the address list for importing addresses to.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # The format of the input for an import job.

        @[JSON::Field(key: "ImportDataFormat")]
        getter import_data_format : Types::ImportDataFormat

        # A user-friendly name for the import job.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @address_list_id : String,
          @import_data_format : Types::ImportDataFormat,
          @name : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateAddressListImportJobResponse
        include JSON::Serializable

        # The identifier of the created import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The pre-signed URL target for uploading the input file.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String

        def initialize(
          @job_id : String,
          @pre_signed_url : String
        )
        end
      end


      struct CreateAddressListRequest
        include JSON::Serializable

        # A user-friendly name for the address list.

        @[JSON::Field(key: "AddressListName")]
        getter address_list_name : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @address_list_name : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAddressListResponse
        include JSON::Serializable

        # The identifier of the created address list.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address_list_id : String
        )
        end
      end

      # The request to create a new email archive.

      struct CreateArchiveRequest
        include JSON::Serializable

        # A unique name for the new archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        # A unique token Amazon SES uses to recognize retries of this request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the KMS key for encrypting emails in the archive.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The period for retaining emails in the archive before automatic deletion.

        @[JSON::Field(key: "Retention")]
        getter retention : Types::ArchiveRetention?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @archive_name : String,
          @client_token : String? = nil,
          @kms_key_arn : String? = nil,
          @retention : Types::ArchiveRetention? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The response from creating a new email archive.

      struct CreateArchiveResponse
        include JSON::Serializable

        # The unique identifier for the newly created archive.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        def initialize(
          @archive_id : String
        )
        end
      end


      struct CreateIngressPointRequest
        include JSON::Serializable

        # A user friendly name for an ingress endpoint resource.

        @[JSON::Field(key: "IngressPointName")]
        getter ingress_point_name : String

        # The identifier of an existing rule set that you attach to an ingress endpoint resource.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        # The identifier of an existing traffic policy that you attach to an ingress endpoint resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # The type of the ingress endpoint to create.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # If you choose an Authenticated ingress endpoint, you must configure either an SMTP password or a
        # secret ARN.

        @[JSON::Field(key: "IngressPointConfiguration")]
        getter ingress_point_configuration : Types::IngressPointConfiguration?

        # Specifies the network configuration for the ingress point. This allows you to create an IPv4-only,
        # Dual-Stack, or PrivateLink type of ingress point. If not specified, the default network type is
        # IPv4-only.

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @ingress_point_name : String,
          @rule_set_id : String,
          @traffic_policy_id : String,
          @type : String,
          @client_token : String? = nil,
          @ingress_point_configuration : Types::IngressPointConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateIngressPointResponse
        include JSON::Serializable

        # The unique identifier for a previously created ingress endpoint.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        def initialize(
          @ingress_point_id : String
        )
        end
      end


      struct CreateRelayRequest
        include JSON::Serializable

        # Authentication for the relay destination server—specify the secretARN where the SMTP credentials are
        # stored.

        @[JSON::Field(key: "Authentication")]
        getter authentication : Types::RelayAuthentication

        # The unique name of the relay resource.

        @[JSON::Field(key: "RelayName")]
        getter relay_name : String

        # The destination relay server address.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String

        # The destination relay server port.

        @[JSON::Field(key: "ServerPort")]
        getter server_port : Int32

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @authentication : Types::RelayAuthentication,
          @relay_name : String,
          @server_name : String,
          @server_port : Int32,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRelayResponse
        include JSON::Serializable

        # A unique identifier of the created relay resource.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String

        def initialize(
          @relay_id : String
        )
        end
      end


      struct CreateRuleSetRequest
        include JSON::Serializable

        # A user-friendly name for the rule set.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        # Conditional rules that are evaluated for determining actions on email.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @rule_set_name : String,
          @rules : Array(Types::Rule),
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleSetResponse
        include JSON::Serializable

        # The identifier of the created rule set.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        def initialize(
          @rule_set_id : String
        )
        end
      end


      struct CreateTrafficPolicyRequest
        include JSON::Serializable

        # Default action instructs the traﬃc policy to either Allow or Deny (block) messages that fall outside
        # of (or not addressed by) the conditions of your policy statements

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : String

        # Conditional statements for filtering email traffic.

        @[JSON::Field(key: "PolicyStatements")]
        getter policy_statements : Array(Types::PolicyStatement)

        # A user-friendly name for the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyName")]
        getter traffic_policy_name : String

        # A unique token that Amazon SES uses to recognize subsequent retries of the same request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The maximum message size in bytes of email which is allowed in by this traffic policy—anything
        # larger will be blocked.

        @[JSON::Field(key: "MaxMessageSizeBytes")]
        getter max_message_size_bytes : Int32?

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @default_action : String,
          @policy_statements : Array(Types::PolicyStatement),
          @traffic_policy_name : String,
          @client_token : String? = nil,
          @max_message_size_bytes : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateTrafficPolicyResponse
        include JSON::Serializable

        # The identifier of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        def initialize(
          @traffic_policy_id : String
        )
        end
      end


      struct DeleteAddonInstanceRequest
        include JSON::Serializable

        # The Add On instance ID to delete.

        @[JSON::Field(key: "AddonInstanceId")]
        getter addon_instance_id : String

        def initialize(
          @addon_instance_id : String
        )
        end
      end


      struct DeleteAddonInstanceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAddonSubscriptionRequest
        include JSON::Serializable

        # The Add On subscription ID to delete.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String

        def initialize(
          @addon_subscription_id : String
        )
        end
      end


      struct DeleteAddonSubscriptionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAddressListRequest
        include JSON::Serializable

        # The identifier of an existing address list resource to delete.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address_list_id : String
        )
        end
      end


      struct DeleteAddressListResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to initiate deletion of an email archive.

      struct DeleteArchiveRequest
        include JSON::Serializable

        # The identifier of the archive to delete.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        def initialize(
          @archive_id : String
        )
        end
      end

      # The response indicating if the archive deletion was successfully initiated. On success, returns an
      # HTTP 200 status code. On failure, returns an error message.

      struct DeleteArchiveResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIngressPointRequest
        include JSON::Serializable

        # The identifier of the ingress endpoint resource that you want to delete.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        def initialize(
          @ingress_point_id : String
        )
        end
      end


      struct DeleteIngressPointResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRelayRequest
        include JSON::Serializable

        # The unique relay identifier.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String

        def initialize(
          @relay_id : String
        )
        end
      end


      struct DeleteRelayResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRuleSetRequest
        include JSON::Serializable

        # The identifier of an existing rule set resource to delete.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        def initialize(
          @rule_set_id : String
        )
        end
      end


      struct DeleteRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteTrafficPolicyRequest
        include JSON::Serializable

        # The identifier of the traffic policy that you want to delete.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        def initialize(
          @traffic_policy_id : String
        )
        end
      end


      struct DeleteTrafficPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This action to delivers an email to a mailbox.

      struct DeliverToMailboxAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a WorkMail organization to deliver the email to.

        @[JSON::Field(key: "MailboxArn")]
        getter mailbox_arn : String

        # The Amazon Resource Name (ARN) of an IAM role to use to execute this action. The role must have
        # access to the workmail:DeliverToMailbox API.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the mailbox ARN is no longer valid.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        def initialize(
          @mailbox_arn : String,
          @role_arn : String,
          @action_failure_policy : String? = nil
        )
        end
      end

      # The action to deliver incoming emails to an Amazon Q Business application for indexing.

      struct DeliverToQBusinessAction
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application instance where the email content will be
        # delivered.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String

        # The identifier of the knowledge base index within the Amazon Q Business application where the email
        # content will be stored and indexed.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The Amazon Resource Name (ARN) of the IAM Role to use while delivering to Amazon Q Business. This
        # role must have access to the qbusiness:BatchPutDocument API for the given application and index.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the specified application has been deleted or the role lacks
        # necessary permissions to call the qbusiness:BatchPutDocument API.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        def initialize(
          @application_id : String,
          @index_id : String,
          @role_arn : String,
          @action_failure_policy : String? = nil
        )
        end
      end


      struct DeregisterMemberFromAddressListRequest
        include JSON::Serializable

        # The address to be removed from the address list.

        @[JSON::Field(key: "Address")]
        getter address : String

        # The unique identifier of the address list to remove the address from.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address : String,
          @address_list_id : String
        )
        end
      end


      struct DeregisterMemberFromAddressListResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This action causes processing to stop and the email to be dropped. If the action applies only to
      # certain recipients, only those recipients are dropped, and processing continues for other
      # recipients.

      struct DropAction
        include JSON::Serializable

        def initialize
        end
      end

      # The SMTP envelope information of the email.

      struct Envelope
        include JSON::Serializable

        # The RCPT FROM given by the host from which the email was received.

        @[JSON::Field(key: "From")]
        getter from : String?

        # The HELO used by the host from which the email was received.

        @[JSON::Field(key: "Helo")]
        getter helo : String?

        # All SMTP TO entries given by the host from which the email was received.

        @[JSON::Field(key: "To")]
        getter to : Array(String)?

        def initialize(
          @from : String? = nil,
          @helo : String? = nil,
          @to : Array(String)? = nil
        )
        end
      end

      # The destination configuration for delivering exported email data.

      struct ExportDestinationConfiguration
        include JSON::Serializable

        # Configuration for delivering to an Amazon S3 bucket.

        @[JSON::Field(key: "S3")]
        getter s3 : Types::S3ExportDestinationConfiguration?

        def initialize(
          @s3 : Types::S3ExportDestinationConfiguration? = nil
        )
        end
      end

      # The current status of an archive export job.

      struct ExportStatus
        include JSON::Serializable

        # The timestamp of when the export job completed (if finished).

        @[JSON::Field(key: "CompletionTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completion_timestamp : Time?

        # An error message if the export job failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The current state of the export job.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The timestamp of when the export job was submitted.

        @[JSON::Field(key: "SubmissionTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submission_timestamp : Time?

        def initialize(
          @completion_timestamp : Time? = nil,
          @error_message : String? = nil,
          @state : String? = nil,
          @submission_timestamp : Time? = nil
        )
        end
      end

      # Summary statuses of an archive export job.

      struct ExportSummary
        include JSON::Serializable

        # The unique identifier of the export job.

        @[JSON::Field(key: "ExportId")]
        getter export_id : String?

        # The current status of the export job.

        @[JSON::Field(key: "Status")]
        getter status : Types::ExportStatus?

        def initialize(
          @export_id : String? = nil,
          @status : Types::ExportStatus? = nil
        )
        end
      end


      struct GetAddonInstanceRequest
        include JSON::Serializable

        # The Add On instance ID to retrieve information for.

        @[JSON::Field(key: "AddonInstanceId")]
        getter addon_instance_id : String

        def initialize(
          @addon_instance_id : String
        )
        end
      end


      struct GetAddonInstanceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Add On instance.

        @[JSON::Field(key: "AddonInstanceArn")]
        getter addon_instance_arn : String?

        # The name of the Add On provider associated to the subscription of the instance.

        @[JSON::Field(key: "AddonName")]
        getter addon_name : String?

        # The subscription ID associated to the instance.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String?

        # The timestamp of when the Add On instance was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        def initialize(
          @addon_instance_arn : String? = nil,
          @addon_name : String? = nil,
          @addon_subscription_id : String? = nil,
          @created_timestamp : Time? = nil
        )
        end
      end


      struct GetAddonSubscriptionRequest
        include JSON::Serializable

        # The Add On subscription ID to retrieve information for.

        @[JSON::Field(key: "AddonSubscriptionId")]
        getter addon_subscription_id : String

        def initialize(
          @addon_subscription_id : String
        )
        end
      end


      struct GetAddonSubscriptionResponse
        include JSON::Serializable

        # The name of the Add On for the subscription.

        @[JSON::Field(key: "AddonName")]
        getter addon_name : String?

        # Amazon Resource Name (ARN) for the subscription.

        @[JSON::Field(key: "AddonSubscriptionArn")]
        getter addon_subscription_arn : String?

        # The timestamp of when the Add On subscription was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        def initialize(
          @addon_name : String? = nil,
          @addon_subscription_arn : String? = nil,
          @created_timestamp : Time? = nil
        )
        end
      end


      struct GetAddressListImportJobRequest
        include JSON::Serializable

        # The identifier of the import job that needs to be retrieved.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct GetAddressListImportJobResponse
        include JSON::Serializable

        # The unique identifier of the address list the import job was created for.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # The timestamp of when the import job was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The format of the input for an import job.

        @[JSON::Field(key: "ImportDataFormat")]
        getter import_data_format : Types::ImportDataFormat

        # The identifier of the import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # A user-friendly name for the import job.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The pre-signed URL target for uploading the input file.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String

        # The status of the import job.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp of when the import job was completed.

        @[JSON::Field(key: "CompletedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?

        # The reason for failure of an import job.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The number of input addresses that failed to be imported into the address list.

        @[JSON::Field(key: "FailedItemsCount")]
        getter failed_items_count : Int32?

        # The number of input addresses successfully imported into the address list.

        @[JSON::Field(key: "ImportedItemsCount")]
        getter imported_items_count : Int32?

        # The timestamp of when the import job was started.

        @[JSON::Field(key: "StartTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time?

        def initialize(
          @address_list_id : String,
          @created_timestamp : Time,
          @import_data_format : Types::ImportDataFormat,
          @job_id : String,
          @name : String,
          @pre_signed_url : String,
          @status : String,
          @completed_timestamp : Time? = nil,
          @error : String? = nil,
          @failed_items_count : Int32? = nil,
          @imported_items_count : Int32? = nil,
          @start_timestamp : Time? = nil
        )
        end
      end


      struct GetAddressListRequest
        include JSON::Serializable

        # The identifier of an existing address list resource to be retrieved.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address_list_id : String
        )
        end
      end


      struct GetAddressListResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the address list resource.

        @[JSON::Field(key: "AddressListArn")]
        getter address_list_arn : String

        # The identifier of the address list resource.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # A user-friendly name for the address list resource.

        @[JSON::Field(key: "AddressListName")]
        getter address_list_name : String

        # The date of when then address list was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The date of when the address list was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time

        def initialize(
          @address_list_arn : String,
          @address_list_id : String,
          @address_list_name : String,
          @created_timestamp : Time,
          @last_updated_timestamp : Time
        )
        end
      end

      # The request to retrieve details of a specific archive export job.

      struct GetArchiveExportRequest
        include JSON::Serializable

        # The identifier of the export job to get details for.

        @[JSON::Field(key: "ExportId")]
        getter export_id : String

        def initialize(
          @export_id : String
        )
        end
      end

      # The response containing details of the specified archive export job.

      struct GetArchiveExportResponse
        include JSON::Serializable

        # The identifier of the archive the email export was performed from.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String?

        # Where the exported emails are being delivered.

        @[JSON::Field(key: "ExportDestinationConfiguration")]
        getter export_destination_configuration : Types::ExportDestinationConfiguration?

        # The criteria used to filter emails included in the export.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ArchiveFilters?

        # The start of the timestamp range the exported emails cover.

        @[JSON::Field(key: "FromTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from_timestamp : Time?

        # The maximum number of email items included in the export.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The current status of the export job.

        @[JSON::Field(key: "Status")]
        getter status : Types::ExportStatus?

        # The end of the date range the exported emails cover.

        @[JSON::Field(key: "ToTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter to_timestamp : Time?

        def initialize(
          @archive_id : String? = nil,
          @export_destination_configuration : Types::ExportDestinationConfiguration? = nil,
          @filters : Types::ArchiveFilters? = nil,
          @from_timestamp : Time? = nil,
          @max_results : Int32? = nil,
          @status : Types::ExportStatus? = nil,
          @to_timestamp : Time? = nil
        )
        end
      end

      # The request to get the textual content of a specific email message stored in an archive.

      struct GetArchiveMessageContentRequest
        include JSON::Serializable

        # The unique identifier of the archived email message.

        @[JSON::Field(key: "ArchivedMessageId")]
        getter archived_message_id : String

        def initialize(
          @archived_message_id : String
        )
        end
      end

      # The response containing the textual content of the requested archived email message.

      struct GetArchiveMessageContentResponse
        include JSON::Serializable

        # The textual body content of the email message.

        @[JSON::Field(key: "Body")]
        getter body : Types::MessageBody?

        def initialize(
          @body : Types::MessageBody? = nil
        )
        end
      end

      # The request to get details of a specific email message stored in an archive.

      struct GetArchiveMessageRequest
        include JSON::Serializable

        # The unique identifier of the archived email message.

        @[JSON::Field(key: "ArchivedMessageId")]
        getter archived_message_id : String

        def initialize(
          @archived_message_id : String
        )
        end
      end

      # The response containing details about the requested archived email message.

      struct GetArchiveMessageResponse
        include JSON::Serializable

        # The SMTP envelope information of the email.

        @[JSON::Field(key: "Envelope")]
        getter envelope : Types::Envelope?

        # A pre-signed URL to temporarily download the full message content.

        @[JSON::Field(key: "MessageDownloadLink")]
        getter message_download_link : String?

        # The metadata about the email.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::Metadata?

        def initialize(
          @envelope : Types::Envelope? = nil,
          @message_download_link : String? = nil,
          @metadata : Types::Metadata? = nil
        )
        end
      end

      # The request to retrieve details of an email archive.

      struct GetArchiveRequest
        include JSON::Serializable

        # The identifier of the archive to retrieve.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        def initialize(
          @archive_id : String
        )
        end
      end

      # The response containing details of the requested archive.

      struct GetArchiveResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the archive.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String

        # The unique identifier of the archive.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # The unique name assigned to the archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        # The current state of the archive: ACTIVE – The archive is ready and available for use.
        # PENDING_DELETION – The archive has been marked for deletion and will be permanently deleted in 30
        # days. No further modifications can be made in this state.

        @[JSON::Field(key: "ArchiveState")]
        getter archive_state : String

        # The retention period for emails in this archive.

        @[JSON::Field(key: "Retention")]
        getter retention : Types::ArchiveRetention

        # The timestamp of when the archive was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The Amazon Resource Name (ARN) of the KMS key used to encrypt the archive.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The timestamp of when the archive was modified.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        def initialize(
          @archive_arn : String,
          @archive_id : String,
          @archive_name : String,
          @archive_state : String,
          @retention : Types::ArchiveRetention,
          @created_timestamp : Time? = nil,
          @kms_key_arn : String? = nil,
          @last_updated_timestamp : Time? = nil
        )
        end
      end

      # The request to retrieve details of a specific archive search job.

      struct GetArchiveSearchRequest
        include JSON::Serializable

        # The identifier of the search job to get details for.

        @[JSON::Field(key: "SearchId")]
        getter search_id : String

        def initialize(
          @search_id : String
        )
        end
      end

      # The response containing details of the specified archive search job.

      struct GetArchiveSearchResponse
        include JSON::Serializable

        # The identifier of the archive the email search was performed in.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String?

        # The criteria used to filter emails included in the search.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ArchiveFilters?

        # The start timestamp of the range the searched emails cover.

        @[JSON::Field(key: "FromTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from_timestamp : Time?

        # The maximum number of search results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The current status of the search job.

        @[JSON::Field(key: "Status")]
        getter status : Types::SearchStatus?

        # The end timestamp of the range the searched emails cover.

        @[JSON::Field(key: "ToTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter to_timestamp : Time?

        def initialize(
          @archive_id : String? = nil,
          @filters : Types::ArchiveFilters? = nil,
          @from_timestamp : Time? = nil,
          @max_results : Int32? = nil,
          @status : Types::SearchStatus? = nil,
          @to_timestamp : Time? = nil
        )
        end
      end

      # The request to retrieve results from a completed archive search job.

      struct GetArchiveSearchResultsRequest
        include JSON::Serializable

        # The identifier of the completed search job.

        @[JSON::Field(key: "SearchId")]
        getter search_id : String

        def initialize(
          @search_id : String
        )
        end
      end

      # The response containing search results from a completed archive search.

      struct GetArchiveSearchResultsResponse
        include JSON::Serializable

        # The list of email result objects matching the search criteria.

        @[JSON::Field(key: "Rows")]
        getter rows : Array(Types::Row)?

        def initialize(
          @rows : Array(Types::Row)? = nil
        )
        end
      end


      struct GetIngressPointRequest
        include JSON::Serializable

        # The identifier of an ingress endpoint.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        def initialize(
          @ingress_point_id : String
        )
        end
      end


      struct GetIngressPointResponse
        include JSON::Serializable

        # The identifier of an ingress endpoint resource.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        # A user friendly name for the ingress endpoint.

        @[JSON::Field(key: "IngressPointName")]
        getter ingress_point_name : String

        # The DNS A Record that identifies your ingress endpoint. Configure your DNS Mail Exchange (MX) record
        # with this value to route emails to Mail Manager.

        @[JSON::Field(key: "ARecord")]
        getter a_record : String?

        # The timestamp of when the ingress endpoint was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The Amazon Resource Name (ARN) of the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointArn")]
        getter ingress_point_arn : String?

        # The authentication configuration of the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointAuthConfiguration")]
        getter ingress_point_auth_configuration : Types::IngressPointAuthConfiguration?

        # The timestamp of when the ingress endpoint was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The network configuration for the ingress point.

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The identifier of a rule set resource associated with the ingress endpoint.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String?

        # The status of the ingress endpoint resource.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The identifier of the traffic policy resource associated with the ingress endpoint.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String?

        # The type of ingress endpoint.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @ingress_point_id : String,
          @ingress_point_name : String,
          @a_record : String? = nil,
          @created_timestamp : Time? = nil,
          @ingress_point_arn : String? = nil,
          @ingress_point_auth_configuration : Types::IngressPointAuthConfiguration? = nil,
          @last_updated_timestamp : Time? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @rule_set_id : String? = nil,
          @status : String? = nil,
          @traffic_policy_id : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetMemberOfAddressListRequest
        include JSON::Serializable

        # The address to be retrieved from the address list.

        @[JSON::Field(key: "Address")]
        getter address : String

        # The unique identifier of the address list to retrieve the address from.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address : String,
          @address_list_id : String
        )
        end
      end


      struct GetMemberOfAddressListResponse
        include JSON::Serializable

        # The address retrieved from the address list.

        @[JSON::Field(key: "Address")]
        getter address : String

        # The timestamp of when the address was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        def initialize(
          @address : String,
          @created_timestamp : Time
        )
        end
      end


      struct GetRelayRequest
        include JSON::Serializable

        # A unique relay identifier.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String

        def initialize(
          @relay_id : String
        )
        end
      end


      struct GetRelayResponse
        include JSON::Serializable

        # The unique relay identifier.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String

        # The authentication attribute—contains the secret ARN where the customer relay server credentials are
        # stored.

        @[JSON::Field(key: "Authentication")]
        getter authentication : Types::RelayAuthentication?

        # The timestamp of when the relay was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The timestamp of when relay was last updated.

        @[JSON::Field(key: "LastModifiedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_timestamp : Time?

        # The Amazon Resource Name (ARN) of the relay.

        @[JSON::Field(key: "RelayArn")]
        getter relay_arn : String?

        # The unique name of the relay.

        @[JSON::Field(key: "RelayName")]
        getter relay_name : String?

        # The destination relay server address.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The destination relay server port.

        @[JSON::Field(key: "ServerPort")]
        getter server_port : Int32?

        def initialize(
          @relay_id : String,
          @authentication : Types::RelayAuthentication? = nil,
          @created_timestamp : Time? = nil,
          @last_modified_timestamp : Time? = nil,
          @relay_arn : String? = nil,
          @relay_name : String? = nil,
          @server_name : String? = nil,
          @server_port : Int32? = nil
        )
        end
      end


      struct GetRuleSetRequest
        include JSON::Serializable

        # The identifier of an existing rule set to be retrieved.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        def initialize(
          @rule_set_id : String
        )
        end
      end


      struct GetRuleSetResponse
        include JSON::Serializable

        # The date of when then rule set was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time

        # The date of when the rule set was last modified.

        @[JSON::Field(key: "LastModificationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modification_date : Time

        # The Amazon Resource Name (ARN) of the rule set resource.

        @[JSON::Field(key: "RuleSetArn")]
        getter rule_set_arn : String

        # The identifier of the rule set resource.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        # A user-friendly name for the rule set resource.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String

        # The rules contained in the rule set.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        def initialize(
          @created_date : Time,
          @last_modification_date : Time,
          @rule_set_arn : String,
          @rule_set_id : String,
          @rule_set_name : String,
          @rules : Array(Types::Rule)
        )
        end
      end


      struct GetTrafficPolicyRequest
        include JSON::Serializable

        # The identifier of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        def initialize(
          @traffic_policy_id : String
        )
        end
      end


      struct GetTrafficPolicyResponse
        include JSON::Serializable

        # The identifier of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # A user-friendly name for the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyName")]
        getter traffic_policy_name : String

        # The timestamp of when the traffic policy was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time?

        # The default action of the traffic policy.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : String?

        # The timestamp of when the traffic policy was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The maximum message size in bytes of email which is allowed in by this traffic policy—anything
        # larger will be blocked.

        @[JSON::Field(key: "MaxMessageSizeBytes")]
        getter max_message_size_bytes : Int32?

        # The list of conditions which are in the traffic policy resource.

        @[JSON::Field(key: "PolicyStatements")]
        getter policy_statements : Array(Types::PolicyStatement)?

        # The Amazon Resource Name (ARN) of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyArn")]
        getter traffic_policy_arn : String?

        def initialize(
          @traffic_policy_id : String,
          @traffic_policy_name : String,
          @created_timestamp : Time? = nil,
          @default_action : String? = nil,
          @last_updated_timestamp : Time? = nil,
          @max_message_size_bytes : Int32? = nil,
          @policy_statements : Array(Types::PolicyStatement)? = nil,
          @traffic_policy_arn : String? = nil
        )
        end
      end

      # The import data format contains the specifications of the input file that would be passed to the
      # address list import job.

      struct ImportDataFormat
        include JSON::Serializable

        # The type of file that would be passed as an input for the address list import job.

        @[JSON::Field(key: "ImportDataType")]
        getter import_data_type : String

        def initialize(
          @import_data_type : String
        )
        end
      end

      # Details about an import job.

      struct ImportJob
        include JSON::Serializable

        # The unique identifier of the address list the import job was created for.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # The timestamp of when the import job was created.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        # The format of the input for the import job.

        @[JSON::Field(key: "ImportDataFormat")]
        getter import_data_format : Types::ImportDataFormat

        # The identifier of the import job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # A user-friendly name for the import job.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The pre-signed URL target for uploading the input file.

        @[JSON::Field(key: "PreSignedUrl")]
        getter pre_signed_url : String

        # The status of the import job.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp of when the import job was completed.

        @[JSON::Field(key: "CompletedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completed_timestamp : Time?

        # The reason for failure of an import job.

        @[JSON::Field(key: "Error")]
        getter error : String?

        # The number of addresses in the input that failed to get imported into address list.

        @[JSON::Field(key: "FailedItemsCount")]
        getter failed_items_count : Int32?

        # The number of addresses in the input that were successfully imported into the address list.

        @[JSON::Field(key: "ImportedItemsCount")]
        getter imported_items_count : Int32?

        # The timestamp of when the import job was started.

        @[JSON::Field(key: "StartTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time?

        def initialize(
          @address_list_id : String,
          @created_timestamp : Time,
          @import_data_format : Types::ImportDataFormat,
          @job_id : String,
          @name : String,
          @pre_signed_url : String,
          @status : String,
          @completed_timestamp : Time? = nil,
          @error : String? = nil,
          @failed_items_count : Int32? = nil,
          @imported_items_count : Int32? = nil,
          @start_timestamp : Time? = nil
        )
        end
      end

      # The Add On ARN and its returned value that is evaluated in a policy statement's conditional
      # expression to either deny or block the incoming email.

      struct IngressAnalysis
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Add On.

        @[JSON::Field(key: "Analyzer")]
        getter analyzer : String

        # The returned value from an Add On.

        @[JSON::Field(key: "ResultField")]
        getter result_field : String

        def initialize(
          @analyzer : String,
          @result_field : String
        )
        end
      end

      # The structure for a boolean condition matching on the incoming mail.

      struct IngressBooleanExpression
        include JSON::Serializable

        # The operand on which to perform a boolean condition operation.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::IngressBooleanToEvaluate

        # The matching operator for a boolean condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        def initialize(
          @evaluate : Types::IngressBooleanToEvaluate,
          @operator : String
        )
        end
      end

      # The union type representing the allowed types of operands for a boolean condition.

      struct IngressBooleanToEvaluate
        include JSON::Serializable

        # The structure type for a boolean condition stating the Add On ARN and its returned value.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Types::IngressAnalysis?

        # The structure type for a boolean condition that provides the address lists to evaluate incoming
        # traffic on.

        @[JSON::Field(key: "IsInAddressList")]
        getter is_in_address_list : Types::IngressIsInAddressList?

        def initialize(
          @analysis : Types::IngressAnalysis? = nil,
          @is_in_address_list : Types::IngressIsInAddressList? = nil
        )
        end
      end

      # The structure for an IP based condition matching on the incoming mail.

      struct IngressIpToEvaluate
        include JSON::Serializable

        # An enum type representing the allowed attribute types for an IP condition.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # The union type representing the allowed types for the left hand side of an IP condition.

      struct IngressIpv4Expression
        include JSON::Serializable

        # The left hand side argument of an IP condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::IngressIpToEvaluate

        # The matching operator for an IP condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The right hand side argument of an IP condition expression.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::IngressIpToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The union type representing the allowed types for the left hand side of an IPv6 condition.

      struct IngressIpv6Expression
        include JSON::Serializable

        # The left hand side argument of an IPv6 condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::IngressIpv6ToEvaluate

        # The matching operator for an IPv6 condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The right hand side argument of an IPv6 condition expression.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::IngressIpv6ToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The structure for an IPv6 based condition matching on the incoming mail.

      struct IngressIpv6ToEvaluate
        include JSON::Serializable

        # An enum type representing the allowed attribute types for an IPv6 condition.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # The address lists and the address list attribute value that is evaluated in a policy statement's
      # conditional expression to either deny or block the incoming email.

      struct IngressIsInAddressList
        include JSON::Serializable

        # The address lists that will be used for evaluation.

        @[JSON::Field(key: "AddressLists")]
        getter address_lists : Array(String)

        # The email attribute that needs to be evaluated against the address list.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String

        def initialize(
          @address_lists : Array(String),
          @attribute : String
        )
        end
      end

      # The structure of an ingress endpoint resource.

      struct IngressPoint
        include JSON::Serializable

        # The identifier of the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        # A user friendly name for the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointName")]
        getter ingress_point_name : String

        # The status of the ingress endpoint resource.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The type of ingress endpoint resource.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The DNS A Record that identifies your ingress endpoint. Configure your DNS Mail Exchange (MX) record
        # with this value to route emails to Mail Manager.

        @[JSON::Field(key: "ARecord")]
        getter a_record : String?

        def initialize(
          @ingress_point_id : String,
          @ingress_point_name : String,
          @status : String,
          @type : String,
          @a_record : String? = nil
        )
        end
      end

      # The authentication configuration for the ingress endpoint resource.

      struct IngressPointAuthConfiguration
        include JSON::Serializable

        # The ingress endpoint password configuration for the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointPasswordConfiguration")]
        getter ingress_point_password_configuration : Types::IngressPointPasswordConfiguration?

        # The ingress endpoint SecretsManager::Secret ARN configuration for the ingress endpoint resource.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        def initialize(
          @ingress_point_password_configuration : Types::IngressPointPasswordConfiguration? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # The configuration of the ingress endpoint resource.

      struct IngressPointConfiguration
        include JSON::Serializable

        # The SecretsManager::Secret ARN of the ingress endpoint resource.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The password of the ingress endpoint resource.

        @[JSON::Field(key: "SmtpPassword")]
        getter smtp_password : String?

        def initialize(
          @secret_arn : String? = nil,
          @smtp_password : String? = nil
        )
        end
      end

      # The password configuration of the ingress endpoint resource.

      struct IngressPointPasswordConfiguration
        include JSON::Serializable

        # The previous password expiry timestamp of the ingress endpoint resource.

        @[JSON::Field(key: "PreviousSmtpPasswordExpiryTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter previous_smtp_password_expiry_timestamp : Time?

        # The previous password version of the ingress endpoint resource.

        @[JSON::Field(key: "PreviousSmtpPasswordVersion")]
        getter previous_smtp_password_version : String?

        # The current password expiry timestamp of the ingress endpoint resource.

        @[JSON::Field(key: "SmtpPasswordVersion")]
        getter smtp_password_version : String?

        def initialize(
          @previous_smtp_password_expiry_timestamp : Time? = nil,
          @previous_smtp_password_version : String? = nil,
          @smtp_password_version : String? = nil
        )
        end
      end

      # The structure for a string based condition matching on the incoming mail.

      struct IngressStringExpression
        include JSON::Serializable

        # The left hand side argument of a string condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::IngressStringToEvaluate

        # The matching operator for a string condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The right hand side argument of a string condition expression.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::IngressStringToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The union type representing the allowed types for the left hand side of a string condition.

      struct IngressStringToEvaluate
        include JSON::Serializable

        # The structure type for a string condition stating the Add On ARN and its returned value.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Types::IngressAnalysis?

        # The enum type representing the allowed attribute types for a string condition.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @analysis : Types::IngressAnalysis? = nil,
          @attribute : String? = nil
        )
        end
      end

      # The structure for a TLS related condition matching on the incoming mail.

      struct IngressTlsProtocolExpression
        include JSON::Serializable

        # The left hand side argument of a TLS condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::IngressTlsProtocolToEvaluate

        # The matching operator for a TLS condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The right hand side argument of a TLS condition expression.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @evaluate : Types::IngressTlsProtocolToEvaluate,
          @operator : String,
          @value : String
        )
        end
      end

      # The union type representing the allowed types for the left hand side of a TLS condition.

      struct IngressTlsProtocolToEvaluate
        include JSON::Serializable

        # The enum type representing the allowed attribute types for the TLS condition.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end


      struct ListAddonInstancesRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of ingress endpoint resources that are returned per call. You can use NextToken
        # to obtain further ingress endpoints.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListAddonInstancesResponse
        include JSON::Serializable

        # The list of ingress endpoints.

        @[JSON::Field(key: "AddonInstances")]
        getter addon_instances : Array(Types::AddonInstance)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @addon_instances : Array(Types::AddonInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAddonSubscriptionsRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of ingress endpoint resources that are returned per call. You can use NextToken
        # to obtain further ingress endpoints.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListAddonSubscriptionsResponse
        include JSON::Serializable

        # The list of ingress endpoints.

        @[JSON::Field(key: "AddonSubscriptions")]
        getter addon_subscriptions : Array(Types::AddonSubscription)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @addon_subscriptions : Array(Types::AddonSubscription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAddressListImportJobsRequest
        include JSON::Serializable

        # The unique identifier of the address list for listing import jobs.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of import jobs that are returned per call. You can use NextToken to retrieve the
        # next page of jobs.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @address_list_id : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListAddressListImportJobsResponse
        include JSON::Serializable

        # The list of import jobs.

        @[JSON::Field(key: "ImportJobs")]
        getter import_jobs : Array(Types::ImportJob)

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @import_jobs : Array(Types::ImportJob),
          @next_token : String? = nil
        )
        end
      end


      struct ListAddressListsRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of address list resources that are returned per call. You can use NextToken to
        # retrieve the next page of address lists.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListAddressListsResponse
        include JSON::Serializable

        # The list of address lists.

        @[JSON::Field(key: "AddressLists")]
        getter address_lists : Array(Types::AddressList)

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @address_lists : Array(Types::AddressList),
          @next_token : String? = nil
        )
        end
      end

      # The request to list archive export jobs in your account.

      struct ListArchiveExportsRequest
        include JSON::Serializable

        # The identifier of the archive.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of archive export jobs that are returned per call. You can use NextToken to
        # obtain further pages of archives.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @archive_id : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The response containing a list of archive export jobs and their statuses.

      struct ListArchiveExportsResponse
        include JSON::Serializable

        # The list of export job identifiers and statuses.

        @[JSON::Field(key: "Exports")]
        getter exports : Array(Types::ExportSummary)?

        # If present, use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @exports : Array(Types::ExportSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request to list archive search jobs in your account.

      struct ListArchiveSearchesRequest
        include JSON::Serializable

        # The identifier of the archive.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of archive search jobs that are returned per call. You can use NextToken to
        # obtain further pages of archives.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @archive_id : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The response containing a list of archive search jobs and their statuses.

      struct ListArchiveSearchesResponse
        include JSON::Serializable

        # If present, use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of search job identifiers and statuses.

        @[JSON::Field(key: "Searches")]
        getter searches : Array(Types::SearchSummary)?

        def initialize(
          @next_token : String? = nil,
          @searches : Array(Types::SearchSummary)? = nil
        )
        end
      end

      # The request to list email archives in your account.

      struct ListArchivesRequest
        include JSON::Serializable

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of archives that are returned per call. You can use NextToken to obtain further
        # pages of archives.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end

      # The response containing a list of your email archives.

      struct ListArchivesResponse
        include JSON::Serializable

        # The list of archive details.

        @[JSON::Field(key: "Archives")]
        getter archives : Array(Types::Archive)

        # If present, use to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @archives : Array(Types::Archive),
          @next_token : String? = nil
        )
        end
      end


      struct ListIngressPointsRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of ingress endpoint resources that are returned per call. You can use NextToken
        # to obtain further ingress endpoints.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListIngressPointsResponse
        include JSON::Serializable

        # The list of ingress endpoints.

        @[JSON::Field(key: "IngressPoints")]
        getter ingress_points : Array(Types::IngressPoint)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ingress_points : Array(Types::IngressPoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersOfAddressListRequest
        include JSON::Serializable

        # The unique identifier of the address list to list the addresses from.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        # Filter to be used to limit the results.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::AddressFilter?

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of address list members that are returned per call. You can use NextToken to
        # retrieve the next page of members.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @address_list_id : String,
          @filter : Types::AddressFilter? = nil,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListMembersOfAddressListResponse
        include JSON::Serializable

        # The list of addresses.

        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(Types::SavedAddress)

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @addresses : Array(Types::SavedAddress),
          @next_token : String? = nil
        )
        end
      end


      struct ListRelaysRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of relays to be returned in one request.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListRelaysResponse
        include JSON::Serializable

        # The list of returned relays.

        @[JSON::Field(key: "Relays")]
        getter relays : Array(Types::Relay)

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @relays : Array(Types::Relay),
          @next_token : String? = nil
        )
        end
      end


      struct ListRuleSetsRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of rule set resources that are returned per call. You can use NextToken to obtain
        # further rule sets.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListRuleSetsResponse
        include JSON::Serializable

        # The list of rule sets.

        @[JSON::Field(key: "RuleSets")]
        getter rule_sets : Array(Types::RuleSet)

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @rule_sets : Array(Types::RuleSet),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to retrieve tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @tags : Array(Types::Tag)
        )
        end
      end


      struct ListTrafficPoliciesRequest
        include JSON::Serializable

        # If you received a pagination token from a previous call to this API, you can provide it here to
        # continue paginating through the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The maximum number of traffic policy resources that are returned per call. You can use NextToken to
        # obtain further traffic policies.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListTrafficPoliciesResponse
        include JSON::Serializable

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of traffic policies.

        @[JSON::Field(key: "TrafficPolicies")]
        getter traffic_policies : Array(Types::TrafficPolicy)?

        def initialize(
          @next_token : String? = nil,
          @traffic_policies : Array(Types::TrafficPolicy)? = nil
        )
        end
      end

      # The textual body content of an email message.

      struct MessageBody
        include JSON::Serializable

        # The HTML body content of the message.

        @[JSON::Field(key: "Html")]
        getter html : String?

        # A flag indicating if the email was malformed.

        @[JSON::Field(key: "MessageMalformed")]
        getter message_malformed : Bool?

        # The plain text body content of the message.

        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @html : String? = nil,
          @message_malformed : Bool? = nil,
          @text : String? = nil
        )
        end
      end

      # The metadata about the email.

      struct Metadata
        include JSON::Serializable

        # The name of the configuration set used when sent through a configuration set with archiving enabled.

        @[JSON::Field(key: "ConfigurationSet")]
        getter configuration_set : String?

        # The ID of the ingress endpoint through which the email was received.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String?

        # The ID of the rule set that processed the email.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String?

        # The name of the host from which the email was received.

        @[JSON::Field(key: "SenderHostname")]
        getter sender_hostname : String?

        # The IP address of the host from which the email was received.

        @[JSON::Field(key: "SenderIpAddress")]
        getter sender_ip_address : String?

        # The name of the API call used when sent through a configuration set with archiving enabled.

        @[JSON::Field(key: "SendingMethod")]
        getter sending_method : String?

        # The name of the dedicated IP pool used when sent through a configuration set with archiving enabled.

        @[JSON::Field(key: "SendingPool")]
        getter sending_pool : String?

        # Specifies the archived email source, identified by either a Rule Set's ARN with an Archive action,
        # or a Configuration Set's Archive ARN.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The identity name used to authorize the sending action when sent through a configuration set with
        # archiving enabled.

        @[JSON::Field(key: "SourceIdentity")]
        getter source_identity : String?

        # The timestamp of when the email was received.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        # The TLS cipher suite used to communicate with the host from which the email was received.

        @[JSON::Field(key: "TlsCipherSuite")]
        getter tls_cipher_suite : String?

        # The TLS protocol used to communicate with the host from which the email was received.

        @[JSON::Field(key: "TlsProtocol")]
        getter tls_protocol : String?

        # The ID of the traffic policy that was in effect when the email was received.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String?

        def initialize(
          @configuration_set : String? = nil,
          @ingress_point_id : String? = nil,
          @rule_set_id : String? = nil,
          @sender_hostname : String? = nil,
          @sender_ip_address : String? = nil,
          @sending_method : String? = nil,
          @sending_pool : String? = nil,
          @source_arn : String? = nil,
          @source_identity : String? = nil,
          @timestamp : Time? = nil,
          @tls_cipher_suite : String? = nil,
          @tls_protocol : String? = nil,
          @traffic_policy_id : String? = nil
        )
        end
      end

      # The network type (IPv4-only, Dual-Stack, PrivateLink) of the ingress endpoint resource.

      struct NetworkConfiguration
        include JSON::Serializable

        # Specifies the network configuration for the private ingress point.

        @[JSON::Field(key: "PrivateNetworkConfiguration")]
        getter private_network_configuration : Types::PrivateNetworkConfiguration?

        # Specifies the network configuration for the public ingress point.

        @[JSON::Field(key: "PublicNetworkConfiguration")]
        getter public_network_configuration : Types::PublicNetworkConfiguration?

        def initialize(
          @private_network_configuration : Types::PrivateNetworkConfiguration? = nil,
          @public_network_configuration : Types::PublicNetworkConfiguration? = nil
        )
        end
      end

      # Explicitly indicate that the relay destination server does not require SMTP credential
      # authentication.

      struct NoAuthentication
        include JSON::Serializable

        def initialize
        end
      end

      # The email traffic filtering conditions which are contained in a traffic policy resource.

      struct PolicyCondition
        include JSON::Serializable

        # This represents a boolean type condition matching on the incoming mail. It performs the boolean
        # operation configured in 'Operator' and evaluates the 'Protocol' object against the 'Value'.

        @[JSON::Field(key: "BooleanExpression")]
        getter boolean_expression : Types::IngressBooleanExpression?

        # This represents an IP based condition matching on the incoming mail. It performs the operation
        # configured in 'Operator' and evaluates the 'Protocol' object against the 'Value'.

        @[JSON::Field(key: "IpExpression")]
        getter ip_expression : Types::IngressIpv4Expression?

        # This represents an IPv6 based condition matching on the incoming mail. It performs the operation
        # configured in 'Operator' and evaluates the 'Protocol' object against the 'Value'.

        @[JSON::Field(key: "Ipv6Expression")]
        getter ipv6_expression : Types::IngressIpv6Expression?

        # This represents a string based condition matching on the incoming mail. It performs the string
        # operation configured in 'Operator' and evaluates the 'Protocol' object against the 'Value'.

        @[JSON::Field(key: "StringExpression")]
        getter string_expression : Types::IngressStringExpression?

        # This represents a TLS based condition matching on the incoming mail. It performs the operation
        # configured in 'Operator' and evaluates the 'Protocol' object against the 'Value'.

        @[JSON::Field(key: "TlsExpression")]
        getter tls_expression : Types::IngressTlsProtocolExpression?

        def initialize(
          @boolean_expression : Types::IngressBooleanExpression? = nil,
          @ip_expression : Types::IngressIpv4Expression? = nil,
          @ipv6_expression : Types::IngressIpv6Expression? = nil,
          @string_expression : Types::IngressStringExpression? = nil,
          @tls_expression : Types::IngressTlsProtocolExpression? = nil
        )
        end
      end

      # The structure containing traffic policy conditions and actions.

      struct PolicyStatement
        include JSON::Serializable

        # The action that informs a traffic policy resource to either allow or block the email if it matches a
        # condition in the policy statement.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The list of conditions to apply to incoming messages for filtering email traffic.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::PolicyCondition)

        def initialize(
          @action : String,
          @conditions : Array(Types::PolicyCondition)
        )
        end
      end

      # Specifies the network configuration for the private ingress point.

      struct PrivateNetworkConfiguration
        include JSON::Serializable

        # The identifier of the VPC endpoint to associate with this private ingress point.

        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String

        def initialize(
          @vpc_endpoint_id : String
        )
        end
      end

      # Specifies the network configuration for the public ingress point.

      struct PublicNetworkConfiguration
        include JSON::Serializable

        # The IP address type for the public ingress point. Valid values are IPV4 and DUAL_STACK.

        @[JSON::Field(key: "IpType")]
        getter ip_type : String

        def initialize(
          @ip_type : String
        )
        end
      end


      struct RegisterMemberToAddressListRequest
        include JSON::Serializable

        # The address to be added to the address list.

        @[JSON::Field(key: "Address")]
        getter address : String

        # The unique identifier of the address list where the address should be added.

        @[JSON::Field(key: "AddressListId")]
        getter address_list_id : String

        def initialize(
          @address : String,
          @address_list_id : String
        )
        end
      end


      struct RegisterMemberToAddressListResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The relay resource that can be used as a rule to relay receiving emails to the destination relay
      # server.

      struct Relay
        include JSON::Serializable

        # The timestamp of when the relay was last modified.

        @[JSON::Field(key: "LastModifiedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_timestamp : Time?

        # The unique relay identifier.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String?

        # The unique relay name.

        @[JSON::Field(key: "RelayName")]
        getter relay_name : String?

        def initialize(
          @last_modified_timestamp : Time? = nil,
          @relay_id : String? = nil,
          @relay_name : String? = nil
        )
        end
      end

      # The action relays the email via SMTP to another specific SMTP server.

      struct RelayAction
        include JSON::Serializable

        # The identifier of the relay resource to be used when relaying an email.

        @[JSON::Field(key: "Relay")]
        getter relay : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the specified relay has been deleted.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        # This action specifies whether to preserve or replace original mail from address while relaying
        # received emails to a destination server.

        @[JSON::Field(key: "MailFrom")]
        getter mail_from : String?

        def initialize(
          @relay : String,
          @action_failure_policy : String? = nil,
          @mail_from : String? = nil
        )
        end
      end

      # Authentication for the relay destination server—specify the secretARN where the SMTP credentials are
      # stored, or specify an empty NoAuthentication structure if the relay destination server does not
      # require SMTP credential authentication.

      struct RelayAuthentication
        include JSON::Serializable

        # Keep an empty structure if the relay destination server does not require SMTP credential
        # authentication.

        @[JSON::Field(key: "NoAuthentication")]
        getter no_authentication : Types::NoAuthentication?

        # The ARN of the secret created in secrets manager where the relay server's SMTP credentials are
        # stored.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        def initialize(
          @no_authentication : Types::NoAuthentication? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # This action replaces the email envelope recipients with the given list of recipients. If the
      # condition of this action applies only to a subset of recipients, only those recipients are replaced
      # with the recipients specified in the action. The message contents and headers are unaffected by this
      # action, only the envelope recipients are updated.

      struct ReplaceRecipientAction
        include JSON::Serializable

        # This action specifies the replacement recipient email addresses to insert.

        @[JSON::Field(key: "ReplaceWith")]
        getter replace_with : Array(String)?

        def initialize(
          @replace_with : Array(String)? = nil
        )
        end
      end

      # Occurs when a requested resource is not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A result row containing metadata for an archived email message.

      struct Row
        include JSON::Serializable

        # The unique identifier of the archived message.

        @[JSON::Field(key: "ArchivedMessageId")]
        getter archived_message_id : String?

        # The email addresses in the CC header.

        @[JSON::Field(key: "Cc")]
        getter cc : String?

        # The date the email was sent.

        @[JSON::Field(key: "Date")]
        getter date : String?

        # The SMTP envelope information of the email.

        @[JSON::Field(key: "Envelope")]
        getter envelope : Types::Envelope?

        # The email address of the sender.

        @[JSON::Field(key: "From")]
        getter from : String?

        # A flag indicating if the email has attachments.

        @[JSON::Field(key: "HasAttachments")]
        getter has_attachments : Bool?

        # The email message ID this is a reply to.

        @[JSON::Field(key: "InReplyTo")]
        getter in_reply_to : String?

        # The ID of the ingress endpoint through which the email was received.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String?

        # The unique message ID of the email.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The received headers from the email delivery path.

        @[JSON::Field(key: "ReceivedHeaders")]
        getter received_headers : Array(String)?

        # The timestamp of when the email was received.

        @[JSON::Field(key: "ReceivedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter received_timestamp : Time?

        # The name of the host from which the email was received.

        @[JSON::Field(key: "SenderHostname")]
        getter sender_hostname : String?

        # Mail archived with Mail Manager: The IP address of the client that connects to the ingress endpoint.
        # Mail sent through a configuration set with the archiving option enabled: The IP address of the
        # client that makes the SendEmail API call.

        @[JSON::Field(key: "SenderIpAddress")]
        getter sender_ip_address : String?

        # Specifies the archived email source, identified by either a Rule Set's ARN with an Archive action,
        # or a Configuration Set's Archive ARN.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The subject header value of the email.

        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # The email addresses in the To header.

        @[JSON::Field(key: "To")]
        getter to : String?

        # The user agent that sent the email.

        @[JSON::Field(key: "XMailer")]
        getter x_mailer : String?

        # The original user agent that sent the email.

        @[JSON::Field(key: "XOriginalMailer")]
        getter x_original_mailer : String?

        # The priority level of the email.

        @[JSON::Field(key: "XPriority")]
        getter x_priority : String?

        def initialize(
          @archived_message_id : String? = nil,
          @cc : String? = nil,
          @date : String? = nil,
          @envelope : Types::Envelope? = nil,
          @from : String? = nil,
          @has_attachments : Bool? = nil,
          @in_reply_to : String? = nil,
          @ingress_point_id : String? = nil,
          @message_id : String? = nil,
          @received_headers : Array(String)? = nil,
          @received_timestamp : Time? = nil,
          @sender_hostname : String? = nil,
          @sender_ip_address : String? = nil,
          @source_arn : String? = nil,
          @subject : String? = nil,
          @to : String? = nil,
          @x_mailer : String? = nil,
          @x_original_mailer : String? = nil,
          @x_priority : String? = nil
        )
        end
      end

      # A rule contains conditions, "unless conditions" and actions. For each envelope recipient of an
      # email, if all conditions match and none of the "unless conditions" match, then all of the actions
      # are executed sequentially. If no conditions are provided, the rule always applies and the actions
      # are implicitly executed. If only "unless conditions" are provided, the rule applies if the email
      # does not match the evaluation of the "unless conditions".

      struct Rule
        include JSON::Serializable

        # The list of actions to execute when the conditions match the incoming email, and none of the "unless
        # conditions" match.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(Types::RuleAction)

        # The conditions of this rule. All conditions must match the email for the actions to be executed. An
        # empty list of conditions means that all emails match, but are still subject to any "unless
        # conditions"

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::RuleCondition)?

        # The user-friendly name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The "unless conditions" of this rule. None of the conditions can match the email for the actions to
        # be executed. If any of these conditions do match the email, then the actions are not executed.

        @[JSON::Field(key: "Unless")]
        getter unless : Array(Types::RuleCondition)?

        def initialize(
          @actions : Array(Types::RuleAction),
          @conditions : Array(Types::RuleCondition)? = nil,
          @name : String? = nil,
          @unless : Array(Types::RuleCondition)? = nil
        )
        end
      end

      # The action for a rule to take. Only one of the contained actions can be set.

      struct RuleAction
        include JSON::Serializable

        # This action adds a header. This can be used to add arbitrary email headers.

        @[JSON::Field(key: "AddHeader")]
        getter add_header : Types::AddHeaderAction?

        # This action archives the email. This can be used to deliver an email to an archive.

        @[JSON::Field(key: "Archive")]
        getter archive : Types::ArchiveAction?

        # This action delivers an email to a WorkMail mailbox.

        @[JSON::Field(key: "DeliverToMailbox")]
        getter deliver_to_mailbox : Types::DeliverToMailboxAction?

        # This action delivers an email to an Amazon Q Business application for ingestion into its knowledge
        # base.

        @[JSON::Field(key: "DeliverToQBusiness")]
        getter deliver_to_q_business : Types::DeliverToQBusinessAction?

        # This action terminates the evaluation of rules in the rule set.

        @[JSON::Field(key: "Drop")]
        getter drop : Types::DropAction?

        # This action publishes the email content to an Amazon SNS topic.

        @[JSON::Field(key: "PublishToSns")]
        getter publish_to_sns : Types::SnsAction?

        # This action relays the email to another SMTP server.

        @[JSON::Field(key: "Relay")]
        getter relay : Types::RelayAction?

        # The action replaces certain or all recipients with a different set of recipients.

        @[JSON::Field(key: "ReplaceRecipient")]
        getter replace_recipient : Types::ReplaceRecipientAction?

        # This action sends the email to the internet.

        @[JSON::Field(key: "Send")]
        getter send : Types::SendAction?

        # This action writes the MIME content of the email to an S3 bucket.

        @[JSON::Field(key: "WriteToS3")]
        getter write_to_s3 : Types::S3Action?

        def initialize(
          @add_header : Types::AddHeaderAction? = nil,
          @archive : Types::ArchiveAction? = nil,
          @deliver_to_mailbox : Types::DeliverToMailboxAction? = nil,
          @deliver_to_q_business : Types::DeliverToQBusinessAction? = nil,
          @drop : Types::DropAction? = nil,
          @publish_to_sns : Types::SnsAction? = nil,
          @relay : Types::RelayAction? = nil,
          @replace_recipient : Types::ReplaceRecipientAction? = nil,
          @send : Types::SendAction? = nil,
          @write_to_s3 : Types::S3Action? = nil
        )
        end
      end

      # A boolean expression to be used in a rule condition.

      struct RuleBooleanExpression
        include JSON::Serializable

        # The operand on which to perform a boolean condition operation.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::RuleBooleanToEvaluate

        # The matching operator for a boolean condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        def initialize(
          @evaluate : Types::RuleBooleanToEvaluate,
          @operator : String
        )
        end
      end

      # The union type representing the allowed types of operands for a boolean condition.

      struct RuleBooleanToEvaluate
        include JSON::Serializable

        # The Add On ARN and its returned value to evaluate in a boolean condition expression.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Types::Analysis?

        # The boolean type representing the allowed attribute types for an email.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # The structure representing the address lists and address list attribute that will be used in
        # evaluation of boolean expression.

        @[JSON::Field(key: "IsInAddressList")]
        getter is_in_address_list : Types::RuleIsInAddressList?

        def initialize(
          @analysis : Types::Analysis? = nil,
          @attribute : String? = nil,
          @is_in_address_list : Types::RuleIsInAddressList? = nil
        )
        end
      end

      # The conditional expression used to evaluate an email for determining if a rule action should be
      # taken.

      struct RuleCondition
        include JSON::Serializable

        # The condition applies to a boolean expression passed in this field.

        @[JSON::Field(key: "BooleanExpression")]
        getter boolean_expression : Types::RuleBooleanExpression?

        # The condition applies to a DMARC policy expression passed in this field.

        @[JSON::Field(key: "DmarcExpression")]
        getter dmarc_expression : Types::RuleDmarcExpression?

        # The condition applies to an IP address expression passed in this field.

        @[JSON::Field(key: "IpExpression")]
        getter ip_expression : Types::RuleIpExpression?

        # The condition applies to a number expression passed in this field.

        @[JSON::Field(key: "NumberExpression")]
        getter number_expression : Types::RuleNumberExpression?

        # The condition applies to a string expression passed in this field.

        @[JSON::Field(key: "StringExpression")]
        getter string_expression : Types::RuleStringExpression?

        # The condition applies to a verdict expression passed in this field.

        @[JSON::Field(key: "VerdictExpression")]
        getter verdict_expression : Types::RuleVerdictExpression?

        def initialize(
          @boolean_expression : Types::RuleBooleanExpression? = nil,
          @dmarc_expression : Types::RuleDmarcExpression? = nil,
          @ip_expression : Types::RuleIpExpression? = nil,
          @number_expression : Types::RuleNumberExpression? = nil,
          @string_expression : Types::RuleStringExpression? = nil,
          @verdict_expression : Types::RuleVerdictExpression? = nil
        )
        end
      end

      # A DMARC policy expression. The condition matches if the given DMARC policy matches that of the
      # incoming email.

      struct RuleDmarcExpression
        include JSON::Serializable

        # The operator to apply to the DMARC policy of the incoming email.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values to use for the given DMARC policy operator. For the operator EQUALS, if multiple values
        # are given, they are evaluated as an OR. That is, if any of the given values match, the condition is
        # deemed to match. For the operator NOT_EQUALS, if multiple values are given, they are evaluated as an
        # AND. That is, only if the email's DMARC policy is not equal to any of the given values, then the
        # condition is deemed to match.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # An IP address expression matching certain IP addresses within a given range of IP addresses.

      struct RuleIpExpression
        include JSON::Serializable

        # The IP address to evaluate in this condition.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::RuleIpToEvaluate

        # The operator to evaluate the IP address.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The IP CIDR blocks in format "x.y.z.w/n" (eg 10.0.0.0/8) to match with the email's IP address. For
        # the operator CIDR_MATCHES, if multiple values are given, they are evaluated as an OR. That is, if
        # the IP address is contained within any of the given CIDR ranges, the condition is deemed to match.
        # For NOT_CIDR_MATCHES, if multiple CIDR ranges are given, the condition is deemed to match if the IP
        # address is not contained in any of the given CIDR ranges.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::RuleIpToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The IP address to evaluate for this condition.

      struct RuleIpToEvaluate
        include JSON::Serializable

        # The attribute of the email to evaluate.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # The structure type for a boolean condition that provides the address lists and address list
      # attribute to evaluate.

      struct RuleIsInAddressList
        include JSON::Serializable

        # The address lists that will be used for evaluation.

        @[JSON::Field(key: "AddressLists")]
        getter address_lists : Array(String)

        # The email attribute that needs to be evaluated against the address list.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String

        def initialize(
          @address_lists : Array(String),
          @attribute : String
        )
        end
      end

      # A number expression to match numeric conditions with integers from the incoming email.

      struct RuleNumberExpression
        include JSON::Serializable

        # The number to evaluate in a numeric condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::RuleNumberToEvaluate

        # The operator for a numeric condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The value to evaluate in a numeric condition expression.

        @[JSON::Field(key: "Value")]
        getter value : Float64

        def initialize(
          @evaluate : Types::RuleNumberToEvaluate,
          @operator : String,
          @value : Float64
        )
        end
      end

      # The number to evaluate in a numeric condition expression.

      struct RuleNumberToEvaluate
        include JSON::Serializable

        # An email attribute that is used as the number to evaluate.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # A rule set contains a list of rules that are evaluated in order. Each rule is evaluated sequentially
      # for each email.

      struct RuleSet
        include JSON::Serializable

        # The last modification date of the rule set.

        @[JSON::Field(key: "LastModificationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modification_date : Time?

        # The identifier of the rule set.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String?

        # A user-friendly name for the rule set.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        def initialize(
          @last_modification_date : Time? = nil,
          @rule_set_id : String? = nil,
          @rule_set_name : String? = nil
        )
        end
      end

      # A string expression is evaluated against strings or substrings of the email.

      struct RuleStringExpression
        include JSON::Serializable

        # The string to evaluate in a string condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::RuleStringToEvaluate

        # The matching operator for a string condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The string(s) to be evaluated in a string condition expression. For all operators, except for
        # NOT_EQUALS, if multiple values are given, the values are processed as an OR. That is, if any of the
        # values match the email's string using the given operator, the condition is deemed to match. However,
        # for NOT_EQUALS, the condition is only deemed to match if none of the given strings match the email's
        # string.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::RuleStringToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The string to evaluate in a string condition expression.

      struct RuleStringToEvaluate
        include JSON::Serializable

        # The Add On ARN and its returned value to evaluate in a string condition expression.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Types::Analysis?

        # The email attribute to evaluate in a string condition expression.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # The email MIME X-Header attribute to evaluate in a string condition expression.

        @[JSON::Field(key: "MimeHeaderAttribute")]
        getter mime_header_attribute : String?

        def initialize(
          @analysis : Types::Analysis? = nil,
          @attribute : String? = nil,
          @mime_header_attribute : String? = nil
        )
        end
      end

      # A verdict expression is evaluated against verdicts of the email.

      struct RuleVerdictExpression
        include JSON::Serializable

        # The verdict to evaluate in a verdict condition expression.

        @[JSON::Field(key: "Evaluate")]
        getter evaluate : Types::RuleVerdictToEvaluate

        # The matching operator for a verdict condition expression.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The values to match with the email's verdict using the given operator. For the EQUALS operator, if
        # multiple values are given, the condition is deemed to match if any of the given verdicts match that
        # of the email. For the NOT_EQUALS operator, if multiple values are given, the condition is deemed to
        # match of none of the given verdicts match the verdict of the email.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @evaluate : Types::RuleVerdictToEvaluate,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The verdict to evaluate in a verdict condition expression.

      struct RuleVerdictToEvaluate
        include JSON::Serializable

        # The Add On ARN and its returned value to evaluate in a verdict condition expression.

        @[JSON::Field(key: "Analysis")]
        getter analysis : Types::Analysis?

        # The email verdict attribute to evaluate in a string verdict expression.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @analysis : Types::Analysis? = nil,
          @attribute : String? = nil
        )
        end
      end

      # Writes the MIME content of the email to an S3 bucket.

      struct S3Action
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Role to use while writing to S3. This role must have
        # access to the s3:PutObject, kms:Encrypt, and kms:GenerateDataKey APIs for the given bucket.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The bucket name of the S3 bucket to write to.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the specified the bucket has been deleted.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        # The S3 prefix to use for the write to the s3 bucket.

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        # The KMS Key ID to use to encrypt the message in S3.

        @[JSON::Field(key: "S3SseKmsKeyId")]
        getter s3_sse_kms_key_id : String?

        def initialize(
          @role_arn : String,
          @s3_bucket : String,
          @action_failure_policy : String? = nil,
          @s3_prefix : String? = nil,
          @s3_sse_kms_key_id : String? = nil
        )
        end
      end

      # The configuration for exporting email data to an Amazon S3 bucket.

      struct S3ExportDestinationConfiguration
        include JSON::Serializable

        # The S3 location to deliver the exported email data.

        @[JSON::Field(key: "S3Location")]
        getter s3_location : String?

        def initialize(
          @s3_location : String? = nil
        )
        end
      end

      # An address that is a member of an address list.

      struct SavedAddress
        include JSON::Serializable

        # The email or domain that constitutes the address.

        @[JSON::Field(key: "Address")]
        getter address : String

        # The timestamp of when the address was added to the address list.

        @[JSON::Field(key: "CreatedTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_timestamp : Time

        def initialize(
          @address : String,
          @created_timestamp : Time
        )
        end
      end

      # The current status of an archive search job.

      struct SearchStatus
        include JSON::Serializable

        # The timestamp of when the search completed (if finished).

        @[JSON::Field(key: "CompletionTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completion_timestamp : Time?

        # An error message if the search failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The current state of the search job.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The timestamp of when the search was submitted.

        @[JSON::Field(key: "SubmissionTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submission_timestamp : Time?

        def initialize(
          @completion_timestamp : Time? = nil,
          @error_message : String? = nil,
          @state : String? = nil,
          @submission_timestamp : Time? = nil
        )
        end
      end

      # Summary details of an archive search job.

      struct SearchSummary
        include JSON::Serializable

        # The unique identifier of the search job.

        @[JSON::Field(key: "SearchId")]
        getter search_id : String?

        # The current status of the search job.

        @[JSON::Field(key: "Status")]
        getter status : Types::SearchStatus?

        def initialize(
          @search_id : String? = nil,
          @status : Types::SearchStatus? = nil
        )
        end
      end

      # Sends the email to the internet using the ses:SendRawEmail API.

      struct SendAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the role to use for this action. This role must have access to the
        # ses:SendRawEmail API.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, the caller does not have the permissions to call the sendRawEmail
        # API.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        def initialize(
          @role_arn : String,
          @action_failure_policy : String? = nil
        )
        end
      end

      # Occurs when an operation exceeds a predefined service quota or limit.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action to publish the email content to an Amazon SNS topic. When executed, this action will send
      # the email as a notification to the specified SNS topic.

      struct SnsAction
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Role to use while writing to Amazon SNS. This role must
        # have access to the sns:Publish API for the given topic.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the Amazon SNS Topic to which notification for the email received
        # will be published.

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String

        # A policy that states what to do in the case of failure. The action will fail if there are
        # configuration errors. For example, specified SNS topic has been deleted or the role lacks necessary
        # permissions to call the sns:Publish API.

        @[JSON::Field(key: "ActionFailurePolicy")]
        getter action_failure_policy : String?

        # The encoding to use for the email within the Amazon SNS notification. The default value is UTF-8 .
        # Use BASE64 if you need to preserve all special characters, especially when the original message uses
        # a different encoding format.

        @[JSON::Field(key: "Encoding")]
        getter encoding : String?

        # The expected payload type within the Amazon SNS notification. CONTENT attempts to publish the full
        # email content with 20KB of headers content. HEADERS extracts up to 100KB of header content to
        # include in the notification, email content will not be included to the notification. The default
        # value is CONTENT .

        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String?

        def initialize(
          @role_arn : String,
          @topic_arn : String,
          @action_failure_policy : String? = nil,
          @encoding : String? = nil,
          @payload_type : String? = nil
        )
        end
      end


      struct StartAddressListImportJobRequest
        include JSON::Serializable

        # The identifier of the import job that needs to be started.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StartAddressListImportJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to initiate an export of emails from an archive.

      struct StartArchiveExportRequest
        include JSON::Serializable

        # The identifier of the archive to export emails from.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # Details on where to deliver the exported email data.

        @[JSON::Field(key: "ExportDestinationConfiguration")]
        getter export_destination_configuration : Types::ExportDestinationConfiguration

        # The start of the timestamp range to include emails from.

        @[JSON::Field(key: "FromTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from_timestamp : Time

        # The end of the timestamp range to include emails from.

        @[JSON::Field(key: "ToTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter to_timestamp : Time

        # Criteria to filter which emails are included in the export.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ArchiveFilters?

        # Whether to include message metadata as JSON files in the export.

        @[JSON::Field(key: "IncludeMetadata")]
        getter include_metadata : Bool?

        # The maximum number of email items to include in the export.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @archive_id : String,
          @export_destination_configuration : Types::ExportDestinationConfiguration,
          @from_timestamp : Time,
          @to_timestamp : Time,
          @filters : Types::ArchiveFilters? = nil,
          @include_metadata : Bool? = nil,
          @max_results : Int32? = nil
        )
        end
      end

      # The response from initiating an archive export.

      struct StartArchiveExportResponse
        include JSON::Serializable

        # The unique identifier for the initiated export job.

        @[JSON::Field(key: "ExportId")]
        getter export_id : String?

        def initialize(
          @export_id : String? = nil
        )
        end
      end

      # The request to initiate a search across emails in an archive.

      struct StartArchiveSearchRequest
        include JSON::Serializable

        # The identifier of the archive to search emails in.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # The start timestamp of the range to search emails from.

        @[JSON::Field(key: "FromTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from_timestamp : Time

        # The maximum number of search results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # The end timestamp of the range to search emails from.

        @[JSON::Field(key: "ToTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter to_timestamp : Time

        # Criteria to filter which emails are included in the search results.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::ArchiveFilters?

        def initialize(
          @archive_id : String,
          @from_timestamp : Time,
          @max_results : Int32,
          @to_timestamp : Time,
          @filters : Types::ArchiveFilters? = nil
        )
        end
      end

      # The response from initiating an archive search.

      struct StartArchiveSearchResponse
        include JSON::Serializable

        # The unique identifier for the initiated search job.

        @[JSON::Field(key: "SearchId")]
        getter search_id : String?

        def initialize(
          @search_id : String? = nil
        )
        end
      end


      struct StopAddressListImportJobRequest
        include JSON::Serializable

        # The identifier of the import job that needs to be stopped.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopAddressListImportJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to stop an in-progress archive export job.

      struct StopArchiveExportRequest
        include JSON::Serializable

        # The identifier of the export job to stop.

        @[JSON::Field(key: "ExportId")]
        getter export_id : String

        def initialize(
          @export_id : String
        )
        end
      end

      # The response indicating if the request to stop the export job succeeded. On success, returns an HTTP
      # 200 status code. On failure, returns an error message.

      struct StopArchiveExportResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request to stop an in-progress archive search job.

      struct StopArchiveSearchRequest
        include JSON::Serializable

        # The identifier of the search job to stop.

        @[JSON::Field(key: "SearchId")]
        getter search_id : String

        def initialize(
          @search_id : String
        )
        end
      end

      # The response indicating if the request to stop the search job succeeded. On success, returns an HTTP
      # 200 status code. On failure, returns an error message.

      struct StopArchiveSearchResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A key-value pair (the value is optional), that you can define and assign to Amazon Web Services
      # resources.

      struct Tag
        include JSON::Serializable

        # The key of the key-value tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key-value tag.

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

        # The Amazon Resource Name (ARN) of the resource that you want to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for the resource. For example, { "tags":
        # {"key1":"value1", "key2":"value2"} }.

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

      # Occurs when a service's request rate limit is exceeded, resulting in throttling of further requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The structure of a traffic policy resource which is a container for policy statements.

      struct TrafficPolicy
        include JSON::Serializable

        # Default action instructs the traﬃc policy to either Allow or Deny (block) messages that fall outside
        # of (or not addressed by) the conditions of your policy statements

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : String

        # The identifier of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # A user-friendly name of the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyName")]
        getter traffic_policy_name : String

        def initialize(
          @default_action : String,
          @traffic_policy_id : String,
          @traffic_policy_name : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the key-value pairs for the tag or tags you want to remove from the specified resource.

        @[JSON::Field(key: "TagKeys")]
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

      # The request to update properties of an existing email archive.

      struct UpdateArchiveRequest
        include JSON::Serializable

        # The identifier of the archive to update.

        @[JSON::Field(key: "ArchiveId")]
        getter archive_id : String

        # A new, unique name for the archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String?

        # A new retention period for emails in the archive.

        @[JSON::Field(key: "Retention")]
        getter retention : Types::ArchiveRetention?

        def initialize(
          @archive_id : String,
          @archive_name : String? = nil,
          @retention : Types::ArchiveRetention? = nil
        )
        end
      end

      # The response indicating if the archive update succeeded or failed. On success, returns an HTTP 200
      # status code. On failure, returns an error message.

      struct UpdateArchiveResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateIngressPointRequest
        include JSON::Serializable

        # The identifier for the ingress endpoint you want to update.

        @[JSON::Field(key: "IngressPointId")]
        getter ingress_point_id : String

        # If you choose an Authenticated ingress endpoint, you must configure either an SMTP password or a
        # secret ARN.

        @[JSON::Field(key: "IngressPointConfiguration")]
        getter ingress_point_configuration : Types::IngressPointConfiguration?

        # A user friendly name for the ingress endpoint resource.

        @[JSON::Field(key: "IngressPointName")]
        getter ingress_point_name : String?

        # The identifier of an existing rule set that you attach to an ingress endpoint resource.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String?

        # The update status of an ingress endpoint.

        @[JSON::Field(key: "StatusToUpdate")]
        getter status_to_update : String?

        # The identifier of an existing traffic policy that you attach to an ingress endpoint resource.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String?

        def initialize(
          @ingress_point_id : String,
          @ingress_point_configuration : Types::IngressPointConfiguration? = nil,
          @ingress_point_name : String? = nil,
          @rule_set_id : String? = nil,
          @status_to_update : String? = nil,
          @traffic_policy_id : String? = nil
        )
        end
      end


      struct UpdateIngressPointResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRelayRequest
        include JSON::Serializable

        # The unique relay identifier.

        @[JSON::Field(key: "RelayId")]
        getter relay_id : String

        # Authentication for the relay destination server—specify the secretARN where the SMTP credentials are
        # stored.

        @[JSON::Field(key: "Authentication")]
        getter authentication : Types::RelayAuthentication?

        # The name of the relay resource.

        @[JSON::Field(key: "RelayName")]
        getter relay_name : String?

        # The destination relay server address.

        @[JSON::Field(key: "ServerName")]
        getter server_name : String?

        # The destination relay server port.

        @[JSON::Field(key: "ServerPort")]
        getter server_port : Int32?

        def initialize(
          @relay_id : String,
          @authentication : Types::RelayAuthentication? = nil,
          @relay_name : String? = nil,
          @server_name : String? = nil,
          @server_port : Int32? = nil
        )
        end
      end


      struct UpdateRelayResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRuleSetRequest
        include JSON::Serializable

        # The identifier of a rule set you want to update.

        @[JSON::Field(key: "RuleSetId")]
        getter rule_set_id : String

        # A user-friendly name for the rule set resource.

        @[JSON::Field(key: "RuleSetName")]
        getter rule_set_name : String?

        # A new set of rules to replace the current rules of the rule set—these rules will override all the
        # rules of the rule set.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @rule_set_id : String,
          @rule_set_name : String? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct UpdateRuleSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateTrafficPolicyRequest
        include JSON::Serializable

        # The identifier of the traffic policy that you want to update.

        @[JSON::Field(key: "TrafficPolicyId")]
        getter traffic_policy_id : String

        # Default action instructs the traﬃc policy to either Allow or Deny (block) messages that fall outside
        # of (or not addressed by) the conditions of your policy statements

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : String?

        # The maximum message size in bytes of email which is allowed in by this traffic policy—anything
        # larger will be blocked.

        @[JSON::Field(key: "MaxMessageSizeBytes")]
        getter max_message_size_bytes : Int32?

        # The list of conditions to be updated for filtering email traffic.

        @[JSON::Field(key: "PolicyStatements")]
        getter policy_statements : Array(Types::PolicyStatement)?

        # A user-friendly name for the traffic policy resource.

        @[JSON::Field(key: "TrafficPolicyName")]
        getter traffic_policy_name : String?

        def initialize(
          @traffic_policy_id : String,
          @default_action : String? = nil,
          @max_message_size_bytes : Int32? = nil,
          @policy_statements : Array(Types::PolicyStatement)? = nil,
          @traffic_policy_name : String? = nil
        )
        end
      end


      struct UpdateTrafficPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request validation has failed. For details, see the accompanying error message.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
