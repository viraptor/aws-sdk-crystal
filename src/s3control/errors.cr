module Aws
  module S3Control
    module Errors
      class ServiceError < Exception
      end


      class BadRequestException < ServiceError
      end

      # The requested Outposts bucket name is not available. The bucket namespace is shared by all users of
      # the Outposts in this Region. Select a different name and try again.

      class BucketAlreadyExists < ServiceError
      end

      # The Outposts bucket you tried to create already exists, and you own it.

      class BucketAlreadyOwnedByYou < ServiceError
      end


      class IdempotencyException < ServiceError
      end


      class InternalServiceException < ServiceError
      end


      class InvalidNextTokenException < ServiceError
      end


      class InvalidRequestException < ServiceError
      end


      class JobStatusException < ServiceError
      end

      # Amazon S3 throws this exception if you make a GetPublicAccessBlock request against an account that
      # doesn't have a PublicAccessBlockConfiguration set.

      class NoSuchPublicAccessBlockConfiguration < ServiceError
      end


      class NotFoundException < ServiceError
      end


      class TooManyRequestsException < ServiceError
      end

      # Amazon S3 throws this exception if you have too many tags in your tag set.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "BucketAlreadyExists"
          BucketAlreadyExists.new(message)
        when "BucketAlreadyOwnedByYou"
          BucketAlreadyOwnedByYou.new(message)
        when "IdempotencyException"
          IdempotencyException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "JobStatusException"
          JobStatusException.new(message)
        when "NoSuchPublicAccessBlockConfiguration"
          NoSuchPublicAccessBlockConfiguration.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
