module AwsSdk
  module QApps
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

      # Associates a rating or review for a library item with the user submitting the request. This
      # increments the rating count for the specified library item.
      def associate_library_item_review(
        instance_id : String,
        library_item_id : String
      ) : Protocol::Request
        input = Types::AssociateLibraryItemReviewInput.new(instance_id: instance_id, library_item_id: library_item_id)
        associate_library_item_review(input)
      end
      def associate_library_item_review(input : Types::AssociateLibraryItemReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LIBRARY_ITEM_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a link between the user's identity calling the operation and a specific Q
      # App. This is useful to mark the Q App as a favorite for the user if the user doesn't own the Amazon
      # Q App so they can still run it and see it in their inventory of Q Apps.
      def associate_q_app_with_user(
        app_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::AssociateQAppWithUserInput.new(app_id: app_id, instance_id: instance_id)
        associate_q_app_with_user(input)
      end
      def associate_q_app_with_user(input : Types::AssociateQAppWithUserInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_Q_APP_WITH_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates Categories for the Amazon Q Business application environment instance. Web experience users
      # use Categories to tag and filter library items. For more information, see Custom labels for Amazon Q
      # Apps .
      def batch_create_category(
        categories : Array(Types::BatchCreateCategoryInputCategory),
        instance_id : String
      ) : Protocol::Request
        input = Types::BatchCreateCategoryInput.new(categories: categories, instance_id: instance_id)
        batch_create_category(input)
      end
      def batch_create_category(input : Types::BatchCreateCategoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_CATEGORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes Categories for the Amazon Q Business application environment instance. Web experience users
      # use Categories to tag and filter library items. For more information, see Custom labels for Amazon Q
      # Apps .
      def batch_delete_category(
        categories : Array(String),
        instance_id : String
      ) : Protocol::Request
        input = Types::BatchDeleteCategoryInput.new(categories: categories, instance_id: instance_id)
        batch_delete_category(input)
      end
      def batch_delete_category(input : Types::BatchDeleteCategoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_CATEGORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates Categories for the Amazon Q Business application environment instance. Web experience users
      # use Categories to tag and filter library items. For more information, see Custom labels for Amazon Q
      # Apps .
      def batch_update_category(
        categories : Array(Types::CategoryInput),
        instance_id : String
      ) : Protocol::Request
        input = Types::BatchUpdateCategoryInput.new(categories: categories, instance_id: instance_id)
        batch_update_category(input)
      end
      def batch_update_category(input : Types::BatchUpdateCategoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_CATEGORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new library item for an Amazon Q App, allowing it to be discovered and used by other
      # allowed users.
      def create_library_item(
        app_id : String,
        app_version : Int32,
        categories : Array(String),
        instance_id : String
      ) : Protocol::Request
        input = Types::CreateLibraryItemInput.new(app_id: app_id, app_version: app_version, categories: categories, instance_id: instance_id)
        create_library_item(input)
      end
      def create_library_item(input : Types::CreateLibraryItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LIBRARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a presigned URL for an S3 POST operation to upload a file. You can use this URL to set a
      # default file for a FileUploadCard in a Q App definition or to provide a file for a single Q App run.
      # The scope parameter determines how the file will be used, either at the app definition level or the
      # app session level. The IAM permissions are derived from the qapps:ImportDocument action. For more
      # information on the IAM policy for Amazon Q Apps, see IAM permissions for using Amazon Q Apps .
      def create_presigned_url(
        app_id : String,
        card_id : String,
        file_contents_sha256 : String,
        file_name : String,
        instance_id : String,
        scope : String,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::CreatePresignedUrlInput.new(app_id: app_id, card_id: card_id, file_contents_sha256: file_contents_sha256, file_name: file_name, instance_id: instance_id, scope: scope, session_id: session_id)
        create_presigned_url(input)
      end
      def create_presigned_url(input : Types::CreatePresignedUrlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRESIGNED_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon Q App based on the provided definition. The Q App definition specifies the
      # cards and flow of the Q App. This operation also calculates the dependencies between the cards by
      # inspecting the references in the prompts.
      def create_q_app(
        app_definition : Types::AppDefinitionInput,
        instance_id : String,
        title : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQAppInput.new(app_definition: app_definition, instance_id: instance_id, title: title, description: description, tags: tags)
        create_q_app(input)
      end
      def create_q_app(input : Types::CreateQAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_Q_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a library item for an Amazon Q App, removing it from the library so it can no longer be
      # discovered or used by other users.
      def delete_library_item(
        instance_id : String,
        library_item_id : String
      ) : Protocol::Request
        input = Types::DeleteLibraryItemInput.new(instance_id: instance_id, library_item_id: library_item_id)
        delete_library_item(input)
      end
      def delete_library_item(input : Types::DeleteLibraryItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LIBRARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Q App owned by the user. If the Q App was previously published to the library, it
      # is also removed from the library.
      def delete_q_app(
        app_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteQAppInput.new(app_id: app_id, instance_id: instance_id)
        delete_q_app(input)
      end
      def delete_q_app(input : Types::DeleteQAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_Q_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes read permissions for a Amazon Q App in Amazon Q Business application environment instance.
      def describe_q_app_permissions(
        app_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeQAppPermissionsInput.new(app_id: app_id, instance_id: instance_id)
        describe_q_app_permissions(input)
      end
      def describe_q_app_permissions(input : Types::DescribeQAppPermissionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_Q_APP_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a rating or review previously submitted by the user for a library item.
      def disassociate_library_item_review(
        instance_id : String,
        library_item_id : String
      ) : Protocol::Request
        input = Types::DisassociateLibraryItemReviewInput.new(instance_id: instance_id, library_item_id: library_item_id)
        disassociate_library_item_review(input)
      end
      def disassociate_library_item_review(input : Types::DisassociateLibraryItemReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LIBRARY_ITEM_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a Q App from a user removing the user's access to run the Q App.
      def disassociate_q_app_from_user(
        app_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DisassociateQAppFromUserInput.new(app_id: app_id, instance_id: instance_id)
        disassociate_q_app_from_user(input)
      end
      def disassociate_q_app_from_user(input : Types::DisassociateQAppFromUserInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_Q_APP_FROM_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports the collected data of a Q App data collection session.
      def export_q_app_session_data(
        instance_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::ExportQAppSessionDataInput.new(instance_id: instance_id, session_id: session_id)
        export_q_app_session_data(input)
      end
      def export_q_app_session_data(input : Types::ExportQAppSessionDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_Q_APP_SESSION_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a library item for an Amazon Q App, including its metadata, categories,
      # ratings, and usage statistics.
      def get_library_item(
        instance_id : String,
        library_item_id : String,
        app_id : String? = nil
      ) : Protocol::Request
        input = Types::GetLibraryItemInput.new(instance_id: instance_id, library_item_id: library_item_id, app_id: app_id)
        get_library_item(input)
      end
      def get_library_item(input : Types::GetLibraryItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIBRARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the full details of an Q App, including its definition specifying the cards and flow.
      def get_q_app(
        app_id : String,
        instance_id : String,
        app_version : Int32? = nil
      ) : Protocol::Request
        input = Types::GetQAppInput.new(app_id: app_id, instance_id: instance_id, app_version: app_version)
        get_q_app(input)
      end
      def get_q_app(input : Types::GetQAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_Q_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current state and results for an active session of an Amazon Q App.
      def get_q_app_session(
        instance_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetQAppSessionInput.new(instance_id: instance_id, session_id: session_id)
        get_q_app_session(input)
      end
      def get_q_app_session(input : Types::GetQAppSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_Q_APP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current configuration of a Q App session.
      def get_q_app_session_metadata(
        instance_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetQAppSessionMetadataInput.new(instance_id: instance_id, session_id: session_id)
        get_q_app_session_metadata(input)
      end
      def get_q_app_session_metadata(input : Types::GetQAppSessionMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_Q_APP_SESSION_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads a file that can then be used either as a default in a FileUploadCard from Q App definition
      # or as a file that is used inside a single Q App run. The purpose of the document is determined by a
      # scope parameter that indicates whether it is at the app definition level or at the app session
      # level.
      def import_document(
        app_id : String,
        card_id : String,
        file_contents_base64 : String,
        file_name : String,
        instance_id : String,
        scope : String,
        session_id : String? = nil
      ) : Protocol::Request
        input = Types::ImportDocumentInput.new(app_id: app_id, card_id: card_id, file_contents_base64: file_contents_base64, file_name: file_name, instance_id: instance_id, scope: scope, session_id: session_id)
        import_document(input)
      end
      def import_document(input : Types::ImportDocumentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the categories of a Amazon Q Business application environment instance. For more information,
      # see Custom labels for Amazon Q Apps .
      def list_categories(
        instance_id : String
      ) : Protocol::Request
        input = Types::ListCategoriesInput.new(instance_id: instance_id)
        list_categories(input)
      end
      def list_categories(input : Types::ListCategoriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CATEGORIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the library items for Amazon Q Apps that are published and available for users in your Amazon
      # Web Services account.
      def list_library_items(
        instance_id : String,
        category_id : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLibraryItemsInput.new(instance_id: instance_id, category_id: category_id, limit: limit, next_token: next_token)
        list_library_items(input)
      end
      def list_library_items(input : Types::ListLibraryItemsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIBRARY_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the collected data of a Q App data collection session.
      def list_q_app_session_data(
        instance_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::ListQAppSessionDataInput.new(instance_id: instance_id, session_id: session_id)
        list_q_app_session_data(input)
      end
      def list_q_app_session_data(input : Types::ListQAppSessionDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_Q_APP_SESSION_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Q Apps owned by or associated with the user either because they created it or
      # because they used it from the library in the past. The user identity is extracted from the
      # credentials used to invoke this operation..
      def list_q_apps(
        instance_id : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListQAppsInput.new(instance_id: instance_id, limit: limit, next_token: next_token)
        list_q_apps(input)
      end
      def list_q_apps(input : Types::ListQAppsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_Q_APPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with an Amazon Q Apps resource.
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

      # Generates an Amazon Q App definition based on either a conversation or a problem statement provided
      # as input.The resulting app definition can be used to call CreateQApp . This API doesn't create
      # Amazon Q Apps directly.
      def predict_q_app(
        instance_id : String,
        options : Types::PredictQAppInputOptions? = nil
      ) : Protocol::Request
        input = Types::PredictQAppInput.new(instance_id: instance_id, options: options)
        predict_q_app(input)
      end
      def predict_q_app(input : Types::PredictQAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREDICT_Q_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a new session for an Amazon Q App, allowing inputs to be provided and the app to be run. Each
      # Q App session will be condensed into a single conversation in the web experience.
      def start_q_app_session(
        app_id : String,
        app_version : Int32,
        instance_id : String,
        initial_values : Array(Types::CardValue)? = nil,
        session_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartQAppSessionInput.new(app_id: app_id, app_version: app_version, instance_id: instance_id, initial_values: initial_values, session_id: session_id, tags: tags)
        start_q_app_session(input)
      end
      def start_q_app_session(input : Types::StartQAppSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_Q_APP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an active session for an Amazon Q App.This deletes all data related to the session and makes
      # it invalid for future uses. The results of the session will be persisted as part of the
      # conversation.
      def stop_q_app_session(
        instance_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::StopQAppSessionInput.new(instance_id: instance_id, session_id: session_id)
        stop_q_app_session(input)
      end
      def stop_q_app_session(input : Types::StopQAppSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_Q_APP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates tags with an Amazon Q Apps resource.
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

      # Disassociates tags from an Amazon Q Apps resource.
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

      # Updates the library item for an Amazon Q App.
      def update_library_item(
        instance_id : String,
        library_item_id : String,
        categories : Array(String)? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLibraryItemInput.new(instance_id: instance_id, library_item_id: library_item_id, categories: categories, status: status)
        update_library_item(input)
      end
      def update_library_item(input : Types::UpdateLibraryItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIBRARY_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the verification status of a library item for an Amazon Q App.
      def update_library_item_metadata(
        instance_id : String,
        library_item_id : String,
        is_verified : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateLibraryItemMetadataInput.new(instance_id: instance_id, library_item_id: library_item_id, is_verified: is_verified)
        update_library_item_metadata(input)
      end
      def update_library_item_metadata(input : Types::UpdateLibraryItemMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIBRARY_ITEM_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Amazon Q App, allowing modifications to its title, description, and definition.
      def update_q_app(
        app_id : String,
        instance_id : String,
        app_definition : Types::AppDefinitionInput? = nil,
        description : String? = nil,
        title : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQAppInput.new(app_id: app_id, instance_id: instance_id, app_definition: app_definition, description: description, title: title)
        update_q_app(input)
      end
      def update_q_app(input : Types::UpdateQAppInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_Q_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates read permissions for a Amazon Q App in Amazon Q Business application environment instance.
      def update_q_app_permissions(
        app_id : String,
        instance_id : String,
        grant_permissions : Array(Types::PermissionInput)? = nil,
        revoke_permissions : Array(Types::PermissionInput)? = nil
      ) : Protocol::Request
        input = Types::UpdateQAppPermissionsInput.new(app_id: app_id, instance_id: instance_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_q_app_permissions(input)
      end
      def update_q_app_permissions(input : Types::UpdateQAppPermissionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_Q_APP_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the session for a given Q App sessionId . This is only valid when at least one card of the
      # session is in the WAITING state. Data for each WAITING card can be provided as input. If inputs are
      # not provided, the call will be accepted but session will not move forward. Inputs for cards that are
      # not in the WAITING status will be ignored.
      def update_q_app_session(
        instance_id : String,
        session_id : String,
        values : Array(Types::CardValue)? = nil
      ) : Protocol::Request
        input = Types::UpdateQAppSessionInput.new(instance_id: instance_id, session_id: session_id, values: values)
        update_q_app_session(input)
      end
      def update_q_app_session(input : Types::UpdateQAppSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_Q_APP_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration metadata of a session for a given Q App sessionId .
      def update_q_app_session_metadata(
        instance_id : String,
        session_id : String,
        sharing_configuration : Types::SessionSharingConfiguration,
        session_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQAppSessionMetadataInput.new(instance_id: instance_id, session_id: session_id, sharing_configuration: sharing_configuration, session_name: session_name)
        update_q_app_session_metadata(input)
      end
      def update_q_app_session_metadata(input : Types::UpdateQAppSessionMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_Q_APP_SESSION_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
