module AwsSdk
  module DynamoDBStreams
    module Errors
      class ServiceError < Exception
      end

      class ExpiredIteratorException < ServiceError
      end

      class InternalServerError < ServiceError
      end

      class LimitExceededException < ServiceError
      end

      class ResourceNotFoundException < ServiceError
      end

      class TrimmedDataAccessException < ServiceError
      end
    end
  end
end
