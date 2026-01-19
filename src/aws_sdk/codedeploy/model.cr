module AwsSdk
  module CodeDeploy
    module Model
      API_VERSION = "2014-10-06"
      TARGET_PREFIX = "CodeDeploy_20141006"
      SIGNING_NAME = "codedeploy"
      ENDPOINT_PREFIX = "codedeploy"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codedeploy-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codedeploy-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codedeploy.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codedeploy.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_ON_PREMISES_INSTANCES = OperationModel.new(
        name: "AddTagsToOnPremisesInstances",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_APPLICATION_REVISIONS = OperationModel.new(
        name: "BatchGetApplicationRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_APPLICATIONS = OperationModel.new(
        name: "BatchGetApplications",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DEPLOYMENT_GROUPS = OperationModel.new(
        name: "BatchGetDeploymentGroups",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DEPLOYMENT_INSTANCES = OperationModel.new(
        name: "BatchGetDeploymentInstances",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DEPLOYMENT_TARGETS = OperationModel.new(
        name: "BatchGetDeploymentTargets",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DEPLOYMENTS = OperationModel.new(
        name: "BatchGetDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_ON_PREMISES_INSTANCES = OperationModel.new(
        name: "BatchGetOnPremisesInstances",
        http_method: "POST",
        request_uri: "/"
      )

      CONTINUE_DEPLOYMENT = OperationModel.new(
        name: "ContinueDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEPLOYMENT = OperationModel.new(
        name: "CreateDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEPLOYMENT_CONFIG = OperationModel.new(
        name: "CreateDeploymentConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEPLOYMENT_GROUP = OperationModel.new(
        name: "CreateDeploymentGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEPLOYMENT_CONFIG = OperationModel.new(
        name: "DeleteDeploymentConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DEPLOYMENT_GROUP = OperationModel.new(
        name: "DeleteDeploymentGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GIT_HUB_ACCOUNT_TOKEN = OperationModel.new(
        name: "DeleteGitHubAccountToken",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCES_BY_EXTERNAL_ID = OperationModel.new(
        name: "DeleteResourcesByExternalId",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_ON_PREMISES_INSTANCE = OperationModel.new(
        name: "DeregisterOnPremisesInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPLICATION_REVISION = OperationModel.new(
        name: "GetApplicationRevision",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT = OperationModel.new(
        name: "GetDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT_CONFIG = OperationModel.new(
        name: "GetDeploymentConfig",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT_GROUP = OperationModel.new(
        name: "GetDeploymentGroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT_INSTANCE = OperationModel.new(
        name: "GetDeploymentInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEPLOYMENT_TARGET = OperationModel.new(
        name: "GetDeploymentTarget",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ON_PREMISES_INSTANCE = OperationModel.new(
        name: "GetOnPremisesInstance",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_REVISIONS = OperationModel.new(
        name: "ListApplicationRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENT_CONFIGS = OperationModel.new(
        name: "ListDeploymentConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENT_GROUPS = OperationModel.new(
        name: "ListDeploymentGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENT_INSTANCES = OperationModel.new(
        name: "ListDeploymentInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENT_TARGETS = OperationModel.new(
        name: "ListDeploymentTargets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DEPLOYMENTS = OperationModel.new(
        name: "ListDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GIT_HUB_ACCOUNT_TOKEN_NAMES = OperationModel.new(
        name: "ListGitHubAccountTokenNames",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ON_PREMISES_INSTANCES = OperationModel.new(
        name: "ListOnPremisesInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LIFECYCLE_EVENT_HOOK_EXECUTION_STATUS = OperationModel.new(
        name: "PutLifecycleEventHookExecutionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_APPLICATION_REVISION = OperationModel.new(
        name: "RegisterApplicationRevision",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_ON_PREMISES_INSTANCE = OperationModel.new(
        name: "RegisterOnPremisesInstance",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_ON_PREMISES_INSTANCES = OperationModel.new(
        name: "RemoveTagsFromOnPremisesInstances",
        http_method: "POST",
        request_uri: "/"
      )

      SKIP_WAIT_TIME_FOR_INSTANCE_TERMINATION = OperationModel.new(
        name: "SkipWaitTimeForInstanceTermination",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DEPLOYMENT = OperationModel.new(
        name: "StopDeployment",
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

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEPLOYMENT_GROUP = OperationModel.new(
        name: "UpdateDeploymentGroup",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
