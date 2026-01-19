module AwsSdk
  module Cloud9
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates an Cloud9 development environment, launches an Amazon Elastic Compute Cloud (Amazon EC2)
      # instance, and then connects from the instance to the environment. Cloud9 is no longer available to
      # new customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def create_environment_ec2(
        image_id : String,
        instance_type : String,
        name : String,
        automatic_stop_time_minutes : Int32? = nil,
        client_request_token : String? = nil,
        connection_type : String? = nil,
        description : String? = nil,
        dry_run : Bool? = nil,
        owner_arn : String? = nil,
        subnet_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEnvironmentEC2Result
        input = Types::CreateEnvironmentEC2Request.new(image_id: image_id, instance_type: instance_type, name: name, automatic_stop_time_minutes: automatic_stop_time_minutes, client_request_token: client_request_token, connection_type: connection_type, description: description, dry_run: dry_run, owner_arn: owner_arn, subnet_id: subnet_id, tags: tags)
        create_environment_ec2(input)
      end
      def create_environment_ec2(input : Types::CreateEnvironmentEC2Request) : Types::CreateEnvironmentEC2Result
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_EC2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentEC2Result, "CreateEnvironmentEC2")
      end

      # Adds an environment member to an Cloud9 development environment. Cloud9 is no longer available to
      # new customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def create_environment_membership(
        environment_id : String,
        permissions : String,
        user_arn : String
      ) : Types::CreateEnvironmentMembershipResult
        input = Types::CreateEnvironmentMembershipRequest.new(environment_id: environment_id, permissions: permissions, user_arn: user_arn)
        create_environment_membership(input)
      end
      def create_environment_membership(input : Types::CreateEnvironmentMembershipRequest) : Types::CreateEnvironmentMembershipResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENVIRONMENT_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEnvironmentMembershipResult, "CreateEnvironmentMembership")
      end

      # Deletes an Cloud9 development environment. If an Amazon EC2 instance is connected to the
      # environment, also terminates the instance. Cloud9 is no longer available to new customers. Existing
      # customers of Cloud9 can continue to use the service as normal. Learn more"
      def delete_environment(
        environment_id : String
      ) : Types::DeleteEnvironmentResult
        input = Types::DeleteEnvironmentRequest.new(environment_id: environment_id)
        delete_environment(input)
      end
      def delete_environment(input : Types::DeleteEnvironmentRequest) : Types::DeleteEnvironmentResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentResult, "DeleteEnvironment")
      end

      # Deletes an environment member from a development environment. Cloud9 is no longer available to new
      # customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def delete_environment_membership(
        environment_id : String,
        user_arn : String
      ) : Types::DeleteEnvironmentMembershipResult
        input = Types::DeleteEnvironmentMembershipRequest.new(environment_id: environment_id, user_arn: user_arn)
        delete_environment_membership(input)
      end
      def delete_environment_membership(input : Types::DeleteEnvironmentMembershipRequest) : Types::DeleteEnvironmentMembershipResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENVIRONMENT_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEnvironmentMembershipResult, "DeleteEnvironmentMembership")
      end

      # Gets information about environment members for an Cloud9 development environment. Cloud9 is no
      # longer available to new customers. Existing customers of Cloud9 can continue to use the service as
      # normal. Learn more"
      def describe_environment_memberships(
        environment_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        permissions : Array(String)? = nil,
        user_arn : String? = nil
      ) : Types::DescribeEnvironmentMembershipsResult
        input = Types::DescribeEnvironmentMembershipsRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token, permissions: permissions, user_arn: user_arn)
        describe_environment_memberships(input)
      end
      def describe_environment_memberships(input : Types::DescribeEnvironmentMembershipsRequest) : Types::DescribeEnvironmentMembershipsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENVIRONMENT_MEMBERSHIPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEnvironmentMembershipsResult, "DescribeEnvironmentMemberships")
      end

      # Gets status information for an Cloud9 development environment. Cloud9 is no longer available to new
      # customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def describe_environment_status(
        environment_id : String
      ) : Types::DescribeEnvironmentStatusResult
        input = Types::DescribeEnvironmentStatusRequest.new(environment_id: environment_id)
        describe_environment_status(input)
      end
      def describe_environment_status(input : Types::DescribeEnvironmentStatusRequest) : Types::DescribeEnvironmentStatusResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENVIRONMENT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEnvironmentStatusResult, "DescribeEnvironmentStatus")
      end

      # Gets information about Cloud9 development environments. Cloud9 is no longer available to new
      # customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def describe_environments(
        environment_ids : Array(String)
      ) : Types::DescribeEnvironmentsResult
        input = Types::DescribeEnvironmentsRequest.new(environment_ids: environment_ids)
        describe_environments(input)
      end
      def describe_environments(input : Types::DescribeEnvironmentsRequest) : Types::DescribeEnvironmentsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEnvironmentsResult, "DescribeEnvironments")
      end

      # Gets a list of Cloud9 development environment identifiers. Cloud9 is no longer available to new
      # customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      # Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to use the
      # service as normal. Learn more"
      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEnvironmentsResult
        input = Types::ListEnvironmentsRequest.new(max_results: max_results, next_token: next_token)
        list_environments(input)
      end
      def list_environments(input : Types::ListEnvironmentsRequest) : Types::ListEnvironmentsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEnvironmentsResult, "ListEnvironments")
      end

      # Gets a list of the tags associated with an Cloud9 development environment. Cloud9 is no longer
      # available to new customers. Existing customers of Cloud9 can continue to use the service as normal.
      # Learn more"
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

      # Adds tags to an Cloud9 development environment. Cloud9 is no longer available to new customers.
      # Existing customers of Cloud9 can continue to use the service as normal. Learn more" Tags that you
      # add to an Cloud9 environment by using this method will NOT be automatically propagated to underlying
      # resources.
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

      # Removes tags from an Cloud9 development environment. Cloud9 is no longer available to new customers.
      # Existing customers of Cloud9 can continue to use the service as normal. Learn more"
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

      # Changes the settings of an existing Cloud9 development environment. Cloud9 is no longer available to
      # new customers. Existing customers of Cloud9 can continue to use the service as normal. Learn more"
      def update_environment(
        environment_id : String,
        description : String? = nil,
        managed_credentials_action : String? = nil,
        name : String? = nil
      ) : Types::UpdateEnvironmentResult
        input = Types::UpdateEnvironmentRequest.new(environment_id: environment_id, description: description, managed_credentials_action: managed_credentials_action, name: name)
        update_environment(input)
      end
      def update_environment(input : Types::UpdateEnvironmentRequest) : Types::UpdateEnvironmentResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentResult, "UpdateEnvironment")
      end

      # Changes the settings of an existing environment member for an Cloud9 development environment. Cloud9
      # is no longer available to new customers. Existing customers of Cloud9 can continue to use the
      # service as normal. Learn more"
      def update_environment_membership(
        environment_id : String,
        permissions : String,
        user_arn : String
      ) : Types::UpdateEnvironmentMembershipResult
        input = Types::UpdateEnvironmentMembershipRequest.new(environment_id: environment_id, permissions: permissions, user_arn: user_arn)
        update_environment_membership(input)
      end
      def update_environment_membership(input : Types::UpdateEnvironmentMembershipRequest) : Types::UpdateEnvironmentMembershipResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENVIRONMENT_MEMBERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnvironmentMembershipResult, "UpdateEnvironmentMembership")
      end
    end
  end
end
