module Aws
  module Greengrass
    module Errors
      class ServiceError < Exception
      end

      # General error information.

      class BadRequestException < ServiceError
      end

      # General error information.

      class InternalServerErrorException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
