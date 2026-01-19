module AwsSdk
  module FinspaceData
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

      # Adds a user to a permission group to grant permissions for actions a user can perform in FinSpace.
      def associate_user_to_permission_group(
        permission_group_id : String,
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateUserToPermissionGroupRequest.new(permission_group_id: permission_group_id, user_id: user_id, client_token: client_token)
        associate_user_to_permission_group(input)
      end
      def associate_user_to_permission_group(input : Types::AssociateUserToPermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_USER_TO_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Changeset in a FinSpace Dataset.
      def create_changeset(
        change_type : String,
        dataset_id : String,
        format_params : Hash(String, String),
        source_params : Hash(String, String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateChangesetRequest.new(change_type: change_type, dataset_id: dataset_id, format_params: format_params, source_params: source_params, client_token: client_token)
        create_changeset(input)
      end
      def create_changeset(input : Types::CreateChangesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANGESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Dataview for a Dataset.
      def create_data_view(
        dataset_id : String,
        destination_type_params : Types::DataViewDestinationTypeParams,
        as_of_timestamp : Int64? = nil,
        auto_update : Bool? = nil,
        client_token : String? = nil,
        partition_columns : Array(String)? = nil,
        sort_columns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataViewRequest.new(dataset_id: dataset_id, destination_type_params: destination_type_params, as_of_timestamp: as_of_timestamp, auto_update: auto_update, client_token: client_token, partition_columns: partition_columns, sort_columns: sort_columns)
        create_data_view(input)
      end
      def create_data_view(input : Types::CreateDataViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new FinSpace Dataset.
      def create_dataset(
        dataset_title : String,
        kind : String,
        permission_group_params : Types::PermissionGroupParams,
        alias : String? = nil,
        client_token : String? = nil,
        dataset_description : String? = nil,
        owner_info : Types::DatasetOwnerInfo? = nil,
        schema_definition : Types::SchemaUnion? = nil
      ) : Protocol::Request
        input = Types::CreateDatasetRequest.new(dataset_title: dataset_title, kind: kind, permission_group_params: permission_group_params, alias: alias, client_token: client_token, dataset_description: dataset_description, owner_info: owner_info, schema_definition: schema_definition)
        create_dataset(input)
      end
      def create_dataset(input : Types::CreateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a group of permissions for various actions that a user can perform in FinSpace.
      def create_permission_group(
        application_permissions : Array(String),
        name : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreatePermissionGroupRequest.new(application_permissions: application_permissions, name: name, client_token: client_token, description: description)
        create_permission_group(input)
      end
      def create_permission_group(input : Types::CreatePermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new user in FinSpace.
      def create_user(
        email_address : String,
        type : String,
        api_access : String? = nil,
        api_access_principal_arn : String? = nil,
        client_token : String? = nil,
        first_name : String? = nil,
        last_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(email_address: email_address, type: type, api_access: api_access, api_access_principal_arn: api_access_principal_arn, client_token: client_token, first_name: first_name, last_name: last_name)
        create_user(input)
      end
      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a FinSpace Dataset.
      def delete_dataset(
        dataset_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDatasetRequest.new(dataset_id: dataset_id, client_token: client_token)
        delete_dataset(input)
      end
      def delete_dataset(input : Types::DeleteDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a permission group. This action is irreversible.
      def delete_permission_group(
        permission_group_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeletePermissionGroupRequest.new(permission_group_id: permission_group_id, client_token: client_token)
        delete_permission_group(input)
      end
      def delete_permission_group(input : Types::DeletePermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Denies access to the FinSpace web application and API for the specified user.
      def disable_user(
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisableUserRequest.new(user_id: user_id, client_token: client_token)
        disable_user(input)
      end
      def disable_user(input : Types::DisableUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a user from a permission group.
      def disassociate_user_from_permission_group(
        permission_group_id : String,
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateUserFromPermissionGroupRequest.new(permission_group_id: permission_group_id, user_id: user_id, client_token: client_token)
        disassociate_user_from_permission_group(input)
      end
      def disassociate_user_from_permission_group(input : Types::DisassociateUserFromPermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_USER_FROM_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows the specified user to access the FinSpace web application and API.
      def enable_user(
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::EnableUserRequest.new(user_id: user_id, client_token: client_token)
        enable_user(input)
      end
      def enable_user(input : Types::EnableUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a Changeset.
      def get_changeset(
        changeset_id : String,
        dataset_id : String
      ) : Protocol::Request
        input = Types::GetChangesetRequest.new(changeset_id: changeset_id, dataset_id: dataset_id)
        get_changeset(input)
      end
      def get_changeset(input : Types::GetChangesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANGESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Dataview.
      def get_data_view(
        data_view_id : String,
        dataset_id : String
      ) : Protocol::Request
        input = Types::GetDataViewRequest.new(data_view_id: data_view_id, dataset_id: dataset_id)
        get_data_view(input)
      end
      def get_data_view(input : Types::GetDataViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a Dataset.
      def get_dataset(
        dataset_id : String
      ) : Protocol::Request
        input = Types::GetDatasetRequest.new(dataset_id: dataset_id)
        get_dataset(input)
      end
      def get_dataset(input : Types::GetDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the credentials to access the external Dataview from an S3 location. To call this API: You
      # must retrieve the programmatic credentials. You must be a member of a FinSpace user group, where the
      # dataset that you want to access has Read Dataset Data permissions.
      def get_external_data_view_access_details(
        data_view_id : String,
        dataset_id : String
      ) : Protocol::Request
        input = Types::GetExternalDataViewAccessDetailsRequest.new(data_view_id: data_view_id, dataset_id: dataset_id)
        get_external_data_view_access_details(input)
      end
      def get_external_data_view_access_details(input : Types::GetExternalDataViewAccessDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXTERNAL_DATA_VIEW_ACCESS_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific permission group.
      def get_permission_group(
        permission_group_id : String
      ) : Protocol::Request
        input = Types::GetPermissionGroupRequest.new(permission_group_id: permission_group_id)
        get_permission_group(input)
      end
      def get_permission_group(input : Types::GetPermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Request programmatic credentials to use with FinSpace SDK. For more information, see Step 2. Access
      # credentials programmatically using IAM access key id and secret access key .
      def get_programmatic_access_credentials(
        environment_id : String,
        duration_in_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::GetProgrammaticAccessCredentialsRequest.new(environment_id: environment_id, duration_in_minutes: duration_in_minutes)
        get_programmatic_access_credentials(input)
      end
      def get_programmatic_access_credentials(input : Types::GetProgrammaticAccessCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROGRAMMATIC_ACCESS_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details for a specific user.
      def get_user(
        user_id : String
      ) : Protocol::Request
        input = Types::GetUserRequest.new(user_id: user_id)
        get_user(input)
      end
      def get_user(input : Types::GetUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A temporary Amazon S3 location, where you can copy your files from a source location to stage or use
      # as a scratch space in FinSpace notebook.
      def get_working_location(
        location_type : String? = nil
      ) : Protocol::Request
        input = Types::GetWorkingLocationRequest.new(location_type: location_type)
        get_working_location(input)
      end
      def get_working_location(input : Types::GetWorkingLocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKING_LOCATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the FinSpace Changesets for a Dataset.
      def list_changesets(
        dataset_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChangesetsRequest.new(dataset_id: dataset_id, max_results: max_results, next_token: next_token)
        list_changesets(input)
      end
      def list_changesets(input : Types::ListChangesetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANGESETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available Dataviews for a Dataset.
      def list_data_views(
        dataset_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataViewsRequest.new(dataset_id: dataset_id, max_results: max_results, next_token: next_token)
        list_data_views(input)
      end
      def list_data_views(input : Types::ListDataViewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the active Datasets that a user has access to.
      def list_datasets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatasetsRequest.new(max_results: max_results, next_token: next_token)
        list_datasets(input)
      end
      def list_datasets(input : Types::ListDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available permission groups in FinSpace.
      def list_permission_groups(
        max_results : Int32,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_permission_groups(input)
      end
      def list_permission_groups(input : Types::ListPermissionGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSION_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the permission groups that are associated with a specific user.
      def list_permission_groups_by_user(
        max_results : Int32,
        user_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionGroupsByUserRequest.new(max_results: max_results, user_id: user_id, next_token: next_token)
        list_permission_groups_by_user(input)
      end
      def list_permission_groups_by_user(input : Types::ListPermissionGroupsByUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSION_GROUPS_BY_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available users in FinSpace.
      def list_users(
        max_results : Int32,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(max_results: max_results, next_token: next_token)
        list_users(input)
      end
      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details of all the users in a specific permission group.
      def list_users_by_permission_group(
        max_results : Int32,
        permission_group_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersByPermissionGroupRequest.new(max_results: max_results, permission_group_id: permission_group_id, next_token: next_token)
        list_users_by_permission_group(input)
      end
      def list_users_by_permission_group(input : Types::ListUsersByPermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS_BY_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets the password for a specified user ID and generates a temporary one. Only a superuser can
      # reset password for other users. Resetting the password immediately invalidates the previous password
      # associated with the user.
      def reset_user_password(
        user_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ResetUserPasswordRequest.new(user_id: user_id, client_token: client_token)
        reset_user_password(input)
      end
      def reset_user_password(input : Types::ResetUserPasswordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_USER_PASSWORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a FinSpace Changeset.
      def update_changeset(
        changeset_id : String,
        dataset_id : String,
        format_params : Hash(String, String),
        source_params : Hash(String, String),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateChangesetRequest.new(changeset_id: changeset_id, dataset_id: dataset_id, format_params: format_params, source_params: source_params, client_token: client_token)
        update_changeset(input)
      end
      def update_changeset(input : Types::UpdateChangesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANGESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a FinSpace Dataset.
      def update_dataset(
        dataset_id : String,
        dataset_title : String,
        kind : String,
        alias : String? = nil,
        client_token : String? = nil,
        dataset_description : String? = nil,
        schema_definition : Types::SchemaUnion? = nil
      ) : Protocol::Request
        input = Types::UpdateDatasetRequest.new(dataset_id: dataset_id, dataset_title: dataset_title, kind: kind, alias: alias, client_token: client_token, dataset_description: dataset_description, schema_definition: schema_definition)
        update_dataset(input)
      end
      def update_dataset(input : Types::UpdateDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the details of a permission group. You cannot modify a permissionGroupID .
      def update_permission_group(
        permission_group_id : String,
        application_permissions : Array(String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePermissionGroupRequest.new(permission_group_id: permission_group_id, application_permissions: application_permissions, client_token: client_token, description: description, name: name)
        update_permission_group(input)
      end
      def update_permission_group(input : Types::UpdatePermissionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PERMISSION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the details of the specified user. You cannot update the userId for a user.
      def update_user(
        user_id : String,
        api_access : String? = nil,
        api_access_principal_arn : String? = nil,
        client_token : String? = nil,
        first_name : String? = nil,
        last_name : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(user_id: user_id, api_access: api_access, api_access_principal_arn: api_access_principal_arn, client_token: client_token, first_name: first_name, last_name: last_name, type: type)
        update_user(input)
      end
      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
