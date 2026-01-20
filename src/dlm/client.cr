module Aws
  module DLM
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

      # Creates an Amazon Data Lifecycle Manager lifecycle policy. Amazon Data Lifecycle Manager supports
      # the following policy types: Custom EBS snapshot policy Custom EBS-backed AMI policy Cross-account
      # copy event policy Default policy for EBS snapshots Default policy for EBS-backed AMIs For more
      # information, see Default policies vs custom policies . If you create a default policy, you can
      # specify the request parameters either in the request body, or in the PolicyDetails request
      # structure, but not both.

      def create_lifecycle_policy(
        description : String,
        execution_role_arn : String,
        state : String,
        copy_tags : Bool? = nil,
        create_interval : Int32? = nil,
        cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)? = nil,
        default_policy : String? = nil,
        exclusions : Types::Exclusions? = nil,
        extend_deletion : Bool? = nil,
        policy_details : Types::PolicyDetails? = nil,
        retain_interval : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLifecyclePolicyRequest.new(description: description, execution_role_arn: execution_role_arn, state: state, copy_tags: copy_tags, create_interval: create_interval, cross_region_copy_targets: cross_region_copy_targets, default_policy: default_policy, exclusions: exclusions, extend_deletion: extend_deletion, policy_details: policy_details, retain_interval: retain_interval, tags: tags)
        create_lifecycle_policy(input)
      end

      def create_lifecycle_policy(input : Types::CreateLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified lifecycle policy and halts the automated operations that the policy specified.
      # For more information about deleting a policy, see Delete lifecycle policies .

      def delete_lifecycle_policy(
        policy_id : String
      ) : Protocol::Request
        input = Types::DeleteLifecyclePolicyRequest.new(policy_id: policy_id)
        delete_lifecycle_policy(input)
      end

      def delete_lifecycle_policy(input : Types::DeleteLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets summary information about all or the specified data lifecycle policies. To get complete
      # information about a policy, use GetLifecyclePolicy .

      def get_lifecycle_policies(
        default_policy_type : String? = nil,
        policy_ids : Array(String)? = nil,
        resource_types : Array(String)? = nil,
        state : String? = nil,
        tags_to_add : Array(String)? = nil,
        target_tags : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetLifecyclePoliciesRequest.new(default_policy_type: default_policy_type, policy_ids: policy_ids, resource_types: resource_types, state: state, tags_to_add: tags_to_add, target_tags: target_tags)
        get_lifecycle_policies(input)
      end

      def get_lifecycle_policies(input : Types::GetLifecyclePoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIFECYCLE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets detailed information about the specified lifecycle policy.

      def get_lifecycle_policy(
        policy_id : String
      ) : Protocol::Request
        input = Types::GetLifecyclePolicyRequest.new(policy_id: policy_id)
        get_lifecycle_policy(input)
      end

      def get_lifecycle_policy(input : Types::GetLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.

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

      # Adds the specified tags to the specified resource.

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

      # Removes the specified tags from the specified resource.

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

      # Updates the specified lifecycle policy. For more information about updating a policy, see Modify
      # lifecycle policies .

      def update_lifecycle_policy(
        policy_id : String,
        copy_tags : Bool? = nil,
        create_interval : Int32? = nil,
        cross_region_copy_targets : Array(Types::CrossRegionCopyTarget)? = nil,
        description : String? = nil,
        exclusions : Types::Exclusions? = nil,
        execution_role_arn : String? = nil,
        extend_deletion : Bool? = nil,
        policy_details : Types::PolicyDetails? = nil,
        retain_interval : Int32? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLifecyclePolicyRequest.new(policy_id: policy_id, copy_tags: copy_tags, create_interval: create_interval, cross_region_copy_targets: cross_region_copy_targets, description: description, exclusions: exclusions, execution_role_arn: execution_role_arn, extend_deletion: extend_deletion, policy_details: policy_details, retain_interval: retain_interval, state: state)
        update_lifecycle_policy(input)
      end

      def update_lifecycle_policy(input : Types::UpdateLifecyclePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIFECYCLE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
