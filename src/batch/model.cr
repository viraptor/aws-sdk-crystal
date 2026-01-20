module Aws
  module Batch
    module Model
      API_VERSION = "2016-08-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "batch"
      ENDPOINT_PREFIX = "batch"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://batch-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://fips.batch.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://batch.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://batch-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://batch.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://batch.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "POST",
        request_uri: "/v1/canceljob"
      )

      CREATE_COMPUTE_ENVIRONMENT = OperationModel.new(
        name: "CreateComputeEnvironment",
        http_method: "POST",
        request_uri: "/v1/createcomputeenvironment"
      )

      CREATE_CONSUMABLE_RESOURCE = OperationModel.new(
        name: "CreateConsumableResource",
        http_method: "POST",
        request_uri: "/v1/createconsumableresource"
      )

      CREATE_JOB_QUEUE = OperationModel.new(
        name: "CreateJobQueue",
        http_method: "POST",
        request_uri: "/v1/createjobqueue"
      )

      CREATE_SCHEDULING_POLICY = OperationModel.new(
        name: "CreateSchedulingPolicy",
        http_method: "POST",
        request_uri: "/v1/createschedulingpolicy"
      )

      CREATE_SERVICE_ENVIRONMENT = OperationModel.new(
        name: "CreateServiceEnvironment",
        http_method: "POST",
        request_uri: "/v1/createserviceenvironment"
      )

      DELETE_COMPUTE_ENVIRONMENT = OperationModel.new(
        name: "DeleteComputeEnvironment",
        http_method: "POST",
        request_uri: "/v1/deletecomputeenvironment"
      )

      DELETE_CONSUMABLE_RESOURCE = OperationModel.new(
        name: "DeleteConsumableResource",
        http_method: "POST",
        request_uri: "/v1/deleteconsumableresource"
      )

      DELETE_JOB_QUEUE = OperationModel.new(
        name: "DeleteJobQueue",
        http_method: "POST",
        request_uri: "/v1/deletejobqueue"
      )

      DELETE_SCHEDULING_POLICY = OperationModel.new(
        name: "DeleteSchedulingPolicy",
        http_method: "POST",
        request_uri: "/v1/deleteschedulingpolicy"
      )

      DELETE_SERVICE_ENVIRONMENT = OperationModel.new(
        name: "DeleteServiceEnvironment",
        http_method: "POST",
        request_uri: "/v1/deleteserviceenvironment"
      )

      DEREGISTER_JOB_DEFINITION = OperationModel.new(
        name: "DeregisterJobDefinition",
        http_method: "POST",
        request_uri: "/v1/deregisterjobdefinition"
      )

      DESCRIBE_COMPUTE_ENVIRONMENTS = OperationModel.new(
        name: "DescribeComputeEnvironments",
        http_method: "POST",
        request_uri: "/v1/describecomputeenvironments"
      )

      DESCRIBE_CONSUMABLE_RESOURCE = OperationModel.new(
        name: "DescribeConsumableResource",
        http_method: "POST",
        request_uri: "/v1/describeconsumableresource"
      )

      DESCRIBE_JOB_DEFINITIONS = OperationModel.new(
        name: "DescribeJobDefinitions",
        http_method: "POST",
        request_uri: "/v1/describejobdefinitions"
      )

      DESCRIBE_JOB_QUEUES = OperationModel.new(
        name: "DescribeJobQueues",
        http_method: "POST",
        request_uri: "/v1/describejobqueues"
      )

      DESCRIBE_JOBS = OperationModel.new(
        name: "DescribeJobs",
        http_method: "POST",
        request_uri: "/v1/describejobs"
      )

      DESCRIBE_SCHEDULING_POLICIES = OperationModel.new(
        name: "DescribeSchedulingPolicies",
        http_method: "POST",
        request_uri: "/v1/describeschedulingpolicies"
      )

      DESCRIBE_SERVICE_ENVIRONMENTS = OperationModel.new(
        name: "DescribeServiceEnvironments",
        http_method: "POST",
        request_uri: "/v1/describeserviceenvironments"
      )

      DESCRIBE_SERVICE_JOB = OperationModel.new(
        name: "DescribeServiceJob",
        http_method: "POST",
        request_uri: "/v1/describeservicejob"
      )

      GET_JOB_QUEUE_SNAPSHOT = OperationModel.new(
        name: "GetJobQueueSnapshot",
        http_method: "POST",
        request_uri: "/v1/getjobqueuesnapshot"
      )

      LIST_CONSUMABLE_RESOURCES = OperationModel.new(
        name: "ListConsumableResources",
        http_method: "POST",
        request_uri: "/v1/listconsumableresources"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "POST",
        request_uri: "/v1/listjobs"
      )

      LIST_JOBS_BY_CONSUMABLE_RESOURCE = OperationModel.new(
        name: "ListJobsByConsumableResource",
        http_method: "POST",
        request_uri: "/v1/listjobsbyconsumableresource"
      )

      LIST_SCHEDULING_POLICIES = OperationModel.new(
        name: "ListSchedulingPolicies",
        http_method: "POST",
        request_uri: "/v1/listschedulingpolicies"
      )

      LIST_SERVICE_JOBS = OperationModel.new(
        name: "ListServiceJobs",
        http_method: "POST",
        request_uri: "/v1/listservicejobs"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v1/tags/{resourceArn}"
      )

      REGISTER_JOB_DEFINITION = OperationModel.new(
        name: "RegisterJobDefinition",
        http_method: "POST",
        request_uri: "/v1/registerjobdefinition"
      )

      SUBMIT_JOB = OperationModel.new(
        name: "SubmitJob",
        http_method: "POST",
        request_uri: "/v1/submitjob"
      )

      SUBMIT_SERVICE_JOB = OperationModel.new(
        name: "SubmitServiceJob",
        http_method: "POST",
        request_uri: "/v1/submitservicejob"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v1/tags/{resourceArn}"
      )

      TERMINATE_JOB = OperationModel.new(
        name: "TerminateJob",
        http_method: "POST",
        request_uri: "/v1/terminatejob"
      )

      TERMINATE_SERVICE_JOB = OperationModel.new(
        name: "TerminateServiceJob",
        http_method: "POST",
        request_uri: "/v1/terminateservicejob"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v1/tags/{resourceArn}"
      )

      UPDATE_COMPUTE_ENVIRONMENT = OperationModel.new(
        name: "UpdateComputeEnvironment",
        http_method: "POST",
        request_uri: "/v1/updatecomputeenvironment"
      )

      UPDATE_CONSUMABLE_RESOURCE = OperationModel.new(
        name: "UpdateConsumableResource",
        http_method: "POST",
        request_uri: "/v1/updateconsumableresource"
      )

      UPDATE_JOB_QUEUE = OperationModel.new(
        name: "UpdateJobQueue",
        http_method: "POST",
        request_uri: "/v1/updatejobqueue"
      )

      UPDATE_SCHEDULING_POLICY = OperationModel.new(
        name: "UpdateSchedulingPolicy",
        http_method: "POST",
        request_uri: "/v1/updateschedulingpolicy"
      )

      UPDATE_SERVICE_ENVIRONMENT = OperationModel.new(
        name: "UpdateServiceEnvironment",
        http_method: "POST",
        request_uri: "/v1/updateserviceenvironment"
      )
    end
  end
end
