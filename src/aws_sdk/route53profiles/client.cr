module AwsSdk
  module Route53Profiles
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

      # Associates a Route 53 Profiles profile with a VPC. A VPC can have only one Profile associated with
      # it, but a Profile can be associated with 1000 of VPCs (and you can request a higher quota). For more
      # information, see
      # https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html#limits-api-entities .

      def associate_profile(
        name : String,
        profile_id : String,
        resource_id : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::AssociateProfileRequest.new(name: name, profile_id: profile_id, resource_id: resource_id, tags: tags)
        associate_profile(input)
      end

      def associate_profile(input : Types::AssociateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a DNS reource configuration to a Route 53 Profile.

      def associate_resource_to_profile(
        name : String,
        profile_id : String,
        resource_arn : String,
        resource_properties : String? = nil
      ) : Protocol::Request
        input = Types::AssociateResourceToProfileRequest.new(name: name, profile_id: profile_id, resource_arn: resource_arn, resource_properties: resource_properties)
        associate_resource_to_profile(input)
      end

      def associate_resource_to_profile(input : Types::AssociateResourceToProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_RESOURCE_TO_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an empty Route 53 Profile.

      def create_profile(
        client_token : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateProfileRequest.new(client_token: client_token, name: name, tags: tags)
        create_profile(input)
      end

      def create_profile(input : Types::CreateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Route 53 Profile. Before you can delete a profile, you must first disassociate
      # it from all VPCs.

      def delete_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::DeleteProfileRequest.new(profile_id: profile_id)
        delete_profile(input)
      end

      def delete_profile(input : Types::DeleteProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Dissociates a specified Route 53 Profile from the specified VPC.

      def disassociate_profile(
        profile_id : String,
        resource_id : String
      ) : Protocol::Request
        input = Types::DisassociateProfileRequest.new(profile_id: profile_id, resource_id: resource_id)
        disassociate_profile(input)
      end

      def disassociate_profile(input : Types::DisassociateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Dissoaciated a specified resource, from the Route 53 Profile.

      def disassociate_resource_from_profile(
        profile_id : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::DisassociateResourceFromProfileRequest.new(profile_id: profile_id, resource_arn: resource_arn)
        disassociate_resource_from_profile(input)
      end

      def disassociate_resource_from_profile(input : Types::DisassociateResourceFromProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RESOURCE_FROM_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified Route 53 Profile, such as whether whether the Profile is
      # shared, and the current status of the Profile.

      def get_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::GetProfileRequest.new(profile_id: profile_id)
        get_profile(input)
      end

      def get_profile(input : Types::GetProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a Route 53 Profile association for a VPC. A VPC can have only one Profile association, but
      # a Profile can be associated with up to 5000 VPCs.

      def get_profile_association(
        profile_association_id : String
      ) : Protocol::Request
        input = Types::GetProfileAssociationRequest.new(profile_association_id: profile_association_id)
        get_profile_association(input)
      end

      def get_profile_association(input : Types::GetProfileAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified Route 53 Profile resource association.

      def get_profile_resource_association(
        profile_resource_association_id : String
      ) : Protocol::Request
        input = Types::GetProfileResourceAssociationRequest.new(profile_resource_association_id: profile_resource_association_id)
        get_profile_resource_association(input)
      end

      def get_profile_resource_association(input : Types::GetProfileResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the VPCs that the specified Route 53 Profile is associated with.

      def list_profile_associations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_id : String? = nil,
        resource_id : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileAssociationsRequest.new(max_results: max_results, next_token: next_token, profile_id: profile_id, resource_id: resource_id)
        list_profile_associations(input)
      end

      def list_profile_associations(input : Types::ListProfileAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the resource associations for the specified Route 53 Profile.

      def list_profile_resource_associations(
        profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileResourceAssociationsRequest.new(profile_id: profile_id, max_results: max_results, next_token: next_token, resource_type: resource_type)
        list_profile_resource_associations(input)
      end

      def list_profile_resource_associations(input : Types::ListProfileResourceAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_RESOURCE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Route 53 Profiles associated with your Amazon Web Services account.

      def list_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_profiles(input)
      end

      def list_profiles(input : Types::ListProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags that you associated with the specified resource.

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

      # Adds one or more tags to a specified resource.

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

      # Removes one or more tags from a specified resource.

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

      # Updates the specified Route 53 Profile resourse association.

      def update_profile_resource_association(
        profile_resource_association_id : String,
        name : String? = nil,
        resource_properties : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProfileResourceAssociationRequest.new(profile_resource_association_id: profile_resource_association_id, name: name, resource_properties: resource_properties)
        update_profile_resource_association(input)
      end

      def update_profile_resource_association(input : Types::UpdateProfileResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILE_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
