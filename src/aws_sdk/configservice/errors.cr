module AwsSdk
  module ConfigService
    module Errors
      class ServiceError < Exception
      end

      # For PutServiceLinkedConfigurationRecorder , you cannot create a service-linked recorder because a
      # service-linked recorder already exists for the specified service. For
      # DeleteServiceLinkedConfigurationRecorder , you cannot delete the service-linked recorder because it
      # is currently in use by the linked Amazon Web Services service. For DeleteDeliveryChannel , you
      # cannot delete the specified delivery channel because the customer managed configuration recorder is
      # running. Use the StopConfigurationRecorder operation to stop the customer managed configuration
      # recorder. For AssociateResourceTypes and DisassociateResourceTypes , one of the following errors:
      # For service-linked configuration recorders, the configuration recorder is not in use by the service.
      # No association or dissociation of resource types is permitted. For service-linked configuration
      # recorders, your requested change to the configuration recorder has been denied by its linked Amazon
      # Web Services service.

      class ConflictException < ServiceError
      end

      # You have specified a template that is not valid or supported.

      class ConformancePackTemplateValidationException < ServiceError
      end

      # Using the same client token with one or more different parameters. Specify a new client token with
      # the parameter changes and try again.

      class IdempotentParameterMismatch < ServiceError
      end

      # Your Amazon S3 bucket policy does not allow Config to write to it.

      class InsufficientDeliveryPolicyException < ServiceError
      end

      # Indicates one of the following errors: For PutConfigRule , the rule cannot be created because the
      # IAM role assigned to Config lacks permissions to perform the config:Put* action. For PutConfigRule ,
      # the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.
      # For PutOrganizationConfigRule , organization Config rule cannot be created because you do not have
      # permissions to call IAM GetRole action or create a service-linked role. For PutConformancePack and
      # PutOrganizationConformancePack , a conformance pack cannot be created because you do not have the
      # following permissions: You do not have permission to call IAM GetRole action or create a
      # service-linked role. You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.
      # For PutServiceLinkedConfigurationRecorder , a service-linked configuration recorder cannot be
      # created because you do not have the following permissions: IAM CreateServiceLinkedRole .

      class InsufficientPermissionsException < ServiceError
      end

      # The configuration recorder name is not valid. The prefix " AWSConfigurationRecorderFor " is reserved
      # for service-linked configuration recorders.

      class InvalidConfigurationRecorderNameException < ServiceError
      end

      # The specified delivery channel name is not valid.

      class InvalidDeliveryChannelNameException < ServiceError
      end

      # The syntax of the query is incorrect.

      class InvalidExpressionException < ServiceError
      end

      # The specified limit is outside the allowable range.

      class InvalidLimitException < ServiceError
      end

      # The specified next token is not valid. Specify the nextToken string that was returned in the
      # previous response to get the next page of results.

      class InvalidNextTokenException < ServiceError
      end

      # One or more of the specified parameters are not valid. Verify that your parameters are valid and try
      # again.

      class InvalidParameterValueException < ServiceError
      end

      # One of the following errors: You have provided a combination of parameter values that is not valid.
      # For example: Setting the allSupported field of RecordingGroup to true , but providing a non-empty
      # list for the resourceTypes field of RecordingGroup . Setting the allSupported field of
      # RecordingGroup to true , but also setting the useOnly field of RecordingStrategy to
      # EXCLUSION_BY_RESOURCE_TYPES . Every parameter is either null, false, or empty. You have reached the
      # limit of the number of resource types you can provide for the recording group. You have provided
      # resource types or a recording strategy that are not valid.

      class InvalidRecordingGroupException < ServiceError
      end

      # The specified ResultToken is not valid.

      class InvalidResultTokenException < ServiceError
      end

      # You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and
      # used by the customer managed configuration recorder.

      class InvalidRoleException < ServiceError
      end

      # The specified Amazon S3 key prefix is not valid.

      class InvalidS3KeyPrefixException < ServiceError
      end

      # The specified Amazon KMS Key ARN is not valid.

      class InvalidS3KmsKeyArnException < ServiceError
      end

      # The specified Amazon SNS topic does not exist.

      class InvalidSNSTopicARNException < ServiceError
      end

      # The specified time range is not valid. The earlier time is not chronologically before the later
      # time.

      class InvalidTimeRangeException < ServiceError
      end

      # You cannot delete the delivery channel you specified because the customer managed configuration
      # recorder is running.

      class LastDeliveryChannelDeleteFailedException < ServiceError
      end

      # For PutServiceLinkedConfigurationRecorder API, this exception is thrown if the number of
      # service-linked roles in the account exceeds the limit. For StartConfigRulesEvaluation API, this
      # exception is thrown if an evaluation is in progress or if you call the StartConfigRulesEvaluation
      # API more than once per minute. For PutConfigurationAggregator API, this exception is thrown if the
      # number of accounts and aggregators exceeds the limit.

      class LimitExceededException < ServiceError
      end

      # You have reached the limit of active custom resource types in your account. There is a limit of
      # 100,000. Delete unused resources using DeleteResourceConfig .

      class MaxActiveResourcesExceededException < ServiceError
      end

      # Failed to add the Config rule because the account already contains the maximum number of 1000 rules.
      # Consider deleting any deactivated rules before you add new rules.

      class MaxNumberOfConfigRulesExceededException < ServiceError
      end

      # You have reached the limit of the number of configuration recorders you can create.

      class MaxNumberOfConfigurationRecordersExceededException < ServiceError
      end

      # You have reached the limit of the number of conformance packs you can create in an account. For more
      # information, see Service Limits in the Config Developer Guide .

      class MaxNumberOfConformancePacksExceededException < ServiceError
      end

      # You have reached the limit of the number of delivery channels you can create.

      class MaxNumberOfDeliveryChannelsExceededException < ServiceError
      end

      # You have reached the limit of the number of organization Config rules you can create. For more
      # information, see see Service Limits in the Config Developer Guide .

      class MaxNumberOfOrganizationConfigRulesExceededException < ServiceError
      end

      # You have reached the limit of the number of organization conformance packs you can create in an
      # account. For more information, see Service Limits in the Config Developer Guide .

      class MaxNumberOfOrganizationConformancePacksExceededException < ServiceError
      end

      # Failed to add the retention configuration because a retention configuration with that name already
      # exists.

      class MaxNumberOfRetentionConfigurationsExceededException < ServiceError
      end

      # There are no customer managed configuration recorders available to record your resources. Use the
      # PutConfigurationRecorder operation to create the customer managed configuration recorder.

      class NoAvailableConfigurationRecorderException < ServiceError
      end

      # There is no delivery channel available to record configurations.

      class NoAvailableDeliveryChannelException < ServiceError
      end

      # Organization is no longer available.

      class NoAvailableOrganizationException < ServiceError
      end

      # There is no configuration recorder running.

      class NoRunningConfigurationRecorderException < ServiceError
      end

      # The specified Amazon S3 bucket does not exist.

      class NoSuchBucketException < ServiceError
      end

      # The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule,
      # that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying
      # again.

      class NoSuchConfigRuleException < ServiceError
      end

      # Config rule that you passed in the filter does not exist.

      class NoSuchConfigRuleInConformancePackException < ServiceError
      end

      # You have specified a configuration aggregator that does not exist.

      class NoSuchConfigurationAggregatorException < ServiceError
      end

      # You have specified a configuration recorder that does not exist.

      class NoSuchConfigurationRecorderException < ServiceError
      end

      # You specified one or more conformance packs that do not exist.

      class NoSuchConformancePackException < ServiceError
      end

      # You have specified a delivery channel that does not exist.

      class NoSuchDeliveryChannelException < ServiceError
      end

      # The Config rule in the request is not valid. Verify that the rule is an organization Config Process
      # Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used
      # before trying again.

      class NoSuchOrganizationConfigRuleException < ServiceError
      end

      # Config organization conformance pack that you passed in the filter does not exist. For
      # DeleteOrganizationConformancePack, you tried to delete an organization conformance pack that does
      # not exist.

      class NoSuchOrganizationConformancePackException < ServiceError
      end

      # You specified an Config rule without a remediation configuration.

      class NoSuchRemediationConfigurationException < ServiceError
      end

      # You tried to delete a remediation exception that does not exist.

      class NoSuchRemediationExceptionException < ServiceError
      end

      # You have specified a retention configuration that does not exist.

      class NoSuchRetentionConfigurationException < ServiceError
      end

      # For PutConfigurationAggregator API, you can see this exception for the following reasons: No
      # permission to call EnableAWSServiceAccess API The configuration aggregator cannot be updated because
      # your Amazon Web Services Organization management account or the delegated administrator role
      # changed. Delete this aggregator and create a new one with the current Amazon Web Services
      # Organization. The configuration aggregator is associated with a previous Amazon Web Services
      # Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete
      # this aggregator and create a new one with the current Amazon Web Services Organization. You are not
      # a registered delegated administrator for Config with permissions to call ListDelegatedAdministrators
      # API. Ensure that the management account registers delagated administrator for Config service
      # principal name before the delegated administrator creates an aggregator. For all
      # OrganizationConfigRule and OrganizationConformancePack APIs, Config throws an exception if APIs are
      # called from member accounts. All APIs must be called from organization management account.

      class OrganizationAccessDeniedException < ServiceError
      end

      # Config resource cannot be created because your organization does not have all features enabled.

      class OrganizationAllFeaturesNotEnabledException < ServiceError
      end

      # You have specified a template that is not valid or supported.

      class OrganizationConformancePackTemplateValidationException < ServiceError
      end

      # The configuration item size is outside the allowable range.

      class OversizedConfigurationItemException < ServiceError
      end

      # Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems
      # Manager or wait and try again later.

      class RemediationInProgressException < ServiceError
      end

      # Two users are trying to modify the same query at the same time. Wait for a moment and try again.

      class ResourceConcurrentModificationException < ServiceError
      end

      # You see this exception in the following cases: For DeleteConfigRule, Config is deleting this rule.
      # Try your request again later. For DeleteConfigRule, the rule is deleting your evaluation results.
      # Try your request again later. For DeleteConfigRule, a remediation action is associated with the rule
      # and Config cannot delete this rule. Delete the remediation action associated with the rule before
      # deleting the rule and try your request again later. For PutConfigOrganizationRule, organization
      # Config rule deletion is in progress. Try your request again later. For DeleteOrganizationConfigRule,
      # organization Config rule creation is in progress. Try your request again later. For
      # PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and
      # deletion is in progress. Try your request again later. For DeleteConformancePack, a conformance pack
      # creation, update, and deletion is in progress. Try your request again later.

      class ResourceInUseException < ServiceError
      end

      # You have specified a resource that is either unknown or has not been discovered.

      class ResourceNotDiscoveredException < ServiceError
      end

      # You have specified a resource that does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # You have reached the limit of the number of tags you can use. For more information, see Service
      # Limits in the Config Developer Guide .

      class TooManyTagsException < ServiceError
      end

      # The requested operation is not valid. For PutConfigurationRecorder , you will see this exception
      # because you cannot use this operation to create a service-linked configuration recorder. Use the
      # PutServiceLinkedConfigurationRecorder operation to create a service-linked configuration recorder.
      # For DeleteConfigurationRecorder , you will see this exception because you cannot use this operation
      # to delete a service-linked configuration recorder. Use the DeleteServiceLinkedConfigurationRecorder
      # operation to delete a service-linked configuration recorder. For StartConfigurationRecorder and
      # StopConfigurationRecorder , you will see this exception because these operations do not affect
      # service-linked configuration recorders. Service-linked configuration recorders are always recording.
      # To stop recording, you must delete the service-linked configuration recorder. Use the
      # DeleteServiceLinkedConfigurationRecorder operation to delete a service-linked configuration
      # recorder.

      class UnmodifiableEntityException < ServiceError
      end

      # The requested operation is not valid. You will see this exception if there are missing required
      # fields or if the input value fails the validation. For PutStoredQuery , one of the following errors:
      # There are missing required fields. The input value fails the validation. You are trying to create
      # more than 300 queries. For DescribeConfigurationRecorders and DescribeConfigurationRecorderStatus ,
      # one of the following errors: You have specified more than one configuration recorder. You have
      # provided a service principal for service-linked configuration recorder that is not valid. For
      # AssociateResourceTypes and DisassociateResourceTypes , one of the following errors: Your
      # configuraiton recorder has a recording strategy that does not allow the association or
      # disassociation of resource types. One or more of the specified resource types are already associated
      # or disassociated with the configuration recorder. For service-linked configuration recorders, the
      # configuration recorder does not record one or more of the specified resource types.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "ConformancePackTemplateValidationException"
          ConformancePackTemplateValidationException.new(message)
        when "IdempotentParameterMismatch"
          IdempotentParameterMismatch.new(message)
        when "InsufficientDeliveryPolicyException"
          InsufficientDeliveryPolicyException.new(message)
        when "InsufficientPermissionsException"
          InsufficientPermissionsException.new(message)
        when "InvalidConfigurationRecorderNameException"
          InvalidConfigurationRecorderNameException.new(message)
        when "InvalidDeliveryChannelNameException"
          InvalidDeliveryChannelNameException.new(message)
        when "InvalidExpressionException"
          InvalidExpressionException.new(message)
        when "InvalidLimitException"
          InvalidLimitException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRecordingGroupException"
          InvalidRecordingGroupException.new(message)
        when "InvalidResultTokenException"
          InvalidResultTokenException.new(message)
        when "InvalidRoleException"
          InvalidRoleException.new(message)
        when "InvalidS3KeyPrefixException"
          InvalidS3KeyPrefixException.new(message)
        when "InvalidS3KmsKeyArnException"
          InvalidS3KmsKeyArnException.new(message)
        when "InvalidSNSTopicARNException"
          InvalidSNSTopicARNException.new(message)
        when "InvalidTimeRangeException"
          InvalidTimeRangeException.new(message)
        when "LastDeliveryChannelDeleteFailedException"
          LastDeliveryChannelDeleteFailedException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MaxActiveResourcesExceededException"
          MaxActiveResourcesExceededException.new(message)
        when "MaxNumberOfConfigRulesExceededException"
          MaxNumberOfConfigRulesExceededException.new(message)
        when "MaxNumberOfConfigurationRecordersExceededException"
          MaxNumberOfConfigurationRecordersExceededException.new(message)
        when "MaxNumberOfConformancePacksExceededException"
          MaxNumberOfConformancePacksExceededException.new(message)
        when "MaxNumberOfDeliveryChannelsExceededException"
          MaxNumberOfDeliveryChannelsExceededException.new(message)
        when "MaxNumberOfOrganizationConfigRulesExceededException"
          MaxNumberOfOrganizationConfigRulesExceededException.new(message)
        when "MaxNumberOfOrganizationConformancePacksExceededException"
          MaxNumberOfOrganizationConformancePacksExceededException.new(message)
        when "MaxNumberOfRetentionConfigurationsExceededException"
          MaxNumberOfRetentionConfigurationsExceededException.new(message)
        when "NoAvailableConfigurationRecorderException"
          NoAvailableConfigurationRecorderException.new(message)
        when "NoAvailableDeliveryChannelException"
          NoAvailableDeliveryChannelException.new(message)
        when "NoAvailableOrganizationException"
          NoAvailableOrganizationException.new(message)
        when "NoRunningConfigurationRecorderException"
          NoRunningConfigurationRecorderException.new(message)
        when "NoSuchBucketException"
          NoSuchBucketException.new(message)
        when "NoSuchConfigRuleException"
          NoSuchConfigRuleException.new(message)
        when "NoSuchConfigRuleInConformancePackException"
          NoSuchConfigRuleInConformancePackException.new(message)
        when "NoSuchConfigurationAggregatorException"
          NoSuchConfigurationAggregatorException.new(message)
        when "NoSuchConfigurationRecorderException"
          NoSuchConfigurationRecorderException.new(message)
        when "NoSuchConformancePackException"
          NoSuchConformancePackException.new(message)
        when "NoSuchDeliveryChannelException"
          NoSuchDeliveryChannelException.new(message)
        when "NoSuchOrganizationConfigRuleException"
          NoSuchOrganizationConfigRuleException.new(message)
        when "NoSuchOrganizationConformancePackException"
          NoSuchOrganizationConformancePackException.new(message)
        when "NoSuchRemediationConfigurationException"
          NoSuchRemediationConfigurationException.new(message)
        when "NoSuchRemediationExceptionException"
          NoSuchRemediationExceptionException.new(message)
        when "NoSuchRetentionConfigurationException"
          NoSuchRetentionConfigurationException.new(message)
        when "OrganizationAccessDeniedException"
          OrganizationAccessDeniedException.new(message)
        when "OrganizationAllFeaturesNotEnabledException"
          OrganizationAllFeaturesNotEnabledException.new(message)
        when "OrganizationConformancePackTemplateValidationException"
          OrganizationConformancePackTemplateValidationException.new(message)
        when "OversizedConfigurationItemException"
          OversizedConfigurationItemException.new(message)
        when "RemediationInProgressException"
          RemediationInProgressException.new(message)
        when "ResourceConcurrentModificationException"
          ResourceConcurrentModificationException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotDiscoveredException"
          ResourceNotDiscoveredException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnmodifiableEntityException"
          UnmodifiableEntityException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
