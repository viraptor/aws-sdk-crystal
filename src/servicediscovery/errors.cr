module Aws
  module ServiceDiscovery
    module Errors
      class ServiceError < Exception
      end

      # The health check for the instance that's specified by ServiceId and InstanceId isn't a custom health
      # check.

      class CustomHealthNotFound < ServiceError
      end

      # The operation is already in progress.

      class DuplicateRequest < ServiceError
      end

      # No instance exists with the specified ID, or the instance was recently registered, and information
      # about the instance hasn't propagated yet.

      class InstanceNotFound < ServiceError
      end

      # One or more specified values aren't valid. For example, a required value might be missing, a numeric
      # value might be outside the allowed range, or a string value might exceed length constraints.

      class InvalidInput < ServiceError
      end

      # The namespace that you're trying to create already exists.

      class NamespaceAlreadyExists < ServiceError
      end

      # No namespace exists with the specified ID.

      class NamespaceNotFound < ServiceError
      end

      # No operation exists with the specified ID.

      class OperationNotFound < ServiceError
      end

      # The operation can't be completed because you've reached the quota for the number of requests. For
      # more information, see Cloud Map API request throttling quota in the Cloud Map Developer Guide .

      class RequestLimitExceeded < ServiceError
      end

      # The specified resource can't be deleted because it contains other resources. For example, you can't
      # delete a service that contains any instances.

      class ResourceInUse < ServiceError
      end

      # The resource can't be created because you've reached the quota on the number of resources.

      class ResourceLimitExceeded < ServiceError
      end

      # The operation can't be completed because the resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The service can't be created because a service with the same name already exists.

      class ServiceAlreadyExists < ServiceError
      end

      # The attribute can't be added to the service because you've exceeded the quota for the number of
      # attributes you can add to a service.

      class ServiceAttributesLimitExceededException < ServiceError
      end

      # No service exists with the specified ID.

      class ServiceNotFound < ServiceError
      end

      # The list of tags on the resource is over the quota. The maximum number of tags that can be applied
      # to a resource is 50.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CustomHealthNotFound"
          CustomHealthNotFound.new(message)
        when "DuplicateRequest"
          DuplicateRequest.new(message)
        when "InstanceNotFound"
          InstanceNotFound.new(message)
        when "InvalidInput"
          InvalidInput.new(message)
        when "NamespaceAlreadyExists"
          NamespaceAlreadyExists.new(message)
        when "NamespaceNotFound"
          NamespaceNotFound.new(message)
        when "OperationNotFound"
          OperationNotFound.new(message)
        when "RequestLimitExceeded"
          RequestLimitExceeded.new(message)
        when "ResourceInUse"
          ResourceInUse.new(message)
        when "ResourceLimitExceeded"
          ResourceLimitExceeded.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceAlreadyExists"
          ServiceAlreadyExists.new(message)
        when "ServiceAttributesLimitExceededException"
          ServiceAttributesLimitExceededException.new(message)
        when "ServiceNotFound"
          ServiceNotFound.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
