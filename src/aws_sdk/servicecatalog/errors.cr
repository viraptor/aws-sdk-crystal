module AwsSdk
  module ServiceCatalog
    module Errors
      class ServiceError < Exception
      end

      # The specified resource is a duplicate.

      class DuplicateResourceException < ServiceError
      end

      # One or more parameters provided to the operation are not valid.

      class InvalidParametersException < ServiceError
      end

      # An attempt was made to modify a resource that is in a state that is not valid. Check your resources
      # to ensure that they are in valid states before retrying the operation.

      class InvalidStateException < ServiceError
      end

      # The current limits of the service would have been exceeded by this operation. Decrease your resource
      # use or increase your service limits and retry the operation.

      class LimitExceededException < ServiceError
      end

      # The operation is not supported.

      class OperationNotSupportedException < ServiceError
      end

      # A resource that is currently in use. Ensure that the resource is not in use and retry the operation.

      class ResourceInUseException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # An operation requiring TagOptions failed because the TagOptions migration process has not been
      # performed for this account. Use the Amazon Web Services Management Console to perform the migration
      # process before retrying the operation.

      class TagOptionNotMigratedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DuplicateResourceException"
          DuplicateResourceException.new(message)
        when "InvalidParametersException"
          InvalidParametersException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "OperationNotSupportedException"
          OperationNotSupportedException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TagOptionNotMigratedException"
          TagOptionNotMigratedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
