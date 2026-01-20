require "json"

module AwsSdk
  module SQS
    module Types


      struct AddPermissionRequest
        include JSON::Serializable

        # The Amazon Web Services account numbers of the principals who are to receive permission. For
        # information about locating the Amazon Web Services account identification, see Your Amazon Web
        # Services Identifiers in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "AWSAccountIds")]
        getter aws_account_ids : Array(String)

        # The action the client wants to allow for the specified principal. Valid values: the name of any
        # action or * . For more information about these actions, see Overview of Managing Access Permissions
        # to Your Amazon Simple Queue Service Resource in the Amazon SQS Developer Guide . Specifying
        # SendMessage , DeleteMessage , or ChangeMessageVisibility for ActionName.n also grants permissions
        # for the corresponding batch versions of those actions: SendMessageBatch , DeleteMessageBatch , and
        # ChangeMessageVisibilityBatch .

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # The unique identification of the permission you're setting (for example, AliceSendMessage ). Maximum
        # 80 characters. Allowed characters include alphanumeric characters, hyphens ( - ), and underscores (
        # _ ).

        @[JSON::Field(key: "Label")]
        getter label : String

        # The URL of the Amazon SQS queue to which permissions are added. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @aws_account_ids : Array(String),
          @actions : Array(String),
          @label : String,
          @queue_url : String
        )
        end
      end

      # Two or more batch entries in the request have the same Id .

      struct BatchEntryIdsNotDistinct
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The length of all the messages put together is more than the limit.

      struct BatchRequestTooLong
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Gives a detailed description of the result of an action on each entry in the request.

      struct BatchResultErrorEntry
        include JSON::Serializable

        # An error code representing why the action failed on this entry.

        @[JSON::Field(key: "Code")]
        getter code : String

        # The Id of an entry in a batch request.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Specifies whether the error happened due to the caller of the batch API action.

        @[JSON::Field(key: "SenderFault")]
        getter sender_fault : Bool

        # A message explaining why the action failed on this entry.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String,
          @id : String,
          @sender_fault : Bool,
          @message : String? = nil
        )
        end
      end


      struct CancelMessageMoveTaskRequest
        include JSON::Serializable

        # An identifier associated with a message movement task.

        @[JSON::Field(key: "TaskHandle")]
        getter task_handle : String

        def initialize(
          @task_handle : String
        )
        end
      end


      struct CancelMessageMoveTaskResult
        include JSON::Serializable

        # The approximate number of messages already moved to the destination queue.

        @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
        getter approximate_number_of_messages_moved : Int64?

        def initialize(
          @approximate_number_of_messages_moved : Int64? = nil
        )
        end
      end


      struct ChangeMessageVisibilityBatchRequest
        include JSON::Serializable

        # Lists the receipt handles of the messages for which the visibility timeout must be changed.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::ChangeMessageVisibilityBatchRequestEntry)

        # The URL of the Amazon SQS queue whose messages' visibility is changed. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @entries : Array(Types::ChangeMessageVisibilityBatchRequestEntry),
          @queue_url : String
        )
        end
      end

      # Encloses a receipt handle and an entry ID for each message in ChangeMessageVisibilityBatch .

      struct ChangeMessageVisibilityBatchRequestEntry
        include JSON::Serializable

        # An identifier for this particular receipt handle used to communicate the result. The Id s of a batch
        # request need to be unique within a request. This identifier can have up to 80 characters. The
        # following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).

        @[JSON::Field(key: "Id")]
        getter id : String

        # A receipt handle.

        @[JSON::Field(key: "ReceiptHandle")]
        getter receipt_handle : String

        # The new value (in seconds) for the message's visibility timeout.

        @[JSON::Field(key: "VisibilityTimeout")]
        getter visibility_timeout : Int32?

        def initialize(
          @id : String,
          @receipt_handle : String,
          @visibility_timeout : Int32? = nil
        )
        end
      end

      # For each message in the batch, the response contains a ChangeMessageVisibilityBatchResultEntry tag
      # if the message succeeds or a BatchResultErrorEntry tag if the message fails.

      struct ChangeMessageVisibilityBatchResult
        include JSON::Serializable

        # A list of BatchResultErrorEntry items.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::BatchResultErrorEntry)

        # A list of ChangeMessageVisibilityBatchResultEntry items.

        @[JSON::Field(key: "Successful")]
        getter successful : Array(Types::ChangeMessageVisibilityBatchResultEntry)

        def initialize(
          @failed : Array(Types::BatchResultErrorEntry),
          @successful : Array(Types::ChangeMessageVisibilityBatchResultEntry)
        )
        end
      end

      # Encloses the Id of an entry in ChangeMessageVisibilityBatch .

      struct ChangeMessageVisibilityBatchResultEntry
        include JSON::Serializable

        # Represents a message whose visibility timeout has been changed successfully.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct ChangeMessageVisibilityRequest
        include JSON::Serializable

        # The URL of the Amazon SQS queue whose message's visibility is changed. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # The receipt handle associated with the message, whose visibility timeout is changed. This parameter
        # is returned by the ReceiveMessage action.

        @[JSON::Field(key: "ReceiptHandle")]
        getter receipt_handle : String

        # The new value for the message's visibility timeout (in seconds). Values range: 0 to 43200 . Maximum:
        # 12 hours.

        @[JSON::Field(key: "VisibilityTimeout")]
        getter visibility_timeout : Int32

        def initialize(
          @queue_url : String,
          @receipt_handle : String,
          @visibility_timeout : Int32
        )
        end
      end


      struct CreateQueueRequest
        include JSON::Serializable

        # The name of the new queue. The following limits apply to this name: A queue name can have up to 80
        # characters. Valid values: alphanumeric characters, hyphens ( - ), and underscores ( _ ). A FIFO
        # queue name must end with the .fifo suffix. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueName")]
        getter queue_name : String

        # A map of attributes with their corresponding values. The following lists the names, descriptions,
        # and values of the special request parameters that the CreateQueue action uses: DelaySeconds – The
        # length of time, in seconds, for which the delivery of all messages in the queue is delayed. Valid
        # values: An integer from 0 to 900 seconds (15 minutes). Default: 0. MaximumMessageSize – The limit of
        # how many bytes a message can contain before Amazon SQS rejects it. Valid values: An integer from
        # 1,024 bytes (1 KiB) to 1,048,576 bytes (1 MiB). Default: 1,048,576 bytes (1 MiB).
        # MessageRetentionPeriod – The length of time, in seconds, for which Amazon SQS retains a message.
        # Valid values: An integer from 60 seconds (1 minute) to 1,209,600 seconds (14 days). Default: 345,600
        # (4 days). When you change a queue's attributes, the change can take up to 60 seconds for most of the
        # attributes to propagate throughout the Amazon SQS system. Changes made to the MessageRetentionPeriod
        # attribute can take up to 15 minutes and will impact existing messages in the queue potentially
        # causing them to be expired and deleted if the MessageRetentionPeriod is reduced below the age of
        # existing messages. Policy – The queue's policy. A valid Amazon Web Services policy. For more
        # information about policy structure, see Overview of Amazon Web Services IAM Policies in the IAM User
        # Guide . ReceiveMessageWaitTimeSeconds – The length of time, in seconds, for which a ReceiveMessage
        # action waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0.
        # VisibilityTimeout – The visibility timeout for the queue, in seconds. Valid values: An integer from
        # 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see
        # Visibility Timeout in the Amazon SQS Developer Guide . The following attributes apply only to
        # dead-letter queues: RedrivePolicy – The string that includes the parameters for the dead-letter
        # queue functionality of the source queue as a JSON object. The parameters are as follows:
        # deadLetterTargetArn – The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS
        # moves messages after the value of maxReceiveCount is exceeded. maxReceiveCount – The number of times
        # a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10.
        # When the ReceiveCount for a message exceeds the maxReceiveCount for a queue, Amazon SQS moves the
        # message to the dead-letter-queue. RedriveAllowPolicy – The string that includes the parameters for
        # the permissions for the dead-letter queue redrive permission and which source queues can specify
        # dead-letter queues as a JSON object. The parameters are as follows: redrivePermission – The
        # permission type that defines which source queues can specify the current queue as the dead-letter
        # queue. Valid values are: allowAll – (Default) Any source queues in this Amazon Web Services account
        # in the same Region can specify this queue as the dead-letter queue. denyAll – No source queues can
        # specify this queue as the dead-letter queue. byQueue – Only queues specified by the sourceQueueArns
        # parameter can specify this queue as the dead-letter queue. sourceQueueArns – The Amazon Resource
        # Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive
        # messages. You can specify this parameter only when the redrivePermission parameter is set to byQueue
        # . You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify
        # dead-letter queues, set the redrivePermission parameter to allowAll . The dead-letter queue of a
        # FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also
        # be a standard queue. The following attributes apply only to server-side-encryption : KmsMasterKeyId
        # – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK.
        # For more information, see Key Terms . While the alias of the Amazon Web Services managed CMK for
        # Amazon SQS is always alias/aws/sqs , the alias of a custom CMK can, for example, be alias/ MyAlias .
        # For more examples, see KeyId in the Key Management Service API Reference .
        # KmsDataKeyReusePeriodSeconds – The length of time, in seconds, for which Amazon SQS can reuse a data
        # key to encrypt or decrypt messages before calling KMS again. An integer representing seconds,
        # between 60 seconds (1 minute) and 86,400 seconds (24 hours). Default: 300 (5 minutes). A shorter
        # time period provides better security but results in more calls to KMS which might incur charges
        # after Free Tier. For more information, see How Does the Data Key Reuse Period Work?
        # SqsManagedSseEnabled – Enables server-side queue encryption using SQS owned encryption keys. Only
        # one server-side encryption option is supported per queue (for example, SSE-KMS or SSE-SQS ). The
        # following attributes apply only to FIFO (first-in-first-out) queues : FifoQueue – Designates a queue
        # as FIFO. Valid values are true and false . If you don't specify the FifoQueue attribute, Amazon SQS
        # creates a standard queue. You can provide this attribute only during queue creation. You can't
        # change it for an existing queue. When you set this attribute, you must also provide the
        # MessageGroupId for your messages explicitly. For more information, see FIFO queue logic in the
        # Amazon SQS Developer Guide . ContentBasedDeduplication – Enables content-based deduplication. Valid
        # values are true and false . For more information, see Exactly-once processing in the Amazon SQS
        # Developer Guide . Note the following: Every message must have a unique MessageDeduplicationId . You
        # may provide a MessageDeduplicationId explicitly. If you aren't able to provide a
        # MessageDeduplicationId and you enable ContentBasedDeduplication for your queue, Amazon SQS uses a
        # SHA-256 hash to generate the MessageDeduplicationId using the body of the message (but not the
        # attributes of the message). If you don't provide a MessageDeduplicationId and the queue doesn't have
        # ContentBasedDeduplication set, the action fails with an error. If the queue has
        # ContentBasedDeduplication set, your MessageDeduplicationId overrides the generated one. When
        # ContentBasedDeduplication is in effect, messages with identical content sent within the
        # deduplication interval are treated as duplicates and only one copy of the message is delivered. If
        # you send one message with ContentBasedDeduplication enabled and then another message with a
        # MessageDeduplicationId that is the same as the one generated for the first MessageDeduplicationId ,
        # the two messages are treated as duplicates and only one copy of the message is delivered. The
        # following attributes apply only to high throughput for FIFO queues : DeduplicationScope – Specifies
        # whether message deduplication occurs at the message group or queue level. Valid values are
        # messageGroup and queue . FifoThroughputLimit – Specifies whether the FIFO queue throughput quota
        # applies to the entire queue or per message group. Valid values are perQueue and perMessageGroupId .
        # The perMessageGroupId value is allowed only when the value for DeduplicationScope is messageGroup .
        # To enable high throughput for FIFO queues, do the following: Set DeduplicationScope to messageGroup
        # . Set FifoThroughputLimit to perMessageGroupId . If you set these attributes to anything other than
        # the values shown for enabling high throughput, normal throughput is in effect and deduplication
        # occurs as specified. For information on throughput quotas, see Quotas related to messages in the
        # Amazon SQS Developer Guide .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # Add cost allocation tags to the specified Amazon SQS queue. For an overview, see Tagging Your Amazon
        # SQS Queues in the Amazon SQS Developer Guide . When you use queue tags, keep the following
        # guidelines in mind: Adding more than 50 tags to a queue isn't recommended. Tags don't have any
        # semantic meaning. Amazon SQS interprets tags as character strings. Tags are case-sensitive. A new
        # tag with a key identical to that of an existing tag overwrites the existing tag. For a full list of
        # tag restrictions, see Quotas related to queues in the Amazon SQS Developer Guide . To be able to tag
        # a queue on creation, you must have the sqs:CreateQueue and sqs:TagQueue permissions. Cross-account
        # permissions don't apply to this action. For more information, see Grant cross-account permissions to
        # a role and a username in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @queue_name : String,
          @attributes : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns the QueueUrl attribute of the created queue.

      struct CreateQueueResult
        include JSON::Serializable

        # The URL of the created Amazon SQS queue.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String?

        def initialize(
          @queue_url : String? = nil
        )
        end
      end


      struct DeleteMessageBatchRequest
        include JSON::Serializable

        # Lists the receipt handles for the messages to be deleted.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::DeleteMessageBatchRequestEntry)

        # The URL of the Amazon SQS queue from which messages are deleted. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @entries : Array(Types::DeleteMessageBatchRequestEntry),
          @queue_url : String
        )
        end
      end

      # Encloses a receipt handle and an identifier for it.

      struct DeleteMessageBatchRequestEntry
        include JSON::Serializable

        # The identifier for this particular receipt handle. This is used to communicate the result. The Id s
        # of a batch request need to be unique within a request. This identifier can have up to 80 characters.
        # The following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).

        @[JSON::Field(key: "Id")]
        getter id : String

        # A receipt handle.

        @[JSON::Field(key: "ReceiptHandle")]
        getter receipt_handle : String

        def initialize(
          @id : String,
          @receipt_handle : String
        )
        end
      end

      # For each message in the batch, the response contains a DeleteMessageBatchResultEntry tag if the
      # message is deleted or a BatchResultErrorEntry tag if the message can't be deleted.

      struct DeleteMessageBatchResult
        include JSON::Serializable

        # A list of BatchResultErrorEntry items.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::BatchResultErrorEntry)

        # A list of DeleteMessageBatchResultEntry items.

        @[JSON::Field(key: "Successful")]
        getter successful : Array(Types::DeleteMessageBatchResultEntry)

        def initialize(
          @failed : Array(Types::BatchResultErrorEntry),
          @successful : Array(Types::DeleteMessageBatchResultEntry)
        )
        end
      end

      # Encloses the Id of an entry in DeleteMessageBatch .

      struct DeleteMessageBatchResultEntry
        include JSON::Serializable

        # Represents a successfully deleted message.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteMessageRequest
        include JSON::Serializable

        # The URL of the Amazon SQS queue from which messages are deleted. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # The receipt handle associated with the message to delete.

        @[JSON::Field(key: "ReceiptHandle")]
        getter receipt_handle : String

        def initialize(
          @queue_url : String,
          @receipt_handle : String
        )
        end
      end


      struct DeleteQueueRequest
        include JSON::Serializable

        # The URL of the Amazon SQS queue to delete. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @queue_url : String
        )
        end
      end

      # The batch request doesn't contain any entries.

      struct EmptyBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetQueueAttributesRequest
        include JSON::Serializable

        # The URL of the Amazon SQS queue whose attribute information is retrieved. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # A list of attributes for which to retrieve information. The AttributeNames parameter is optional,
        # but if you don't specify values for this parameter, the request returns empty results. In the
        # future, new attributes might be added. If you write code that calls this action, we recommend that
        # you structure your code so that it can handle new attributes gracefully. The following attributes
        # are supported: The ApproximateNumberOfMessagesDelayed , ApproximateNumberOfMessagesNotVisible , and
        # ApproximateNumberOfMessages metrics may not achieve consistency until at least 1 minute after the
        # producers stop sending messages. This period is required for the queue metadata to reach eventual
        # consistency. All – Returns all values. ApproximateNumberOfMessages – Returns the approximate number
        # of messages available for retrieval from the queue. ApproximateNumberOfMessagesDelayed – Returns the
        # approximate number of messages in the queue that are delayed and not available for reading
        # immediately. This can happen when the queue is configured as a delay queue or when a message has
        # been sent with a delay parameter. ApproximateNumberOfMessagesNotVisible – Returns the approximate
        # number of messages that are in flight. Messages are considered to be in flight if they have been
        # sent to a client but have not yet been deleted or have not yet reached the end of their visibility
        # window. CreatedTimestamp – Returns the time when the queue was created in seconds ( epoch time ).
        # DelaySeconds – Returns the default delay on the queue in seconds. LastModifiedTimestamp – Returns
        # the time when the queue was last changed in seconds ( epoch time ). MaximumMessageSize – Returns the
        # limit of how many bytes a message can contain before Amazon SQS rejects it. MessageRetentionPeriod –
        # Returns the length of time, in seconds, for which Amazon SQS retains a message. When you change a
        # queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate
        # throughout the Amazon SQS system. Changes made to the MessageRetentionPeriod attribute can take up
        # to 15 minutes and will impact existing messages in the queue potentially causing them to be expired
        # and deleted if the MessageRetentionPeriod is reduced below the age of existing messages. Policy –
        # Returns the policy of the queue. QueueArn – Returns the Amazon resource name (ARN) of the queue.
        # ReceiveMessageWaitTimeSeconds – Returns the length of time, in seconds, for which the ReceiveMessage
        # action waits for a message to arrive. VisibilityTimeout – Returns the visibility timeout for the
        # queue. For more information about the visibility timeout, see Visibility Timeout in the Amazon SQS
        # Developer Guide . The following attributes apply only to dead-letter queues: RedrivePolicy – The
        # string that includes the parameters for the dead-letter queue functionality of the source queue as a
        # JSON object. The parameters are as follows: deadLetterTargetArn – The Amazon Resource Name (ARN) of
        # the dead-letter queue to which Amazon SQS moves messages after the value of maxReceiveCount is
        # exceeded. maxReceiveCount – The number of times a message is delivered to the source queue before
        # being moved to the dead-letter queue. Default: 10. When the ReceiveCount for a message exceeds the
        # maxReceiveCount for a queue, Amazon SQS moves the message to the dead-letter-queue.
        # RedriveAllowPolicy – The string that includes the parameters for the permissions for the dead-letter
        # queue redrive permission and which source queues can specify dead-letter queues as a JSON object.
        # The parameters are as follows: redrivePermission – The permission type that defines which source
        # queues can specify the current queue as the dead-letter queue. Valid values are: allowAll –
        # (Default) Any source queues in this Amazon Web Services account in the same Region can specify this
        # queue as the dead-letter queue. denyAll – No source queues can specify this queue as the dead-letter
        # queue. byQueue – Only queues specified by the sourceQueueArns parameter can specify this queue as
        # the dead-letter queue. sourceQueueArns – The Amazon Resource Names (ARN)s of the source queues that
        # can specify this queue as the dead-letter queue and redrive messages. You can specify this parameter
        # only when the redrivePermission parameter is set to byQueue . You can specify up to 10 source queue
        # ARNs. To allow more than 10 source queues to specify dead-letter queues, set the redrivePermission
        # parameter to allowAll . The dead-letter queue of a FIFO queue must also be a FIFO queue. Similarly,
        # the dead-letter queue of a standard queue must also be a standard queue. The following attributes
        # apply only to server-side-encryption : KmsMasterKeyId – Returns the ID of an Amazon Web Services
        # managed customer master key (CMK) for Amazon SQS or a custom CMK. For more information, see Key
        # Terms . KmsDataKeyReusePeriodSeconds – Returns the length of time, in seconds, for which Amazon SQS
        # can reuse a data key to encrypt or decrypt messages before calling KMS again. For more information,
        # see How Does the Data Key Reuse Period Work? . SqsManagedSseEnabled – Returns information about
        # whether the queue is using SSE-SQS encryption using SQS owned encryption keys. Only one server-side
        # encryption option is supported per queue (for example, SSE-KMS or SSE-SQS ). The following
        # attributes apply only to FIFO (first-in-first-out) queues : FifoQueue – Returns information about
        # whether the queue is FIFO. For more information, see FIFO queue logic in the Amazon SQS Developer
        # Guide . To determine whether a queue is FIFO , you can check whether QueueName ends with the .fifo
        # suffix. ContentBasedDeduplication – Returns whether content-based deduplication is enabled for the
        # queue. For more information, see Exactly-once processing in the Amazon SQS Developer Guide . The
        # following attributes apply only to high throughput for FIFO queues : DeduplicationScope – Specifies
        # whether message deduplication occurs at the message group or queue level. Valid values are
        # messageGroup and queue . FifoThroughputLimit – Specifies whether the FIFO queue throughput quota
        # applies to the entire queue or per message group. Valid values are perQueue and perMessageGroupId .
        # The perMessageGroupId value is allowed only when the value for DeduplicationScope is messageGroup .
        # To enable high throughput for FIFO queues, do the following: Set DeduplicationScope to messageGroup
        # . Set FifoThroughputLimit to perMessageGroupId . If you set these attributes to anything other than
        # the values shown for enabling high throughput, normal throughput is in effect and deduplication
        # occurs as specified. For information on throughput quotas, see Quotas related to messages in the
        # Amazon SQS Developer Guide .

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        def initialize(
          @queue_url : String,
          @attribute_names : Array(String)? = nil
        )
        end
      end

      # A list of returned queue attributes.

      struct GetQueueAttributesResult
        include JSON::Serializable

        # A map of attributes to their respective values.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @attributes : Hash(String, String)? = nil
        )
        end
      end

      # Retrieves the URL of an existing queue based on its name and, optionally, the Amazon Web Services
      # account ID.

      struct GetQueueUrlRequest
        include JSON::Serializable

        # (Required) The name of the queue for which you want to fetch the URL. The name can be up to 80
        # characters long and can include alphanumeric characters, hyphens (-), and underscores (_). Queue
        # URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueName")]
        getter queue_name : String

        # (Optional) The Amazon Web Services account ID of the account that created the queue. This is only
        # required when you are attempting to access a queue owned by another Amazon Web Services account.

        @[JSON::Field(key: "QueueOwnerAWSAccountId")]
        getter queue_owner_aws_account_id : String?

        def initialize(
          @queue_name : String,
          @queue_owner_aws_account_id : String? = nil
        )
        end
      end

      # For more information, see Interpreting Responses in the Amazon SQS Developer Guide .

      struct GetQueueUrlResult
        include JSON::Serializable

        # The URL of the queue.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String?

        def initialize(
          @queue_url : String? = nil
        )
        end
      end

      # The specified ID is invalid.

      struct InvalidAddress
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified attribute doesn't exist.

      struct InvalidAttributeName
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A queue attribute value is invalid.

      struct InvalidAttributeValue
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Id of a batch entry in a batch request doesn't abide by the specification.

      struct InvalidBatchEntryId
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified receipt handle isn't valid for the current version.

      struct InvalidIdFormat
        include JSON::Serializable

        def initialize
        end
      end

      # The message contains characters outside the allowed set.

      struct InvalidMessageContents
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was not made over HTTPS or did not use SigV4 for signing.

      struct InvalidSecurity
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The caller doesn't have the required KMS access.

      struct KmsAccessDenied
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct KmsDisabled
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected for one of the following reasons: The KeyUsage value of the KMS key is
      # incompatible with the API operation. The encryption algorithm or signing algorithm specified for the
      # operation is incompatible with the type of key material in the KMS key (KeySpec).

      struct KmsInvalidKeyUsage
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the state of the specified resource is not valid for this request.

      struct KmsInvalidState
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified entity or resource could not be found.

      struct KmsNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because the specified key policy isn't syntactically or semantically
      # correct.

      struct KmsOptInRequired
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon Web Services KMS throttles requests for the following conditions.

      struct KmsThrottled
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListDeadLetterSourceQueuesRequest
        include JSON::Serializable

        # The URL of a dead-letter queue. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # Maximum number of results to include in the response. Value range is 1 to 1000. You must set
        # MaxResults to receive a value for NextToken in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token to request the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @queue_url : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A list of your dead letter source queues.

      struct ListDeadLetterSourceQueuesResult
        include JSON::Serializable

        # A list of source queue URLs that have the RedrivePolicy queue attribute configured with a
        # dead-letter queue.

        @[JSON::Field(key: "queueUrls")]
        getter queue_urls : Array(String)

        # Pagination token to include in the next request. Token value is null if there are no additional
        # results to request, or if you did not set MaxResults in the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @queue_urls : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListMessageMoveTasksRequest
        include JSON::Serializable

        # The ARN of the queue whose message movement tasks are to be listed.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The maximum number of results to include in the response. The default is 1, which provides the most
        # recent message movement task. The upper limit is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @source_arn : String,
          @max_results : Int32? = nil
        )
        end
      end


      struct ListMessageMoveTasksResult
        include JSON::Serializable

        # A list of message movement tasks and their attributes.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::ListMessageMoveTasksResultEntry)?

        def initialize(
          @results : Array(Types::ListMessageMoveTasksResultEntry)? = nil
        )
        end
      end

      # Contains the details of a message movement task.

      struct ListMessageMoveTasksResultEntry
        include JSON::Serializable

        # The approximate number of messages already moved to the destination queue.

        @[JSON::Field(key: "ApproximateNumberOfMessagesMoved")]
        getter approximate_number_of_messages_moved : Int64?

        # The number of messages to be moved from the source queue. This number is obtained at the time of
        # starting the message movement task and is only included after the message movement task is selected
        # to start.

        @[JSON::Field(key: "ApproximateNumberOfMessagesToMove")]
        getter approximate_number_of_messages_to_move : Int64?

        # The ARN of the destination queue if it has been specified in the StartMessageMoveTask request. If a
        # DestinationArn has not been specified in the StartMessageMoveTask request, this field value will be
        # NULL.

        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        # The task failure reason (only included if the task status is FAILED).

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The number of messages to be moved per second (the message movement rate), if it has been specified
        # in the StartMessageMoveTask request. If a MaxNumberOfMessagesPerSecond has not been specified in the
        # StartMessageMoveTask request, this field value will be NULL.

        @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
        getter max_number_of_messages_per_second : Int32?

        # The ARN of the queue that contains the messages to be moved to another queue.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The timestamp of starting the message movement task.

        @[JSON::Field(key: "StartedTimestamp")]
        getter started_timestamp : Int64?

        # The status of the message movement task. Possible values are: RUNNING, COMPLETED, CANCELLING,
        # CANCELLED, and FAILED.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # An identifier associated with a message movement task. When this field is returned in the response
        # of the ListMessageMoveTasks action, it is only populated for tasks that are in RUNNING status.

        @[JSON::Field(key: "TaskHandle")]
        getter task_handle : String?

        def initialize(
          @approximate_number_of_messages_moved : Int64? = nil,
          @approximate_number_of_messages_to_move : Int64? = nil,
          @destination_arn : String? = nil,
          @failure_reason : String? = nil,
          @max_number_of_messages_per_second : Int32? = nil,
          @source_arn : String? = nil,
          @started_timestamp : Int64? = nil,
          @status : String? = nil,
          @task_handle : String? = nil
        )
        end
      end


      struct ListQueueTagsRequest
        include JSON::Serializable

        # The URL of the queue.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @queue_url : String
        )
        end
      end


      struct ListQueueTagsResult
        include JSON::Serializable

        # The list of all tags added to the specified queue.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListQueuesRequest
        include JSON::Serializable

        # Maximum number of results to include in the response. Value range is 1 to 1000. You must set
        # MaxResults to receive a value for NextToken in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token to request the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A string to use for filtering the list results. Only those queues whose name begins with the
        # specified string are returned. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueNamePrefix")]
        getter queue_name_prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @queue_name_prefix : String? = nil
        )
        end
      end

      # A list of your queues.

      struct ListQueuesResult
        include JSON::Serializable

        # Pagination token to include in the next request. Token value is null if there are no additional
        # results to request, or if you did not set MaxResults in the request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of queue URLs, up to 1,000 entries, or the value of MaxResults that you sent in the request.

        @[JSON::Field(key: "QueueUrls")]
        getter queue_urls : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @queue_urls : Array(String)? = nil
        )
        end
      end

      # An Amazon SQS message.

      struct Message
        include JSON::Serializable

        # A map of the attributes requested in ReceiveMessage to their respective values. Supported
        # attributes: ApproximateReceiveCount ApproximateFirstReceiveTimestamp MessageDeduplicationId
        # MessageGroupId SenderId SentTimestamp SequenceNumber ApproximateFirstReceiveTimestamp and
        # SentTimestamp are each returned as an integer representing the epoch time in milliseconds.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The message's contents (not URL-encoded).

        @[JSON::Field(key: "Body")]
        getter body : String?

        # An MD5 digest of the non-URL-encoded message body string.

        @[JSON::Field(key: "MD5OfBody")]
        getter md5_of_body : String?

        # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify
        # that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating
        # the MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageAttributes")]
        getter md5_of_message_attributes : String?

        # Each message attribute consists of a Name , Type , and Value . For more information, see Amazon SQS
        # message attributes in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # A unique identifier for the message. A MessageId is considered unique across all Amazon Web Services
        # accounts for an extended period of time.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # An identifier associated with the act of receiving the message. A new receipt handle is returned
        # every time you receive a message. When deleting a message, you provide the last received receipt
        # handle to delete the message.

        @[JSON::Field(key: "ReceiptHandle")]
        getter receipt_handle : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @body : String? = nil,
          @md5_of_body : String? = nil,
          @md5_of_message_attributes : String? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_id : String? = nil,
          @receipt_handle : String? = nil
        )
        end
      end

      # The user-specified message attribute value. For string data types, the Value attribute has the same
      # restrictions on the content as the message body. For more information, see SendMessage . Name , type
      # , value and the message body must not be empty or null. All parts of the message attribute,
      # including Name , Type , and Value , are part of the message size restriction (1 MiB or 1,048,576
      # bytes).

      struct MessageAttributeValue
        include JSON::Serializable

        # Amazon SQS supports the following logical data types: String , Number , and Binary . For the Number
        # data type, you must use StringValue . You can also append custom labels. For more information, see
        # Amazon SQS Message Attributes in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # Not implemented. Reserved for future use.

        @[JSON::Field(key: "BinaryListValues")]
        getter binary_list_values : Array(Bytes)?

        # Binary type attributes can store any binary data, such as compressed data, encrypted data, or
        # images.

        @[JSON::Field(key: "BinaryValue")]
        getter binary_value : Bytes?

        # Not implemented. Reserved for future use.

        @[JSON::Field(key: "StringListValues")]
        getter string_list_values : Array(String)?

        # Strings are Unicode with UTF-8 binary encoding. For a list of code values, see ASCII Printable
        # Characters .

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @data_type : String,
          @binary_list_values : Array(Bytes)? = nil,
          @binary_value : Bytes? = nil,
          @string_list_values : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The specified message isn't in flight.

      struct MessageNotInflight
        include JSON::Serializable

        def initialize
        end
      end

      # The user-specified message system attribute value. For string data types, the Value attribute has
      # the same restrictions on the content as the message body. For more information, see SendMessage .
      # Name , type , value and the message body must not be empty or null.

      struct MessageSystemAttributeValue
        include JSON::Serializable

        # Amazon SQS supports the following logical data types: String , Number , and Binary . For the Number
        # data type, you must use StringValue . You can also append custom labels. For more information, see
        # Amazon SQS Message Attributes in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "DataType")]
        getter data_type : String

        # Not implemented. Reserved for future use.

        @[JSON::Field(key: "BinaryListValues")]
        getter binary_list_values : Array(Bytes)?

        # Binary type attributes can store any binary data, such as compressed data, encrypted data, or
        # images.

        @[JSON::Field(key: "BinaryValue")]
        getter binary_value : Bytes?

        # Not implemented. Reserved for future use.

        @[JSON::Field(key: "StringListValues")]
        getter string_list_values : Array(String)?

        # Strings are Unicode with UTF-8 binary encoding. For a list of code values, see ASCII Printable
        # Characters .

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @data_type : String,
          @binary_list_values : Array(Bytes)? = nil,
          @binary_value : Bytes? = nil,
          @string_list_values : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The specified action violates a limit. For example, ReceiveMessage returns this error if the maximum
      # number of in flight messages is reached and AddPermission returns this error if the maximum number
      # of permissions for the queue is reached.

      struct OverLimit
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the specified queue previously received a PurgeQueue request within the last 60
      # seconds (the time it can take to delete the messages in the queue).

      struct PurgeQueueInProgress
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PurgeQueueRequest
        include JSON::Serializable

        # The URL of the queue from which the PurgeQueue action deletes messages. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @queue_url : String
        )
        end
      end

      # You must wait 60 seconds after deleting a queue before you can create another queue with the same
      # name.

      struct QueueDeletedRecently
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Ensure that the QueueUrl is correct and that the queue has not been deleted.

      struct QueueDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A queue with this name already exists. Amazon SQS returns this error only if the request includes
      # attributes whose values differ from those of the existing queue.

      struct QueueNameExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified receipt handle isn't valid.

      struct ReceiptHandleIsInvalid
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Retrieves one or more messages from a specified queue.

      struct ReceiveMessageRequest
        include JSON::Serializable

        # The URL of the Amazon SQS queue from which messages are received. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # This parameter has been discontinued but will be supported for backward compatibility. To provide
        # attribute names, you are encouraged to use MessageSystemAttributeNames . A list of attributes that
        # need to be returned along with each message. These attributes include: All – Returns all values.
        # ApproximateFirstReceiveTimestamp – Returns the time the message was first received from the queue (
        # epoch time in milliseconds). ApproximateReceiveCount – Returns the number of times a message has
        # been received across all queues but not deleted. AWSTraceHeader – Returns the X-Ray trace header
        # string. SenderId For a user, returns the user ID, for example ABCDEFGHI1JKLMNOPQ23R . For an IAM
        # role, returns the IAM role ID, for example ABCDE1F2GH3I4JK5LMNOP:i-a123b456 . SentTimestamp –
        # Returns the time the message was sent to the queue ( epoch time in milliseconds).
        # SqsManagedSseEnabled – Enables server-side queue encryption using SQS owned encryption keys. Only
        # one server-side encryption option is supported per queue (for example, SSE-KMS or SSE-SQS ).
        # MessageDeduplicationId – Returns the value provided by the producer that calls the SendMessage
        # action. MessageGroupId – Returns the value provided by the producer that calls the SendMessage
        # action. SequenceNumber – Returns the value provided by Amazon SQS.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        # The maximum number of messages to return. Amazon SQS never returns more messages than this value
        # (however, fewer messages might be returned). Valid values: 1 to 10. Default: 1.

        @[JSON::Field(key: "MaxNumberOfMessages")]
        getter max_number_of_messages : Int32?

        # The name of the message attribute, where N is the index. The name can contain alphanumeric
        # characters and the underscore ( _ ), hyphen ( - ), and period ( . ). The name is case-sensitive and
        # must be unique among all attribute names for the message. The name must not start with AWS-reserved
        # prefixes such as AWS. or Amazon. (or any casing variants). The name must not start or end with a
        # period ( . ), and it should not have periods in succession ( .. ). The name can be up to 256
        # characters long. When using ReceiveMessage , you can send a list of attribute names to receive, or
        # you can return all of the attributes by specifying All or .* in your request. You can also use all
        # message attributes starting with a prefix, for example bar.* .

        @[JSON::Field(key: "MessageAttributeNames")]
        getter message_attribute_names : Array(String)?

        # A list of attributes that need to be returned along with each message. These attributes include: All
        # – Returns all values. ApproximateFirstReceiveTimestamp – Returns the time the message was first
        # received from the queue ( epoch time in milliseconds). ApproximateReceiveCount – Returns the number
        # of times a message has been received across all queues but not deleted. AWSTraceHeader – Returns the
        # X-Ray trace header string. SenderId For a user, returns the user ID, for example
        # ABCDEFGHI1JKLMNOPQ23R . For an IAM role, returns the IAM role ID, for example
        # ABCDE1F2GH3I4JK5LMNOP:i-a123b456 . SentTimestamp – Returns the time the message was sent to the
        # queue ( epoch time in milliseconds). SqsManagedSseEnabled – Enables server-side queue encryption
        # using SQS owned encryption keys. Only one server-side encryption option is supported per queue (for
        # example, SSE-KMS or SSE-SQS ). MessageDeduplicationId – Returns the value provided by the producer
        # that calls the SendMessage action. MessageGroupId – Returns the value provided by the producer that
        # calls the SendMessage action. SequenceNumber – Returns the value provided by Amazon SQS.

        @[JSON::Field(key: "MessageSystemAttributeNames")]
        getter message_system_attribute_names : Array(String)?

        # This parameter applies only to FIFO (first-in-first-out) queues. The token used for deduplication of
        # ReceiveMessage calls. If a networking issue occurs after a ReceiveMessage action, and instead of a
        # response you receive a generic error, it is possible to retry the same action with an identical
        # ReceiveRequestAttemptId to retrieve the same set of messages, even if their visibility timeout has
        # not yet expired. You can use ReceiveRequestAttemptId only for 5 minutes after a ReceiveMessage
        # action. When you set FifoQueue , a caller of the ReceiveMessage action can provide a
        # ReceiveRequestAttemptId explicitly. It is possible to retry the ReceiveMessage action with the same
        # ReceiveRequestAttemptId if none of the messages have been modified (deleted or had their visibility
        # changes). During a visibility timeout, subsequent calls with the same ReceiveRequestAttemptId return
        # the same messages and receipt handles. If a retry occurs within the deduplication interval, it
        # resets the visibility timeout. For more information, see Visibility Timeout in the Amazon SQS
        # Developer Guide . If a caller of the ReceiveMessage action still processes messages when the
        # visibility timeout expires and messages become visible, another worker consuming from the same queue
        # can receive the same messages and therefore process duplicates. Also, if a consumer whose message
        # processing time is longer than the visibility timeout tries to delete the processed messages, the
        # action fails with an error. To mitigate this effect, ensure that your application observes a safe
        # threshold before the visibility timeout expires and extend the visibility timeout as necessary.
        # While messages with a particular MessageGroupId are invisible, no more messages belonging to the
        # same MessageGroupId are returned until the visibility timeout expires. You can still receive
        # messages with another MessageGroupId from your FIFO queue as long as they are visible. If a caller
        # of ReceiveMessage can't track the ReceiveRequestAttemptId , no retries work until the original
        # visibility timeout expires. As a result, delays might occur but the messages in the queue remain in
        # a strict order. The maximum length of ReceiveRequestAttemptId is 128 characters.
        # ReceiveRequestAttemptId can contain alphanumeric characters ( a-z , A-Z , 0-9 ) and punctuation (
        # !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~ ). For best practices of using ReceiveRequestAttemptId ,
        # see Using the ReceiveRequestAttemptId Request Parameter in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "ReceiveRequestAttemptId")]
        getter receive_request_attempt_id : String?

        # The duration (in seconds) that the received messages are hidden from subsequent retrieve requests
        # after being retrieved by a ReceiveMessage request. If not specified, the default visibility timeout
        # for the queue is used, which is 30 seconds. Understanding VisibilityTimeout : When a message is
        # received from a queue, it becomes temporarily invisible to other consumers for the duration of the
        # visibility timeout. This prevents multiple consumers from processing the same message
        # simultaneously. If the message is not deleted or its visibility timeout is not extended before the
        # timeout expires, it becomes visible again and can be retrieved by other consumers. Setting an
        # appropriate visibility timeout is crucial. If it's too short, the message might become visible again
        # before processing is complete, leading to duplicate processing. If it's too long, it delays the
        # reprocessing of messages if the initial processing fails. You can adjust the visibility timeout
        # using the --visibility-timeout parameter in the receive-message command to match the processing time
        # required by your application. A message that isn't deleted or a message whose visibility isn't
        # extended before the visibility timeout expires counts as a failed receive. Depending on the
        # configuration of the queue, the message might be sent to the dead-letter queue. For more
        # information, see Visibility Timeout in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "VisibilityTimeout")]
        getter visibility_timeout : Int32?

        # The duration (in seconds) for which the call waits for a message to arrive in the queue before
        # returning. If a message is available, the call returns sooner than WaitTimeSeconds . If no messages
        # are available and the wait time expires, the call does not return a message list. If you are using
        # the Java SDK, it returns a ReceiveMessageResponse object, which has a empty list instead of a Null
        # object. To avoid HTTP errors, ensure that the HTTP response timeout for ReceiveMessage requests is
        # longer than the WaitTimeSeconds parameter. For example, with the Java SDK, you can set HTTP
        # transport settings using the NettyNioAsyncHttpClient for asynchronous clients, or the
        # ApacheHttpClient for synchronous clients.

        @[JSON::Field(key: "WaitTimeSeconds")]
        getter wait_time_seconds : Int32?

        def initialize(
          @queue_url : String,
          @attribute_names : Array(String)? = nil,
          @max_number_of_messages : Int32? = nil,
          @message_attribute_names : Array(String)? = nil,
          @message_system_attribute_names : Array(String)? = nil,
          @receive_request_attempt_id : String? = nil,
          @visibility_timeout : Int32? = nil,
          @wait_time_seconds : Int32? = nil
        )
        end
      end

      # A list of received messages.

      struct ReceiveMessageResult
        include JSON::Serializable

        # A list of messages.

        @[JSON::Field(key: "Messages")]
        getter messages : Array(Types::Message)?

        def initialize(
          @messages : Array(Types::Message)? = nil
        )
        end
      end


      struct RemovePermissionRequest
        include JSON::Serializable

        # The identification of the permission to remove. This is the label added using the AddPermission
        # action.

        @[JSON::Field(key: "Label")]
        getter label : String

        # The URL of the Amazon SQS queue from which permissions are removed. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @label : String,
          @queue_url : String
        )
        end
      end

      # The request was denied due to request throttling. Exceeds the permitted request rate for the queue
      # or for the recipient of the request. Ensure that the request rate is within the Amazon SQS limits
      # for sending messages. For more information, see Amazon SQS quotas in the Amazon SQS Developer Guide
      # .

      struct RequestThrottled
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more specified resources don't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SendMessageBatchRequest
        include JSON::Serializable

        # A list of SendMessageBatchRequestEntry items.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::SendMessageBatchRequestEntry)

        # The URL of the Amazon SQS queue to which batched messages are sent. Queue URLs and names are
        # case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @entries : Array(Types::SendMessageBatchRequestEntry),
          @queue_url : String
        )
        end
      end

      # Contains the details of a single Amazon SQS message along with an Id .

      struct SendMessageBatchRequestEntry
        include JSON::Serializable

        # An identifier for a message in this batch used to communicate the result. The Id s of a batch
        # request need to be unique within a request. This identifier can have up to 80 characters. The
        # following characters are accepted: alphanumeric characters, hyphens(-), and underscores (_).

        @[JSON::Field(key: "Id")]
        getter id : String

        # The body of the message.

        @[JSON::Field(key: "MessageBody")]
        getter message_body : String

        # The length of time, in seconds, for which a specific message is delayed. Valid values: 0 to 900.
        # Maximum: 15 minutes. Messages with a positive DelaySeconds value become available for processing
        # after the delay period is finished. If you don't specify a value, the default value for the queue is
        # applied. When you set FifoQueue , you can't set DelaySeconds per message. You can set this parameter
        # only on a queue level.

        @[JSON::Field(key: "DelaySeconds")]
        getter delay_seconds : Int32?

        # Each message attribute consists of a Name , Type , and Value . For more information, see Amazon SQS
        # message attributes in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # This parameter applies only to FIFO (first-in-first-out) queues. The token used for deduplication of
        # messages within a 5-minute minimum deduplication interval. If a message with a particular
        # MessageDeduplicationId is sent successfully, subsequent messages with the same
        # MessageDeduplicationId are accepted successfully but aren't delivered. For more information, see
        # Exactly-once processing in the Amazon SQS Developer Guide . Every message must have a unique
        # MessageDeduplicationId , You may provide a MessageDeduplicationId explicitly. If you aren't able to
        # provide a MessageDeduplicationId and you enable ContentBasedDeduplication for your queue, Amazon SQS
        # uses a SHA-256 hash to generate the MessageDeduplicationId using the body of the message (but not
        # the attributes of the message). If you don't provide a MessageDeduplicationId and the queue doesn't
        # have ContentBasedDeduplication set, the action fails with an error. If the queue has
        # ContentBasedDeduplication set, your MessageDeduplicationId overrides the generated one. When
        # ContentBasedDeduplication is in effect, messages with identical content sent within the
        # deduplication interval are treated as duplicates and only one copy of the message is delivered. If
        # you send one message with ContentBasedDeduplication enabled and then another message with a
        # MessageDeduplicationId that is the same as the one generated for the first MessageDeduplicationId ,
        # the two messages are treated as duplicates and only one copy of the message is delivered. The
        # MessageDeduplicationId is available to the consumer of the message (this can be useful for
        # troubleshooting delivery issues). If a message is sent successfully but the acknowledgement is lost
        # and the message is resent with the same MessageDeduplicationId after the deduplication interval,
        # Amazon SQS can't detect duplicate messages. Amazon SQS continues to keep track of the message
        # deduplication ID even after the message is received and deleted. The length of
        # MessageDeduplicationId is 128 characters. MessageDeduplicationId can contain alphanumeric characters
        # ( a-z , A-Z , 0-9 ) and punctuation ( !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~ ). For best
        # practices of using MessageDeduplicationId , see Using the MessageDeduplicationId Property in the
        # Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageDeduplicationId")]
        getter message_deduplication_id : String?

        # MessageGroupId is an attribute used in Amazon SQS FIFO (First-In-First-Out) and standard queues. In
        # FIFO queues, MessageGroupId organizes messages into distinct groups. Messages within the same
        # message group are always processed one at a time, in strict order, ensuring that no two messages
        # from the same group are processed simultaneously. In standard queues, using MessageGroupId enables
        # fair queues. It is used to identify the tenant a message belongs to, helping maintain consistent
        # message dwell time across all tenants during noisy neighbor events. Unlike FIFO queues, messages
        # with the same MessageGroupId can be processed in parallel, maintaining the high throughput of
        # standard queues. FIFO queues: MessageGroupId acts as the tag that specifies that a message belongs
        # to a specific message group. Messages that belong to the same message group are processed in a FIFO
        # manner (however, messages in different message groups might be processed out of order). To
        # interleave multiple ordered streams within a single queue, use MessageGroupId values (for example,
        # session data for multiple users). In this scenario, multiple consumers can process the queue, but
        # the session data of each user is processed in a FIFO fashion. If you do not provide a MessageGroupId
        # when sending a message to a FIFO queue, the action fails. ReceiveMessage might return messages with
        # multiple MessageGroupId values. For each MessageGroupId , the messages are sorted by time sent.
        # Standard queues: Use MessageGroupId in standard queues to enable fair queues. The MessageGroupId
        # identifies the tenant a message belongs to. A tenant can be any entity that shares a queue with
        # others, such as your customer, a client application, or a request type. When one tenant sends a
        # disproportionately large volume of messages or has messages that require longer processing time,
        # fair queues ensure other tenants' messages maintain low dwell time. This preserves quality of
        # service for all tenants while maintaining the scalability and throughput of standard queues. We
        # recommend that you include a MessageGroupId in all messages when using fair queues. The length of
        # MessageGroupId is 128 characters. Valid values: alphanumeric characters and punctuation
        # (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) . For best practices of using MessageGroupId , see
        # Using the MessageGroupId Property in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        # The message system attribute to send Each message system attribute consists of a Name , Type , and
        # Value . Currently, the only supported message system attribute is AWSTraceHeader . Its type must be
        # String and its value must be a correctly formatted X-Ray trace header string. The size of a message
        # system attribute doesn't count towards the total size of a message.

        @[JSON::Field(key: "MessageSystemAttributes")]
        getter message_system_attributes : Hash(String, Types::MessageSystemAttributeValue)?

        def initialize(
          @id : String,
          @message_body : String,
          @delay_seconds : Int32? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_deduplication_id : String? = nil,
          @message_group_id : String? = nil,
          @message_system_attributes : Hash(String, Types::MessageSystemAttributeValue)? = nil
        )
        end
      end

      # For each message in the batch, the response contains a SendMessageBatchResultEntry tag if the
      # message succeeds or a BatchResultErrorEntry tag if the message fails.

      struct SendMessageBatchResult
        include JSON::Serializable

        # A list of BatchResultErrorEntry items with error details about each message that can't be enqueued.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::BatchResultErrorEntry)

        # A list of SendMessageBatchResultEntry items.

        @[JSON::Field(key: "Successful")]
        getter successful : Array(Types::SendMessageBatchResultEntry)

        def initialize(
          @failed : Array(Types::BatchResultErrorEntry),
          @successful : Array(Types::SendMessageBatchResultEntry)
        )
        end
      end

      # Encloses a MessageId for a successfully-enqueued message in a SendMessageBatch .

      struct SendMessageBatchResultEntry
        include JSON::Serializable

        # An identifier for the message in this batch.

        @[JSON::Field(key: "Id")]
        getter id : String

        # An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that
        # Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the
        # MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageBody")]
        getter md5_of_message_body : String

        # An identifier for the message.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String

        # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify
        # that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating
        # the MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageAttributes")]
        getter md5_of_message_attributes : String?

        # An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to
        # verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
        # creating the MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageSystemAttributes")]
        getter md5_of_message_system_attributes : String?

        # This parameter applies only to FIFO (first-in-first-out) queues. The large, non-consecutive number
        # that Amazon SQS assigns to each message. The length of SequenceNumber is 128 bits. As SequenceNumber
        # continues to increase for a particular MessageGroupId .

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @id : String,
          @md5_of_message_body : String,
          @message_id : String,
          @md5_of_message_attributes : String? = nil,
          @md5_of_message_system_attributes : String? = nil,
          @sequence_number : String? = nil
        )
        end
      end


      struct SendMessageRequest
        include JSON::Serializable

        # The message to send. The minimum size is one character. The maximum size is 1 MiB or 1,048,576 bytes
        # A message can include only XML, JSON, and unformatted text. The following Unicode characters are
        # allowed. For more information, see the W3C specification for characters . #x9 | #xA | #xD | #x20 to
        # #xD7FF | #xE000 to #xFFFD | #x10000 to #x10FFFF If a message contains characters outside the allowed
        # set, Amazon SQS rejects the message and returns an InvalidMessageContents error. Ensure that your
        # message body includes only valid characters to avoid this exception.

        @[JSON::Field(key: "MessageBody")]
        getter message_body : String

        # The URL of the Amazon SQS queue to which a message is sent. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # The length of time, in seconds, for which to delay a specific message. Valid values: 0 to 900.
        # Maximum: 15 minutes. Messages with a positive DelaySeconds value become available for processing
        # after the delay period is finished. If you don't specify a value, the default value for the queue
        # applies. When you set FifoQueue , you can't set DelaySeconds per message. You can set this parameter
        # only on a queue level.

        @[JSON::Field(key: "DelaySeconds")]
        getter delay_seconds : Int32?

        # Each message attribute consists of a Name , Type , and Value . For more information, see Amazon SQS
        # message attributes in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageAttributes")]
        getter message_attributes : Hash(String, Types::MessageAttributeValue)?

        # This parameter applies only to FIFO (first-in-first-out) queues. The token used for deduplication of
        # sent messages. If a message with a particular MessageDeduplicationId is sent successfully, any
        # messages sent with the same MessageDeduplicationId are accepted successfully but aren't delivered
        # during the 5-minute deduplication interval. For more information, see Exactly-once processing in the
        # Amazon SQS Developer Guide . Every message must have a unique MessageDeduplicationId , You may
        # provide a MessageDeduplicationId explicitly. If you aren't able to provide a MessageDeduplicationId
        # and you enable ContentBasedDeduplication for your queue, Amazon SQS uses a SHA-256 hash to generate
        # the MessageDeduplicationId using the body of the message (but not the attributes of the message). If
        # you don't provide a MessageDeduplicationId and the queue doesn't have ContentBasedDeduplication set,
        # the action fails with an error. If the queue has ContentBasedDeduplication set, your
        # MessageDeduplicationId overrides the generated one. When ContentBasedDeduplication is in effect,
        # messages with identical content sent within the deduplication interval are treated as duplicates and
        # only one copy of the message is delivered. If you send one message with ContentBasedDeduplication
        # enabled and then another message with a MessageDeduplicationId that is the same as the one generated
        # for the first MessageDeduplicationId , the two messages are treated as duplicates and only one copy
        # of the message is delivered. The MessageDeduplicationId is available to the consumer of the message
        # (this can be useful for troubleshooting delivery issues). If a message is sent successfully but the
        # acknowledgement is lost and the message is resent with the same MessageDeduplicationId after the
        # deduplication interval, Amazon SQS can't detect duplicate messages. Amazon SQS continues to keep
        # track of the message deduplication ID even after the message is received and deleted. The maximum
        # length of MessageDeduplicationId is 128 characters. MessageDeduplicationId can contain alphanumeric
        # characters ( a-z , A-Z , 0-9 ) and punctuation ( !"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~ ). For
        # best practices of using MessageDeduplicationId , see Using the MessageDeduplicationId Property in
        # the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageDeduplicationId")]
        getter message_deduplication_id : String?

        # MessageGroupId is an attribute used in Amazon SQS FIFO (First-In-First-Out) and standard queues. In
        # FIFO queues, MessageGroupId organizes messages into distinct groups. Messages within the same
        # message group are always processed one at a time, in strict order, ensuring that no two messages
        # from the same group are processed simultaneously. In standard queues, using MessageGroupId enables
        # fair queues. It is used to identify the tenant a message belongs to, helping maintain consistent
        # message dwell time across all tenants during noisy neighbor events. Unlike FIFO queues, messages
        # with the same MessageGroupId can be processed in parallel, maintaining the high throughput of
        # standard queues. FIFO queues: MessageGroupId acts as the tag that specifies that a message belongs
        # to a specific message group. Messages that belong to the same message group are processed in a FIFO
        # manner (however, messages in different message groups might be processed out of order). To
        # interleave multiple ordered streams within a single queue, use MessageGroupId values (for example,
        # session data for multiple users). In this scenario, multiple consumers can process the queue, but
        # the session data of each user is processed in a FIFO fashion. If you do not provide a MessageGroupId
        # when sending a message to a FIFO queue, the action fails. ReceiveMessage might return messages with
        # multiple MessageGroupId values. For each MessageGroupId , the messages are sorted by time sent.
        # Standard queues: Use MessageGroupId in standard queues to enable fair queues. The MessageGroupId
        # identifies the tenant a message belongs to. A tenant can be any entity that shares a queue with
        # others, such as your customer, a client application, or a request type. When one tenant sends a
        # disproportionately large volume of messages or has messages that require longer processing time,
        # fair queues ensure other tenants' messages maintain low dwell time. This preserves quality of
        # service for all tenants while maintaining the scalability and throughput of standard queues. We
        # recommend that you include a MessageGroupId in all messages when using fair queues. The length of
        # MessageGroupId is 128 characters. Valid values: alphanumeric characters and punctuation
        # (!"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~) . For best practices of using MessageGroupId , see
        # Using the MessageGroupId Property in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        # The message system attribute to send. Each message system attribute consists of a Name , Type , and
        # Value . Currently, the only supported message system attribute is AWSTraceHeader . Its type must be
        # String and its value must be a correctly formatted X-Ray trace header string. The size of a message
        # system attribute doesn't count towards the total size of a message.

        @[JSON::Field(key: "MessageSystemAttributes")]
        getter message_system_attributes : Hash(String, Types::MessageSystemAttributeValue)?

        def initialize(
          @message_body : String,
          @queue_url : String,
          @delay_seconds : Int32? = nil,
          @message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
          @message_deduplication_id : String? = nil,
          @message_group_id : String? = nil,
          @message_system_attributes : Hash(String, Types::MessageSystemAttributeValue)? = nil
        )
        end
      end

      # The MD5OfMessageBody and MessageId elements.

      struct SendMessageResult
        include JSON::Serializable

        # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to verify
        # that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating
        # the MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageAttributes")]
        getter md5_of_message_attributes : String?

        # An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify that
        # Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before creating the
        # MD5 digest. For information about MD5, see RFC1321 .

        @[JSON::Field(key: "MD5OfMessageBody")]
        getter md5_of_message_body : String?

        # An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute to
        # verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
        # creating the MD5 digest.

        @[JSON::Field(key: "MD5OfMessageSystemAttributes")]
        getter md5_of_message_system_attributes : String?

        # An attribute containing the MessageId of the message sent to the queue. For more information, see
        # Queue and Message Identifiers in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # This parameter applies only to FIFO (first-in-first-out) queues. The large, non-consecutive number
        # that Amazon SQS assigns to each message. The length of SequenceNumber is 128 bits. SequenceNumber
        # continues to increase for a particular MessageGroupId .

        @[JSON::Field(key: "SequenceNumber")]
        getter sequence_number : String?

        def initialize(
          @md5_of_message_attributes : String? = nil,
          @md5_of_message_body : String? = nil,
          @md5_of_message_system_attributes : String? = nil,
          @message_id : String? = nil,
          @sequence_number : String? = nil
        )
        end
      end


      struct SetQueueAttributesRequest
        include JSON::Serializable

        # A map of attributes to set. The following lists the names, descriptions, and values of the special
        # request parameters that the SetQueueAttributes action uses: DelaySeconds – The length of time, in
        # seconds, for which the delivery of all messages in the queue is delayed. Valid values: An integer
        # from 0 to 900 (15 minutes). Default: 0. MaximumMessageSize – The limit of how many bytes a message
        # can contain before Amazon SQS rejects it. Valid values: An integer from 1,024 bytes (1 KiB) up to
        # 1,048,576 bytes (1 MiB). Default: 1,048,576 bytes (1 MiB). MessageRetentionPeriod – The length of
        # time, in seconds, for which Amazon SQS retains a message. Valid values: An integer representing
        # seconds, from 60 (1 minute) to 1,209,600 (14 days). Default: 345,600 (4 days). When you change a
        # queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate
        # throughout the Amazon SQS system. Changes made to the MessageRetentionPeriod attribute can take up
        # to 15 minutes and will impact existing messages in the queue potentially causing them to be expired
        # and deleted if the MessageRetentionPeriod is reduced below the age of existing messages. Policy –
        # The queue's policy. A valid Amazon Web Services policy. For more information about policy structure,
        # see Overview of Amazon Web Services IAM Policies in the Identity and Access Management User Guide .
        # ReceiveMessageWaitTimeSeconds – The length of time, in seconds, for which a ReceiveMessage action
        # waits for a message to arrive. Valid values: An integer from 0 to 20 (seconds). Default: 0.
        # VisibilityTimeout – The visibility timeout for the queue, in seconds. Valid values: An integer from
        # 0 to 43,200 (12 hours). Default: 30. For more information about the visibility timeout, see
        # Visibility Timeout in the Amazon SQS Developer Guide . The following attributes apply only to
        # dead-letter queues: RedrivePolicy – The string that includes the parameters for the dead-letter
        # queue functionality of the source queue as a JSON object. The parameters are as follows:
        # deadLetterTargetArn – The Amazon Resource Name (ARN) of the dead-letter queue to which Amazon SQS
        # moves messages after the value of maxReceiveCount is exceeded. maxReceiveCount – The number of times
        # a message is delivered to the source queue before being moved to the dead-letter queue. Default: 10.
        # When the ReceiveCount for a message exceeds the maxReceiveCount for a queue, Amazon SQS moves the
        # message to the dead-letter-queue. RedriveAllowPolicy – The string that includes the parameters for
        # the permissions for the dead-letter queue redrive permission and which source queues can specify
        # dead-letter queues as a JSON object. The parameters are as follows: redrivePermission – The
        # permission type that defines which source queues can specify the current queue as the dead-letter
        # queue. Valid values are: allowAll – (Default) Any source queues in this Amazon Web Services account
        # in the same Region can specify this queue as the dead-letter queue. denyAll – No source queues can
        # specify this queue as the dead-letter queue. byQueue – Only queues specified by the sourceQueueArns
        # parameter can specify this queue as the dead-letter queue. sourceQueueArns – The Amazon Resource
        # Names (ARN)s of the source queues that can specify this queue as the dead-letter queue and redrive
        # messages. You can specify this parameter only when the redrivePermission parameter is set to byQueue
        # . You can specify up to 10 source queue ARNs. To allow more than 10 source queues to specify
        # dead-letter queues, set the redrivePermission parameter to allowAll . The dead-letter queue of a
        # FIFO queue must also be a FIFO queue. Similarly, the dead-letter queue of a standard queue must also
        # be a standard queue. The following attributes apply only to server-side-encryption : KmsMasterKeyId
        # – The ID of an Amazon Web Services managed customer master key (CMK) for Amazon SQS or a custom CMK.
        # For more information, see Key Terms . While the alias of the AWS-managed CMK for Amazon SQS is
        # always alias/aws/sqs , the alias of a custom CMK can, for example, be alias/ MyAlias . For more
        # examples, see KeyId in the Key Management Service API Reference . KmsDataKeyReusePeriodSeconds – The
        # length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages
        # before calling KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400
        # seconds (24 hours). Default: 300 (5 minutes). A shorter time period provides better security but
        # results in more calls to KMS which might incur charges after Free Tier. For more information, see
        # How Does the Data Key Reuse Period Work? . SqsManagedSseEnabled – Enables server-side queue
        # encryption using SQS owned encryption keys. Only one server-side encryption option is supported per
        # queue (for example, SSE-KMS or SSE-SQS ). The following attribute applies only to FIFO
        # (first-in-first-out) queues : ContentBasedDeduplication – Enables content-based deduplication. For
        # more information, see Exactly-once processing in the Amazon SQS Developer Guide . Note the
        # following: Every message must have a unique MessageDeduplicationId . You may provide a
        # MessageDeduplicationId explicitly. If you aren't able to provide a MessageDeduplicationId and you
        # enable ContentBasedDeduplication for your queue, Amazon SQS uses a SHA-256 hash to generate the
        # MessageDeduplicationId using the body of the message (but not the attributes of the message). If you
        # don't provide a MessageDeduplicationId and the queue doesn't have ContentBasedDeduplication set, the
        # action fails with an error. If the queue has ContentBasedDeduplication set, your
        # MessageDeduplicationId overrides the generated one. When ContentBasedDeduplication is in effect,
        # messages with identical content sent within the deduplication interval are treated as duplicates and
        # only one copy of the message is delivered. If you send one message with ContentBasedDeduplication
        # enabled and then another message with a MessageDeduplicationId that is the same as the one generated
        # for the first MessageDeduplicationId , the two messages are treated as duplicates and only one copy
        # of the message is delivered. The following attributes apply only to high throughput for FIFO queues
        # : DeduplicationScope – Specifies whether message deduplication occurs at the message group or queue
        # level. Valid values are messageGroup and queue . FifoThroughputLimit – Specifies whether the FIFO
        # queue throughput quota applies to the entire queue or per message group. Valid values are perQueue
        # and perMessageGroupId . The perMessageGroupId value is allowed only when the value for
        # DeduplicationScope is messageGroup . To enable high throughput for FIFO queues, do the following:
        # Set DeduplicationScope to messageGroup . Set FifoThroughputLimit to perMessageGroupId . If you set
        # these attributes to anything other than the values shown for enabling high throughput, normal
        # throughput is in effect and deduplication occurs as specified. For information on throughput quotas,
        # see Quotas related to messages in the Amazon SQS Developer Guide .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # The URL of the Amazon SQS queue whose attributes are set. Queue URLs and names are case-sensitive.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        def initialize(
          @attributes : Hash(String, String),
          @queue_url : String
        )
        end
      end


      struct StartMessageMoveTaskRequest
        include JSON::Serializable

        # The ARN of the queue that contains the messages to be moved to another queue. Currently, only ARNs
        # of dead-letter queues (DLQs) whose sources are other Amazon SQS queues are accepted. DLQs whose
        # sources are non-SQS queues, such as Lambda or Amazon SNS topics, are not currently supported.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # The ARN of the queue that receives the moved messages. You can use this field to specify the
        # destination queue where you would like to redrive messages. If this field is left blank, the
        # messages will be redriven back to their respective original source queues.

        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        # The number of messages to be moved per second (the message movement rate). You can use this field to
        # define a fixed message movement rate. The maximum value for messages per second is 500. If this
        # field is left blank, the system will optimize the rate based on the queue message backlog size,
        # which may vary throughout the duration of the message movement task.

        @[JSON::Field(key: "MaxNumberOfMessagesPerSecond")]
        getter max_number_of_messages_per_second : Int32?

        def initialize(
          @source_arn : String,
          @destination_arn : String? = nil,
          @max_number_of_messages_per_second : Int32? = nil
        )
        end
      end


      struct StartMessageMoveTaskResult
        include JSON::Serializable

        # An identifier associated with a message movement task. You can use this identifier to cancel a
        # specified message movement task using the CancelMessageMoveTask action.

        @[JSON::Field(key: "TaskHandle")]
        getter task_handle : String?

        def initialize(
          @task_handle : String? = nil
        )
        end
      end


      struct TagQueueRequest
        include JSON::Serializable

        # The URL of the queue.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # The list of tags to be added to the specified queue.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @queue_url : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The batch request contains more entries than permissible. For Amazon SQS, the maximum number of
      # entries you can include in a single SendMessageBatch , DeleteMessageBatch , or
      # ChangeMessageVisibilityBatch request is 10.

      struct TooManyEntriesInBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Error code 400. Unsupported operation.

      struct UnsupportedOperation
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagQueueRequest
        include JSON::Serializable

        # The URL of the queue.

        @[JSON::Field(key: "QueueUrl")]
        getter queue_url : String

        # The list of tags to be removed from the specified queue.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @queue_url : String,
          @tag_keys : Array(String)
        )
        end
      end
    end
  end
end
