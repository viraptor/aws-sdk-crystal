module Aws
  module SageMakerGeospatial
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Use this operation to delete an Earth Observation job.

      def delete_earth_observation_job(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteEarthObservationJobInput.new(arn: arn)
        delete_earth_observation_job(input)
      end

      def delete_earth_observation_job(input : Types::DeleteEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EARTH_OBSERVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to delete a Vector Enrichment job.

      def delete_vector_enrichment_job(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteVectorEnrichmentJobInput.new(arn: arn)
        delete_vector_enrichment_job(input)
      end

      def delete_vector_enrichment_job(input : Types::DeleteVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VECTOR_ENRICHMENT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to export results of an Earth Observation job and optionally source images used
      # as input to the EOJ to an Amazon S3 location.

      def export_earth_observation_job(
        arn : String,
        execution_role_arn : String,
        output_config : Types::OutputConfigInput,
        client_token : String? = nil,
        export_source_images : Bool? = nil
      ) : Protocol::Request
        input = Types::ExportEarthObservationJobInput.new(arn: arn, execution_role_arn: execution_role_arn, output_config: output_config, client_token: client_token, export_source_images: export_source_images)
        export_earth_observation_job(input)
      end

      def export_earth_observation_job(input : Types::ExportEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_EARTH_OBSERVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to copy results of a Vector Enrichment job to an Amazon S3 location.

      def export_vector_enrichment_job(
        arn : String,
        execution_role_arn : String,
        output_config : Types::ExportVectorEnrichmentJobOutputConfig,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ExportVectorEnrichmentJobInput.new(arn: arn, execution_role_arn: execution_role_arn, output_config: output_config, client_token: client_token)
        export_vector_enrichment_job(input)
      end

      def export_vector_enrichment_job(input : Types::ExportVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_VECTOR_ENRICHMENT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the details for a previously initiated Earth Observation job.

      def get_earth_observation_job(
        arn : String
      ) : Protocol::Request
        input = Types::GetEarthObservationJobInput.new(arn: arn)
        get_earth_observation_job(input)
      end

      def get_earth_observation_job(input : Types::GetEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EARTH_OBSERVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to get details of a specific raster data collection.

      def get_raster_data_collection(
        arn : String
      ) : Protocol::Request
        input = Types::GetRasterDataCollectionInput.new(arn: arn)
        get_raster_data_collection(input)
      end

      def get_raster_data_collection(input : Types::GetRasterDataCollectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RASTER_DATA_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a web mercator tile for the given Earth Observation job.

      def get_tile(
        arn : String,
        image_assets : Array(String),
        target : String,
        x : Int32,
        y : Int32,
        z : Int32,
        execution_role_arn : String? = nil,
        image_mask : Bool? = nil,
        output_data_type : String? = nil,
        output_format : String? = nil,
        property_filters : String? = nil,
        time_range_filter : String? = nil
      ) : Protocol::Request
        input = Types::GetTileInput.new(arn: arn, image_assets: image_assets, target: target, x: x, y: y, z: z, execution_role_arn: execution_role_arn, image_mask: image_mask, output_data_type: output_data_type, output_format: output_format, property_filters: property_filters, time_range_filter: time_range_filter)
        get_tile(input)
      end

      def get_tile(input : Types::GetTileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of a Vector Enrichment Job for a given job Amazon Resource Name (ARN).

      def get_vector_enrichment_job(
        arn : String
      ) : Protocol::Request
        input = Types::GetVectorEnrichmentJobInput.new(arn: arn)
        get_vector_enrichment_job(input)
      end

      def get_vector_enrichment_job(input : Types::GetVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VECTOR_ENRICHMENT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to get a list of the Earth Observation jobs associated with the calling Amazon
      # Web Services account.

      def list_earth_observation_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListEarthObservationJobInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_earth_observation_jobs(input)
      end

      def list_earth_observation_jobs(input : Types::ListEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EARTH_OBSERVATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to get raster data collections.

      def list_raster_data_collections(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRasterDataCollectionsInput.new(max_results: max_results, next_token: next_token)
        list_raster_data_collections(input)
      end

      def list_raster_data_collections(input : Types::ListRasterDataCollectionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RASTER_DATA_COLLECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags attached to the resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of vector enrichment jobs.

      def list_vector_enrichment_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Protocol::Request
        input = Types::ListVectorEnrichmentJobInput.new(max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_vector_enrichment_jobs(input)
      end

      def list_vector_enrichment_jobs(input : Types::ListVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VECTOR_ENRICHMENT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you run image query on a specific raster data collection to get a list of the satellite
      # imagery matching the selected filters.

      def search_raster_data_collection(
        arn : String,
        raster_data_collection_query : Types::RasterDataCollectionQueryWithBandFilterInput,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchRasterDataCollectionInput.new(arn: arn, raster_data_collection_query: raster_data_collection_query, next_token: next_token)
        search_raster_data_collection(input)
      end

      def search_raster_data_collection(input : Types::SearchRasterDataCollectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RASTER_DATA_COLLECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to create an Earth observation job.

      def start_earth_observation_job(
        execution_role_arn : String,
        input_config : Types::InputConfigInput,
        job_config : Types::JobConfigInput,
        name : String,
        client_token : String? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartEarthObservationJobInput.new(execution_role_arn: execution_role_arn, input_config: input_config, job_config: job_config, name: name, client_token: client_token, kms_key_id: kms_key_id, tags: tags)
        start_earth_observation_job(input)
      end

      def start_earth_observation_job(input : Types::StartEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EARTH_OBSERVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Vector Enrichment job for the supplied job type. Currently, there are two supported job
      # types: reverse geocoding and map matching.

      def start_vector_enrichment_job(
        execution_role_arn : String,
        input_config : Types::VectorEnrichmentJobInputConfig,
        job_config : Types::VectorEnrichmentJobConfig,
        name : String,
        client_token : String? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartVectorEnrichmentJobInput.new(execution_role_arn: execution_role_arn, input_config: input_config, job_config: job_config, name: name, client_token: client_token, kms_key_id: kms_key_id, tags: tags)
        start_vector_enrichment_job(input)
      end

      def start_vector_enrichment_job(input : Types::StartVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_VECTOR_ENRICHMENT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to stop an existing earth observation job.

      def stop_earth_observation_job(
        arn : String
      ) : Protocol::Request
        input = Types::StopEarthObservationJobInput.new(arn: arn)
        stop_earth_observation_job(input)
      end

      def stop_earth_observation_job(input : Types::StopEarthObservationJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_EARTH_OBSERVATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the Vector Enrichment job for a given job ARN.

      def stop_vector_enrichment_job(
        arn : String
      ) : Protocol::Request
        input = Types::StopVectorEnrichmentJobInput.new(arn: arn)
        stop_vector_enrichment_job(input)
      end

      def stop_vector_enrichment_job(input : Types::StopVectorEnrichmentJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_VECTOR_ENRICHMENT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The resource you want to tag.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The resource you want to untag.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
