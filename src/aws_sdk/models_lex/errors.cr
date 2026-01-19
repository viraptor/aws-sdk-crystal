module AwsSdk
  module LexModelBuildingService
    module Errors
      class ServiceError < Exception
      end

      # Your IAM user or role does not have permission to call the Amazon Lex V2 APIs required to migrate
      # your bot.
      class AccessDeniedException < ServiceError
      end

      # The request is not well formed. For example, a value is invalid or a required field is missing.
      # Check the field values, and try again.
      class BadRequestException < ServiceError
      end

      # There was a conflict processing the request. Try your request again.
      class ConflictException < ServiceError
      end

      # An internal Amazon Lex error occurred. Try your request again.
      class InternalFailureException < ServiceError
      end

      # The request exceeded a limit. Try your request again.
      class LimitExceededException < ServiceError
      end

      # The resource specified in the request was not found. Check the resource and try again.
      class NotFoundException < ServiceError
      end

      # The checksum of the resource that you are trying to change does not match the checksum in the
      # request. Check the resource's checksum and try again.
      class PreconditionFailedException < ServiceError
      end

      # The resource that you are attempting to delete is referred to by another resource. Use this
      # information to remove references to the resource that you are trying to delete. The body of the
      # exception contains a JSON object that describes the resource. { "resourceType": BOT | BOTALIAS |
      # BOTCHANNEL | INTENT, "resourceReference": { "name": string , "version": string } }
      class ResourceInUseException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
