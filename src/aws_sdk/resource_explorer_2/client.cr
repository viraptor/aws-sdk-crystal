module AwsSdk
  module ResourceExplorer2
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

      # Sets the specified view as the default for the Amazon Web Services Region in which you call this
      # operation. When a user performs a Search that doesn't explicitly specify which view to use, then
      # Amazon Web Services Resource Explorer automatically chooses this default view for searches performed
      # in this Amazon Web Services Region. If an Amazon Web Services Region doesn't have a default view
      # configured, then users must explicitly specify a view with every Search operation performed in that
      # Region.
      def associate_default_view(
        view_arn : String
      ) : Protocol::Request
        input = Types::AssociateDefaultViewInput.new(view_arn: view_arn)
        associate_default_view(input)
      end
      def associate_default_view(input : Types::AssociateDefaultViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_DEFAULT_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a list of views.
      def batch_get_view(
        view_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchGetViewInput.new(view_arns: view_arns)
        batch_get_view(input)
      end
      def batch_get_view(input : Types::BatchGetViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Turns on Amazon Web Services Resource Explorer in the Amazon Web Services Region in which you called
      # this operation by creating an index. Resource Explorer begins discovering the resources in this
      # Region and stores the details about the resources in the index so that they can be queried by using
      # the Search operation. You can create only one index in a Region. This operation creates only a local
      # index. To promote the local index in one Amazon Web Services Region into the aggregator index for
      # the Amazon Web Services account, use the UpdateIndexType operation. For more information, see
      # Turning on cross-Region search by creating an aggregator index in the Amazon Web Services Resource
      # Explorer User Guide . For more details about what happens when you turn on Resource Explorer in an
      # Amazon Web Services Region, see Turn on Resource Explorer to index your resources in an Amazon Web
      # Services Region in the Amazon Web Services Resource Explorer User Guide . If this is the first
      # Amazon Web Services Region in which you've created an index for Resource Explorer, then this
      # operation also creates a service-linked role in your Amazon Web Services account that allows
      # Resource Explorer to enumerate your resources to populate the index. Action :
      # resource-explorer-2:CreateIndex Resource : The ARN of the index (as it will exist after the
      # operation completes) in the Amazon Web Services Region and account in which you're trying to create
      # the index. Use the wildcard character ( * ) at the end of the string to match the eventual UUID. For
      # example, the following Resource element restricts the role or user to creating an index in only the
      # us-east-2 Region of the specified account. "Resource": "arn:aws:resource-explorer-2:us-west-2:
      # &lt;account-id&gt; :index/*" Alternatively, you can use "Resource": "*" to allow the role or user to
      # create an index in any Region. Action : iam:CreateServiceLinkedRole Resource : No specific resource
      # (*). This permission is required only the first time you create an index to turn on Resource
      # Explorer in the account. Resource Explorer uses this to create the service-linked role needed to
      # index the resources in your account . Resource Explorer uses the same service-linked role for all
      # additional indexes you create afterwards.
      def create_index(
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIndexInput.new(client_token: client_token, tags: tags)
        create_index(input)
      end
      def create_index(input : Types::CreateIndexInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Resource Explorer setup configuration across multiple Amazon Web Services Regions. This
      # operation sets up indexes and views in the specified Regions. This operation can also be used to set
      # an aggregator Region for cross-Region resource search.
      def create_resource_explorer_setup(
        region_list : Array(String),
        view_name : String,
        aggregator_regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceExplorerSetupInput.new(region_list: region_list, view_name: view_name, aggregator_regions: aggregator_regions)
        create_resource_explorer_setup(input)
      end
      def create_resource_explorer_setup(input : Types::CreateResourceExplorerSetupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_EXPLORER_SETUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a view that users can query by using the Search operation. Results from queries that you
      # make using this view include only resources that match the view's Filters . For more information
      # about Amazon Web Services Resource Explorer views, see Managing views in the Amazon Web Services
      # Resource Explorer User Guide . Only the principals with an IAM identity-based policy that grants
      # Allow to the Search action on a Resource with the Amazon resource name (ARN) of this view can Search
      # using views you create with this operation.
      def create_view(
        view_name : String,
        client_token : String? = nil,
        filters : Types::SearchFilter? = nil,
        included_properties : Array(Types::IncludedProperty)? = nil,
        scope : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateViewInput.new(view_name: view_name, client_token: client_token, filters: filters, included_properties: included_properties, scope: scope, tags: tags)
        create_view(input)
      end
      def create_view(input : Types::CreateViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified index and turns off Amazon Web Services Resource Explorer in the specified
      # Amazon Web Services Region. When you delete an index, Resource Explorer stops discovering and
      # indexing resources in that Region. Resource Explorer also deletes all views in that Region. These
      # actions occur as asynchronous background tasks. You can check to see when the actions are complete
      # by using the GetIndex operation and checking the Status response value. If the index you delete is
      # the aggregator index for the Amazon Web Services account, you must wait 24 hours before you can
      # promote another local index to be the aggregator index for the account. Users can't perform
      # account-wide searches using Resource Explorer until another aggregator index is configured.
      def delete_index(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteIndexInput.new(arn: arn)
        delete_index(input)
      end
      def delete_index(input : Types::DeleteIndexInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Resource Explorer setup configuration. This operation removes indexes and views from the
      # specified Regions or all Regions where Resource Explorer is configured.
      def delete_resource_explorer_setup(
        delete_in_all_regions : Bool? = nil,
        region_list : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DeleteResourceExplorerSetupInput.new(delete_in_all_regions: delete_in_all_regions, region_list: region_list)
        delete_resource_explorer_setup(input)
      end
      def delete_resource_explorer_setup(input : Types::DeleteResourceExplorerSetupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_EXPLORER_SETUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified view. If the specified view is the default view for its Amazon Web Services
      # Region, then all Search operations in that Region must explicitly specify the view to use until you
      # configure a new default by calling the AssociateDefaultView operation.
      def delete_view(
        view_arn : String
      ) : Protocol::Request
        input = Types::DeleteViewInput.new(view_arn: view_arn)
        delete_view(input)
      end
      def delete_view(input : Types::DeleteViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # After you call this operation, the affected Amazon Web Services Region no longer has a default view.
      # All Search operations in that Region must explicitly specify a view or the operation fails. You can
      # configure a new default by calling the AssociateDefaultView operation. If an Amazon Web Services
      # Region doesn't have a default view configured, then users must explicitly specify a view with every
      # Search operation performed in that Region.
      def disassociate_default_view : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_DEFAULT_VIEW, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of your account's Amazon Web Services service access, and validates the service
      # linked role required to access the multi-account search feature. Only the management account can
      # invoke this API call.
      def get_account_level_service_configuration : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_LEVEL_SERVICE_CONFIGURATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the Amazon Resource Name (ARN) of the view that is the default for the Amazon Web Services
      # Region in which you call this operation. You can then call GetView to retrieve the details of that
      # view.
      def get_default_view : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEFAULT_VIEW, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about the Amazon Web Services Resource Explorer index in the Amazon Web Services
      # Region in which you invoked the operation.
      def get_index : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INDEX, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of the specified Amazon Web Services-managed view .
      def get_managed_view(
        managed_view_arn : String
      ) : Protocol::Request
        input = Types::GetManagedViewInput.new(managed_view_arn: managed_view_arn)
        get_managed_view(input)
      end
      def get_managed_view(input : Types::GetManagedViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status and details of a Resource Explorer setup operation. This operation returns
      # information about the progress of creating or deleting Resource Explorer configurations across
      # Regions.
      def get_resource_explorer_setup(
        task_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetResourceExplorerSetupInput.new(task_id: task_id, max_results: max_results, next_token: next_token)
        get_resource_explorer_setup(input)
      end
      def get_resource_explorer_setup(input : Types::GetResourceExplorerSetupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_EXPLORER_SETUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the Resource Explorer index in the current Amazon Web Services Region.
      # This operation returns the ARN and type of the index if one exists.
      def get_service_index : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_INDEX, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a specific Resource Explorer service view. This operation returns the
      # configuration and properties of the specified view.
      def get_service_view(
        service_view_arn : String
      ) : Protocol::Request
        input = Types::GetServiceViewInput.new(service_view_arn: service_view_arn)
        get_service_view(input)
      end
      def get_service_view(input : Types::GetServiceViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of the specified view.
      def get_view(
        view_arn : String
      ) : Protocol::Request
        input = Types::GetViewInput.new(view_arn: view_arn)
        get_view(input)
      end
      def get_view(input : Types::GetViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all of the indexes in Amazon Web Services Regions that are currently collecting
      # resource information for Amazon Web Services Resource Explorer.
      def list_indexes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        regions : Array(String)? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListIndexesInput.new(max_results: max_results, next_token: next_token, regions: regions, type: type)
        list_indexes(input)
      end
      def list_indexes(input : Types::ListIndexesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDEXES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of a member's indexes in all Amazon Web Services Regions that are currently
      # collecting resource information for Amazon Web Services Resource Explorer. Only the management
      # account or a delegated administrator with service access enabled can invoke this API call.
      def list_indexes_for_members(
        account_id_list : Array(String),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIndexesForMembersInput.new(account_id_list: account_id_list, max_results: max_results, next_token: next_token)
        list_indexes_for_members(input)
      end
      def list_indexes_for_members(input : Types::ListIndexesForMembersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDEXES_FOR_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon resource names (ARNs) of the Amazon Web Services-managed views available in the
      # Amazon Web Services Region in which you call this operation.
      def list_managed_views(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_principal : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedViewsInput.new(max_results: max_results, next_token: next_token, service_principal: service_principal)
        list_managed_views(input)
      end
      def list_managed_views(input : Types::ListManagedViewsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of resources and their details that match the specified criteria. This query must use
      # a view. If you don’t explicitly specify a view, then Resource Explorer uses the default view for the
      # Amazon Web Services Region in which you call this operation.
      def list_resources(
        filters : Types::SearchFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        view_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcesInput.new(filters: filters, max_results: max_results, next_token: next_token, view_arn: view_arn)
        list_resources(input)
      end
      def list_resources(input : Types::ListResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Resource Explorer indexes across the specified Amazon Web Services Regions. This operation
      # returns information about indexes including their ARNs, types, and Regions.
      def list_service_indexes(
        max_results : Int32? = nil,
        next_token : String? = nil,
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListServiceIndexesInput.new(max_results: max_results, next_token: next_token, regions: regions)
        list_service_indexes(input)
      end
      def list_service_indexes(input : Types::ListServiceIndexesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_INDEXES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Resource Explorer service views available in the current Amazon Web Services account. This
      # operation returns the ARNs of available service views.
      def list_service_views(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceViewsInput.new(max_results: max_results, next_token: next_token)
        list_service_views(input)
      end
      def list_service_views(input : Types::ListServiceViewsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Amazon Web Services services that have been granted streaming access to your
      # Resource Explorer data. Streaming access allows Amazon Web Services services to receive real-time
      # updates about your resources as they are indexed by Resource Explorer.
      def list_streaming_access_for_services(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamingAccessForServicesInput.new(max_results: max_results, next_token: next_token)
        list_streaming_access_for_services(input)
      end
      def list_streaming_access_for_services(input : Types::ListStreamingAccessForServicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAMING_ACCESS_FOR_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all resource types currently supported by Amazon Web Services Resource Explorer.
      def list_supported_resource_types(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSupportedResourceTypesInput.new(max_results: max_results, next_token: next_token)
        list_supported_resource_types(input)
      end
      def list_supported_resource_types(input : Types::ListSupportedResourceTypesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUPPORTED_RESOURCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags that are attached to the specified resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon resource names (ARNs) of the views available in the Amazon Web Services Region in
      # which you call this operation. Always check the NextToken response parameter for a null value when
      # calling a paginated operation. These operations can occasionally return an empty set of results even
      # when there are more results available. The NextToken response parameter value is null only when
      # there are no more results to display.
      def list_views(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListViewsInput.new(max_results: max_results, next_token: next_token)
        list_views(input)
      end
      def list_views(input : Types::ListViewsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for resources and displays details about all resources that match the specified criteria.
      # You must specify a query string. All search queries must use a view. If you don't explicitly specify
      # a view, then Amazon Web Services Resource Explorer uses the default view for the Amazon Web Services
      # Region in which you call this operation. The results are the logical intersection of the results
      # that match both the QueryString parameter supplied to this operation and the SearchFilter parameter
      # attached to the view. For the complete syntax supported by the QueryString parameter, see Search
      # query syntax reference for Resource Explorer . If your search results are empty, or are missing
      # results that you think should be there, see Troubleshooting Resource Explorer search .
      def search(
        query_string : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        view_arn : String? = nil
      ) : Protocol::Request
        input = Types::SearchInput.new(query_string: query_string, max_results: max_results, next_token: next_token, view_arn: view_arn)
        search(input)
      end
      def search(input : Types::SearchInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tag key and value pairs to an Amazon Web Services Resource Explorer view or index.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tag key and value pairs from an Amazon Web Services Resource Explorer view or
      # index.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the type of the index from one of the following types to the other. For more information
      # about indexes and the role they perform in Amazon Web Services Resource Explorer, see Turning on
      # cross-Region search by creating an aggregator index in the Amazon Web Services Resource Explorer
      # User Guide . AGGREGATOR index type The index contains information about resources from all Amazon
      # Web Services Regions in the Amazon Web Services account in which you've created a Resource Explorer
      # index. Resource information from all other Regions is replicated to this Region's index. When you
      # change the index type to AGGREGATOR , Resource Explorer turns on replication of all discovered
      # resource information from the other Amazon Web Services Regions in your account to this index. You
      # can then, from this Region only, perform resource search queries that span all Amazon Web Services
      # Regions in the Amazon Web Services account. Turning on replication from all other Regions is
      # performed by asynchronous background tasks. You can check the status of the asynchronous tasks by
      # using the GetIndex operation. When the asynchronous tasks complete, the Status response of that
      # operation changes from UPDATING to ACTIVE . After that, you can start to see results from other
      # Amazon Web Services Regions in query results. However, it can take several hours for replication
      # from all other Regions to complete. You can have only one aggregator index per Amazon Web Services
      # account. Before you can promote a different index to be the aggregator index for the account, you
      # must first demote the existing aggregator index to type LOCAL . LOCAL index type The index contains
      # information about resources in only the Amazon Web Services Region in which the index exists. If an
      # aggregator index in another Region exists, then information in this local index is replicated to the
      # aggregator index. When you change the index type to LOCAL , Resource Explorer turns off the
      # replication of resource information from all other Amazon Web Services Regions in the Amazon Web
      # Services account to this Region. The aggregator index remains in the UPDATING state until all
      # replication with other Regions successfully stops. You can check the status of the asynchronous task
      # by using the GetIndex operation. When Resource Explorer successfully stops all replication with
      # other Regions, the Status response of that operation changes from UPDATING to ACTIVE . Separately,
      # the resource information from other Regions that was previously stored in the index is deleted
      # within 30 days by another background task. Until that asynchronous task completes, some results from
      # other Regions can continue to appear in search results. After you demote an aggregator index to a
      # local index, you must wait 24 hours before you can promote another index to be the new aggregator
      # index for the account.
      def update_index_type(
        arn : String,
        type : String
      ) : Protocol::Request
        input = Types::UpdateIndexTypeInput.new(arn: arn, type: type)
        update_index_type(input)
      end
      def update_index_type(input : Types::UpdateIndexTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INDEX_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies some of the details of a view. You can change the filter string and the list of included
      # properties. You can't change the name of the view.
      def update_view(
        view_arn : String,
        filters : Types::SearchFilter? = nil,
        included_properties : Array(Types::IncludedProperty)? = nil
      ) : Protocol::Request
        input = Types::UpdateViewInput.new(view_arn: view_arn, filters: filters, included_properties: included_properties)
        update_view(input)
      end
      def update_view(input : Types::UpdateViewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
