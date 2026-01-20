module Aws
  module ResourceGroups
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

      # Cancels the specified tag-sync task. Minimum permissions To run this command, you must have the
      # following permissions: resource-groups:CancelTagSyncTask on the application group
      # resource-groups:DeleteGroup

      def cancel_tag_sync_task(
        task_arn : String
      ) : Protocol::Request
        input = Types::CancelTagSyncTaskInput.new(task_arn: task_arn)
        cancel_tag_sync_task(input)
      end

      def cancel_tag_sync_task(input : Types::CancelTagSyncTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TAG_SYNC_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resource group with the specified name and description. You can optionally include either
      # a resource query or a service configuration. For more information about constructing a resource
      # query, see Build queries and groups in Resource Groups in the Resource Groups User Guide . For more
      # information about service-linked groups and service configurations, see Service configurations for
      # Resource Groups . Minimum permissions To run this command, you must have the following permissions:
      # resource-groups:CreateGroup

      def create_group(
        name : String,
        configuration : Array(Types::GroupConfigurationItem)? = nil,
        criticality : Int32? = nil,
        description : String? = nil,
        display_name : String? = nil,
        owner : String? = nil,
        resource_query : Types::ResourceQuery? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGroupInput.new(name: name, configuration: configuration, criticality: criticality, description: description, display_name: display_name, owner: owner, resource_query: resource_query, tags: tags)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified resource group. Deleting a resource group does not delete any resources that
      # are members of the group; it only deletes the group structure. Minimum permissions To run this
      # command, you must have the following permissions: resource-groups:DeleteGroup

      def delete_group(
        group : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGroupInput.new(group: group, group_name: group_name)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current status of optional features in Resource Groups.


      def get_account_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified resource group. Minimum permissions To run this command, you
      # must have the following permissions: resource-groups:GetGroup

      def get_group(
        group : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupInput.new(group: group, group_name: group_name)
        get_group(input)
      end

      def get_group(input : Types::GetGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the service configuration associated with the specified resource group. For details about
      # the service configuration syntax, see Service configurations for Resource Groups . Minimum
      # permissions To run this command, you must have the following permissions:
      # resource-groups:GetGroupConfiguration

      def get_group_configuration(
        group : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupConfigurationInput.new(group: group)
        get_group_configuration(input)
      end

      def get_group_configuration(input : Types::GetGroupConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource query associated with the specified resource group. For more information
      # about resource queries, see Create a tag-based group in Resource Groups . Minimum permissions To run
      # this command, you must have the following permissions: resource-groups:GetGroupQuery

      def get_group_query(
        group : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::GetGroupQueryInput.new(group: group, group_name: group_name)
        get_group_query(input)
      end

      def get_group_query(input : Types::GetGroupQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specified tag-sync task. Minimum permissions To run this command, you
      # must have the following permissions: resource-groups:GetTagSyncTask on the application group

      def get_tag_sync_task(
        task_arn : String
      ) : Protocol::Request
        input = Types::GetTagSyncTaskInput.new(task_arn: task_arn)
        get_tag_sync_task(input)
      end

      def get_tag_sync_task(input : Types::GetTagSyncTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAG_SYNC_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags that are associated with a resource group, specified by an Amazon resource
      # name (ARN). Minimum permissions To run this command, you must have the following permissions:
      # resource-groups:GetTags

      def get_tags(
        arn : String
      ) : Protocol::Request
        input = Types::GetTagsInput.new(arn: arn)
        get_tags(input)
      end

      def get_tags(input : Types::GetTagsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified resources to the specified group. You can only use this operation with the
      # following groups: AWS::EC2::HostManagement AWS::EC2::CapacityReservationPool
      # AWS::ResourceGroups::ApplicationGroup Other resource group types and resource types are not
      # currently supported by this operation. Minimum permissions To run this command, you must have the
      # following permissions: resource-groups:GroupResources

      def group_resources(
        group : String,
        resource_arns : Array(String)
      ) : Protocol::Request
        input = Types::GroupResourcesInput.new(group: group, resource_arns: resource_arns)
        group_resources(input)
      end

      def group_resources(input : Types::GroupResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GROUP_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Amazon resource names (ARNs) of the resources that are members of a specified
      # resource group. Minimum permissions To run this command, you must have the following permissions:
      # resource-groups:ListGroupResources cloudformation:DescribeStacks cloudformation:ListStackResources
      # tag:GetResources

      def list_group_resources(
        filters : Array(Types::ResourceFilter)? = nil,
        group : String? = nil,
        group_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupResourcesInput.new(filters: filters, group: group, group_name: group_name, max_results: max_results, next_token: next_token)
        list_group_resources(input)
      end

      def list_group_resources(input : Types::ListGroupResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of the last grouping or ungrouping action for each resource in the specified
      # application group.

      def list_grouping_statuses(
        group : String,
        filters : Array(Types::ListGroupingStatusesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupingStatusesInput.new(group: group, filters: filters, max_results: max_results, next_token: next_token)
        list_grouping_statuses(input)
      end

      def list_grouping_statuses(input : Types::ListGroupingStatusesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPING_STATUSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing Resource Groups in your account. Minimum permissions To run this command,
      # you must have the following permissions: resource-groups:ListGroups

      def list_groups(
        filters : Array(Types::GroupFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tag-sync tasks. Minimum permissions To run this command, you must have the
      # following permissions: resource-groups:ListTagSyncTasks with the group passed in the filters as the
      # resource or * if using no filters

      def list_tag_sync_tasks(
        filters : Array(Types::ListTagSyncTasksFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagSyncTasksInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_tag_sync_tasks(input)
      end

      def list_tag_sync_tasks(input : Types::ListTagSyncTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAG_SYNC_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a service configuration to the specified group. This occurs asynchronously, and can take
      # time to complete. You can use GetGroupConfiguration to check the status of the update. Minimum
      # permissions To run this command, you must have the following permissions:
      # resource-groups:PutGroupConfiguration

      def put_group_configuration(
        configuration : Array(Types::GroupConfigurationItem)? = nil,
        group : String? = nil
      ) : Protocol::Request
        input = Types::PutGroupConfigurationInput.new(configuration: configuration, group: group)
        put_group_configuration(input)
      end

      def put_group_configuration(input : Types::PutGroupConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GROUP_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Amazon Web Services resource identifiers that matches the specified query. The
      # query uses the same format as a resource query in a CreateGroup or UpdateGroupQuery operation.
      # Minimum permissions To run this command, you must have the following permissions:
      # resource-groups:SearchResources cloudformation:DescribeStacks cloudformation:ListStackResources
      # tag:GetResources

      def search_resources(
        resource_query : Types::ResourceQuery,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchResourcesInput.new(resource_query: resource_query, max_results: max_results, next_token: next_token)
        search_resources(input)
      end

      def search_resources(input : Types::SearchResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new tag-sync task to onboard and sync resources tagged with a specific tag key-value pair
      # to an application. To start a tag-sync task, you need a resource tagging role . The resource tagging
      # role grants permissions to tag and untag applications resources and must include a trust policy that
      # allows Resource Groups to assume the role and perform resource tagging tasks on your behalf. For
      # instructions on creating a tag-sync task, see Create a tag-sync using the Resource Groups API in the
      # Amazon Web Services Service Catalog AppRegistry Administrator Guide . Minimum permissions To run
      # this command, you must have the following permissions: resource-groups:StartTagSyncTask on the
      # application group resource-groups:CreateGroup iam:PassRole on the role provided in the request

      def start_tag_sync_task(
        group : String,
        role_arn : String,
        resource_query : Types::ResourceQuery? = nil,
        tag_key : String? = nil,
        tag_value : String? = nil
      ) : Protocol::Request
        input = Types::StartTagSyncTaskInput.new(group: group, role_arn: role_arn, resource_query: resource_query, tag_key: tag_key, tag_value: tag_value)
        start_tag_sync_task(input)
      end

      def start_tag_sync_task(input : Types::StartTagSyncTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TAG_SYNC_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a resource group with the specified Amazon resource name (ARN). Existing tags on a
      # resource group are not changed if they are not specified in the request parameters. Do not store
      # personally identifiable information (PII) or other confidential or sensitive information in tags. We
      # use tags to provide you with billing and administration services. Tags are not intended to be used
      # for private or sensitive data. Minimum permissions To run this command, you must have the following
      # permissions: resource-groups:Tag

      def tag(
        arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagInput.new(arn: arn, tags: tags)
        tag(input)
      end

      def tag(input : Types::TagInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified resources from the specified group. This operation works only with static
      # groups that you populated using the GroupResources operation. It doesn't work with any resource
      # groups that are automatically populated by tag-based or CloudFormation stack-based queries. Minimum
      # permissions To run this command, you must have the following permissions:
      # resource-groups:UngroupResources

      def ungroup_resources(
        group : String,
        resource_arns : Array(String)
      ) : Protocol::Request
        input = Types::UngroupResourcesInput.new(group: group, resource_arns: resource_arns)
        ungroup_resources(input)
      end

      def ungroup_resources(input : Types::UngroupResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNGROUP_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes tags from a specified resource group. Minimum permissions To run this command, you must have
      # the following permissions: resource-groups:Untag

      def untag(
        arn : String,
        keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagInput.new(arn: arn, keys: keys)
        untag(input)
      end

      def untag(input : Types::UntagInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Turns on or turns off optional features in Resource Groups. The preceding example shows that the
      # request to turn on group lifecycle events is IN_PROGRESS . You can call the GetAccountSettings
      # operation to check for completion by looking for GroupLifecycleEventsStatus to change to ACTIVE .

      def update_account_settings(
        group_lifecycle_events_desired_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountSettingsInput.new(group_lifecycle_events_desired_status: group_lifecycle_events_desired_status)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description for an existing group. You cannot update the name of a resource group.
      # Minimum permissions To run this command, you must have the following permissions:
      # resource-groups:UpdateGroup

      def update_group(
        criticality : Int32? = nil,
        description : String? = nil,
        display_name : String? = nil,
        group : String? = nil,
        group_name : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupInput.new(criticality: criticality, description: description, display_name: display_name, group: group, group_name: group_name, owner: owner)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resource query of a group. For more information about resource queries, see Create a
      # tag-based group in Resource Groups . Minimum permissions To run this command, you must have the
      # following permissions: resource-groups:UpdateGroupQuery

      def update_group_query(
        resource_query : Types::ResourceQuery,
        group : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupQueryInput.new(resource_query: resource_query, group: group, group_name: group_name)
        update_group_query(input)
      end

      def update_group_query(input : Types::UpdateGroupQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
