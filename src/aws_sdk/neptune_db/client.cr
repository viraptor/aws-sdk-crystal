module AwsSdk
  module Neptunedata
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Cancels a Gremlin query. See Gremlin query cancellation for more information. When invoking this
      # operation in a Neptune cluster that has IAM authentication enabled, the IAM user or role making the
      # request must have a policy attached that allows the neptune-db:CancelQuery IAM action in that
      # cluster.
      def cancel_gremlin_query(
        query_id : String
      ) : Protocol::Request
        input = Types::CancelGremlinQueryInput.new(query_id: query_id)
        cancel_gremlin_query(input)
      end
      def cancel_gremlin_query(input : Types::CancelGremlinQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_GREMLIN_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a specified load job. This is an HTTP DELETE request. See Neptune Loader Get-Status API for
      # more information. When invoking this operation in a Neptune cluster that has IAM authentication
      # enabled, the IAM user or role making the request must have a policy attached that allows the
      # neptune-db:CancelLoaderJob IAM action in that cluster..
      def cancel_loader_job(
        load_id : String
      ) : Protocol::Request
        input = Types::CancelLoaderJobInput.new(load_id: load_id)
        cancel_loader_job(input)
      end
      def cancel_loader_job(input : Types::CancelLoaderJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_LOADER_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a Neptune ML data processing job. See The dataprocessing command . When invoking this
      # operation in a Neptune cluster that has IAM authentication enabled, the IAM user or role making the
      # request must have a policy attached that allows the neptune-db:CancelMLDataProcessingJob IAM action
      # in that cluster.
      def cancel_ml_data_processing_job(
        id : String,
        clean : Bool? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CancelMLDataProcessingJobInput.new(id: id, clean: clean, neptune_iam_role_arn: neptune_iam_role_arn)
        cancel_ml_data_processing_job(input)
      end
      def cancel_ml_data_processing_job(input : Types::CancelMLDataProcessingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ML_DATA_PROCESSING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a Neptune ML model training job. See Model training using the modeltraining command . When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the
      # neptune-db:CancelMLModelTrainingJob IAM action in that cluster.
      def cancel_ml_model_training_job(
        id : String,
        clean : Bool? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CancelMLModelTrainingJobInput.new(id: id, clean: clean, neptune_iam_role_arn: neptune_iam_role_arn)
        cancel_ml_model_training_job(input)
      end
      def cancel_ml_model_training_job(input : Types::CancelMLModelTrainingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ML_MODEL_TRAINING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a specified model transform job. See Use a trained model to generate new model artifacts .
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the
      # neptune-db:CancelMLModelTransformJob IAM action in that cluster.
      def cancel_ml_model_transform_job(
        id : String,
        clean : Bool? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CancelMLModelTransformJobInput.new(id: id, clean: clean, neptune_iam_role_arn: neptune_iam_role_arn)
        cancel_ml_model_transform_job(input)
      end
      def cancel_ml_model_transform_job(input : Types::CancelMLModelTransformJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ML_MODEL_TRANSFORM_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a specified openCypher query. See Neptune openCypher status endpoint for more information.
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the neptune-db:CancelQuery IAM
      # action in that cluster.
      def cancel_open_cypher_query(
        query_id : String,
        silent : Bool? = nil
      ) : Protocol::Request
        input = Types::CancelOpenCypherQueryInput.new(query_id: query_id, silent: silent)
        cancel_open_cypher_query(input)
      end
      def cancel_open_cypher_query(input : Types::CancelOpenCypherQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_OPEN_CYPHER_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Neptune ML inference endpoint that lets you query one specific model that the
      # model-training process constructed. See Managing inference endpoints using the endpoints command .
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the neptune-db:CreateMLEndpoint
      # IAM action in that cluster.
      def create_ml_endpoint(
        id : String? = nil,
        instance_count : Int32? = nil,
        instance_type : String? = nil,
        ml_model_training_job_id : String? = nil,
        ml_model_transform_job_id : String? = nil,
        model_name : String? = nil,
        neptune_iam_role_arn : String? = nil,
        update : Bool? = nil,
        volume_encryption_kms_key : String? = nil
      ) : Protocol::Request
        input = Types::CreateMLEndpointInput.new(id: id, instance_count: instance_count, instance_type: instance_type, ml_model_training_job_id: ml_model_training_job_id, ml_model_transform_job_id: ml_model_transform_job_id, model_name: model_name, neptune_iam_role_arn: neptune_iam_role_arn, update: update, volume_encryption_kms_key: volume_encryption_kms_key)
        create_ml_endpoint(input)
      end
      def create_ml_endpoint(input : Types::CreateMLEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ML_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the creation of a Neptune ML inference endpoint. See Managing inference endpoints using the
      # endpoints command . When invoking this operation in a Neptune cluster that has IAM authentication
      # enabled, the IAM user or role making the request must have a policy attached that allows the
      # neptune-db:DeleteMLEndpoint IAM action in that cluster.
      def delete_ml_endpoint(
        id : String,
        clean : Bool? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::DeleteMLEndpointInput.new(id: id, clean: clean, neptune_iam_role_arn: neptune_iam_role_arn)
        delete_ml_endpoint(input)
      end
      def delete_ml_endpoint(input : Types::DeleteMLEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ML_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes statistics for Gremlin and openCypher (property graph) data. When invoking this operation in
      # a Neptune cluster that has IAM authentication enabled, the IAM user or role making the request must
      # have a policy attached that allows the neptune-db:DeleteStatistics IAM action in that cluster.
      def delete_propertygraph_statistics : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROPERTYGRAPH_STATISTICS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes SPARQL statistics When invoking this operation in a Neptune cluster that has IAM
      # authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows the neptune-db:DeleteStatistics IAM action in that cluster.
      def delete_sparql_statistics : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SPARQL_STATISTICS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The fast reset REST API lets you reset a Neptune graph quicky and easily, removing all of its data.
      # Neptune fast reset is a two-step process. First you call ExecuteFastReset with action set to
      # initiateDatabaseReset . This returns a UUID token which you then include when calling
      # ExecuteFastReset again with action set to performDatabaseReset . See Empty an Amazon Neptune DB
      # cluster using the fast reset API . When invoking this operation in a Neptune cluster that has IAM
      # authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows the neptune-db:ResetDatabase IAM action in that cluster.
      def execute_fast_reset(
        action : String,
        token : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteFastResetInput.new(action: action, token: token)
        execute_fast_reset(input)
      end
      def execute_fast_reset(input : Types::ExecuteFastResetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_FAST_RESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes a Gremlin Explain query. Amazon Neptune has added a Gremlin feature named explain that
      # provides is a self-service tool for understanding the execution approach being taken by the Neptune
      # engine for the query. You invoke it by adding an explain parameter to an HTTP call that submits a
      # Gremlin query. The explain feature provides information about the logical structure of query
      # execution plans. You can use this information to identify potential evaluation and execution
      # bottlenecks and to tune your query, as explained in Tuning Gremlin queries . You can also use query
      # hints to improve query execution plans. When invoking this operation in a Neptune cluster that has
      # IAM authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows one of the following IAM actions in that cluster, depending on the query:
      # neptune-db:ReadDataViaQuery neptune-db:WriteDataViaQuery neptune-db:DeleteDataViaQuery Note that the
      # neptune-db:QueryLanguage:Gremlin IAM condition key can be used in the policy document to restrict
      # the use of Gremlin queries (see Condition keys available in Neptune IAM data-access policy
      # statements ).
      def execute_gremlin_explain_query(
        gremlin_query : String
      ) : Protocol::Request
        input = Types::ExecuteGremlinExplainQueryInput.new(gremlin_query: gremlin_query)
        execute_gremlin_explain_query(input)
      end
      def execute_gremlin_explain_query(input : Types::ExecuteGremlinExplainQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_GREMLIN_EXPLAIN_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes a Gremlin Profile query, which runs a specified traversal, collects various metrics about
      # the run, and produces a profile report as output. See Gremlin profile API in Neptune for details.
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the neptune-db:ReadDataViaQuery
      # IAM action in that cluster. Note that the neptune-db:QueryLanguage:Gremlin IAM condition key can be
      # used in the policy document to restrict the use of Gremlin queries (see Condition keys available in
      # Neptune IAM data-access policy statements ).
      def execute_gremlin_profile_query(
        gremlin_query : String,
        chop : Int32? = nil,
        index_ops : Bool? = nil,
        results : Bool? = nil,
        serializer : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteGremlinProfileQueryInput.new(gremlin_query: gremlin_query, chop: chop, index_ops: index_ops, results: results, serializer: serializer)
        execute_gremlin_profile_query(input)
      end
      def execute_gremlin_profile_query(input : Types::ExecuteGremlinProfileQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_GREMLIN_PROFILE_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This commands executes a Gremlin query. Amazon Neptune is compatible with Apache TinkerPop3 and
      # Gremlin, so you can use the Gremlin traversal language to query the graph, as described under The
      # Graph in the Apache TinkerPop3 documentation. More details can also be found in Accessing a Neptune
      # graph with Gremlin . When invoking this operation in a Neptune cluster that has IAM authentication
      # enabled, the IAM user or role making the request must have a policy attached that enables one of the
      # following IAM actions in that cluster, depending on the query: neptune-db:ReadDataViaQuery
      # neptune-db:WriteDataViaQuery neptune-db:DeleteDataViaQuery Note that the
      # neptune-db:QueryLanguage:Gremlin IAM condition key can be used in the policy document to restrict
      # the use of Gremlin queries (see Condition keys available in Neptune IAM data-access policy
      # statements ).
      def execute_gremlin_query(
        gremlin_query : String,
        serializer : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteGremlinQueryInput.new(gremlin_query: gremlin_query, serializer: serializer)
        execute_gremlin_query(input)
      end
      def execute_gremlin_query(input : Types::ExecuteGremlinQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_GREMLIN_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes an openCypher explain request. See The openCypher explain feature for more information.
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the neptune-db:ReadDataViaQuery
      # IAM action in that cluster. Note that the neptune-db:QueryLanguage:OpenCypher IAM condition key can
      # be used in the policy document to restrict the use of openCypher queries (see Condition keys
      # available in Neptune IAM data-access policy statements ).
      def execute_open_cypher_explain_query(
        explain_mode : String,
        open_cypher_query : String,
        parameters : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteOpenCypherExplainQueryInput.new(explain_mode: explain_mode, open_cypher_query: open_cypher_query, parameters: parameters)
        execute_open_cypher_explain_query(input)
      end
      def execute_open_cypher_explain_query(input : Types::ExecuteOpenCypherExplainQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_OPEN_CYPHER_EXPLAIN_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Executes an openCypher query. See Accessing the Neptune Graph with openCypher for more information.
      # Neptune supports building graph applications using openCypher, which is currently one of the most
      # popular query languages among developers working with graph databases. Developers, business
      # analysts, and data scientists like openCypher's declarative, SQL-inspired syntax because it provides
      # a familiar structure in which to querying property graphs. The openCypher language was originally
      # developed by Neo4j, then open-sourced in 2015 and contributed to the openCypher project under an
      # Apache 2 open-source license. Note that when invoking this operation in a Neptune cluster that has
      # IAM authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows one of the following IAM actions in that cluster, depending on the query:
      # neptune-db:ReadDataViaQuery neptune-db:WriteDataViaQuery neptune-db:DeleteDataViaQuery Note also
      # that the neptune-db:QueryLanguage:OpenCypher IAM condition key can be used in the policy document to
      # restrict the use of openCypher queries (see Condition keys available in Neptune IAM data-access
      # policy statements ).
      def execute_open_cypher_query(
        open_cypher_query : String,
        parameters : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteOpenCypherQueryInput.new(open_cypher_query: open_cypher_query, parameters: parameters)
        execute_open_cypher_query(input)
      end
      def execute_open_cypher_query(input : Types::ExecuteOpenCypherQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_OPEN_CYPHER_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of the graph database on the host. When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that allows the neptune-db:GetEngineStatus IAM action in that cluster.
      def get_engine_status : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENGINE_STATUS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of a specified Gremlin query. When invoking this operation in a Neptune cluster that
      # has IAM authentication enabled, the IAM user or role making the request must have a policy attached
      # that allows the neptune-db:GetQueryStatus IAM action in that cluster. Note that the
      # neptune-db:QueryLanguage:Gremlin IAM condition key can be used in the policy document to restrict
      # the use of Gremlin queries (see Condition keys available in Neptune IAM data-access policy
      # statements ).
      def get_gremlin_query_status(
        query_id : String
      ) : Protocol::Request
        input = Types::GetGremlinQueryStatusInput.new(query_id: query_id)
        get_gremlin_query_status(input)
      end
      def get_gremlin_query_status(input : Types::GetGremlinQueryStatusInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GREMLIN_QUERY_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets status information about a specified load job. Neptune keeps track of the most recent 1,024
      # bulk load jobs, and stores the last 10,000 error details per job. See Neptune Loader Get-Status API
      # for more information. When invoking this operation in a Neptune cluster that has IAM authentication
      # enabled, the IAM user or role making the request must have a policy attached that allows the
      # neptune-db:GetLoaderJobStatus IAM action in that cluster..
      def get_loader_job_status(
        load_id : String,
        details : Bool? = nil,
        errors : Bool? = nil,
        errors_per_page : Int32? = nil,
        page : Int32? = nil
      ) : Protocol::Request
        input = Types::GetLoaderJobStatusInput.new(load_id: load_id, details: details, errors: errors, errors_per_page: errors_per_page, page: page)
        get_loader_job_status(input)
      end
      def get_loader_job_status(input : Types::GetLoaderJobStatusInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LOADER_JOB_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specified data processing job. See The dataprocessing command . When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the
      # neptune-db:neptune-db:GetMLDataProcessingJobStatus IAM action in that cluster.
      def get_ml_data_processing_job(
        id : String,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetMLDataProcessingJobInput.new(id: id, neptune_iam_role_arn: neptune_iam_role_arn)
        get_ml_data_processing_job(input)
      end
      def get_ml_data_processing_job(input : Types::GetMLDataProcessingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_DATA_PROCESSING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about an inference endpoint. See Managing inference endpoints using the endpoints
      # command . When invoking this operation in a Neptune cluster that has IAM authentication enabled, the
      # IAM user or role making the request must have a policy attached that allows the
      # neptune-db:GetMLEndpointStatus IAM action in that cluster.
      def get_ml_endpoint(
        id : String,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetMLEndpointInput.new(id: id, neptune_iam_role_arn: neptune_iam_role_arn)
        get_ml_endpoint(input)
      end
      def get_ml_endpoint(input : Types::GetMLEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a Neptune ML model training job. See Model training using the
      # modeltraining command . When invoking this operation in a Neptune cluster that has IAM
      # authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows the neptune-db:GetMLModelTrainingJobStatus IAM action in that cluster.
      def get_ml_model_training_job(
        id : String,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetMLModelTrainingJobInput.new(id: id, neptune_iam_role_arn: neptune_iam_role_arn)
        get_ml_model_training_job(input)
      end
      def get_ml_model_training_job(input : Types::GetMLModelTrainingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_MODEL_TRAINING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified model transform job. See Use a trained model to generate new
      # model artifacts . When invoking this operation in a Neptune cluster that has IAM authentication
      # enabled, the IAM user or role making the request must have a policy attached that allows the
      # neptune-db:GetMLModelTransformJobStatus IAM action in that cluster.
      def get_ml_model_transform_job(
        id : String,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetMLModelTransformJobInput.new(id: id, neptune_iam_role_arn: neptune_iam_role_arn)
        get_ml_model_transform_job(input)
      end
      def get_ml_model_transform_job(input : Types::GetMLModelTransformJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ML_MODEL_TRANSFORM_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of a specified openCypher query. When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that allows the neptune-db:GetQueryStatus IAM action in that cluster. Note that the
      # neptune-db:QueryLanguage:OpenCypher IAM condition key can be used in the policy document to restrict
      # the use of openCypher queries (see Condition keys available in Neptune IAM data-access policy
      # statements ).
      def get_open_cypher_query_status(
        query_id : String
      ) : Protocol::Request
        input = Types::GetOpenCypherQueryStatusInput.new(query_id: query_id)
        get_open_cypher_query_status(input)
      end
      def get_open_cypher_query_status(input : Types::GetOpenCypherQueryStatusInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OPEN_CYPHER_QUERY_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets property graph statistics (Gremlin and openCypher). When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that allows the neptune-db:GetStatisticsStatus IAM action in that cluster.
      def get_propertygraph_statistics : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPERTYGRAPH_STATISTICS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a stream for a property graph. With the Neptune Streams feature, you can generate a complete
      # sequence of change-log entries that record every change made to your graph data as it happens.
      # GetPropertygraphStream lets you collect these change-log entries for a property graph. The Neptune
      # streams feature needs to be enabled on your Neptune DBcluster. To enable streams, set the
      # neptune_streams DB cluster parameter to 1 . See Capturing graph changes in real time using Neptune
      # streams . When invoking this operation in a Neptune cluster that has IAM authentication enabled, the
      # IAM user or role making the request must have a policy attached that allows the
      # neptune-db:GetStreamRecords IAM action in that cluster. When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that enables one of the following IAM actions, depending on the query: Note that you
      # can restrict property-graph queries using the following IAM context keys:
      # neptune-db:QueryLanguage:Gremlin neptune-db:QueryLanguage:OpenCypher See Condition keys available in
      # Neptune IAM data-access policy statements ).
      def get_propertygraph_stream(
        commit_num : Int64? = nil,
        encoding : String? = nil,
        iterator_type : String? = nil,
        limit : Int64? = nil,
        op_num : Int64? = nil
      ) : Protocol::Request
        input = Types::GetPropertygraphStreamInput.new(commit_num: commit_num, encoding: encoding, iterator_type: iterator_type, limit: limit, op_num: op_num)
        get_propertygraph_stream(input)
      end
      def get_propertygraph_stream(input : Types::GetPropertygraphStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPERTYGRAPH_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a graph summary for a property graph. When invoking this operation in a Neptune cluster that
      # has IAM authentication enabled, the IAM user or role making the request must have a policy attached
      # that allows the neptune-db:GetGraphSummary IAM action in that cluster.
      def get_propertygraph_summary(
        mode : String? = nil
      ) : Protocol::Request
        input = Types::GetPropertygraphSummaryInput.new(mode: mode)
        get_propertygraph_summary(input)
      end
      def get_propertygraph_summary(input : Types::GetPropertygraphSummaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPERTYGRAPH_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a graph summary for an RDF graph. When invoking this operation in a Neptune cluster that has
      # IAM authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows the neptune-db:GetGraphSummary IAM action in that cluster.
      def get_rdf_graph_summary(
        mode : String? = nil
      ) : Protocol::Request
        input = Types::GetRDFGraphSummaryInput.new(mode: mode)
        get_rdf_graph_summary(input)
      end
      def get_rdf_graph_summary(input : Types::GetRDFGraphSummaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RDF_GRAPH_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets RDF statistics (SPARQL).
      def get_sparql_statistics : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPARQL_STATISTICS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a stream for an RDF graph. With the Neptune Streams feature, you can generate a complete
      # sequence of change-log entries that record every change made to your graph data as it happens.
      # GetSparqlStream lets you collect these change-log entries for an RDF graph. The Neptune streams
      # feature needs to be enabled on your Neptune DBcluster. To enable streams, set the neptune_streams DB
      # cluster parameter to 1 . See Capturing graph changes in real time using Neptune streams . When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the neptune-db:GetStreamRecords IAM
      # action in that cluster. Note that the neptune-db:QueryLanguage:Sparql IAM condition key can be used
      # in the policy document to restrict the use of SPARQL queries (see Condition keys available in
      # Neptune IAM data-access policy statements ).
      def get_sparql_stream(
        commit_num : Int64? = nil,
        encoding : String? = nil,
        iterator_type : String? = nil,
        limit : Int64? = nil,
        op_num : Int64? = nil
      ) : Protocol::Request
        input = Types::GetSparqlStreamInput.new(commit_num: commit_num, encoding: encoding, iterator_type: iterator_type, limit: limit, op_num: op_num)
        get_sparql_stream(input)
      end
      def get_sparql_stream(input : Types::GetSparqlStreamInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPARQL_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists active Gremlin queries. See Gremlin query status API for details about the output. When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the neptune-db:GetQueryStatus IAM
      # action in that cluster. Note that the neptune-db:QueryLanguage:Gremlin IAM condition key can be used
      # in the policy document to restrict the use of Gremlin queries (see Condition keys available in
      # Neptune IAM data-access policy statements ).
      def list_gremlin_queries(
        include_waiting : Bool? = nil
      ) : Protocol::Request
        input = Types::ListGremlinQueriesInput.new(include_waiting: include_waiting)
        list_gremlin_queries(input)
      end
      def list_gremlin_queries(input : Types::ListGremlinQueriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GREMLIN_QUERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of the loadIds for all active loader jobs. When invoking this operation in a
      # Neptune cluster that has IAM authentication enabled, the IAM user or role making the request must
      # have a policy attached that allows the neptune-db:ListLoaderJobs IAM action in that cluster..
      def list_loader_jobs(
        include_queued_loads : Bool? = nil,
        limit : Int32? = nil
      ) : Protocol::Request
        input = Types::ListLoaderJobsInput.new(include_queued_loads: include_queued_loads, limit: limit)
        list_loader_jobs(input)
      end
      def list_loader_jobs(input : Types::ListLoaderJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LOADER_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Neptune ML data processing jobs. See Listing active data-processing jobs using the
      # Neptune ML dataprocessing command . When invoking this operation in a Neptune cluster that has IAM
      # authentication enabled, the IAM user or role making the request must have a policy attached that
      # allows the neptune-db:ListMLDataProcessingJobs IAM action in that cluster.
      def list_ml_data_processing_jobs(
        max_items : Int32? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListMLDataProcessingJobsInput.new(max_items: max_items, neptune_iam_role_arn: neptune_iam_role_arn)
        list_ml_data_processing_jobs(input)
      end
      def list_ml_data_processing_jobs(input : Types::ListMLDataProcessingJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ML_DATA_PROCESSING_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists existing inference endpoints. See Managing inference endpoints using the endpoints command .
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the neptune-db:ListMLEndpoints
      # IAM action in that cluster.
      def list_ml_endpoints(
        max_items : Int32? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListMLEndpointsInput.new(max_items: max_items, neptune_iam_role_arn: neptune_iam_role_arn)
        list_ml_endpoints(input)
      end
      def list_ml_endpoints(input : Types::ListMLEndpointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ML_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Neptune ML model-training jobs. See Model training using the modeltraining command . When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the
      # neptune-db:neptune-db:ListMLModelTrainingJobs IAM action in that cluster.
      def list_ml_model_training_jobs(
        max_items : Int32? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListMLModelTrainingJobsInput.new(max_items: max_items, neptune_iam_role_arn: neptune_iam_role_arn)
        list_ml_model_training_jobs(input)
      end
      def list_ml_model_training_jobs(input : Types::ListMLModelTrainingJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ML_MODEL_TRAINING_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of model transform job IDs. See Use a trained model to generate new model artifacts .
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the
      # neptune-db:ListMLModelTransformJobs IAM action in that cluster.
      def list_ml_model_transform_jobs(
        max_items : Int32? = nil,
        neptune_iam_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListMLModelTransformJobsInput.new(max_items: max_items, neptune_iam_role_arn: neptune_iam_role_arn)
        list_ml_model_transform_jobs(input)
      end
      def list_ml_model_transform_jobs(input : Types::ListMLModelTransformJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ML_MODEL_TRANSFORM_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists active openCypher queries. See Neptune openCypher status endpoint for more information. When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the neptune-db:GetQueryStatus IAM
      # action in that cluster. Note that the neptune-db:QueryLanguage:OpenCypher IAM condition key can be
      # used in the policy document to restrict the use of openCypher queries (see Condition keys available
      # in Neptune IAM data-access policy statements ).
      def list_open_cypher_queries(
        include_waiting : Bool? = nil
      ) : Protocol::Request
        input = Types::ListOpenCypherQueriesInput.new(include_waiting: include_waiting)
        list_open_cypher_queries(input)
      end
      def list_open_cypher_queries(input : Types::ListOpenCypherQueriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OPEN_CYPHER_QUERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Manages the generation and use of property graph statistics. When invoking this operation in a
      # Neptune cluster that has IAM authentication enabled, the IAM user or role making the request must
      # have a policy attached that allows the neptune-db:ManageStatistics IAM action in that cluster.
      def manage_propertygraph_statistics(
        mode : String? = nil
      ) : Protocol::Request
        input = Types::ManagePropertygraphStatisticsInput.new(mode: mode)
        manage_propertygraph_statistics(input)
      end
      def manage_propertygraph_statistics(input : Types::ManagePropertygraphStatisticsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MANAGE_PROPERTYGRAPH_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Manages the generation and use of RDF graph statistics. When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that allows the neptune-db:ManageStatistics IAM action in that cluster.
      def manage_sparql_statistics(
        mode : String? = nil
      ) : Protocol::Request
        input = Types::ManageSparqlStatisticsInput.new(mode: mode)
        manage_sparql_statistics(input)
      end
      def manage_sparql_statistics(input : Types::ManageSparqlStatisticsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MANAGE_SPARQL_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a Neptune bulk loader job to load data from an Amazon S3 bucket into a Neptune DB instance.
      # See Using the Amazon Neptune Bulk Loader to Ingest Data . When invoking this operation in a Neptune
      # cluster that has IAM authentication enabled, the IAM user or role making the request must have a
      # policy attached that allows the neptune-db:StartLoaderJob IAM action in that cluster.
      def start_loader_job(
        format : String,
        iam_role_arn : String,
        s3_bucket_region : String,
        source : String,
        dependencies : Array(String)? = nil,
        fail_on_error : Bool? = nil,
        mode : String? = nil,
        parallelism : String? = nil,
        parser_configuration : Hash(String, String)? = nil,
        queue_request : Bool? = nil,
        update_single_cardinality_properties : Bool? = nil,
        user_provided_edge_ids : Bool? = nil
      ) : Protocol::Request
        input = Types::StartLoaderJobInput.new(format: format, iam_role_arn: iam_role_arn, s3_bucket_region: s3_bucket_region, source: source, dependencies: dependencies, fail_on_error: fail_on_error, mode: mode, parallelism: parallelism, parser_configuration: parser_configuration, queue_request: queue_request, update_single_cardinality_properties: update_single_cardinality_properties, user_provided_edge_ids: user_provided_edge_ids)
        start_loader_job(input)
      end
      def start_loader_job(input : Types::StartLoaderJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_LOADER_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Neptune ML data processing job for processing the graph data exported from Neptune for
      # training. See The dataprocessing command . When invoking this operation in a Neptune cluster that
      # has IAM authentication enabled, the IAM user or role making the request must have a policy attached
      # that allows the neptune-db:StartMLModelDataProcessingJob IAM action in that cluster.
      def start_ml_data_processing_job(
        input_data_s3_location : String,
        processed_data_s3_location : String,
        config_file_name : String? = nil,
        id : String? = nil,
        model_type : String? = nil,
        neptune_iam_role_arn : String? = nil,
        previous_data_processing_job_id : String? = nil,
        processing_instance_type : String? = nil,
        processing_instance_volume_size_in_gb : Int32? = nil,
        processing_time_out_in_seconds : Int32? = nil,
        s3_output_encryption_kms_key : String? = nil,
        sagemaker_iam_role_arn : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnets : Array(String)? = nil,
        volume_encryption_kms_key : String? = nil
      ) : Protocol::Request
        input = Types::StartMLDataProcessingJobInput.new(input_data_s3_location: input_data_s3_location, processed_data_s3_location: processed_data_s3_location, config_file_name: config_file_name, id: id, model_type: model_type, neptune_iam_role_arn: neptune_iam_role_arn, previous_data_processing_job_id: previous_data_processing_job_id, processing_instance_type: processing_instance_type, processing_instance_volume_size_in_gb: processing_instance_volume_size_in_gb, processing_time_out_in_seconds: processing_time_out_in_seconds, s3_output_encryption_kms_key: s3_output_encryption_kms_key, sagemaker_iam_role_arn: sagemaker_iam_role_arn, security_group_ids: security_group_ids, subnets: subnets, volume_encryption_kms_key: volume_encryption_kms_key)
        start_ml_data_processing_job(input)
      end
      def start_ml_data_processing_job(input : Types::StartMLDataProcessingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ML_DATA_PROCESSING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Neptune ML model training job. See Model training using the modeltraining command .
      # When invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user
      # or role making the request must have a policy attached that allows the
      # neptune-db:StartMLModelTrainingJob IAM action in that cluster.
      def start_ml_model_training_job(
        data_processing_job_id : String,
        train_model_s3_location : String,
        base_processing_instance_type : String? = nil,
        custom_model_training_parameters : Types::CustomModelTrainingParameters? = nil,
        enable_managed_spot_training : Bool? = nil,
        id : String? = nil,
        max_hpo_number_of_training_jobs : Int32? = nil,
        max_hpo_parallel_training_jobs : Int32? = nil,
        neptune_iam_role_arn : String? = nil,
        previous_model_training_job_id : String? = nil,
        s3_output_encryption_kms_key : String? = nil,
        sagemaker_iam_role_arn : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnets : Array(String)? = nil,
        training_instance_type : String? = nil,
        training_instance_volume_size_in_gb : Int32? = nil,
        training_time_out_in_seconds : Int32? = nil,
        volume_encryption_kms_key : String? = nil
      ) : Protocol::Request
        input = Types::StartMLModelTrainingJobInput.new(data_processing_job_id: data_processing_job_id, train_model_s3_location: train_model_s3_location, base_processing_instance_type: base_processing_instance_type, custom_model_training_parameters: custom_model_training_parameters, enable_managed_spot_training: enable_managed_spot_training, id: id, max_hpo_number_of_training_jobs: max_hpo_number_of_training_jobs, max_hpo_parallel_training_jobs: max_hpo_parallel_training_jobs, neptune_iam_role_arn: neptune_iam_role_arn, previous_model_training_job_id: previous_model_training_job_id, s3_output_encryption_kms_key: s3_output_encryption_kms_key, sagemaker_iam_role_arn: sagemaker_iam_role_arn, security_group_ids: security_group_ids, subnets: subnets, training_instance_type: training_instance_type, training_instance_volume_size_in_gb: training_instance_volume_size_in_gb, training_time_out_in_seconds: training_time_out_in_seconds, volume_encryption_kms_key: volume_encryption_kms_key)
        start_ml_model_training_job(input)
      end
      def start_ml_model_training_job(input : Types::StartMLModelTrainingJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ML_MODEL_TRAINING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new model transform job. See Use a trained model to generate new model artifacts . When
      # invoking this operation in a Neptune cluster that has IAM authentication enabled, the IAM user or
      # role making the request must have a policy attached that allows the
      # neptune-db:StartMLModelTransformJob IAM action in that cluster.
      def start_ml_model_transform_job(
        model_transform_output_s3_location : String,
        base_processing_instance_type : String? = nil,
        base_processing_instance_volume_size_in_gb : Int32? = nil,
        custom_model_transform_parameters : Types::CustomModelTransformParameters? = nil,
        data_processing_job_id : String? = nil,
        id : String? = nil,
        ml_model_training_job_id : String? = nil,
        neptune_iam_role_arn : String? = nil,
        s3_output_encryption_kms_key : String? = nil,
        sagemaker_iam_role_arn : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnets : Array(String)? = nil,
        training_job_name : String? = nil,
        volume_encryption_kms_key : String? = nil
      ) : Protocol::Request
        input = Types::StartMLModelTransformJobInput.new(model_transform_output_s3_location: model_transform_output_s3_location, base_processing_instance_type: base_processing_instance_type, base_processing_instance_volume_size_in_gb: base_processing_instance_volume_size_in_gb, custom_model_transform_parameters: custom_model_transform_parameters, data_processing_job_id: data_processing_job_id, id: id, ml_model_training_job_id: ml_model_training_job_id, neptune_iam_role_arn: neptune_iam_role_arn, s3_output_encryption_kms_key: s3_output_encryption_kms_key, sagemaker_iam_role_arn: sagemaker_iam_role_arn, security_group_ids: security_group_ids, subnets: subnets, training_job_name: training_job_name, volume_encryption_kms_key: volume_encryption_kms_key)
        start_ml_model_transform_job(input)
      end
      def start_ml_model_transform_job(input : Types::StartMLModelTransformJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ML_MODEL_TRANSFORM_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
