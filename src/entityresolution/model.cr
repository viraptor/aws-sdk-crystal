module Aws
  module EntityResolution
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "entityresolution"
      ENDPOINT_PREFIX = "entityresolution"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://entityresolution-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://entityresolution-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://entityresolution.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://entityresolution.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_POLICY_STATEMENT = OperationModel.new(
        name: "AddPolicyStatement",
        http_method: "POST",
        request_uri: "/policies/{arn}/{statementId}"
      )

      BATCH_DELETE_UNIQUE_ID = OperationModel.new(
        name: "BatchDeleteUniqueId",
        http_method: "DELETE",
        request_uri: "/matchingworkflows/{workflowName}/uniqueids"
      )

      CREATE_ID_MAPPING_WORKFLOW = OperationModel.new(
        name: "CreateIdMappingWorkflow",
        http_method: "POST",
        request_uri: "/idmappingworkflows"
      )

      CREATE_ID_NAMESPACE = OperationModel.new(
        name: "CreateIdNamespace",
        http_method: "POST",
        request_uri: "/idnamespaces"
      )

      CREATE_MATCHING_WORKFLOW = OperationModel.new(
        name: "CreateMatchingWorkflow",
        http_method: "POST",
        request_uri: "/matchingworkflows"
      )

      CREATE_SCHEMA_MAPPING = OperationModel.new(
        name: "CreateSchemaMapping",
        http_method: "POST",
        request_uri: "/schemas"
      )

      DELETE_ID_MAPPING_WORKFLOW = OperationModel.new(
        name: "DeleteIdMappingWorkflow",
        http_method: "DELETE",
        request_uri: "/idmappingworkflows/{workflowName}"
      )

      DELETE_ID_NAMESPACE = OperationModel.new(
        name: "DeleteIdNamespace",
        http_method: "DELETE",
        request_uri: "/idnamespaces/{idNamespaceName}"
      )

      DELETE_MATCHING_WORKFLOW = OperationModel.new(
        name: "DeleteMatchingWorkflow",
        http_method: "DELETE",
        request_uri: "/matchingworkflows/{workflowName}"
      )

      DELETE_POLICY_STATEMENT = OperationModel.new(
        name: "DeletePolicyStatement",
        http_method: "DELETE",
        request_uri: "/policies/{arn}/{statementId}"
      )

      DELETE_SCHEMA_MAPPING = OperationModel.new(
        name: "DeleteSchemaMapping",
        http_method: "DELETE",
        request_uri: "/schemas/{schemaName}"
      )

      GENERATE_MATCH_ID = OperationModel.new(
        name: "GenerateMatchId",
        http_method: "POST",
        request_uri: "/matchingworkflows/{workflowName}/generateMatches"
      )

      GET_ID_MAPPING_JOB = OperationModel.new(
        name: "GetIdMappingJob",
        http_method: "GET",
        request_uri: "/idmappingworkflows/{workflowName}/jobs/{jobId}"
      )

      GET_ID_MAPPING_WORKFLOW = OperationModel.new(
        name: "GetIdMappingWorkflow",
        http_method: "GET",
        request_uri: "/idmappingworkflows/{workflowName}"
      )

      GET_ID_NAMESPACE = OperationModel.new(
        name: "GetIdNamespace",
        http_method: "GET",
        request_uri: "/idnamespaces/{idNamespaceName}"
      )

      GET_MATCH_ID = OperationModel.new(
        name: "GetMatchId",
        http_method: "POST",
        request_uri: "/matchingworkflows/{workflowName}/matches"
      )

      GET_MATCHING_JOB = OperationModel.new(
        name: "GetMatchingJob",
        http_method: "GET",
        request_uri: "/matchingworkflows/{workflowName}/jobs/{jobId}"
      )

      GET_MATCHING_WORKFLOW = OperationModel.new(
        name: "GetMatchingWorkflow",
        http_method: "GET",
        request_uri: "/matchingworkflows/{workflowName}"
      )

      GET_POLICY = OperationModel.new(
        name: "GetPolicy",
        http_method: "GET",
        request_uri: "/policies/{arn}"
      )

      GET_PROVIDER_SERVICE = OperationModel.new(
        name: "GetProviderService",
        http_method: "GET",
        request_uri: "/providerservices/{providerName}/{providerServiceName}"
      )

      GET_SCHEMA_MAPPING = OperationModel.new(
        name: "GetSchemaMapping",
        http_method: "GET",
        request_uri: "/schemas/{schemaName}"
      )

      LIST_ID_MAPPING_JOBS = OperationModel.new(
        name: "ListIdMappingJobs",
        http_method: "GET",
        request_uri: "/idmappingworkflows/{workflowName}/jobs"
      )

      LIST_ID_MAPPING_WORKFLOWS = OperationModel.new(
        name: "ListIdMappingWorkflows",
        http_method: "GET",
        request_uri: "/idmappingworkflows"
      )

      LIST_ID_NAMESPACES = OperationModel.new(
        name: "ListIdNamespaces",
        http_method: "GET",
        request_uri: "/idnamespaces"
      )

      LIST_MATCHING_JOBS = OperationModel.new(
        name: "ListMatchingJobs",
        http_method: "GET",
        request_uri: "/matchingworkflows/{workflowName}/jobs"
      )

      LIST_MATCHING_WORKFLOWS = OperationModel.new(
        name: "ListMatchingWorkflows",
        http_method: "GET",
        request_uri: "/matchingworkflows"
      )

      LIST_PROVIDER_SERVICES = OperationModel.new(
        name: "ListProviderServices",
        http_method: "GET",
        request_uri: "/providerservices"
      )

      LIST_SCHEMA_MAPPINGS = OperationModel.new(
        name: "ListSchemaMappings",
        http_method: "GET",
        request_uri: "/schemas"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_POLICY = OperationModel.new(
        name: "PutPolicy",
        http_method: "PUT",
        request_uri: "/policies/{arn}"
      )

      START_ID_MAPPING_JOB = OperationModel.new(
        name: "StartIdMappingJob",
        http_method: "POST",
        request_uri: "/idmappingworkflows/{workflowName}/jobs"
      )

      START_MATCHING_JOB = OperationModel.new(
        name: "StartMatchingJob",
        http_method: "POST",
        request_uri: "/matchingworkflows/{workflowName}/jobs"
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

      UPDATE_ID_MAPPING_WORKFLOW = OperationModel.new(
        name: "UpdateIdMappingWorkflow",
        http_method: "PUT",
        request_uri: "/idmappingworkflows/{workflowName}"
      )

      UPDATE_ID_NAMESPACE = OperationModel.new(
        name: "UpdateIdNamespace",
        http_method: "PUT",
        request_uri: "/idnamespaces/{idNamespaceName}"
      )

      UPDATE_MATCHING_WORKFLOW = OperationModel.new(
        name: "UpdateMatchingWorkflow",
        http_method: "PUT",
        request_uri: "/matchingworkflows/{workflowName}"
      )

      UPDATE_SCHEMA_MAPPING = OperationModel.new(
        name: "UpdateSchemaMapping",
        http_method: "PUT",
        request_uri: "/schemas/{schemaName}"
      )
    end
  end
end
