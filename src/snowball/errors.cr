module Aws
  module Snowball
    module Errors
      class ServiceError < Exception
      end

      # Job creation failed. Currently, clusters support five nodes. If you have fewer than five nodes for
      # your cluster and you have more nodes to create for this cluster, try again and create jobs until
      # your cluster has exactly five nodes.

      class ClusterLimitExceededException < ServiceError
      end

      # You get this exception when you call CreateReturnShippingLabel more than once when other requests
      # are not completed.

      class ConflictException < ServiceError
      end

      # Your user lacks the necessary Amazon EC2 permissions to perform the attempted action.

      class Ec2RequestFailedException < ServiceError
      end

      # The address provided was invalid. Check the address with your region's carrier, and try again.

      class InvalidAddressException < ServiceError
      end

      # Job or cluster creation failed. One or more inputs were invalid. Confirm that the
      # CreateClusterRequest$SnowballType value supports your CreateJobRequest$JobType , and try again.

      class InvalidInputCombinationException < ServiceError
      end

      # The action can't be performed because the job's current state doesn't allow that action to be
      # performed.

      class InvalidJobStateException < ServiceError
      end

      # The NextToken string was altered unexpectedly, and the operation has stopped. Run the operation
      # without changing the NextToken string, and try again.

      class InvalidNextTokenException < ServiceError
      end

      # The specified resource can't be found. Check the information you provided in your last request, and
      # try again.

      class InvalidResourceException < ServiceError
      end

      # The provided Key Management Service key lacks the permissions to perform the specified CreateJob or
      # UpdateJob action.

      class KMSRequestFailedException < ServiceError
      end

      # You get this exception if you call CreateReturnShippingLabel and a valid return shipping label
      # already exists. In this case, use DescribeReturnShippingLabel to get the URL.

      class ReturnShippingLabelAlreadyExistsException < ServiceError
      end

      # The address is either outside the serviceable area for your region, or an error occurred. Check the
      # address with your region's carrier and try again. If the issue persists, contact Amazon Web Services
      # Support.

      class UnsupportedAddressException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClusterLimitExceededException"
          ClusterLimitExceededException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "Ec2RequestFailedException"
          Ec2RequestFailedException.new(message)
        when "InvalidAddressException"
          InvalidAddressException.new(message)
        when "InvalidInputCombinationException"
          InvalidInputCombinationException.new(message)
        when "InvalidJobStateException"
          InvalidJobStateException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidResourceException"
          InvalidResourceException.new(message)
        when "KMSRequestFailedException"
          KMSRequestFailedException.new(message)
        when "ReturnShippingLabelAlreadyExistsException"
          ReturnShippingLabelAlreadyExistsException.new(message)
        when "UnsupportedAddressException"
          UnsupportedAddressException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
