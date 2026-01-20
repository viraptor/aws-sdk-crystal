module Aws
  module BedrockDataAutomationRuntime
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

      # API used to get data automation status.

      def get_data_automation_status(
        invocation_arn : String
      ) : Types::GetDataAutomationStatusResponse

        input = Types::GetDataAutomationStatusRequest.new(invocation_arn: invocation_arn)
        get_data_automation_status(input)
      end

      def get_data_automation_status(input : Types::GetDataAutomationStatusRequest) : Types::GetDataAutomationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DATA_AUTOMATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDataAutomationStatusResponse, "GetDataAutomationStatus")
      end

      # Sync API: Invoke data automation.

      def invoke_data_automation(
        data_automation_profile_arn : String,
        input_configuration : Types::SyncInputConfiguration,
        blueprints : Array(Types::Blueprint)? = nil,
        data_automation_configuration : Types::DataAutomationConfiguration? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil
      ) : Types::InvokeDataAutomationResponse

        input = Types::InvokeDataAutomationRequest.new(data_automation_profile_arn: data_automation_profile_arn, input_configuration: input_configuration, blueprints: blueprints, data_automation_configuration: data_automation_configuration, encryption_configuration: encryption_configuration)
        invoke_data_automation(input)
      end

      def invoke_data_automation(input : Types::InvokeDataAutomationRequest) : Types::InvokeDataAutomationResponse
        request = Protocol::JsonRpc.build_request(Model::INVOKE_DATA_AUTOMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InvokeDataAutomationResponse, "InvokeDataAutomation")
      end

      # Async API: Invoke data automation.

      def invoke_data_automation_async(
        data_automation_profile_arn : String,
        input_configuration : Types::InputConfiguration,
        output_configuration : Types::OutputConfiguration,
        blueprints : Array(Types::Blueprint)? = nil,
        client_token : String? = nil,
        data_automation_configuration : Types::DataAutomationConfiguration? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        notification_configuration : Types::NotificationConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::InvokeDataAutomationAsyncResponse

        input = Types::InvokeDataAutomationAsyncRequest.new(data_automation_profile_arn: data_automation_profile_arn, input_configuration: input_configuration, output_configuration: output_configuration, blueprints: blueprints, client_token: client_token, data_automation_configuration: data_automation_configuration, encryption_configuration: encryption_configuration, notification_configuration: notification_configuration, tags: tags)
        invoke_data_automation_async(input)
      end

      def invoke_data_automation_async(input : Types::InvokeDataAutomationAsyncRequest) : Types::InvokeDataAutomationAsyncResponse
        request = Protocol::JsonRpc.build_request(Model::INVOKE_DATA_AUTOMATION_ASYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::InvokeDataAutomationAsyncResponse, "InvokeDataAutomationAsync")
      end

      # List tags for an Amazon Bedrock Data Automation resource

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

      # Tag an Amazon Bedrock Data Automation resource

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

      # Untag an Amazon Bedrock Data Automation resource

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
    end
  end
end
