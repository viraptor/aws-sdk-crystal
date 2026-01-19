module AwsSdk
  module SageMaker
    module Errors
      class ServiceError < Exception
      end

      # There was a conflict when you attempted to modify a SageMaker entity such as an Experiment or
      # Artifact .
      class ConflictException < ServiceError
      end

      # Resource being accessed is in use.
      class ResourceInUse < ServiceError
      end

      # You have exceeded an SageMaker resource limit. For example, you might have too many training jobs
      # created.
      class ResourceLimitExceeded < ServiceError
      end

      # Resource being access is not found.
      class ResourceNotFound < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "ResourceInUse"
          ResourceInUse.new(message)
        when "ResourceLimitExceeded"
          ResourceLimitExceeded.new(message)
        when "ResourceNotFound"
          ResourceNotFound.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
