module AwsSdk
  module AppConfig
    module Errors
      class ServiceError < Exception
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      class BadRequestException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource.
      class ConflictException < ServiceError
      end

      # There was an internal failure in the AppConfig service.
      class InternalServerException < ServiceError
      end

      # The configuration size is too large.
      class PayloadTooLargeException < ServiceError
      end

      # The requested resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # The number of one more AppConfig resources exceeds the maximum allowed. Verify that your environment
      # doesn't exceed the following service quotas: Applications: 100 max Deployment strategies: 20 max
      # Configuration profiles: 100 max per application Environments: 20 max per application To resolve this
      # issue, you can delete one or more resources and try again. Or, you can request a quota increase. For
      # more information about quotas and to request an increase, see Service quotas for AppConfig in the
      # Amazon Web Services General Reference.
      class ServiceQuotaExceededException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "PayloadTooLargeException"
          PayloadTooLargeException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
