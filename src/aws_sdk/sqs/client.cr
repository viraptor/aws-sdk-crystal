module AwsSdk
  module SQS
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Adds a permission to a queue for a specific principal . This allows sharing access to the queue.
      # When you create a queue, you have full control access rights for the queue. Only you, the owner of
      # the queue, can grant or deny permissions to the queue. For more information about these permissions,
      # see Allow Developers to Write Messages to a Shared Queue in the Amazon SQS Developer Guide .
      # AddPermission generates a policy for you. You can use SetQueueAttributes to upload your policy. For
      # more information, see Using Custom Policies with the Amazon SQS Access Policy Language in the Amazon
      # SQS Developer Guide . An Amazon SQS policy can have a maximum of seven actions per statement. To
      # remove the ability to change queue permissions, you must deny permission to the AddPermission ,
      # RemovePermission , and SetQueueAttributes actions in your IAM policy. Amazon SQS AddPermission does
      # not support adding a non-account principal. Cross-account permissions don't apply to this action.
      # For more information, see Grant cross-account permissions to a role and a username in the Amazon SQS
      # Developer Guide .

      def add_permission(
        aws_account_ids : Array(String),
        actions : Array(String),
        label : String,
        queue_url : String
      ) : Nil

        input = Types::AddPermissionRequest.new(aws_account_ids: aws_account_ids, actions: actions, label: label, queue_url: queue_url)
        add_permission(input)
      end

      def add_permission(input : Types::AddPermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADD_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Cancels a specified message movement task. A message movement can only be cancelled when the current
      # status is RUNNING. Cancelling a message movement task does not revert the messages that have already
      # been moved. It can only stop the messages that have not been moved yet. This action is currently
      # limited to supporting message redrive from dead-letter queues (DLQs) only. In this context, the
      # source queue is the dead-letter queue (DLQ), while the destination queue can be the original source
      # queue (from which the messages were driven to the dead-letter-queue), or a custom destination queue.
      # Only one active message movement task is supported per queue at any given time.

      def cancel_message_move_task(
        task_handle : String
      ) : Types::CancelMessageMoveTaskResult

        input = Types::CancelMessageMoveTaskRequest.new(task_handle: task_handle)
        cancel_message_move_task(input)
      end

      def cancel_message_move_task(input : Types::CancelMessageMoveTaskRequest) : Types::CancelMessageMoveTaskResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_MESSAGE_MOVE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMessageMoveTaskResult, "CancelMessageMoveTask")
      end

      # Changes the visibility timeout of a specified message in a queue to a new value. The default
      # visibility timeout for a message is 30 seconds. The minimum is 0 seconds. The maximum is 12 hours.
      # For more information, see Visibility Timeout in the Amazon SQS Developer Guide . For example, if the
      # default timeout for a queue is 60 seconds, 15 seconds have elapsed since you received the message,
      # and you send a ChangeMessageVisibility call with VisibilityTimeout set to 10 seconds, the 10 seconds
      # begin to count from the time that you make the ChangeMessageVisibility call. Thus, any attempt to
      # change the visibility timeout or to delete that message 10 seconds after you initially change the
      # visibility timeout (a total of 25 seconds) might result in an error. An Amazon SQS message has three
      # basic states: Sent to a queue by a producer. Received from the queue by a consumer. Deleted from the
      # queue. A message is considered to be stored after it is sent to a queue by a producer, but not yet
      # received from the queue by a consumer (that is, between states 1 and 2). There is no limit to the
      # number of stored messages. A message is considered to be in flight after it is received from a queue
      # by a consumer, but not yet deleted from the queue (that is, between states 2 and 3). There is a
      # limit to the number of in flight messages. Limits that apply to in flight messages are unrelated to
      # the unlimited number of stored messages. For most standard queues (depending on queue traffic and
      # message backlog), there can be a maximum of approximately 120,000 in flight messages (received from
      # a queue by a consumer, but not yet deleted from the queue). If you reach this limit, Amazon SQS
      # returns the OverLimit error message. To avoid reaching the limit, you should delete messages from
      # the queue after they're processed. You can also increase the number of queues you use to process
      # your messages. To request a limit increase, file a support request . For FIFO queues, there can be a
      # maximum of 120,000 in flight messages (received from a queue by a consumer, but not yet deleted from
      # the queue). If you reach this limit, Amazon SQS returns no error messages. If you attempt to set the
      # VisibilityTimeout to a value greater than the maximum time left, Amazon SQS returns an error. Amazon
      # SQS doesn't automatically recalculate and increase the timeout to the maximum remaining time. Unlike
      # with a queue, when you change the visibility timeout for a specific message the timeout value is
      # applied immediately but isn't saved in memory for that message. If you don't delete a message after
      # it is received, the visibility timeout for the message reverts to the original timeout value (not to
      # the value you set using the ChangeMessageVisibility action) the next time the message is received.

      def change_message_visibility(
        queue_url : String,
        receipt_handle : String,
        visibility_timeout : Int32
      ) : Nil

        input = Types::ChangeMessageVisibilityRequest.new(queue_url: queue_url, receipt_handle: receipt_handle, visibility_timeout: visibility_timeout)
        change_message_visibility(input)
      end

      def change_message_visibility(input : Types::ChangeMessageVisibilityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CHANGE_MESSAGE_VISIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Changes the visibility timeout of multiple messages. This is a batch version of
      # ChangeMessageVisibility . The result of the action on each message is reported individually in the
      # response. You can send up to 10 ChangeMessageVisibility requests with each
      # ChangeMessageVisibilityBatch action. Because the batch request can result in a combination of
      # successful and unsuccessful actions, you should check for batch errors even when the call returns an
      # HTTP status code of 200 .

      def change_message_visibility_batch(
        entries : Array(Types::ChangeMessageVisibilityBatchRequestEntry),
        queue_url : String
      ) : Types::ChangeMessageVisibilityBatchResult

        input = Types::ChangeMessageVisibilityBatchRequest.new(entries: entries, queue_url: queue_url)
        change_message_visibility_batch(input)
      end

      def change_message_visibility_batch(input : Types::ChangeMessageVisibilityBatchRequest) : Types::ChangeMessageVisibilityBatchResult
        request = Protocol::JsonRpc.build_request(Model::CHANGE_MESSAGE_VISIBILITY_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ChangeMessageVisibilityBatchResult, "ChangeMessageVisibilityBatch")
      end

      # Creates a new standard or FIFO queue. You can pass one or more attributes in the request. Keep the
      # following in mind: If you don't specify the FifoQueue attribute, Amazon SQS creates a standard
      # queue. You can't change the queue type after you create it and you can't convert an existing
      # standard queue into a FIFO queue. You must either create a new FIFO queue for your application or
      # delete your existing standard queue and recreate it as a FIFO queue. For more information, see
      # Moving From a standard queue to a FIFO queue in the Amazon SQS Developer Guide . If you don't
      # provide a value for an attribute, the queue is created with the default value for the attribute. If
      # you delete a queue, you must wait at least 60 seconds before creating a queue with the same name. To
      # successfully create a new queue, you must provide a queue name that adheres to the limits related to
      # queues and is unique within the scope of your queues. After you create a queue, you must wait at
      # least one second after the queue is created to be able to use the queue. To retrieve the URL of a
      # queue, use the GetQueueUrl action. This action only requires the QueueName parameter. When creating
      # queues, keep the following points in mind: If you specify the name of an existing queue and provide
      # the exact same names and values for all its attributes, the CreateQueue action will return the URL
      # of the existing queue instead of creating a new one. If you attempt to create a queue with a name
      # that already exists but with different attribute names or values, the CreateQueue action will return
      # an error. This ensures that existing queues are not inadvertently altered. Cross-account permissions
      # don't apply to this action. For more information, see Grant cross-account permissions to a role and
      # a username in the Amazon SQS Developer Guide .

      def create_queue(
        queue_name : String,
        attributes : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateQueueResult

        input = Types::CreateQueueRequest.new(queue_name: queue_name, attributes: attributes, tags: tags)
        create_queue(input)
      end

      def create_queue(input : Types::CreateQueueRequest) : Types::CreateQueueResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateQueueResult, "CreateQueue")
      end

      # Deletes the specified message from the specified queue. To select the message to delete, use the
      # ReceiptHandle of the message ( not the MessageId which you receive when you send the message).
      # Amazon SQS can delete a message from a queue even if a visibility timeout setting causes the message
      # to be locked by another consumer. Amazon SQS automatically deletes messages left in a queue longer
      # than the retention period configured for the queue. Each time you receive a message, meaning when a
      # consumer retrieves a message from the queue, it comes with a unique ReceiptHandle . If you receive
      # the same message more than once, you will get a different ReceiptHandle each time. When you want to
      # delete a message using the DeleteMessage action, you must use the ReceiptHandle from the most recent
      # time you received the message. If you use an old ReceiptHandle , the request will succeed, but the
      # message might not be deleted. For standard queues, it is possible to receive a message even after
      # you delete it. This might happen on rare occasions if one of the servers which stores a copy of the
      # message is unavailable when you send the request to delete the message. The copy remains on the
      # server and might be returned to you during a subsequent receive request. You should ensure that your
      # application is idempotent, so that receiving a message more than once does not cause issues.

      def delete_message(
        queue_url : String,
        receipt_handle : String
      ) : Nil

        input = Types::DeleteMessageRequest.new(queue_url: queue_url, receipt_handle: receipt_handle)
        delete_message(input)
      end

      def delete_message(input : Types::DeleteMessageRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes up to ten messages from the specified queue. This is a batch version of DeleteMessage . The
      # result of the action on each message is reported individually in the response. Because the batch
      # request can result in a combination of successful and unsuccessful actions, you should check for
      # batch errors even when the call returns an HTTP status code of 200 .

      def delete_message_batch(
        entries : Array(Types::DeleteMessageBatchRequestEntry),
        queue_url : String
      ) : Types::DeleteMessageBatchResult

        input = Types::DeleteMessageBatchRequest.new(entries: entries, queue_url: queue_url)
        delete_message_batch(input)
      end

      def delete_message_batch(input : Types::DeleteMessageBatchRequest) : Types::DeleteMessageBatchResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_MESSAGE_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMessageBatchResult, "DeleteMessageBatch")
      end

      # Deletes the queue specified by the QueueUrl , regardless of the queue's contents. Be careful with
      # the DeleteQueue action: When you delete a queue, any messages in the queue are no longer available.
      # When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving
      # that queue during the 60 seconds might succeed. For example, a SendMessage request might succeed,
      # but after 60 seconds the queue and the message you sent no longer exist. When you delete a queue,
      # you must wait at least 60 seconds before creating a queue with the same name. Cross-account
      # permissions don't apply to this action. For more information, see Grant cross-account permissions to
      # a role and a username in the Amazon SQS Developer Guide . The delete operation uses the HTTP GET
      # verb.

      def delete_queue(
        queue_url : String
      ) : Nil

        input = Types::DeleteQueueRequest.new(queue_url: queue_url)
        delete_queue(input)
      end

      def delete_queue(input : Types::DeleteQueueRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets attributes for the specified queue. To determine whether a queue is FIFO , you can check
      # whether QueueName ends with the .fifo suffix.

      def get_queue_attributes(
        queue_url : String,
        attribute_names : Array(String)? = nil
      ) : Types::GetQueueAttributesResult

        input = Types::GetQueueAttributesRequest.new(queue_url: queue_url, attribute_names: attribute_names)
        get_queue_attributes(input)
      end

      def get_queue_attributes(input : Types::GetQueueAttributesRequest) : Types::GetQueueAttributesResult
        request = Protocol::JsonRpc.build_request(Model::GET_QUEUE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueueAttributesResult, "GetQueueAttributes")
      end

      # The GetQueueUrl API returns the URL of an existing Amazon SQS queue. This is useful when you know
      # the queue's name but need to retrieve its URL for further operations. To access a queue owned by
      # another Amazon Web Services account, use the QueueOwnerAWSAccountId parameter to specify the account
      # ID of the queue's owner. Note that the queue owner must grant you the necessary permissions to
      # access the queue. For more information about accessing shared queues, see the AddPermission API or
      # Allow developers to write messages to a shared queue in the Amazon SQS Developer Guide .

      def get_queue_url(
        queue_name : String,
        queue_owner_aws_account_id : String? = nil
      ) : Types::GetQueueUrlResult

        input = Types::GetQueueUrlRequest.new(queue_name: queue_name, queue_owner_aws_account_id: queue_owner_aws_account_id)
        get_queue_url(input)
      end

      def get_queue_url(input : Types::GetQueueUrlRequest) : Types::GetQueueUrlResult
        request = Protocol::JsonRpc.build_request(Model::GET_QUEUE_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueueUrlResult, "GetQueueUrl")
      end

      # Returns a list of your queues that have the RedrivePolicy queue attribute configured with a
      # dead-letter queue. The ListDeadLetterSourceQueues methods supports pagination. Set parameter
      # MaxResults in the request to specify the maximum number of results to be returned in the response.
      # If you do not set MaxResults , the response includes a maximum of 1,000 results. If you set
      # MaxResults and there are additional results to display, the response includes a value for NextToken
      # . Use NextToken as a parameter in your next request to ListDeadLetterSourceQueues to receive the
      # next page of results. For more information about using dead-letter queues, see Using Amazon SQS
      # Dead-Letter Queues in the Amazon SQS Developer Guide .

      def list_dead_letter_source_queues(
        queue_url : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDeadLetterSourceQueuesResult

        input = Types::ListDeadLetterSourceQueuesRequest.new(queue_url: queue_url, max_results: max_results, next_token: next_token)
        list_dead_letter_source_queues(input)
      end

      def list_dead_letter_source_queues(input : Types::ListDeadLetterSourceQueuesRequest) : Types::ListDeadLetterSourceQueuesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DEAD_LETTER_SOURCE_QUEUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeadLetterSourceQueuesResult, "ListDeadLetterSourceQueues")
      end

      # Gets the most recent message movement tasks (up to 10) under a specific source queue. This action is
      # currently limited to supporting message redrive from dead-letter queues (DLQs) only. In this
      # context, the source queue is the dead-letter queue (DLQ), while the destination queue can be the
      # original source queue (from which the messages were driven to the dead-letter-queue), or a custom
      # destination queue. Only one active message movement task is supported per queue at any given time.

      def list_message_move_tasks(
        source_arn : String,
        max_results : Int32? = nil
      ) : Types::ListMessageMoveTasksResult

        input = Types::ListMessageMoveTasksRequest.new(source_arn: source_arn, max_results: max_results)
        list_message_move_tasks(input)
      end

      def list_message_move_tasks(input : Types::ListMessageMoveTasksRequest) : Types::ListMessageMoveTasksResult
        request = Protocol::JsonRpc.build_request(Model::LIST_MESSAGE_MOVE_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMessageMoveTasksResult, "ListMessageMoveTasks")
      end

      # List all cost allocation tags added to the specified Amazon SQS queue. For an overview, see Tagging
      # Your Amazon SQS Queues in the Amazon SQS Developer Guide . Cross-account permissions don't apply to
      # this action. For more information, see Grant cross-account permissions to a role and a username in
      # the Amazon SQS Developer Guide .

      def list_queue_tags(
        queue_url : String
      ) : Types::ListQueueTagsResult

        input = Types::ListQueueTagsRequest.new(queue_url: queue_url)
        list_queue_tags(input)
      end

      def list_queue_tags(input : Types::ListQueueTagsRequest) : Types::ListQueueTagsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_QUEUE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQueueTagsResult, "ListQueueTags")
      end

      # Returns a list of your queues in the current region. The response includes a maximum of 1,000
      # results. If you specify a value for the optional QueueNamePrefix parameter, only queues with a name
      # that begins with the specified value are returned. The listQueues methods supports pagination. Set
      # parameter MaxResults in the request to specify the maximum number of results to be returned in the
      # response. If you do not set MaxResults , the response includes a maximum of 1,000 results. If you
      # set MaxResults and there are additional results to display, the response includes a value for
      # NextToken . Use NextToken as a parameter in your next request to listQueues to receive the next page
      # of results. Cross-account permissions don't apply to this action. For more information, see Grant
      # cross-account permissions to a role and a username in the Amazon SQS Developer Guide .

      def list_queues(
        max_results : Int32? = nil,
        next_token : String? = nil,
        queue_name_prefix : String? = nil
      ) : Types::ListQueuesResult

        input = Types::ListQueuesRequest.new(max_results: max_results, next_token: next_token, queue_name_prefix: queue_name_prefix)
        list_queues(input)
      end

      def list_queues(input : Types::ListQueuesRequest) : Types::ListQueuesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_QUEUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQueuesResult, "ListQueues")
      end

      # Deletes available messages in a queue (including in-flight messages) specified by the QueueURL
      # parameter. When you use the PurgeQueue action, you can't retrieve any messages deleted from a queue.
      # The message deletion process takes up to 60 seconds. We recommend waiting for 60 seconds regardless
      # of your queue's size. Messages sent to the queue before you call PurgeQueue might be received but
      # are deleted within the next minute. Messages sent to the queue after you call PurgeQueue might be
      # deleted while the queue is being purged.

      def purge_queue(
        queue_url : String
      ) : Nil

        input = Types::PurgeQueueRequest.new(queue_url: queue_url)
        purge_queue(input)
      end

      def purge_queue(input : Types::PurgeQueueRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PURGE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves one or more messages (up to 10), from the specified queue. Using the WaitTimeSeconds
      # parameter enables long-poll support. For more information, see Amazon SQS Long Polling in the Amazon
      # SQS Developer Guide . Short poll is the default behavior where a weighted random set of machines is
      # sampled on a ReceiveMessage call. Therefore, only the messages on the sampled machines are returned.
      # If the number of messages in the queue is small (fewer than 1,000), you most likely get fewer
      # messages than you requested per ReceiveMessage call. If the number of messages in the queue is
      # extremely small, you might not receive any messages in a particular ReceiveMessage response. If this
      # happens, repeat the request. For each message returned, the response includes the following: The
      # message body. An MD5 digest of the message body. For information about MD5, see RFC1321 . The
      # MessageId you received when you sent the message to the queue. The receipt handle. The message
      # attributes. An MD5 digest of the message attributes. The receipt handle is the identifier you must
      # provide when deleting the message. For more information, see Queue and Message Identifiers in the
      # Amazon SQS Developer Guide . You can provide the VisibilityTimeout parameter in your request. The
      # parameter is applied to the messages that Amazon SQS returns in the response. If you don't include
      # the parameter, the overall visibility timeout for the queue is used for the returned messages. The
      # default visibility timeout for a queue is 30 seconds. In the future, new attributes might be added.
      # If you write code that calls this action, we recommend that you structure your code so that it can
      # handle new attributes gracefully.

      def receive_message(
        queue_url : String,
        attribute_names : Array(String)? = nil,
        max_number_of_messages : Int32? = nil,
        message_attribute_names : Array(String)? = nil,
        message_system_attribute_names : Array(String)? = nil,
        receive_request_attempt_id : String? = nil,
        visibility_timeout : Int32? = nil,
        wait_time_seconds : Int32? = nil
      ) : Types::ReceiveMessageResult

        input = Types::ReceiveMessageRequest.new(queue_url: queue_url, attribute_names: attribute_names, max_number_of_messages: max_number_of_messages, message_attribute_names: message_attribute_names, message_system_attribute_names: message_system_attribute_names, receive_request_attempt_id: receive_request_attempt_id, visibility_timeout: visibility_timeout, wait_time_seconds: wait_time_seconds)
        receive_message(input)
      end

      def receive_message(input : Types::ReceiveMessageRequest) : Types::ReceiveMessageResult
        request = Protocol::JsonRpc.build_request(Model::RECEIVE_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReceiveMessageResult, "ReceiveMessage")
      end

      # Revokes any permissions in the queue policy that matches the specified Label parameter. Only the
      # owner of a queue can remove permissions from it. Cross-account permissions don't apply to this
      # action. For more information, see Grant cross-account permissions to a role and a username in the
      # Amazon SQS Developer Guide . To remove the ability to change queue permissions, you must deny
      # permission to the AddPermission , RemovePermission , and SetQueueAttributes actions in your IAM
      # policy.

      def remove_permission(
        label : String,
        queue_url : String
      ) : Nil

        input = Types::RemovePermissionRequest.new(label: label, queue_url: queue_url)
        remove_permission(input)
      end

      def remove_permission(input : Types::RemovePermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delivers a message to the specified queue. A message can include only XML, JSON, and unformatted
      # text. The following Unicode characters are allowed. For more information, see the W3C specification
      # for characters . #x9 | #xA | #xD | #x20 to #xD7FF | #xE000 to #xFFFD | #x10000 to #x10FFFF If a
      # message contains characters outside the allowed set, Amazon SQS rejects the message and returns an
      # InvalidMessageContents error. Ensure that your message body includes only valid characters to avoid
      # this exception.

      def send_message(
        message_body : String,
        queue_url : String,
        delay_seconds : Int32? = nil,
        message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
        message_deduplication_id : String? = nil,
        message_group_id : String? = nil,
        message_system_attributes : Hash(String, Types::MessageSystemAttributeValue)? = nil
      ) : Types::SendMessageResult

        input = Types::SendMessageRequest.new(message_body: message_body, queue_url: queue_url, delay_seconds: delay_seconds, message_attributes: message_attributes, message_deduplication_id: message_deduplication_id, message_group_id: message_group_id, message_system_attributes: message_system_attributes)
        send_message(input)
      end

      def send_message(input : Types::SendMessageRequest) : Types::SendMessageResult
        request = Protocol::JsonRpc.build_request(Model::SEND_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendMessageResult, "SendMessage")
      end

      # You can use SendMessageBatch to send up to 10 messages to the specified queue by assigning either
      # identical or different values to each message (or by not assigning values at all). This is a batch
      # version of SendMessage . For a FIFO queue, multiple messages within a single batch are enqueued in
      # the order they are sent. The result of sending each message is reported individually in the
      # response. Because the batch request can result in a combination of successful and unsuccessful
      # actions, you should check for batch errors even when the call returns an HTTP status code of 200 .
      # The maximum allowed individual message size and the maximum total payload size (the sum of the
      # individual lengths of all of the batched messages) are both 1 MiB 1,048,576 bytes. A message can
      # include only XML, JSON, and unformatted text. The following Unicode characters are allowed. For more
      # information, see the W3C specification for characters . #x9 | #xA | #xD | #x20 to #xD7FF | #xE000 to
      # #xFFFD | #x10000 to #x10FFFF If a message contains characters outside the allowed set, Amazon SQS
      # rejects the message and returns an InvalidMessageContents error. Ensure that your message body
      # includes only valid characters to avoid this exception. If you don't specify the DelaySeconds
      # parameter for an entry, Amazon SQS uses the default value for the queue.

      def send_message_batch(
        entries : Array(Types::SendMessageBatchRequestEntry),
        queue_url : String
      ) : Types::SendMessageBatchResult

        input = Types::SendMessageBatchRequest.new(entries: entries, queue_url: queue_url)
        send_message_batch(input)
      end

      def send_message_batch(input : Types::SendMessageBatchRequest) : Types::SendMessageBatchResult
        request = Protocol::JsonRpc.build_request(Model::SEND_MESSAGE_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendMessageBatchResult, "SendMessageBatch")
      end

      # Sets the value of one or more queue attributes, like a policy. When you change a queue's attributes,
      # the change can take up to 60 seconds for most of the attributes to propagate throughout the Amazon
      # SQS system. Changes made to the MessageRetentionPeriod attribute can take up to 15 minutes and will
      # impact existing messages in the queue potentially causing them to be expired and deleted if the
      # MessageRetentionPeriod is reduced below the age of existing messages. In the future, new attributes
      # might be added. If you write code that calls this action, we recommend that you structure your code
      # so that it can handle new attributes gracefully. Cross-account permissions don't apply to this
      # action. For more information, see Grant cross-account permissions to a role and a username in the
      # Amazon SQS Developer Guide . To remove the ability to change queue permissions, you must deny
      # permission to the AddPermission , RemovePermission , and SetQueueAttributes actions in your IAM
      # policy.

      def set_queue_attributes(
        attributes : Hash(String, String),
        queue_url : String
      ) : Nil

        input = Types::SetQueueAttributesRequest.new(attributes: attributes, queue_url: queue_url)
        set_queue_attributes(input)
      end

      def set_queue_attributes(input : Types::SetQueueAttributesRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_QUEUE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts an asynchronous task to move messages from a specified source queue to a specified
      # destination queue. This action is currently limited to supporting message redrive from queues that
      # are configured as dead-letter queues (DLQs) of other Amazon SQS queues only. Non-SQS queue sources
      # of dead-letter queues, such as Lambda or Amazon SNS topics, are currently not supported. In
      # dead-letter queues redrive context, the StartMessageMoveTask the source queue is the DLQ, while the
      # destination queue can be the original source queue (from which the messages were driven to the
      # dead-letter-queue), or a custom destination queue. Only one active message movement task is
      # supported per queue at any given time.

      def start_message_move_task(
        source_arn : String,
        destination_arn : String? = nil,
        max_number_of_messages_per_second : Int32? = nil
      ) : Types::StartMessageMoveTaskResult

        input = Types::StartMessageMoveTaskRequest.new(source_arn: source_arn, destination_arn: destination_arn, max_number_of_messages_per_second: max_number_of_messages_per_second)
        start_message_move_task(input)
      end

      def start_message_move_task(input : Types::StartMessageMoveTaskRequest) : Types::StartMessageMoveTaskResult
        request = Protocol::JsonRpc.build_request(Model::START_MESSAGE_MOVE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMessageMoveTaskResult, "StartMessageMoveTask")
      end

      # Add cost allocation tags to the specified Amazon SQS queue. For an overview, see Tagging Your Amazon
      # SQS Queues in the Amazon SQS Developer Guide . When you use queue tags, keep the following
      # guidelines in mind: Adding more than 50 tags to a queue isn't recommended. Tags don't have any
      # semantic meaning. Amazon SQS interprets tags as character strings. Tags are case-sensitive. A new
      # tag with a key identical to that of an existing tag overwrites the existing tag. For a full list of
      # tag restrictions, see Quotas related to queues in the Amazon SQS Developer Guide . Cross-account
      # permissions don't apply to this action. For more information, see Grant cross-account permissions to
      # a role and a username in the Amazon SQS Developer Guide .

      def tag_queue(
        queue_url : String,
        tags : Hash(String, String)
      ) : Nil

        input = Types::TagQueueRequest.new(queue_url: queue_url, tags: tags)
        tag_queue(input)
      end

      def tag_queue(input : Types::TagQueueRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Remove cost allocation tags from the specified Amazon SQS queue. For an overview, see Tagging Your
      # Amazon SQS Queues in the Amazon SQS Developer Guide . Cross-account permissions don't apply to this
      # action. For more information, see Grant cross-account permissions to a role and a username in the
      # Amazon SQS Developer Guide .

      def untag_queue(
        queue_url : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagQueueRequest.new(queue_url: queue_url, tag_keys: tag_keys)
        untag_queue(input)
      end

      def untag_queue(input : Types::UntagQueueRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
