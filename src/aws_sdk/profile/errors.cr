module AwsSdk
  module CustomerProfiles
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The input you provided is invalid.
      class BadRequestException < ServiceError
      end

      # An internal service error occurred.
      class InternalServerException < ServiceError
      end

      # The requested resource does not exist, or access was denied.
      class ResourceNotFoundException < ServiceError
      end

      # You exceeded the maximum number of requests.
      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
