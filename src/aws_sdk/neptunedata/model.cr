module AwsSdk
  module Neptunedata
    module Model
      API_VERSION = "2023-08-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "neptune-db"
      ENDPOINT_PREFIX = "neptune-db"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://neptune-db-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://neptune-db-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://neptune-db.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://neptune-db.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_GREMLIN_QUERY = OperationModel.new(
        name: "CancelGremlinQuery",
        http_method: "DELETE",
        request_uri: "/gremlin/status/{queryId}"
      )

      CANCEL_LOADER_JOB = OperationModel.new(
        name: "CancelLoaderJob",
        http_method: "DELETE",
        request_uri: "/loader/{loadId}"
      )

      CANCEL_ML_DATA_PROCESSING_JOB = OperationModel.new(
        name: "CancelMLDataProcessingJob",
        http_method: "DELETE",
        request_uri: "/ml/dataprocessing/{id}"
      )

      CANCEL_ML_MODEL_TRAINING_JOB = OperationModel.new(
        name: "CancelMLModelTrainingJob",
        http_method: "DELETE",
        request_uri: "/ml/modeltraining/{id}"
      )

      CANCEL_ML_MODEL_TRANSFORM_JOB = OperationModel.new(
        name: "CancelMLModelTransformJob",
        http_method: "DELETE",
        request_uri: "/ml/modeltransform/{id}"
      )

      CANCEL_OPEN_CYPHER_QUERY = OperationModel.new(
        name: "CancelOpenCypherQuery",
        http_method: "DELETE",
        request_uri: "/opencypher/status/{queryId}"
      )

      CREATE_ML_ENDPOINT = OperationModel.new(
        name: "CreateMLEndpoint",
        http_method: "POST",
        request_uri: "/ml/endpoints"
      )

      DELETE_ML_ENDPOINT = OperationModel.new(
        name: "DeleteMLEndpoint",
        http_method: "DELETE",
        request_uri: "/ml/endpoints/{id}"
      )

      DELETE_PROPERTYGRAPH_STATISTICS = OperationModel.new(
        name: "DeletePropertygraphStatistics",
        http_method: "DELETE",
        request_uri: "/propertygraph/statistics"
      )

      DELETE_SPARQL_STATISTICS = OperationModel.new(
        name: "DeleteSparqlStatistics",
        http_method: "DELETE",
        request_uri: "/sparql/statistics"
      )

      EXECUTE_FAST_RESET = OperationModel.new(
        name: "ExecuteFastReset",
        http_method: "POST",
        request_uri: "/system"
      )

      EXECUTE_GREMLIN_EXPLAIN_QUERY = OperationModel.new(
        name: "ExecuteGremlinExplainQuery",
        http_method: "POST",
        request_uri: "/gremlin/explain"
      )

      EXECUTE_GREMLIN_PROFILE_QUERY = OperationModel.new(
        name: "ExecuteGremlinProfileQuery",
        http_method: "POST",
        request_uri: "/gremlin/profile"
      )

      EXECUTE_GREMLIN_QUERY = OperationModel.new(
        name: "ExecuteGremlinQuery",
        http_method: "POST",
        request_uri: "/gremlin"
      )

      EXECUTE_OPEN_CYPHER_EXPLAIN_QUERY = OperationModel.new(
        name: "ExecuteOpenCypherExplainQuery",
        http_method: "POST",
        request_uri: "/opencypher/explain"
      )

      EXECUTE_OPEN_CYPHER_QUERY = OperationModel.new(
        name: "ExecuteOpenCypherQuery",
        http_method: "POST",
        request_uri: "/opencypher"
      )

      GET_ENGINE_STATUS = OperationModel.new(
        name: "GetEngineStatus",
        http_method: "GET",
        request_uri: "/status"
      )

      GET_GREMLIN_QUERY_STATUS = OperationModel.new(
        name: "GetGremlinQueryStatus",
        http_method: "GET",
        request_uri: "/gremlin/status/{queryId}"
      )

      GET_LOADER_JOB_STATUS = OperationModel.new(
        name: "GetLoaderJobStatus",
        http_method: "GET",
        request_uri: "/loader/{loadId}"
      )

      GET_ML_DATA_PROCESSING_JOB = OperationModel.new(
        name: "GetMLDataProcessingJob",
        http_method: "GET",
        request_uri: "/ml/dataprocessing/{id}"
      )

      GET_ML_ENDPOINT = OperationModel.new(
        name: "GetMLEndpoint",
        http_method: "GET",
        request_uri: "/ml/endpoints/{id}"
      )

      GET_ML_MODEL_TRAINING_JOB = OperationModel.new(
        name: "GetMLModelTrainingJob",
        http_method: "GET",
        request_uri: "/ml/modeltraining/{id}"
      )

      GET_ML_MODEL_TRANSFORM_JOB = OperationModel.new(
        name: "GetMLModelTransformJob",
        http_method: "GET",
        request_uri: "/ml/modeltransform/{id}"
      )

      GET_OPEN_CYPHER_QUERY_STATUS = OperationModel.new(
        name: "GetOpenCypherQueryStatus",
        http_method: "GET",
        request_uri: "/opencypher/status/{queryId}"
      )

      GET_PROPERTYGRAPH_STATISTICS = OperationModel.new(
        name: "GetPropertygraphStatistics",
        http_method: "GET",
        request_uri: "/propertygraph/statistics"
      )

      GET_PROPERTYGRAPH_STREAM = OperationModel.new(
        name: "GetPropertygraphStream",
        http_method: "GET",
        request_uri: "/propertygraph/stream"
      )

      GET_PROPERTYGRAPH_SUMMARY = OperationModel.new(
        name: "GetPropertygraphSummary",
        http_method: "GET",
        request_uri: "/propertygraph/statistics/summary"
      )

      GET_RDF_GRAPH_SUMMARY = OperationModel.new(
        name: "GetRDFGraphSummary",
        http_method: "GET",
        request_uri: "/rdf/statistics/summary"
      )

      GET_SPARQL_STATISTICS = OperationModel.new(
        name: "GetSparqlStatistics",
        http_method: "GET",
        request_uri: "/sparql/statistics"
      )

      GET_SPARQL_STREAM = OperationModel.new(
        name: "GetSparqlStream",
        http_method: "GET",
        request_uri: "/sparql/stream"
      )

      LIST_GREMLIN_QUERIES = OperationModel.new(
        name: "ListGremlinQueries",
        http_method: "GET",
        request_uri: "/gremlin/status"
      )

      LIST_LOADER_JOBS = OperationModel.new(
        name: "ListLoaderJobs",
        http_method: "GET",
        request_uri: "/loader"
      )

      LIST_ML_DATA_PROCESSING_JOBS = OperationModel.new(
        name: "ListMLDataProcessingJobs",
        http_method: "GET",
        request_uri: "/ml/dataprocessing"
      )

      LIST_ML_ENDPOINTS = OperationModel.new(
        name: "ListMLEndpoints",
        http_method: "GET",
        request_uri: "/ml/endpoints"
      )

      LIST_ML_MODEL_TRAINING_JOBS = OperationModel.new(
        name: "ListMLModelTrainingJobs",
        http_method: "GET",
        request_uri: "/ml/modeltraining"
      )

      LIST_ML_MODEL_TRANSFORM_JOBS = OperationModel.new(
        name: "ListMLModelTransformJobs",
        http_method: "GET",
        request_uri: "/ml/modeltransform"
      )

      LIST_OPEN_CYPHER_QUERIES = OperationModel.new(
        name: "ListOpenCypherQueries",
        http_method: "GET",
        request_uri: "/opencypher/status"
      )

      MANAGE_PROPERTYGRAPH_STATISTICS = OperationModel.new(
        name: "ManagePropertygraphStatistics",
        http_method: "POST",
        request_uri: "/propertygraph/statistics"
      )

      MANAGE_SPARQL_STATISTICS = OperationModel.new(
        name: "ManageSparqlStatistics",
        http_method: "POST",
        request_uri: "/sparql/statistics"
      )

      START_LOADER_JOB = OperationModel.new(
        name: "StartLoaderJob",
        http_method: "POST",
        request_uri: "/loader"
      )

      START_ML_DATA_PROCESSING_JOB = OperationModel.new(
        name: "StartMLDataProcessingJob",
        http_method: "POST",
        request_uri: "/ml/dataprocessing"
      )

      START_ML_MODEL_TRAINING_JOB = OperationModel.new(
        name: "StartMLModelTrainingJob",
        http_method: "POST",
        request_uri: "/ml/modeltraining"
      )

      START_ML_MODEL_TRANSFORM_JOB = OperationModel.new(
        name: "StartMLModelTransformJob",
        http_method: "POST",
        request_uri: "/ml/modeltransform"
      )
    end
  end
end
