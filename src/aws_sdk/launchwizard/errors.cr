module AwsSdk
  module LaunchWizard
    module Errors
      class ServiceError < Exception
      end

      # An internal error has occurred. Retry your request, but if the problem persists, contact us with
      # details by posting a question on re:Post .
      class InternalServerException < ServiceError
      end

      # You have exceeded an Launch Wizard resource limit. For example, you might have too many deployments
      # in progress.
      class ResourceLimitException < ServiceError
      end

      # The specified workload or deployment resource can't be found.
      class ResourceNotFoundException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceLimitException"
          ResourceLimitException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
