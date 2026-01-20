module Aws
  module RedshiftServerless
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The submitted action has conflicts.

      class ConflictException < ServiceError
      end

      # This exception is thrown when the request was successful, but dry run was enabled so no action was
      # taken.

      class DryRunException < ServiceError
      end

      # There is an insufficient capacity to perform the action.

      class InsufficientCapacityException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure.

      class InternalServerException < ServiceError
      end

      # The provided pagination token is invalid.

      class InvalidPaginationException < ServiceError
      end

      # There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, associate
      # an IPv6 CIDR block with each subnet in your VPC.

      class Ipv6CidrBlockNotFoundException < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The service limit was exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The request exceeded the number of tags allowed for a resource.

      class TooManyTagsException < ServiceError
      end

      # The input failed to satisfy the constraints specified by an Amazon Web Services service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DryRunException"
          DryRunException.new(message)
        when "InsufficientCapacityException"
          InsufficientCapacityException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidPaginationException"
          InvalidPaginationException.new(message)
        when "Ipv6CidrBlockNotFoundException"
          Ipv6CidrBlockNotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
