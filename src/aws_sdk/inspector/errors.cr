module AwsSdk
  module Inspector
    module Errors
      class ServiceError < Exception
      end

      # You do not have required permissions to access the requested resource.
      class AccessDeniedException < ServiceError
      end

      # You started an assessment run, but one of the instances is already participating in another
      # assessment run.
      class AgentsAlreadyRunningAssessmentException < ServiceError
      end

      # You cannot perform a specified action if an assessment run is currently in progress.
      class AssessmentRunInProgressException < ServiceError
      end

      # Internal server error.
      class InternalException < ServiceError
      end

      # Amazon Inspector cannot assume the cross-account role that it needs to list your EC2 instances
      # during the assessment run.
      class InvalidCrossAccountRoleException < ServiceError
      end

      # The request was rejected because an invalid or out-of-range value was supplied for an input
      # parameter.
      class InvalidInputException < ServiceError
      end

      # The request was rejected because it attempted to create resources beyond the current AWS account
      # limits. The error code describes the limit exceeded.
      class LimitExceededException < ServiceError
      end

      # The request was rejected because it referenced an entity that does not exist. The error code
      # describes the entity.
      class NoSuchEntityException < ServiceError
      end

      # The request is rejected. The specified assessment template is currently generating an exclusions
      # preview.
      class PreviewGenerationInProgressException < ServiceError
      end

      # The serice is temporary unavailable.
      class ServiceTemporarilyUnavailableException < ServiceError
      end

      # Used by the GetAssessmentReport API. The request was rejected because you tried to generate a report
      # for an assessment run that existed before reporting was supported in Amazon Inspector. You can only
      # generate reports for assessment runs that took place or will take place after generating reports in
      # Amazon Inspector became available.
      class UnsupportedFeatureException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AgentsAlreadyRunningAssessmentException"
          AgentsAlreadyRunningAssessmentException.new(message)
        when "AssessmentRunInProgressException"
          AssessmentRunInProgressException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InvalidCrossAccountRoleException"
          InvalidCrossAccountRoleException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NoSuchEntityException"
          NoSuchEntityException.new(message)
        when "PreviewGenerationInProgressException"
          PreviewGenerationInProgressException.new(message)
        when "ServiceTemporarilyUnavailableException"
          ServiceTemporarilyUnavailableException.new(message)
        when "UnsupportedFeatureException"
          UnsupportedFeatureException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
