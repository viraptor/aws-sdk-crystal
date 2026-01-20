module AwsSdk
  module SageMakerMetrics
    module Errors
      class ServiceError < Exception
      end

      def self.build(error_type : String?, message : String?) : Exception
        ServiceError.new(message || "Unknown error")
      end
    end
  end
end
