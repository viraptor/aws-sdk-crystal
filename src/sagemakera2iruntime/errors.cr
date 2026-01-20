module Aws
  module SageMakerA2IRuntime
    module Errors
      class ServiceError < Exception
      end

      # Your request has the same name as another active human loop but has different input data. You cannot
      # start two human loops with the same name and different input data.

      class ConflictException < ServiceError
      end

      # We couldn't process your request because of an issue with the server. Try again later.

      class InternalServerException < ServiceError
      end

      # We couldn't find the requested resource. Check that your resources exists and were created in the
      # same AWS Region as your request, and try your request again.

      class ResourceNotFoundException < ServiceError
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your AWS account. For a list of Amazon A2I service quotes,
      # see Amazon Augmented AI Service Quotes . Delete some resources or request an increase in your
      # service quota. You can request a quota increase using Service Quotas or the AWS Support Center. To
      # request an increase, see AWS Service Quotas in the AWS General Reference .

      class ServiceQuotaExceededException < ServiceError
      end

      # You exceeded the maximum number of requests.

      class ThrottlingException < ServiceError
      end

      # The request isn't valid. Check the syntax and try again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
