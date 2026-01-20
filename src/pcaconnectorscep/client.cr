module Aws
  module PcaConnectorScep
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

      # For general-purpose connectors. Creates a challenge password for the specified connector. The SCEP
      # protocol uses a challenge password to authenticate a request before issuing a certificate from a
      # certificate authority (CA). Your SCEP clients include the challenge password as part of their
      # certificate request to Connector for SCEP. To retrieve the connector Amazon Resource Names (ARNs)
      # for the connectors in your account, call ListConnectors . To create additional challenge passwords
      # for the connector, call CreateChallenge again. We recommend frequently rotating your challenge
      # passwords.

      def create_challenge(
        connector_arn : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChallengeRequest.new(connector_arn: connector_arn, client_token: client_token, tags: tags)
        create_challenge(input)
      end

      def create_challenge(input : Types::CreateChallengeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHALLENGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a SCEP connector. A SCEP connector links Amazon Web Services Private Certificate Authority
      # to your SCEP-compatible devices and mobile device management (MDM) systems. Before you create a
      # connector, you must complete a set of prerequisites, including creation of a private certificate
      # authority (CA) to use with this connector. For more information, see Connector for SCEP
      # prerequisites .

      def create_connector(
        certificate_authority_arn : String,
        client_token : String? = nil,
        mobile_device_management : Types::MobileDeviceManagement? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorRequest.new(certificate_authority_arn: certificate_authority_arn, client_token: client_token, mobile_device_management: mobile_device_management, tags: tags)
        create_connector(input)
      end

      def create_connector(input : Types::CreateConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Challenge .

      def delete_challenge(
        challenge_arn : String
      ) : Protocol::Request
        input = Types::DeleteChallengeRequest.new(challenge_arn: challenge_arn)
        delete_challenge(input)
      end

      def delete_challenge(input : Types::DeleteChallengeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHALLENGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Connector . This operation also deletes any challenges associated with the
      # connector.

      def delete_connector(
        connector_arn : String
      ) : Protocol::Request
        input = Types::DeleteConnectorRequest.new(connector_arn: connector_arn)
        delete_connector(input)
      end

      def delete_connector(input : Types::DeleteConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata for the specified Challenge .

      def get_challenge_metadata(
        challenge_arn : String
      ) : Protocol::Request
        input = Types::GetChallengeMetadataRequest.new(challenge_arn: challenge_arn)
        get_challenge_metadata(input)
      end

      def get_challenge_metadata(input : Types::GetChallengeMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHALLENGE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the challenge password for the specified Challenge .

      def get_challenge_password(
        challenge_arn : String
      ) : Protocol::Request
        input = Types::GetChallengePasswordRequest.new(challenge_arn: challenge_arn)
        get_challenge_password(input)
      end

      def get_challenge_password(input : Types::GetChallengePasswordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHALLENGE_PASSWORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about the specified Connector . Calling this action returns important details
      # about the connector, such as the public SCEP URL where your clients can request certificates.

      def get_connector(
        connector_arn : String
      ) : Protocol::Request
        input = Types::GetConnectorRequest.new(connector_arn: connector_arn)
        get_connector(input)
      end

      def get_connector(input : Types::GetConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the challenge metadata for the specified ARN.

      def list_challenge_metadata(
        connector_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChallengeMetadataRequest.new(connector_arn: connector_arn, max_results: max_results, next_token: next_token)
        list_challenge_metadata(input)
      end

      def list_challenge_metadata(input : Types::ListChallengeMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHALLENGE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the connectors belonging to your Amazon Web Services account.

      def list_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tags associated with the specified resource. Tags are key-value pairs that you can use
      # to categorize and manage your resources, for purposes like billing. For example, you might set the
      # tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to
      # add to each Amazon Web Services resource, up to 50 tags for a resource.

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

      # Adds one or more tags to your resource.

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

      # Removes one or more tags from your resource.

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
