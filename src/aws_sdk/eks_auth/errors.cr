module AwsSdk
  module EKSAuth
    module Errors
      class ServiceError < Exception
      end

      # You don't have permissions to perform the requested operation. The IAM principal making the request
      # must have at least one IAM permissions policy attached that grants the required permissions. For
      # more information, see Access management in the IAM User Guide .
      class AccessDeniedException < ServiceError
      end

      # The specified Kubernetes service account token is expired.
      class ExpiredTokenException < ServiceError
      end

      # These errors are usually caused by a server-side issue.
      class InternalServerException < ServiceError
      end

      # The specified parameter is invalid. Review the available parameters for the API request.
      class InvalidParameterException < ServiceError
      end

      # This exception is thrown if the request contains a semantic error. The precise meaning will depend
      # on the API, and will be documented in the error message.
      class InvalidRequestException < ServiceError
      end

      # The specified Kubernetes service account token is invalid.
      class InvalidTokenException < ServiceError
      end

      # The specified resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # The service is unavailable. Back off and retry the operation.
      class ServiceUnavailableException < ServiceError
      end

      # The request was denied because your request rate is too high. Reduce the frequency of requests.
      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ExpiredTokenException"
          ExpiredTokenException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidTokenException"
          InvalidTokenException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
