module Aws
  module CodeBuild
    module Errors
      class ServiceError < Exception
      end

      # An Amazon Web Services service limit was exceeded for the calling Amazon Web Services account.

      class AccountLimitExceededException < ServiceError
      end

      # The CodeBuild access has been suspended for the calling Amazon Web Services account.

      class AccountSuspendedException < ServiceError
      end

      # The input value that was provided is not valid.

      class InvalidInputException < ServiceError
      end

      # There was a problem with the underlying OAuth provider.

      class OAuthProviderException < ServiceError
      end

      # The specified Amazon Web Services resource cannot be created, because an Amazon Web Services
      # resource with the same settings already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The specified Amazon Web Services resource cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccountLimitExceededException"
          AccountLimitExceededException.new(message)
        when "AccountSuspendedException"
          AccountSuspendedException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "OAuthProviderException"
          OAuthProviderException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
