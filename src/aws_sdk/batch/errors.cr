module AwsSdk
  module Batch
    module Errors
      class ServiceError < Exception
      end

      # These errors are usually caused by a client action. One example cause is using an action or resource
      # on behalf of a user that doesn't have permissions to use the action or resource. Another cause is
      # specifying an identifier that's not valid.
      class ClientException < ServiceError
      end

      # These errors are usually caused by a server issue.
      class ServerException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClientException"
          ClientException.new(message)
        when "ServerException"
          ServerException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
