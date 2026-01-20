module Aws
  module Rbin
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

      # Creates a Recycle Bin retention rule. You can create two types of retention rules: Tag-level
      # retention rules - These retention rules use resource tags to identify the resources to protect. For
      # each retention rule, you specify one or more tag key and value pairs. Resources (of the specified
      # type) that have at least one of these tag key and value pairs are automatically retained in the
      # Recycle Bin upon deletion. Use this type of retention rule to protect specific resources in your
      # account based on their tags. Region-level retention rules - These retention rules, by default, apply
      # to all of the resources (of the specified type) in the Region, even if the resources are not tagged.
      # However, you can specify exclusion tags to exclude resources that have specific tags. Use this type
      # of retention rule to protect all resources of a specific type in a Region. For more information, see
      # Create Recycle Bin retention rules in the Amazon EBS User Guide .

      def create_rule(
        resource_type : String,
        retention_period : Types::RetentionPeriod,
        description : String? = nil,
        exclude_resource_tags : Array(Types::ResourceTag)? = nil,
        lock_configuration : Types::LockConfiguration? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateRuleRequest.new(resource_type: resource_type, retention_period: retention_period, description: description, exclude_resource_tags: exclude_resource_tags, lock_configuration: lock_configuration, resource_tags: resource_tags, tags: tags)
        create_rule(input)
      end

      def create_rule(input : Types::CreateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Recycle Bin retention rule. For more information, see Delete Recycle Bin retention rules
      # in the Amazon Elastic Compute Cloud User Guide .

      def delete_rule(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteRuleRequest.new(identifier: identifier)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Recycle Bin retention rule.

      def get_rule(
        identifier : String
      ) : Protocol::Request
        input = Types::GetRuleRequest.new(identifier: identifier)
        get_rule(input)
      end

      def get_rule(input : Types::GetRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Recycle Bin retention rules in the Region.

      def list_rules(
        resource_type : String,
        exclude_resource_tags : Array(Types::ResourceTag)? = nil,
        lock_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil
      ) : Protocol::Request
        input = Types::ListRulesRequest.new(resource_type: resource_type, exclude_resource_tags: exclude_resource_tags, lock_state: lock_state, max_results: max_results, next_token: next_token, resource_tags: resource_tags)
        list_rules(input)
      end

      def list_rules(input : Types::ListRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to a retention rule.

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

      # Locks a Region-level retention rule. A locked retention rule can't be modified or deleted. You can't
      # lock tag-level retention rules, or Region-level retention rules that have exclusion tags.

      def lock_rule(
        identifier : String,
        lock_configuration : Types::LockConfiguration
      ) : Protocol::Request
        input = Types::LockRuleRequest.new(identifier: identifier, lock_configuration: lock_configuration)
        lock_rule(input)
      end

      def lock_rule(input : Types::LockRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LOCK_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns tags to the specified retention rule.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unlocks a retention rule. After a retention rule is unlocked, it can be modified or deleted only
      # after the unlock delay period expires.

      def unlock_rule(
        identifier : String
      ) : Protocol::Request
        input = Types::UnlockRuleRequest.new(identifier: identifier)
        unlock_rule(input)
      end

      def unlock_rule(input : Types::UnlockRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNLOCK_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unassigns a tag from a retention rule.

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

      # Updates an existing Recycle Bin retention rule. You can update a retention rule's description,
      # resource tags, and retention period at any time after creation. You can't update a retention rule's
      # resource type after creation. For more information, see Update Recycle Bin retention rules in the
      # Amazon Elastic Compute Cloud User Guide .

      def update_rule(
        identifier : String,
        description : String? = nil,
        exclude_resource_tags : Array(Types::ResourceTag)? = nil,
        resource_tags : Array(Types::ResourceTag)? = nil,
        resource_type : String? = nil,
        retention_period : Types::RetentionPeriod? = nil
      ) : Protocol::Request
        input = Types::UpdateRuleRequest.new(identifier: identifier, description: description, exclude_resource_tags: exclude_resource_tags, resource_tags: resource_tags, resource_type: resource_type, retention_period: retention_period)
        update_rule(input)
      end

      def update_rule(input : Types::UpdateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
