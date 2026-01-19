module AwsSdk
  module ACM
    module Errors
      class ServiceError < Exception
      end

      # You do not have access required to perform this action.
      class AccessDeniedException < ServiceError
      end

      # You are trying to update a resource or configuration that is already being created or updated. Wait
      # for the previous operation to finish and try again.
      class ConflictException < ServiceError
      end

      # One or more of request parameters specified is not valid.
      class InvalidArgsException < ServiceError
      end

      # The requested Amazon Resource Name (ARN) does not refer to an existing resource.
      class InvalidArnException < ServiceError
      end

      # One or more values in the DomainValidationOption structure is incorrect.
      class InvalidDomainValidationOptionsException < ServiceError
      end

      # An input parameter was invalid.
      class InvalidParameterException < ServiceError
      end

      # Processing has reached an invalid state.
      class InvalidStateException < ServiceError
      end

      # One or both of the values that make up the key-value pair is not valid. For example, you cannot
      # specify a tag value that begins with aws: .
      class InvalidTagException < ServiceError
      end

      # An ACM quota has been exceeded.
      class LimitExceededException < ServiceError
      end

      # The certificate request is in process and the certificate in your account has not yet been issued.
      class RequestInProgressException < ServiceError
      end

      # The certificate is in use by another Amazon Web Services service in the caller's account. Remove the
      # association and try again.
      class ResourceInUseException < ServiceError
      end

      # The specified certificate cannot be found in the caller's account or the caller's account cannot be
      # found.
      class ResourceNotFoundException < ServiceError
      end

      # A specified tag did not comply with an existing tag policy and was rejected.
      class TagPolicyException < ServiceError
      end

      # The request was denied because it exceeded a quota.
      class ThrottlingException < ServiceError
      end

      # The request contains too many tags. Try the request again with fewer tags.
      class TooManyTagsException < ServiceError
      end

      # The supplied input failed to satisfy constraints of an Amazon Web Services service.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InvalidArgsException"
          InvalidArgsException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidDomainValidationOptionsException"
          InvalidDomainValidationOptionsException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "RequestInProgressException"
          RequestInProgressException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TagPolicyException"
          TagPolicyException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
