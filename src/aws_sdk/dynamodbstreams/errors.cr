module AwsSdk
  module DynamoDBStreams
    module Errors
      class ServiceError < Exception
      end

      # The shard iterator has expired and can no longer be used to retrieve stream records. A shard
      # iterator expires 15 minutes after it is retrieved using the GetShardIterator action.

      class ExpiredIteratorException < ServiceError
      end

      # An error occurred on the server side.

      class InternalServerError < ServiceError
      end

      # There is no limit to the number of daily on-demand backups that can be taken. For most purposes, up
      # to 500 simultaneous table operations are allowed per account. These operations include CreateTable ,
      # UpdateTable , DeleteTable , UpdateTimeToLive , RestoreTableFromBackup , and
      # RestoreTableToPointInTime . When you are creating a table with one or more secondary indexes, you
      # can have up to 250 such requests running at a time. However, if the table or index specifications
      # are complex, then DynamoDB might temporarily reduce the number of concurrent operations. When
      # importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.
      # There is a soft account quota of 2,500 tables. GetRecords was called with a value of more than 1000
      # for the limit request parameter. More than 2 processes are reading from the same streams shard at
      # the same time. Exceeding this limit may result in request throttling.

      class LimitExceededException < ServiceError
      end

      # The operation tried to access a nonexistent table or index. The resource might not be specified
      # correctly, or its status might not be ACTIVE .

      class ResourceNotFoundException < ServiceError
      end

      # The operation attempted to read past the oldest stream record in a shard. In DynamoDB Streams, there
      # is a 24 hour limit on data retention. Stream records whose age exceeds this limit are subject to
      # removal (trimming) from the stream. You might receive a TrimmedDataAccessException if: You request a
      # shard iterator with a sequence number older than the trim point (24 hours). You obtain a shard
      # iterator, but before you use the iterator in a GetRecords request, a stream record in the shard
      # exceeds the 24 hour period and is trimmed. This causes the iterator to access a record that no
      # longer exists.

      class TrimmedDataAccessException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ExpiredIteratorException"
          ExpiredIteratorException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TrimmedDataAccessException"
          TrimmedDataAccessException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
