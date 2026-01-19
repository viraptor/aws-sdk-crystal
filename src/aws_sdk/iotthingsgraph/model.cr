module AwsSdk
  module IoTThingsGraph
    module Model
      API_VERSION = "2018-09-06"
      TARGET_PREFIX = "IotThingsGraphFrontEndService"
      SIGNING_NAME = "iotthingsgraph"
      ENDPOINT_PREFIX = "iotthingsgraph"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotthingsgraph-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotthingsgraph-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotthingsgraph.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://iotthingsgraph.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://iotthingsgraph.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ENTITY_TO_THING = OperationModel.new(
        name: "AssociateEntityToThing",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLOW_TEMPLATE = OperationModel.new(
        name: "CreateFlowTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SYSTEM_INSTANCE = OperationModel.new(
        name: "CreateSystemInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SYSTEM_TEMPLATE = OperationModel.new(
        name: "CreateSystemTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLOW_TEMPLATE = OperationModel.new(
        name: "DeleteFlowTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NAMESPACE = OperationModel.new(
        name: "DeleteNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SYSTEM_INSTANCE = OperationModel.new(
        name: "DeleteSystemInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SYSTEM_TEMPLATE = OperationModel.new(
        name: "DeleteSystemTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DEPLOY_SYSTEM_INSTANCE = OperationModel.new(
        name: "DeploySystemInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DEPRECATE_FLOW_TEMPLATE = OperationModel.new(
        name: "DeprecateFlowTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DEPRECATE_SYSTEM_TEMPLATE = OperationModel.new(
        name: "DeprecateSystemTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NAMESPACE = OperationModel.new(
        name: "DescribeNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      DISSOCIATE_ENTITY_FROM_THING = OperationModel.new(
        name: "DissociateEntityFromThing",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENTITIES = OperationModel.new(
        name: "GetEntities",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FLOW_TEMPLATE = OperationModel.new(
        name: "GetFlowTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FLOW_TEMPLATE_REVISIONS = OperationModel.new(
        name: "GetFlowTemplateRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NAMESPACE_DELETION_STATUS = OperationModel.new(
        name: "GetNamespaceDeletionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SYSTEM_INSTANCE = OperationModel.new(
        name: "GetSystemInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SYSTEM_TEMPLATE = OperationModel.new(
        name: "GetSystemTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SYSTEM_TEMPLATE_REVISIONS = OperationModel.new(
        name: "GetSystemTemplateRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_UPLOAD_STATUS = OperationModel.new(
        name: "GetUploadStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLOW_EXECUTION_MESSAGES = OperationModel.new(
        name: "ListFlowExecutionMessages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_ENTITIES = OperationModel.new(
        name: "SearchEntities",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_FLOW_EXECUTIONS = OperationModel.new(
        name: "SearchFlowExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_FLOW_TEMPLATES = OperationModel.new(
        name: "SearchFlowTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_SYSTEM_INSTANCES = OperationModel.new(
        name: "SearchSystemInstances",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_SYSTEM_TEMPLATES = OperationModel.new(
        name: "SearchSystemTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_THINGS = OperationModel.new(
        name: "SearchThings",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNDEPLOY_SYSTEM_INSTANCE = OperationModel.new(
        name: "UndeploySystemInstance",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLOW_TEMPLATE = OperationModel.new(
        name: "UpdateFlowTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SYSTEM_TEMPLATE = OperationModel.new(
        name: "UpdateSystemTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_ENTITY_DEFINITIONS = OperationModel.new(
        name: "UploadEntityDefinitions",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
