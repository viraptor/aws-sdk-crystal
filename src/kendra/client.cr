module Aws
  module Kendra
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Grants users or groups in your IAM Identity Center identity source access to your Amazon Kendra
      # experience. You can create an Amazon Kendra experience such as a search application. For more
      # information on creating a search application experience, see Building a search experience with no
      # code .

      def associate_entities_to_experience(
        entity_list : Array(Types::EntityConfiguration),
        id : String,
        index_id : String
      ) : Types::AssociateEntitiesToExperienceResponse

        input = Types::AssociateEntitiesToExperienceRequest.new(entity_list: entity_list, id: id, index_id: index_id)
        associate_entities_to_experience(input)
      end

      def associate_entities_to_experience(input : Types::AssociateEntitiesToExperienceRequest) : Types::AssociateEntitiesToExperienceResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_ENTITIES_TO_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateEntitiesToExperienceResponse, "AssociateEntitiesToExperience")
      end

      # Defines the specific permissions of users or groups in your IAM Identity Center identity source with
      # access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search
      # application. For more information on creating a search application experience, see Building a search
      # experience with no code .

      def associate_personas_to_entities(
        id : String,
        index_id : String,
        personas : Array(Types::EntityPersonaConfiguration)
      ) : Types::AssociatePersonasToEntitiesResponse

        input = Types::AssociatePersonasToEntitiesRequest.new(id: id, index_id: index_id, personas: personas)
        associate_personas_to_entities(input)
      end

      def associate_personas_to_entities(input : Types::AssociatePersonasToEntitiesRequest) : Types::AssociatePersonasToEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_PERSONAS_TO_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociatePersonasToEntitiesResponse, "AssociatePersonasToEntities")
      end

      # Removes one or more documents from an index. The documents must have been added with the
      # BatchPutDocument API. The documents are deleted asynchronously. You can see the progress of the
      # deletion by using Amazon Web Services CloudWatch. Any error messages related to the processing of
      # the batch are sent to your Amazon Web Services CloudWatch log. You can also use the
      # BatchGetDocumentStatus API to monitor the progress of deleting your documents. Deleting documents
      # from an index using BatchDeleteDocument could take up to an hour or more, depending on the number of
      # documents you want to delete.

      def batch_delete_document(
        document_id_list : Array(String),
        index_id : String,
        data_source_sync_job_metric_target : Types::DataSourceSyncJobMetricTarget? = nil
      ) : Types::BatchDeleteDocumentResponse

        input = Types::BatchDeleteDocumentRequest.new(document_id_list: document_id_list, index_id: index_id, data_source_sync_job_metric_target: data_source_sync_job_metric_target)
        batch_delete_document(input)
      end

      def batch_delete_document(input : Types::BatchDeleteDocumentRequest) : Types::BatchDeleteDocumentResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteDocumentResponse, "BatchDeleteDocument")
      end

      # Removes one or more sets of featured results. Features results are placed above all other results
      # for certain queries. If there's an exact match of a query, then one or more specific documents are
      # featured in the search results.

      def batch_delete_featured_results_set(
        featured_results_set_ids : Array(String),
        index_id : String
      ) : Types::BatchDeleteFeaturedResultsSetResponse

        input = Types::BatchDeleteFeaturedResultsSetRequest.new(featured_results_set_ids: featured_results_set_ids, index_id: index_id)
        batch_delete_featured_results_set(input)
      end

      def batch_delete_featured_results_set(input : Types::BatchDeleteFeaturedResultsSetRequest) : Types::BatchDeleteFeaturedResultsSetResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_FEATURED_RESULTS_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteFeaturedResultsSetResponse, "BatchDeleteFeaturedResultsSet")
      end

      # Returns the indexing status for one or more documents submitted with the BatchPutDocument API. When
      # you use the BatchPutDocument API, documents are indexed asynchronously. You can use the
      # BatchGetDocumentStatus API to get the current status of a list of documents so that you can
      # determine if they have been successfully indexed. You can also use the BatchGetDocumentStatus API to
      # check the status of the BatchDeleteDocument API. When a document is deleted from the index, Amazon
      # Kendra returns NOT_FOUND as the status.

      def batch_get_document_status(
        document_info_list : Array(Types::DocumentInfo),
        index_id : String
      ) : Types::BatchGetDocumentStatusResponse

        input = Types::BatchGetDocumentStatusRequest.new(document_info_list: document_info_list, index_id: index_id)
        batch_get_document_status(input)
      end

      def batch_get_document_status(input : Types::BatchGetDocumentStatusRequest) : Types::BatchGetDocumentStatusResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_DOCUMENT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetDocumentStatusResponse, "BatchGetDocumentStatus")
      end

      # Adds one or more documents to an index. The BatchPutDocument API enables you to ingest inline
      # documents or a set of documents stored in an Amazon S3 bucket. Use this API to ingest your text and
      # unstructured text into an index, add custom attributes to the documents, and to attach an access
      # control list to the documents added to the index. The documents are indexed asynchronously. You can
      # see the progress of the batch using Amazon Web Services CloudWatch. Any error messages related to
      # processing the batch are sent to your Amazon Web Services CloudWatch log. You can also use the
      # BatchGetDocumentStatus API to monitor the progress of indexing your documents. For an example of
      # ingesting inline documents using Python and Java SDKs, see Adding files directly to an index .

      def batch_put_document(
        documents : Array(Types::Document),
        index_id : String,
        custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
        role_arn : String? = nil
      ) : Types::BatchPutDocumentResponse

        input = Types::BatchPutDocumentRequest.new(documents: documents, index_id: index_id, custom_document_enrichment_configuration: custom_document_enrichment_configuration, role_arn: role_arn)
        batch_put_document(input)
      end

      def batch_put_document(input : Types::BatchPutDocumentRequest) : Types::BatchPutDocumentResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_PUT_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchPutDocumentResponse, "BatchPutDocument")
      end

      # Clears existing query suggestions from an index. This deletes existing suggestions only, not the
      # queries in the query log. After you clear suggestions, Amazon Kendra learns new suggestions based on
      # new queries added to the query log from the time you cleared suggestions. If you do not see any new
      # suggestions, then please allow Amazon Kendra to collect enough queries to learn new suggestions.
      # ClearQuerySuggestions is currently not supported in the Amazon Web Services GovCloud (US-West)
      # region.

      def clear_query_suggestions(
        index_id : String
      ) : Nil

        input = Types::ClearQuerySuggestionsRequest.new(index_id: index_id)
        clear_query_suggestions(input)
      end

      def clear_query_suggestions(input : Types::ClearQuerySuggestionsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CLEAR_QUERY_SUGGESTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an access configuration for your documents. This includes user and group access information
      # for your documents. This is useful for user context filtering, where search results are filtered
      # based on the user or their group access to documents. You can use this to re-configure your existing
      # document level access control without indexing all of your documents again. For example, your index
      # contains top-secret company documents that only certain employees or users should access. One of
      # these users leaves the company or switches to a team that should be blocked from accessing
      # top-secret documents. The user still has access to top-secret documents because the user had access
      # when your documents were previously indexed. You can create a specific access control configuration
      # for the user with deny access. You can later update the access control configuration to allow access
      # if the user returns to the company and re-joins the 'top-secret' team. You can re-configure access
      # control for your documents as circumstances change. To apply your access control configuration to
      # certain documents, you call the BatchPutDocument API with the AccessControlConfigurationId included
      # in the Document object. If you use an S3 bucket as a data source, you update the .metadata.json with
      # the AccessControlConfigurationId and synchronize your data source. Amazon Kendra currently only
      # supports access control configuration for S3 data sources and documents indexed using the
      # BatchPutDocument API. You can't configure access control using CreateAccessControlConfiguration for
      # an Amazon Kendra Gen AI Enterprise Edition index. Amazon Kendra will return a ValidationException
      # error for a Gen_AI_ENTERPRISE_EDITION index.

      def create_access_control_configuration(
        index_id : String,
        name : String,
        access_control_list : Array(Types::Principal)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil
      ) : Types::CreateAccessControlConfigurationResponse

        input = Types::CreateAccessControlConfigurationRequest.new(index_id: index_id, name: name, access_control_list: access_control_list, client_token: client_token, description: description, hierarchical_access_control_list: hierarchical_access_control_list)
        create_access_control_configuration(input)
      end

      def create_access_control_configuration(input : Types::CreateAccessControlConfigurationRequest) : Types::CreateAccessControlConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCESS_CONTROL_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccessControlConfigurationResponse, "CreateAccessControlConfiguration")
      end

      # Creates a data source connector that you want to use with an Amazon Kendra index. You specify a
      # name, data source connector type and description for your data source. You also specify
      # configuration information for the data source connector. CreateDataSource is a synchronous
      # operation. The operation returns 200 if the data source was successfully created. Otherwise, an
      # exception is raised. For an example of creating an index and data source using the Python SDK, see
      # Getting started with Python SDK . For an example of creating an index and data source using the Java
      # SDK, see Getting started with Java SDK .

      def create_data_source(
        index_id : String,
        name : String,
        type : String,
        client_token : String? = nil,
        configuration : Types::DataSourceConfiguration? = nil,
        custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
        description : String? = nil,
        language_code : String? = nil,
        role_arn : String? = nil,
        schedule : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_configuration : Types::DataSourceVpcConfiguration? = nil
      ) : Types::CreateDataSourceResponse

        input = Types::CreateDataSourceRequest.new(index_id: index_id, name: name, type: type, client_token: client_token, configuration: configuration, custom_document_enrichment_configuration: custom_document_enrichment_configuration, description: description, language_code: language_code, role_arn: role_arn, schedule: schedule, tags: tags, vpc_configuration: vpc_configuration)
        create_data_source(input)
      end

      def create_data_source(input : Types::CreateDataSourceRequest) : Types::CreateDataSourceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataSourceResponse, "CreateDataSource")
      end

      # Creates an Amazon Kendra experience such as a search application. For more information on creating a
      # search application experience, including using the Python and Java SDKs, see Building a search
      # experience with no code .

      def create_experience(
        index_id : String,
        name : String,
        client_token : String? = nil,
        configuration : Types::ExperienceConfiguration? = nil,
        description : String? = nil,
        role_arn : String? = nil
      ) : Types::CreateExperienceResponse

        input = Types::CreateExperienceRequest.new(index_id: index_id, name: name, client_token: client_token, configuration: configuration, description: description, role_arn: role_arn)
        create_experience(input)
      end

      def create_experience(input : Types::CreateExperienceRequest) : Types::CreateExperienceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExperienceResponse, "CreateExperience")
      end

      # Creates a set of frequently ask questions (FAQs) using a specified FAQ file stored in an Amazon S3
      # bucket. Adding FAQs to an index is an asynchronous operation. For an example of adding an FAQ to an
      # index using Python and Java SDKs, see Using your FAQ file .

      def create_faq(
        index_id : String,
        name : String,
        role_arn : String,
        s3_path : Types::S3Path,
        client_token : String? = nil,
        description : String? = nil,
        file_format : String? = nil,
        language_code : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFaqResponse

        input = Types::CreateFaqRequest.new(index_id: index_id, name: name, role_arn: role_arn, s3_path: s3_path, client_token: client_token, description: description, file_format: file_format, language_code: language_code, tags: tags)
        create_faq(input)
      end

      def create_faq(input : Types::CreateFaqRequest) : Types::CreateFaqResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FAQ, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFaqResponse, "CreateFaq")
      end

      # Creates a set of featured results to display at the top of the search results page. Featured results
      # are placed above all other results for certain queries. You map specific queries to specific
      # documents for featuring in the results. If a query contains an exact match, then one or more
      # specific documents are featured in the search results. You can create up to 50 sets of featured
      # results per index. You can request to increase this limit by contacting Support .

      def create_featured_results_set(
        featured_results_set_name : String,
        index_id : String,
        client_token : String? = nil,
        description : String? = nil,
        featured_documents : Array(Types::FeaturedDocument)? = nil,
        query_texts : Array(String)? = nil,
        status : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFeaturedResultsSetResponse

        input = Types::CreateFeaturedResultsSetRequest.new(featured_results_set_name: featured_results_set_name, index_id: index_id, client_token: client_token, description: description, featured_documents: featured_documents, query_texts: query_texts, status: status, tags: tags)
        create_featured_results_set(input)
      end

      def create_featured_results_set(input : Types::CreateFeaturedResultsSetRequest) : Types::CreateFeaturedResultsSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FEATURED_RESULTS_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFeaturedResultsSetResponse, "CreateFeaturedResultsSet")
      end

      # Creates an Amazon Kendra index. Index creation is an asynchronous API. To determine if index
      # creation has completed, check the Status field returned from a call to DescribeIndex . The Status
      # field is set to ACTIVE when the index is ready to use. Once the index is active, you can index your
      # documents using the BatchPutDocument API or using one of the supported data sources . For an example
      # of creating an index and data source using the Python SDK, see Getting started with Python SDK . For
      # an example of creating an index and data source using the Java SDK, see Getting started with Java
      # SDK .

      def create_index(
        name : String,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        edition : String? = nil,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        user_context_policy : String? = nil,
        user_group_resolution_configuration : Types::UserGroupResolutionConfiguration? = nil,
        user_token_configurations : Array(Types::UserTokenConfiguration)? = nil
      ) : Types::CreateIndexResponse

        input = Types::CreateIndexRequest.new(name: name, role_arn: role_arn, client_token: client_token, description: description, edition: edition, server_side_encryption_configuration: server_side_encryption_configuration, tags: tags, user_context_policy: user_context_policy, user_group_resolution_configuration: user_group_resolution_configuration, user_token_configurations: user_token_configurations)
        create_index(input)
      end

      def create_index(input : Types::CreateIndexRequest) : Types::CreateIndexResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIndexResponse, "CreateIndex")
      end

      # Creates a block list to exlcude certain queries from suggestions. Any query that contains words or
      # phrases specified in the block list is blocked or filtered out from being shown as a suggestion. You
      # need to provide the file location of your block list text file in your S3 bucket. In your text file,
      # enter each block word or phrase on a separate line. For information on the current quota limits for
      # block lists, see Quotas for Amazon Kendra . CreateQuerySuggestionsBlockList is currently not
      # supported in the Amazon Web Services GovCloud (US-West) region. For an example of creating a block
      # list for query suggestions using the Python SDK, see Query suggestions block list .

      def create_query_suggestions_block_list(
        index_id : String,
        name : String,
        role_arn : String,
        source_s3_path : Types::S3Path,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateQuerySuggestionsBlockListResponse

        input = Types::CreateQuerySuggestionsBlockListRequest.new(index_id: index_id, name: name, role_arn: role_arn, source_s3_path: source_s3_path, client_token: client_token, description: description, tags: tags)
        create_query_suggestions_block_list(input)
      end

      def create_query_suggestions_block_list(input : Types::CreateQuerySuggestionsBlockListRequest) : Types::CreateQuerySuggestionsBlockListResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_QUERY_SUGGESTIONS_BLOCK_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateQuerySuggestionsBlockListResponse, "CreateQuerySuggestionsBlockList")
      end

      # Creates a thesaurus for an index. The thesaurus contains a list of synonyms in Solr format. For an
      # example of adding a thesaurus file to an index, see Adding custom synonyms to an index .

      def create_thesaurus(
        index_id : String,
        name : String,
        role_arn : String,
        source_s3_path : Types::S3Path,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateThesaurusResponse

        input = Types::CreateThesaurusRequest.new(index_id: index_id, name: name, role_arn: role_arn, source_s3_path: source_s3_path, client_token: client_token, description: description, tags: tags)
        create_thesaurus(input)
      end

      def create_thesaurus(input : Types::CreateThesaurusRequest) : Types::CreateThesaurusResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_THESAURUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateThesaurusResponse, "CreateThesaurus")
      end

      # Deletes an access control configuration that you created for your documents in an index. This
      # includes user and group access information for your documents. This is useful for user context
      # filtering, where search results are filtered based on the user or their group access to documents.

      def delete_access_control_configuration(
        id : String,
        index_id : String
      ) : Types::DeleteAccessControlConfigurationResponse

        input = Types::DeleteAccessControlConfigurationRequest.new(id: id, index_id: index_id)
        delete_access_control_configuration(input)
      end

      def delete_access_control_configuration(input : Types::DeleteAccessControlConfigurationRequest) : Types::DeleteAccessControlConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCESS_CONTROL_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccessControlConfigurationResponse, "DeleteAccessControlConfiguration")
      end

      # Deletes an Amazon Kendra data source connector. An exception is not thrown if the data source is
      # already being deleted. While the data source is being deleted, the Status field returned by a call
      # to the DescribeDataSource API is set to DELETING . For more information, see Deleting Data Sources .
      # Deleting an entire data source or re-syncing your index after deleting specific documents from a
      # data source could take up to an hour or more, depending on the number of documents you want to
      # delete.

      def delete_data_source(
        id : String,
        index_id : String
      ) : Nil

        input = Types::DeleteDataSourceRequest.new(id: id, index_id: index_id)
        delete_data_source(input)
      end

      def delete_data_source(input : Types::DeleteDataSourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes your Amazon Kendra experience such as a search application. For more information on creating
      # a search application experience, see Building a search experience with no code .

      def delete_experience(
        id : String,
        index_id : String
      ) : Types::DeleteExperienceResponse

        input = Types::DeleteExperienceRequest.new(id: id, index_id: index_id)
        delete_experience(input)
      end

      def delete_experience(input : Types::DeleteExperienceRequest) : Types::DeleteExperienceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteExperienceResponse, "DeleteExperience")
      end

      # Removes a FAQ from an index.

      def delete_faq(
        id : String,
        index_id : String
      ) : Nil

        input = Types::DeleteFaqRequest.new(id: id, index_id: index_id)
        delete_faq(input)
      end

      def delete_faq(input : Types::DeleteFaqRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FAQ, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon Kendra index. An exception is not thrown if the index is already being deleted.
      # While the index is being deleted, the Status field returned by a call to the DescribeIndex API is
      # set to DELETING .

      def delete_index(
        id : String
      ) : Nil

        input = Types::DeleteIndexRequest.new(id: id)
        delete_index(input)
      end

      def delete_index(input : Types::DeleteIndexRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a group so that all users that belong to the group can no longer access documents only
      # available to that group. For example, after deleting the group "Summer Interns", all interns who
      # belonged to that group no longer see intern-only documents in their search results. If you want to
      # delete or replace users or sub groups of a group, you need to use the PutPrincipalMapping operation.
      # For example, if a user in the group "Engineering" leaves the engineering team and another user takes
      # their place, you provide an updated list of users or sub groups that belong to the "Engineering"
      # group when calling PutPrincipalMapping . You can update your internal list of users or sub groups
      # and input this list when calling PutPrincipalMapping . DeletePrincipalMapping is currently not
      # supported in the Amazon Web Services GovCloud (US-West) region.

      def delete_principal_mapping(
        group_id : String,
        index_id : String,
        data_source_id : String? = nil,
        ordering_id : Int64? = nil
      ) : Nil

        input = Types::DeletePrincipalMappingRequest.new(group_id: group_id, index_id: index_id, data_source_id: data_source_id, ordering_id: ordering_id)
        delete_principal_mapping(input)
      end

      def delete_principal_mapping(input : Types::DeletePrincipalMappingRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PRINCIPAL_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a block list used for query suggestions for an index. A deleted block list might not take
      # effect right away. Amazon Kendra needs to refresh the entire suggestions list to add back the
      # queries that were previously blocked. DeleteQuerySuggestionsBlockList is currently not supported in
      # the Amazon Web Services GovCloud (US-West) region.

      def delete_query_suggestions_block_list(
        id : String,
        index_id : String
      ) : Nil

        input = Types::DeleteQuerySuggestionsBlockListRequest.new(id: id, index_id: index_id)
        delete_query_suggestions_block_list(input)
      end

      def delete_query_suggestions_block_list(input : Types::DeleteQuerySuggestionsBlockListRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_QUERY_SUGGESTIONS_BLOCK_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon Kendra thesaurus.

      def delete_thesaurus(
        id : String,
        index_id : String
      ) : Nil

        input = Types::DeleteThesaurusRequest.new(id: id, index_id: index_id)
        delete_thesaurus(input)
      end

      def delete_thesaurus(input : Types::DeleteThesaurusRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_THESAURUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Gets information about an access control configuration that you created for your documents in an
      # index. This includes user and group access information for your documents. This is useful for user
      # context filtering, where search results are filtered based on the user or their group access to
      # documents.

      def describe_access_control_configuration(
        id : String,
        index_id : String
      ) : Types::DescribeAccessControlConfigurationResponse

        input = Types::DescribeAccessControlConfigurationRequest.new(id: id, index_id: index_id)
        describe_access_control_configuration(input)
      end

      def describe_access_control_configuration(input : Types::DescribeAccessControlConfigurationRequest) : Types::DescribeAccessControlConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCESS_CONTROL_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccessControlConfigurationResponse, "DescribeAccessControlConfiguration")
      end

      # Gets information about an Amazon Kendra data source connector.

      def describe_data_source(
        id : String,
        index_id : String
      ) : Types::DescribeDataSourceResponse

        input = Types::DescribeDataSourceRequest.new(id: id, index_id: index_id)
        describe_data_source(input)
      end

      def describe_data_source(input : Types::DescribeDataSourceRequest) : Types::DescribeDataSourceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataSourceResponse, "DescribeDataSource")
      end

      # Gets information about your Amazon Kendra experience such as a search application. For more
      # information on creating a search application experience, see Building a search experience with no
      # code .

      def describe_experience(
        id : String,
        index_id : String
      ) : Types::DescribeExperienceResponse

        input = Types::DescribeExperienceRequest.new(id: id, index_id: index_id)
        describe_experience(input)
      end

      def describe_experience(input : Types::DescribeExperienceRequest) : Types::DescribeExperienceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExperienceResponse, "DescribeExperience")
      end

      # Gets information about a FAQ.

      def describe_faq(
        id : String,
        index_id : String
      ) : Types::DescribeFaqResponse

        input = Types::DescribeFaqRequest.new(id: id, index_id: index_id)
        describe_faq(input)
      end

      def describe_faq(input : Types::DescribeFaqRequest) : Types::DescribeFaqResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FAQ, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFaqResponse, "DescribeFaq")
      end

      # Gets information about a set of featured results. Features results are placed above all other
      # results for certain queries. If there's an exact match of a query, then one or more specific
      # documents are featured in the search results.

      def describe_featured_results_set(
        featured_results_set_id : String,
        index_id : String
      ) : Types::DescribeFeaturedResultsSetResponse

        input = Types::DescribeFeaturedResultsSetRequest.new(featured_results_set_id: featured_results_set_id, index_id: index_id)
        describe_featured_results_set(input)
      end

      def describe_featured_results_set(input : Types::DescribeFeaturedResultsSetRequest) : Types::DescribeFeaturedResultsSetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FEATURED_RESULTS_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFeaturedResultsSetResponse, "DescribeFeaturedResultsSet")
      end

      # Gets information about an Amazon Kendra index.

      def describe_index(
        id : String
      ) : Types::DescribeIndexResponse

        input = Types::DescribeIndexRequest.new(id: id)
        describe_index(input)
      end

      def describe_index(input : Types::DescribeIndexRequest) : Types::DescribeIndexResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeIndexResponse, "DescribeIndex")
      end

      # Describes the processing of PUT and DELETE actions for mapping users to their groups. This includes
      # information on the status of actions currently processing or yet to be processed, when actions were
      # last updated, when actions were received by Amazon Kendra, the latest action that should process and
      # apply after other actions, and useful error messages if an action could not be processed.
      # DescribePrincipalMapping is currently not supported in the Amazon Web Services GovCloud (US-West)
      # region.

      def describe_principal_mapping(
        group_id : String,
        index_id : String,
        data_source_id : String? = nil
      ) : Types::DescribePrincipalMappingResponse

        input = Types::DescribePrincipalMappingRequest.new(group_id: group_id, index_id: index_id, data_source_id: data_source_id)
        describe_principal_mapping(input)
      end

      def describe_principal_mapping(input : Types::DescribePrincipalMappingRequest) : Types::DescribePrincipalMappingResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PRINCIPAL_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePrincipalMappingResponse, "DescribePrincipalMapping")
      end

      # Gets information about a block list used for query suggestions for an index. This is used to check
      # the current settings that are applied to a block list. DescribeQuerySuggestionsBlockList is
      # currently not supported in the Amazon Web Services GovCloud (US-West) region.

      def describe_query_suggestions_block_list(
        id : String,
        index_id : String
      ) : Types::DescribeQuerySuggestionsBlockListResponse

        input = Types::DescribeQuerySuggestionsBlockListRequest.new(id: id, index_id: index_id)
        describe_query_suggestions_block_list(input)
      end

      def describe_query_suggestions_block_list(input : Types::DescribeQuerySuggestionsBlockListRequest) : Types::DescribeQuerySuggestionsBlockListResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_QUERY_SUGGESTIONS_BLOCK_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeQuerySuggestionsBlockListResponse, "DescribeQuerySuggestionsBlockList")
      end

      # Gets information on the settings of query suggestions for an index. This is used to check the
      # current settings applied to query suggestions. DescribeQuerySuggestionsConfig is currently not
      # supported in the Amazon Web Services GovCloud (US-West) region.

      def describe_query_suggestions_config(
        index_id : String
      ) : Types::DescribeQuerySuggestionsConfigResponse

        input = Types::DescribeQuerySuggestionsConfigRequest.new(index_id: index_id)
        describe_query_suggestions_config(input)
      end

      def describe_query_suggestions_config(input : Types::DescribeQuerySuggestionsConfigRequest) : Types::DescribeQuerySuggestionsConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_QUERY_SUGGESTIONS_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeQuerySuggestionsConfigResponse, "DescribeQuerySuggestionsConfig")
      end

      # Gets information about an Amazon Kendra thesaurus.

      def describe_thesaurus(
        id : String,
        index_id : String
      ) : Types::DescribeThesaurusResponse

        input = Types::DescribeThesaurusRequest.new(id: id, index_id: index_id)
        describe_thesaurus(input)
      end

      def describe_thesaurus(input : Types::DescribeThesaurusRequest) : Types::DescribeThesaurusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_THESAURUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeThesaurusResponse, "DescribeThesaurus")
      end

      # Prevents users or groups in your IAM Identity Center identity source from accessing your Amazon
      # Kendra experience. You can create an Amazon Kendra experience such as a search application. For more
      # information on creating a search application experience, see Building a search experience with no
      # code .

      def disassociate_entities_from_experience(
        entity_list : Array(Types::EntityConfiguration),
        id : String,
        index_id : String
      ) : Types::DisassociateEntitiesFromExperienceResponse

        input = Types::DisassociateEntitiesFromExperienceRequest.new(entity_list: entity_list, id: id, index_id: index_id)
        disassociate_entities_from_experience(input)
      end

      def disassociate_entities_from_experience(input : Types::DisassociateEntitiesFromExperienceRequest) : Types::DisassociateEntitiesFromExperienceResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_ENTITIES_FROM_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateEntitiesFromExperienceResponse, "DisassociateEntitiesFromExperience")
      end

      # Removes the specific permissions of users or groups in your IAM Identity Center identity source with
      # access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search
      # application. For more information on creating a search application experience, see Building a search
      # experience with no code .

      def disassociate_personas_from_entities(
        entity_ids : Array(String),
        id : String,
        index_id : String
      ) : Types::DisassociatePersonasFromEntitiesResponse

        input = Types::DisassociatePersonasFromEntitiesRequest.new(entity_ids: entity_ids, id: id, index_id: index_id)
        disassociate_personas_from_entities(input)
      end

      def disassociate_personas_from_entities(input : Types::DisassociatePersonasFromEntitiesRequest) : Types::DisassociatePersonasFromEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_PERSONAS_FROM_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociatePersonasFromEntitiesResponse, "DisassociatePersonasFromEntities")
      end

      # Fetches the queries that are suggested to your users. GetQuerySuggestions is currently not supported
      # in the Amazon Web Services GovCloud (US-West) region.

      def get_query_suggestions(
        index_id : String,
        query_text : String,
        attribute_suggestions_config : Types::AttributeSuggestionsGetConfig? = nil,
        max_suggestions_count : Int32? = nil,
        suggestion_types : Array(String)? = nil
      ) : Types::GetQuerySuggestionsResponse

        input = Types::GetQuerySuggestionsRequest.new(index_id: index_id, query_text: query_text, attribute_suggestions_config: attribute_suggestions_config, max_suggestions_count: max_suggestions_count, suggestion_types: suggestion_types)
        get_query_suggestions(input)
      end

      def get_query_suggestions(input : Types::GetQuerySuggestionsRequest) : Types::GetQuerySuggestionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUERY_SUGGESTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQuerySuggestionsResponse, "GetQuerySuggestions")
      end

      # Retrieves search metrics data. The data provides a snapshot of how your users interact with your
      # search application and how effective the application is.

      def get_snapshots(
        index_id : String,
        interval : String,
        metric_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetSnapshotsResponse

        input = Types::GetSnapshotsRequest.new(index_id: index_id, interval: interval, metric_type: metric_type, max_results: max_results, next_token: next_token)
        get_snapshots(input)
      end

      def get_snapshots(input : Types::GetSnapshotsRequest) : Types::GetSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSnapshotsResponse, "GetSnapshots")
      end

      # Lists one or more access control configurations for an index. This includes user and group access
      # information for your documents. This is useful for user context filtering, where search results are
      # filtered based on the user or their group access to documents.

      def list_access_control_configurations(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAccessControlConfigurationsResponse

        input = Types::ListAccessControlConfigurationsRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_access_control_configurations(input)
      end

      def list_access_control_configurations(input : Types::ListAccessControlConfigurationsRequest) : Types::ListAccessControlConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCESS_CONTROL_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccessControlConfigurationsResponse, "ListAccessControlConfigurations")
      end

      # Gets statistics about synchronizing a data source connector.

      def list_data_source_sync_jobs(
        id : String,
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time_filter : Types::TimeRange? = nil,
        status_filter : String? = nil
      ) : Types::ListDataSourceSyncJobsResponse

        input = Types::ListDataSourceSyncJobsRequest.new(id: id, index_id: index_id, max_results: max_results, next_token: next_token, start_time_filter: start_time_filter, status_filter: status_filter)
        list_data_source_sync_jobs(input)
      end

      def list_data_source_sync_jobs(input : Types::ListDataSourceSyncJobsRequest) : Types::ListDataSourceSyncJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_SOURCE_SYNC_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataSourceSyncJobsResponse, "ListDataSourceSyncJobs")
      end

      # Lists the data source connectors that you have created.

      def list_data_sources(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDataSourcesResponse

        input = Types::ListDataSourcesRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_data_sources(input)
      end

      def list_data_sources(input : Types::ListDataSourcesRequest) : Types::ListDataSourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataSourcesResponse, "ListDataSources")
      end

      # Lists specific permissions of users and groups with access to your Amazon Kendra experience.

      def list_entity_personas(
        id : String,
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEntityPersonasResponse

        input = Types::ListEntityPersonasRequest.new(id: id, index_id: index_id, max_results: max_results, next_token: next_token)
        list_entity_personas(input)
      end

      def list_entity_personas(input : Types::ListEntityPersonasRequest) : Types::ListEntityPersonasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENTITY_PERSONAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEntityPersonasResponse, "ListEntityPersonas")
      end

      # Lists users or groups in your IAM Identity Center identity source that are granted access to your
      # Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application.
      # For more information on creating a search application experience, see Building a search experience
      # with no code .

      def list_experience_entities(
        id : String,
        index_id : String,
        next_token : String? = nil
      ) : Types::ListExperienceEntitiesResponse

        input = Types::ListExperienceEntitiesRequest.new(id: id, index_id: index_id, next_token: next_token)
        list_experience_entities(input)
      end

      def list_experience_entities(input : Types::ListExperienceEntitiesRequest) : Types::ListExperienceEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPERIENCE_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExperienceEntitiesResponse, "ListExperienceEntities")
      end

      # Lists one or more Amazon Kendra experiences. You can create an Amazon Kendra experience such as a
      # search application. For more information on creating a search application experience, see Building a
      # search experience with no code .

      def list_experiences(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListExperiencesResponse

        input = Types::ListExperiencesRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_experiences(input)
      end

      def list_experiences(input : Types::ListExperiencesRequest) : Types::ListExperiencesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPERIENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExperiencesResponse, "ListExperiences")
      end

      # Gets a list of FAQs associated with an index.

      def list_faqs(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFaqsResponse

        input = Types::ListFaqsRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_faqs(input)
      end

      def list_faqs(input : Types::ListFaqsRequest) : Types::ListFaqsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FAQS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFaqsResponse, "ListFaqs")
      end

      # Lists all your sets of featured results for a given index. Features results are placed above all
      # other results for certain queries. If there's an exact match of a query, then one or more specific
      # documents are featured in the search results.

      def list_featured_results_sets(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFeaturedResultsSetsResponse

        input = Types::ListFeaturedResultsSetsRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_featured_results_sets(input)
      end

      def list_featured_results_sets(input : Types::ListFeaturedResultsSetsRequest) : Types::ListFeaturedResultsSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FEATURED_RESULTS_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFeaturedResultsSetsResponse, "ListFeaturedResultsSets")
      end

      # Provides a list of groups that are mapped to users before a given ordering or timestamp identifier.
      # ListGroupsOlderThanOrderingId is currently not supported in the Amazon Web Services GovCloud
      # (US-West) region.

      def list_groups_older_than_ordering_id(
        index_id : String,
        ordering_id : Int64,
        data_source_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListGroupsOlderThanOrderingIdResponse

        input = Types::ListGroupsOlderThanOrderingIdRequest.new(index_id: index_id, ordering_id: ordering_id, data_source_id: data_source_id, max_results: max_results, next_token: next_token)
        list_groups_older_than_ordering_id(input)
      end

      def list_groups_older_than_ordering_id(input : Types::ListGroupsOlderThanOrderingIdRequest) : Types::ListGroupsOlderThanOrderingIdResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GROUPS_OLDER_THAN_ORDERING_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGroupsOlderThanOrderingIdResponse, "ListGroupsOlderThanOrderingId")
      end

      # Lists the Amazon Kendra indexes that you created.

      def list_indices(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListIndicesResponse

        input = Types::ListIndicesRequest.new(max_results: max_results, next_token: next_token)
        list_indices(input)
      end

      def list_indices(input : Types::ListIndicesRequest) : Types::ListIndicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INDICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIndicesResponse, "ListIndices")
      end

      # Lists the block lists used for query suggestions for an index. For information on the current quota
      # limits for block lists, see Quotas for Amazon Kendra . ListQuerySuggestionsBlockLists is currently
      # not supported in the Amazon Web Services GovCloud (US-West) region.

      def list_query_suggestions_block_lists(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListQuerySuggestionsBlockListsResponse

        input = Types::ListQuerySuggestionsBlockListsRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_query_suggestions_block_lists(input)
      end

      def list_query_suggestions_block_lists(input : Types::ListQuerySuggestionsBlockListsRequest) : Types::ListQuerySuggestionsBlockListsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_QUERY_SUGGESTIONS_BLOCK_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQuerySuggestionsBlockListsResponse, "ListQuerySuggestionsBlockLists")
      end

      # Gets a list of tags associated with a resource. Indexes, FAQs, data sources, and other resources can
      # have tags associated with them.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists the thesauri for an index.

      def list_thesauri(
        index_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListThesauriResponse

        input = Types::ListThesauriRequest.new(index_id: index_id, max_results: max_results, next_token: next_token)
        list_thesauri(input)
      end

      def list_thesauri(input : Types::ListThesauriRequest) : Types::ListThesauriResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_THESAURI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListThesauriResponse, "ListThesauri")
      end

      # Maps users to their groups so that you only need to provide the user ID when you issue the query.
      # You can also map sub groups to groups. For example, the group "Company Intellectual Property Teams"
      # includes sub groups "Research" and "Engineering". These sub groups include their own list of users
      # or people who work in these teams. Only users who work in research and engineering, and therefore
      # belong in the intellectual property group, can see top-secret company documents in their search
      # results. This is useful for user context filtering, where search results are filtered based on the
      # user or their group access to documents. For more information, see Filtering on user context . If
      # more than five PUT actions for a group are currently processing, a validation exception is thrown.

      def put_principal_mapping(
        group_id : String,
        group_members : Types::GroupMembers,
        index_id : String,
        data_source_id : String? = nil,
        ordering_id : Int64? = nil,
        role_arn : String? = nil
      ) : Nil

        input = Types::PutPrincipalMappingRequest.new(group_id: group_id, group_members: group_members, index_id: index_id, data_source_id: data_source_id, ordering_id: ordering_id, role_arn: role_arn)
        put_principal_mapping(input)
      end

      def put_principal_mapping(input : Types::PutPrincipalMappingRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_PRINCIPAL_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Searches an index given an input query. If you are working with large language models (LLMs) or
      # implementing retrieval augmented generation (RAG) systems, you can use Amazon Kendra's Retrieve API,
      # which can return longer semantically relevant passages. We recommend using the Retrieve API instead
      # of filing a service limit increase to increase the Query API document excerpt length. You can
      # configure boosting or relevance tuning at the query level to override boosting at the index level,
      # filter based on document fields/attributes and faceted search, and filter based on the user or their
      # group access to documents. You can also include certain fields in the response that might provide
      # useful additional information. A query response contains three types of results. Relevant suggested
      # answers. The answers can be either a text excerpt or table excerpt. The answer can be highlighted in
      # the excerpt. Matching FAQs or questions-answer from your FAQ file. Relevant documents. This result
      # type includes an excerpt of the document with the document title. The searched terms can be
      # highlighted in the excerpt. You can specify that the query return only one type of result using the
      # QueryResultTypeFilter parameter. Each query returns the 100 most relevant results. If you filter
      # result type to only question-answers, a maximum of four results are returned. If you filter result
      # type to only answers, a maximum of three results are returned. If you're using an Amazon Kendra Gen
      # AI Enterprise Edition index, you can only use ATTRIBUTE_FILTER to filter search results by user
      # context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use
      # USER_TOKEN to configure user context policy, Amazon Kendra returns a ValidationException error.

      def query(
        index_id : String,
        attribute_filter : Types::AttributeFilter? = nil,
        collapse_configuration : Types::CollapseConfiguration? = nil,
        document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)? = nil,
        facets : Array(Types::Facet)? = nil,
        page_number : Int32? = nil,
        page_size : Int32? = nil,
        query_result_type_filter : String? = nil,
        query_text : String? = nil,
        requested_document_attributes : Array(String)? = nil,
        sorting_configuration : Types::SortingConfiguration? = nil,
        sorting_configurations : Array(Types::SortingConfiguration)? = nil,
        spell_correction_configuration : Types::SpellCorrectionConfiguration? = nil,
        user_context : Types::UserContext? = nil,
        visitor_id : String? = nil
      ) : Types::QueryResult

        input = Types::QueryRequest.new(index_id: index_id, attribute_filter: attribute_filter, collapse_configuration: collapse_configuration, document_relevance_override_configurations: document_relevance_override_configurations, facets: facets, page_number: page_number, page_size: page_size, query_result_type_filter: query_result_type_filter, query_text: query_text, requested_document_attributes: requested_document_attributes, sorting_configuration: sorting_configuration, sorting_configurations: sorting_configurations, spell_correction_configuration: spell_correction_configuration, user_context: user_context, visitor_id: visitor_id)
        query(input)
      end

      def query(input : Types::QueryRequest) : Types::QueryResult
        request = Protocol::JsonRpc.build_request(Model::QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::QueryResult, "Query")
      end

      # Retrieves relevant passages or text excerpts given an input query. This API is similar to the Query
      # API. However, by default, the Query API only returns excerpt passages of up to 100 token words. With
      # the Retrieve API, you can retrieve longer passages of up to 200 token words and up to 100
      # semantically relevant passages. This doesn't include question-answer or FAQ type responses from your
      # index. The passages are text excerpts that can be semantically extracted from multiple documents and
      # multiple parts of the same document. If in extreme cases your documents produce zero passages using
      # the Retrieve API, you can alternatively use the Query API and its types of responses. You can also
      # do the following: Override boosting at the index level Filter based on document fields or attributes
      # Filter based on the user or their group access to documents View the confidence score bucket for a
      # retrieved passage result. The confidence bucket provides a relative ranking that indicates how
      # confident Amazon Kendra is that the response is relevant to the query. Confidence score buckets are
      # currently available only for English. You can also include certain fields in the response that might
      # provide useful additional information. The Retrieve API shares the number of query capacity units
      # that you set for your index. For more information on what's included in a single capacity unit and
      # the default base capacity for an index, see Adjusting capacity . If you're using an Amazon Kendra
      # Gen AI Enterprise Edition index, you can only use ATTRIBUTE_FILTER to filter search results by user
      # context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use
      # USER_TOKEN to configure user context policy, Amazon Kendra returns a ValidationException error.

      def retrieve(
        index_id : String,
        query_text : String,
        attribute_filter : Types::AttributeFilter? = nil,
        document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)? = nil,
        page_number : Int32? = nil,
        page_size : Int32? = nil,
        requested_document_attributes : Array(String)? = nil,
        user_context : Types::UserContext? = nil
      ) : Types::RetrieveResult

        input = Types::RetrieveRequest.new(index_id: index_id, query_text: query_text, attribute_filter: attribute_filter, document_relevance_override_configurations: document_relevance_override_configurations, page_number: page_number, page_size: page_size, requested_document_attributes: requested_document_attributes, user_context: user_context)
        retrieve(input)
      end

      def retrieve(input : Types::RetrieveRequest) : Types::RetrieveResult
        request = Protocol::JsonRpc.build_request(Model::RETRIEVE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetrieveResult, "Retrieve")
      end

      # Starts a synchronization job for a data source connector. If a synchronization job is already in
      # progress, Amazon Kendra returns a ResourceInUseException exception. Re-syncing your data source with
      # your index after modifying, adding, or deleting documents from your data source respository could
      # take up to an hour or more, depending on the number of documents to sync.

      def start_data_source_sync_job(
        id : String,
        index_id : String
      ) : Types::StartDataSourceSyncJobResponse

        input = Types::StartDataSourceSyncJobRequest.new(id: id, index_id: index_id)
        start_data_source_sync_job(input)
      end

      def start_data_source_sync_job(input : Types::StartDataSourceSyncJobRequest) : Types::StartDataSourceSyncJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_DATA_SOURCE_SYNC_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDataSourceSyncJobResponse, "StartDataSourceSyncJob")
      end

      # Stops a synchronization job that is currently running. You can't stop a scheduled synchronization
      # job.

      def stop_data_source_sync_job(
        id : String,
        index_id : String
      ) : Nil

        input = Types::StopDataSourceSyncJobRequest.new(id: id, index_id: index_id)
        stop_data_source_sync_job(input)
      end

      def stop_data_source_sync_job(input : Types::StopDataSourceSyncJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_DATA_SOURCE_SYNC_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables you to provide feedback to Amazon Kendra to improve the performance of your index.
      # SubmitFeedback is currently not supported in the Amazon Web Services GovCloud (US-West) region.

      def submit_feedback(
        index_id : String,
        query_id : String,
        click_feedback_items : Array(Types::ClickFeedback)? = nil,
        relevance_feedback_items : Array(Types::RelevanceFeedback)? = nil
      ) : Nil

        input = Types::SubmitFeedbackRequest.new(index_id: index_id, query_id: query_id, click_feedback_items: click_feedback_items, relevance_feedback_items: relevance_feedback_items)
        submit_feedback(input)
      end

      def submit_feedback(input : Types::SubmitFeedbackRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_FEEDBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Adds the specified tag to the specified index, FAQ, data source, or other resource. If the tag
      # already exists, the existing value is replaced with the new value.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes a tag from an index, FAQ, data source, or other resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an access control configuration for your documents in an index. This includes user and group
      # access information for your documents. This is useful for user context filtering, where search
      # results are filtered based on the user or their group access to documents. You can update an access
      # control configuration you created without indexing all of your documents again. For example, your
      # index contains top-secret company documents that only certain employees or users should access. You
      # created an 'allow' access control configuration for one user who recently joined the 'top-secret'
      # team, switching from a team with 'deny' access to top-secret documents. However, the user suddenly
      # returns to their previous team and should no longer have access to top secret documents. You can
      # update the access control configuration to re-configure access control for your documents as
      # circumstances change. You call the BatchPutDocument API to apply the updated access control
      # configuration, with the AccessControlConfigurationId included in the Document object. If you use an
      # S3 bucket as a data source, you synchronize your data source to apply the
      # AccessControlConfigurationId in the .metadata.json file. Amazon Kendra currently only supports
      # access control configuration for S3 data sources and documents indexed using the BatchPutDocument
      # API. You can't configure access control using CreateAccessControlConfiguration for an Amazon Kendra
      # Gen AI Enterprise Edition index. Amazon Kendra will return a ValidationException error for a
      # Gen_AI_ENTERPRISE_EDITION index.

      def update_access_control_configuration(
        id : String,
        index_id : String,
        access_control_list : Array(Types::Principal)? = nil,
        description : String? = nil,
        hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil,
        name : String? = nil
      ) : Types::UpdateAccessControlConfigurationResponse

        input = Types::UpdateAccessControlConfigurationRequest.new(id: id, index_id: index_id, access_control_list: access_control_list, description: description, hierarchical_access_control_list: hierarchical_access_control_list, name: name)
        update_access_control_configuration(input)
      end

      def update_access_control_configuration(input : Types::UpdateAccessControlConfigurationRequest) : Types::UpdateAccessControlConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCESS_CONTROL_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccessControlConfigurationResponse, "UpdateAccessControlConfiguration")
      end

      # Updates an Amazon Kendra data source connector.

      def update_data_source(
        id : String,
        index_id : String,
        configuration : Types::DataSourceConfiguration? = nil,
        custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
        description : String? = nil,
        language_code : String? = nil,
        name : String? = nil,
        role_arn : String? = nil,
        schedule : String? = nil,
        vpc_configuration : Types::DataSourceVpcConfiguration? = nil
      ) : Nil

        input = Types::UpdateDataSourceRequest.new(id: id, index_id: index_id, configuration: configuration, custom_document_enrichment_configuration: custom_document_enrichment_configuration, description: description, language_code: language_code, name: name, role_arn: role_arn, schedule: schedule, vpc_configuration: vpc_configuration)
        update_data_source(input)
      end

      def update_data_source(input : Types::UpdateDataSourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates your Amazon Kendra experience such as a search application. For more information on creating
      # a search application experience, see Building a search experience with no code .

      def update_experience(
        id : String,
        index_id : String,
        configuration : Types::ExperienceConfiguration? = nil,
        description : String? = nil,
        name : String? = nil,
        role_arn : String? = nil
      ) : Nil

        input = Types::UpdateExperienceRequest.new(id: id, index_id: index_id, configuration: configuration, description: description, name: name, role_arn: role_arn)
        update_experience(input)
      end

      def update_experience(input : Types::UpdateExperienceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EXPERIENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a set of featured results. Features results are placed above all other results for certain
      # queries. You map specific queries to specific documents for featuring in the results. If a query
      # contains an exact match of a query, then one or more specific documents are featured in the search
      # results.

      def update_featured_results_set(
        featured_results_set_id : String,
        index_id : String,
        description : String? = nil,
        featured_documents : Array(Types::FeaturedDocument)? = nil,
        featured_results_set_name : String? = nil,
        query_texts : Array(String)? = nil,
        status : String? = nil
      ) : Types::UpdateFeaturedResultsSetResponse

        input = Types::UpdateFeaturedResultsSetRequest.new(featured_results_set_id: featured_results_set_id, index_id: index_id, description: description, featured_documents: featured_documents, featured_results_set_name: featured_results_set_name, query_texts: query_texts, status: status)
        update_featured_results_set(input)
      end

      def update_featured_results_set(input : Types::UpdateFeaturedResultsSetRequest) : Types::UpdateFeaturedResultsSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FEATURED_RESULTS_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFeaturedResultsSetResponse, "UpdateFeaturedResultsSet")
      end

      # Updates an Amazon Kendra index.

      def update_index(
        id : String,
        capacity_units : Types::CapacityUnitsConfiguration? = nil,
        description : String? = nil,
        document_metadata_configuration_updates : Array(Types::DocumentMetadataConfiguration)? = nil,
        name : String? = nil,
        role_arn : String? = nil,
        user_context_policy : String? = nil,
        user_group_resolution_configuration : Types::UserGroupResolutionConfiguration? = nil,
        user_token_configurations : Array(Types::UserTokenConfiguration)? = nil
      ) : Nil

        input = Types::UpdateIndexRequest.new(id: id, capacity_units: capacity_units, description: description, document_metadata_configuration_updates: document_metadata_configuration_updates, name: name, role_arn: role_arn, user_context_policy: user_context_policy, user_group_resolution_configuration: user_group_resolution_configuration, user_token_configurations: user_token_configurations)
        update_index(input)
      end

      def update_index(input : Types::UpdateIndexRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a block list used for query suggestions for an index. Updates to a block list might not take
      # effect right away. Amazon Kendra needs to refresh the entire suggestions list to apply any updates
      # to the block list. Other changes not related to the block list apply immediately. If a block list is
      # updating, then you need to wait for the first update to finish before submitting another update.
      # Amazon Kendra supports partial updates, so you only need to provide the fields you want to update.
      # UpdateQuerySuggestionsBlockList is currently not supported in the Amazon Web Services GovCloud
      # (US-West) region.

      def update_query_suggestions_block_list(
        id : String,
        index_id : String,
        description : String? = nil,
        name : String? = nil,
        role_arn : String? = nil,
        source_s3_path : Types::S3Path? = nil
      ) : Nil

        input = Types::UpdateQuerySuggestionsBlockListRequest.new(id: id, index_id: index_id, description: description, name: name, role_arn: role_arn, source_s3_path: source_s3_path)
        update_query_suggestions_block_list(input)
      end

      def update_query_suggestions_block_list(input : Types::UpdateQuerySuggestionsBlockListRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_QUERY_SUGGESTIONS_BLOCK_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the settings of query suggestions for an index. Amazon Kendra supports partial updates, so
      # you only need to provide the fields you want to update. If an update is currently processing, you
      # need to wait for the update to finish before making another update. Updates to query suggestions
      # settings might not take effect right away. The time for your updated settings to take effect depends
      # on the updates made and the number of search queries in your index. You can still enable/disable
      # query suggestions at any time. UpdateQuerySuggestionsConfig is currently not supported in the Amazon
      # Web Services GovCloud (US-West) region.

      def update_query_suggestions_config(
        index_id : String,
        attribute_suggestions_config : Types::AttributeSuggestionsUpdateConfig? = nil,
        include_queries_without_user_information : Bool? = nil,
        minimum_number_of_querying_users : Int32? = nil,
        minimum_query_count : Int32? = nil,
        mode : String? = nil,
        query_log_look_back_window_in_days : Int32? = nil
      ) : Nil

        input = Types::UpdateQuerySuggestionsConfigRequest.new(index_id: index_id, attribute_suggestions_config: attribute_suggestions_config, include_queries_without_user_information: include_queries_without_user_information, minimum_number_of_querying_users: minimum_number_of_querying_users, minimum_query_count: minimum_query_count, mode: mode, query_log_look_back_window_in_days: query_log_look_back_window_in_days)
        update_query_suggestions_config(input)
      end

      def update_query_suggestions_config(input : Types::UpdateQuerySuggestionsConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_QUERY_SUGGESTIONS_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a thesaurus for an index.

      def update_thesaurus(
        id : String,
        index_id : String,
        description : String? = nil,
        name : String? = nil,
        role_arn : String? = nil,
        source_s3_path : Types::S3Path? = nil
      ) : Nil

        input = Types::UpdateThesaurusRequest.new(id: id, index_id: index_id, description: description, name: name, role_arn: role_arn, source_s3_path: source_s3_path)
        update_thesaurus(input)
      end

      def update_thesaurus(input : Types::UpdateThesaurusRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_THESAURUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
