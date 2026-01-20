module AwsSdk
  module MWAAServerless
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient permission to perform this action.

      class AccessDeniedException < ServiceError
      end

      # You cannot create a resource that already exists, or the resource is in a state that prevents the
      # requested operation.

      class ConflictException < ServiceError
      end

      # An unexpected server-side error occurred during request processing.

      class InternalServerException < ServiceError
      end

      # The operation timed out.

      class OperationTimeoutException < ServiceError
      end

      # The specified resource was not found. You can only access or modify a resource that already exists.

      class ResourceNotFoundException < ServiceError
      end

      # The request exceeds the service quota for Amazon Managed Workflows for Apache Airflow Serverless
      # resources. This can occur when you attempt to create more workflows than allowed, exceed concurrent
      # workflow run limits, or surpass task execution limits. Amazon Managed Workflows for Apache Airflow
      # Serverless implements admission control using DynamoDB-based counters to manage resource utilization
      # across the multi-tenant environment. Contact Amazon Web Services Support to request quota increases
      # if you need higher limits for your use case.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied because too many requests were made in a short period, exceeding the service
      # rate limits. Amazon Managed Workflows for Apache Airflow Serverless implements throttling controls
      # to ensure fair resource allocation across all customers in the multi-tenant environment. This helps
      # maintain service stability and performance. If you encounter throttling, implement exponential
      # backoff and retry logic in your applications, or consider distributing your API calls over a longer
      # time period.

      class ThrottlingException < ServiceError
      end

      # The specified request parameters are invalid, missing, or inconsistent with Amazon Managed Workflows
      # for Apache Airflow Serverless service requirements. This can occur when workflow definitions contain
      # unsupported operators, when required IAM permissions are missing, when S3 locations are
      # inaccessible, or when network configurations are invalid. The service validates workflow
      # definitions, execution roles, and resource configurations to ensure compatibility with the managed
      # Airflow environment and security requirements.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "OperationTimeoutException"
          OperationTimeoutException.new(message)
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
