module AwsSdk
  module MediaPackageV2
    module Errors
      class ServiceError < Exception
      end

      # Access is denied because either you don't have permissions to perform the requested operation or
      # MediaPackage is getting throttling errors with CDN authorization. The user or role that is making
      # the request must have at least one IAM permissions policy attached that grants the required
      # permissions. For more information, see Access Management in the IAM User Guide. Or, if you're using
      # CDN authorization, you will receive this exception if MediaPackage receives a throttling error from
      # Secrets Manager.

      class AccessDeniedException < ServiceError
      end

      # Updating or deleting this resource can cause an inconsistent state.

      class ConflictException < ServiceError
      end

      # Indicates that an error from the service occurred while trying to process a request.

      class InternalServerException < ServiceError
      end

      # The specified resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request throughput limit was exceeded.

      class ThrottlingException < ServiceError
      end

      # The input failed to meet the constraints specified by the AWS service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
