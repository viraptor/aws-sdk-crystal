module AwsSdk
  module IotDeviceAdvisor
    module Model
      API_VERSION = "2020-09-18"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotdeviceadvisor"
      ENDPOINT_PREFIX = "api.iotdeviceadvisor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotdeviceadvisor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotdeviceadvisor-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.iotdeviceadvisor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.iotdeviceadvisor.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_SUITE_DEFINITION = OperationModel.new(
        name: "CreateSuiteDefinition",
        http_method: "POST",
        request_uri: "/suiteDefinitions"
      )

      DELETE_SUITE_DEFINITION = OperationModel.new(
        name: "DeleteSuiteDefinition",
        http_method: "DELETE",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}"
      )

      GET_ENDPOINT = OperationModel.new(
        name: "GetEndpoint",
        http_method: "GET",
        request_uri: "/endpoint"
      )

      GET_SUITE_DEFINITION = OperationModel.new(
        name: "GetSuiteDefinition",
        http_method: "GET",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}"
      )

      GET_SUITE_RUN = OperationModel.new(
        name: "GetSuiteRun",
        http_method: "GET",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}/suiteRuns/{suiteRunId}"
      )

      GET_SUITE_RUN_REPORT = OperationModel.new(
        name: "GetSuiteRunReport",
        http_method: "GET",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}/suiteRuns/{suiteRunId}/report"
      )

      LIST_SUITE_DEFINITIONS = OperationModel.new(
        name: "ListSuiteDefinitions",
        http_method: "GET",
        request_uri: "/suiteDefinitions"
      )

      LIST_SUITE_RUNS = OperationModel.new(
        name: "ListSuiteRuns",
        http_method: "GET",
        request_uri: "/suiteRuns"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_SUITE_RUN = OperationModel.new(
        name: "StartSuiteRun",
        http_method: "POST",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}/suiteRuns"
      )

      STOP_SUITE_RUN = OperationModel.new(
        name: "StopSuiteRun",
        http_method: "POST",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}/suiteRuns/{suiteRunId}/stop"
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

      UPDATE_SUITE_DEFINITION = OperationModel.new(
        name: "UpdateSuiteDefinition",
        http_method: "PATCH",
        request_uri: "/suiteDefinitions/{suiteDefinitionId}"
      )
    end
  end
end
