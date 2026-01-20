module Aws
  module SWF
    module Model
      API_VERSION = "2012-01-25"
      TARGET_PREFIX = "SimpleWorkflowService"
      SIGNING_NAME = "swf"
      ENDPOINT_PREFIX = "swf"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://swf.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://swf-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://swf-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://swf-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://swf.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://swf.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      COUNT_CLOSED_WORKFLOW_EXECUTIONS = OperationModel.new(
        name: "CountClosedWorkflowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      COUNT_OPEN_WORKFLOW_EXECUTIONS = OperationModel.new(
        name: "CountOpenWorkflowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      COUNT_PENDING_ACTIVITY_TASKS = OperationModel.new(
        name: "CountPendingActivityTasks",
        http_method: "POST",
        request_uri: "/"
      )

      COUNT_PENDING_DECISION_TASKS = OperationModel.new(
        name: "CountPendingDecisionTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACTIVITY_TYPE = OperationModel.new(
        name: "DeleteActivityType",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKFLOW_TYPE = OperationModel.new(
        name: "DeleteWorkflowType",
        http_method: "POST",
        request_uri: "/"
      )

      DEPRECATE_ACTIVITY_TYPE = OperationModel.new(
        name: "DeprecateActivityType",
        http_method: "POST",
        request_uri: "/"
      )

      DEPRECATE_DOMAIN = OperationModel.new(
        name: "DeprecateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DEPRECATE_WORKFLOW_TYPE = OperationModel.new(
        name: "DeprecateWorkflowType",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACTIVITY_TYPE = OperationModel.new(
        name: "DescribeActivityType",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAIN = OperationModel.new(
        name: "DescribeDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKFLOW_EXECUTION = OperationModel.new(
        name: "DescribeWorkflowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKFLOW_TYPE = OperationModel.new(
        name: "DescribeWorkflowType",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKFLOW_EXECUTION_HISTORY = OperationModel.new(
        name: "GetWorkflowExecutionHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACTIVITY_TYPES = OperationModel.new(
        name: "ListActivityTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLOSED_WORKFLOW_EXECUTIONS = OperationModel.new(
        name: "ListClosedWorkflowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPEN_WORKFLOW_EXECUTIONS = OperationModel.new(
        name: "ListOpenWorkflowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOW_TYPES = OperationModel.new(
        name: "ListWorkflowTypes",
        http_method: "POST",
        request_uri: "/"
      )

      POLL_FOR_ACTIVITY_TASK = OperationModel.new(
        name: "PollForActivityTask",
        http_method: "POST",
        request_uri: "/"
      )

      POLL_FOR_DECISION_TASK = OperationModel.new(
        name: "PollForDecisionTask",
        http_method: "POST",
        request_uri: "/"
      )

      RECORD_ACTIVITY_TASK_HEARTBEAT = OperationModel.new(
        name: "RecordActivityTaskHeartbeat",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_ACTIVITY_TYPE = OperationModel.new(
        name: "RegisterActivityType",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_DOMAIN = OperationModel.new(
        name: "RegisterDomain",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_WORKFLOW_TYPE = OperationModel.new(
        name: "RegisterWorkflowType",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_CANCEL_WORKFLOW_EXECUTION = OperationModel.new(
        name: "RequestCancelWorkflowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      RESPOND_ACTIVITY_TASK_CANCELED = OperationModel.new(
        name: "RespondActivityTaskCanceled",
        http_method: "POST",
        request_uri: "/"
      )

      RESPOND_ACTIVITY_TASK_COMPLETED = OperationModel.new(
        name: "RespondActivityTaskCompleted",
        http_method: "POST",
        request_uri: "/"
      )

      RESPOND_ACTIVITY_TASK_FAILED = OperationModel.new(
        name: "RespondActivityTaskFailed",
        http_method: "POST",
        request_uri: "/"
      )

      RESPOND_DECISION_TASK_COMPLETED = OperationModel.new(
        name: "RespondDecisionTaskCompleted",
        http_method: "POST",
        request_uri: "/"
      )

      SIGNAL_WORKFLOW_EXECUTION = OperationModel.new(
        name: "SignalWorkflowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_WORKFLOW_EXECUTION = OperationModel.new(
        name: "StartWorkflowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_WORKFLOW_EXECUTION = OperationModel.new(
        name: "TerminateWorkflowExecution",
        http_method: "POST",
        request_uri: "/"
      )

      UNDEPRECATE_ACTIVITY_TYPE = OperationModel.new(
        name: "UndeprecateActivityType",
        http_method: "POST",
        request_uri: "/"
      )

      UNDEPRECATE_DOMAIN = OperationModel.new(
        name: "UndeprecateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      UNDEPRECATE_WORKFLOW_TYPE = OperationModel.new(
        name: "UndeprecateWorkflowType",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
