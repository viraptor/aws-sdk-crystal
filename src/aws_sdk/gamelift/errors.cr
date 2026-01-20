module AwsSdk
  module GameLift
    module Errors
      class ServiceError < Exception
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      class ConflictException < ServiceError
      end

      # The specified fleet has no available instances to fulfill a CreateGameSession request. Clients can
      # retry such requests immediately or after a waiting period.

      class FleetCapacityExceededException < ServiceError
      end

      # The game instance is currently full and cannot allow the requested player(s) to join. Clients can
      # retry such requests immediately or after a waiting period.

      class GameSessionFullException < ServiceError
      end

      # A game session with this custom ID string already exists in this fleet. Resolve this conflict before
      # retrying this request.

      class IdempotentParameterMismatchException < ServiceError
      end

      # The service encountered an unrecoverable internal failure while processing the request. Clients can
      # retry such requests immediately or after a waiting period.

      class InternalServiceException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a resource associated with
      # the request and/or the fleet. Resolve the conflict before retrying.

      class InvalidFleetStatusException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a resource associated with
      # the request and/or the game instance. Resolve the conflict before retrying.

      class InvalidGameSessionStatusException < ServiceError
      end

      # One or more parameter values in the request are invalid. Correct the invalid parameter values before
      # retrying.

      class InvalidRequestException < ServiceError
      end

      # The requested operation would cause the resource to exceed the allowed service limit. Resolve the
      # issue before retrying.

      class LimitExceededException < ServiceError
      end

      # The requested resources was not found. The resource was either not created yet or deleted.

      class NotFoundException < ServiceError
      end

      # The operation failed because Amazon GameLift Servers has not yet finished validating this compute.
      # We recommend attempting 8 to 10 retries over 3 to 5 minutes with exponential backoffs and jitter .

      class NotReadyException < ServiceError
      end

      # The specified game server group has no available game servers to fulfill a ClaimGameServer request.
      # Clients can retry such requests immediately or after a waiting period.

      class OutOfCapacityException < ServiceError
      end

      # The requested tagging operation did not succeed. This may be due to invalid tag format or the
      # maximum tag limit may have been exceeded. Resolve the issue before retrying.

      class TaggingFailedException < ServiceError
      end

      # The service is unable to resolve the routing for a particular alias because it has a terminal
      # RoutingStrategy associated with it. The message returned in this exception is the message defined in
      # the routing strategy itself. Such requests should only be retried if the routing strategy for the
      # specified alias is modified.

      class TerminalRoutingStrategyException < ServiceError
      end

      # The client failed authentication. Clients should not retry such requests.

      class UnauthorizedException < ServiceError
      end

      # The requested operation is not supported in the Region specified.

      class UnsupportedRegionException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "FleetCapacityExceededException"
          FleetCapacityExceededException.new(message)
        when "GameSessionFullException"
          GameSessionFullException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidFleetStatusException"
          InvalidFleetStatusException.new(message)
        when "InvalidGameSessionStatusException"
          InvalidGameSessionStatusException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "NotReadyException"
          NotReadyException.new(message)
        when "OutOfCapacityException"
          OutOfCapacityException.new(message)
        when "TaggingFailedException"
          TaggingFailedException.new(message)
        when "TerminalRoutingStrategyException"
          TerminalRoutingStrategyException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UnsupportedRegionException"
          UnsupportedRegionException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
