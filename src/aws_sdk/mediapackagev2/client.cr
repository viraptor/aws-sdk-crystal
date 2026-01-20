module AwsSdk
  module MediaPackageV2
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

      # Cancels an in-progress harvest job.

      def cancel_harvest_job(
        channel_group_name : String,
        channel_name : String,
        harvest_job_name : String,
        origin_endpoint_name : String,
        e_tag : String? = nil
      ) : Protocol::Request
        input = Types::CancelHarvestJobRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, harvest_job_name: harvest_job_name, origin_endpoint_name: origin_endpoint_name, e_tag: e_tag)
        cancel_harvest_job(input)
      end

      def cancel_harvest_job(input : Types::CancelHarvestJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_HARVEST_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a channel to start receiving content streams. The channel represents the input to
      # MediaPackage for incoming live content from an encoder such as AWS Elemental MediaLive. The channel
      # receives content, and after packaging it, outputs it through an origin endpoint to downstream
      # devices (such as video players or CDNs) that request the content. You can create only one channel
      # with each request. We recommend that you spread out channels between channel groups, such as putting
      # redundant channels in the same AWS Region in different channel groups.

      def create_channel(
        channel_group_name : String,
        channel_name : String,
        client_token : String? = nil,
        description : String? = nil,
        input_switch_configuration : Types::InputSwitchConfiguration? = nil,
        input_type : String? = nil,
        output_header_configuration : Types::OutputHeaderConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, client_token: client_token, description: description, input_switch_configuration: input_switch_configuration, input_type: input_type, output_header_configuration: output_header_configuration, tags: tags)
        create_channel(input)
      end

      def create_channel(input : Types::CreateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a channel group to group your channels and origin endpoints. A channel group is the top-level
      # resource that consists of channels and origin endpoints that are associated with it and that
      # provides predictable URLs for stream delivery. All channels and origin endpoints within the channel
      # group are guaranteed to share the DNS. You can create only one channel group with each request.

      def create_channel_group(
        channel_group_name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelGroupRequest.new(channel_group_name: channel_group_name, client_token: client_token, description: description, tags: tags)
        create_channel_group(input)
      end

      def create_channel_group(input : Types::CreateChannelGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new harvest job to export content from a MediaPackage v2 channel to an S3 bucket.

      def create_harvest_job(
        channel_group_name : String,
        channel_name : String,
        destination : Types::Destination,
        harvested_manifests : Types::HarvestedManifests,
        origin_endpoint_name : String,
        schedule_configuration : Types::HarvesterScheduleConfiguration,
        client_token : String? = nil,
        description : String? = nil,
        harvest_job_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateHarvestJobRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, destination: destination, harvested_manifests: harvested_manifests, origin_endpoint_name: origin_endpoint_name, schedule_configuration: schedule_configuration, client_token: client_token, description: description, harvest_job_name: harvest_job_name, tags: tags)
        create_harvest_job(input)
      end

      def create_harvest_job(input : Types::CreateHarvestJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_HARVEST_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The endpoint is attached to a channel, and represents the output of the live content. You can
      # associate multiple endpoints to a single channel. Each endpoint gives players and downstream CDNs
      # (such as Amazon CloudFront) access to the content for playback. Content can't be served from a
      # channel until it has an endpoint. You can create only one endpoint with each request.

      def create_origin_endpoint(
        channel_group_name : String,
        channel_name : String,
        container_type : String,
        origin_endpoint_name : String,
        client_token : String? = nil,
        dash_manifests : Array(Types::CreateDashManifestConfiguration)? = nil,
        description : String? = nil,
        force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
        hls_manifests : Array(Types::CreateHlsManifestConfiguration)? = nil,
        low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)? = nil,
        mss_manifests : Array(Types::CreateMssManifestConfiguration)? = nil,
        segment : Types::Segment? = nil,
        startover_window_seconds : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateOriginEndpointRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, container_type: container_type, origin_endpoint_name: origin_endpoint_name, client_token: client_token, dash_manifests: dash_manifests, description: description, force_endpoint_error_configuration: force_endpoint_error_configuration, hls_manifests: hls_manifests, low_latency_hls_manifests: low_latency_hls_manifests, mss_manifests: mss_manifests, segment: segment, startover_window_seconds: startover_window_seconds, tags: tags)
        create_origin_endpoint(input)
      end

      def create_origin_endpoint(input : Types::CreateOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a channel to stop AWS Elemental MediaPackage from receiving further content. You must delete
      # the channel's origin endpoints before you can delete the channel.

      def delete_channel(
        channel_group_name : String,
        channel_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelRequest.new(channel_group_name: channel_group_name, channel_name: channel_name)
        delete_channel(input)
      end

      def delete_channel(input : Types::DeleteChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a channel group. You must delete the channel group's channels and origin endpoints before you
      # can delete the channel group. If you delete a channel group, you'll lose access to the egress domain
      # and will have to create a new channel group to replace it.

      def delete_channel_group(
        channel_group_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelGroupRequest.new(channel_group_name: channel_group_name)
        delete_channel_group(input)
      end

      def delete_channel_group(input : Types::DeleteChannelGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a channel policy.

      def delete_channel_policy(
        channel_group_name : String,
        channel_name : String
      ) : Protocol::Request
        input = Types::DeleteChannelPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name)
        delete_channel_policy(input)
      end

      def delete_channel_policy(input : Types::DeleteChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Origin endpoints can serve content until they're deleted. Delete the endpoint if it should no longer
      # respond to playback requests. You must delete all endpoints from a channel before you can delete the
      # channel.

      def delete_origin_endpoint(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::DeleteOriginEndpointRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name)
        delete_origin_endpoint(input)
      end

      def delete_origin_endpoint(input : Types::DeleteOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an origin endpoint policy.

      def delete_origin_endpoint_policy(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::DeleteOriginEndpointPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name)
        delete_origin_endpoint_policy(input)
      end

      def delete_origin_endpoint_policy(input : Types::DeleteOriginEndpointPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ORIGIN_ENDPOINT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified channel that's configured in AWS Elemental MediaPackage.

      def get_channel(
        channel_group_name : String,
        channel_name : String
      ) : Protocol::Request
        input = Types::GetChannelRequest.new(channel_group_name: channel_group_name, channel_name: channel_name)
        get_channel(input)
      end

      def get_channel(input : Types::GetChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified channel group that's configured in AWS Elemental MediaPackage.

      def get_channel_group(
        channel_group_name : String
      ) : Protocol::Request
        input = Types::GetChannelGroupRequest.new(channel_group_name: channel_group_name)
        get_channel_group(input)
      end

      def get_channel_group(input : Types::GetChannelGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified channel policy that's configured in AWS Elemental MediaPackage. With
      # policies, you can specify who has access to AWS resources and what actions they can perform on those
      # resources.

      def get_channel_policy(
        channel_group_name : String,
        channel_name : String
      ) : Protocol::Request
        input = Types::GetChannelPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name)
        get_channel_policy(input)
      end

      def get_channel_policy(input : Types::GetChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific harvest job.

      def get_harvest_job(
        channel_group_name : String,
        channel_name : String,
        harvest_job_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::GetHarvestJobRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, harvest_job_name: harvest_job_name, origin_endpoint_name: origin_endpoint_name)
        get_harvest_job(input)
      end

      def get_harvest_job(input : Types::GetHarvestJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_HARVEST_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified origin endpoint that's configured in AWS Elemental MediaPackage to obtain
      # its playback URL and to view the packaging settings that it's currently using.

      def get_origin_endpoint(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::GetOriginEndpointRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name)
        get_origin_endpoint(input)
      end

      def get_origin_endpoint(input : Types::GetOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified origin endpoint policy that's configured in AWS Elemental MediaPackage.

      def get_origin_endpoint_policy(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::GetOriginEndpointPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name)
        get_origin_endpoint_policy(input)
      end

      def get_origin_endpoint_policy(input : Types::GetOriginEndpointPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORIGIN_ENDPOINT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all channel groups that are configured in Elemental MediaPackage.

      def list_channel_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_channel_groups(input)
      end

      def list_channel_groups(input : Types::ListChannelGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all channels in a specific channel group that are configured in AWS Elemental
      # MediaPackage.

      def list_channels(
        channel_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsRequest.new(channel_group_name: channel_group_name, max_results: max_results, next_token: next_token)
        list_channels(input)
      end

      def list_channels(input : Types::ListChannelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of harvest jobs that match the specified criteria.

      def list_harvest_jobs(
        channel_group_name : String,
        channel_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin_endpoint_name : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListHarvestJobsRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, max_results: max_results, next_token: next_token, origin_endpoint_name: origin_endpoint_name, status: status)
        list_harvest_jobs(input)
      end

      def list_harvest_jobs(input : Types::ListHarvestJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HARVEST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all origin endpoints in a specific channel that are configured in AWS Elemental
      # MediaPackage.

      def list_origin_endpoints(
        channel_group_name : String,
        channel_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOriginEndpointsRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, max_results: max_results, next_token: next_token)
        list_origin_endpoints(input)
      end

      def list_origin_endpoints(input : Types::ListOriginEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORIGIN_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to a resource.

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

      # Attaches an IAM policy to the specified channel. With policies, you can specify who has access to
      # AWS resources and what actions they can perform on those resources. You can attach only one policy
      # with each request.

      def put_channel_policy(
        channel_group_name : String,
        channel_name : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutChannelPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, policy: policy)
        put_channel_policy(input)
      end

      def put_channel_policy(input : Types::PutChannelPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CHANNEL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches an IAM policy to the specified origin endpoint. You can attach only one policy with each
      # request.

      def put_origin_endpoint_policy(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String,
        policy : String,
        cdn_auth_configuration : Types::CdnAuthConfiguration? = nil
      ) : Protocol::Request
        input = Types::PutOriginEndpointPolicyRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name, policy: policy, cdn_auth_configuration: cdn_auth_configuration)
        put_origin_endpoint_policy(input)
      end

      def put_origin_endpoint_policy(input : Types::PutOriginEndpointPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ORIGIN_ENDPOINT_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resetting the channel can help to clear errors from misconfigurations in the encoder. A reset
      # refreshes the ingest stream and removes previous content. Be sure to stop the encoder before you
      # reset the channel, and wait at least 30 seconds before you restart the encoder.

      def reset_channel_state(
        channel_group_name : String,
        channel_name : String
      ) : Protocol::Request
        input = Types::ResetChannelStateRequest.new(channel_group_name: channel_group_name, channel_name: channel_name)
        reset_channel_state(input)
      end

      def reset_channel_state(input : Types::ResetChannelStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_CHANNEL_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resetting the origin endpoint can help to resolve unexpected behavior and other content packaging
      # issues. It also helps to preserve special events when you don't want the previous content to be
      # available for viewing. A reset clears out all previous content from the origin endpoint.
      # MediaPackage might return old content from this endpoint in the first 30 seconds after the endpoint
      # reset. For best results, when possible, wait 30 seconds from endpoint reset to send playback
      # requests to this endpoint.

      def reset_origin_endpoint_state(
        channel_group_name : String,
        channel_name : String,
        origin_endpoint_name : String
      ) : Protocol::Request
        input = Types::ResetOriginEndpointStateRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, origin_endpoint_name: origin_endpoint_name)
        reset_origin_endpoint_state(input)
      end

      def reset_origin_endpoint_state(input : Types::ResetOriginEndpointStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_ORIGIN_ENDPOINT_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one of more tags (key-value pairs) to the specified MediaPackage resource. Tags can help you
      # organize and categorize your resources. You can also use them to scope user permissions, by granting
      # a user permission to access or change only resources with certain tag values. You can use the
      # TagResource operation with a resource that already has tags. If you specify a new tag key for the
      # resource, this tag is appended to the list of tags associated with the resource. If you specify a
      # tag key that is already associated with the resource, the new tag value that you specify replaces
      # the previous value for that tag.

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

      # Removes one or more tags from the specified resource.

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

      # Update the specified channel. You can edit if MediaPackage sends ingest or egress access logs to the
      # CloudWatch log group, if content will be encrypted, the description on a channel, and your channel's
      # policy settings. You can't edit the name of the channel or CloudFront distribution details. Any
      # edits you make that impact the video output may not be reflected for a few minutes.

      def update_channel(
        channel_group_name : String,
        channel_name : String,
        description : String? = nil,
        e_tag : String? = nil,
        input_switch_configuration : Types::InputSwitchConfiguration? = nil,
        output_header_configuration : Types::OutputHeaderConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, description: description, e_tag: e_tag, input_switch_configuration: input_switch_configuration, output_header_configuration: output_header_configuration)
        update_channel(input)
      end

      def update_channel(input : Types::UpdateChannelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the specified channel group. You can edit the description on a channel group for easier
      # identification later from the AWS Elemental MediaPackage console. You can't edit the name of the
      # channel group. Any edits you make that impact the video output may not be reflected for a few
      # minutes.

      def update_channel_group(
        channel_group_name : String,
        description : String? = nil,
        e_tag : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelGroupRequest.new(channel_group_name: channel_group_name, description: description, e_tag: e_tag)
        update_channel_group(input)
      end

      def update_channel_group(input : Types::UpdateChannelGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the specified origin endpoint. Edit the packaging preferences on an endpoint to optimize the
      # viewing experience. You can't edit the name of the endpoint. Any edits you make that impact the
      # video output may not be reflected for a few minutes.

      def update_origin_endpoint(
        channel_group_name : String,
        channel_name : String,
        container_type : String,
        origin_endpoint_name : String,
        dash_manifests : Array(Types::CreateDashManifestConfiguration)? = nil,
        description : String? = nil,
        e_tag : String? = nil,
        force_endpoint_error_configuration : Types::ForceEndpointErrorConfiguration? = nil,
        hls_manifests : Array(Types::CreateHlsManifestConfiguration)? = nil,
        low_latency_hls_manifests : Array(Types::CreateLowLatencyHlsManifestConfiguration)? = nil,
        mss_manifests : Array(Types::CreateMssManifestConfiguration)? = nil,
        segment : Types::Segment? = nil,
        startover_window_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateOriginEndpointRequest.new(channel_group_name: channel_group_name, channel_name: channel_name, container_type: container_type, origin_endpoint_name: origin_endpoint_name, dash_manifests: dash_manifests, description: description, e_tag: e_tag, force_endpoint_error_configuration: force_endpoint_error_configuration, hls_manifests: hls_manifests, low_latency_hls_manifests: low_latency_hls_manifests, mss_manifests: mss_manifests, segment: segment, startover_window_seconds: startover_window_seconds)
        update_origin_endpoint(input)
      end

      def update_origin_endpoint(input : Types::UpdateOriginEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORIGIN_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
