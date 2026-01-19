module AwsSdk
  module Fis
    module Model
      API_VERSION = "2020-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "fis"
      ENDPOINT_PREFIX = "fis"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://fis.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://fis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://fis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_EXPERIMENT_TEMPLATE = OperationModel.new(
        name: "CreateExperimentTemplate",
        http_method: "POST",
        request_uri: "/experimentTemplates"
      )

      CREATE_TARGET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "CreateTargetAccountConfiguration",
        http_method: "POST",
        request_uri: "/experimentTemplates/{id}/targetAccountConfigurations/{accountId}"
      )

      DELETE_EXPERIMENT_TEMPLATE = OperationModel.new(
        name: "DeleteExperimentTemplate",
        http_method: "DELETE",
        request_uri: "/experimentTemplates/{id}"
      )

      DELETE_TARGET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "DeleteTargetAccountConfiguration",
        http_method: "DELETE",
        request_uri: "/experimentTemplates/{id}/targetAccountConfigurations/{accountId}"
      )

      GET_ACTION = OperationModel.new(
        name: "GetAction",
        http_method: "GET",
        request_uri: "/actions/{id}"
      )

      GET_EXPERIMENT = OperationModel.new(
        name: "GetExperiment",
        http_method: "GET",
        request_uri: "/experiments/{id}"
      )

      GET_EXPERIMENT_TARGET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "GetExperimentTargetAccountConfiguration",
        http_method: "GET",
        request_uri: "/experiments/{id}/targetAccountConfigurations/{accountId}"
      )

      GET_EXPERIMENT_TEMPLATE = OperationModel.new(
        name: "GetExperimentTemplate",
        http_method: "GET",
        request_uri: "/experimentTemplates/{id}"
      )

      GET_SAFETY_LEVER = OperationModel.new(
        name: "GetSafetyLever",
        http_method: "GET",
        request_uri: "/safetyLevers/{id}"
      )

      GET_TARGET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "GetTargetAccountConfiguration",
        http_method: "GET",
        request_uri: "/experimentTemplates/{id}/targetAccountConfigurations/{accountId}"
      )

      GET_TARGET_RESOURCE_TYPE = OperationModel.new(
        name: "GetTargetResourceType",
        http_method: "GET",
        request_uri: "/targetResourceTypes/{resourceType}"
      )

      LIST_ACTIONS = OperationModel.new(
        name: "ListActions",
        http_method: "GET",
        request_uri: "/actions"
      )

      LIST_EXPERIMENT_RESOLVED_TARGETS = OperationModel.new(
        name: "ListExperimentResolvedTargets",
        http_method: "GET",
        request_uri: "/experiments/{id}/resolvedTargets"
      )

      LIST_EXPERIMENT_TARGET_ACCOUNT_CONFIGURATIONS = OperationModel.new(
        name: "ListExperimentTargetAccountConfigurations",
        http_method: "GET",
        request_uri: "/experiments/{id}/targetAccountConfigurations"
      )

      LIST_EXPERIMENT_TEMPLATES = OperationModel.new(
        name: "ListExperimentTemplates",
        http_method: "GET",
        request_uri: "/experimentTemplates"
      )

      LIST_EXPERIMENTS = OperationModel.new(
        name: "ListExperiments",
        http_method: "GET",
        request_uri: "/experiments"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TARGET_ACCOUNT_CONFIGURATIONS = OperationModel.new(
        name: "ListTargetAccountConfigurations",
        http_method: "GET",
        request_uri: "/experimentTemplates/{id}/targetAccountConfigurations"
      )

      LIST_TARGET_RESOURCE_TYPES = OperationModel.new(
        name: "ListTargetResourceTypes",
        http_method: "GET",
        request_uri: "/targetResourceTypes"
      )

      START_EXPERIMENT = OperationModel.new(
        name: "StartExperiment",
        http_method: "POST",
        request_uri: "/experiments"
      )

      STOP_EXPERIMENT = OperationModel.new(
        name: "StopExperiment",
        http_method: "DELETE",
        request_uri: "/experiments/{id}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_EXPERIMENT_TEMPLATE = OperationModel.new(
        name: "UpdateExperimentTemplate",
        http_method: "PATCH",
        request_uri: "/experimentTemplates/{id}"
      )

      UPDATE_SAFETY_LEVER_STATE = OperationModel.new(
        name: "UpdateSafetyLeverState",
        http_method: "PATCH",
        request_uri: "/safetyLevers/{id}/state"
      )

      UPDATE_TARGET_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "UpdateTargetAccountConfiguration",
        http_method: "PATCH",
        request_uri: "/experimentTemplates/{id}/targetAccountConfigurations/{accountId}"
      )
    end
  end
end
