module AwsSdk
  module MediaPackageVod
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

      # Changes the packaging group's properities to configure log subscription

      def configure_logs(
        id : String,
        egress_access_logs : Types::EgressAccessLogs? = nil
      ) : Protocol::Request
        input = Types::ConfigureLogsRequest.new(id: id, egress_access_logs: egress_access_logs)
        configure_logs(input)
      end

      def configure_logs(input : Types::ConfigureLogsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CONFIGURE_LOGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new MediaPackage VOD Asset resource.

      def create_asset(
        id : String,
        packaging_group_id : String,
        source_arn : String,
        source_role_arn : String,
        resource_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssetRequest.new(id: id, packaging_group_id: packaging_group_id, source_arn: source_arn, source_role_arn: source_role_arn, resource_id: resource_id, tags: tags)
        create_asset(input)
      end

      def create_asset(input : Types::CreateAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new MediaPackage VOD PackagingConfiguration resource.

      def create_packaging_configuration(
        id : String,
        packaging_group_id : String,
        cmaf_package : Types::CmafPackage? = nil,
        dash_package : Types::DashPackage? = nil,
        hls_package : Types::HlsPackage? = nil,
        mss_package : Types::MssPackage? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePackagingConfigurationRequest.new(id: id, packaging_group_id: packaging_group_id, cmaf_package: cmaf_package, dash_package: dash_package, hls_package: hls_package, mss_package: mss_package, tags: tags)
        create_packaging_configuration(input)
      end

      def create_packaging_configuration(input : Types::CreatePackagingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new MediaPackage VOD PackagingGroup resource.

      def create_packaging_group(
        id : String,
        authorization : Types::Authorization? = nil,
        egress_access_logs : Types::EgressAccessLogs? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePackagingGroupRequest.new(id: id, authorization: authorization, egress_access_logs: egress_access_logs, tags: tags)
        create_packaging_group(input)
      end

      def create_packaging_group(input : Types::CreatePackagingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PACKAGING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing MediaPackage VOD Asset resource.

      def delete_asset(
        id : String
      ) : Protocol::Request
        input = Types::DeleteAssetRequest.new(id: id)
        delete_asset(input)
      end

      def delete_asset(input : Types::DeleteAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a MediaPackage VOD PackagingConfiguration resource.

      def delete_packaging_configuration(
        id : String
      ) : Protocol::Request
        input = Types::DeletePackagingConfigurationRequest.new(id: id)
        delete_packaging_configuration(input)
      end

      def delete_packaging_configuration(input : Types::DeletePackagingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a MediaPackage VOD PackagingGroup resource.

      def delete_packaging_group(
        id : String
      ) : Protocol::Request
        input = Types::DeletePackagingGroupRequest.new(id: id)
        delete_packaging_group(input)
      end

      def delete_packaging_group(input : Types::DeletePackagingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PACKAGING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of a MediaPackage VOD Asset resource.

      def describe_asset(
        id : String
      ) : Protocol::Request
        input = Types::DescribeAssetRequest.new(id: id)
        describe_asset(input)
      end

      def describe_asset(input : Types::DescribeAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of a MediaPackage VOD PackagingConfiguration resource.

      def describe_packaging_configuration(
        id : String
      ) : Protocol::Request
        input = Types::DescribePackagingConfigurationRequest.new(id: id)
        describe_packaging_configuration(input)
      end

      def describe_packaging_configuration(input : Types::DescribePackagingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of a MediaPackage VOD PackagingGroup resource.

      def describe_packaging_group(
        id : String
      ) : Protocol::Request
        input = Types::DescribePackagingGroupRequest.new(id: id)
        describe_packaging_group(input)
      end

      def describe_packaging_group(input : Types::DescribePackagingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PACKAGING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of MediaPackage VOD Asset resources.

      def list_assets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        packaging_group_id : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetsRequest.new(max_results: max_results, next_token: next_token, packaging_group_id: packaging_group_id)
        list_assets(input)
      end

      def list_assets(input : Types::ListAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of MediaPackage VOD PackagingConfiguration resources.

      def list_packaging_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        packaging_group_id : String? = nil
      ) : Protocol::Request
        input = Types::ListPackagingConfigurationsRequest.new(max_results: max_results, next_token: next_token, packaging_group_id: packaging_group_id)
        list_packaging_configurations(input)
      end

      def list_packaging_configurations(input : Types::ListPackagingConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGING_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a collection of MediaPackage VOD PackagingGroup resources.

      def list_packaging_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPackagingGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_packaging_groups(input)
      end

      def list_packaging_groups(input : Types::ListPackagingGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PACKAGING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags assigned to the specified resource.

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

      # Adds tags to the specified resource. You can specify one or more tags to add.

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

      # Removes tags from the specified resource. You can specify one or more tags to remove.

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

      # Updates a specific packaging group. You can't change the id attribute or any other system-generated
      # attributes.

      def update_packaging_group(
        id : String,
        authorization : Types::Authorization? = nil
      ) : Protocol::Request
        input = Types::UpdatePackagingGroupRequest.new(id: id, authorization: authorization)
        update_packaging_group(input)
      end

      def update_packaging_group(input : Types::UpdatePackagingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PACKAGING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
