module AwsSdk
  module IoT
    module Errors
      class ServiceError < Exception
      end

      # Unable to verify the CA certificate used to sign the device certificate you are attempting to
      # register. This is happens when you have registered more than one CA certificate that has the same
      # subject field and public key.
      class CertificateConflictException < ServiceError
      end

      # The certificate operation is not allowed.
      class CertificateStateException < ServiceError
      end

      # The certificate is invalid.
      class CertificateValidationException < ServiceError
      end

      # The request conflicts with the current state of the resource.
      class ConflictException < ServiceError
      end

      # A conflicting resource update exception. This exception is thrown when two pending updates cause a
      # conflict.
      class ConflictingResourceUpdateException < ServiceError
      end

      # You can't delete the resource because it is attached to one or more resources.
      class DeleteConflictException < ServiceError
      end

      # The index is not ready.
      class IndexNotReadyException < ServiceError
      end

      # An unexpected error has occurred.
      class InternalException < ServiceError
      end

      # An unexpected error has occurred.
      class InternalFailureException < ServiceError
      end

      # Internal error from the service that indicates an unexpected error or that the service is
      # unavailable.
      class InternalServerException < ServiceError
      end

      # The aggregation is invalid.
      class InvalidAggregationException < ServiceError
      end

      # The query is invalid.
      class InvalidQueryException < ServiceError
      end

      # The request is not valid.
      class InvalidRequestException < ServiceError
      end

      # The response is invalid.
      class InvalidResponseException < ServiceError
      end

      # An attempt was made to change to an invalid state, for example by deleting a job or a job execution
      # which is "IN_PROGRESS" without setting the force parameter.
      class InvalidStateTransitionException < ServiceError
      end

      # A limit has been exceeded.
      class LimitExceededException < ServiceError
      end

      # The policy documentation is not valid.
      class MalformedPolicyException < ServiceError
      end

      # The resource is not configured.
      class NotConfiguredException < ServiceError
      end

      # The registration code is invalid.
      class RegistrationCodeValidationException < ServiceError
      end

      # The resource already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The resource registration failed.
      class ResourceRegistrationFailureException < ServiceError
      end

      # Service quota has been exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The service is temporarily unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # The Rule-SQL expression can't be parsed correctly.
      class SqlParseException < ServiceError
      end

      # This exception occurs if you attempt to start a task with the same task-id as an existing task but
      # with a different clientRequestToken.
      class TaskAlreadyExistsException < ServiceError
      end

      # The rate exceeds the limit.
      class ThrottlingException < ServiceError
      end

      # You can't revert the certificate transfer because the transfer is already complete.
      class TransferAlreadyCompletedException < ServiceError
      end

      # You can't transfer the certificate because authorization policies are still attached.
      class TransferConflictException < ServiceError
      end

      # You are not authorized to perform this operation.
      class UnauthorizedException < ServiceError
      end

      # The request is not valid.
      class ValidationException < ServiceError
      end

      # An exception thrown when the version of an entity specified with the expectedVersion parameter does
      # not match the latest version in the system.
      class VersionConflictException < ServiceError
      end

      # The number of policy versions exceeds the limit.
      class VersionsLimitExceededException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CertificateConflictException"
          CertificateConflictException.new(message)
        when "CertificateStateException"
          CertificateStateException.new(message)
        when "CertificateValidationException"
          CertificateValidationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ConflictingResourceUpdateException"
          ConflictingResourceUpdateException.new(message)
        when "DeleteConflictException"
          DeleteConflictException.new(message)
        when "IndexNotReadyException"
          IndexNotReadyException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidAggregationException"
          InvalidAggregationException.new(message)
        when "InvalidQueryException"
          InvalidQueryException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidResponseException"
          InvalidResponseException.new(message)
        when "InvalidStateTransitionException"
          InvalidStateTransitionException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedPolicyException"
          MalformedPolicyException.new(message)
        when "NotConfiguredException"
          NotConfiguredException.new(message)
        when "RegistrationCodeValidationException"
          RegistrationCodeValidationException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceRegistrationFailureException"
          ResourceRegistrationFailureException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "SqlParseException"
          SqlParseException.new(message)
        when "TaskAlreadyExistsException"
          TaskAlreadyExistsException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TransferAlreadyCompletedException"
          TransferAlreadyCompletedException.new(message)
        when "TransferConflictException"
          TransferConflictException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "VersionConflictException"
          VersionConflictException.new(message)
        when "VersionsLimitExceededException"
          VersionsLimitExceededException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
