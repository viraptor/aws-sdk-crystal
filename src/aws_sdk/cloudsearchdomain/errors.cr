module AwsSdk
  module CloudSearchDomain
    module Errors
      class ServiceError < Exception
      end

      # Information about any problems encountered while processing an upload request.

      class DocumentServiceException < ServiceError
      end

      # Information about any problems encountered while processing a search request.

      class SearchException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DocumentServiceException"
          DocumentServiceException.new(message)
        when "SearchException"
          SearchException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
