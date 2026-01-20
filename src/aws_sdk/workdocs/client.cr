module AwsSdk
  module WorkDocs
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

      # Aborts the upload of the specified document version that was previously initiated by
      # InitiateDocumentVersionUpload . The client should make this call only when it no longer intends to
      # upload the document version, or fails to do so.

      def abort_document_version_upload(
        document_id : String,
        version_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::AbortDocumentVersionUploadRequest.new(document_id: document_id, version_id: version_id, authentication_token: authentication_token)
        abort_document_version_upload(input)
      end

      def abort_document_version_upload(input : Types::AbortDocumentVersionUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ABORT_DOCUMENT_VERSION_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Activates the specified user. Only active users can access Amazon WorkDocs.

      def activate_user(
        user_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::ActivateUserRequest.new(user_id: user_id, authentication_token: authentication_token)
        activate_user(input)
      end

      def activate_user(input : Types::ActivateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACTIVATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a set of permissions for the specified folder or document. The resource permissions are
      # overwritten if the principals already have different permissions.

      def add_resource_permissions(
        principals : Array(Types::SharePrincipal),
        resource_id : String,
        authentication_token : String? = nil,
        notification_options : Types::NotificationOptions? = nil
      ) : Protocol::Request
        input = Types::AddResourcePermissionsRequest.new(principals: principals, resource_id: resource_id, authentication_token: authentication_token, notification_options: notification_options)
        add_resource_permissions(input)
      end

      def add_resource_permissions(input : Types::AddResourcePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_RESOURCE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new comment to the specified document version.

      def create_comment(
        document_id : String,
        text : String,
        version_id : String,
        authentication_token : String? = nil,
        notify_collaborators : Bool? = nil,
        parent_id : String? = nil,
        thread_id : String? = nil,
        visibility : String? = nil
      ) : Protocol::Request
        input = Types::CreateCommentRequest.new(document_id: document_id, text: text, version_id: version_id, authentication_token: authentication_token, notify_collaborators: notify_collaborators, parent_id: parent_id, thread_id: thread_id, visibility: visibility)
        create_comment(input)
      end

      def create_comment(input : Types::CreateCommentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more custom properties to the specified resource (a folder, document, or version).

      def create_custom_metadata(
        custom_metadata : Hash(String, String),
        resource_id : String,
        authentication_token : String? = nil,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateCustomMetadataRequest.new(custom_metadata: custom_metadata, resource_id: resource_id, authentication_token: authentication_token, version_id: version_id)
        create_custom_metadata(input)
      end

      def create_custom_metadata(input : Types::CreateCustomMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a folder with the specified name and parent folder.

      def create_folder(
        parent_folder_id : String,
        authentication_token : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::CreateFolderRequest.new(parent_folder_id: parent_folder_id, authentication_token: authentication_token, name: name)
        create_folder(input)
      end

      def create_folder(input : Types::CreateFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified list of labels to the given resource (a document or folder)

      def create_labels(
        labels : Array(String),
        resource_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateLabelsRequest.new(labels: labels, resource_id: resource_id, authentication_token: authentication_token)
        create_labels(input)
      end

      def create_labels(input : Types::CreateLabelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LABELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Configure Amazon WorkDocs to use Amazon SNS notifications. The endpoint receives a confirmation
      # message, and must confirm the subscription. For more information, see Setting up notifications for
      # an IAM user or role in the Amazon WorkDocs Developer Guide .

      def create_notification_subscription(
        endpoint : String,
        organization_id : String,
        protocol : String,
        subscription_type : String
      ) : Protocol::Request
        input = Types::CreateNotificationSubscriptionRequest.new(endpoint: endpoint, organization_id: organization_id, protocol: protocol, subscription_type: subscription_type)
        create_notification_subscription(input)
      end

      def create_notification_subscription(input : Types::CreateNotificationSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NOTIFICATION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user in a Simple AD or Microsoft AD directory. The status of a newly created user is
      # "ACTIVE". New users can access Amazon WorkDocs.

      def create_user(
        given_name : String,
        password : String,
        surname : String,
        username : String,
        authentication_token : String? = nil,
        email_address : String? = nil,
        organization_id : String? = nil,
        storage_rule : Types::StorageRuleType? = nil,
        time_zone_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(given_name: given_name, password: password, surname: surname, username: username, authentication_token: authentication_token, email_address: email_address, organization_id: organization_id, storage_rule: storage_rule, time_zone_id: time_zone_id)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deactivates the specified user, which revokes the user's access to Amazon WorkDocs.

      def deactivate_user(
        user_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeactivateUserRequest.new(user_id: user_id, authentication_token: authentication_token)
        deactivate_user(input)
      end

      def deactivate_user(input : Types::DeactivateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEACTIVATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified comment from the document version.

      def delete_comment(
        comment_id : String,
        document_id : String,
        version_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteCommentRequest.new(comment_id: comment_id, document_id: document_id, version_id: version_id, authentication_token: authentication_token)
        delete_comment(input)
      end

      def delete_comment(input : Types::DeleteCommentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes custom metadata from the specified resource.

      def delete_custom_metadata(
        resource_id : String,
        authentication_token : String? = nil,
        delete_all : Bool? = nil,
        keys : Array(String)? = nil,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteCustomMetadataRequest.new(resource_id: resource_id, authentication_token: authentication_token, delete_all: delete_all, keys: keys, version_id: version_id)
        delete_custom_metadata(input)
      end

      def delete_custom_metadata(input : Types::DeleteCustomMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently deletes the specified document and its associated metadata.

      def delete_document(
        document_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDocumentRequest.new(document_id: document_id, authentication_token: authentication_token)
        delete_document(input)
      end

      def delete_document(input : Types::DeleteDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific version of a document.

      def delete_document_version(
        delete_prior_versions : Bool,
        document_id : String,
        version_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDocumentVersionRequest.new(delete_prior_versions: delete_prior_versions, document_id: document_id, version_id: version_id, authentication_token: authentication_token)
        delete_document_version(input)
      end

      def delete_document_version(input : Types::DeleteDocumentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOCUMENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently deletes the specified folder and its contents.

      def delete_folder(
        folder_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFolderRequest.new(folder_id: folder_id, authentication_token: authentication_token)
        delete_folder(input)
      end

      def delete_folder(input : Types::DeleteFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the contents of the specified folder.

      def delete_folder_contents(
        folder_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFolderContentsRequest.new(folder_id: folder_id, authentication_token: authentication_token)
        delete_folder_contents(input)
      end

      def delete_folder_contents(input : Types::DeleteFolderContentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FOLDER_CONTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified list of labels from a resource.

      def delete_labels(
        resource_id : String,
        authentication_token : String? = nil,
        delete_all : Bool? = nil,
        labels : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DeleteLabelsRequest.new(resource_id: resource_id, authentication_token: authentication_token, delete_all: delete_all, labels: labels)
        delete_labels(input)
      end

      def delete_labels(input : Types::DeleteLabelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LABELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified subscription from the specified organization.

      def delete_notification_subscription(
        organization_id : String,
        subscription_id : String
      ) : Protocol::Request
        input = Types::DeleteNotificationSubscriptionRequest.new(organization_id: organization_id, subscription_id: subscription_id)
        delete_notification_subscription(input)
      end

      def delete_notification_subscription(input : Types::DeleteNotificationSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NOTIFICATION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified user from a Simple AD or Microsoft AD directory. Deleting a user immediately
      # and permanently deletes all content in that user's folder structure. Site retention policies do NOT
      # apply to this type of deletion.

      def delete_user(
        user_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(user_id: user_id, authentication_token: authentication_token)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the user activities in a specified time period.

      def describe_activities(
        activity_types : String? = nil,
        authentication_token : String? = nil,
        end_time : Time? = nil,
        include_indirect_activities : Bool? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        organization_id : String? = nil,
        resource_id : String? = nil,
        start_time : Time? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeActivitiesRequest.new(activity_types: activity_types, authentication_token: authentication_token, end_time: end_time, include_indirect_activities: include_indirect_activities, limit: limit, marker: marker, organization_id: organization_id, resource_id: resource_id, start_time: start_time, user_id: user_id)
        describe_activities(input)
      end

      def describe_activities(input : Types::DescribeActivitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACTIVITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the comments for the specified document version.

      def describe_comments(
        document_id : String,
        version_id : String,
        authentication_token : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::DescribeCommentsRequest.new(document_id: document_id, version_id: version_id, authentication_token: authentication_token, limit: limit, marker: marker)
        describe_comments(input)
      end

      def describe_comments(input : Types::DescribeCommentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COMMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the document versions for the specified document. By default, only active versions are
      # returned.

      def describe_document_versions(
        document_id : String,
        authentication_token : String? = nil,
        fields : String? = nil,
        include : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDocumentVersionsRequest.new(document_id: document_id, authentication_token: authentication_token, fields: fields, include: include, limit: limit, marker: marker)
        describe_document_versions(input)
      end

      def describe_document_versions(input : Types::DescribeDocumentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DOCUMENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the contents of the specified folder, including its documents and subfolders. By default,
      # Amazon WorkDocs returns the first 100 active document and folder metadata items. If there are more
      # results, the response includes a marker that you can use to request the next set of results. You can
      # also request initialized documents.

      def describe_folder_contents(
        folder_id : String,
        authentication_token : String? = nil,
        include : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        order : String? = nil,
        sort : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::DescribeFolderContentsRequest.new(folder_id: folder_id, authentication_token: authentication_token, include: include, limit: limit, marker: marker, order: order, sort: sort, type: type)
        describe_folder_contents(input)
      end

      def describe_folder_contents(input : Types::DescribeFolderContentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FOLDER_CONTENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the groups specified by the query. Groups are defined by the underlying Active Directory.

      def describe_groups(
        search_query : String,
        authentication_token : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        organization_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeGroupsRequest.new(search_query: search_query, authentication_token: authentication_token, limit: limit, marker: marker, organization_id: organization_id)
        describe_groups(input)
      end

      def describe_groups(input : Types::DescribeGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the specified notification subscriptions.

      def describe_notification_subscriptions(
        organization_id : String,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::DescribeNotificationSubscriptionsRequest.new(organization_id: organization_id, limit: limit, marker: marker)
        describe_notification_subscriptions(input)
      end

      def describe_notification_subscriptions(input : Types::DescribeNotificationSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NOTIFICATION_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the permissions of a specified resource.

      def describe_resource_permissions(
        resource_id : String,
        authentication_token : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        principal_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeResourcePermissionsRequest.new(resource_id: resource_id, authentication_token: authentication_token, limit: limit, marker: marker, principal_id: principal_id)
        describe_resource_permissions(input)
      end

      def describe_resource_permissions(input : Types::DescribeResourcePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the current user's special folders; the RootFolder and the RecycleBin . RootFolder is the
      # root of user's files and folders and RecycleBin is the root of recycled items. This is not a valid
      # action for SigV4 (administrative API) clients. This action requires an authentication token. To get
      # an authentication token, register an application with Amazon WorkDocs. For more information, see
      # Authentication and Access Control for User Applications in the Amazon WorkDocs Developer Guide .

      def describe_root_folders(
        authentication_token : String,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRootFoldersRequest.new(authentication_token: authentication_token, limit: limit, marker: marker)
        describe_root_folders(input)
      end

      def describe_root_folders(input : Types::DescribeRootFoldersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROOT_FOLDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified users. You can describe all users or filter the results (for example, by
      # status or organization). By default, Amazon WorkDocs returns the first 24 active or pending users.
      # If there are more results, the response includes a marker that you can use to request the next set
      # of results.

      def describe_users(
        authentication_token : String? = nil,
        fields : String? = nil,
        include : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        order : String? = nil,
        organization_id : String? = nil,
        query : String? = nil,
        sort : String? = nil,
        user_ids : String? = nil
      ) : Protocol::Request
        input = Types::DescribeUsersRequest.new(authentication_token: authentication_token, fields: fields, include: include, limit: limit, marker: marker, order: order, organization_id: organization_id, query: query, sort: sort, user_ids: user_ids)
        describe_users(input)
      end

      def describe_users(input : Types::DescribeUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of the current user for whom the authentication token was generated. This is not a
      # valid action for SigV4 (administrative API) clients. This action requires an authentication token.
      # To get an authentication token, register an application with Amazon WorkDocs. For more information,
      # see Authentication and Access Control for User Applications in the Amazon WorkDocs Developer Guide .

      def get_current_user(
        authentication_token : String
      ) : Protocol::Request
        input = Types::GetCurrentUserRequest.new(authentication_token: authentication_token)
        get_current_user(input)
      end

      def get_current_user(input : Types::GetCurrentUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CURRENT_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of a document.

      def get_document(
        document_id : String,
        authentication_token : String? = nil,
        include_custom_metadata : Bool? = nil
      ) : Protocol::Request
        input = Types::GetDocumentRequest.new(document_id: document_id, authentication_token: authentication_token, include_custom_metadata: include_custom_metadata)
        get_document(input)
      end

      def get_document(input : Types::GetDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the path information (the hierarchy from the root folder) for the requested document. By
      # default, Amazon WorkDocs returns a maximum of 100 levels upwards from the requested document and
      # only includes the IDs of the parent folders in the path. You can limit the maximum number of levels.
      # You can also request the names of the parent folders.

      def get_document_path(
        document_id : String,
        authentication_token : String? = nil,
        fields : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::GetDocumentPathRequest.new(document_id: document_id, authentication_token: authentication_token, fields: fields, limit: limit, marker: marker)
        get_document_path(input)
      end

      def get_document_path(input : Types::GetDocumentPathRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENT_PATH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves version metadata for the specified document.

      def get_document_version(
        document_id : String,
        version_id : String,
        authentication_token : String? = nil,
        fields : String? = nil,
        include_custom_metadata : Bool? = nil
      ) : Protocol::Request
        input = Types::GetDocumentVersionRequest.new(document_id: document_id, version_id: version_id, authentication_token: authentication_token, fields: fields, include_custom_metadata: include_custom_metadata)
        get_document_version(input)
      end

      def get_document_version(input : Types::GetDocumentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata of the specified folder.

      def get_folder(
        folder_id : String,
        authentication_token : String? = nil,
        include_custom_metadata : Bool? = nil
      ) : Protocol::Request
        input = Types::GetFolderRequest.new(folder_id: folder_id, authentication_token: authentication_token, include_custom_metadata: include_custom_metadata)
        get_folder(input)
      end

      def get_folder(input : Types::GetFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the path information (the hierarchy from the root folder) for the specified folder. By
      # default, Amazon WorkDocs returns a maximum of 100 levels upwards from the requested folder and only
      # includes the IDs of the parent folders in the path. You can limit the maximum number of levels. You
      # can also request the parent folder names.

      def get_folder_path(
        folder_id : String,
        authentication_token : String? = nil,
        fields : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::GetFolderPathRequest.new(folder_id: folder_id, authentication_token: authentication_token, fields: fields, limit: limit, marker: marker)
        get_folder_path(input)
      end

      def get_folder_path(input : Types::GetFolderPathRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FOLDER_PATH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a collection of resources, including folders and documents. The only CollectionType
      # supported is SHARED_WITH_ME .

      def get_resources(
        authentication_token : String? = nil,
        collection_type : String? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcesRequest.new(authentication_token: authentication_token, collection_type: collection_type, limit: limit, marker: marker, user_id: user_id)
        get_resources(input)
      end

      def get_resources(input : Types::GetResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new document object and version object. The client specifies the parent folder ID and name
      # of the document to upload. The ID is optionally specified when creating a new version of an existing
      # document. This is the first step to upload a document. Next, upload the document to the URL returned
      # from the call, and then call UpdateDocumentVersion . To cancel the document upload, call
      # AbortDocumentVersionUpload .

      def initiate_document_version_upload(
        authentication_token : String? = nil,
        content_created_timestamp : Time? = nil,
        content_modified_timestamp : Time? = nil,
        content_type : String? = nil,
        document_size_in_bytes : Int64? = nil,
        id : String? = nil,
        name : String? = nil,
        parent_folder_id : String? = nil
      ) : Protocol::Request
        input = Types::InitiateDocumentVersionUploadRequest.new(authentication_token: authentication_token, content_created_timestamp: content_created_timestamp, content_modified_timestamp: content_modified_timestamp, content_type: content_type, document_size_in_bytes: document_size_in_bytes, id: id, name: name, parent_folder_id: parent_folder_id)
        initiate_document_version_upload(input)
      end

      def initiate_document_version_upload(input : Types::InitiateDocumentVersionUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIATE_DOCUMENT_VERSION_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes all the permissions from the specified resource.

      def remove_all_resource_permissions(
        resource_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::RemoveAllResourcePermissionsRequest.new(resource_id: resource_id, authentication_token: authentication_token)
        remove_all_resource_permissions(input)
      end

      def remove_all_resource_permissions(input : Types::RemoveAllResourcePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ALL_RESOURCE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the permission for the specified principal from the specified resource.

      def remove_resource_permission(
        principal_id : String,
        resource_id : String,
        authentication_token : String? = nil,
        principal_type : String? = nil
      ) : Protocol::Request
        input = Types::RemoveResourcePermissionRequest.new(principal_id: principal_id, resource_id: resource_id, authentication_token: authentication_token, principal_type: principal_type)
        remove_resource_permission(input)
      end

      def remove_resource_permission(input : Types::RemoveResourcePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_RESOURCE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Recovers a deleted version of an Amazon WorkDocs document.

      def restore_document_versions(
        document_id : String,
        authentication_token : String? = nil
      ) : Protocol::Request
        input = Types::RestoreDocumentVersionsRequest.new(document_id: document_id, authentication_token: authentication_token)
        restore_document_versions(input)
      end

      def restore_document_versions(input : Types::RestoreDocumentVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_DOCUMENT_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches metadata and the content of folders, documents, document versions, and comments.

      def search_resources(
        additional_response_fields : Array(String)? = nil,
        authentication_token : String? = nil,
        filters : Types::Filters? = nil,
        limit : Int32? = nil,
        marker : String? = nil,
        order_by : Array(Types::SearchSortResult)? = nil,
        organization_id : String? = nil,
        query_scopes : Array(String)? = nil,
        query_text : String? = nil
      ) : Protocol::Request
        input = Types::SearchResourcesRequest.new(additional_response_fields: additional_response_fields, authentication_token: authentication_token, filters: filters, limit: limit, marker: marker, order_by: order_by, organization_id: organization_id, query_scopes: query_scopes, query_text: query_text)
        search_resources(input)
      end

      def search_resources(input : Types::SearchResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified attributes of a document. The user must have access to both the document and
      # its parent folder, if applicable.

      def update_document(
        document_id : String,
        authentication_token : String? = nil,
        name : String? = nil,
        parent_folder_id : String? = nil,
        resource_state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDocumentRequest.new(document_id: document_id, authentication_token: authentication_token, name: name, parent_folder_id: parent_folder_id, resource_state: resource_state)
        update_document(input)
      end

      def update_document(input : Types::UpdateDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the status of the document version to ACTIVE. Amazon WorkDocs also sets its document
      # container to ACTIVE. This is the last step in a document upload, after the client uploads the
      # document to an S3-presigned URL returned by InitiateDocumentVersionUpload .

      def update_document_version(
        document_id : String,
        version_id : String,
        authentication_token : String? = nil,
        version_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDocumentVersionRequest.new(document_id: document_id, version_id: version_id, authentication_token: authentication_token, version_status: version_status)
        update_document_version(input)
      end

      def update_document_version(input : Types::UpdateDocumentVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOCUMENT_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified attributes of the specified folder. The user must have access to both the
      # folder and its parent folder, if applicable.

      def update_folder(
        folder_id : String,
        authentication_token : String? = nil,
        name : String? = nil,
        parent_folder_id : String? = nil,
        resource_state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFolderRequest.new(folder_id: folder_id, authentication_token: authentication_token, name: name, parent_folder_id: parent_folder_id, resource_state: resource_state)
        update_folder(input)
      end

      def update_folder(input : Types::UpdateFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified attributes of the specified user, and grants or revokes administrative
      # privileges to the Amazon WorkDocs site.

      def update_user(
        user_id : String,
        authentication_token : String? = nil,
        given_name : String? = nil,
        grant_poweruser_privileges : String? = nil,
        locale : String? = nil,
        storage_rule : Types::StorageRuleType? = nil,
        surname : String? = nil,
        time_zone_id : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(user_id: user_id, authentication_token: authentication_token, given_name: given_name, grant_poweruser_privileges: grant_poweruser_privileges, locale: locale, storage_rule: storage_rule, surname: surname, time_zone_id: time_zone_id, type: type)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
