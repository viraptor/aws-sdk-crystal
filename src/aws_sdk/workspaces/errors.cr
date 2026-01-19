module AwsSdk
  module WorkSpaces
    module Errors
      class ServiceError < Exception
      end

      # The user is not authorized to access a resource.
      class AccessDeniedException < ServiceError
      end

      # The specified application is not supported.
      class ApplicationNotSupportedException < ServiceError
      end

      # The compute type of the WorkSpace is not compatible with the application.
      class ComputeNotCompatibleException < ServiceError
      end

      # The TargetAccountId is already linked or invited.
      class ConflictException < ServiceError
      end

      # The specified application is not compatible with the resource.
      class IncompatibleApplicationsException < ServiceError
      end

      # Unexpected server error occured.
      class InternalServerException < ServiceError
      end

      # Two or more of the selected parameter values cannot be used together.
      class InvalidParameterCombinationException < ServiceError
      end

      # One or more parameter values are not valid.
      class InvalidParameterValuesException < ServiceError
      end

      # The state of the resource is not valid for this operation.
      class InvalidResourceStateException < ServiceError
      end

      # The operating system of the WorkSpace is not compatible with the application.
      class OperatingSystemNotCompatibleException < ServiceError
      end

      # The properties of this WorkSpace are currently being modified. Try again in a moment.
      class OperationInProgressException < ServiceError
      end

      # This operation is not supported.
      class OperationNotSupportedException < ServiceError
      end

      # The specified resource already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # The resource is associated with a directory.
      class ResourceAssociatedException < ServiceError
      end

      # The resource could not be created.
      class ResourceCreationFailedException < ServiceError
      end

      # The specified resource is currently in use.
      class ResourceInUseException < ServiceError
      end

      # Your resource limits have been exceeded.
      class ResourceLimitExceededException < ServiceError
      end

      # The resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # The specified resource is not available.
      class ResourceUnavailableException < ServiceError
      end

      # The configuration of this network is not supported for this operation, or your network configuration
      # conflicts with the Amazon WorkSpaces management network IP range. For more information, see
      # Configure a VPC for Amazon WorkSpaces .
      class UnsupportedNetworkConfigurationException < ServiceError
      end

      # The configuration of this WorkSpace is not supported for this operation. For more information, see
      # Required Configuration and Service Components for WorkSpaces .
      class UnsupportedWorkspaceConfigurationException < ServiceError
      end

      # You either haven't provided a TargetAccountId or are using the same value for TargetAccountId and
      # SourceAccountId .
      class ValidationException < ServiceError
      end

      # The workspaces_DefaultRole role could not be found. If this is the first time you are registering a
      # directory, you will need to create the workspaces_DefaultRole role before you can register a
      # directory. For more information, see Creating the workspaces_DefaultRole Role .
      class WorkspacesDefaultRoleNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ApplicationNotSupportedException"
          ApplicationNotSupportedException.new(message)
        when "ComputeNotCompatibleException"
          ComputeNotCompatibleException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "IncompatibleApplicationsException"
          IncompatibleApplicationsException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterValuesException"
          InvalidParameterValuesException.new(message)
        when "InvalidResourceStateException"
          InvalidResourceStateException.new(message)
        when "OperatingSystemNotCompatibleException"
          OperatingSystemNotCompatibleException.new(message)
        when "OperationInProgressException"
          OperationInProgressException.new(message)
        when "OperationNotSupportedException"
          OperationNotSupportedException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceAssociatedException"
          ResourceAssociatedException.new(message)
        when "ResourceCreationFailedException"
          ResourceCreationFailedException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
        when "UnsupportedNetworkConfigurationException"
          UnsupportedNetworkConfigurationException.new(message)
        when "UnsupportedWorkspaceConfigurationException"
          UnsupportedWorkspaceConfigurationException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        when "WorkspacesDefaultRoleNotFoundException"
          WorkspacesDefaultRoleNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
