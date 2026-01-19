module AwsSdk
  module MediaStore
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

      # Creates a storage container to hold objects. A container is similar to a bucket in the Amazon S3
      # service.
      def create_container(
        container_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateContainerOutput
        input = Types::CreateContainerInput.new(container_name: container_name, tags: tags)
        create_container(input)
      end
      def create_container(input : Types::CreateContainerInput) : Types::CreateContainerOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTAINER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContainerOutput, "CreateContainer")
      end

      # Deletes the specified container. Before you make a DeleteContainer request, delete any objects in
      # the container or in any folders in the container. You can delete only empty containers.
      def delete_container(
        container_name : String
      ) : Types::DeleteContainerOutput
        input = Types::DeleteContainerInput.new(container_name: container_name)
        delete_container(input)
      end
      def delete_container(input : Types::DeleteContainerInput) : Types::DeleteContainerOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerOutput, "DeleteContainer")
      end

      # Deletes the access policy that is associated with the specified container.
      def delete_container_policy(
        container_name : String
      ) : Types::DeleteContainerPolicyOutput
        input = Types::DeleteContainerPolicyInput.new(container_name: container_name)
        delete_container_policy(input)
      end
      def delete_container_policy(input : Types::DeleteContainerPolicyInput) : Types::DeleteContainerPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTAINER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContainerPolicyOutput, "DeleteContainerPolicy")
      end

      # Deletes the cross-origin resource sharing (CORS) configuration information that is set for the
      # container. To use this operation, you must have permission to perform the
      # MediaStore:DeleteCorsPolicy action. The container owner has this permission by default and can grant
      # this permission to others.
      def delete_cors_policy(
        container_name : String
      ) : Types::DeleteCorsPolicyOutput
        input = Types::DeleteCorsPolicyInput.new(container_name: container_name)
        delete_cors_policy(input)
      end
      def delete_cors_policy(input : Types::DeleteCorsPolicyInput) : Types::DeleteCorsPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_CORS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCorsPolicyOutput, "DeleteCorsPolicy")
      end

      # Removes an object lifecycle policy from a container. It takes up to 20 minutes for the change to
      # take effect.
      def delete_lifecycle_policy(
        container_name : String
      ) : Types::DeleteLifecyclePolicyOutput
        input = Types::DeleteLifecyclePolicyInput.new(container_name: container_name)
        delete_lifecycle_policy(input)
      end
      def delete_lifecycle_policy(input : Types::DeleteLifecyclePolicyInput) : Types::DeleteLifecyclePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLifecyclePolicyOutput, "DeleteLifecyclePolicy")
      end

      # Deletes the metric policy that is associated with the specified container. If there is no metric
      # policy associated with the container, MediaStore doesn't send metrics to CloudWatch.
      def delete_metric_policy(
        container_name : String
      ) : Types::DeleteMetricPolicyOutput
        input = Types::DeleteMetricPolicyInput.new(container_name: container_name)
        delete_metric_policy(input)
      end
      def delete_metric_policy(input : Types::DeleteMetricPolicyInput) : Types::DeleteMetricPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_METRIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMetricPolicyOutput, "DeleteMetricPolicy")
      end

      # Retrieves the properties of the requested container. This request is commonly used to retrieve the
      # endpoint of a container. An endpoint is a value assigned by the service when a new container is
      # created. A container's endpoint does not change after it has been assigned. The DescribeContainer
      # request returns a single Container object based on ContainerName . To return all Container objects
      # that are associated with a specified AWS account, use ListContainers .
      def describe_container(
        container_name : String? = nil
      ) : Types::DescribeContainerOutput
        input = Types::DescribeContainerInput.new(container_name: container_name)
        describe_container(input)
      end
      def describe_container(input : Types::DescribeContainerInput) : Types::DescribeContainerOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTAINER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContainerOutput, "DescribeContainer")
      end

      # Retrieves the access policy for the specified container. For information about the data that is
      # included in an access policy, see the AWS Identity and Access Management User Guide .
      def get_container_policy(
        container_name : String
      ) : Types::GetContainerPolicyOutput
        input = Types::GetContainerPolicyInput.new(container_name: container_name)
        get_container_policy(input)
      end
      def get_container_policy(input : Types::GetContainerPolicyInput) : Types::GetContainerPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CONTAINER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContainerPolicyOutput, "GetContainerPolicy")
      end

      # Returns the cross-origin resource sharing (CORS) configuration information that is set for the
      # container. To use this operation, you must have permission to perform the MediaStore:GetCorsPolicy
      # action. By default, the container owner has this permission and can grant it to others.
      def get_cors_policy(
        container_name : String
      ) : Types::GetCorsPolicyOutput
        input = Types::GetCorsPolicyInput.new(container_name: container_name)
        get_cors_policy(input)
      end
      def get_cors_policy(input : Types::GetCorsPolicyInput) : Types::GetCorsPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CORS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCorsPolicyOutput, "GetCorsPolicy")
      end

      # Retrieves the object lifecycle policy that is assigned to a container.
      def get_lifecycle_policy(
        container_name : String
      ) : Types::GetLifecyclePolicyOutput
        input = Types::GetLifecyclePolicyInput.new(container_name: container_name)
        get_lifecycle_policy(input)
      end
      def get_lifecycle_policy(input : Types::GetLifecyclePolicyInput) : Types::GetLifecyclePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLifecyclePolicyOutput, "GetLifecyclePolicy")
      end

      # Returns the metric policy for the specified container.
      def get_metric_policy(
        container_name : String
      ) : Types::GetMetricPolicyOutput
        input = Types::GetMetricPolicyInput.new(container_name: container_name)
        get_metric_policy(input)
      end
      def get_metric_policy(input : Types::GetMetricPolicyInput) : Types::GetMetricPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_METRIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMetricPolicyOutput, "GetMetricPolicy")
      end

      # Lists the properties of all containers in AWS Elemental MediaStore. You can query to receive all the
      # containers in one response. Or you can include the MaxResults parameter to receive a limited number
      # of containers in each response. In this case, the response includes a token. To get the next set of
      # containers, send the command again, this time with the NextToken parameter (with the returned token
      # as its value). The next set of responses appears, with a token if there are still more containers to
      # receive. See also DescribeContainer , which gets the properties of one container.
      def list_containers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListContainersOutput
        input = Types::ListContainersInput.new(max_results: max_results, next_token: next_token)
        list_containers(input)
      end
      def list_containers(input : Types::ListContainersInput) : Types::ListContainersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTAINERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContainersOutput, "ListContainers")
      end

      # Returns a list of the tags assigned to the specified container.
      def list_tags_for_resource(
        resource : String
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource: resource)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Creates an access policy for the specified container to restrict the users and clients that can
      # access it. For information about the data that is included in an access policy, see the AWS Identity
      # and Access Management User Guide . For this release of the REST API, you can create only one policy
      # for a container. If you enter PutContainerPolicy twice, the second command modifies the existing
      # policy.
      def put_container_policy(
        container_name : String,
        policy : String
      ) : Types::PutContainerPolicyOutput
        input = Types::PutContainerPolicyInput.new(container_name: container_name, policy: policy)
        put_container_policy(input)
      end
      def put_container_policy(input : Types::PutContainerPolicyInput) : Types::PutContainerPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_CONTAINER_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutContainerPolicyOutput, "PutContainerPolicy")
      end

      # Sets the cross-origin resource sharing (CORS) configuration on a container so that the container can
      # service cross-origin requests. For example, you might want to enable a request whose origin is
      # http://www.example.com to access your AWS Elemental MediaStore container at my.example.container.com
      # by using the browser's XMLHttpRequest capability. To enable CORS on a container, you attach a CORS
      # policy to the container. In the CORS policy, you configure rules that identify origins and the HTTP
      # methods that can be executed on your container. The policy can contain up to 398,000 characters. You
      # can add up to 100 rules to a CORS policy. If more than one rule applies, the service uses the first
      # applicable rule listed. To learn more about CORS, see Cross-Origin Resource Sharing (CORS) in AWS
      # Elemental MediaStore .
      def put_cors_policy(
        container_name : String,
        cors_policy : Array(Types::CorsRule)
      ) : Types::PutCorsPolicyOutput
        input = Types::PutCorsPolicyInput.new(container_name: container_name, cors_policy: cors_policy)
        put_cors_policy(input)
      end
      def put_cors_policy(input : Types::PutCorsPolicyInput) : Types::PutCorsPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_CORS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutCorsPolicyOutput, "PutCorsPolicy")
      end

      # Writes an object lifecycle policy to a container. If the container already has an object lifecycle
      # policy, the service replaces the existing policy with the new policy. It takes up to 20 minutes for
      # the change to take effect. For information about how to construct an object lifecycle policy, see
      # Components of an Object Lifecycle Policy .
      def put_lifecycle_policy(
        container_name : String,
        lifecycle_policy : String
      ) : Types::PutLifecyclePolicyOutput
        input = Types::PutLifecyclePolicyInput.new(container_name: container_name, lifecycle_policy: lifecycle_policy)
        put_lifecycle_policy(input)
      end
      def put_lifecycle_policy(input : Types::PutLifecyclePolicyInput) : Types::PutLifecyclePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLifecyclePolicyOutput, "PutLifecyclePolicy")
      end

      # The metric policy that you want to add to the container. A metric policy allows AWS Elemental
      # MediaStore to send metrics to Amazon CloudWatch. It takes up to 20 minutes for the new policy to
      # take effect.
      def put_metric_policy(
        container_name : String,
        metric_policy : Types::MetricPolicy
      ) : Types::PutMetricPolicyOutput
        input = Types::PutMetricPolicyInput.new(container_name: container_name, metric_policy: metric_policy)
        put_metric_policy(input)
      end
      def put_metric_policy(input : Types::PutMetricPolicyInput) : Types::PutMetricPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_METRIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutMetricPolicyOutput, "PutMetricPolicy")
      end

      # Starts access logging on the specified container. When you enable access logging on a container,
      # MediaStore delivers access logs for objects stored in that container to Amazon CloudWatch Logs.
      def start_access_logging(
        container_name : String
      ) : Types::StartAccessLoggingOutput
        input = Types::StartAccessLoggingInput.new(container_name: container_name)
        start_access_logging(input)
      end
      def start_access_logging(input : Types::StartAccessLoggingInput) : Types::StartAccessLoggingOutput
        request = Protocol::JsonRpc.build_request(Model::START_ACCESS_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAccessLoggingOutput, "StartAccessLogging")
      end

      # Stops access logging on the specified container. When you stop access logging on a container,
      # MediaStore stops sending access logs to Amazon CloudWatch Logs. These access logs are not saved and
      # are not retrievable.
      def stop_access_logging(
        container_name : String
      ) : Types::StopAccessLoggingOutput
        input = Types::StopAccessLoggingInput.new(container_name: container_name)
        stop_access_logging(input)
      end
      def stop_access_logging(input : Types::StopAccessLoggingInput) : Types::StopAccessLoggingOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_ACCESS_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopAccessLoggingOutput, "StopAccessLogging")
      end

      # Adds tags to the specified AWS Elemental MediaStore container. Tags are key:value pairs that you can
      # associate with AWS resources. For example, the tag key might be "customer" and the tag value might
      # be "companyA." You can specify one or more tags to add to each container. You can add up to 50 tags
      # to each container. For more information about tagging, including naming and usage conventions, see
      # Tagging Resources in MediaStore .
      def tag_resource(
        resource : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource: resource, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Removes tags from the specified container. You can specify one or more tags to remove.
      def untag_resource(
        resource : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource: resource, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end
    end
  end
end
