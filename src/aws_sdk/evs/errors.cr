module AwsSdk
  module Evs
    module Errors
      class ServiceError < Exception
      end

      # An internal server error occurred. Retry your request.
      class InternalServerException < ServiceError
      end

      # A service resource associated with the request could not be found. The resource might not be
      # specified correctly, or it may have a state of DELETED .
      class ResourceNotFoundException < ServiceError
      end

      # The number of one or more Amazon EVS resources exceeds the maximum allowed. For a list of Amazon EVS
      # quotas, see Amazon EVS endpoints and quotas in the Amazon EVS User Guide . Delete some resources or
      # request an increase in your service quota. To request an increase, see Amazon Web Services Service
      # Quotas in the Amazon Web Services General Reference Guide .
      class ServiceQuotaExceededException < ServiceError
      end

      # TagPolicyException is deprecated. See ValidationException instead. The request doesn't comply with
      # IAM tag policy. Correct your request and then retry it.
      class TagPolicyException < ServiceError
      end

      # The operation could not be performed because the service is throttling requests. This exception is
      # thrown when the service endpoint receives too many concurrent requests.
      class ThrottlingException < ServiceError
      end

      # TooManyTagsException is deprecated. See ServiceQuotaExceededException instead. A service resource
      # associated with the request has more than 200 tags.
      class TooManyTagsException < ServiceError
      end

      # The input fails to satisfy the specified constraints. You will see this exception if invalid inputs
      # are provided for any of the Amazon EVS environment operations, or if a list operation is performed
      # on an environment resource that is still initializing.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TagPolicyException"
          TagPolicyException.new(message)
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
