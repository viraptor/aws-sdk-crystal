module AwsSdk
  module SQS
    module Model
      API_VERSION = "2012-11-05"
      TARGET_PREFIX = "AmazonSQS"
      SIGNING_NAME = "sqs"
      ENDPOINT_PREFIX = "sqs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sqs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://sqs.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://sqs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://sqs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://sqs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_PERMISSION = OperationModel.new(
        name: "AddPermission",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_MESSAGE_MOVE_TASK = OperationModel.new(
        name: "CancelMessageMoveTask",
        http_method: "POST",
        request_uri: "/"
      )

      CHANGE_MESSAGE_VISIBILITY = OperationModel.new(
        name: "ChangeMessageVisibility",
        http_method: "POST",
        request_uri: "/"
      )

      CHANGE_MESSAGE_VISIBILITY_BATCH = OperationModel.new(
        name: "ChangeMessageVisibilityBatch",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_QUEUE = OperationModel.new(
        name: "CreateQueue",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MESSAGE = OperationModel.new(
        name: "DeleteMessage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MESSAGE_BATCH = OperationModel.new(
        name: "DeleteMessageBatch",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_QUEUE = OperationModel.new(
        name: "DeleteQueue",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUEUE_ATTRIBUTES = OperationModel.new(
        name: "GetQueueAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUEUE_URL = OperationModel.new(
        name: "GetQueueUrl",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEAD_LETTER_SOURCE_QUEUES = OperationModel.new(
        name: "ListDeadLetterSourceQueues",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MESSAGE_MOVE_TASKS = OperationModel.new(
        name: "ListMessageMoveTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUEUE_TAGS = OperationModel.new(
        name: "ListQueueTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUEUES = OperationModel.new(
        name: "ListQueues",
        http_method: "POST",
        request_uri: "/"
      )

      PURGE_QUEUE = OperationModel.new(
        name: "PurgeQueue",
        http_method: "POST",
        request_uri: "/"
      )

      RECEIVE_MESSAGE = OperationModel.new(
        name: "ReceiveMessage",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_PERMISSION = OperationModel.new(
        name: "RemovePermission",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_MESSAGE = OperationModel.new(
        name: "SendMessage",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_MESSAGE_BATCH = OperationModel.new(
        name: "SendMessageBatch",
        http_method: "POST",
        request_uri: "/"
      )

      SET_QUEUE_ATTRIBUTES = OperationModel.new(
        name: "SetQueueAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      START_MESSAGE_MOVE_TASK = OperationModel.new(
        name: "StartMessageMoveTask",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_QUEUE = OperationModel.new(
        name: "TagQueue",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_QUEUE = OperationModel.new(
        name: "UntagQueue",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
