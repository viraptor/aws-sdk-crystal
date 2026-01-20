module Aws
  module FMS
    module Errors
      class ServiceError < Exception
      end

      # The operation failed because of a system problem, even though the request was valid. Retry your
      # request.

      class InternalErrorException < ServiceError
      end

      # The parameters of the request were invalid.

      class InvalidInputException < ServiceError
      end

      # The operation failed because there was nothing to do or the operation wasn't possible. For example,
      # you might have submitted an AssociateAdminAccount request for an account ID that was already set as
      # the Firewall Manager administrator. Or you might have tried to access a Region that's disabled by
      # default, and that you need to enable for the Firewall Manager administrator account and for
      # Organizations before you can access it.

      class InvalidOperationException < ServiceError
      end

      # The value of the Type parameter is invalid.

      class InvalidTypeException < ServiceError
      end

      # The operation exceeds a resource limit, for example, the maximum number of policy objects that you
      # can create for an Amazon Web Services account. For more information, see Firewall Manager Limits in
      # the WAF Developer Guide .

      class LimitExceededException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidTypeException"
          InvalidTypeException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
