module AwsSdk
  module DirectConnect
    module Errors
      class ServiceError < Exception
      end

      # One or more parameters are not valid.

      class DirectConnectClientException < ServiceError
      end

      # A server-side error occurred.

      class DirectConnectServerException < ServiceError
      end

      # A tag key was specified more than once.

      class DuplicateTagKeysException < ServiceError
      end

      # You have reached the limit on the number of tags that can be assigned.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DirectConnectClientException"
          DirectConnectClientException.new(message)
        when "DirectConnectServerException"
          DirectConnectServerException.new(message)
        when "DuplicateTagKeysException"
          DuplicateTagKeysException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
