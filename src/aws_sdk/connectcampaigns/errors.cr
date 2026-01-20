module AwsSdk
  module ConnectCampaigns
    module Errors
      class ServiceError < Exception
      end

      # You do not have sufficient access to perform this action.

      class AccessDeniedException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource.

      class ConflictException < ServiceError
      end

      # Request processing failed because of an error or failure with the service.

      class InternalServerException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the campaign.

      class InvalidCampaignStateException < ServiceError
      end

      # The request could not be processed because of conflict in the current state.

      class InvalidStateException < ServiceError
      end

      # The specified resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # Request would cause a service quota to be exceeded.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an AWS service.

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
        when "InvalidCampaignStateException"
          InvalidCampaignStateException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
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
