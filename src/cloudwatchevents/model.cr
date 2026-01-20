module Aws
  module CloudWatchEvents
    module Model
      API_VERSION = "2015-10-07"
      TARGET_PREFIX = "AWSEvents"
      SIGNING_NAME = "events"
      ENDPOINT_PREFIX = "events"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://events-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://events.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://events.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://events-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://events.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://events.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_EVENT_SOURCE = OperationModel.new(
        name: "ActivateEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_REPLAY = OperationModel.new(
        name: "CancelReplay",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_API_DESTINATION = OperationModel.new(
        name: "CreateApiDestination",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ARCHIVE = OperationModel.new(
        name: "CreateArchive",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVENT_BUS = OperationModel.new(
        name: "CreateEventBus",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTNER_EVENT_SOURCE = OperationModel.new(
        name: "CreatePartnerEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      DEACTIVATE_EVENT_SOURCE = OperationModel.new(
        name: "DeactivateEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      DEAUTHORIZE_CONNECTION = OperationModel.new(
        name: "DeauthorizeConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_API_DESTINATION = OperationModel.new(
        name: "DeleteApiDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ARCHIVE = OperationModel.new(
        name: "DeleteArchive",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_BUS = OperationModel.new(
        name: "DeleteEventBus",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTNER_EVENT_SOURCE = OperationModel.new(
        name: "DeletePartnerEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_API_DESTINATION = OperationModel.new(
        name: "DescribeApiDestination",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ARCHIVE = OperationModel.new(
        name: "DescribeArchive",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTION = OperationModel.new(
        name: "DescribeConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_BUS = OperationModel.new(
        name: "DescribeEventBus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_SOURCE = OperationModel.new(
        name: "DescribeEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARTNER_EVENT_SOURCE = OperationModel.new(
        name: "DescribePartnerEventSource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLAY = OperationModel.new(
        name: "DescribeReplay",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULE = OperationModel.new(
        name: "DescribeRule",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_RULE = OperationModel.new(
        name: "DisableRule",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_RULE = OperationModel.new(
        name: "EnableRule",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_API_DESTINATIONS = OperationModel.new(
        name: "ListApiDestinations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ARCHIVES = OperationModel.new(
        name: "ListArchives",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTIONS = OperationModel.new(
        name: "ListConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENT_BUSES = OperationModel.new(
        name: "ListEventBuses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENT_SOURCES = OperationModel.new(
        name: "ListEventSources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARTNER_EVENT_SOURCE_ACCOUNTS = OperationModel.new(
        name: "ListPartnerEventSourceAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARTNER_EVENT_SOURCES = OperationModel.new(
        name: "ListPartnerEventSources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPLAYS = OperationModel.new(
        name: "ListReplays",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULE_NAMES_BY_TARGET = OperationModel.new(
        name: "ListRuleNamesByTarget",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TARGETS_BY_RULE = OperationModel.new(
        name: "ListTargetsByRule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EVENTS = OperationModel.new(
        name: "PutEvents",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PARTNER_EVENTS = OperationModel.new(
        name: "PutPartnerEvents",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PERMISSION = OperationModel.new(
        name: "PutPermission",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RULE = OperationModel.new(
        name: "PutRule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_TARGETS = OperationModel.new(
        name: "PutTargets",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_PERMISSION = OperationModel.new(
        name: "RemovePermission",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TARGETS = OperationModel.new(
        name: "RemoveTargets",
        http_method: "POST",
        request_uri: "/"
      )

      START_REPLAY = OperationModel.new(
        name: "StartReplay",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_EVENT_PATTERN = OperationModel.new(
        name: "TestEventPattern",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_API_DESTINATION = OperationModel.new(
        name: "UpdateApiDestination",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ARCHIVE = OperationModel.new(
        name: "UpdateArchive",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECTION = OperationModel.new(
        name: "UpdateConnection",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
