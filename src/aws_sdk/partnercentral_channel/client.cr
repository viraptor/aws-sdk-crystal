module AwsSdk
  module PartnerCentralChannel
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

      # Accepts a pending channel handshake request from another AWS account.
      def accept_channel_handshake(
        catalog : String,
        identifier : String
      ) : Types::AcceptChannelHandshakeResponse
        input = Types::AcceptChannelHandshakeRequest.new(catalog: catalog, identifier: identifier)
        accept_channel_handshake(input)
      end
      def accept_channel_handshake(input : Types::AcceptChannelHandshakeRequest) : Types::AcceptChannelHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_CHANNEL_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptChannelHandshakeResponse, "AcceptChannelHandshake")
      end

      # Cancels a pending channel handshake request.
      def cancel_channel_handshake(
        catalog : String,
        identifier : String
      ) : Types::CancelChannelHandshakeResponse
        input = Types::CancelChannelHandshakeRequest.new(catalog: catalog, identifier: identifier)
        cancel_channel_handshake(input)
      end
      def cancel_channel_handshake(input : Types::CancelChannelHandshakeRequest) : Types::CancelChannelHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CHANNEL_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelChannelHandshakeResponse, "CancelChannelHandshake")
      end

      # Creates a new channel handshake request to establish a partnership with another AWS account.
      def create_channel_handshake(
        associated_resource_identifier : String,
        catalog : String,
        handshake_type : String,
        client_token : String? = nil,
        payload : Types::ChannelHandshakePayload? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateChannelHandshakeResponse
        input = Types::CreateChannelHandshakeRequest.new(associated_resource_identifier: associated_resource_identifier, catalog: catalog, handshake_type: handshake_type, client_token: client_token, payload: payload, tags: tags)
        create_channel_handshake(input)
      end
      def create_channel_handshake(input : Types::CreateChannelHandshakeRequest) : Types::CreateChannelHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CHANNEL_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateChannelHandshakeResponse, "CreateChannelHandshake")
      end

      # Creates a new program management account for managing partner relationships.
      def create_program_management_account(
        account_id : String,
        catalog : String,
        display_name : String,
        program : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProgramManagementAccountResponse
        input = Types::CreateProgramManagementAccountRequest.new(account_id: account_id, catalog: catalog, display_name: display_name, program: program, client_token: client_token, tags: tags)
        create_program_management_account(input)
      end
      def create_program_management_account(input : Types::CreateProgramManagementAccountRequest) : Types::CreateProgramManagementAccountResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROGRAM_MANAGEMENT_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProgramManagementAccountResponse, "CreateProgramManagementAccount")
      end

      # Creates a new partner relationship between accounts.
      def create_relationship(
        associated_account_id : String,
        association_type : String,
        catalog : String,
        display_name : String,
        program_management_account_identifier : String,
        sector : String,
        client_token : String? = nil,
        requested_support_plan : Types::SupportPlan? = nil,
        resale_account_model : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRelationshipResponse
        input = Types::CreateRelationshipRequest.new(associated_account_id: associated_account_id, association_type: association_type, catalog: catalog, display_name: display_name, program_management_account_identifier: program_management_account_identifier, sector: sector, client_token: client_token, requested_support_plan: requested_support_plan, resale_account_model: resale_account_model, tags: tags)
        create_relationship(input)
      end
      def create_relationship(input : Types::CreateRelationshipRequest) : Types::CreateRelationshipResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RELATIONSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRelationshipResponse, "CreateRelationship")
      end

      # Deletes a program management account.
      def delete_program_management_account(
        catalog : String,
        identifier : String,
        client_token : String? = nil
      ) : Types::DeleteProgramManagementAccountResponse
        input = Types::DeleteProgramManagementAccountRequest.new(catalog: catalog, identifier: identifier, client_token: client_token)
        delete_program_management_account(input)
      end
      def delete_program_management_account(input : Types::DeleteProgramManagementAccountRequest) : Types::DeleteProgramManagementAccountResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROGRAM_MANAGEMENT_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProgramManagementAccountResponse, "DeleteProgramManagementAccount")
      end

      # Deletes a partner relationship.
      def delete_relationship(
        catalog : String,
        identifier : String,
        program_management_account_identifier : String,
        client_token : String? = nil
      ) : Types::DeleteRelationshipResponse
        input = Types::DeleteRelationshipRequest.new(catalog: catalog, identifier: identifier, program_management_account_identifier: program_management_account_identifier, client_token: client_token)
        delete_relationship(input)
      end
      def delete_relationship(input : Types::DeleteRelationshipRequest) : Types::DeleteRelationshipResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RELATIONSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRelationshipResponse, "DeleteRelationship")
      end

      # Retrieves details of a specific partner relationship.
      def get_relationship(
        catalog : String,
        identifier : String,
        program_management_account_identifier : String
      ) : Types::GetRelationshipResponse
        input = Types::GetRelationshipRequest.new(catalog: catalog, identifier: identifier, program_management_account_identifier: program_management_account_identifier)
        get_relationship(input)
      end
      def get_relationship(input : Types::GetRelationshipRequest) : Types::GetRelationshipResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RELATIONSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRelationshipResponse, "GetRelationship")
      end

      # Lists channel handshakes based on specified criteria.
      def list_channel_handshakes(
        catalog : String,
        handshake_type : String,
        participant_type : String,
        associated_resource_identifiers : Array(String)? = nil,
        handshake_type_filters : Types::ListChannelHandshakesTypeFilters? = nil,
        handshake_type_sort : Types::ListChannelHandshakesTypeSort? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        statuses : Array(String)? = nil
      ) : Types::ListChannelHandshakesResponse
        input = Types::ListChannelHandshakesRequest.new(catalog: catalog, handshake_type: handshake_type, participant_type: participant_type, associated_resource_identifiers: associated_resource_identifiers, handshake_type_filters: handshake_type_filters, handshake_type_sort: handshake_type_sort, max_results: max_results, next_token: next_token, statuses: statuses)
        list_channel_handshakes(input)
      end
      def list_channel_handshakes(input : Types::ListChannelHandshakesRequest) : Types::ListChannelHandshakesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CHANNEL_HANDSHAKES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListChannelHandshakesResponse, "ListChannelHandshakes")
      end

      # Lists program management accounts based on specified criteria.
      def list_program_management_accounts(
        catalog : String,
        account_ids : Array(String)? = nil,
        display_names : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        programs : Array(String)? = nil,
        sort : Types::ListProgramManagementAccountsSortBase? = nil,
        statuses : Array(String)? = nil
      ) : Types::ListProgramManagementAccountsResponse
        input = Types::ListProgramManagementAccountsRequest.new(catalog: catalog, account_ids: account_ids, display_names: display_names, max_results: max_results, next_token: next_token, programs: programs, sort: sort, statuses: statuses)
        list_program_management_accounts(input)
      end
      def list_program_management_accounts(input : Types::ListProgramManagementAccountsRequest) : Types::ListProgramManagementAccountsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROGRAM_MANAGEMENT_ACCOUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProgramManagementAccountsResponse, "ListProgramManagementAccounts")
      end

      # Lists partner relationships based on specified criteria.
      def list_relationships(
        catalog : String,
        associated_account_ids : Array(String)? = nil,
        association_types : Array(String)? = nil,
        display_names : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        program_management_account_identifiers : Array(String)? = nil,
        sort : Types::ListRelationshipsSortBase? = nil
      ) : Types::ListRelationshipsResponse
        input = Types::ListRelationshipsRequest.new(catalog: catalog, associated_account_ids: associated_account_ids, association_types: association_types, display_names: display_names, max_results: max_results, next_token: next_token, program_management_account_identifiers: program_management_account_identifiers, sort: sort)
        list_relationships(input)
      end
      def list_relationships(input : Types::ListRelationshipsRequest) : Types::ListRelationshipsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RELATIONSHIPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRelationshipsResponse, "ListRelationships")
      end

      # Lists tags associated with a specific resource.
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

      # Rejects a pending channel handshake request.
      def reject_channel_handshake(
        catalog : String,
        identifier : String
      ) : Types::RejectChannelHandshakeResponse
        input = Types::RejectChannelHandshakeRequest.new(catalog: catalog, identifier: identifier)
        reject_channel_handshake(input)
      end
      def reject_channel_handshake(input : Types::RejectChannelHandshakeRequest) : Types::RejectChannelHandshakeResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_CHANNEL_HANDSHAKE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectChannelHandshakeResponse, "RejectChannelHandshake")
      end

      # Adds or updates tags for a specified resource.
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

      # Removes tags from a specified resource.
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

      # Updates the properties of a program management account.
      def update_program_management_account(
        catalog : String,
        identifier : String,
        display_name : String? = nil,
        revision : String? = nil
      ) : Types::UpdateProgramManagementAccountResponse
        input = Types::UpdateProgramManagementAccountRequest.new(catalog: catalog, identifier: identifier, display_name: display_name, revision: revision)
        update_program_management_account(input)
      end
      def update_program_management_account(input : Types::UpdateProgramManagementAccountRequest) : Types::UpdateProgramManagementAccountResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROGRAM_MANAGEMENT_ACCOUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProgramManagementAccountResponse, "UpdateProgramManagementAccount")
      end

      # Updates the properties of a partner relationship.
      def update_relationship(
        catalog : String,
        identifier : String,
        program_management_account_identifier : String,
        display_name : String? = nil,
        requested_support_plan : Types::SupportPlan? = nil,
        revision : String? = nil
      ) : Types::UpdateRelationshipResponse
        input = Types::UpdateRelationshipRequest.new(catalog: catalog, identifier: identifier, program_management_account_identifier: program_management_account_identifier, display_name: display_name, requested_support_plan: requested_support_plan, revision: revision)
        update_relationship(input)
      end
      def update_relationship(input : Types::UpdateRelationshipRequest) : Types::UpdateRelationshipResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RELATIONSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRelationshipResponse, "UpdateRelationship")
      end
    end
  end
end
