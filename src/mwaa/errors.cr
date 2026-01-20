module Aws
  module MWAA
    module Errors
      class ServiceError < Exception
      end

      # Access to the Apache Airflow Web UI or CLI has been denied due to insufficient permissions. To learn
      # more, see Accessing an Amazon MWAA environment .

      class AccessDeniedException < ServiceError
      end

      # InternalServerException: An internal error has occurred.

      class InternalServerException < ServiceError
      end

      # ResourceNotFoundException: The resource is not available.

      class ResourceNotFoundException < ServiceError
      end

      # An exception indicating that a client-side error occurred during the Apache Airflow REST API call.

      class RestApiClientException < ServiceError
      end

      # An exception indicating that a server-side error occurred during the Apache Airflow REST API call.

      class RestApiServerException < ServiceError
      end

      # ValidationException: The provided input is not valid.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "RestApiClientException"
          RestApiClientException.new(message)
        when "RestApiServerException"
          RestApiServerException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
