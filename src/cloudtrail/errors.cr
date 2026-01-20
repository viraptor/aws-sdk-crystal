module Aws
  module CloudTrail
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # This exception is thrown when you start a new import and a previous import is still in progress.

      class AccountHasOngoingImportException < ServiceError
      end

      # This exception is thrown when the specified account is not found or not part of an organization.

      class AccountNotFoundException < ServiceError
      end

      # This exception is thrown when the specified account is not registered as the CloudTrail delegated
      # administrator.

      class AccountNotRegisteredException < ServiceError
      end

      # This exception is thrown when the account is already registered as the CloudTrail delegated
      # administrator.

      class AccountRegisteredException < ServiceError
      end

      # This exception is thrown when the management account of an organization is registered as the
      # CloudTrail delegated administrator.

      class CannotDelegateManagementAccountException < ServiceError
      end

      # This exception is thrown when the specified value of ChannelARN is not valid.

      class ChannelARNInvalidException < ServiceError
      end

      # This exception is thrown when the provided channel already exists.

      class ChannelAlreadyExistsException < ServiceError
      end

      # This exception is thrown when the specified event data store cannot yet be deleted because it is in
      # use by a channel.

      class ChannelExistsForEDSException < ServiceError
      end

      # This exception is thrown when the maximum number of channels limit is exceeded.

      class ChannelMaxLimitExceededException < ServiceError
      end

      # This exception is thrown when CloudTrail cannot find the specified channel.

      class ChannelNotFoundException < ServiceError
      end

      # This exception is thrown when an operation is called with an ARN that is not valid. The following is
      # the format of a trail ARN: arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail The following is
      # the format of an event data store ARN:
      # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE The
      # following is the format of a dashboard ARN:
      # arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash The following is the format of a
      # channel ARN: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

      class CloudTrailARNInvalidException < ServiceError
      end

      # This exception is thrown when trusted access has not been enabled between CloudTrail and
      # Organizations. For more information, see How to enable or disable trusted access in the
      # Organizations User Guide and Prepare For Creating a Trail For Your Organization in the CloudTrail
      # User Guide .

      class CloudTrailAccessNotEnabledException < ServiceError
      end

      # This exception is thrown when a call results in the InvalidClientTokenId error code. This can occur
      # when you are creating or updating a trail to send notifications to an Amazon SNS topic that is in a
      # suspended Amazon Web Services account.

      class CloudTrailInvalidClientTokenIdException < ServiceError
      end

      # Cannot set a CloudWatch Logs delivery for this Region.

      class CloudWatchLogsDeliveryUnavailableException < ServiceError
      end

      # You are trying to update a resource when another request is in progress. Allow sufficient wait time
      # for the previous request to complete, then retry your request.

      class ConcurrentModificationException < ServiceError
      end

      # This exception is thrown when the specified resource is not ready for an operation. This can occur
      # when you try to run an operation on a resource before CloudTrail has time to fully load the
      # resource, or because another operation is modifying the resource. If this exception occurs, wait a
      # few minutes, and then try the operation again.

      class ConflictException < ServiceError
      end

      # This exception is thrown when the maximum number of CloudTrail delegated administrators is reached.

      class DelegatedAdminAccountLimitExceededException < ServiceError
      end

      # The specified event data store ARN is not valid or does not map to an event data store in your
      # account.

      class EventDataStoreARNInvalidException < ServiceError
      end

      # An event data store with that name already exists.

      class EventDataStoreAlreadyExistsException < ServiceError
      end

      # You cannot delete the event data store because Lake query federation is enabled. To delete the event
      # data store, run the DisableFederation operation to disable Lake query federation on the event data
      # store.

      class EventDataStoreFederationEnabledException < ServiceError
      end

      # This exception is thrown when you try to update or delete an event data store that currently has an
      # import in progress.

      class EventDataStoreHasOngoingImportException < ServiceError
      end

      # Your account has used the maximum number of event data stores.

      class EventDataStoreMaxLimitExceededException < ServiceError
      end

      # The specified event data store was not found.

      class EventDataStoreNotFoundException < ServiceError
      end

      # The event data store cannot be deleted because termination protection is enabled for it.

      class EventDataStoreTerminationProtectedException < ServiceError
      end

      # This exception is thrown when a valid query could not be generated for the provided prompt.

      class GenerateResponseException < ServiceError
      end

      # The specified import was not found.

      class ImportNotFoundException < ServiceError
      end

      # The event data store is inactive.

      class InactiveEventDataStoreException < ServiceError
      end

      # The specified query cannot be canceled because it is in the FINISHED , FAILED , TIMED_OUT , or
      # CANCELLED state.

      class InactiveQueryException < ServiceError
      end

      # If you run GetInsightSelectors on a trail or event data store that does not have Insights events
      # enabled, the operation throws the exception InsightNotEnabledException .

      class InsightNotEnabledException < ServiceError
      end

      # This exception is thrown when the IAM identity that is used to create the organization resource
      # lacks one or more required permissions for creating an organization resource in a required service.

      class InsufficientDependencyServiceAccessPermissionException < ServiceError
      end

      # For the CreateTrail PutInsightSelectors , UpdateTrail , StartQuery , and StartImport operations,
      # this exception is thrown when the policy on the S3 bucket or KMS key does not have sufficient
      # permissions for the operation. For all other operations, this exception is thrown when the policy
      # for the KMS key does not have sufficient permissions for the operation.

      class InsufficientEncryptionPolicyException < ServiceError
      end

      # The task can't be completed because you are signed in with an account that lacks permissions to view
      # or create a service-linked role. Sign in with an account that has the required permissions and then
      # try again.

      class InsufficientIAMAccessPermissionException < ServiceError
      end

      # This exception is thrown when the policy on the S3 bucket is not sufficient.

      class InsufficientS3BucketPolicyException < ServiceError
      end

      # This exception is thrown when the policy on the Amazon SNS topic is not sufficient.

      class InsufficientSnsTopicPolicyException < ServiceError
      end

      # This exception is thrown when the provided CloudWatch Logs log group is not valid.

      class InvalidCloudWatchLogsLogGroupArnException < ServiceError
      end

      # This exception is thrown when the provided role is not valid.

      class InvalidCloudWatchLogsRoleArnException < ServiceError
      end

      # A date range for the query was specified that is not valid. Be sure that the start time is
      # chronologically before the end time. For more information about writing a query, see Create or edit
      # a query in the CloudTrail User Guide .

      class InvalidDateRangeException < ServiceError
      end

      # Occurs if an event category that is not valid is specified as a value of EventCategory .

      class InvalidEventCategoryException < ServiceError
      end

      # This exception is thrown when event categories of specified event data stores are not valid.

      class InvalidEventDataStoreCategoryException < ServiceError
      end

      # The event data store is not in a status that supports the operation.

      class InvalidEventDataStoreStatusException < ServiceError
      end

      # This exception is thrown when the PutEventSelectors operation is called with a number of event
      # selectors, advanced event selectors, or data resources that is not valid. The combination of event
      # selectors or advanced event selectors and data resources is not valid. A trail can have up to 5
      # event selectors. If a trail uses advanced event selectors, a maximum of 500 total values for all
      # conditions in all advanced event selectors is allowed. A trail is limited to 250 data resources.
      # These data resources can be distributed across event selectors, but the overall total cannot exceed
      # 250. You can: Specify a valid number of event selectors (1 to 5) for a trail. Specify a valid number
      # of data resources (1 to 250) for an event selector. The limit of number of resources on an
      # individual event selector is configurable up to 250. However, this upper limit is allowed only if
      # the total number of data resources does not exceed 250 across all event selectors for a trail.
      # Specify up to 500 values for all conditions in all advanced event selectors for a trail. Specify a
      # valid value for a parameter. For example, specifying the ReadWriteType parameter with a value of
      # read-only is not valid.

      class InvalidEventSelectorsException < ServiceError
      end

      # This exception is thrown when an operation is called on a trail from a Region other than the Region
      # in which the trail was created.

      class InvalidHomeRegionException < ServiceError
      end

      # This exception is thrown when the provided source S3 bucket is not valid for import.

      class InvalidImportSourceException < ServiceError
      end

      # For PutInsightSelectors , this exception is thrown when the formatting or syntax of the
      # InsightSelectors JSON statement is not valid, or the specified InsightType in the InsightSelectors
      # statement is not valid. Valid values for InsightType are ApiCallRateInsight and ApiErrorRateInsight
      # . To enable Insights on an event data store, the destination event data store specified by the
      # InsightsDestination parameter must log Insights events and the source event data store specified by
      # the EventDataStore parameter must log management events. For UpdateEventDataStore , this exception
      # is thrown if Insights are enabled on the event data store and the updated advanced event selectors
      # are not compatible with the configured InsightSelectors . If the InsightSelectors includes an
      # InsightType of ApiCallRateInsight , the source event data store must log write management events. If
      # the InsightSelectors includes an InsightType of ApiErrorRateInsight , the source event data store
      # must log management events.

      class InvalidInsightSelectorsException < ServiceError
      end

      # This exception is thrown when the KMS key ARN is not valid.

      class InvalidKmsKeyIdException < ServiceError
      end

      # Occurs when a lookup attribute is specified that is not valid.

      class InvalidLookupAttributesException < ServiceError
      end

      # This exception is thrown if the limit specified is not valid.

      class InvalidMaxResultsException < ServiceError
      end

      # A token that is not valid, or a token that was previously used in a request with different
      # parameters. This exception is thrown if the token is not valid.

      class InvalidNextTokenException < ServiceError
      end

      # This exception is thrown when the combination of parameters provided is not valid.

      class InvalidParameterCombinationException < ServiceError
      end

      # The request includes a parameter that is not valid.

      class InvalidParameterException < ServiceError
      end

      # The query that was submitted has validation errors, or uses incorrect syntax or unsupported
      # keywords. For more information about writing a query, see Create or edit a query in the CloudTrail
      # User Guide .

      class InvalidQueryStatementException < ServiceError
      end

      # The query status is not valid for the operation.

      class InvalidQueryStatusException < ServiceError
      end

      # This exception is thrown when the provided S3 bucket name is not valid.

      class InvalidS3BucketNameException < ServiceError
      end

      # This exception is thrown when the provided S3 prefix is not valid.

      class InvalidS3PrefixException < ServiceError
      end

      # This exception is thrown when the provided SNS topic name is not valid.

      class InvalidSnsTopicNameException < ServiceError
      end

      # This exception is thrown when the specified value of Source is not valid.

      class InvalidSourceException < ServiceError
      end

      # This exception is thrown when the specified tag key or values are not valid. It can also occur if
      # there are duplicate tags or too many tags on the resource.

      class InvalidTagParameterException < ServiceError
      end

      # Occurs if the timestamp values are not valid. Either the start time occurs after the end time, or
      # the time range is outside the range of possible values.

      class InvalidTimeRangeException < ServiceError
      end

      # Reserved for future use.

      class InvalidTokenException < ServiceError
      end

      # This exception is thrown when the provided trail name is not valid. Trail names must meet the
      # following requirements: Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.),
      # underscores (_), or dashes (-) Start with a letter or number, and end with a letter or number Be
      # between 3 and 128 characters Have no adjacent periods, underscores or dashes. Names like
      # my-_namespace and my--namespace are not valid. Not be in IP address format (for example,
      # 192.168.5.4)

      class InvalidTrailNameException < ServiceError
      end

      # This exception is thrown when there is an issue with the specified KMS key and the trail or event
      # data store can't be updated.

      class KmsException < ServiceError
      end

      # This exception is no longer in use.

      class KmsKeyDisabledException < ServiceError
      end

      # This exception is thrown when the KMS key does not exist, when the S3 bucket and the KMS key are not
      # in the same Region, or when the KMS key associated with the Amazon SNS topic either does not exist
      # or is not in the same Region.

      class KmsKeyNotFoundException < ServiceError
      end

      # You are already running the maximum number of concurrent queries. The maximum number of concurrent
      # queries is 10. Wait a minute for some queries to finish, and then run the query again.

      class MaxConcurrentQueriesException < ServiceError
      end

      # This exception is thrown when the maximum number of trails is reached.

      class MaximumNumberOfTrailsExceededException < ServiceError
      end

      # This exception is thrown when the management account does not have a service-linked role.

      class NoManagementAccountSLRExistsException < ServiceError
      end

      # This exception is thrown when the account making the request is not the organization's management
      # account.

      class NotOrganizationManagementAccountException < ServiceError
      end

      # This exception is thrown when the Amazon Web Services account making the request to create or update
      # an organization trail or event data store is not the management account for an organization in
      # Organizations. For more information, see Prepare For Creating a Trail For Your Organization or
      # Organization event data stores .

      class NotOrganizationMasterAccountException < ServiceError
      end

      # This exception is thrown when the requested operation is not permitted.

      class OperationNotPermittedException < ServiceError
      end

      # This exception is thrown when Organizations is not configured to support all features. All features
      # must be enabled in Organizations to support creating an organization trail or event data store.

      class OrganizationNotInAllFeaturesModeException < ServiceError
      end

      # This exception is thrown when the request is made from an Amazon Web Services account that is not a
      # member of an organization. To make this request, sign in using the credentials of an account that
      # belongs to an organization.

      class OrganizationsNotInUseException < ServiceError
      end

      # The query ID does not exist or does not map to a query.

      class QueryIdNotFoundException < ServiceError
      end

      # This exception is thrown when the provided resource does not exist, or the ARN format of the
      # resource is not valid. The following is the format of an event data store ARN:
      # arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE The
      # following is the format of a dashboard ARN:
      # arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash The following is the format of a
      # channel ARN: arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890

      class ResourceARNNotValidException < ServiceError
      end

      # This exception is thrown when the specified resource is not found.

      class ResourceNotFoundException < ServiceError
      end

      # This exception is thrown when the specified resource policy is not found.

      class ResourcePolicyNotFoundException < ServiceError
      end

      # This exception is thrown when the resouce-based policy has syntax errors, or contains a principal
      # that is not valid.

      class ResourcePolicyNotValidException < ServiceError
      end

      # This exception is thrown when the specified resource type is not supported by CloudTrail.

      class ResourceTypeNotSupportedException < ServiceError
      end

      # This exception is thrown when the specified S3 bucket does not exist.

      class S3BucketDoesNotExistException < ServiceError
      end

      # This exception is thrown when the quota is exceeded. For information about CloudTrail quotas, see
      # Service quotas in the Amazon Web Services General Reference .

      class ServiceQuotaExceededException < ServiceError
      end

      # The number of tags per trail, event data store, dashboard, or channel has exceeded the permitted
      # amount. Currently, the limit is 50.

      class TagsLimitExceededException < ServiceError
      end

      # This exception is thrown when the request rate exceeds the limit.

      class ThrottlingException < ServiceError
      end

      # This exception is thrown when the specified trail already exists.

      class TrailAlreadyExistsException < ServiceError
      end

      # This exception is thrown when the trail with the given name is not found.

      class TrailNotFoundException < ServiceError
      end

      # This exception is no longer in use.

      class TrailNotProvidedException < ServiceError
      end

      # This exception is thrown when the requested operation is not supported.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AccountHasOngoingImportException"
          AccountHasOngoingImportException.new(message)
        when "AccountNotFoundException"
          AccountNotFoundException.new(message)
        when "AccountNotRegisteredException"
          AccountNotRegisteredException.new(message)
        when "AccountRegisteredException"
          AccountRegisteredException.new(message)
        when "CannotDelegateManagementAccountException"
          CannotDelegateManagementAccountException.new(message)
        when "ChannelARNInvalidException"
          ChannelARNInvalidException.new(message)
        when "ChannelAlreadyExistsException"
          ChannelAlreadyExistsException.new(message)
        when "ChannelExistsForEDSException"
          ChannelExistsForEDSException.new(message)
        when "ChannelMaxLimitExceededException"
          ChannelMaxLimitExceededException.new(message)
        when "ChannelNotFoundException"
          ChannelNotFoundException.new(message)
        when "CloudTrailARNInvalidException"
          CloudTrailARNInvalidException.new(message)
        when "CloudTrailAccessNotEnabledException"
          CloudTrailAccessNotEnabledException.new(message)
        when "CloudTrailInvalidClientTokenIdException"
          CloudTrailInvalidClientTokenIdException.new(message)
        when "CloudWatchLogsDeliveryUnavailableException"
          CloudWatchLogsDeliveryUnavailableException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DelegatedAdminAccountLimitExceededException"
          DelegatedAdminAccountLimitExceededException.new(message)
        when "EventDataStoreARNInvalidException"
          EventDataStoreARNInvalidException.new(message)
        when "EventDataStoreAlreadyExistsException"
          EventDataStoreAlreadyExistsException.new(message)
        when "EventDataStoreFederationEnabledException"
          EventDataStoreFederationEnabledException.new(message)
        when "EventDataStoreHasOngoingImportException"
          EventDataStoreHasOngoingImportException.new(message)
        when "EventDataStoreMaxLimitExceededException"
          EventDataStoreMaxLimitExceededException.new(message)
        when "EventDataStoreNotFoundException"
          EventDataStoreNotFoundException.new(message)
        when "EventDataStoreTerminationProtectedException"
          EventDataStoreTerminationProtectedException.new(message)
        when "GenerateResponseException"
          GenerateResponseException.new(message)
        when "ImportNotFoundException"
          ImportNotFoundException.new(message)
        when "InactiveEventDataStoreException"
          InactiveEventDataStoreException.new(message)
        when "InactiveQueryException"
          InactiveQueryException.new(message)
        when "InsightNotEnabledException"
          InsightNotEnabledException.new(message)
        when "InsufficientDependencyServiceAccessPermissionException"
          InsufficientDependencyServiceAccessPermissionException.new(message)
        when "InsufficientEncryptionPolicyException"
          InsufficientEncryptionPolicyException.new(message)
        when "InsufficientIAMAccessPermissionException"
          InsufficientIAMAccessPermissionException.new(message)
        when "InsufficientS3BucketPolicyException"
          InsufficientS3BucketPolicyException.new(message)
        when "InsufficientSnsTopicPolicyException"
          InsufficientSnsTopicPolicyException.new(message)
        when "InvalidCloudWatchLogsLogGroupArnException"
          InvalidCloudWatchLogsLogGroupArnException.new(message)
        when "InvalidCloudWatchLogsRoleArnException"
          InvalidCloudWatchLogsRoleArnException.new(message)
        when "InvalidDateRangeException"
          InvalidDateRangeException.new(message)
        when "InvalidEventCategoryException"
          InvalidEventCategoryException.new(message)
        when "InvalidEventDataStoreCategoryException"
          InvalidEventDataStoreCategoryException.new(message)
        when "InvalidEventDataStoreStatusException"
          InvalidEventDataStoreStatusException.new(message)
        when "InvalidEventSelectorsException"
          InvalidEventSelectorsException.new(message)
        when "InvalidHomeRegionException"
          InvalidHomeRegionException.new(message)
        when "InvalidImportSourceException"
          InvalidImportSourceException.new(message)
        when "InvalidInsightSelectorsException"
          InvalidInsightSelectorsException.new(message)
        when "InvalidKmsKeyIdException"
          InvalidKmsKeyIdException.new(message)
        when "InvalidLookupAttributesException"
          InvalidLookupAttributesException.new(message)
        when "InvalidMaxResultsException"
          InvalidMaxResultsException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidQueryStatementException"
          InvalidQueryStatementException.new(message)
        when "InvalidQueryStatusException"
          InvalidQueryStatusException.new(message)
        when "InvalidS3BucketNameException"
          InvalidS3BucketNameException.new(message)
        when "InvalidS3PrefixException"
          InvalidS3PrefixException.new(message)
        when "InvalidSnsTopicNameException"
          InvalidSnsTopicNameException.new(message)
        when "InvalidSourceException"
          InvalidSourceException.new(message)
        when "InvalidTagParameterException"
          InvalidTagParameterException.new(message)
        when "InvalidTimeRangeException"
          InvalidTimeRangeException.new(message)
        when "InvalidTokenException"
          InvalidTokenException.new(message)
        when "InvalidTrailNameException"
          InvalidTrailNameException.new(message)
        when "KmsException"
          KmsException.new(message)
        when "KmsKeyDisabledException"
          KmsKeyDisabledException.new(message)
        when "KmsKeyNotFoundException"
          KmsKeyNotFoundException.new(message)
        when "MaxConcurrentQueriesException"
          MaxConcurrentQueriesException.new(message)
        when "MaximumNumberOfTrailsExceededException"
          MaximumNumberOfTrailsExceededException.new(message)
        when "NoManagementAccountSLRExistsException"
          NoManagementAccountSLRExistsException.new(message)
        when "NotOrganizationManagementAccountException"
          NotOrganizationManagementAccountException.new(message)
        when "NotOrganizationMasterAccountException"
          NotOrganizationMasterAccountException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "OrganizationNotInAllFeaturesModeException"
          OrganizationNotInAllFeaturesModeException.new(message)
        when "OrganizationsNotInUseException"
          OrganizationsNotInUseException.new(message)
        when "QueryIdNotFoundException"
          QueryIdNotFoundException.new(message)
        when "ResourceARNNotValidException"
          ResourceARNNotValidException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourcePolicyNotFoundException"
          ResourcePolicyNotFoundException.new(message)
        when "ResourcePolicyNotValidException"
          ResourcePolicyNotValidException.new(message)
        when "ResourceTypeNotSupportedException"
          ResourceTypeNotSupportedException.new(message)
        when "S3BucketDoesNotExistException"
          S3BucketDoesNotExistException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TagsLimitExceededException"
          TagsLimitExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TrailAlreadyExistsException"
          TrailAlreadyExistsException.new(message)
        when "TrailNotFoundException"
          TrailNotFoundException.new(message)
        when "TrailNotProvidedException"
          TrailNotProvidedException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
