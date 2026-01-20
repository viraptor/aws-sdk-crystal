module Aws
  module SESv2
    module Errors
      class ServiceError < Exception
      end

      # The message can't be sent because the account's ability to send email has been permanently
      # restricted.

      class AccountSuspendedException < ServiceError
      end

      # The resource specified in your request already exists.

      class AlreadyExistsException < ServiceError
      end

      # The input you provided is invalid.

      class BadRequestException < ServiceError
      end

      # The resource is being modified by another operation or thread.

      class ConcurrentModificationException < ServiceError
      end

      # If there is already an ongoing account details update under review.

      class ConflictException < ServiceError
      end

      # The request couldn't be processed because an error occurred with the Amazon SES API v2.

      class InternalServiceErrorException < ServiceError
      end

      # The specified request includes an invalid or expired token.

      class InvalidNextTokenException < ServiceError
      end

      # There are too many instances of the specified resource type.

      class LimitExceededException < ServiceError
      end

      # The message can't be sent because the sending domain isn't verified.

      class MailFromDomainNotVerifiedException < ServiceError
      end

      # The message can't be sent because it contains invalid content.

      class MessageRejected < ServiceError
      end

      # The resource you attempted to access doesn't exist.

      class NotFoundException < ServiceError
      end

      # The message can't be sent because the account's ability to send email is currently paused.

      class SendingPausedException < ServiceError
      end

      # Too many requests have been made to the operation.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccountSuspendedException"
          AccountSuspendedException.new(message)
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MailFromDomainNotVerifiedException"
          MailFromDomainNotVerifiedException.new(message)
        when "MessageRejected"
          MessageRejected.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "SendingPausedException"
          SendingPausedException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
