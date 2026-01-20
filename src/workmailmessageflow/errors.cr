module Aws
  module WorkMailMessageFlow
    module Errors
      class ServiceError < Exception
      end

      # WorkMail could not access the updated email content. Possible reasons: You made the request in a
      # region other than your S3 bucket region. The S3 bucket owner is not the same as the calling AWS
      # account. You have an incomplete or missing S3 bucket policy. For more information about policies,
      # see Updating message content with AWS Lambda in the WorkMail Administrator Guide .

      class InvalidContentLocation < ServiceError
      end

      # The requested email is not eligible for update. This is usually the case for a redirected email.

      class MessageFrozen < ServiceError
      end

      # The requested email could not be updated due to an error in the MIME content. Check the error
      # message for more information about what caused the error.

      class MessageRejected < ServiceError
      end

      # The requested email message is not found.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InvalidContentLocation"
          InvalidContentLocation.new(message)
        when "MessageFrozen"
          MessageFrozen.new(message)
        when "MessageRejected"
          MessageRejected.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
