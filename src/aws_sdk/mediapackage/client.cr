module AwsSdk
  module MediaPackage
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

      # Changes the Channel's properities to configure log subscription
      def configure_logs(
        id : String,
        egress_access_logs : Types::EgressAccessLogs? = nil,
        ingress_access_logs : Types::IngressAccessLogs? = nil
      ) : Protocol::Request
        input = Types::ConfigureLogsRequest.new(id: id, egress_access_logs: egress_access_logs, ingress_access_logs: ingress_access_logs)
        configure_logs(input)
      end
      def configure_logs(input : Types::ConfigureLogsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIGURE_LOGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Channel.
      def create_channel(
        id : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(id: id, description: description, tags: tags)
        create_channel(input)
      end
      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new HarvestJob record.
      def create_harvest_job(
        end_time : String,
        id : String,
        origin_endpoint_id : String,
        s3_destination : Types::S3Destination,
        start_time : String
      ) : Protocol::Request
        input = Types::CreateHarvestJobRequest.new(end_time: end_time, id: id, origin_endpoint_id: origin_endpoint_id, s3_destination: s3_destination, start_time: start_time)
        create_harvest_job(input)
      end
      def create_harvest_job(input : Types::CreateHarvestJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_HARVEST_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new OriginEndpoint record.
      def create_origin_endpoint(
        channel_id : String,
        id : String,
        authorization : Types::Authorization? = nil,
        cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
        dash_package : Types::DashPackage? = nil,
        description : String? = nil,
        hls_package : Types::HlsPackage? = nil,
        manifest_name : String? = nil,
        mss_package : Types::MssPackage? = nil,
        origination : String? = nil,
        startover_window_seconds : Int32? = nil,
        tags : Hash(String, String)? = nil,
        time_delay_seconds : Int32? = nil,
        whitelist : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateOriginEndpointRequest.new(channel_id: channel_id, id: id, authorization: authorization, cmaf_package: cmaf_package, dash_package: dash_package, description: description, hls_package: hls_package, manifest_name: manifest_name, mss_package: mss_package, origination: origination, startover_window_seconds: startover_window_seconds, tags: tags, time_delay_seconds: time_delay_seconds, whitelist: whitelist)
        create_origin_endpoint(input)
      end
      def create_origin_endpoint(input : Types::CreateOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Channel.
      def delete_channel(
        id : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(id: id)
        delete_channel(input)
      end
      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing OriginEndpoint.
      def delete_origin_endpoint(
        id : String
      ) : Protocol::Request
        input = Types::DeleteOriginEndpointRequest.new(id: id)
        delete_origin_endpoint(input)
      end
      def delete_origin_endpoint(input : Types::DeleteOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a Channel.
      def describe_channel(
        id : String
      ) : Protocol::Request
        input = Types::DescribeChannelRequest.new(id: id)
        describe_channel(input)
      end
      def describe_channel(input : Types::DescribeChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about an existing HarvestJob.
      def describe_harvest_job(
        id : String
      ) : Protocol::Request
        input = Types::DescribeHarvestJobRequest.new(id: id)
        describe_harvest_job(input)
      end
      def describe_harvest_job(input : Types::DescribeHarvestJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_HARVEST_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about an existing OriginEndpoint.
      def describe_origin_endpoint(
        id : String
      ) : Protocol::Request
        input = Types::DescribeOriginEndpointRequest.new(id: id)
        describe_origin_endpoint(input)
      end
      def describe_origin_endpoint(input : Types::DescribeOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of Channels.
      def list_channels(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(max_results: max_results, next_token: next_token)
        list_channels(input)
      end
      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of HarvestJob records.
      def list_harvest_jobs(
        include_channel_id : String? = nil,
        include_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListHarvestJobsRequest.new(include_channel_id: include_channel_id, include_status: include_status, max_results: max_results, next_token: next_token)
        list_harvest_jobs(input)
      end
      def list_harvest_jobs(input : Types::ListHarvestJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HARVEST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of OriginEndpoint records.
      def list_origin_endpoints(
        channel_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOriginEndpointsRequest.new(channel_id: channel_id, max_results: max_results, next_token: next_token)
        list_origin_endpoints(input)
      end
      def list_origin_endpoints(input : Types::ListOriginEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORIGIN_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

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

      # Changes the Channel's first IngestEndpoint's username and password. WARNING - This API is
      # deprecated. Please use RotateIngestEndpointCredentials instead
      def rotate_channel_credentials(
        id : String
      ) : Protocol::Request
        input = Types::RotateChannelCredentialsRequest.new(id: id)
        rotate_channel_credentials(input)
      end
      def rotate_channel_credentials(input : Types::RotateChannelCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ROTATE_CHANNEL_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rotate the IngestEndpoint's username and password, as specified by the IngestEndpoint's id.
      def rotate_ingest_endpoint_credentials(
        id : String,
        ingest_endpoint_id : String
      ) : Protocol::Request
        input = Types::RotateIngestEndpointCredentialsRequest.new(id: id, ingest_endpoint_id: ingest_endpoint_id)
        rotate_ingest_endpoint_credentials(input)
      end
      def rotate_ingest_endpoint_credentials(input : Types::RotateIngestEndpointCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ROTATE_INGEST_ENDPOINT_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

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

      # Updates an existing Channel.
      def update_channel(
        id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(id: id, description: description)
        update_channel(input)
      end
      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing OriginEndpoint.
      def update_origin_endpoint(
        id : String,
        authorization : Types::Authorization? = nil,
        cmaf_package : Types::CmafPackageCreateOrUpdateParameters? = nil,
        dash_package : Types::DashPackage? = nil,
        description : String? = nil,
        hls_package : Types::HlsPackage? = nil,
        manifest_name : String? = nil,
        mss_package : Types::MssPackage? = nil,
        origination : String? = nil,
        startover_window_seconds : Int32? = nil,
        time_delay_seconds : Int32? = nil,
        whitelist : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateOriginEndpointRequest.new(id: id, authorization: authorization, cmaf_package: cmaf_package, dash_package: dash_package, description: description, hls_package: hls_package, manifest_name: manifest_name, mss_package: mss_package, origination: origination, startover_window_seconds: startover_window_seconds, time_delay_seconds: time_delay_seconds, whitelist: whitelist)
        update_origin_endpoint(input)
      end
      def update_origin_endpoint(input : Types::UpdateOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
