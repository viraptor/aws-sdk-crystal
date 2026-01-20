module AwsSdk
  module AppConfigData
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

      # Retrieves the latest deployed configuration. This API may return empty configuration data if the
      # client already has the latest version. For more information about this API action and to view
      # example CLI commands that show how to use it with the StartConfigurationSession API action, see
      # Retrieving the configuration in the AppConfig User Guide . Note the following important information.
      # Each configuration token is only valid for one call to GetLatestConfiguration . The
      # GetLatestConfiguration response includes a NextPollConfigurationToken that should always replace the
      # token used for the just-completed call in preparation for the next one. GetLatestConfiguration is a
      # priced call. For more information, see Pricing .

      def get_latest_configuration(
        configuration_token : String
      ) : Protocol::Request
        input = Types::GetLatestConfigurationRequest.new(configuration_token: configuration_token)
        get_latest_configuration(input)
      end

      def get_latest_configuration(input : Types::GetLatestConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LATEST_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a configuration session used to retrieve a deployed configuration. For more information about
      # this API action and to view example CLI commands that show how to use it with the
      # GetLatestConfiguration API action, see Retrieving the configuration in the AppConfig User Guide .

      def start_configuration_session(
        application_identifier : String,
        configuration_profile_identifier : String,
        environment_identifier : String,
        required_minimum_poll_interval_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::StartConfigurationSessionRequest.new(application_identifier: application_identifier, configuration_profile_identifier: configuration_profile_identifier, environment_identifier: environment_identifier, required_minimum_poll_interval_in_seconds: required_minimum_poll_interval_in_seconds)
        start_configuration_session(input)
      end

      def start_configuration_session(input : Types::StartConfigurationSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONFIGURATION_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
