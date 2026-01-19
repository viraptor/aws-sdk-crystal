require "json"
require "time"

module AwsSdk
  module WorkDocs
    module Types

      struct AbortDocumentVersionUploadRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The ID of the version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct ActivateUserRequest
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @user_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct ActivateUserResponse
        include JSON::Serializable

        # The user information.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      # Describes the activity information.
      struct Activity
        include JSON::Serializable

        # Metadata of the commenting activity. This is an optional field and is filled for commenting
        # activities.
        @[JSON::Field(key: "CommentMetadata")]
        getter comment_metadata : Types::CommentMetadata?

        # The user who performed the action.
        @[JSON::Field(key: "Initiator")]
        getter initiator : Types::UserMetadata?

        # Indicates whether an activity is indirect or direct. An indirect activity results from a direct
        # activity performed on a parent resource. For example, sharing a parent folder (the direct activity)
        # shares all of the subfolders and documents within the parent folder (the indirect activity).
        @[JSON::Field(key: "IsIndirectActivity")]
        getter is_indirect_activity : Bool?

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The original parent of the resource. This is an optional field and is filled for move activities.
        @[JSON::Field(key: "OriginalParent")]
        getter original_parent : Types::ResourceMetadata?

        # The list of users or groups impacted by this action. This is an optional field and is filled for the
        # following sharing activities: DOCUMENT_SHARED, DOCUMENT_SHARED, DOCUMENT_UNSHARED, FOLDER_SHARED,
        # FOLDER_UNSHARED.
        @[JSON::Field(key: "Participants")]
        getter participants : Types::Participants?

        # The metadata of the resource involved in the user action.
        @[JSON::Field(key: "ResourceMetadata")]
        getter resource_metadata : Types::ResourceMetadata?

        # The timestamp when the action was performed.
        @[JSON::Field(key: "TimeStamp")]
        getter time_stamp : Time?

        # The activity type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @comment_metadata : Types::CommentMetadata? = nil,
          @initiator : Types::UserMetadata? = nil,
          @is_indirect_activity : Bool? = nil,
          @organization_id : String? = nil,
          @original_parent : Types::ResourceMetadata? = nil,
          @participants : Types::Participants? = nil,
          @resource_metadata : Types::ResourceMetadata? = nil,
          @time_stamp : Time? = nil,
          @type : String? = nil
        )
        end
      end

      struct AddResourcePermissionsRequest
        include JSON::Serializable

        # The users, groups, or organization being granted permission.
        @[JSON::Field(key: "Principals")]
        getter principals : Array(Types::SharePrincipal)

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The notification options.
        @[JSON::Field(key: "NotificationOptions")]
        getter notification_options : Types::NotificationOptions?

        def initialize(
          @principals : Array(Types::SharePrincipal),
          @resource_id : String,
          @authentication_token : String? = nil,
          @notification_options : Types::NotificationOptions? = nil
        )
        end
      end

      struct AddResourcePermissionsResponse
        include JSON::Serializable

        # The share results.
        @[JSON::Field(key: "ShareResults")]
        getter share_results : Array(Types::ShareResult)?

        def initialize(
          @share_results : Array(Types::ShareResult)? = nil
        )
        end
      end

      # Describes a comment.
      struct Comment
        include JSON::Serializable

        # The ID of the comment.
        @[JSON::Field(key: "CommentId")]
        getter comment_id : String

        # The details of the user who made the comment.
        @[JSON::Field(key: "Contributor")]
        getter contributor : Types::User?

        # The time that the comment was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the parent comment.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # If the comment is a reply to another user's comment, this field contains the user ID of the user
        # being replied to.
        @[JSON::Field(key: "RecipientId")]
        getter recipient_id : String?

        # The status of the comment.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The text of the comment.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # The ID of the root comment in the thread.
        @[JSON::Field(key: "ThreadId")]
        getter thread_id : String?

        # The visibility of the comment. Options are either PRIVATE, where the comment is visible only to the
        # comment author and document owner and co-owners, or PUBLIC, where the comment is visible to document
        # owners, co-owners, and contributors.
        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @comment_id : String,
          @contributor : Types::User? = nil,
          @created_timestamp : Time? = nil,
          @parent_id : String? = nil,
          @recipient_id : String? = nil,
          @status : String? = nil,
          @text : String? = nil,
          @thread_id : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Describes the metadata of a comment.
      struct CommentMetadata
        include JSON::Serializable

        # The ID of the comment.
        @[JSON::Field(key: "CommentId")]
        getter comment_id : String?

        # The status of the comment.
        @[JSON::Field(key: "CommentStatus")]
        getter comment_status : String?

        # The user who made the comment.
        @[JSON::Field(key: "Contributor")]
        getter contributor : Types::User?

        # The ID of the user who made the comment.
        @[JSON::Field(key: "ContributorId")]
        getter contributor_id : String?

        # The timestamp that the comment was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the user being replied to.
        @[JSON::Field(key: "RecipientId")]
        getter recipient_id : String?

        def initialize(
          @comment_id : String? = nil,
          @comment_status : String? = nil,
          @contributor : Types::User? = nil,
          @contributor_id : String? = nil,
          @created_timestamp : Time? = nil,
          @recipient_id : String? = nil
        )
        end
      end

      # The resource hierarchy is changing.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Another operation is in progress on the resource that conflicts with the current operation.
      struct ConflictingOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateCommentRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The text of the comment.
        @[JSON::Field(key: "Text")]
        getter text : String

        # The ID of the document version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Set this parameter to TRUE to send an email out to the document collaborators after the comment is
        # created.
        @[JSON::Field(key: "NotifyCollaborators")]
        getter notify_collaborators : Bool?

        # The ID of the parent comment.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # The ID of the root comment in the thread.
        @[JSON::Field(key: "ThreadId")]
        getter thread_id : String?

        # The visibility of the comment. Options are either PRIVATE, where the comment is visible only to the
        # comment author and document owner and co-owners, or PUBLIC, where the comment is visible to document
        # owners, co-owners, and contributors.
        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @document_id : String,
          @text : String,
          @version_id : String,
          @authentication_token : String? = nil,
          @notify_collaborators : Bool? = nil,
          @parent_id : String? = nil,
          @thread_id : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      struct CreateCommentResponse
        include JSON::Serializable

        # The comment that has been created.
        @[JSON::Field(key: "Comment")]
        getter comment : Types::Comment?

        def initialize(
          @comment : Types::Comment? = nil
        )
        end
      end

      struct CreateCustomMetadataRequest
        include JSON::Serializable

        # Custom metadata in the form of name-value pairs.
        @[JSON::Field(key: "CustomMetadata")]
        getter custom_metadata : Hash(String, String)

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The ID of the version, if the custom metadata is being added to a document version.
        @[JSON::Field(key: "versionid")]
        getter version_id : String?

        def initialize(
          @custom_metadata : Hash(String, String),
          @resource_id : String,
          @authentication_token : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct CreateCustomMetadataResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateFolderRequest
        include JSON::Serializable

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The name of the new folder.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @parent_folder_id : String,
          @authentication_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct CreateFolderResponse
        include JSON::Serializable

        # The metadata of the folder.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::FolderMetadata?

        def initialize(
          @metadata : Types::FolderMetadata? = nil
        )
        end
      end

      struct CreateLabelsRequest
        include JSON::Serializable

        # List of labels to add to the resource.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @labels : Array(String),
          @resource_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct CreateLabelsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateNotificationSubscriptionRequest
        include JSON::Serializable

        # The endpoint to receive the notifications. If the protocol is HTTPS, the endpoint is a URL that
        # begins with https .
        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The protocol to use. The supported value is https, which delivers JSON-encoded messages using HTTPS
        # POST.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # The notification type.
        @[JSON::Field(key: "SubscriptionType")]
        getter subscription_type : String

        def initialize(
          @endpoint : String,
          @organization_id : String,
          @protocol : String,
          @subscription_type : String
        )
        end
      end

      struct CreateNotificationSubscriptionResponse
        include JSON::Serializable

        # The subscription.
        @[JSON::Field(key: "Subscription")]
        getter subscription : Types::Subscription?

        def initialize(
          @subscription : Types::Subscription? = nil
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        # The given name of the user.
        @[JSON::Field(key: "GivenName")]
        getter given_name : String

        # The password of the user.
        @[JSON::Field(key: "Password")]
        getter password : String

        # The surname of the user.
        @[JSON::Field(key: "Surname")]
        getter surname : String

        # The login name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The email address of the user.
        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The amount of storage for the user.
        @[JSON::Field(key: "StorageRule")]
        getter storage_rule : Types::StorageRuleType?

        # The time zone ID of the user.
        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String?

        def initialize(
          @given_name : String,
          @password : String,
          @surname : String,
          @username : String,
          @authentication_token : String? = nil,
          @email_address : String? = nil,
          @organization_id : String? = nil,
          @storage_rule : Types::StorageRuleType? = nil,
          @time_zone_id : String? = nil
        )
        end
      end

      struct CreateUserResponse
        include JSON::Serializable

        # The user information.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      # The limit has been reached on the number of custom properties for the specified resource.
      struct CustomMetadataLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Filters results based on timestamp range (in epochs).
      struct DateRangeType
        include JSON::Serializable

        # Timestamp range end value (in epochs).
        @[JSON::Field(key: "EndValue")]
        getter end_value : Time?

        # Timestamp range start value (in epochs)
        @[JSON::Field(key: "StartValue")]
        getter start_value : Time?

        def initialize(
          @end_value : Time? = nil,
          @start_value : Time? = nil
        )
        end
      end

      struct DeactivateUserRequest
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @user_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      # The last user in the organization is being deactivated.
      struct DeactivatingLastSystemUserException
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteCommentRequest
        include JSON::Serializable

        # The ID of the comment.
        @[JSON::Field(key: "CommentId")]
        getter comment_id : String

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The ID of the document version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @comment_id : String,
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DeleteCustomMetadataRequest
        include JSON::Serializable

        # The ID of the resource, either a document or folder.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Flag to indicate removal of all custom metadata properties from the specified resource.
        @[JSON::Field(key: "deleteAll")]
        getter delete_all : Bool?

        # List of properties to remove.
        @[JSON::Field(key: "keys")]
        getter keys : Array(String)?

        # The ID of the version, if the custom metadata is being deleted from a document version.
        @[JSON::Field(key: "versionId")]
        getter version_id : String?

        def initialize(
          @resource_id : String,
          @authentication_token : String? = nil,
          @delete_all : Bool? = nil,
          @keys : Array(String)? = nil,
          @version_id : String? = nil
        )
        end
      end

      struct DeleteCustomMetadataResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDocumentRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DeleteDocumentVersionRequest
        include JSON::Serializable

        # Deletes all versions of a document prior to the current version.
        @[JSON::Field(key: "deletePriorVersions")]
        getter delete_prior_versions : Bool

        # The ID of the document associated with the version being deleted.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The ID of the version being deleted.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @delete_prior_versions : Bool,
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DeleteFolderContentsRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DeleteFolderRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DeleteLabelsRequest
        include JSON::Serializable

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Flag to request removal of all labels from the specified resource.
        @[JSON::Field(key: "deleteAll")]
        getter delete_all : Bool?

        # List of labels to delete from the resource.
        @[JSON::Field(key: "labels")]
        getter labels : Array(String)?

        def initialize(
          @resource_id : String,
          @authentication_token : String? = nil,
          @delete_all : Bool? = nil,
          @labels : Array(String)? = nil
        )
        end
      end

      struct DeleteLabelsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteNotificationSubscriptionRequest
        include JSON::Serializable

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The ID of the subscription.
        @[JSON::Field(key: "SubscriptionId")]
        getter subscription_id : String

        def initialize(
          @organization_id : String,
          @subscription_id : String
        )
        end
      end

      struct DeleteUserRequest
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Amazon WorkDocs authentication token. Do not set this field when using administrative API actions,
        # as in accessing the API using Amazon Web Services credentials.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @user_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct DescribeActivitiesRequest
        include JSON::Serializable

        # Specifies which activity types to include in the response. If this field is left empty, all activity
        # types are returned.
        @[JSON::Field(key: "activityTypes")]
        getter activity_types : String?

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The timestamp that determines the end time of the activities. The response includes the activities
        # performed before the specified timestamp.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Includes indirect activities. An indirect activity results from a direct activity performed on a
        # parent resource. For example, sharing a parent folder (the direct activity) shares all of the
        # subfolders and documents within the parent folder (the indirect activity).
        @[JSON::Field(key: "includeIndirectActivities")]
        getter include_indirect_activities : Bool?

        # The maximum number of items to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The ID of the organization. This is a mandatory parameter when using administrative API (SigV4)
        # requests.
        @[JSON::Field(key: "organizationId")]
        getter organization_id : String?

        # The document or folder ID for which to describe activity types.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The timestamp that determines the starting time of the activities. The response includes the
        # activities performed after the specified timestamp.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The ID of the user who performed the action. The response includes activities pertaining to this
        # user. This is an optional parameter and is only applicable for administrative API (SigV4) requests.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @activity_types : String? = nil,
          @authentication_token : String? = nil,
          @end_time : Time? = nil,
          @include_indirect_activities : Bool? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @organization_id : String? = nil,
          @resource_id : String? = nil,
          @start_time : Time? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct DescribeActivitiesResponse
        include JSON::Serializable

        # The marker for the next set of results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The list of activities for the specified user and time period.
        @[JSON::Field(key: "UserActivities")]
        getter user_activities : Array(Types::Activity)?

        def initialize(
          @marker : String? = nil,
          @user_activities : Array(Types::Activity)? = nil
        )
        end
      end

      struct DescribeCommentsRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The ID of the document version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The maximum number of items to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. This marker was received from a previous call.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeCommentsResponse
        include JSON::Serializable

        # The list of comments for the specified document version.
        @[JSON::Field(key: "Comments")]
        getter comments : Array(Types::Comment)?

        # The marker for the next set of results. This marker was received from a previous call.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @comments : Array(Types::Comment)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeDocumentVersionsRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Specify "SOURCE" to include initialized versions and a URL for the source document.
        @[JSON::Field(key: "fields")]
        getter fields : String?

        # A comma-separated list of values. Specify "INITIALIZED" to include incomplete versions.
        @[JSON::Field(key: "include")]
        getter include : String?

        # The maximum number of versions to return with this call.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call.)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil,
          @fields : String? = nil,
          @include : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeDocumentVersionsResponse
        include JSON::Serializable

        # The document versions.
        @[JSON::Field(key: "DocumentVersions")]
        getter document_versions : Array(Types::DocumentVersionMetadata)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @document_versions : Array(Types::DocumentVersionMetadata)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeFolderContentsRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The contents to include. Specify "INITIALIZED" to include initialized documents.
        @[JSON::Field(key: "include")]
        getter include : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. This marker was received from a previous call.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The order for the contents of the folder.
        @[JSON::Field(key: "order")]
        getter order : String?

        # The sorting criteria.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        # The type of items.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil,
          @include : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @order : String? = nil,
          @sort : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct DescribeFolderContentsResponse
        include JSON::Serializable

        # The documents in the specified folder.
        @[JSON::Field(key: "Documents")]
        getter documents : Array(Types::DocumentMetadata)?

        # The subfolders in the specified folder.
        @[JSON::Field(key: "Folders")]
        getter folders : Array(Types::FolderMetadata)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @documents : Array(Types::DocumentMetadata)? = nil,
          @folders : Array(Types::FolderMetadata)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeGroupsRequest
        include JSON::Serializable

        # A query to describe groups by group name.
        @[JSON::Field(key: "searchQuery")]
        getter search_query : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call.)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The ID of the organization.
        @[JSON::Field(key: "organizationId")]
        getter organization_id : String?

        def initialize(
          @search_query : String,
          @authentication_token : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @organization_id : String? = nil
        )
        end
      end

      struct DescribeGroupsResponse
        include JSON::Serializable

        # The list of groups.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupMetadata)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @groups : Array(Types::GroupMetadata)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeNotificationSubscriptionsRequest
        include JSON::Serializable

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call.)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @organization_id : String,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeNotificationSubscriptionsResponse
        include JSON::Serializable

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The subscriptions.
        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @marker : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end

      struct DescribeResourcePermissionsRequest
        include JSON::Serializable

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The maximum number of items to return with this call.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The ID of the principal to filter permissions by.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @resource_id : String,
          @authentication_token : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      struct DescribeResourcePermissionsResponse
        include JSON::Serializable

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The principals.
        @[JSON::Field(key: "Principals")]
        getter principals : Array(Types::Principal)?

        def initialize(
          @marker : String? = nil,
          @principals : Array(Types::Principal)? = nil
        )
        end
      end

      struct DescribeRootFoldersRequest
        include JSON::Serializable

        # Amazon WorkDocs authentication token.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String

        # The maximum number of items to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call.)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @authentication_token : String,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeRootFoldersResponse
        include JSON::Serializable

        # The user's special folders.
        @[JSON::Field(key: "Folders")]
        getter folders : Array(Types::FolderMetadata)?

        # The marker for the next set of results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @folders : Array(Types::FolderMetadata)? = nil,
          @marker : String? = nil
        )
        end
      end

      struct DescribeUsersRequest
        include JSON::Serializable

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # A comma-separated list of values. Specify "STORAGE_METADATA" to include the user storage quota and
        # utilization information.
        @[JSON::Field(key: "fields")]
        getter fields : String?

        # The state of the users. Specify "ALL" to include inactive users.
        @[JSON::Field(key: "include")]
        getter include : String?

        # The maximum number of items to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. (You received this marker from a previous call.)
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The order for the results.
        @[JSON::Field(key: "order")]
        getter order : String?

        # The ID of the organization.
        @[JSON::Field(key: "organizationId")]
        getter organization_id : String?

        # A query to filter users by user name. Remember the following about the Userids and Query parameters:
        # If you don't use either parameter, the API returns a paginated list of all users on the site. If you
        # use both parameters, the API ignores the Query parameter. The Userid parameter only returns user
        # names that match a corresponding user ID. The Query parameter runs a "prefix" search for users by
        # the GivenName , SurName , or UserName fields included in a CreateUser API call. For example,
        # querying on Ma returns Márcia Oliveira, María García, and Mateo Jackson. If you use multiple
        # characters, the API only returns data that matches all characters. For example, querying on Ma J
        # only returns Mateo Jackson.
        @[JSON::Field(key: "query")]
        getter query : String?

        # The sorting criteria.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        # The IDs of the users.
        @[JSON::Field(key: "userIds")]
        getter user_ids : String?

        def initialize(
          @authentication_token : String? = nil,
          @fields : String? = nil,
          @include : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @order : String? = nil,
          @organization_id : String? = nil,
          @query : String? = nil,
          @sort : String? = nil,
          @user_ids : String? = nil
        )
        end
      end

      struct DescribeUsersResponse
        include JSON::Serializable

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The total number of users included in the results.
        @[JSON::Field(key: "TotalNumberOfUsers")]
        getter total_number_of_users : Int64?

        # The users.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @marker : String? = nil,
          @total_number_of_users : Int64? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # This exception is thrown when the document is locked for comments and user tries to create or delete
      # a comment on that document.
      struct DocumentLockedForCommentsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the document.
      struct DocumentMetadata
        include JSON::Serializable

        # The time when the document was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the creator.
        @[JSON::Field(key: "CreatorId")]
        getter creator_id : String?

        # The ID of the document.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # List of labels on the document.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        # The latest version of the document.
        @[JSON::Field(key: "LatestVersionMetadata")]
        getter latest_version_metadata : Types::DocumentVersionMetadata?

        # The time when the document was updated.
        @[JSON::Field(key: "ModifiedTimestamp")]
        getter modified_timestamp : Time?

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String?

        # The resource state.
        @[JSON::Field(key: "ResourceState")]
        getter resource_state : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @creator_id : String? = nil,
          @id : String? = nil,
          @labels : Array(String)? = nil,
          @latest_version_metadata : Types::DocumentVersionMetadata? = nil,
          @modified_timestamp : Time? = nil,
          @parent_folder_id : String? = nil,
          @resource_state : String? = nil
        )
        end
      end

      # Describes a version of a document.
      struct DocumentVersionMetadata
        include JSON::Serializable

        # The timestamp when the content of the document was originally created.
        @[JSON::Field(key: "ContentCreatedTimestamp")]
        getter content_created_timestamp : Time?

        # The timestamp when the content of the document was modified.
        @[JSON::Field(key: "ContentModifiedTimestamp")]
        getter content_modified_timestamp : Time?

        # The content type of the document.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The timestamp when the document was first uploaded.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the creator.
        @[JSON::Field(key: "CreatorId")]
        getter creator_id : String?

        # The ID of the version.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The timestamp when the document was last uploaded.
        @[JSON::Field(key: "ModifiedTimestamp")]
        getter modified_timestamp : Time?

        # The name of the version.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The signature of the document.
        @[JSON::Field(key: "Signature")]
        getter signature : String?

        # The size of the document, in bytes.
        @[JSON::Field(key: "Size")]
        getter size : Int64?

        # The source of the document.
        @[JSON::Field(key: "Source")]
        getter source : Hash(String, String)?

        # The status of the document.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The thumbnail of the document.
        @[JSON::Field(key: "Thumbnail")]
        getter thumbnail : Hash(String, String)?

        def initialize(
          @content_created_timestamp : Time? = nil,
          @content_modified_timestamp : Time? = nil,
          @content_type : String? = nil,
          @created_timestamp : Time? = nil,
          @creator_id : String? = nil,
          @id : String? = nil,
          @modified_timestamp : Time? = nil,
          @name : String? = nil,
          @signature : String? = nil,
          @size : Int64? = nil,
          @source : Hash(String, String)? = nil,
          @status : String? = nil,
          @thumbnail : Hash(String, String)? = nil
        )
        end
      end

      # This exception is thrown when a valid checkout ID is not presented on document version upload calls
      # for a document that has been checked out from Web client.
      struct DraftUploadOutOfSyncException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource already exists.
      struct EntityAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource does not exist.
      struct EntityNotExistsException
        include JSON::Serializable

        # The IDs of the non-existent resources.
        @[JSON::Field(key: "EntityIds")]
        getter entity_ids : Array(String)?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @entity_ids : Array(String)? = nil,
          @message : String? = nil
        )
        end
      end

      # The Directory Service cannot reach an on-premises instance. Or a dependency under the control of the
      # organization is failing, such as a connected Active Directory.
      struct FailedDependencyException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Filters results based on entity metadata.
      struct Filters
        include JSON::Serializable

        # Filter based on resource’s path.
        @[JSON::Field(key: "AncestorIds")]
        getter ancestor_ids : Array(String)?

        # Filters by content category.
        @[JSON::Field(key: "ContentCategories")]
        getter content_categories : Array(String)?

        # Filter based on resource’s creation timestamp.
        @[JSON::Field(key: "CreatedRange")]
        getter created_range : Types::DateRangeType?

        # Filter by labels using exact match.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        # Filter based on resource’s modified timestamp.
        @[JSON::Field(key: "ModifiedRange")]
        getter modified_range : Types::DateRangeType?

        # Filter based on UserIds or GroupIds.
        @[JSON::Field(key: "Principals")]
        getter principals : Array(Types::SearchPrincipalType)?

        # Filters based on entity type.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # Filter based on file groupings.
        @[JSON::Field(key: "SearchCollectionTypes")]
        getter search_collection_types : Array(String)?

        # Filter based on size (in bytes).
        @[JSON::Field(key: "SizeRange")]
        getter size_range : Types::LongRangeType?

        # Filters by the locale of the content or comment.
        @[JSON::Field(key: "TextLocales")]
        getter text_locales : Array(String)?

        def initialize(
          @ancestor_ids : Array(String)? = nil,
          @content_categories : Array(String)? = nil,
          @created_range : Types::DateRangeType? = nil,
          @labels : Array(String)? = nil,
          @modified_range : Types::DateRangeType? = nil,
          @principals : Array(Types::SearchPrincipalType)? = nil,
          @resource_types : Array(String)? = nil,
          @search_collection_types : Array(String)? = nil,
          @size_range : Types::LongRangeType? = nil,
          @text_locales : Array(String)? = nil
        )
        end
      end

      # Describes a folder.
      struct FolderMetadata
        include JSON::Serializable

        # The time when the folder was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ID of the creator.
        @[JSON::Field(key: "CreatorId")]
        getter creator_id : String?

        # The ID of the folder.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # List of labels on the folder.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        # The size of the latest version of the folder metadata.
        @[JSON::Field(key: "LatestVersionSize")]
        getter latest_version_size : Int64?

        # The time when the folder was updated.
        @[JSON::Field(key: "ModifiedTimestamp")]
        getter modified_timestamp : Time?

        # The name of the folder.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String?

        # The resource state of the folder.
        @[JSON::Field(key: "ResourceState")]
        getter resource_state : String?

        # The unique identifier created from the subfolders and documents of the folder.
        @[JSON::Field(key: "Signature")]
        getter signature : String?

        # The size of the folder metadata.
        @[JSON::Field(key: "Size")]
        getter size : Int64?

        def initialize(
          @created_timestamp : Time? = nil,
          @creator_id : String? = nil,
          @id : String? = nil,
          @labels : Array(String)? = nil,
          @latest_version_size : Int64? = nil,
          @modified_timestamp : Time? = nil,
          @name : String? = nil,
          @parent_folder_id : String? = nil,
          @resource_state : String? = nil,
          @signature : String? = nil,
          @size : Int64? = nil
        )
        end
      end

      struct GetCurrentUserRequest
        include JSON::Serializable

        # Amazon WorkDocs authentication token.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String

        def initialize(
          @authentication_token : String
        )
        end
      end

      struct GetCurrentUserResponse
        include JSON::Serializable

        # Metadata of the user.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      struct GetDocumentPathRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # A comma-separated list of values. Specify NAME to include the names of the parent folders.
        @[JSON::Field(key: "fields")]
        getter fields : String?

        # The maximum number of levels in the hierarchy to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # This value is not supported.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil,
          @fields : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct GetDocumentPathResponse
        include JSON::Serializable

        # The path information.
        @[JSON::Field(key: "Path")]
        getter path : Types::ResourcePath?

        def initialize(
          @path : Types::ResourcePath? = nil
        )
        end
      end

      struct GetDocumentRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Set this to TRUE to include custom metadata in the response.
        @[JSON::Field(key: "includeCustomMetadata")]
        getter include_custom_metadata : Bool?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil,
          @include_custom_metadata : Bool? = nil
        )
        end
      end

      struct GetDocumentResponse
        include JSON::Serializable

        # The custom metadata on the document.
        @[JSON::Field(key: "CustomMetadata")]
        getter custom_metadata : Hash(String, String)?

        # The metadata details of the document.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::DocumentMetadata?

        def initialize(
          @custom_metadata : Hash(String, String)? = nil,
          @metadata : Types::DocumentMetadata? = nil
        )
        end
      end

      struct GetDocumentVersionRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The version ID of the document.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # A comma-separated list of values. Specify "SOURCE" to include a URL for the source document.
        @[JSON::Field(key: "fields")]
        getter fields : String?

        # Set this to TRUE to include custom metadata in the response.
        @[JSON::Field(key: "includeCustomMetadata")]
        getter include_custom_metadata : Bool?

        def initialize(
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil,
          @fields : String? = nil,
          @include_custom_metadata : Bool? = nil
        )
        end
      end

      struct GetDocumentVersionResponse
        include JSON::Serializable

        # The custom metadata on the document version.
        @[JSON::Field(key: "CustomMetadata")]
        getter custom_metadata : Hash(String, String)?

        # The version metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::DocumentVersionMetadata?

        def initialize(
          @custom_metadata : Hash(String, String)? = nil,
          @metadata : Types::DocumentVersionMetadata? = nil
        )
        end
      end

      struct GetFolderPathRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # A comma-separated list of values. Specify "NAME" to include the names of the parent folders.
        @[JSON::Field(key: "fields")]
        getter fields : String?

        # The maximum number of levels in the hierarchy to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # This value is not supported.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil,
          @fields : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil
        )
        end
      end

      struct GetFolderPathResponse
        include JSON::Serializable

        # The path information.
        @[JSON::Field(key: "Path")]
        getter path : Types::ResourcePath?

        def initialize(
          @path : Types::ResourcePath? = nil
        )
        end
      end

      struct GetFolderRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Set to TRUE to include custom metadata in the response.
        @[JSON::Field(key: "includeCustomMetadata")]
        getter include_custom_metadata : Bool?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil,
          @include_custom_metadata : Bool? = nil
        )
        end
      end

      struct GetFolderResponse
        include JSON::Serializable

        # The custom metadata on the folder.
        @[JSON::Field(key: "CustomMetadata")]
        getter custom_metadata : Hash(String, String)?

        # The metadata of the folder.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::FolderMetadata?

        def initialize(
          @custom_metadata : Hash(String, String)? = nil,
          @metadata : Types::FolderMetadata? = nil
        )
        end
      end

      struct GetResourcesRequest
        include JSON::Serializable

        # The Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The collection type.
        @[JSON::Field(key: "collectionType")]
        getter collection_type : String?

        # The maximum number of resources to return.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The marker for the next set of results. This marker was received from a previous call.
        @[JSON::Field(key: "marker")]
        getter marker : String?

        # The user ID for the resource collection. This is a required field for accessing the API operation
        # using IAM credentials.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @authentication_token : String? = nil,
          @collection_type : String? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct GetResourcesResponse
        include JSON::Serializable

        # The documents in the specified collection.
        @[JSON::Field(key: "Documents")]
        getter documents : Array(Types::DocumentMetadata)?

        # The folders in the specified folder.
        @[JSON::Field(key: "Folders")]
        getter folders : Array(Types::FolderMetadata)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @documents : Array(Types::DocumentMetadata)? = nil,
          @folders : Array(Types::FolderMetadata)? = nil,
          @marker : String? = nil
        )
        end
      end

      # Describes the metadata of a user group.
      struct GroupMetadata
        include JSON::Serializable

        # The ID of the user group.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the group.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The user is undergoing transfer of ownership.
      struct IllegalUserStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct InitiateDocumentVersionUploadRequest
        include JSON::Serializable

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The timestamp when the content of the document was originally created.
        @[JSON::Field(key: "ContentCreatedTimestamp")]
        getter content_created_timestamp : Time?

        # The timestamp when the content of the document was modified.
        @[JSON::Field(key: "ContentModifiedTimestamp")]
        getter content_modified_timestamp : Time?

        # The content type of the document.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The size of the document, in bytes.
        @[JSON::Field(key: "DocumentSizeInBytes")]
        getter document_size_in_bytes : Int64?

        # The ID of the document.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the document.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String?

        def initialize(
          @authentication_token : String? = nil,
          @content_created_timestamp : Time? = nil,
          @content_modified_timestamp : Time? = nil,
          @content_type : String? = nil,
          @document_size_in_bytes : Int64? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @parent_folder_id : String? = nil
        )
        end
      end

      struct InitiateDocumentVersionUploadResponse
        include JSON::Serializable

        # The document metadata.
        @[JSON::Field(key: "Metadata")]
        getter metadata : Types::DocumentMetadata?

        # The upload metadata.
        @[JSON::Field(key: "UploadMetadata")]
        getter upload_metadata : Types::UploadMetadata?

        def initialize(
          @metadata : Types::DocumentMetadata? = nil,
          @upload_metadata : Types::UploadMetadata? = nil
        )
        end
      end

      # The pagination marker or limit fields are not valid.
      struct InvalidArgumentException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested operation is not allowed on the specified comment object.
      struct InvalidCommentOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation is invalid.
      struct InvalidOperationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The password is invalid.
      struct InvalidPasswordException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum of 100,000 files and folders under the parent folder has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Filter based on size (in bytes).
      struct LongRangeType
        include JSON::Serializable

        # The size end range (in bytes).
        @[JSON::Field(key: "EndValue")]
        getter end_value : Int64?

        # The size start range (in bytes).
        @[JSON::Field(key: "StartValue")]
        getter start_value : Int64?

        def initialize(
          @end_value : Int64? = nil,
          @start_value : Int64? = nil
        )
        end
      end

      # Set of options which defines notification preferences of given action.
      struct NotificationOptions
        include JSON::Serializable

        # Text value to be included in the email body.
        @[JSON::Field(key: "EmailMessage")]
        getter email_message : String?

        # Boolean value to indicate an email notification should be sent to the recipients.
        @[JSON::Field(key: "SendEmail")]
        getter send_email : Bool?

        def initialize(
          @email_message : String? = nil,
          @send_email : Bool? = nil
        )
        end
      end

      # Describes the users or user groups.
      struct Participants
        include JSON::Serializable

        # The list of user groups.
        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupMetadata)?

        # The list of users.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::UserMetadata)?

        def initialize(
          @groups : Array(Types::GroupMetadata)? = nil,
          @users : Array(Types::UserMetadata)? = nil
        )
        end
      end

      # Describes the permissions.
      struct PermissionInfo
        include JSON::Serializable

        # The role of the user.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # The type of permissions.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @role : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes a resource.
      struct Principal
        include JSON::Serializable

        # The ID of the resource.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The permission information for the resource.
        @[JSON::Field(key: "Roles")]
        getter roles : Array(Types::PermissionInfo)?

        # The type of resource.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @roles : Array(Types::PermissionInfo)? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified document version is not in the INITIALIZED state.
      struct ProhibitedStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct RemoveAllResourcePermissionsRequest
        include JSON::Serializable

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @resource_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      struct RemoveResourcePermissionRequest
        include JSON::Serializable

        # The principal ID of the resource.
        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String

        # The ID of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The principal type of the resource.
        @[JSON::Field(key: "type")]
        getter principal_type : String?

        def initialize(
          @principal_id : String,
          @resource_id : String,
          @authentication_token : String? = nil,
          @principal_type : String? = nil
        )
        end
      end

      # The response is too large to return. The request must include a filter to reduce the size of the
      # response.
      struct RequestedEntityTooLargeException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is already checked out.
      struct ResourceAlreadyCheckedOutException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the metadata of a resource.
      struct ResourceMetadata
        include JSON::Serializable

        # The ID of the resource.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The original name of the resource before a rename operation.
        @[JSON::Field(key: "OriginalName")]
        getter original_name : String?

        # The owner of the resource.
        @[JSON::Field(key: "Owner")]
        getter owner : Types::UserMetadata?

        # The parent ID of the resource before a rename operation.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # The type of resource.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The version ID of the resource. This is an optional field and is filled for action on document
        # version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @original_name : String? = nil,
          @owner : Types::UserMetadata? = nil,
          @parent_id : String? = nil,
          @type : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Describes the path information of a resource.
      struct ResourcePath
        include JSON::Serializable

        # The components of the resource path.
        @[JSON::Field(key: "Components")]
        getter components : Array(Types::ResourcePathComponent)?

        def initialize(
          @components : Array(Types::ResourcePathComponent)? = nil
        )
        end
      end

      # Describes the resource path.
      struct ResourcePathComponent
        include JSON::Serializable

        # The ID of the resource path.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the resource path.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # List of Documents, Folders, Comments, and Document Versions matching the query.
      struct ResponseItem
        include JSON::Serializable

        # The comment that matches the query.
        @[JSON::Field(key: "CommentMetadata")]
        getter comment_metadata : Types::CommentMetadata?

        # The document that matches the query.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The document version that matches the metadata.
        @[JSON::Field(key: "DocumentVersionMetadata")]
        getter document_version_metadata : Types::DocumentVersionMetadata?

        # The folder that matches the query.
        @[JSON::Field(key: "FolderMetadata")]
        getter folder_metadata : Types::FolderMetadata?

        # The type of item being returned.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The webUrl of the item being returned.
        @[JSON::Field(key: "WebUrl")]
        getter web_url : String?

        def initialize(
          @comment_metadata : Types::CommentMetadata? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @document_version_metadata : Types::DocumentVersionMetadata? = nil,
          @folder_metadata : Types::FolderMetadata? = nil,
          @resource_type : String? = nil,
          @web_url : String? = nil
        )
        end
      end

      struct RestoreDocumentVersionsRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil
        )
        end
      end

      # Filter based on UserIds or GroupIds.
      struct SearchPrincipalType
        include JSON::Serializable

        # UserIds or GroupIds.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The Role of a User or Group.
        @[JSON::Field(key: "Roles")]
        getter roles : Array(String)?

        def initialize(
          @id : String,
          @roles : Array(String)? = nil
        )
        end
      end

      struct SearchResourcesRequest
        include JSON::Serializable

        # A list of attributes to include in the response. Used to request fields that are not normally
        # returned in a standard response.
        @[JSON::Field(key: "AdditionalResponseFields")]
        getter additional_response_fields : Array(String)?

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # Filters results based on entity metadata.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::Filters?

        # Max results count per page.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The marker for the next set of results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Order by results in one or more categories.
        @[JSON::Field(key: "OrderBy")]
        getter order_by : Array(Types::SearchSortResult)?

        # Filters based on the resource owner OrgId. This is a mandatory parameter when using Admin SigV4
        # credentials.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # Filter based on the text field type. A Folder has only a name and no content. A Comment has only
        # content and no name. A Document or Document Version has a name and content
        @[JSON::Field(key: "QueryScopes")]
        getter query_scopes : Array(String)?

        # The String to search for. Searches across different text fields based on request parameters. Use
        # double quotes around the query string for exact phrase matches.
        @[JSON::Field(key: "QueryText")]
        getter query_text : String?

        def initialize(
          @additional_response_fields : Array(String)? = nil,
          @authentication_token : String? = nil,
          @filters : Types::Filters? = nil,
          @limit : Int32? = nil,
          @marker : String? = nil,
          @order_by : Array(Types::SearchSortResult)? = nil,
          @organization_id : String? = nil,
          @query_scopes : Array(String)? = nil,
          @query_text : String? = nil
        )
        end
      end

      struct SearchResourcesResponse
        include JSON::Serializable

        # List of Documents, Folders, Comments, and Document Versions matching the query.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ResponseItem)?

        # The marker to use when requesting the next set of results. If there are no additional results, the
        # string is empty.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        def initialize(
          @items : Array(Types::ResponseItem)? = nil,
          @marker : String? = nil
        )
        end
      end

      # The result of the sort operation.
      struct SearchSortResult
        include JSON::Serializable

        # Sort search results based on this field name.
        @[JSON::Field(key: "Field")]
        getter field : String?

        # Sort direction.
        @[JSON::Field(key: "Order")]
        getter order : String?

        def initialize(
          @field : String? = nil,
          @order : String? = nil
        )
        end
      end

      # One or more of the dependencies is unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the recipient type and ID, if available.
      struct SharePrincipal
        include JSON::Serializable

        # The ID of the recipient.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The role of the recipient.
        @[JSON::Field(key: "Role")]
        getter role : String

        # The type of the recipient.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @role : String,
          @type : String
        )
        end
      end

      # Describes the share results of a resource.
      struct ShareResult
        include JSON::Serializable

        # The ID of the invited user.
        @[JSON::Field(key: "InviteePrincipalId")]
        getter invitee_principal_id : String?

        # The ID of the principal.
        @[JSON::Field(key: "PrincipalId")]
        getter principal_id : String?

        # The role.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # The ID of the resource that was shared.
        @[JSON::Field(key: "ShareId")]
        getter share_id : String?

        # The status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @invitee_principal_id : String? = nil,
          @principal_id : String? = nil,
          @role : String? = nil,
          @share_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The storage limit has been exceeded.
      struct StorageLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The storage limit will be exceeded.
      struct StorageLimitWillExceedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the storage for a user.
      struct StorageRuleType
        include JSON::Serializable

        # The amount of storage allocated, in bytes.
        @[JSON::Field(key: "StorageAllocatedInBytes")]
        getter storage_allocated_in_bytes : Int64?

        # The type of storage.
        @[JSON::Field(key: "StorageType")]
        getter storage_type : String?

        def initialize(
          @storage_allocated_in_bytes : Int64? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # Describes a subscription.
      struct Subscription
        include JSON::Serializable

        # The endpoint of the subscription.
        @[JSON::Field(key: "EndPoint")]
        getter end_point : String?

        # The protocol of the subscription.
        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The ID of the subscription.
        @[JSON::Field(key: "SubscriptionId")]
        getter subscription_id : String?

        def initialize(
          @end_point : String? = nil,
          @protocol : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # The limit has been reached on the number of labels for the specified resource.
      struct TooManyLabelsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You've reached the limit on the number of subscriptions for the WorkDocs instance.
      struct TooManySubscriptionsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation is not permitted.
      struct UnauthorizedOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # The caller does not have access to perform the action on the resource.
      struct UnauthorizedResourceAccessException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateDocumentRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The name of the document.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String?

        # The resource state of the document. Only ACTIVE and RECYCLED are supported.
        @[JSON::Field(key: "ResourceState")]
        getter resource_state : String?

        def initialize(
          @document_id : String,
          @authentication_token : String? = nil,
          @name : String? = nil,
          @parent_folder_id : String? = nil,
          @resource_state : String? = nil
        )
        end
      end

      struct UpdateDocumentVersionRequest
        include JSON::Serializable

        # The ID of the document.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # The version ID of the document.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The status of the version.
        @[JSON::Field(key: "VersionStatus")]
        getter version_status : String?

        def initialize(
          @document_id : String,
          @version_id : String,
          @authentication_token : String? = nil,
          @version_status : String? = nil
        )
        end
      end

      struct UpdateFolderRequest
        include JSON::Serializable

        # The ID of the folder.
        @[JSON::Field(key: "FolderId")]
        getter folder_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The name of the folder.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the parent folder.
        @[JSON::Field(key: "ParentFolderId")]
        getter parent_folder_id : String?

        # The resource state of the folder. Only ACTIVE and RECYCLED are accepted values from the API.
        @[JSON::Field(key: "ResourceState")]
        getter resource_state : String?

        def initialize(
          @folder_id : String,
          @authentication_token : String? = nil,
          @name : String? = nil,
          @parent_folder_id : String? = nil,
          @resource_state : String? = nil
        )
        end
      end

      struct UpdateUserRequest
        include JSON::Serializable

        # The ID of the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Amazon WorkDocs authentication token. Not required when using Amazon Web Services administrator
        # credentials to access the API.
        @[JSON::Field(key: "Authentication")]
        getter authentication_token : String?

        # The given name of the user.
        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # Boolean value to determine whether the user is granted Power user privileges.
        @[JSON::Field(key: "GrantPoweruserPrivileges")]
        getter grant_poweruser_privileges : String?

        # The locale of the user.
        @[JSON::Field(key: "Locale")]
        getter locale : String?

        # The amount of storage for the user.
        @[JSON::Field(key: "StorageRule")]
        getter storage_rule : Types::StorageRuleType?

        # The surname of the user.
        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The time zone ID of the user.
        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String?

        # The type of the user.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @user_id : String,
          @authentication_token : String? = nil,
          @given_name : String? = nil,
          @grant_poweruser_privileges : String? = nil,
          @locale : String? = nil,
          @storage_rule : Types::StorageRuleType? = nil,
          @surname : String? = nil,
          @time_zone_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct UpdateUserResponse
        include JSON::Serializable

        # The user information.
        @[JSON::Field(key: "User")]
        getter user : Types::User?

        def initialize(
          @user : Types::User? = nil
        )
        end
      end

      # Describes the upload.
      struct UploadMetadata
        include JSON::Serializable

        # The signed headers.
        @[JSON::Field(key: "SignedHeaders")]
        getter signed_headers : Hash(String, String)?

        # The URL of the upload.
        @[JSON::Field(key: "UploadUrl")]
        getter upload_url : String?

        def initialize(
          @signed_headers : Hash(String, String)? = nil,
          @upload_url : String? = nil
        )
        end
      end

      # Describes a user.
      struct User
        include JSON::Serializable

        # The time when the user was created.
        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The email address of the user.
        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The given name of the user.
        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # The ID of the user.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The locale of the user.
        @[JSON::Field(key: "Locale")]
        getter locale : String?

        # The time when the user was modified.
        @[JSON::Field(key: "ModifiedTimestamp")]
        getter modified_timestamp : Time?

        # The ID of the organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # The ID of the recycle bin folder.
        @[JSON::Field(key: "RecycleBinFolderId")]
        getter recycle_bin_folder_id : String?

        # The ID of the root folder.
        @[JSON::Field(key: "RootFolderId")]
        getter root_folder_id : String?

        # The status of the user.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The storage for the user.
        @[JSON::Field(key: "Storage")]
        getter storage : Types::UserStorageMetadata?

        # The surname of the user.
        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The time zone ID of the user.
        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String?

        # The type of user.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The login name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @email_address : String? = nil,
          @given_name : String? = nil,
          @id : String? = nil,
          @locale : String? = nil,
          @modified_timestamp : Time? = nil,
          @organization_id : String? = nil,
          @recycle_bin_folder_id : String? = nil,
          @root_folder_id : String? = nil,
          @status : String? = nil,
          @storage : Types::UserStorageMetadata? = nil,
          @surname : String? = nil,
          @time_zone_id : String? = nil,
          @type : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes the metadata of the user.
      struct UserMetadata
        include JSON::Serializable

        # The email address of the user.
        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The given name of the user before a rename operation.
        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # The ID of the user.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The surname of the user.
        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # The name of the user.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @email_address : String? = nil,
          @given_name : String? = nil,
          @id : String? = nil,
          @surname : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes the storage for a user.
      struct UserStorageMetadata
        include JSON::Serializable

        # The storage for a user.
        @[JSON::Field(key: "StorageRule")]
        getter storage_rule : Types::StorageRuleType?

        # The amount of storage used, in bytes.
        @[JSON::Field(key: "StorageUtilizedInBytes")]
        getter storage_utilized_in_bytes : Int64?

        def initialize(
          @storage_rule : Types::StorageRuleType? = nil,
          @storage_utilized_in_bytes : Int64? = nil
        )
        end
      end
    end
  end
end
