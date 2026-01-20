module Aws
  module ApiGatewayV2
    module Errors
      class ServiceError < Exception
      end


      class AccessDeniedException < ServiceError
      end

      # The request is not valid, for example, the input is incomplete or incorrect. See the accompanying
      # error message for details.

      class BadRequestException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request. See the accompanying
      # error message for details.

      class ConflictException < ServiceError
      end

      # The resource specified in the request was not found. See the message field for more information.

      class NotFoundException < ServiceError
      end

      # A limit has been exceeded. See the accompanying error message for details.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
