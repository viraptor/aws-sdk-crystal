module AwsSdk
  module SNS
    module Errors
      class ServiceError < Exception
      end

      # Indicates that the user has been denied access to the requested resource.
      class AuthorizationErrorException < ServiceError
      end

      # Two or more batch entries in the request have the same Id .
      class BatchEntryIdsNotDistinctException < ServiceError
      end

      # The length of all the batch messages put together is more than the limit.
      class BatchRequestTooLongException < ServiceError
      end

      # Can't perform multiple operations on a tag simultaneously. Perform the operations sequentially.
      class ConcurrentAccessException < ServiceError
      end

      # The batch request doesn't contain any entries.
      class EmptyBatchRequestException < ServiceError
      end

      # Exception error indicating endpoint disabled.
      class EndpointDisabledException < ServiceError
      end

      # Indicates that the number of filter polices in your Amazon Web Services account exceeds the limit.
      # To add more filter polices, submit an Amazon SNS Limit Increase case in the Amazon Web
      # ServicesSupport Center.
      class FilterPolicyLimitExceededException < ServiceError
      end

      # Indicates an internal service error.
      class InternalErrorException < ServiceError
      end

      # The Id of a batch entry in a batch request doesn't abide by the specification.
      class InvalidBatchEntryIdException < ServiceError
      end

      # Indicates that a request parameter does not comply with the associated constraints.
      class InvalidParameterException < ServiceError
      end

      # Indicates that a request parameter does not comply with the associated constraints.
      class InvalidParameterValueException < ServiceError
      end

      # The credential signature isn't valid. You must use an HTTPS endpoint and sign your request using
      # Signature Version 4.
      class InvalidSecurityException < ServiceError
      end

      # Indicates that the specified state is not a valid state for an event source.
      class InvalidStateException < ServiceError
      end

      # The ciphertext references a key that doesn't exist or that you don't have access to.
      class KMSAccessDeniedException < ServiceError
      end

      # The request was rejected because the specified Amazon Web Services KMS key isn't enabled.
      class KMSDisabledException < ServiceError
      end

      # The request was rejected because the state of the specified resource isn't valid for this request.
      # For more information, see Key states of Amazon Web Services KMS keys in the Key Management Service
      # Developer Guide .
      class KMSInvalidStateException < ServiceError
      end

      # The request was rejected because the specified entity or resource can't be found.
      class KMSNotFoundException < ServiceError
      end

      # The Amazon Web Services access key ID needs a subscription for the service.
      class KMSOptInRequired < ServiceError
      end

      # The request was denied due to request throttling. For more information about throttling, see Limits
      # in the Key Management Service Developer Guide.
      class KMSThrottlingException < ServiceError
      end

      # Indicates that the requested resource does not exist.
      class NotFoundException < ServiceError
      end

      # Indicates that the specified phone number opted out of receiving SMS messages from your Amazon Web
      # Services account. You can't send SMS messages to phone numbers that opt out.
      class OptedOutException < ServiceError
      end

      # Exception error indicating platform application disabled.
      class PlatformApplicationDisabledException < ServiceError
      end

      # Indicates that the request parameter has exceeded the maximum number of concurrent message replays.
      class ReplayLimitExceededException < ServiceError
      end

      # Can’t perform the action on the specified resource. Make sure that the resource exists.
      class ResourceNotFoundException < ServiceError
      end

      # A tag has been added to a resource with the same ARN as a deleted resource. Wait a short while and
      # then retry the operation.
      class StaleTagException < ServiceError
      end

      # Indicates that the customer already owns the maximum allowed number of subscriptions.
      class SubscriptionLimitExceededException < ServiceError
      end

      # Can't add more than 50 tags to a topic.
      class TagLimitExceededException < ServiceError
      end

      # The request doesn't comply with the IAM tag policy. Correct your request and then retry it.
      class TagPolicyException < ServiceError
      end

      # Indicates that the rate at which requests have been submitted for this action exceeds the limit for
      # your Amazon Web Services account.
      class ThrottledException < ServiceError
      end

      # The batch request contains more entries than permissible (more than 10).
      class TooManyEntriesInBatchRequestException < ServiceError
      end

      # Indicates that the customer already owns the maximum allowed number of topics.
      class TopicLimitExceededException < ServiceError
      end

      # Indicates that a request parameter does not comply with the associated constraints.
      class UserErrorException < ServiceError
      end

      # Indicates that a parameter in the request is invalid.
      class ValidationException < ServiceError
      end

      # Indicates that the one-time password (OTP) used for verification is invalid.
      class VerificationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AuthorizationErrorException"
          AuthorizationErrorException.new(message)
        when "BatchEntryIdsNotDistinctException"
          BatchEntryIdsNotDistinctException.new(message)
        when "BatchRequestTooLongException"
          BatchRequestTooLongException.new(message)
        when "ConcurrentAccessException"
          ConcurrentAccessException.new(message)
        when "EmptyBatchRequestException"
          EmptyBatchRequestException.new(message)
        when "EndpointDisabledException"
          EndpointDisabledException.new(message)
        when "FilterPolicyLimitExceededException"
          FilterPolicyLimitExceededException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidBatchEntryIdException"
          InvalidBatchEntryIdException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidSecurityException"
          InvalidSecurityException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "KMSAccessDeniedException"
          KMSAccessDeniedException.new(message)
        when "KMSDisabledException"
          KMSDisabledException.new(message)
        when "KMSInvalidStateException"
          KMSInvalidStateException.new(message)
        when "KMSNotFoundException"
          KMSNotFoundException.new(message)
        when "KMSOptInRequired"
          KMSOptInRequired.new(message)
        when "KMSThrottlingException"
          KMSThrottlingException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "OptedOutException"
          OptedOutException.new(message)
        when "PlatformApplicationDisabledException"
          PlatformApplicationDisabledException.new(message)
        when "ReplayLimitExceededException"
          ReplayLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "StaleTagException"
          StaleTagException.new(message)
        when "SubscriptionLimitExceededException"
          SubscriptionLimitExceededException.new(message)
        when "TagLimitExceededException"
          TagLimitExceededException.new(message)
        when "TagPolicyException"
          TagPolicyException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        when "TooManyEntriesInBatchRequestException"
          TooManyEntriesInBatchRequestException.new(message)
        when "TopicLimitExceededException"
          TopicLimitExceededException.new(message)
        when "UserErrorException"
          UserErrorException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "VerificationException"
          VerificationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
