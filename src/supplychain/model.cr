module Aws
  module SupplyChain
    module Model
      API_VERSION = "2024-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "scn"
      ENDPOINT_PREFIX = "scn"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://scn-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://scn-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://scn.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://scn.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_BILL_OF_MATERIALS_IMPORT_JOB = OperationModel.new(
        name: "CreateBillOfMaterialsImportJob",
        http_method: "POST",
        request_uri: "/api/configuration/instances/{instanceId}/bill-of-materials-import-jobs"
      )

      CREATE_DATA_INTEGRATION_FLOW = OperationModel.new(
        name: "CreateDataIntegrationFlow",
        http_method: "PUT",
        request_uri: "/api/data-integration/instance/{instanceId}/data-integration-flows/{name}"
      )

      CREATE_DATA_LAKE_DATASET = OperationModel.new(
        name: "CreateDataLakeDataset",
        http_method: "PUT",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{namespace}/datasets/{name}"
      )

      CREATE_DATA_LAKE_NAMESPACE = OperationModel.new(
        name: "CreateDataLakeNamespace",
        http_method: "PUT",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{name}"
      )

      CREATE_INSTANCE = OperationModel.new(
        name: "CreateInstance",
        http_method: "POST",
        request_uri: "/api/instance"
      )

      DELETE_DATA_INTEGRATION_FLOW = OperationModel.new(
        name: "DeleteDataIntegrationFlow",
        http_method: "DELETE",
        request_uri: "/api/data-integration/instance/{instanceId}/data-integration-flows/{name}"
      )

      DELETE_DATA_LAKE_DATASET = OperationModel.new(
        name: "DeleteDataLakeDataset",
        http_method: "DELETE",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{namespace}/datasets/{name}"
      )

      DELETE_DATA_LAKE_NAMESPACE = OperationModel.new(
        name: "DeleteDataLakeNamespace",
        http_method: "DELETE",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{name}"
      )

      DELETE_INSTANCE = OperationModel.new(
        name: "DeleteInstance",
        http_method: "DELETE",
        request_uri: "/api/instance/{instanceId}"
      )

      GET_BILL_OF_MATERIALS_IMPORT_JOB = OperationModel.new(
        name: "GetBillOfMaterialsImportJob",
        http_method: "GET",
        request_uri: "/api/configuration/instances/{instanceId}/bill-of-materials-import-jobs/{jobId}"
      )

      GET_DATA_INTEGRATION_EVENT = OperationModel.new(
        name: "GetDataIntegrationEvent",
        http_method: "GET",
        request_uri: "/api-data/data-integration/instance/{instanceId}/data-integration-events/{eventId}"
      )

      GET_DATA_INTEGRATION_FLOW = OperationModel.new(
        name: "GetDataIntegrationFlow",
        http_method: "GET",
        request_uri: "/api/data-integration/instance/{instanceId}/data-integration-flows/{name}"
      )

      GET_DATA_INTEGRATION_FLOW_EXECUTION = OperationModel.new(
        name: "GetDataIntegrationFlowExecution",
        http_method: "GET",
        request_uri: "/api-data/data-integration/instance/{instanceId}/data-integration-flows/{flowName}/executions/{executionId}"
      )

      GET_DATA_LAKE_DATASET = OperationModel.new(
        name: "GetDataLakeDataset",
        http_method: "GET",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{namespace}/datasets/{name}"
      )

      GET_DATA_LAKE_NAMESPACE = OperationModel.new(
        name: "GetDataLakeNamespace",
        http_method: "GET",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{name}"
      )

      GET_INSTANCE = OperationModel.new(
        name: "GetInstance",
        http_method: "GET",
        request_uri: "/api/instance/{instanceId}"
      )

      LIST_DATA_INTEGRATION_EVENTS = OperationModel.new(
        name: "ListDataIntegrationEvents",
        http_method: "GET",
        request_uri: "/api-data/data-integration/instance/{instanceId}/data-integration-events"
      )

      LIST_DATA_INTEGRATION_FLOW_EXECUTIONS = OperationModel.new(
        name: "ListDataIntegrationFlowExecutions",
        http_method: "GET",
        request_uri: "/api-data/data-integration/instance/{instanceId}/data-integration-flows/{flowName}/executions"
      )

      LIST_DATA_INTEGRATION_FLOWS = OperationModel.new(
        name: "ListDataIntegrationFlows",
        http_method: "GET",
        request_uri: "/api/data-integration/instance/{instanceId}/data-integration-flows"
      )

      LIST_DATA_LAKE_DATASETS = OperationModel.new(
        name: "ListDataLakeDatasets",
        http_method: "GET",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{namespace}/datasets"
      )

      LIST_DATA_LAKE_NAMESPACES = OperationModel.new(
        name: "ListDataLakeNamespaces",
        http_method: "GET",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "GET",
        request_uri: "/api/instance"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/api/tags/{resourceArn}"
      )

      SEND_DATA_INTEGRATION_EVENT = OperationModel.new(
        name: "SendDataIntegrationEvent",
        http_method: "POST",
        request_uri: "/api-data/data-integration/instance/{instanceId}/data-integration-events"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/api/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/api/tags/{resourceArn}"
      )

      UPDATE_DATA_INTEGRATION_FLOW = OperationModel.new(
        name: "UpdateDataIntegrationFlow",
        http_method: "PATCH",
        request_uri: "/api/data-integration/instance/{instanceId}/data-integration-flows/{name}"
      )

      UPDATE_DATA_LAKE_DATASET = OperationModel.new(
        name: "UpdateDataLakeDataset",
        http_method: "PATCH",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{namespace}/datasets/{name}"
      )

      UPDATE_DATA_LAKE_NAMESPACE = OperationModel.new(
        name: "UpdateDataLakeNamespace",
        http_method: "PATCH",
        request_uri: "/api/datalake/instance/{instanceId}/namespaces/{name}"
      )

      UPDATE_INSTANCE = OperationModel.new(
        name: "UpdateInstance",
        http_method: "PATCH",
        request_uri: "/api/instance/{instanceId}"
      )
    end
  end
end
