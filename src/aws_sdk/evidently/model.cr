module AwsSdk
  module Evidently
    module Model
      API_VERSION = "2021-02-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "evidently"
      ENDPOINT_PREFIX = "evidently"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://evidently-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://evidently-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://evidently.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://evidently.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_EVALUATE_FEATURE = OperationModel.new(
        name: "BatchEvaluateFeature",
        http_method: "POST",
        request_uri: "/projects/{project}/evaluations"
      )

      CREATE_EXPERIMENT = OperationModel.new(
        name: "CreateExperiment",
        http_method: "POST",
        request_uri: "/projects/{project}/experiments"
      )

      CREATE_FEATURE = OperationModel.new(
        name: "CreateFeature",
        http_method: "POST",
        request_uri: "/projects/{project}/features"
      )

      CREATE_LAUNCH = OperationModel.new(
        name: "CreateLaunch",
        http_method: "POST",
        request_uri: "/projects/{project}/launches"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/projects"
      )

      CREATE_SEGMENT = OperationModel.new(
        name: "CreateSegment",
        http_method: "POST",
        request_uri: "/segments"
      )

      DELETE_EXPERIMENT = OperationModel.new(
        name: "DeleteExperiment",
        http_method: "DELETE",
        request_uri: "/projects/{project}/experiments/{experiment}"
      )

      DELETE_FEATURE = OperationModel.new(
        name: "DeleteFeature",
        http_method: "DELETE",
        request_uri: "/projects/{project}/features/{feature}"
      )

      DELETE_LAUNCH = OperationModel.new(
        name: "DeleteLaunch",
        http_method: "DELETE",
        request_uri: "/projects/{project}/launches/{launch}"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "DELETE",
        request_uri: "/projects/{project}"
      )

      DELETE_SEGMENT = OperationModel.new(
        name: "DeleteSegment",
        http_method: "DELETE",
        request_uri: "/segments/{segment}"
      )

      EVALUATE_FEATURE = OperationModel.new(
        name: "EvaluateFeature",
        http_method: "POST",
        request_uri: "/projects/{project}/evaluations/{feature}"
      )

      GET_EXPERIMENT = OperationModel.new(
        name: "GetExperiment",
        http_method: "GET",
        request_uri: "/projects/{project}/experiments/{experiment}"
      )

      GET_EXPERIMENT_RESULTS = OperationModel.new(
        name: "GetExperimentResults",
        http_method: "POST",
        request_uri: "/projects/{project}/experiments/{experiment}/results"
      )

      GET_FEATURE = OperationModel.new(
        name: "GetFeature",
        http_method: "GET",
        request_uri: "/projects/{project}/features/{feature}"
      )

      GET_LAUNCH = OperationModel.new(
        name: "GetLaunch",
        http_method: "GET",
        request_uri: "/projects/{project}/launches/{launch}"
      )

      GET_PROJECT = OperationModel.new(
        name: "GetProject",
        http_method: "GET",
        request_uri: "/projects/{project}"
      )

      GET_SEGMENT = OperationModel.new(
        name: "GetSegment",
        http_method: "GET",
        request_uri: "/segments/{segment}"
      )

      LIST_EXPERIMENTS = OperationModel.new(
        name: "ListExperiments",
        http_method: "GET",
        request_uri: "/projects/{project}/experiments"
      )

      LIST_FEATURES = OperationModel.new(
        name: "ListFeatures",
        http_method: "GET",
        request_uri: "/projects/{project}/features"
      )

      LIST_LAUNCHES = OperationModel.new(
        name: "ListLaunches",
        http_method: "GET",
        request_uri: "/projects/{project}/launches"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "GET",
        request_uri: "/projects"
      )

      LIST_SEGMENT_REFERENCES = OperationModel.new(
        name: "ListSegmentReferences",
        http_method: "GET",
        request_uri: "/segments/{segment}/references"
      )

      LIST_SEGMENTS = OperationModel.new(
        name: "ListSegments",
        http_method: "GET",
        request_uri: "/segments"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_PROJECT_EVENTS = OperationModel.new(
        name: "PutProjectEvents",
        http_method: "POST",
        request_uri: "/events/projects/{project}"
      )

      START_EXPERIMENT = OperationModel.new(
        name: "StartExperiment",
        http_method: "POST",
        request_uri: "/projects/{project}/experiments/{experiment}/start"
      )

      START_LAUNCH = OperationModel.new(
        name: "StartLaunch",
        http_method: "POST",
        request_uri: "/projects/{project}/launches/{launch}/start"
      )

      STOP_EXPERIMENT = OperationModel.new(
        name: "StopExperiment",
        http_method: "POST",
        request_uri: "/projects/{project}/experiments/{experiment}/cancel"
      )

      STOP_LAUNCH = OperationModel.new(
        name: "StopLaunch",
        http_method: "POST",
        request_uri: "/projects/{project}/launches/{launch}/cancel"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TEST_SEGMENT_PATTERN = OperationModel.new(
        name: "TestSegmentPattern",
        http_method: "POST",
        request_uri: "/test-segment-pattern"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_EXPERIMENT = OperationModel.new(
        name: "UpdateExperiment",
        http_method: "PATCH",
        request_uri: "/projects/{project}/experiments/{experiment}"
      )

      UPDATE_FEATURE = OperationModel.new(
        name: "UpdateFeature",
        http_method: "PATCH",
        request_uri: "/projects/{project}/features/{feature}"
      )

      UPDATE_LAUNCH = OperationModel.new(
        name: "UpdateLaunch",
        http_method: "PATCH",
        request_uri: "/projects/{project}/launches/{launch}"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "PATCH",
        request_uri: "/projects/{project}"
      )

      UPDATE_PROJECT_DATA_DELIVERY = OperationModel.new(
        name: "UpdateProjectDataDelivery",
        http_method: "PATCH",
        request_uri: "/projects/{project}/data-delivery"
      )
    end
  end
end
