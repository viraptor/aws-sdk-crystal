module Aws
  module MediaConnect
    module Errors
      class ServiceError < Exception
      end

      # Exception raised by Elemental MediaConnect when adding the flow output. See the error message for
      # the operation for more information on the cause of this exception.

      class AddFlowOutputs420Exception < ServiceError
      end

      # This exception is thrown if the request contains a semantic error. The precise meaning depends on
      # the API, and is documented in the error message.

      class BadRequestException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      class ConflictException < ServiceError
      end

      # Exception raised by Elemental MediaConnect when creating the bridge. See the error message for the
      # operation for more information on the cause of this exception.

      class CreateBridge420Exception < ServiceError
      end

      # Exception raised by Elemental MediaConnect when creating the flow. See the error message for the
      # operation for more information on the cause of this exception.

      class CreateFlow420Exception < ServiceError
      end

      # Exception raised by Elemental MediaConnect when creating the gateway. See the error message for the
      # operation for more information on the cause of this exception.

      class CreateGateway420Exception < ServiceError
      end

      # You do not have sufficient access to perform this action.

      class ForbiddenException < ServiceError
      end

      # Exception raised by Elemental MediaConnect when granting the entitlement. See the error message for
      # the operation for more information on the cause of this exception.

      class GrantFlowEntitlements420Exception < ServiceError
      end

      # The server encountered an internal error and is unable to complete the request.

      class InternalServerErrorException < ServiceError
      end

      # One or more of the resources in the request does not exist in the system.

      class NotFoundException < ServiceError
      end

      # The request to create a new router input would exceed the service quotas for the account.

      class RouterInputServiceQuotaExceededException < ServiceError
      end

      # The request to create a new router network interface would exceed the service quotas (limits) set
      # for the account.

      class RouterNetworkInterfaceServiceQuotaExceededException < ServiceError
      end

      # The request to create a new router output would exceed the service quotas (limits) set for the
      # account.

      class RouterOutputServiceQuotaExceededException < ServiceError
      end

      # The service is currently unavailable or busy.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AddFlowOutputs420Exception"
          AddFlowOutputs420Exception.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "CreateBridge420Exception"
          CreateBridge420Exception.new(message)
        when "CreateFlow420Exception"
          CreateFlow420Exception.new(message)
        when "CreateGateway420Exception"
          CreateGateway420Exception.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "GrantFlowEntitlements420Exception"
          GrantFlowEntitlements420Exception.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "RouterInputServiceQuotaExceededException"
          RouterInputServiceQuotaExceededException.new(message)
        when "RouterNetworkInterfaceServiceQuotaExceededException"
          RouterNetworkInterfaceServiceQuotaExceededException.new(message)
        when "RouterOutputServiceQuotaExceededException"
          RouterOutputServiceQuotaExceededException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
