module Aws
  module DynamoDB
    module Errors
      class ServiceError < Exception
      end

      # There is another ongoing conflicting backup control plane operation on the table. The backup is
      # either being created, deleted or restored to a table.

      class BackupInUseException < ServiceError
      end

      # Backup not found for the given BackupARN.

      class BackupNotFoundException < ServiceError
      end

      # A condition specified in the operation failed to be evaluated.

      class ConditionalCheckFailedException < ServiceError
      end

      # Backups have not yet been enabled for this table.

      class ContinuousBackupsUnavailableException < ServiceError
      end

      # There was an attempt to insert an item with the same primary key as an item that already exists in
      # the DynamoDB table.

      class DuplicateItemException < ServiceError
      end

      # There was a conflict when writing to the specified S3 bucket.

      class ExportConflictException < ServiceError
      end

      # The specified export was not found.

      class ExportNotFoundException < ServiceError
      end

      # The specified global table already exists.

      class GlobalTableAlreadyExistsException < ServiceError
      end

      # The specified global table does not exist.

      class GlobalTableNotFoundException < ServiceError
      end

      # DynamoDB rejected the request because you retried a request with a different payload but with an
      # idempotent token that was already used.

      class IdempotentParameterMismatchException < ServiceError
      end

      # There was a conflict when importing from the specified S3 source. This can occur when the current
      # import conflicts with a previous import request that had the same client token.

      class ImportConflictException < ServiceError
      end

      # The specified import was not found.

      class ImportNotFoundException < ServiceError
      end

      # The operation tried to access a nonexistent index.

      class IndexNotFoundException < ServiceError
      end

      # An error occurred on the server side.

      class InternalServerError < ServiceError
      end

      # The specified ExportTime is outside of the point in time recovery window.

      class InvalidExportTimeException < ServiceError
      end

      # An invalid restore time was specified. RestoreDateTime must be between EarliestRestorableDateTime
      # and LatestRestorableDateTime.

      class InvalidRestoreTimeException < ServiceError
      end

      # An item collection is too large. This exception is only returned for tables that have one or more
      # local secondary indexes.

      class ItemCollectionSizeLimitExceededException < ServiceError
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

      # Point in time recovery has not yet been enabled for this source table.

      class PointInTimeRecoveryUnavailableException < ServiceError
      end

      # The operation tried to access a nonexistent resource-based policy. If you specified an
      # ExpectedRevisionId , it's possible that a policy is present for the resource but its revision ID
      # didn't match the expected value.

      class PolicyNotFoundException < ServiceError
      end

      # The request was denied due to request throttling. For detailed information about why the request was
      # throttled and the ARN of the impacted resource, find the ThrottlingReason field in the returned
      # exception. The Amazon Web Services SDKs for DynamoDB automatically retry requests that receive this
      # exception. Your request is eventually successful, unless your retry queue is too large to finish.
      # Reduce the frequency of requests and use exponential backoff. For more information, go to Error
      # Retries and Exponential Backoff in the Amazon DynamoDB Developer Guide .

      class ProvisionedThroughputExceededException < ServiceError
      end

      # The specified replica is already part of the global table.

      class ReplicaAlreadyExistsException < ServiceError
      end

      # The specified replica is no longer part of the global table.

      class ReplicaNotFoundException < ServiceError
      end

      # The request was rejected because one or more items in the request are being modified by a request in
      # another Region.

      class ReplicatedWriteConflictException < ServiceError
      end

      # Throughput exceeds the current throughput quota for your account. For detailed information about why
      # the request was throttled and the ARN of the impacted resource, find the ThrottlingReason field in
      # the returned exception. Contact Amazon Web Services Support to request a quota increase.

      class RequestLimitExceeded < ServiceError
      end

      # The operation conflicts with the resource's availability. For example: You attempted to recreate an
      # existing table. You tried to delete a table currently in the CREATING state. You tried to update a
      # resource that was already being updated. When appropriate, wait for the ongoing update to complete
      # and attempt the request again.

      class ResourceInUseException < ServiceError
      end

      # The operation tried to access a nonexistent table or index. The resource might not be specified
      # correctly, or its status might not be ACTIVE .

      class ResourceNotFoundException < ServiceError
      end

      # A target table with the specified name already exists.

      class TableAlreadyExistsException < ServiceError
      end

      # A target table with the specified name is either being created or deleted.

      class TableInUseException < ServiceError
      end

      # A source table with the name TableName does not currently exist within the subscriber's account or
      # the subscriber is operating in the wrong Amazon Web Services Region.

      class TableNotFoundException < ServiceError
      end

      # The request was denied due to request throttling. For detailed information about why the request was
      # throttled and the ARN of the impacted resource, find the ThrottlingReason field in the returned
      # exception.

      class ThrottlingException < ServiceError
      end

      # The entire transaction request was canceled. DynamoDB cancels a TransactWriteItems request under the
      # following circumstances: A condition in one of the condition expressions is not met. A table in the
      # TransactWriteItems request is in a different account or region. More than one action in the
      # TransactWriteItems operation targets the same item. There is insufficient provisioned capacity for
      # the transaction to be completed. An item size becomes too large (larger than 400 KB), or a local
      # secondary index (LSI) becomes too large, or a similar validation error occurs because of changes
      # made by the transaction. There is a user error, such as an invalid data format. There is an ongoing
      # TransactWriteItems operation that conflicts with a concurrent TransactWriteItems request. In this
      # case the TransactWriteItems operation fails with a TransactionCanceledException . DynamoDB cancels a
      # TransactGetItems request under the following circumstances: There is an ongoing TransactGetItems
      # operation that conflicts with a concurrent PutItem , UpdateItem , DeleteItem or TransactWriteItems
      # request. In this case the TransactGetItems operation fails with a TransactionCanceledException . A
      # table in the TransactGetItems request is in a different account or region. There is insufficient
      # provisioned capacity for the transaction to be completed. There is a user error, such as an invalid
      # data format. If using Java, DynamoDB lists the cancellation reasons on the CancellationReasons
      # property. This property is not set for other languages. Transaction cancellation reasons are ordered
      # in the order of requested items, if an item has no error it will have None code and Null message.
      # Cancellation reason codes and possible error messages: No Errors: Code: None Message: null
      # Conditional Check Failed: Code: ConditionalCheckFailed Message: The conditional request failed. Item
      # Collection Size Limit Exceeded: Code: ItemCollectionSizeLimitExceeded Message: Collection size
      # exceeded. Transaction Conflict: Code: TransactionConflict Message: Transaction is ongoing for the
      # item. Provisioned Throughput Exceeded: Code: ProvisionedThroughputExceeded Messages: The level of
      # configured provisioned throughput for the table was exceeded. Consider increasing your provisioning
      # level with the UpdateTable API. This Message is received when provisioned throughput is exceeded is
      # on a provisioned DynamoDB table. The level of configured provisioned throughput for one or more
      # global secondary indexes of the table was exceeded. Consider increasing your provisioning level for
      # the under-provisioned global secondary indexes with the UpdateTable API. This message is returned
      # when provisioned throughput is exceeded is on a provisioned GSI. Throttling Error: Code:
      # ThrottlingError Messages: Throughput exceeds the current capacity of your table or index. DynamoDB
      # is automatically scaling your table or index so please try again shortly. If exceptions persist,
      # check if you have a hot key:
      # https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-partition-key-design.html. This
      # message is returned when writes get throttled on an On-Demand table as DynamoDB is automatically
      # scaling the table. Throughput exceeds the current capacity for one or more global secondary indexes.
      # DynamoDB is automatically scaling your index so please try again shortly. This message is returned
      # when writes get throttled on an On-Demand GSI as DynamoDB is automatically scaling the GSI.
      # Validation Error: Code: ValidationError Messages: One or more parameter values were invalid. The
      # update expression attempted to update the secondary index key beyond allowed size limits. The update
      # expression attempted to update the secondary index key to unsupported type. An operand in the update
      # expression has an incorrect data type. Item size to update has exceeded the maximum allowed size.
      # Number overflow. Attempting to store a number with magnitude larger than supported range. Type
      # mismatch for attribute to update. Nesting Levels have exceeded supported limits. The document path
      # provided in the update expression is invalid for update. The provided expression refers to an
      # attribute that does not exist in the item.

      class TransactionCanceledException < ServiceError
      end

      # Operation was rejected because there is an ongoing transaction for the item.

      class TransactionConflictException < ServiceError
      end

      # The transaction with the given request token is already in progress. Recommended Settings This is a
      # general recommendation for handling the TransactionInProgressException . These settings help ensure
      # that the client retries will trigger completion of the ongoing TransactWriteItems request. Set
      # clientExecutionTimeout to a value that allows at least one retry to be processed after 5 seconds
      # have elapsed since the first attempt for the TransactWriteItems operation. Set socketTimeout to a
      # value a little lower than the requestTimeout setting. requestTimeout should be set based on the time
      # taken for the individual retries of a single HTTP request for your use case, but setting it to 1
      # second or higher should work well to reduce chances of retries and TransactionInProgressException
      # errors. Use exponential backoff when retrying and tune backoff if needed. Assuming default retry
      # policy , example timeout settings based on the guidelines above are as follows: Example timeline:
      # 0-1000 first attempt 1000-1500 first sleep/delay (default retry policy uses 500 ms as base delay for
      # 4xx errors) 1500-2500 second attempt 2500-3500 second sleep/delay (500 * 2, exponential backoff)
      # 3500-4500 third attempt 4500-6500 third sleep/delay (500 * 2^2) 6500-7500 fourth attempt (this can
      # trigger inline recovery since 5 seconds have elapsed since the first attempt reached TC)

      class TransactionInProgressException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BackupInUseException"
          BackupInUseException.new(message)
        when "BackupNotFoundException"
          BackupNotFoundException.new(message)
        when "ConditionalCheckFailedException"
          ConditionalCheckFailedException.new(message)
        when "ContinuousBackupsUnavailableException"
          ContinuousBackupsUnavailableException.new(message)
        when "DuplicateItemException"
          DuplicateItemException.new(message)
        when "ExportConflictException"
          ExportConflictException.new(message)
        when "ExportNotFoundException"
          ExportNotFoundException.new(message)
        when "GlobalTableAlreadyExistsException"
          GlobalTableAlreadyExistsException.new(message)
        when "GlobalTableNotFoundException"
          GlobalTableNotFoundException.new(message)
        when "IdempotentParameterMismatchException"
          IdempotentParameterMismatchException.new(message)
        when "ImportConflictException"
          ImportConflictException.new(message)
        when "ImportNotFoundException"
          ImportNotFoundException.new(message)
        when "IndexNotFoundException"
          IndexNotFoundException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidExportTimeException"
          InvalidExportTimeException.new(message)
        when "InvalidRestoreTimeException"
          InvalidRestoreTimeException.new(message)
        when "ItemCollectionSizeLimitExceededException"
          ItemCollectionSizeLimitExceededException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PointInTimeRecoveryUnavailableException"
          PointInTimeRecoveryUnavailableException.new(message)
        when "PolicyNotFoundException"
          PolicyNotFoundException.new(message)
        when "ProvisionedThroughputExceededException"
          ProvisionedThroughputExceededException.new(message)
        when "ReplicaAlreadyExistsException"
          ReplicaAlreadyExistsException.new(message)
        when "ReplicaNotFoundException"
          ReplicaNotFoundException.new(message)
        when "ReplicatedWriteConflictException"
          ReplicatedWriteConflictException.new(message)
        when "RequestLimitExceeded"
          RequestLimitExceeded.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TableAlreadyExistsException"
          TableAlreadyExistsException.new(message)
        when "TableInUseException"
          TableInUseException.new(message)
        when "TableNotFoundException"
          TableNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TransactionCanceledException"
          TransactionCanceledException.new(message)
        when "TransactionConflictException"
          TransactionConflictException.new(message)
        when "TransactionInProgressException"
          TransactionInProgressException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
