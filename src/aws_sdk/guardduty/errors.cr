module AwsSdk
  module GuardDuty
    module Errors
      class ServiceError < Exception
      end

      # An access denied exception object.
      class AccessDeniedException < ServiceError
      end

      # A bad request exception object.
      class BadRequestException < ServiceError
      end

      # A request conflict exception object.
      class ConflictException < ServiceError
      end

      # An internal server error exception object.
      class InternalServerErrorException < ServiceError
      end

      # The requested resource can't be found.
      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
