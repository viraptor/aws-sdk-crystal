module Aws
  module MarketplaceCatalog
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

      # Returns metadata and content for multiple entities. This is the Batch version of the DescribeEntity
      # API and uses the same IAM permission action as DescribeEntity API.

      def batch_describe_entities(
        entity_request_list : Array(Types::EntityRequest)
      ) : Protocol::Request
        input = Types::BatchDescribeEntitiesRequest.new(entity_request_list: entity_request_list)
        batch_describe_entities(input)
      end

      def batch_describe_entities(input : Types::BatchDescribeEntitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DESCRIBE_ENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to cancel an open change request. Must be sent before the status of the request changes to
      # APPLYING , the final stage of completing your change request. You can describe a change during the
      # 60-day request history retention period for API calls.

      def cancel_change_set(
        catalog : String,
        change_set_id : String
      ) : Protocol::Request
        input = Types::CancelChangeSetRequest.new(catalog: catalog, change_set_id: change_set_id)
        cancel_change_set(input)
      end

      def cancel_change_set(input : Types::CancelChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource-based policy on an entity that is identified by its resource ARN.

      def delete_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about a given change set.

      def describe_change_set(
        catalog : String,
        change_set_id : String
      ) : Protocol::Request
        input = Types::DescribeChangeSetRequest.new(catalog: catalog, change_set_id: change_set_id)
        describe_change_set(input)
      end

      def describe_change_set(input : Types::DescribeChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the metadata and content of the entity.

      def describe_entity(
        catalog : String,
        entity_id : String
      ) : Protocol::Request
        input = Types::DescribeEntityRequest.new(catalog: catalog, entity_id: entity_id)
        describe_entity(input)
      end

      def describe_entity(input : Types::DescribeEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a resource-based policy of an entity that is identified by its resource ARN.

      def get_resource_policy(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of change sets owned by the account being used to make the call. You can filter
      # this list by providing any combination of entityId , ChangeSetName , and status. If you provide more
      # than one filter, the API operation applies a logical AND between the filters. You can describe a
      # change during the 60-day request history retention period for API calls.

      def list_change_sets(
        catalog : String,
        filter_list : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::Sort? = nil
      ) : Protocol::Request
        input = Types::ListChangeSetsRequest.new(catalog: catalog, filter_list: filter_list, max_results: max_results, next_token: next_token, sort: sort)
        list_change_sets(input)
      end

      def list_change_sets(input : Types::ListChangeSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANGE_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the list of entities of a given type.

      def list_entities(
        catalog : String,
        entity_type : String,
        entity_type_filters : Types::EntityTypeFilters? = nil,
        entity_type_sort : Types::EntityTypeSort? = nil,
        filter_list : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        ownership_type : String? = nil,
        sort : Types::Sort? = nil
      ) : Protocol::Request
        input = Types::ListEntitiesRequest.new(catalog: catalog, entity_type: entity_type, entity_type_filters: entity_type_filters, entity_type_sort: entity_type_sort, filter_list: filter_list, max_results: max_results, next_token: next_token, ownership_type: ownership_type, sort: sort)
        list_entities(input)
      end

      def list_entities(input : Types::ListEntitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags that have been added to a resource (either an entity or change set ).

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

      # Attaches a resource-based policy to an entity. Examples of an entity include: AmiProduct and
      # ContainerProduct .

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to request changes for your entities. Within a single ChangeSet , you can't start the
      # same change type against the same entity multiple times. Additionally, when a ChangeSet is running,
      # all the entities targeted by the different changes are locked until the change set has completed
      # (either succeeded, cancelled, or failed). If you try to start a change set containing a change
      # against an entity that is already locked, you will receive a ResourceInUseException error. For
      # example, you can't start the ChangeSet described in the example later in this topic because it
      # contains two changes to run the same change type ( AddRevisions ) against the same entity (
      # entity-id@1 ). For more information about working with change sets, see Working with change sets .
      # For information about change types for single-AMI products, see Working with single-AMI products .
      # Also, for more information about change types available for container-based products, see Working
      # with container products . To download "DetailsDocument" shapes, see Python and Java shapes on
      # GitHub.

      def start_change_set(
        catalog : String,
        change_set : Array(Types::Change),
        change_set_name : String? = nil,
        change_set_tags : Array(Types::Tag)? = nil,
        client_request_token : String? = nil,
        intent : String? = nil
      ) : Protocol::Request
        input = Types::StartChangeSetRequest.new(catalog: catalog, change_set: change_set, change_set_name: change_set_name, change_set_tags: change_set_tags, client_request_token: client_request_token, intent: intent)
        start_change_set(input)
      end

      def start_change_set(input : Types::StartChangeSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource (either an entity or change set ).

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

      # Removes a tag or list of tags from a resource (either an entity or change set ).

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
