module AwsSdk
  module Repostspace
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

      # Add role to multiple users or groups in a private re:Post channel.
      def batch_add_channel_role_to_accessors(
        accessor_ids : Array(String),
        channel_id : String,
        channel_role : String,
        space_id : String
      ) : Protocol::Request
        input = Types::BatchAddChannelRoleToAccessorsInput.new(accessor_ids: accessor_ids, channel_id: channel_id, channel_role: channel_role, space_id: space_id)
        batch_add_channel_role_to_accessors(input)
      end
      def batch_add_channel_role_to_accessors(input : Types::BatchAddChannelRoleToAccessorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ADD_CHANNEL_ROLE_TO_ACCESSORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add a role to multiple users or groups in a private re:Post.
      def batch_add_role(
        accessor_ids : Array(String),
        role : String,
        space_id : String
      ) : Protocol::Request
        input = Types::BatchAddRoleInput.new(accessor_ids: accessor_ids, role: role, space_id: space_id)
        batch_add_role(input)
      end
      def batch_add_role(input : Types::BatchAddRoleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ADD_ROLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove a role from multiple users or groups in a private re:Post channel.
      def batch_remove_channel_role_from_accessors(
        accessor_ids : Array(String),
        channel_id : String,
        channel_role : String,
        space_id : String
      ) : Protocol::Request
        input = Types::BatchRemoveChannelRoleFromAccessorsInput.new(accessor_ids: accessor_ids, channel_id: channel_id, channel_role: channel_role, space_id: space_id)
        batch_remove_channel_role_from_accessors(input)
      end
      def batch_remove_channel_role_from_accessors(input : Types::BatchRemoveChannelRoleFromAccessorsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_REMOVE_CHANNEL_ROLE_FROM_ACCESSORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove a role from multiple users or groups in a private re:Post.
      def batch_remove_role(
        accessor_ids : Array(String),
        role : String,
        space_id : String
      ) : Protocol::Request
        input = Types::BatchRemoveRoleInput.new(accessor_ids: accessor_ids, role: role, space_id: space_id)
        batch_remove_role(input)
      end
      def batch_remove_role(input : Types::BatchRemoveRoleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_REMOVE_ROLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a channel in an AWS re:Post Private private re:Post.
      def create_channel(
        channel_name : String,
        space_id : String,
        channel_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateChannelInput.new(channel_name: channel_name, space_id: space_id, channel_description: channel_description)
        create_channel(input)
      end
      def create_channel(input : Types::CreateChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an AWS re:Post Private private re:Post.
      def create_space(
        name : String,
        subdomain : String,
        tier : String,
        description : String? = nil,
        role_arn : String? = nil,
        supported_email_domains : Types::SupportedEmailDomainsParameters? = nil,
        tags : Hash(String, String)? = nil,
        user_kms_key : String? = nil
      ) : Protocol::Request
        input = Types::CreateSpaceInput.new(name: name, subdomain: subdomain, tier: tier, description: description, role_arn: role_arn, supported_email_domains: supported_email_domains, tags: tags, user_kms_key: user_kms_key)
        create_space(input)
      end
      def create_space(input : Types::CreateSpaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an AWS re:Post Private private re:Post.
      def delete_space(
        space_id : String
      ) : Protocol::Request
        input = Types::DeleteSpaceInput.new(space_id: space_id)
        delete_space(input)
      end
      def delete_space(input : Types::DeleteSpaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the user or group from the list of administrators of the private re:Post.
      def deregister_admin(
        admin_id : String,
        space_id : String
      ) : Protocol::Request
        input = Types::DeregisterAdminInput.new(admin_id: admin_id, space_id: space_id)
        deregister_admin(input)
      end
      def deregister_admin(input : Types::DeregisterAdminInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_ADMIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays information about a channel in a private re:Post.
      def get_channel(
        channel_id : String,
        space_id : String
      ) : Protocol::Request
        input = Types::GetChannelInput.new(channel_id: channel_id, space_id: space_id)
        get_channel(input)
      end
      def get_channel(input : Types::GetChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays information about the AWS re:Post Private private re:Post.
      def get_space(
        space_id : String
      ) : Protocol::Request
        input = Types::GetSpaceInput.new(space_id: space_id)
        get_space(input)
      end
      def get_space(input : Types::GetSpaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of channel within a private re:Post with some information about each channel.
      def list_channels(
        space_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelsInput.new(space_id: space_id, max_results: max_results, next_token: next_token)
        list_channels(input)
      end
      def list_channels(input : Types::ListChannelsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of AWS re:Post Private private re:Posts in the account with some information about
      # each private re:Post.
      def list_spaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSpacesInput.new(max_results: max_results, next_token: next_token)
        list_spaces(input)
      end
      def list_spaces(input : Types::ListSpacesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the tags that are associated with the AWS re:Post Private resource specified by the
      # resourceArn. The only resource that can be tagged is a private re:Post.
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

      # Adds a user or group to the list of administrators of the private re:Post.
      def register_admin(
        admin_id : String,
        space_id : String
      ) : Protocol::Request
        input = Types::RegisterAdminInput.new(admin_id: admin_id, space_id: space_id)
        register_admin(input)
      end
      def register_admin(input : Types::RegisterAdminInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_ADMIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an invitation email to selected users and groups.
      def send_invites(
        accessor_ids : Array(String),
        body : String,
        space_id : String,
        title : String
      ) : Protocol::Request
        input = Types::SendInvitesInput.new(accessor_ids: accessor_ids, body: body, space_id: space_id, title: title)
        send_invites(input)
      end
      def send_invites(input : Types::SendInvitesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_INVITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates tags with an AWS re:Post Private resource. Currently, the only resource that can be
      # tagged is the private re:Post. If you specify a new tag key for the resource, the tag is appended to
      # the list of tags that are associated with the resource. If you specify a tag key that’s already
      # associated with the resource, the new tag value that you specify replaces the previous value for
      # that tag.
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

      # Removes the association of the tag with the AWS re:Post Private resource.
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

      # Modifies an existing channel.
      def update_channel(
        channel_id : String,
        channel_name : String,
        space_id : String,
        channel_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelInput.new(channel_id: channel_id, channel_name: channel_name, space_id: space_id, channel_description: channel_description)
        update_channel(input)
      end
      def update_channel(input : Types::UpdateChannelInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies an existing AWS re:Post Private private re:Post.
      def update_space(
        space_id : String,
        description : String? = nil,
        role_arn : String? = nil,
        supported_email_domains : Types::SupportedEmailDomainsParameters? = nil,
        tier : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSpaceInput.new(space_id: space_id, description: description, role_arn: role_arn, supported_email_domains: supported_email_domains, tier: tier)
        update_space(input)
      end
      def update_space(input : Types::UpdateSpaceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
