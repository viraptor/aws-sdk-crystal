module AwsSdk
  module SQS
    module Errors
      class ServiceError < Exception
      end

      # Two or more batch entries in the request have the same Id .
      class BatchEntryIdsNotDistinct < ServiceError
      end

      # The length of all the messages put together is more than the limit.
      class BatchRequestTooLong < ServiceError
      end

      # The batch request doesn't contain any entries.
      class EmptyBatchRequest < ServiceError
      end

      # The specified ID is invalid.
      class InvalidAddress < ServiceError
      end

      # The specified attribute doesn't exist.
      class InvalidAttributeName < ServiceError
      end

      # A queue attribute value is invalid.
      class InvalidAttributeValue < ServiceError
      end

      # The Id of a batch entry in a batch request doesn't abide by the specification.
      class InvalidBatchEntryId < ServiceError
      end

      # The specified receipt handle isn't valid for the current version.
      class InvalidIdFormat < ServiceError
      end

      # The message contains characters outside the allowed set.
      class InvalidMessageContents < ServiceError
      end

      # The request was not made over HTTPS or did not use SigV4 for signing.
      class InvalidSecurity < ServiceError
      end

      # The caller doesn't have the required KMS access.
      class KmsAccessDenied < ServiceError
      end

      # The request was denied due to request throttling.
      class KmsDisabled < ServiceError
      end

      # The request was rejected for one of the following reasons: The KeyUsage value of the KMS key is
      # incompatible with the API operation. The encryption algorithm or signing algorithm specified for the
      # operation is incompatible with the type of key material in the KMS key (KeySpec).
      class KmsInvalidKeyUsage < ServiceError
      end

      # The request was rejected because the state of the specified resource is not valid for this request.
      class KmsInvalidState < ServiceError
      end

      # The request was rejected because the specified entity or resource could not be found.
      class KmsNotFound < ServiceError
      end

      # The request was rejected because the specified key policy isn't syntactically or semantically
      # correct.
      class KmsOptInRequired < ServiceError
      end

      # Amazon Web Services KMS throttles requests for the following conditions.
      class KmsThrottled < ServiceError
      end

      # The specified message isn't in flight.
      class MessageNotInflight < ServiceError
      end

      # The specified action violates a limit. For example, ReceiveMessage returns this error if the maximum
      # number of in flight messages is reached and AddPermission returns this error if the maximum number
      # of permissions for the queue is reached.
      class OverLimit < ServiceError
      end

      # Indicates that the specified queue previously received a PurgeQueue request within the last 60
      # seconds (the time it can take to delete the messages in the queue).
      class PurgeQueueInProgress < ServiceError
      end

      # You must wait 60 seconds after deleting a queue before you can create another queue with the same
      # name.
      class QueueDeletedRecently < ServiceError
      end

      # Ensure that the QueueUrl is correct and that the queue has not been deleted.
      class QueueDoesNotExist < ServiceError
      end

      # A queue with this name already exists. Amazon SQS returns this error only if the request includes
      # attributes whose values differ from those of the existing queue.
      class QueueNameExists < ServiceError
      end

      # The specified receipt handle isn't valid.
      class ReceiptHandleIsInvalid < ServiceError
      end

      # The request was denied due to request throttling. Exceeds the permitted request rate for the queue
      # or for the recipient of the request. Ensure that the request rate is within the Amazon SQS limits
      # for sending messages. For more information, see Amazon SQS quotas in the Amazon SQS Developer Guide
      # .
      class RequestThrottled < ServiceError
      end

      # One or more specified resources don't exist.
      class ResourceNotFoundException < ServiceError
      end

      # The batch request contains more entries than permissible. For Amazon SQS, the maximum number of
      # entries you can include in a single SendMessageBatch , DeleteMessageBatch , or
      # ChangeMessageVisibilityBatch request is 10.
      class TooManyEntriesInBatchRequest < ServiceError
      end

      # Error code 400. Unsupported operation.
      class UnsupportedOperation < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BatchEntryIdsNotDistinct"
          BatchEntryIdsNotDistinct.new(message)
        when "BatchRequestTooLong"
          BatchRequestTooLong.new(message)
        when "EmptyBatchRequest"
          EmptyBatchRequest.new(message)
        when "InvalidAddress"
          InvalidAddress.new(message)
        when "InvalidAttributeName"
          InvalidAttributeName.new(message)
        when "InvalidAttributeValue"
          InvalidAttributeValue.new(message)
        when "InvalidBatchEntryId"
          InvalidBatchEntryId.new(message)
        when "InvalidIdFormat"
          InvalidIdFormat.new(message)
        when "InvalidMessageContents"
          InvalidMessageContents.new(message)
        when "InvalidSecurity"
          InvalidSecurity.new(message)
        when "KmsAccessDenied"
          KmsAccessDenied.new(message)
        when "KmsDisabled"
          KmsDisabled.new(message)
        when "KmsInvalidKeyUsage"
          KmsInvalidKeyUsage.new(message)
        when "KmsInvalidState"
          KmsInvalidState.new(message)
        when "KmsNotFound"
          KmsNotFound.new(message)
        when "KmsOptInRequired"
          KmsOptInRequired.new(message)
        when "KmsThrottled"
          KmsThrottled.new(message)
        when "MessageNotInflight"
          MessageNotInflight.new(message)
        when "OverLimit"
          OverLimit.new(message)
        when "PurgeQueueInProgress"
          PurgeQueueInProgress.new(message)
        when "QueueDeletedRecently"
          QueueDeletedRecently.new(message)
        when "QueueDoesNotExist"
          QueueDoesNotExist.new(message)
        when "QueueNameExists"
          QueueNameExists.new(message)
        when "ReceiptHandleIsInvalid"
          ReceiptHandleIsInvalid.new(message)
        when "RequestThrottled"
          RequestThrottled.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyEntriesInBatchRequest"
          TooManyEntriesInBatchRequest.new(message)
        when "UnsupportedOperation"
          UnsupportedOperation.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
