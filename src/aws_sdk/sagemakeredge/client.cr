module AwsSdk
  module SagemakerEdge
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

      # Use to get the active deployments from a device.

      def get_deployments(
        device_fleet_name : String,
        device_name : String
      ) : Protocol::Request
        input = Types::GetDeploymentsRequest.new(device_fleet_name: device_fleet_name, device_name: device_name)
        get_deployments(input)
      end

      def get_deployments(input : Types::GetDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use to check if a device is registered with SageMaker Edge Manager.

      def get_device_registration(
        device_fleet_name : String,
        device_name : String
      ) : Protocol::Request
        input = Types::GetDeviceRegistrationRequest.new(device_fleet_name: device_fleet_name, device_name: device_name)
        get_device_registration(input)
      end

      def get_device_registration(input : Types::GetDeviceRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEVICE_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use to get the current status of devices registered on SageMaker Edge Manager.

      def send_heartbeat(
        agent_version : String,
        device_fleet_name : String,
        device_name : String,
        agent_metrics : Array(Types::EdgeMetric)? = nil,
        deployment_result : Types::DeploymentResult? = nil,
        models : Array(Types::Model)? = nil
      ) : Protocol::Request
        input = Types::SendHeartbeatRequest.new(agent_version: agent_version, device_fleet_name: device_fleet_name, device_name: device_name, agent_metrics: agent_metrics, deployment_result: deployment_result, models: models)
        send_heartbeat(input)
      end

      def send_heartbeat(input : Types::SendHeartbeatRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_HEARTBEAT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
