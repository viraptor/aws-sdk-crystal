module Aws
  module EC2InstanceConnect
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

      # Pushes an SSH public key to the specified EC2 instance for use by the specified user. The key
      # remains for 60 seconds. For more information, see Connect to your Linux instance using EC2 Instance
      # Connect in the Amazon EC2 User Guide .

      def send_ssh_public_key(
        instance_id : String,
        instance_os_user : String,
        ssh_public_key : String,
        availability_zone : String? = nil
      ) : Types::SendSSHPublicKeyResponse

        input = Types::SendSSHPublicKeyRequest.new(instance_id: instance_id, instance_os_user: instance_os_user, ssh_public_key: ssh_public_key, availability_zone: availability_zone)
        send_ssh_public_key(input)
      end

      def send_ssh_public_key(input : Types::SendSSHPublicKeyRequest) : Types::SendSSHPublicKeyResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendSSHPublicKeyResponse, "SendSSHPublicKey")
      end

      # Pushes an SSH public key to the specified EC2 instance. The key remains for 60 seconds, which gives
      # you 60 seconds to establish a serial console connection to the instance using SSH. For more
      # information, see EC2 Serial Console in the Amazon EC2 User Guide .

      def send_serial_console_ssh_public_key(
        instance_id : String,
        ssh_public_key : String,
        serial_port : Int32? = nil
      ) : Types::SendSerialConsoleSSHPublicKeyResponse

        input = Types::SendSerialConsoleSSHPublicKeyRequest.new(instance_id: instance_id, ssh_public_key: ssh_public_key, serial_port: serial_port)
        send_serial_console_ssh_public_key(input)
      end

      def send_serial_console_ssh_public_key(input : Types::SendSerialConsoleSSHPublicKeyRequest) : Types::SendSerialConsoleSSHPublicKeyResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_SERIAL_CONSOLE_SSH_PUBLIC_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendSerialConsoleSSHPublicKeyResponse, "SendSerialConsoleSSHPublicKey")
      end
    end
  end
end
