module AwsSdk
  module SecretsManager
    module Errors
      class ServiceError < Exception
      end

      # Secrets Manager can't decrypt the protected secret text using the provided KMS key.
      class DecryptionFailure < ServiceError
      end

      # Secrets Manager can't encrypt the protected secret text using the provided KMS key. Check that the
      # KMS key is available, enabled, and not in an invalid state. For more information, see Key state:
      # Effect on your KMS key .
      class EncryptionFailure < ServiceError
      end

      # An error occurred on the server side.
      class InternalServiceError < ServiceError
      end

      # The NextToken value is invalid.
      class InvalidNextTokenException < ServiceError
      end

      # The parameter name or value is invalid.
      class InvalidParameterException < ServiceError
      end

      # A parameter value is not valid for the current state of the resource. Possible causes: The secret is
      # scheduled for deletion. You tried to enable rotation on a secret that doesn't already have a Lambda
      # function ARN configured and you didn't include such an ARN as a parameter in this call. The secret
      # is managed by another service, and you must use that service to update it. For more information, see
      # Secrets managed by other Amazon Web Services services .
      class InvalidRequestException < ServiceError
      end

      # The request failed because it would exceed one of the Secrets Manager quotas.
      class LimitExceededException < ServiceError
      end

      # The resource policy has syntax errors.
      class MalformedPolicyDocumentException < ServiceError
      end

      # The request failed because you did not complete all the prerequisite steps.
      class PreconditionNotMetException < ServiceError
      end

      # The BlockPublicPolicy parameter is set to true, and the resource policy did not prevent broad access
      # to the secret.
      class PublicPolicyException < ServiceError
      end

      # A resource with the ID you requested already exists.
      class ResourceExistsException < ServiceError
      end

      # Secrets Manager can't find the resource that you asked for.
      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DecryptionFailure"
          DecryptionFailure.new(message)
        when "EncryptionFailure"
          EncryptionFailure.new(message)
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MalformedPolicyDocumentException"
          MalformedPolicyDocumentException.new(message)
        when "PreconditionNotMetException"
          PreconditionNotMetException.new(message)
        when "PublicPolicyException"
          PublicPolicyException.new(message)
        when "ResourceExistsException"
          ResourceExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
