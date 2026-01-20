module AwsSdk
  module Lambda
    module Errors
      class ServiceError < Exception
      end

      # The callback ID token has either expired or the callback associated with the token has already been
      # closed.

      class CallbackTimeoutException < ServiceError
      end

      # The maximum number of capacity providers for your account has been exceeded. For more information,
      # see Lambda quotas

      class CapacityProviderLimitExceededException < ServiceError
      end

      # The specified code signing configuration does not exist.

      class CodeSigningConfigNotFoundException < ServiceError
      end

      # Your Amazon Web Services account has exceeded its maximum total code size. For more information, see
      # Lambda quotas .

      class CodeStorageExceededException < ServiceError
      end

      # The code signature failed one or more of the validation checks for signature mismatch or expiry, and
      # the code signing policy is set to ENFORCE. Lambda blocks the deployment.

      class CodeVerificationFailedException < ServiceError
      end

      # The durable execution with the specified name has already been started. Each durable execution name
      # must be unique within the function. Use a different name or check the status of the existing
      # execution.

      class DurableExecutionAlreadyStartedException < ServiceError
      end

      # Need additional permissions to configure VPC settings.

      class EC2AccessDeniedException < ServiceError
      end

      # Amazon EC2 throttled Lambda during Lambda function initialization using the execution role provided
      # for the function.

      class EC2ThrottledException < ServiceError
      end

      # Lambda received an unexpected Amazon EC2 client exception while setting up for the Lambda function.

      class EC2UnexpectedException < ServiceError
      end

      # An error occurred when reading from or writing to a connected file system.

      class EFSIOException < ServiceError
      end

      # The Lambda function couldn't make a network connection to the configured file system.

      class EFSMountConnectivityException < ServiceError
      end

      # The Lambda function couldn't mount the configured file system due to a permission or configuration
      # issue.

      class EFSMountFailureException < ServiceError
      end

      # The Lambda function made a network connection to the configured file system, but the mount operation
      # timed out.

      class EFSMountTimeoutException < ServiceError
      end

      # Lambda couldn't create an elastic network interface in the VPC, specified as part of Lambda function
      # configuration, because the limit for network interfaces has been reached. For more information, see
      # Lambda quotas .

      class ENILimitReachedException < ServiceError
      end

      # The maximum number of function versions that can be associated with a single capacity provider has
      # been exceeded. For more information, see Lambda quotas .

      class FunctionVersionsPerCapacityProviderLimitExceededException < ServiceError
      end

      # The code signature failed the integrity check. If the integrity check fails, then Lambda blocks
      # deployment, even if the code signing policy is set to WARN.

      class InvalidCodeSignatureException < ServiceError
      end

      # One of the parameters in the request is not valid.

      class InvalidParameterValueException < ServiceError
      end

      # The request body could not be parsed as JSON, or a request header is invalid. For example, the
      # 'x-amzn-RequestId' header is not a valid UUID string.

      class InvalidRequestContentException < ServiceError
      end

      # The runtime or runtime version specified is not supported.

      class InvalidRuntimeException < ServiceError
      end

      # The security group ID provided in the Lambda function VPC configuration is not valid.

      class InvalidSecurityGroupIDException < ServiceError
      end

      # The subnet ID provided in the Lambda function VPC configuration is not valid.

      class InvalidSubnetIDException < ServiceError
      end

      # Lambda could not unzip the deployment package.

      class InvalidZipFileException < ServiceError
      end

      # Lambda couldn't decrypt the environment variables because KMS access was denied. Check the Lambda
      # function's KMS permissions.

      class KMSAccessDeniedException < ServiceError
      end

      # Lambda couldn't decrypt the environment variables because the KMS key used is disabled. Check the
      # Lambda function's KMS key settings.

      class KMSDisabledException < ServiceError
      end

      # Lambda couldn't decrypt the environment variables because the state of the KMS key used is not valid
      # for Decrypt. Check the function's KMS key settings.

      class KMSInvalidStateException < ServiceError
      end

      # Lambda couldn't decrypt the environment variables because the KMS key was not found. Check the
      # function's KMS key settings.

      class KMSNotFoundException < ServiceError
      end

      # The function has no published versions available.

      class NoPublishedVersionException < ServiceError
      end

      # The permissions policy for the resource is too large. For more information, see Lambda quotas .

      class PolicyLengthExceededException < ServiceError
      end

      # The RevisionId provided does not match the latest RevisionId for the Lambda function or alias. For
      # AddPermission and RemovePermission API operations: Call GetPolicy to retrieve the latest RevisionId
      # for your resource. For all other API operations: Call GetFunction or GetAlias to retrieve the latest
      # RevisionId for your resource.

      class PreconditionFailedException < ServiceError
      end

      # The specified configuration does not exist.

      class ProvisionedConcurrencyConfigNotFoundException < ServiceError
      end

      # Lambda has detected your function being invoked in a recursive loop with other Amazon Web Services
      # resources and stopped your function's invocation.

      class RecursiveInvocationException < ServiceError
      end

      # The request payload exceeded the Invoke request body JSON input quota. For more information, see
      # Lambda quotas .

      class RequestTooLargeException < ServiceError
      end

      # The resource already exists, or another operation is in progress.

      class ResourceConflictException < ServiceError
      end

      # The operation conflicts with the resource's availability. For example, you tried to update an event
      # source mapping in the CREATING state, or you tried to delete an event source mapping currently
      # UPDATING.

      class ResourceInUseException < ServiceError
      end

      # The resource specified in the request does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The function is inactive and its VPC connection is no longer available. Wait for the VPC connection
      # to reestablish and try again.

      class ResourceNotReadyException < ServiceError
      end

      # The request payload exceeded the maximum allowed size for serialized request entities.

      class SerializedRequestEntityTooLargeException < ServiceError
      end

      # The Lambda service encountered an internal error.

      class ServiceException < ServiceError
      end

      # The afterRestore() runtime hook encountered an error. For more information, check the Amazon
      # CloudWatch logs.

      class SnapStartException < ServiceError
      end

      # Lambda is initializing your function. You can invoke the function when the function state becomes
      # Active .

      class SnapStartNotReadyException < ServiceError
      end

      # Lambda couldn't restore the snapshot within the timeout limit.

      class SnapStartTimeoutException < ServiceError
      end

      # Lambda couldn't set up VPC access for the Lambda function because one or more configured subnets has
      # no available IP addresses.

      class SubnetIPAddressLimitReachedException < ServiceError
      end

      # The request throughput limit was exceeded. For more information, see Lambda quotas .

      class TooManyRequestsException < ServiceError
      end

      # The content type of the Invoke request body is not JSON.

      class UnsupportedMediaTypeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CallbackTimeoutException"
          CallbackTimeoutException.new(message)
        when "CapacityProviderLimitExceededException"
          CapacityProviderLimitExceededException.new(message)
        when "CodeSigningConfigNotFoundException"
          CodeSigningConfigNotFoundException.new(message)
        when "CodeStorageExceededException"
          CodeStorageExceededException.new(message)
        when "CodeVerificationFailedException"
          CodeVerificationFailedException.new(message)
        when "DurableExecutionAlreadyStartedException"
          DurableExecutionAlreadyStartedException.new(message)
        when "EC2AccessDeniedException"
          EC2AccessDeniedException.new(message)
        when "EC2ThrottledException"
          EC2ThrottledException.new(message)
        when "EC2UnexpectedException"
          EC2UnexpectedException.new(message)
        when "EFSIOException"
          EFSIOException.new(message)
        when "EFSMountConnectivityException"
          EFSMountConnectivityException.new(message)
        when "EFSMountFailureException"
          EFSMountFailureException.new(message)
        when "EFSMountTimeoutException"
          EFSMountTimeoutException.new(message)
        when "ENILimitReachedException"
          ENILimitReachedException.new(message)
        when "FunctionVersionsPerCapacityProviderLimitExceededException"
          FunctionVersionsPerCapacityProviderLimitExceededException.new(message)
        when "InvalidCodeSignatureException"
          InvalidCodeSignatureException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidRequestContentException"
          InvalidRequestContentException.new(message)
        when "InvalidRuntimeException"
          InvalidRuntimeException.new(message)
        when "InvalidSecurityGroupIDException"
          InvalidSecurityGroupIDException.new(message)
        when "InvalidSubnetIDException"
          InvalidSubnetIDException.new(message)
        when "InvalidZipFileException"
          InvalidZipFileException.new(message)
        when "KMSAccessDeniedException"
          KMSAccessDeniedException.new(message)
        when "KMSDisabledException"
          KMSDisabledException.new(message)
        when "KMSInvalidStateException"
          KMSInvalidStateException.new(message)
        when "KMSNotFoundException"
          KMSNotFoundException.new(message)
        when "NoPublishedVersionException"
          NoPublishedVersionException.new(message)
        when "PolicyLengthExceededException"
          PolicyLengthExceededException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
        when "ProvisionedConcurrencyConfigNotFoundException"
          ProvisionedConcurrencyConfigNotFoundException.new(message)
        when "RecursiveInvocationException"
          RecursiveInvocationException.new(message)
        when "RequestTooLargeException"
          RequestTooLargeException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceNotReadyException"
          ResourceNotReadyException.new(message)
        when "SerializedRequestEntityTooLargeException"
          SerializedRequestEntityTooLargeException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "SnapStartException"
          SnapStartException.new(message)
        when "SnapStartNotReadyException"
          SnapStartNotReadyException.new(message)
        when "SnapStartTimeoutException"
          SnapStartTimeoutException.new(message)
        when "SubnetIPAddressLimitReachedException"
          SubnetIPAddressLimitReachedException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnsupportedMediaTypeException"
          UnsupportedMediaTypeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
