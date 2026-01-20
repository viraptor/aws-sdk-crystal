module Aws
  module EMR
    module Model
      API_VERSION = "2009-03-31"
      TARGET_PREFIX = "ElasticMapReduce"
      SIGNING_NAME = "elasticmapreduce"
      ENDPOINT_PREFIX = "elasticmapreduce"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticmapreduce-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://elasticmapreduce.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://elasticmapreduce-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticmapreduce.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://elasticmapreduce.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_INSTANCE_FLEET = OperationModel.new(
        name: "AddInstanceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_INSTANCE_GROUPS = OperationModel.new(
        name: "AddInstanceGroups",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_JOB_FLOW_STEPS = OperationModel.new(
        name: "AddJobFlowSteps",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_STEPS = OperationModel.new(
        name: "CancelSteps",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PERSISTENT_APP_UI = OperationModel.new(
        name: "CreatePersistentAppUI",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "CreateSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STUDIO = OperationModel.new(
        name: "CreateStudio",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STUDIO_SESSION_MAPPING = OperationModel.new(
        name: "CreateStudioSessionMapping",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "DeleteSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STUDIO = OperationModel.new(
        name: "DeleteStudio",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STUDIO_SESSION_MAPPING = OperationModel.new(
        name: "DeleteStudioSessionMapping",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_JOB_FLOWS = OperationModel.new(
        name: "DescribeJobFlows",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NOTEBOOK_EXECUTION = OperationModel.new(
        name: "DescribeNotebookExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PERSISTENT_APP_UI = OperationModel.new(
        name: "DescribePersistentAppUI",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RELEASE_LABEL = OperationModel.new(
        name: "DescribeReleaseLabel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "DescribeSecurityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STEP = OperationModel.new(
        name: "DescribeStep",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STUDIO = OperationModel.new(
        name: "DescribeStudio",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTO_TERMINATION_POLICY = OperationModel.new(
        name: "GetAutoTerminationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLOCK_PUBLIC_ACCESS_CONFIGURATION = OperationModel.new(
        name: "GetBlockPublicAccessConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLUSTER_SESSION_CREDENTIALS = OperationModel.new(
        name: "GetClusterSessionCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MANAGED_SCALING_POLICY = OperationModel.new(
        name: "GetManagedScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ON_CLUSTER_APP_UI_PRESIGNED_URL = OperationModel.new(
        name: "GetOnClusterAppUIPresignedURL",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PERSISTENT_APP_UI_PRESIGNED_URL = OperationModel.new(
        name: "GetPersistentAppUIPresignedURL",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STUDIO_SESSION_MAPPING = OperationModel.new(
        name: "GetStudioSessionMapping",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BOOTSTRAP_ACTIONS = OperationModel.new(
        name: "ListBootstrapActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_FLEETS = OperationModel.new(
        name: "ListInstanceFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_GROUPS = OperationModel.new(
        name: "ListInstanceGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NOTEBOOK_EXECUTIONS = OperationModel.new(
        name: "ListNotebookExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RELEASE_LABELS = OperationModel.new(
        name: "ListReleaseLabels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECURITY_CONFIGURATIONS = OperationModel.new(
        name: "ListSecurityConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STEPS = OperationModel.new(
        name: "ListSteps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STUDIO_SESSION_MAPPINGS = OperationModel.new(
        name: "ListStudioSessionMappings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STUDIOS = OperationModel.new(
        name: "ListStudios",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SUPPORTED_INSTANCE_TYPES = OperationModel.new(
        name: "ListSupportedInstanceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER = OperationModel.new(
        name: "ModifyCluster",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_FLEET = OperationModel.new(
        name: "ModifyInstanceFleet",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_GROUPS = OperationModel.new(
        name: "ModifyInstanceGroups",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_AUTO_SCALING_POLICY = OperationModel.new(
        name: "PutAutoScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_AUTO_TERMINATION_POLICY = OperationModel.new(
        name: "PutAutoTerminationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_BLOCK_PUBLIC_ACCESS_CONFIGURATION = OperationModel.new(
        name: "PutBlockPublicAccessConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MANAGED_SCALING_POLICY = OperationModel.new(
        name: "PutManagedScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_AUTO_SCALING_POLICY = OperationModel.new(
        name: "RemoveAutoScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_AUTO_TERMINATION_POLICY = OperationModel.new(
        name: "RemoveAutoTerminationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_MANAGED_SCALING_POLICY = OperationModel.new(
        name: "RemoveManagedScalingPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_JOB_FLOW = OperationModel.new(
        name: "RunJobFlow",
        http_method: "POST",
        request_uri: "/"
      )

      SET_KEEP_JOB_FLOW_ALIVE_WHEN_NO_STEPS = OperationModel.new(
        name: "SetKeepJobFlowAliveWhenNoSteps",
        http_method: "POST",
        request_uri: "/"
      )

      SET_TERMINATION_PROTECTION = OperationModel.new(
        name: "SetTerminationProtection",
        http_method: "POST",
        request_uri: "/"
      )

      SET_UNHEALTHY_NODE_REPLACEMENT = OperationModel.new(
        name: "SetUnhealthyNodeReplacement",
        http_method: "POST",
        request_uri: "/"
      )

      SET_VISIBLE_TO_ALL_USERS = OperationModel.new(
        name: "SetVisibleToAllUsers",
        http_method: "POST",
        request_uri: "/"
      )

      START_NOTEBOOK_EXECUTION = OperationModel.new(
        name: "StartNotebookExecution",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_NOTEBOOK_EXECUTION = OperationModel.new(
        name: "StopNotebookExecution",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_JOB_FLOWS = OperationModel.new(
        name: "TerminateJobFlows",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STUDIO = OperationModel.new(
        name: "UpdateStudio",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STUDIO_SESSION_MAPPING = OperationModel.new(
        name: "UpdateStudioSessionMapping",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
