module Aws
  module ECS
    module Model
      API_VERSION = "2014-11-13"
      TARGET_PREFIX = "AmazonEC2ContainerServiceV20141113"
      SIGNING_NAME = "ecs"
      ENDPOINT_PREFIX = "ecs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ecs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ecs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ecs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ecs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CAPACITY_PROVIDER = OperationModel.new(
        name: "CreateCapacityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPRESS_GATEWAY_SERVICE = OperationModel.new(
        name: "CreateExpressGatewayService",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TASK_SET = OperationModel.new(
        name: "CreateTaskSet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCOUNT_SETTING = OperationModel.new(
        name: "DeleteAccountSetting",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ATTRIBUTES = OperationModel.new(
        name: "DeleteAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAPACITY_PROVIDER = OperationModel.new(
        name: "DeleteCapacityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPRESS_GATEWAY_SERVICE = OperationModel.new(
        name: "DeleteExpressGatewayService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TASK_DEFINITIONS = OperationModel.new(
        name: "DeleteTaskDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TASK_SET = OperationModel.new(
        name: "DeleteTaskSet",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_CONTAINER_INSTANCE = OperationModel.new(
        name: "DeregisterContainerInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TASK_DEFINITION = OperationModel.new(
        name: "DeregisterTaskDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_PROVIDERS = OperationModel.new(
        name: "DescribeCapacityProviders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTERS = OperationModel.new(
        name: "DescribeClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONTAINER_INSTANCES = OperationModel.new(
        name: "DescribeContainerInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPRESS_GATEWAY_SERVICE = OperationModel.new(
        name: "DescribeExpressGatewayService",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_DEPLOYMENTS = OperationModel.new(
        name: "DescribeServiceDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_REVISIONS = OperationModel.new(
        name: "DescribeServiceRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICES = OperationModel.new(
        name: "DescribeServices",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TASK_DEFINITION = OperationModel.new(
        name: "DescribeTaskDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TASK_SETS = OperationModel.new(
        name: "DescribeTaskSets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TASKS = OperationModel.new(
        name: "DescribeTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DISCOVER_POLL_ENDPOINT = OperationModel.new(
        name: "DiscoverPollEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      EXECUTE_COMMAND = OperationModel.new(
        name: "ExecuteCommand",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TASK_PROTECTION = OperationModel.new(
        name: "GetTaskProtection",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCOUNT_SETTINGS = OperationModel.new(
        name: "ListAccountSettings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ATTRIBUTES = OperationModel.new(
        name: "ListAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONTAINER_INSTANCES = OperationModel.new(
        name: "ListContainerInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_DEPLOYMENTS = OperationModel.new(
        name: "ListServiceDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES_BY_NAMESPACE = OperationModel.new(
        name: "ListServicesByNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASK_DEFINITION_FAMILIES = OperationModel.new(
        name: "ListTaskDefinitionFamilies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASK_DEFINITIONS = OperationModel.new(
        name: "ListTaskDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASKS = OperationModel.new(
        name: "ListTasks",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCOUNT_SETTING = OperationModel.new(
        name: "PutAccountSetting",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCOUNT_SETTING_DEFAULT = OperationModel.new(
        name: "PutAccountSettingDefault",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ATTRIBUTES = OperationModel.new(
        name: "PutAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CLUSTER_CAPACITY_PROVIDERS = OperationModel.new(
        name: "PutClusterCapacityProviders",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_CONTAINER_INSTANCE = OperationModel.new(
        name: "RegisterContainerInstance",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TASK_DEFINITION = OperationModel.new(
        name: "RegisterTaskDefinition",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_TASK = OperationModel.new(
        name: "RunTask",
        http_method: "POST",
        request_uri: "/"
      )

      START_TASK = OperationModel.new(
        name: "StartTask",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SERVICE_DEPLOYMENT = OperationModel.new(
        name: "StopServiceDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TASK = OperationModel.new(
        name: "StopTask",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_ATTACHMENT_STATE_CHANGES = OperationModel.new(
        name: "SubmitAttachmentStateChanges",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_CONTAINER_STATE_CHANGE = OperationModel.new(
        name: "SubmitContainerStateChange",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_TASK_STATE_CHANGE = OperationModel.new(
        name: "SubmitTaskStateChange",
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

      UPDATE_CAPACITY_PROVIDER = OperationModel.new(
        name: "UpdateCapacityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER_SETTINGS = OperationModel.new(
        name: "UpdateClusterSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTAINER_AGENT = OperationModel.new(
        name: "UpdateContainerAgent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTAINER_INSTANCES_STATE = OperationModel.new(
        name: "UpdateContainerInstancesState",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EXPRESS_GATEWAY_SERVICE = OperationModel.new(
        name: "UpdateExpressGatewayService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE = OperationModel.new(
        name: "UpdateService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_PRIMARY_TASK_SET = OperationModel.new(
        name: "UpdateServicePrimaryTaskSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TASK_PROTECTION = OperationModel.new(
        name: "UpdateTaskProtection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TASK_SET = OperationModel.new(
        name: "UpdateTaskSet",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
