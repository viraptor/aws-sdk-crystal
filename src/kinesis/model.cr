module Aws
  module Kinesis
    module Model
      API_VERSION = "2013-12-02"
      TARGET_PREFIX = "Kinesis_20131202"
      SIGNING_NAME = "kinesis"
      ENDPOINT_PREFIX = "kinesis"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"StreamARN":{"required":false,"documentation":"The ARN of the Kinesis stream","type":"string"},"OperationType":{"required":false,"documentation":"Internal parameter to distinguish between Control/Data plane API and accordingly generate control/data plane endpoint","type":"string"},"ConsumerARN":{"required":false,"documentation":"The ARN of the Kinesis consumer","type":"string"},"ResourceARN":{"required":false,"documentation":"The ARN of the Kinesis resource","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"StreamARN"}]},{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]}]}],"rules":[{"conditions":[{"fn":"aws.parseArn","argv":[{"ref":"StreamARN"}],"assign":"arn"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"accountId"]},false]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"region"]},false]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"service"]},"kinesis"]}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"arn"},"resourceId[0]"],"assign":"arnType"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"arnType"},""]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"arnType"},"stream"]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"{arn#partition}"]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"OperationType"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled, but this partition does not support DualStack.","type":"error"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled, but this partition does not support FIPS.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Operation Type is not set. Please contact service team for resolution.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Partition: {arn#partition} from ARN doesn't match with partition name: {PartitionResult#name}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Kinesis ARNs don't support `{arnType}` arn types.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: No ARN type specified","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The ARN was not for the Kinesis service, found: {arn#service}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid region.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid account id.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Failed to parse ARN.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"ConsumerARN"}]},{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]}]}],"rules":[{"conditions":[{"fn":"aws.parseArn","argv":[{"ref":"ConsumerARN"}],"assign":"arn"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"accountId"]},false]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"region"]},false]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"service"]},"kinesis"]}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"arn"},"resourceId[0]"],"assign":"arnType"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"arnType"},""]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"arnType"},"stream"]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"{arn#partition}"]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"OperationType"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled, but this partition does not support DualStack.","type":"error"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled, but this partition does not support FIPS.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Operation Type is not set. Please contact service team for resolution.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Partition: {arn#partition} from ARN doesn't match with partition name: {PartitionResult#name}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Kinesis ARNs don't support `{arnType}` arn types.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: No ARN type specified","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The ARN was not for the Kinesis service, found: {arn#service}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid region.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid account id.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Failed to parse ARN.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"ResourceARN"}]},{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]}]}],"rules":[{"conditions":[{"fn":"aws.parseArn","argv":[{"ref":"ResourceARN"}],"assign":"arn"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"accountId"]},false]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"region"]},false]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arn"},"service"]},"kinesis"]}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"arn"},"resourceId[0]"],"assign":"arnType"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"arnType"},""]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"arnType"},"stream"]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"{arn#partition}"]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"OperationType"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled, but this partition does not support DualStack.","type":"error"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled, but this partition does not support FIPS.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://{arn#accountId}.{OperationType}-kinesis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Operation Type is not set. Please contact service team for resolution.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Partition: {arn#partition} from ARN doesn't match with partition name: {PartitionResult#name}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Kinesis ARNs don't support `{arnType}` arn types.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: No ARN type specified","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The ARN was not for the Kinesis service, found: {arn#service}.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid region.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Invalid account id.","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Failed to parse ARN.","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://kinesis.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://kinesis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kinesis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kinesis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_STREAM = OperationModel.new(
        name: "AddTagsToStream",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STREAM = OperationModel.new(
        name: "CreateStream",
        http_method: "POST",
        request_uri: "/"
      )

      DECREASE_STREAM_RETENTION_PERIOD = OperationModel.new(
        name: "DecreaseStreamRetentionPeriod",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STREAM = OperationModel.new(
        name: "DeleteStream",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_STREAM_CONSUMER = OperationModel.new(
        name: "DeregisterStreamConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "DescribeAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LIMITS = OperationModel.new(
        name: "DescribeLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STREAM = OperationModel.new(
        name: "DescribeStream",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STREAM_CONSUMER = OperationModel.new(
        name: "DescribeStreamConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STREAM_SUMMARY = OperationModel.new(
        name: "DescribeStreamSummary",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ENHANCED_MONITORING = OperationModel.new(
        name: "DisableEnhancedMonitoring",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ENHANCED_MONITORING = OperationModel.new(
        name: "EnableEnhancedMonitoring",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RECORDS = OperationModel.new(
        name: "GetRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SHARD_ITERATOR = OperationModel.new(
        name: "GetShardIterator",
        http_method: "POST",
        request_uri: "/"
      )

      INCREASE_STREAM_RETENTION_PERIOD = OperationModel.new(
        name: "IncreaseStreamRetentionPeriod",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SHARDS = OperationModel.new(
        name: "ListShards",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STREAM_CONSUMERS = OperationModel.new(
        name: "ListStreamConsumers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STREAMS = OperationModel.new(
        name: "ListStreams",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_STREAM = OperationModel.new(
        name: "ListTagsForStream",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_SHARDS = OperationModel.new(
        name: "MergeShards",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RECORD = OperationModel.new(
        name: "PutRecord",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RECORDS = OperationModel.new(
        name: "PutRecords",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_STREAM_CONSUMER = OperationModel.new(
        name: "RegisterStreamConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_STREAM = OperationModel.new(
        name: "RemoveTagsFromStream",
        http_method: "POST",
        request_uri: "/"
      )

      SPLIT_SHARD = OperationModel.new(
        name: "SplitShard",
        http_method: "POST",
        request_uri: "/"
      )

      START_STREAM_ENCRYPTION = OperationModel.new(
        name: "StartStreamEncryption",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_STREAM_ENCRYPTION = OperationModel.new(
        name: "StopStreamEncryption",
        http_method: "POST",
        request_uri: "/"
      )

      SUBSCRIBE_TO_SHARD = OperationModel.new(
        name: "SubscribeToShard",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCOUNT_SETTINGS = OperationModel.new(
        name: "UpdateAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MAX_RECORD_SIZE = OperationModel.new(
        name: "UpdateMaxRecordSize",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SHARD_COUNT = OperationModel.new(
        name: "UpdateShardCount",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STREAM_MODE = OperationModel.new(
        name: "UpdateStreamMode",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STREAM_WARM_THROUGHPUT = OperationModel.new(
        name: "UpdateStreamWarmThroughput",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
