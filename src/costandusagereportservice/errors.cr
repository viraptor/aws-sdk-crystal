module Aws
  module CostAndUsageReportService
    module Errors
      class ServiceError < Exception
      end

      # A report with the specified name already exists in the account. Specify a different report name.

      class DuplicateReportNameException < ServiceError
      end

      # An error on the server occurred during the processing of your request. Try again later.

      class InternalErrorException < ServiceError
      end

      # This account already has five reports defined. To define a new report, you must delete an existing
      # report.

      class ReportLimitReachedException < ServiceError
      end

      # The specified report ( ReportName ) in the request doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "DuplicateReportNameException"
          DuplicateReportNameException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "ReportLimitReachedException"
          ReportLimitReachedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
