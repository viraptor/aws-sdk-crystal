module AwsSdk
  module OSIS
    module Model
      API_VERSION = "2022-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "osis"
      ENDPOINT_PREFIX = "osis"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://osis-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://osis-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://osis.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://osis.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_PIPELINE = OperationModel.new(
        name: "CreatePipeline",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/createPipeline"
      )

      CREATE_PIPELINE_ENDPOINT = OperationModel.new(
        name: "CreatePipelineEndpoint",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/createPipelineEndpoint"
      )

      DELETE_PIPELINE = OperationModel.new(
        name: "DeletePipeline",
        http_method: "DELETE",
        request_uri: "/2022-01-01/osis/deletePipeline/{PipelineName}"
      )

      DELETE_PIPELINE_ENDPOINT = OperationModel.new(
        name: "DeletePipelineEndpoint",
        http_method: "DELETE",
        request_uri: "/2022-01-01/osis/deletePipelineEndpoint/{EndpointId}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/2022-01-01/osis/resourcePolicy/{ResourceArn}"
      )

      GET_PIPELINE = OperationModel.new(
        name: "GetPipeline",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/getPipeline/{PipelineName}"
      )

      GET_PIPELINE_BLUEPRINT = OperationModel.new(
        name: "GetPipelineBlueprint",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/getPipelineBlueprint/{BlueprintName}"
      )

      GET_PIPELINE_CHANGE_PROGRESS = OperationModel.new(
        name: "GetPipelineChangeProgress",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/getPipelineChangeProgress/{PipelineName}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/resourcePolicy/{ResourceArn}"
      )

      LIST_PIPELINE_BLUEPRINTS = OperationModel.new(
        name: "ListPipelineBlueprints",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/listPipelineBlueprints"
      )

      LIST_PIPELINE_ENDPOINT_CONNECTIONS = OperationModel.new(
        name: "ListPipelineEndpointConnections",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/listPipelineEndpointConnections"
      )

      LIST_PIPELINE_ENDPOINTS = OperationModel.new(
        name: "ListPipelineEndpoints",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/listPipelineEndpoints"
      )

      LIST_PIPELINES = OperationModel.new(
        name: "ListPipelines",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/listPipelines"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2022-01-01/osis/listTagsForResource/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/2022-01-01/osis/resourcePolicy/{ResourceArn}"
      )

      REVOKE_PIPELINE_ENDPOINT_CONNECTIONS = OperationModel.new(
        name: "RevokePipelineEndpointConnections",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/revokePipelineEndpointConnections"
      )

      START_PIPELINE = OperationModel.new(
        name: "StartPipeline",
        http_method: "PUT",
        request_uri: "/2022-01-01/osis/startPipeline/{PipelineName}"
      )

      STOP_PIPELINE = OperationModel.new(
        name: "StopPipeline",
        http_method: "PUT",
        request_uri: "/2022-01-01/osis/stopPipeline/{PipelineName}"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/tagResource/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/untagResource/"
      )

      UPDATE_PIPELINE = OperationModel.new(
        name: "UpdatePipeline",
        http_method: "PUT",
        request_uri: "/2022-01-01/osis/updatePipeline/{PipelineName}"
      )

      VALIDATE_PIPELINE = OperationModel.new(
        name: "ValidatePipeline",
        http_method: "POST",
        request_uri: "/2022-01-01/osis/validatePipeline"
      )
    end
  end
end
