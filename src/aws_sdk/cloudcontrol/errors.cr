module AwsSdk
  module CloudControl
    module Errors
      class ServiceError < Exception
      end

      # The resource with the name requested already exists.

      class AlreadyExistsException < ServiceError
      end

      # The specified client token has already been used in another resource request. It's best practice for
      # client tokens to be unique for each resource operation request. However, client token expire after
      # 36 hours.

      class ClientTokenConflictException < ServiceError
      end

      # The resource is currently being modified by another operation.

      class ConcurrentModificationException < ServiceError
      end

      # Another resource operation is currently being performed on this resource.

      class ConcurrentOperationException < ServiceError
      end

      # The resource handler has returned that the downstream service generated an error that doesn't map to
      # any other handler error code.

      class GeneralServiceException < ServiceError
      end

      # The resource handler has failed without a returning a more specific error code. This can include
      # timeouts.

      class HandlerFailureException < ServiceError
      end

      # The resource handler has returned that an unexpected error occurred within the resource handler.

      class HandlerInternalFailureException < ServiceError
      end

      # The resource handler has returned that the credentials provided by the user are invalid.

      class InvalidCredentialsException < ServiceError
      end

      # The resource handler has returned that invalid input from the user has generated a generic
      # exception.

      class InvalidRequestException < ServiceError
      end

      # The resource handler has returned that the request couldn't be completed due to networking issues,
      # such as a failure to receive a response from the server.

      class NetworkFailureException < ServiceError
      end

      # The resource handler has returned that the downstream resource failed to complete all of its
      # ready-state checks.

      class NotStabilizedException < ServiceError
      end

      # One or more properties included in this resource operation are defined as create-only, and therefore
      # can't be updated.

      class NotUpdatableException < ServiceError
      end

      # Cloud Control API hasn't received a valid response from the resource handler, due to a configuration
      # error. This includes issues such as the resource handler returning an invalid response, or timing
      # out.

      class PrivateTypeException < ServiceError
      end

      # A resource operation with the specified request token can't be found.

      class RequestTokenNotFoundException < ServiceError
      end

      # The resource is temporarily unavailable to be acted upon. For example, if the resource is currently
      # undergoing an operation and can't be acted upon until that operation is finished.

      class ResourceConflictException < ServiceError
      end

      # A resource with the specified identifier can't be found.

      class ResourceNotFoundException < ServiceError
      end

      # The resource handler has returned that the downstream service returned an internal error, typically
      # with a 5XX HTTP status code.

      class ServiceInternalErrorException < ServiceError
      end

      # The resource handler has returned that a non-transient resource limit was reached on the service
      # side.

      class ServiceLimitExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The specified extension doesn't exist in the CloudFormation registry.

      class TypeNotFoundException < ServiceError
      end

      # The specified resource doesn't support this resource operation.

      class UnsupportedActionException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "ClientTokenConflictException"
          ClientTokenConflictException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConcurrentOperationException"
          ConcurrentOperationException.new(message)
        when "GeneralServiceException"
          GeneralServiceException.new(message)
        when "HandlerFailureException"
          HandlerFailureException.new(message)
        when "HandlerInternalFailureException"
          HandlerInternalFailureException.new(message)
        when "InvalidCredentialsException"
          InvalidCredentialsException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "NetworkFailureException"
          NetworkFailureException.new(message)
        when "NotStabilizedException"
          NotStabilizedException.new(message)
        when "NotUpdatableException"
          NotUpdatableException.new(message)
        when "PrivateTypeException"
          PrivateTypeException.new(message)
        when "RequestTokenNotFoundException"
          RequestTokenNotFoundException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceInternalErrorException"
          ServiceInternalErrorException.new(message)
        when "ServiceLimitExceededException"
          ServiceLimitExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TypeNotFoundException"
          TypeNotFoundException.new(message)
        when "UnsupportedActionException"
          UnsupportedActionException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
