require "json"
require "time"

module AwsSdk
  module QBusiness
    module Types

      # Contains details about the OpenAPI schema for a custom plugin. For more information, see custom
      # plugin OpenAPI schemas . You can either include the schema directly in the payload field or you can
      # upload it to an S3 bucket and specify the S3 bucket location in the s3 field.

      struct APISchema
        include JSON::Serializable

        # The JSON or YAML-formatted payload defining the OpenAPI schema for a custom plugin.

        @[JSON::Field(key: "payload")]
        getter payload : String?

        # Contains details about the S3 object containing the OpenAPI schema for a custom plugin. The schema
        # could be in either JSON or YAML format.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3?

        def initialize(
          @payload : String? = nil,
          @s3 : Types::S3? = nil
        )
        end
      end

      # Used to configure access permissions for a document.

      struct AccessConfiguration
        include JSON::Serializable

        # A list of AccessControlList objects.

        @[JSON::Field(key: "accessControls")]
        getter access_controls : Array(Types::AccessControl)

        # Describes the member relation within the AccessControlList object.

        @[JSON::Field(key: "memberRelation")]
        getter member_relation : String?

        def initialize(
          @access_controls : Array(Types::AccessControl),
          @member_relation : String? = nil
        )
        end
      end

      # A list of principals. Each principal can be either a USER or a GROUP and can be designated document
      # access permissions of either ALLOW or DENY .

      struct AccessControl
        include JSON::Serializable

        # Contains a list of principals, where a principal can be either a USER or a GROUP . Each principal
        # can be have the following type of document access: ALLOW or DENY .

        @[JSON::Field(key: "principals")]
        getter principals : Array(Types::Principal)

        # Describes the member relation within a principal list.

        @[JSON::Field(key: "memberRelation")]
        getter member_relation : String?

        def initialize(
          @principals : Array(Types::Principal),
          @member_relation : String? = nil
        )
        end
      end

      # You don't have access to perform this action. Make sure you have the required permission policies
      # and user accounts and try again.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies an allowed action and its associated filter configuration.

      struct ActionConfiguration
        include JSON::Serializable

        # The Amazon Q Business action that is allowed.

        @[JSON::Field(key: "action")]
        getter action : String

        # The filter configuration for the action, if any.

        @[JSON::Field(key: "filterConfiguration")]
        getter filter_configuration : Types::ActionFilterConfiguration?

        def initialize(
          @action : String,
          @filter_configuration : Types::ActionFilterConfiguration? = nil
        )
        end
      end

      # Performs an Amazon Q Business plugin action during a non-streaming chat conversation.

      struct ActionExecution
        include JSON::Serializable

        # A mapping of field names to the field values in input that an end user provides to Amazon Q Business
        # requests to perform their plugin action.

        @[JSON::Field(key: "payload")]
        getter payload : Hash(String, Types::ActionExecutionPayloadField)

        # A string used to retain information about the hierarchical contexts within an action execution event
        # payload.

        @[JSON::Field(key: "payloadFieldNameSeparator")]
        getter payload_field_name_separator : String

        # The identifier of the plugin the action is attached to.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        def initialize(
          @payload : Hash(String, Types::ActionExecutionPayloadField),
          @payload_field_name_separator : String,
          @plugin_id : String
        )
        end
      end

      # A request from an end user signalling an intent to perform an Amazon Q Business plugin action during
      # a streaming chat.

      struct ActionExecutionEvent
        include JSON::Serializable

        # A mapping of field names to the field values in input that an end user provides to Amazon Q Business
        # requests to perform their plugin action.

        @[JSON::Field(key: "payload")]
        getter payload : Hash(String, Types::ActionExecutionPayloadField)

        # A string used to retain information about the hierarchical contexts within a action execution event
        # payload.

        @[JSON::Field(key: "payloadFieldNameSeparator")]
        getter payload_field_name_separator : String

        # The identifier of the plugin for which the action is being requested.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        def initialize(
          @payload : Hash(String, Types::ActionExecutionPayloadField),
          @payload_field_name_separator : String,
          @plugin_id : String
        )
        end
      end

      # A user input field in an plugin action execution payload.

      struct ActionExecutionPayloadField
        include JSON::Serializable

        # The content of a user input field in an plugin action execution payload.

        @[JSON::Field(key: "value")]
        getter value : Types::ActionPayloadFieldValue

        def initialize(
          @value : Types::ActionPayloadFieldValue
        )
        end
      end

      # Specifies filters to apply to an allowed action.

      struct ActionFilterConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "documentAttributeFilter")]
        getter document_attribute_filter : Types::AttributeFilter

        def initialize(
          @document_attribute_filter : Types::AttributeFilter
        )
        end
      end


      struct ActionPayloadFieldValue
        include JSON::Serializable

        def initialize
        end
      end

      # An output event that Amazon Q Business returns to an user who wants to perform a plugin action
      # during a non-streaming chat conversation. It contains information about the selected action with a
      # list of possible user input fields, some pre-populated by Amazon Q Business.

      struct ActionReview
        include JSON::Serializable

        # Field values that an end user needs to provide to Amazon Q Business for Amazon Q Business to perform
        # the requested plugin action.

        @[JSON::Field(key: "payload")]
        getter payload : Hash(String, Types::ActionReviewPayloadField)?

        # A string used to retain information about the hierarchical contexts within an action review payload.

        @[JSON::Field(key: "payloadFieldNameSeparator")]
        getter payload_field_name_separator : String?

        # The identifier of the plugin associated with the action review.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        # The type of plugin.

        @[JSON::Field(key: "pluginType")]
        getter plugin_type : String?

        def initialize(
          @payload : Hash(String, Types::ActionReviewPayloadField)? = nil,
          @payload_field_name_separator : String? = nil,
          @plugin_id : String? = nil,
          @plugin_type : String? = nil
        )
        end
      end

      # An output event that Amazon Q Business returns to an user who wants to perform a plugin action
      # during a streaming chat conversation. It contains information about the selected action with a list
      # of possible user input fields, some pre-populated by Amazon Q Business.

      struct ActionReviewEvent
        include JSON::Serializable

        # The identifier of the conversation with which the action review event is associated.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # Field values that an end user needs to provide to Amazon Q Business for Amazon Q Business to perform
        # the requested plugin action.

        @[JSON::Field(key: "payload")]
        getter payload : Hash(String, Types::ActionReviewPayloadField)?

        # A string used to retain information about the hierarchical contexts within an action review event
        # payload.

        @[JSON::Field(key: "payloadFieldNameSeparator")]
        getter payload_field_name_separator : String?

        # The identifier of the plugin associated with the action review event.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        # The type of plugin.

        @[JSON::Field(key: "pluginType")]
        getter plugin_type : String?

        # The identifier of an Amazon Q Business AI generated associated with the action review event.

        @[JSON::Field(key: "systemMessageId")]
        getter system_message_id : String?

        # The identifier of the conversation with which the plugin action is associated.

        @[JSON::Field(key: "userMessageId")]
        getter user_message_id : String?

        def initialize(
          @conversation_id : String? = nil,
          @payload : Hash(String, Types::ActionReviewPayloadField)? = nil,
          @payload_field_name_separator : String? = nil,
          @plugin_id : String? = nil,
          @plugin_type : String? = nil,
          @system_message_id : String? = nil,
          @user_message_id : String? = nil
        )
        end
      end

      # A user input field in an plugin action review payload.

      struct ActionReviewPayloadField
        include JSON::Serializable

        # The expected data format for the action review input field value. For example, in PTO request, from
        # and to would be of datetime allowed format.

        @[JSON::Field(key: "allowedFormat")]
        getter allowed_format : String?

        # Information about the field values that an end user can use to provide to Amazon Q Business for
        # Amazon Q Business to perform the requested plugin action.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(Types::ActionReviewPayloadFieldAllowedValue)?

        # Use to create a custom form with array fields (fields with nested objects inside an array).

        @[JSON::Field(key: "arrayItemJsonSchema")]
        getter array_item_json_schema : Types::ActionReviewPayloadFieldArrayItemJsonSchema?

        # The field level description of each action review input field. This could be an explanation of the
        # field. In the Amazon Q Business web experience, these descriptions could be used to display as tool
        # tips to help users understand the field.

        @[JSON::Field(key: "displayDescription")]
        getter display_description : String?

        # The name of the field.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The display order of fields in a payload.

        @[JSON::Field(key: "displayOrder")]
        getter display_order : Int32?

        # Information about whether the field is required.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        # The type of field.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The field value.

        @[JSON::Field(key: "value")]
        getter value : Types::ActionPayloadFieldValue?

        def initialize(
          @allowed_format : String? = nil,
          @allowed_values : Array(Types::ActionReviewPayloadFieldAllowedValue)? = nil,
          @array_item_json_schema : Types::ActionReviewPayloadFieldArrayItemJsonSchema? = nil,
          @display_description : String? = nil,
          @display_name : String? = nil,
          @display_order : Int32? = nil,
          @required : Bool? = nil,
          @type : String? = nil,
          @value : Types::ActionPayloadFieldValue? = nil
        )
        end
      end

      # Information about the field values that an end user can use to provide to Amazon Q Business for
      # Amazon Q Business to perform the requested plugin action.

      struct ActionReviewPayloadFieldAllowedValue
        include JSON::Serializable

        # The name of the field.

        @[JSON::Field(key: "displayValue")]
        getter display_value : Types::ActionPayloadFieldValue?

        # The field value.

        @[JSON::Field(key: "value")]
        getter value : Types::ActionPayloadFieldValue?

        def initialize(
          @display_value : Types::ActionPayloadFieldValue? = nil,
          @value : Types::ActionPayloadFieldValue? = nil
        )
        end
      end


      struct ActionReviewPayloadFieldArrayItemJsonSchema
        include JSON::Serializable

        def initialize
        end
      end

      # Summary information for an Amazon Q Business plugin action.

      struct ActionSummary
        include JSON::Serializable

        # The identifier of an Amazon Q Business plugin action.

        @[JSON::Field(key: "actionIdentifier")]
        getter action_identifier : String?

        # The description of an Amazon Q Business plugin action.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name assigned by Amazon Q Business to a plugin action. You can't modify this value.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # An Amazon Q Business suggested prompt and end user can use to invoke a plugin action. This value can
        # be modified and sent as input to initiate an action. For example: Create a Jira task Create a chat
        # assistant task to find the root cause of a specific incident

        @[JSON::Field(key: "instructionExample")]
        getter instruction_example : String?

        def initialize(
          @action_identifier : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @instruction_example : String? = nil
        )
        end
      end

      # Summary information for an Amazon Q Business application.

      struct Application
        include JSON::Serializable

        # The identifier for the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The Unix timestamp when the Amazon Q Business application was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The name of the Amazon Q Business application.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The authentication type being used by a Amazon Q Business application.

        @[JSON::Field(key: "identityType")]
        getter identity_type : String?

        # The Amazon Quick Suite configuration for an Amazon Q Business application that uses Quick Suite as
        # the identity provider.

        @[JSON::Field(key: "quickSightConfiguration")]
        getter quick_sight_configuration : Types::QuickSightConfiguration?

        # The status of the Amazon Q Business application. The application is ready to use when the status is
        # ACTIVE .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @application_id : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @identity_type : String? = nil,
          @quick_sight_configuration : Types::QuickSightConfiguration? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Configuration information about the file upload during chat feature for your application.

      struct AppliedAttachmentsConfiguration
        include JSON::Serializable

        # Information about whether file upload during chat functionality is activated for your application.

        @[JSON::Field(key: "attachmentsControlMode")]
        getter attachments_control_mode : String?

        def initialize(
          @attachments_control_mode : String? = nil
        )
        end
      end

      # The creator mode specific admin controls configured for an Amazon Q Business application. Determines
      # whether an end user can generate LLM-only responses when they use the web experience. For more
      # information, see Admin controls and guardrails and Conversation settings .

      struct AppliedCreatorModeConfiguration
        include JSON::Serializable

        # Information about whether creator mode is enabled or disabled for an Amazon Q Business application.

        @[JSON::Field(key: "creatorModeControl")]
        getter creator_mode_control : String

        def initialize(
          @creator_mode_control : String
        )
        end
      end

      # The chat orchestration specific admin controls configured for an Amazon Q Business application.
      # Determines whether Amazon Q Business automatically routes chat requests across configured plugins
      # and data sources in your Amazon Q Business application. For more information, see Chat orchestration
      # settings .

      struct AppliedOrchestrationConfiguration
        include JSON::Serializable

        # Information about whether chat orchestration is enabled or disabled for an Amazon Q Business
        # application.

        @[JSON::Field(key: "control")]
        getter control : String

        def initialize(
          @control : String
        )
        end
      end


      struct AssociatePermissionRequest
        include JSON::Serializable

        # The list of Amazon Q Business actions that the ISV is allowed to perform.

        @[JSON::Field(key: "actions")]
        getter actions : Array(String)

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The Amazon Resource Name of the IAM role for the ISV that is being granted permission.

        @[JSON::Field(key: "principal")]
        getter principal : String

        # A unique identifier for the policy statement.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        # The conditions that restrict when the permission is effective. These conditions can be used to limit
        # the permission based on specific attributes of the request.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::PermissionCondition)?

        def initialize(
          @actions : Array(String),
          @application_id : String,
          @principal : String,
          @statement_id : String,
          @conditions : Array(Types::PermissionCondition)? = nil
        )
        end
      end


      struct AssociatePermissionResponse
        include JSON::Serializable

        # The JSON representation of the added permission statement.

        @[JSON::Field(key: "statement")]
        getter statement : String?

        def initialize(
          @statement : String? = nil
        )
        end
      end

      # Represents a group associated with a given user in the access control system.

      struct AssociatedGroup
        include JSON::Serializable

        # The name of the group associated with the user. This is used to identify the group in access control
        # decisions.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the associated group. This indicates the scope of the group's applicability.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents an associated user in the access control system.

      struct AssociatedUser
        include JSON::Serializable

        # The unique identifier of the associated user. This is used to identify the user in access control
        # decisions.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of the associated user. This indicates the scope of the user's association.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An attachment in an Amazon Q Business conversation.

      struct Attachment
        include JSON::Serializable

        # The identifier of the Amazon Q Business attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The identifier of the Amazon Q Business conversation the attachment is associated with.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # A CopyFromSource containing a reference to the original source of the Amazon Q Business attachment.

        @[JSON::Field(key: "copyFrom")]
        getter copy_from : Types::CopyFromSource?

        # The Unix timestamp when the Amazon Q Business attachment was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # ErrorDetail providing information about a Amazon Q Business attachment error.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # Size in bytes of the Amazon Q Business attachment.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int32?

        # Filetype of the Amazon Q Business attachment.

        @[JSON::Field(key: "fileType")]
        getter file_type : String?

        # MD5 checksum of the Amazon Q Business attachment contents.

        @[JSON::Field(key: "md5chksum")]
        getter md5chksum : String?

        # Filename of the Amazon Q Business attachment.

        @[JSON::Field(key: "name")]
        getter name : String?

        # AttachmentStatus of the Amazon Q Business attachment.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @attachment_id : String? = nil,
          @conversation_id : String? = nil,
          @copy_from : Types::CopyFromSource? = nil,
          @created_at : Time? = nil,
          @error : Types::ErrorDetail? = nil,
          @file_size : Int32? = nil,
          @file_type : String? = nil,
          @md5chksum : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # This is either a file directly uploaded into a web experience chat or a reference to an existing
      # attachment that is part of a web experience chat.

      struct AttachmentInput
        include JSON::Serializable

        # A reference to an existing attachment.

        @[JSON::Field(key: "copyFrom")]
        getter copy_from : Types::CopyFromSource?

        # The contents of the attachment.

        @[JSON::Field(key: "data")]
        getter data : Bytes?

        # The filename of the attachment.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @copy_from : Types::CopyFromSource? = nil,
          @data : Bytes? = nil,
          @name : String? = nil
        )
        end
      end

      # A file input event activated by a end user request to upload files into their web experience chat.

      struct AttachmentInputEvent
        include JSON::Serializable


        @[JSON::Field(key: "attachment")]
        getter attachment : Types::AttachmentInput?

        def initialize(
          @attachment : Types::AttachmentInput? = nil
        )
        end
      end

      # The details of a file uploaded during chat.

      struct AttachmentOutput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The unique identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # An error associated with a file uploaded during chat.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The name of a file uploaded during chat.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of a file uploaded during chat.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @attachment_id : String? = nil,
          @conversation_id : String? = nil,
          @error : Types::ErrorDetail? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Configuration information for the file upload during chat feature.

      struct AttachmentsConfiguration
        include JSON::Serializable

        # Status information about whether file upload functionality is activated or deactivated for your end
        # user.

        @[JSON::Field(key: "attachmentsControlMode")]
        getter attachments_control_mode : String

        def initialize(
          @attachments_control_mode : String
        )
        end
      end

      # Enables filtering of responses based on document attributes or metadata fields.

      struct AttributeFilter
        include JSON::Serializable

        # Performs a logical AND operation on all supplied filters.

        @[JSON::Field(key: "andAllFilters")]
        getter and_all_filters : Array(Types::AttributeFilter)?

        # Returns true when a document contains all the specified document attributes or metadata fields.
        # Supported for the following document attribute value types : stringListValue .

        @[JSON::Field(key: "containsAll")]
        getter contains_all : Types::DocumentAttribute?

        # Returns true when a document contains any of the specified document attributes or metadata fields.
        # Supported for the following document attribute value types : stringListValue .

        @[JSON::Field(key: "containsAny")]
        getter contains_any : Types::DocumentAttribute?

        # Performs an equals operation on two document attributes or metadata fields. Supported for the
        # following document attribute value types : dateValue , longValue , stringListValue and stringValue .

        @[JSON::Field(key: "equalsTo")]
        getter equals_to : Types::DocumentAttribute?

        # Performs a greater than operation on two document attributes or metadata fields. Supported for the
        # following document attribute value types : dateValue and longValue .

        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::DocumentAttribute?

        # Performs a greater or equals than operation on two document attributes or metadata fields. Supported
        # for the following document attribute value types : dateValue and longValue .

        @[JSON::Field(key: "greaterThanOrEquals")]
        getter greater_than_or_equals : Types::DocumentAttribute?

        # Performs a less than operation on two document attributes or metadata fields. Supported for the
        # following document attribute value types : dateValue and longValue .

        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::DocumentAttribute?

        # Performs a less than or equals operation on two document attributes or metadata fields.Supported for
        # the following document attribute value type : dateValue and longValue .

        @[JSON::Field(key: "lessThanOrEquals")]
        getter less_than_or_equals : Types::DocumentAttribute?

        # Performs a logical NOT operation on all supplied filters.

        @[JSON::Field(key: "notFilter")]
        getter not_filter : Types::AttributeFilter?

        # Performs a logical OR operation on all supplied filters.

        @[JSON::Field(key: "orAllFilters")]
        getter or_all_filters : Array(Types::AttributeFilter)?

        def initialize(
          @and_all_filters : Array(Types::AttributeFilter)? = nil,
          @contains_all : Types::DocumentAttribute? = nil,
          @contains_any : Types::DocumentAttribute? = nil,
          @equals_to : Types::DocumentAttribute? = nil,
          @greater_than : Types::DocumentAttribute? = nil,
          @greater_than_or_equals : Types::DocumentAttribute? = nil,
          @less_than : Types::DocumentAttribute? = nil,
          @less_than_or_equals : Types::DocumentAttribute? = nil,
          @not_filter : Types::AttributeFilter? = nil,
          @or_all_filters : Array(Types::AttributeFilter)? = nil
        )
        end
      end

      # Configuration settings for audio content extraction and processing.

      struct AudioExtractionConfiguration
        include JSON::Serializable

        # The status of audio extraction (ENABLED or DISABLED) for processing audio content from files.

        @[JSON::Field(key: "audioExtractionStatus")]
        getter audio_extraction_status : String

        def initialize(
          @audio_extraction_status : String
        )
        end
      end

      # Details about an audio source, including its identifier, format, and time information.

      struct AudioSourceDetails
        include JSON::Serializable

        # The type of audio extraction performed on the content.

        @[JSON::Field(key: "audioExtractionType")]
        getter audio_extraction_type : String?

        # The ending timestamp in milliseconds for the relevant audio segment.

        @[JSON::Field(key: "endTimeMilliseconds")]
        getter end_time_milliseconds : Int64?

        # Unique identifier for the audio media file.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String?

        # The MIME type of the audio file (e.g., audio/mp3, audio/wav).

        @[JSON::Field(key: "mediaMimeType")]
        getter media_mime_type : String?

        # The starting timestamp in milliseconds for the relevant audio segment.

        @[JSON::Field(key: "startTimeMilliseconds")]
        getter start_time_milliseconds : Int64?

        def initialize(
          @audio_extraction_type : String? = nil,
          @end_time_milliseconds : Int64? = nil,
          @media_id : String? = nil,
          @media_mime_type : String? = nil,
          @start_time_milliseconds : Int64? = nil
        )
        end
      end

      # A request made by Amazon Q Business to a third paty authentication server to authenticate a custom
      # plugin user.

      struct AuthChallengeRequest
        include JSON::Serializable

        # The URL sent by Amazon Q Business to the third party authentication server to authenticate a custom
        # plugin user through an OAuth protocol.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String

        def initialize(
          @authorization_url : String
        )
        end
      end

      # An authentication verification event activated by an end user request to use a custom plugin.

      struct AuthChallengeRequestEvent
        include JSON::Serializable

        # The URL sent by Amazon Q Business to a third party authentication server in response to an
        # authentication verification event activated by an end user request to use a custom plugin.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String

        def initialize(
          @authorization_url : String
        )
        end
      end

      # Contains details of the authentication information received from a third party authentication server
      # in response to an authentication challenge.

      struct AuthChallengeResponse
        include JSON::Serializable

        # The mapping of key-value pairs in an authentication challenge response.

        @[JSON::Field(key: "responseMap")]
        getter response_map : Hash(String, String)

        def initialize(
          @response_map : Hash(String, String)
        )
        end
      end

      # An authentication verification event response by a third party authentication server to Amazon Q
      # Business.

      struct AuthChallengeResponseEvent
        include JSON::Serializable

        # The mapping of key-value pairs in an authentication challenge response.

        @[JSON::Field(key: "responseMap")]
        getter response_map : Hash(String, String)

        def initialize(
          @response_map : Hash(String, String)
        )
        end
      end

      # Subscription configuration information for an Amazon Q Business application using IAM identity
      # federation for user management.

      struct AutoSubscriptionConfiguration
        include JSON::Serializable

        # Describes whether automatic subscriptions are enabled for an Amazon Q Business application using IAM
        # identity federation for user management.

        @[JSON::Field(key: "autoSubscribe")]
        getter auto_subscribe : String

        # Describes the default subscription type assigned to an Amazon Q Business application using IAM
        # identity federation for user management. If the value for autoSubscribe is set to ENABLED you must
        # select a value for this field.

        @[JSON::Field(key: "defaultSubscriptionType")]
        getter default_subscription_type : String?

        def initialize(
          @auto_subscribe : String,
          @default_subscription_type : String? = nil
        )
        end
      end

      # Information about the basic authentication credentials used to configure a plugin.

      struct BasicAuthConfiguration
        include JSON::Serializable

        # The ARN of an IAM role used by Amazon Q Business to access the basic authentication credentials
        # stored in a Secrets Manager secret.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN of the Secrets Manager secret that stores the basic authentication credentials used for
        # plugin configuration..

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        def initialize(
          @role_arn : String,
          @secret_arn : String
        )
        end
      end


      struct BatchDeleteDocumentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # Documents deleted from the Amazon Q Business index.

        @[JSON::Field(key: "documents")]
        getter documents : Array(Types::DeleteDocument)

        # The identifier of the Amazon Q Business index that contains the documents to delete.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data source sync during which the documents were deleted.

        @[JSON::Field(key: "dataSourceSyncId")]
        getter data_source_sync_id : String?

        def initialize(
          @application_id : String,
          @documents : Array(Types::DeleteDocument),
          @index_id : String,
          @data_source_sync_id : String? = nil
        )
        end
      end


      struct BatchDeleteDocumentResponse
        include JSON::Serializable

        # A list of documents that couldn't be removed from the Amazon Q Business index. Each entry contains
        # an error message that indicates why the document couldn't be removed from the index.

        @[JSON::Field(key: "failedDocuments")]
        getter failed_documents : Array(Types::FailedDocument)?

        def initialize(
          @failed_documents : Array(Types::FailedDocument)? = nil
        )
        end
      end


      struct BatchPutDocumentRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # One or more documents to add to the index. Ensure that the name of your document doesn't contain any
        # confidential information. Amazon Q Business returns document names in chat responses and citations
        # when relevant.

        @[JSON::Field(key: "documents")]
        getter documents : Array(Types::Document)

        # The identifier of the Amazon Q Business index to add the documents to.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data source sync during which the documents were added.

        @[JSON::Field(key: "dataSourceSyncId")]
        getter data_source_sync_id : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @application_id : String,
          @documents : Array(Types::Document),
          @index_id : String,
          @data_source_sync_id : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct BatchPutDocumentResponse
        include JSON::Serializable

        # A list of documents that were not added to the Amazon Q Business index because the document failed a
        # validation check. Each document contains an error message that indicates why the document couldn't
        # be added to the index.

        @[JSON::Field(key: "failedDocuments")]
        getter failed_documents : Array(Types::FailedDocument)?

        def initialize(
          @failed_documents : Array(Types::FailedDocument)? = nil
        )
        end
      end

      # Provides information about the phrases blocked from chat by your chat control configuration.

      struct BlockedPhrasesConfiguration
        include JSON::Serializable

        # A list of phrases blocked from a Amazon Q Business web experience chat. Each phrase can contain a
        # maximum of 36 characters. The list can contain a maximum of 20 phrases.

        @[JSON::Field(key: "blockedPhrases")]
        getter blocked_phrases : Array(String)?

        # The configured custom message displayed to an end user informing them that they've used a blocked
        # phrase during chat.

        @[JSON::Field(key: "systemMessageOverride")]
        getter system_message_override : String?

        def initialize(
          @blocked_phrases : Array(String)? = nil,
          @system_message_override : String? = nil
        )
        end
      end

      # Updates a blocked phrases configuration in your Amazon Q Business application.

      struct BlockedPhrasesConfigurationUpdate
        include JSON::Serializable

        # Creates or updates a blocked phrases configuration in your Amazon Q Business application.

        @[JSON::Field(key: "blockedPhrasesToCreateOrUpdate")]
        getter blocked_phrases_to_create_or_update : Array(String)?

        # Deletes a blocked phrases configuration in your Amazon Q Business application.

        @[JSON::Field(key: "blockedPhrasesToDelete")]
        getter blocked_phrases_to_delete : Array(String)?

        # The configured custom message displayed to your end user when they use blocked phrase during chat.

        @[JSON::Field(key: "systemMessageOverride")]
        getter system_message_override : String?

        def initialize(
          @blocked_phrases_to_create_or_update : Array(String)? = nil,
          @blocked_phrases_to_delete : Array(String)? = nil,
          @system_message_override : String? = nil
        )
        end
      end

      # The container for browser extension configuration for an Amazon Q Business web experience.

      struct BrowserExtensionConfiguration
        include JSON::Serializable

        # Specify the browser extensions allowed for your Amazon Q web experience. CHROME — Enables the
        # extension for Chromium-based browsers (Google Chrome, Microsoft Edge, Opera, etc.). FIREFOX —
        # Enables the extension for Mozilla Firefox. CHROME and FIREFOX — Enable the extension for
        # Chromium-based browsers and Mozilla Firefox.

        @[JSON::Field(key: "enabledBrowserExtensions")]
        getter enabled_browser_extensions : Array(String)

        def initialize(
          @enabled_browser_extensions : Array(String)
        )
        end
      end


      struct CancelSubscriptionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application for which the subscription is being cancelled.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business subscription being cancelled.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String

        def initialize(
          @application_id : String,
          @subscription_id : String
        )
        end
      end


      struct CancelSubscriptionResponse
        include JSON::Serializable

        # The type of your current Amazon Q Business subscription.

        @[JSON::Field(key: "currentSubscription")]
        getter current_subscription : Types::SubscriptionDetails?

        # The type of the Amazon Q Business subscription for the next month.

        @[JSON::Field(key: "nextSubscription")]
        getter next_subscription : Types::SubscriptionDetails?

        # The Amazon Resource Name (ARN) of the Amazon Q Business subscription being cancelled.

        @[JSON::Field(key: "subscriptionArn")]
        getter subscription_arn : String?

        def initialize(
          @current_subscription : Types::SubscriptionDetails? = nil,
          @next_subscription : Types::SubscriptionDetails? = nil,
          @subscription_arn : String? = nil
        )
        end
      end


      struct ChatInput
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to a streaming Amazon Q Business
        # conversation.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # A token that you provide to identify the chat input.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The streaming input for the Chat API.

        @[JSON::Field(key: "inputStream")]
        getter input_stream : Types::ChatInputStream?

        # The identifier used to associate a user message with a AI generated response.

        @[JSON::Field(key: "parentMessageId")]
        getter parent_message_id : String?

        # The group names that a user associated with the chat input belongs to.

        @[JSON::Field(key: "userGroups")]
        getter user_groups : Array(String)?

        # The identifier of the user attached to the chat input.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @client_token : String? = nil,
          @conversation_id : String? = nil,
          @input_stream : Types::ChatInputStream? = nil,
          @parent_message_id : String? = nil,
          @user_groups : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The streaming input for the Chat API.

      struct ChatInputStream
        include JSON::Serializable

        # A request from an end user to perform an Amazon Q Business plugin action.

        @[JSON::Field(key: "actionExecutionEvent")]
        getter action_execution_event : Types::ActionExecutionEvent?

        # A request by an end user to upload a file during chat.

        @[JSON::Field(key: "attachmentEvent")]
        getter attachment_event : Types::AttachmentInputEvent?

        # An authentication verification event response by a third party authentication server to Amazon Q
        # Business.

        @[JSON::Field(key: "authChallengeResponseEvent")]
        getter auth_challenge_response_event : Types::AuthChallengeResponseEvent?

        # A configuration event activated by an end user request to select a specific chat mode.

        @[JSON::Field(key: "configurationEvent")]
        getter configuration_event : Types::ConfigurationEvent?

        # The end of the streaming input for the Chat API.

        @[JSON::Field(key: "endOfInputEvent")]
        getter end_of_input_event : Types::EndOfInputEvent?

        # Information about the payload of the ChatInputStream event containing the end user message input.

        @[JSON::Field(key: "textEvent")]
        getter text_event : Types::TextInputEvent?

        def initialize(
          @action_execution_event : Types::ActionExecutionEvent? = nil,
          @attachment_event : Types::AttachmentInputEvent? = nil,
          @auth_challenge_response_event : Types::AuthChallengeResponseEvent? = nil,
          @configuration_event : Types::ConfigurationEvent? = nil,
          @end_of_input_event : Types::EndOfInputEvent? = nil,
          @text_event : Types::TextInputEvent? = nil
        )
        end
      end

      # Configuration information for Amazon Q Business conversation modes. For more information, see Admin
      # controls and guardrails and Conversation settings .

      struct ChatModeConfiguration
        include JSON::Serializable

        # Configuration information required to invoke chat in PLUGIN_MODE .

        @[JSON::Field(key: "pluginConfiguration")]
        getter plugin_configuration : Types::PluginConfiguration?

        def initialize(
          @plugin_configuration : Types::PluginConfiguration? = nil
        )
        end
      end


      struct ChatOutput
        include JSON::Serializable

        # The streaming output for the Chat API.

        @[JSON::Field(key: "outputStream")]
        getter output_stream : Types::ChatOutputStream?

        def initialize(
          @output_stream : Types::ChatOutputStream? = nil
        )
        end
      end

      # The streaming output for the Chat API.

      struct ChatOutputStream
        include JSON::Serializable

        # A request from Amazon Q Business to the end user for information Amazon Q Business needs to
        # successfully complete a requested plugin action.

        @[JSON::Field(key: "actionReviewEvent")]
        getter action_review_event : Types::ActionReviewEvent?

        # An authentication verification event activated by an end user request to use a custom plugin.

        @[JSON::Field(key: "authChallengeRequestEvent")]
        getter auth_challenge_request_event : Types::AuthChallengeRequestEvent?

        # A failed file upload event during a web experience chat.

        @[JSON::Field(key: "failedAttachmentEvent")]
        getter failed_attachment_event : Types::FailedAttachmentEvent?

        # A metadata event for a AI-generated text output message in a Amazon Q Business conversation.

        @[JSON::Field(key: "metadataEvent")]
        getter metadata_event : Types::MetadataEvent?

        # Information about the payload of the ChatOutputStream event containing the AI-generated message
        # output.

        @[JSON::Field(key: "textEvent")]
        getter text_event : Types::TextOutputEvent?

        def initialize(
          @action_review_event : Types::ActionReviewEvent? = nil,
          @auth_challenge_request_event : Types::AuthChallengeRequestEvent? = nil,
          @failed_attachment_event : Types::FailedAttachmentEvent? = nil,
          @metadata_event : Types::MetadataEvent? = nil,
          @text_event : Types::TextOutputEvent? = nil
        )
        end
      end

      # Configuration details that define how Amazon Q Business generates and formats responses to user
      # queries in chat interactions. This configuration allows administrators to customize response
      # characteristics to meet specific organizational needs and communication standards.

      struct ChatResponseConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the chat response configuration, which uniquely identifies the
        # resource across all Amazon Web Services services and accounts.

        @[JSON::Field(key: "chatResponseConfigurationArn")]
        getter chat_response_configuration_arn : String

        # A unique identifier for your chat response configuration settings, used to reference and manage the
        # configuration within the Amazon Q Business service.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String

        # A human-readable name for the chat response configuration, making it easier to identify and manage
        # multiple configurations within an organization.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The current status of the chat response configuration, indicating whether it is active, pending, or
        # in another state that affects its availability for use in chat interactions.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp indicating when the chat response configuration was initially created, useful for
        # tracking the lifecycle of configuration resources.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A summary of the response configuration settings, providing a concise overview of the key parameters
        # that define how responses are generated and formatted.

        @[JSON::Field(key: "responseConfigurationSummary")]
        getter response_configuration_summary : String?

        # The timestamp indicating when the chat response configuration was last modified, helping
        # administrators track changes and maintain version awareness.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @chat_response_configuration_arn : String,
          @chat_response_configuration_id : String,
          @display_name : String,
          @status : String,
          @created_at : Time? = nil,
          @response_configuration_summary : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Detailed information about a chat response configuration, including comprehensive settings and
      # parameters that define how Amazon Q Business generates and formats responses.

      struct ChatResponseConfigurationDetail
        include JSON::Serializable


        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # A summary of the response configuration details, providing a concise overview of the key parameters
        # and settings that define the response generation behavior.

        @[JSON::Field(key: "responseConfigurationSummary")]
        getter response_configuration_summary : String?

        # A collection of specific response configuration settings that collectively define how responses are
        # generated, formatted, and presented to users in chat interactions.

        @[JSON::Field(key: "responseConfigurations")]
        getter response_configurations : Hash(String, Types::ResponseConfiguration)?

        # The current status of the chat response configuration, indicating whether it is active, pending, or
        # in another state that affects its availability for use.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp indicating when the detailed chat response configuration was last modified, helping
        # administrators track changes and maintain version awareness.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @error : Types::ErrorDetail? = nil,
          @response_configuration_summary : String? = nil,
          @response_configurations : Hash(String, Types::ResponseConfiguration)? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct ChatSyncInput
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the Amazon Q Business conversation.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # A request from an end user to perform an Amazon Q Business plugin action.

        @[JSON::Field(key: "actionExecution")]
        getter action_execution : Types::ActionExecution?

        # A list of files uploaded directly during chat. You can upload a maximum of 5 files of upto 10 MB
        # each.

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::AttachmentInput)?

        # Enables filtering of Amazon Q Business web experience responses based on document attributes or
        # metadata fields.

        @[JSON::Field(key: "attributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # An authentication verification event response by a third party authentication server to Amazon Q
        # Business.

        @[JSON::Field(key: "authChallengeResponse")]
        getter auth_challenge_response : Types::AuthChallengeResponse?

        # The chatMode parameter determines the chat modes available to Amazon Q Business users:
        # RETRIEVAL_MODE - If you choose this mode, Amazon Q generates responses solely from the data sources
        # connected and indexed by the application. If an answer is not found in the data sources or there are
        # no data sources available, Amazon Q will respond with a " No Answer Found " message, unless LLM
        # knowledge has been enabled. In that case, Amazon Q will generate a response from the LLM knowledge
        # CREATOR_MODE - By selecting this mode, you can choose to generate responses only from the LLM
        # knowledge. You can also attach files and have Amazon Q generate a response based on the data in
        # those files. If the attached files do not contain an answer for the query, Amazon Q will
        # automatically fall back to generating a response from the LLM knowledge. PLUGIN_MODE - By selecting
        # this mode, users can choose to use plugins in chat to get their responses. If none of the modes are
        # selected, Amazon Q will only respond using the information from the attached files. For more
        # information, see Admin controls and guardrails , Plugins , and Response sources .

        @[JSON::Field(key: "chatMode")]
        getter chat_mode : String?

        # The chat mode configuration for an Amazon Q Business application.

        @[JSON::Field(key: "chatModeConfiguration")]
        getter chat_mode_configuration : Types::ChatModeConfiguration?

        # A token that you provide to identify a chat request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The identifier of the previous system message in a conversation.

        @[JSON::Field(key: "parentMessageId")]
        getter parent_message_id : String?

        # The group names that a user associated with the chat input belongs to.

        @[JSON::Field(key: "userGroups")]
        getter user_groups : Array(String)?

        # The identifier of the user attached to the chat input.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # A end user message in a conversation.

        @[JSON::Field(key: "userMessage")]
        getter user_message : String?

        def initialize(
          @application_id : String,
          @action_execution : Types::ActionExecution? = nil,
          @attachments : Array(Types::AttachmentInput)? = nil,
          @attribute_filter : Types::AttributeFilter? = nil,
          @auth_challenge_response : Types::AuthChallengeResponse? = nil,
          @chat_mode : String? = nil,
          @chat_mode_configuration : Types::ChatModeConfiguration? = nil,
          @client_token : String? = nil,
          @conversation_id : String? = nil,
          @parent_message_id : String? = nil,
          @user_groups : Array(String)? = nil,
          @user_id : String? = nil,
          @user_message : String? = nil
        )
        end
      end


      struct ChatSyncOutput
        include JSON::Serializable

        # A request from Amazon Q Business to the end user for information Amazon Q Business needs to
        # successfully complete a requested plugin action.

        @[JSON::Field(key: "actionReview")]
        getter action_review : Types::ActionReview?

        # An authentication verification event activated by an end user request to use a custom plugin.

        @[JSON::Field(key: "authChallengeRequest")]
        getter auth_challenge_request : Types::AuthChallengeRequest?

        # The identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # A list of files which failed to upload during chat.

        @[JSON::Field(key: "failedAttachments")]
        getter failed_attachments : Array(Types::AttachmentOutput)?

        # The source documents used to generate the conversation response.

        @[JSON::Field(key: "sourceAttributions")]
        getter source_attributions : Array(Types::SourceAttribution)?

        # An AI-generated message in a conversation.

        @[JSON::Field(key: "systemMessage")]
        getter system_message : String?

        # The identifier of an Amazon Q Business AI generated message within the conversation.

        @[JSON::Field(key: "systemMessageId")]
        getter system_message_id : String?

        # The identifier of an Amazon Q Business end user text input message within the conversation.

        @[JSON::Field(key: "userMessageId")]
        getter user_message_id : String?

        def initialize(
          @action_review : Types::ActionReview? = nil,
          @auth_challenge_request : Types::AuthChallengeRequest? = nil,
          @conversation_id : String? = nil,
          @failed_attachments : Array(Types::AttachmentOutput)? = nil,
          @source_attributions : Array(Types::SourceAttribution)? = nil,
          @system_message : String? = nil,
          @system_message_id : String? = nil,
          @user_message_id : String? = nil
        )
        end
      end


      struct CheckDocumentAccessRequest
        include JSON::Serializable

        # The unique identifier of the application. This is required to identify the specific Amazon Q
        # Business application context for the document access check.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the document. Specifies which document's access permissions are being
        # checked.

        @[JSON::Field(key: "documentId")]
        getter document_id : String

        # The unique identifier of the index. Used to locate the correct index within the application where
        # the document is stored.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The unique identifier of the user. Used to check the access permissions for this specific user
        # against the document's ACL.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The unique identifier of the data source. Identifies the specific data source from which the
        # document originates. Should not be used when a document is uploaded directly with BatchPutDocument,
        # as no dataSourceId is available or necessary.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        def initialize(
          @application_id : String,
          @document_id : String,
          @index_id : String,
          @user_id : String,
          @data_source_id : String? = nil
        )
        end
      end


      struct CheckDocumentAccessResponse
        include JSON::Serializable

        # The Access Control List (ACL) associated with the document. Includes allowlist and denylist
        # conditions that determine user access.

        @[JSON::Field(key: "documentAcl")]
        getter document_acl : Types::DocumentAcl?

        # A boolean value indicating whether the specified user has access to the document, either direct
        # access or transitive access via groups and aliases attached to the document.

        @[JSON::Field(key: "hasAccess")]
        getter has_access : Bool?

        # An array of aliases associated with the user. This includes both global and local aliases, each with
        # a name and type.

        @[JSON::Field(key: "userAliases")]
        getter user_aliases : Array(Types::AssociatedUser)?

        # An array of groups the user is part of for the specified data source. Each group has a name and
        # type.

        @[JSON::Field(key: "userGroups")]
        getter user_groups : Array(Types::AssociatedGroup)?

        def initialize(
          @document_acl : Types::DocumentAcl? = nil,
          @has_access : Bool? = nil,
          @user_aliases : Array(Types::AssociatedUser)? = nil,
          @user_groups : Array(Types::AssociatedGroup)? = nil
        )
        end
      end

      # A configuration event activated by an end user request to select a specific chat mode.

      struct ConfigurationEvent
        include JSON::Serializable


        @[JSON::Field(key: "attributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # The chat modes available to an Amazon Q Business end user. RETRIEVAL_MODE - The default chat mode
        # for an Amazon Q Business application. When this mode is enabled, Amazon Q Business generates
        # responses only from data sources connected to an Amazon Q Business application. CREATOR_MODE - By
        # selecting this mode, users can choose to generate responses only from the LLM knowledge, without
        # consulting connected data sources, for a chat request. PLUGIN_MODE - By selecting this mode, users
        # can choose to use plugins in chat. For more information, see Admin controls and guardrails , Plugins
        # , and Conversation settings .

        @[JSON::Field(key: "chatMode")]
        getter chat_mode : String?


        @[JSON::Field(key: "chatModeConfiguration")]
        getter chat_mode_configuration : Types::ChatModeConfiguration?

        def initialize(
          @attribute_filter : Types::AttributeFilter? = nil,
          @chat_mode : String? = nil,
          @chat_mode_configuration : Types::ChatModeConfiguration? = nil
        )
        end
      end

      # You are trying to perform an action that conflicts with the current status of your resource. Fix any
      # inconsistencies with your resources and try again.

      struct ConflictException
        include JSON::Serializable

        # The message describing a ConflictException .

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource affected.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource affected.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A rule for configuring how Amazon Q Business responds when it encounters a a blocked topic. You can
      # configure a custom message to inform your end users that they have asked about a restricted topic
      # and suggest any next steps they should take.

      struct ContentBlockerRule
        include JSON::Serializable

        # The configured custom message displayed to an end user informing them that they've used a blocked
        # phrase during chat.

        @[JSON::Field(key: "systemMessageOverride")]
        getter system_message_override : String?

        def initialize(
          @system_message_override : String? = nil
        )
        end
      end

      # Rules for retrieving content from data sources connected to a Amazon Q Business application for a
      # specific topic control configuration.

      struct ContentRetrievalRule
        include JSON::Serializable

        # Specifies data sources in a Amazon Q Business application to use for content generation.

        @[JSON::Field(key: "eligibleDataSources")]
        getter eligible_data_sources : Array(Types::EligibleDataSource)?

        def initialize(
          @eligible_data_sources : Array(Types::EligibleDataSource)? = nil
        )
        end
      end

      # Specifies the source of content to search in.

      struct ContentSource
        include JSON::Serializable

        # The retriever to use as the content source.

        @[JSON::Field(key: "retriever")]
        getter retriever : Types::RetrieverContentSource?

        def initialize(
          @retriever : Types::RetrieverContentSource? = nil
        )
        end
      end

      # A conversation in an Amazon Q Business application.

      struct Conversation
        include JSON::Serializable

        # The identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The start time of the conversation.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The title of the conversation.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @conversation_id : String? = nil,
          @start_time : Time? = nil,
          @title : String? = nil
        )
        end
      end

      # The source reference for an existing attachment in an existing conversation.

      struct ConversationSource
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # The unique identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        def initialize(
          @attachment_id : String,
          @conversation_id : String
        )
        end
      end

      # The source reference for an existing attachment.

      struct CopyFromSource
        include JSON::Serializable

        # A reference to an attachment in an existing conversation.

        @[JSON::Field(key: "conversation")]
        getter conversation : Types::ConversationSource?

        def initialize(
          @conversation : Types::ConversationSource? = nil
        )
        end
      end


      struct CreateAnonymousWebExperienceUrlRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application environment attached to the web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String

        # The duration of the session associated with the unique URL for the web experience.

        @[JSON::Field(key: "sessionDurationInMinutes")]
        getter session_duration_in_minutes : Int32?

        def initialize(
          @application_id : String,
          @web_experience_id : String,
          @session_duration_in_minutes : Int32? = nil
        )
        end
      end


      struct CreateAnonymousWebExperienceUrlResponse
        include JSON::Serializable

        # The unique URL for accessing the web experience. This URL can only be used once and must be used
        # within 5 minutes after it's generated.

        @[JSON::Field(key: "anonymousUrl")]
        getter anonymous_url : String?

        def initialize(
          @anonymous_url : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # A name for the Amazon Q Business application.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # An option to allow end users to upload files directly during chat.

        @[JSON::Field(key: "attachmentsConfiguration")]
        getter attachments_configuration : Types::AttachmentsConfiguration?

        # The OIDC client ID for a Amazon Q Business application.

        @[JSON::Field(key: "clientIdsForOIDC")]
        getter client_ids_for_oidc : Array(String)?

        # A token that you provide to identify the request to create your Amazon Q Business application.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the Amazon Q Business application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the KMS key that is used to encrypt your data. Amazon Q Business doesn't support
        # asymmetric keys.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The Amazon Resource Name (ARN) of an identity provider being used by an Amazon Q Business
        # application.

        @[JSON::Field(key: "iamIdentityProviderArn")]
        getter iam_identity_provider_arn : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center instance you are either creating for—or
        # connecting to—your Amazon Q Business application.

        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        # The authentication type being used by a Amazon Q Business application.

        @[JSON::Field(key: "identityType")]
        getter identity_type : String?

        # Configuration information about chat response personalization. For more information, see
        # Personalizing chat responses

        @[JSON::Field(key: "personalizationConfiguration")]
        getter personalization_configuration : Types::PersonalizationConfiguration?

        # An option to allow end users to create and use Amazon Q Apps in the web experience.

        @[JSON::Field(key: "qAppsConfiguration")]
        getter q_apps_configuration : Types::QAppsConfiguration?

        # The Amazon Quick Suite configuration for an Amazon Q Business application that uses Quick Suite for
        # authentication. This configuration is required if your application uses Quick Suite as the identity
        # provider. For more information, see Creating an Amazon Quick Suite integrated application .

        @[JSON::Field(key: "quickSightConfiguration")]
        getter quick_sight_configuration : Types::QuickSightConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role with permissions to access your Amazon CloudWatch logs
        # and metrics. If this property is not specified, Amazon Q Business will create a service linked role
        # (SLR) and use it as the application's role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of key-value pairs that identify or categorize your Amazon Q Business application. You can
        # also use tags to help control access to the application. Tag keys and values can consist of Unicode
        # letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @display_name : String,
          @attachments_configuration : Types::AttachmentsConfiguration? = nil,
          @client_ids_for_oidc : Array(String)? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @iam_identity_provider_arn : String? = nil,
          @identity_center_instance_arn : String? = nil,
          @identity_type : String? = nil,
          @personalization_configuration : Types::PersonalizationConfiguration? = nil,
          @q_apps_configuration : Types::QAppsConfiguration? = nil,
          @quick_sight_configuration : Types::QuickSightConfiguration? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q Business application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        def initialize(
          @application_arn : String? = nil,
          @application_id : String? = nil
        )
        end
      end


      struct CreateChatResponseConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application for which to create the new chat response
        # configuration.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # A human-readable name for the new chat response configuration, making it easier to identify and
        # manage among multiple configurations.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # A collection of response configuration settings that define how Amazon Q Business will generate and
        # format responses to user queries in chat interactions.

        @[JSON::Field(key: "responseConfigurations")]
        getter response_configurations : Hash(String, Types::ResponseConfiguration)

        # A unique, case-sensitive identifier to ensure idempotency of the request. This helps prevent the
        # same configuration from being created multiple times if retries occur.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A list of key-value pairs to apply as tags to the new chat response configuration, enabling
        # categorization and management of resources across Amazon Web Services services.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_id : String,
          @display_name : String,
          @response_configurations : Hash(String, Types::ResponseConfiguration),
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateChatResponseConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created chat response configuration, which uniquely
        # identifies the resource across all Amazon Web Services services.

        @[JSON::Field(key: "chatResponseConfigurationArn")]
        getter chat_response_configuration_arn : String

        # The unique identifier assigned to a newly created chat response configuration, used for subsequent
        # operations on this resource.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String

        def initialize(
          @chat_response_configuration_arn : String,
          @chat_response_configuration_id : String
        )
        end
      end


      struct CreateDataAccessorRequest
        include JSON::Serializable

        # A list of action configurations specifying the allowed actions and any associated filters.

        @[JSON::Field(key: "actionConfigurations")]
        getter action_configurations : Array(Types::ActionConfiguration)

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # A friendly name for the data accessor.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The Amazon Resource Name (ARN) of the IAM role for the ISV that will be accessing the data.

        @[JSON::Field(key: "principal")]
        getter principal : String

        # The authentication configuration details for the data accessor. This specifies how the ISV will
        # authenticate when accessing data through this data accessor.

        @[JSON::Field(key: "authenticationDetail")]
        getter authentication_detail : Types::DataAccessorAuthenticationDetail?

        # A unique, case-sensitive identifier you provide to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to associate with the data accessor.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @action_configurations : Array(Types::ActionConfiguration),
          @application_id : String,
          @display_name : String,
          @principal : String,
          @authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDataAccessorResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created data accessor.

        @[JSON::Field(key: "dataAccessorArn")]
        getter data_accessor_arn : String

        # The unique identifier of the created data accessor.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String

        # The Amazon Resource Name (ARN) of the IAM Identity Center application created for this data
        # accessor.

        @[JSON::Field(key: "idcApplicationArn")]
        getter idc_application_arn : String

        def initialize(
          @data_accessor_arn : String,
          @data_accessor_id : String,
          @idc_application_arn : String
        )
        end
      end


      struct CreateDataSourceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application the data source will be attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # Configuration information to connect your data source repository to Amazon Q Business. Use this
        # parameter to provide a JSON schema with configuration information specific to your data source
        # connector. Each data source has a JSON schema provided by Amazon Q Business that you must use. For
        # example, the Amazon S3 and Web Crawler connectors require the following JSON schemas: Amazon S3 JSON
        # schema Web Crawler JSON schema You can find configuration templates for your specific data source
        # using the following steps: Navigate to the Supported connectors page in the Amazon Q Business User
        # Guide, and select the data source of your choice. Then, from your specific data source connector
        # page, select Using the API . You will find the JSON schema for your data source, including parameter
        # descriptions, in this section.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfiguration

        # A name for the data source connector.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The identifier of the index that you want to use with the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # A token you provide to identify a request to create a data source connector. Multiple calls to the
        # CreateDataSource API with the same client token will create only one data source connector.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the data source connector.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "documentEnrichmentConfiguration")]
        getter document_enrichment_configuration : Types::DocumentEnrichmentConfiguration?

        # The configuration for extracting information from media in documents during ingestion.

        @[JSON::Field(key: "mediaExtractionConfiguration")]
        getter media_extraction_configuration : Types::MediaExtractionConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required
        # resources. This field is required for all connector types except custom connectors, where it is
        # optional.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Sets the frequency for Amazon Q Business to check the documents in your data source repository and
        # update your index. If you don't set a schedule, Amazon Q Business won't periodically update the
        # index. Specify a cron- format schedule string or an empty string to indicate that the index is
        # updated on demand. You can't specify the Schedule parameter when the Type parameter is set to CUSTOM
        # . If you do, you receive a ValidationException exception.

        @[JSON::Field(key: "syncSchedule")]
        getter sync_schedule : String?

        # A list of key-value pairs that identify or categorize the data source connector. You can also use
        # tags to help control access to the data source connector. Tag keys and values can consist of Unicode
        # letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Configuration information for an Amazon VPC (Virtual Private Cloud) to connect to your data source.
        # For more information, see Using Amazon VPC with Amazon Q Business connectors .

        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @application_id : String,
          @configuration : Types::DataSourceConfiguration,
          @display_name : String,
          @index_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
          @media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
          @role_arn : String? = nil,
          @sync_schedule : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct CreateDataSourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a data source in an Amazon Q Business application.

        @[JSON::Field(key: "dataSourceArn")]
        getter data_source_arn : String?

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        def initialize(
          @data_source_arn : String? = nil,
          @data_source_id : String? = nil
        )
        end
      end


      struct CreateIndexRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the index.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # A name for the Amazon Q Business index.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The capacity units you want to provision for your index. You can add and remove capacity to fit your
        # usage needs.

        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::IndexCapacityConfiguration?

        # A token that you provide to identify the request to create an index. Multiple calls to the
        # CreateIndex API with the same client token will create only one index.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description for the Amazon Q Business index.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of key-value pairs that identify or categorize the index. You can also use tags to help
        # control access to the index. Tag keys and values can consist of Unicode letters, digits, white
        # space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The index type that's suitable for your needs. For more information on what's included in each type
        # of index, see Amazon Q Business tiers .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @application_id : String,
          @display_name : String,
          @capacity_configuration : Types::IndexCapacityConfiguration? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateIndexResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Q Business index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The identifier for the Amazon Q Business index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        def initialize(
          @index_arn : String? = nil,
          @index_id : String? = nil
        )
        end
      end


      struct CreatePluginRequest
        include JSON::Serializable

        # The identifier of the application that will contain the plugin.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String


        @[JSON::Field(key: "authConfiguration")]
        getter auth_configuration : Types::PluginAuthConfiguration

        # A the name for your plugin.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The type of plugin you want to create.

        @[JSON::Field(key: "type")]
        getter type : String

        # A token that you provide to identify the request to create your Amazon Q Business plugin.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Contains configuration for a custom plugin.

        @[JSON::Field(key: "customPluginConfiguration")]
        getter custom_plugin_configuration : Types::CustomPluginConfiguration?

        # The source URL used for plugin configuration.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        # A list of key-value pairs that identify or categorize the data source connector. You can also use
        # tags to help control access to the data source connector. Tag keys and values can consist of Unicode
        # letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_id : String,
          @auth_configuration : Types::PluginAuthConfiguration,
          @display_name : String,
          @type : String,
          @client_token : String? = nil,
          @custom_plugin_configuration : Types::CustomPluginConfiguration? = nil,
          @server_url : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePluginResponse
        include JSON::Serializable

        # The current status of a plugin. A plugin is modified asynchronously.

        @[JSON::Field(key: "buildStatus")]
        getter build_status : String?

        # The Amazon Resource Name (ARN) of a plugin.

        @[JSON::Field(key: "pluginArn")]
        getter plugin_arn : String?

        # The identifier of the plugin created.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        def initialize(
          @build_status : String? = nil,
          @plugin_arn : String? = nil,
          @plugin_id : String? = nil
        )
        end
      end


      struct CreateRetrieverRequest
        include JSON::Serializable

        # The identifier of your Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RetrieverConfiguration

        # The name of your retriever.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The type of retriever you are using.

        @[JSON::Field(key: "type")]
        getter type : String

        # A token that you provide to identify the request to create your Amazon Q Business application
        # retriever.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ARN of an IAM role used by Amazon Q Business to access the basic authentication credentials
        # stored in a Secrets Manager secret.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of key-value pairs that identify or categorize the retriever. You can also use tags to help
        # control access to the retriever. Tag keys and values can consist of Unicode letters, digits, white
        # space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_id : String,
          @configuration : Types::RetrieverConfiguration,
          @display_name : String,
          @type : String,
          @client_token : String? = nil,
          @role_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRetrieverResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role associated with a retriever.

        @[JSON::Field(key: "retrieverArn")]
        getter retriever_arn : String?

        # The identifier of the retriever you are using.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String?

        def initialize(
          @retriever_arn : String? = nil,
          @retriever_id : String? = nil
        )
        end
      end


      struct CreateSubscriptionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application the subscription should be added to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The IAM Identity Center UserId or GroupId of a user or group in the IAM Identity Center instance
        # connected to the Amazon Q Business application.

        @[JSON::Field(key: "principal")]
        getter principal : Types::SubscriptionPrincipal

        # The type of Amazon Q Business subscription you want to create.

        @[JSON::Field(key: "type")]
        getter type : String

        # A token that you provide to identify the request to create a subscription for your Amazon Q Business
        # application.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @application_id : String,
          @principal : Types::SubscriptionPrincipal,
          @type : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateSubscriptionResponse
        include JSON::Serializable

        # The type of your current Amazon Q Business subscription.

        @[JSON::Field(key: "currentSubscription")]
        getter current_subscription : Types::SubscriptionDetails?

        # The type of the Amazon Q Business subscription for the next month.

        @[JSON::Field(key: "nextSubscription")]
        getter next_subscription : Types::SubscriptionDetails?

        # The Amazon Resource Name (ARN) of the Amazon Q Business subscription created.

        @[JSON::Field(key: "subscriptionArn")]
        getter subscription_arn : String?

        # The identifier of the Amazon Q Business subscription created.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @current_subscription : Types::SubscriptionDetails? = nil,
          @next_subscription : Types::SubscriptionDetails? = nil,
          @subscription_arn : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end


      struct CreateUserRequest
        include JSON::Serializable

        # The identifier of the application for which the user mapping will be created.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The user emails attached to a user mapping.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # A token that you provide to identify the request to create your Amazon Q Business user mapping.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The list of user aliases in the mapping.

        @[JSON::Field(key: "userAliases")]
        getter user_aliases : Array(Types::UserAlias)?

        def initialize(
          @application_id : String,
          @user_id : String,
          @client_token : String? = nil,
          @user_aliases : Array(Types::UserAlias)? = nil
        )
        end
      end


      struct CreateUserResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateWebExperienceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The browser extension configuration for an Amazon Q Business web experience. For Amazon Q Business
        # application using external OIDC-compliant identity providers (IdPs). The IdP administrator must add
        # the browser extension sign-in redirect URLs to the IdP application. For more information, see
        # Configure external OIDC identity provider for your browser extensions. .

        @[JSON::Field(key: "browserExtensionConfiguration")]
        getter browser_extension_configuration : Types::BrowserExtensionConfiguration?

        # A token you provide to identify a request to create an Amazon Q Business web experience.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Sets the custom logo, favicon, font, and color used in the Amazon Q web experience.

        @[JSON::Field(key: "customizationConfiguration")]
        getter customization_configuration : Types::CustomizationConfiguration?

        # Information about the identity provider (IdP) used to authenticate end users of an Amazon Q Business
        # web experience.

        @[JSON::Field(key: "identityProviderConfiguration")]
        getter identity_provider_configuration : Types::IdentityProviderConfiguration?

        # Sets the website domain origins that are allowed to embed the Amazon Q Business web experience. The
        # domain origin refers to the base URL for accessing a website including the protocol ( http/https ),
        # the domain name, and the port number (if specified). You must only submit a base URL and not a full
        # path. For example, https://docs.aws.amazon.com .

        @[JSON::Field(key: "origins")]
        getter origins : Array(String)?

        # The Amazon Resource Name (ARN) of the service role attached to your web experience. The roleArn
        # parameter is required when your Amazon Q Business application is created with IAM Identity Center.
        # It is not required for SAML-based applications.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Determines whether sample prompts are enabled in the web experience for an end user.

        @[JSON::Field(key: "samplePromptsControlMode")]
        getter sample_prompts_control_mode : String?

        # A subtitle to personalize your Amazon Q Business web experience.

        @[JSON::Field(key: "subtitle")]
        getter subtitle : String?

        # A list of key-value pairs that identify or categorize your Amazon Q Business web experience. You can
        # also use tags to help control access to the web experience. Tag keys and values can consist of
        # Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The title for your Amazon Q Business web experience.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The customized welcome message for end users of an Amazon Q Business web experience.

        @[JSON::Field(key: "welcomeMessage")]
        getter welcome_message : String?

        def initialize(
          @application_id : String,
          @browser_extension_configuration : Types::BrowserExtensionConfiguration? = nil,
          @client_token : String? = nil,
          @customization_configuration : Types::CustomizationConfiguration? = nil,
          @identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
          @origins : Array(String)? = nil,
          @role_arn : String? = nil,
          @sample_prompts_control_mode : String? = nil,
          @subtitle : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @title : String? = nil,
          @welcome_message : String? = nil
        )
        end
      end


      struct CreateWebExperienceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceArn")]
        getter web_experience_arn : String?

        # The identifier of the Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String?

        def initialize(
          @web_experience_arn : String? = nil,
          @web_experience_id : String? = nil
        )
        end
      end

      # Configuration information required to invoke chat in CREATOR_MODE . For more information, see Admin
      # controls and guardrails and Conversation settings .

      struct CreatorModeConfiguration
        include JSON::Serializable

        # Status information about whether CREATOR_MODE has been enabled or disabled. The default status is
        # DISABLED .

        @[JSON::Field(key: "creatorModeControl")]
        getter creator_mode_control : String

        def initialize(
          @creator_mode_control : String
        )
        end
      end

      # Configuration information required to create a custom plugin.

      struct CustomPluginConfiguration
        include JSON::Serializable

        # The type of OpenAPI schema to use.

        @[JSON::Field(key: "apiSchemaType")]
        getter api_schema_type : String

        # A description for your custom plugin configuration.

        @[JSON::Field(key: "description")]
        getter description : String

        # Contains either details about the S3 object containing the OpenAPI schema for the action group or
        # the JSON or YAML-formatted payload defining the schema.

        @[JSON::Field(key: "apiSchema")]
        getter api_schema : Types::APISchema?

        def initialize(
          @api_schema_type : String,
          @description : String,
          @api_schema : Types::APISchema? = nil
        )
        end
      end

      # Contains the configuration information to customize the logo, font, and color of an Amazon Q
      # Business web experience with individual files for each property or a CSS file for them all.

      struct CustomizationConfiguration
        include JSON::Serializable

        # Provides the URL where the custom CSS file is hosted for an Amazon Q web experience.

        @[JSON::Field(key: "customCSSUrl")]
        getter custom_css_url : String?

        # Provides the URL where the custom favicon file is hosted for an Amazon Q web experience.

        @[JSON::Field(key: "faviconUrl")]
        getter favicon_url : String?

        # Provides the URL where the custom font file is hosted for an Amazon Q web experience.

        @[JSON::Field(key: "fontUrl")]
        getter font_url : String?

        # Provides the URL where the custom logo file is hosted for an Amazon Q web experience.

        @[JSON::Field(key: "logoUrl")]
        getter logo_url : String?

        def initialize(
          @custom_css_url : String? = nil,
          @favicon_url : String? = nil,
          @font_url : String? = nil,
          @logo_url : String? = nil
        )
        end
      end

      # Provides summary information about a data accessor.

      struct DataAccessor
        include JSON::Serializable

        # The authentication configuration details for the data accessor. This specifies how the ISV
        # authenticates when accessing data through this data accessor.

        @[JSON::Field(key: "authenticationDetail")]
        getter authentication_detail : Types::DataAccessorAuthenticationDetail?

        # The timestamp when the data accessor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the data accessor.

        @[JSON::Field(key: "dataAccessorArn")]
        getter data_accessor_arn : String?

        # The unique identifier of the data accessor.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String?

        # The friendly name of the data accessor.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of the associated IAM Identity Center application.

        @[JSON::Field(key: "idcApplicationArn")]
        getter idc_application_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role for the ISV associated with this data accessor.

        @[JSON::Field(key: "principal")]
        getter principal : String?

        # The timestamp when the data accessor was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
          @created_at : Time? = nil,
          @data_accessor_arn : String? = nil,
          @data_accessor_id : String? = nil,
          @display_name : String? = nil,
          @idc_application_arn : String? = nil,
          @principal : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A union type that contains the specific authentication configuration based on the authentication
      # type selected.

      struct DataAccessorAuthenticationConfiguration
        include JSON::Serializable

        # Configuration for IAM Identity Center Trusted Token Issuer (TTI) authentication used when the
        # authentication type is AWS_IAM_IDC_TTI .

        @[JSON::Field(key: "idcTrustedTokenIssuerConfiguration")]
        getter idc_trusted_token_issuer_configuration : Types::DataAccessorIdcTrustedTokenIssuerConfiguration?

        def initialize(
          @idc_trusted_token_issuer_configuration : Types::DataAccessorIdcTrustedTokenIssuerConfiguration? = nil
        )
        end
      end

      # Contains the authentication configuration details for a data accessor. This structure defines how
      # the ISV authenticates when accessing data through the data accessor.

      struct DataAccessorAuthenticationDetail
        include JSON::Serializable

        # The type of authentication to use for the data accessor. This determines how the ISV authenticates
        # when accessing data. You can use one of two authentication types: AWS_IAM_IDC_TTI - Authentication
        # using IAM Identity Center Trusted Token Issuer (TTI). This authentication type allows the ISV to use
        # a trusted token issuer to generate tokens for accessing the data. AWS_IAM_IDC_AUTH_CODE -
        # Authentication using IAM Identity Center authorization code flow. This authentication type uses the
        # standard OAuth 2.0 authorization code flow for authentication.

        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String

        # The specific authentication configuration based on the authentication type.

        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::DataAccessorAuthenticationConfiguration?

        # A list of external identifiers associated with this authentication configuration. These are used to
        # correlate the data accessor with external systems.

        @[JSON::Field(key: "externalIds")]
        getter external_ids : Array(String)?

        def initialize(
          @authentication_type : String,
          @authentication_configuration : Types::DataAccessorAuthenticationConfiguration? = nil,
          @external_ids : Array(String)? = nil
        )
        end
      end

      # Configuration details for IAM Identity Center Trusted Token Issuer (TTI) authentication.

      struct DataAccessorIdcTrustedTokenIssuerConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Identity Center Trusted Token Issuer that will be used for
        # authentication.

        @[JSON::Field(key: "idcTrustedTokenIssuerArn")]
        getter idc_trusted_token_issuer_arn : String

        def initialize(
          @idc_trusted_token_issuer_arn : String
        )
        end
      end

      # A data source in an Amazon Q Business application.

      struct DataSource
        include JSON::Serializable

        # The Unix timestamp when the Amazon Q Business data source was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The identifier of the Amazon Q Business data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The name of the Amazon Q Business data source.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The status of the Amazon Q Business data source.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the Amazon Q Business data source.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Unix timestamp when the Amazon Q Business data source was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @data_source_id : String? = nil,
          @display_name : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides the configuration information for an Amazon Q Business data source.

      struct DataSourceConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about an Amazon Q Business data source connector synchronization job.

      struct DataSourceSyncJob
        include JSON::Serializable

        # If the reason that the synchronization failed is due to an error with the underlying data source,
        # this field contains a code that identifies the error.

        @[JSON::Field(key: "dataSourceErrorCode")]
        getter data_source_error_code : String?

        # The Unix timestamp when the synchronization job completed.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # If the Status field is set to FAILED , the ErrorCode field indicates the reason the synchronization
        # failed.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The identifier of a data source synchronization job.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        # Maps a batch delete document request to a specific data source sync job. This is optional and should
        # only be supplied when documents are deleted by a data source connector.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::DataSourceSyncJobMetrics?

        # The Unix time stamp when the data source synchronization job started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the synchronization job. When the Status field is set to SUCCEEDED , the
        # synchronization job is done. If the status code is FAILED , the ErrorCode and ErrorMessage fields
        # give you the reason for the failure.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @data_source_error_code : String? = nil,
          @end_time : Time? = nil,
          @error : Types::ErrorDetail? = nil,
          @execution_id : String? = nil,
          @metrics : Types::DataSourceSyncJobMetrics? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Maps a batch delete document request to a specific Amazon Q Business data source connector sync job.

      struct DataSourceSyncJobMetrics
        include JSON::Serializable

        # The current count of documents added from the data source during the data source sync.

        @[JSON::Field(key: "documentsAdded")]
        getter documents_added : String?

        # The current count of documents deleted from the data source during the data source sync.

        @[JSON::Field(key: "documentsDeleted")]
        getter documents_deleted : String?

        # The current count of documents that failed to sync from the data source during the data source sync.

        @[JSON::Field(key: "documentsFailed")]
        getter documents_failed : String?

        # The current count of documents modified in the data source during the data source sync.

        @[JSON::Field(key: "documentsModified")]
        getter documents_modified : String?

        # The current count of documents crawled by the ongoing sync job in the data source.

        @[JSON::Field(key: "documentsScanned")]
        getter documents_scanned : String?

        def initialize(
          @documents_added : String? = nil,
          @documents_deleted : String? = nil,
          @documents_failed : String? = nil,
          @documents_modified : String? = nil,
          @documents_scanned : String? = nil
        )
        end
      end

      # Provides configuration information needed to connect to an Amazon VPC (Virtual Private Cloud).

      struct DataSourceVpcConfiguration
        include JSON::Serializable

        # A list of identifiers of security groups within your Amazon VPC. The security groups should enable
        # Amazon Q Business to connect to the data source.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # A list of identifiers for subnets within your Amazon VPC. The subnets should be able to connect to
        # each other in the VPC, and they should have outgoing access to the Internet through a NAT device.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # Provides information on boosting DATE type document attributes. For more information on how boosting
      # document attributes work in Amazon Q Business, see Boosting using document attributes .

      struct DateAttributeBoostingConfiguration
        include JSON::Serializable

        # Specifies the priority tier ranking of boosting applied to document attributes. For version 2, this
        # parameter indicates the relative ranking between boosted fields (ONE being highest priority, TWO
        # being second highest, etc.) and determines the order in which attributes influence document ranking
        # in search results. For version 1, this parameter specifies the boosting intensity. For version 2,
        # boosting intensity (VERY HIGH, HIGH, MEDIUM, LOW, NONE) are not supported. Note that in version 2,
        # you are not allowed to boost on only one field and make this value TWO.

        @[JSON::Field(key: "boostingLevel")]
        getter boosting_level : String

        # Specifies the duration, in seconds, of a boost applies to a DATE type document attribute.

        @[JSON::Field(key: "boostingDurationInSeconds")]
        getter boosting_duration_in_seconds : Int64?

        def initialize(
          @boosting_level : String,
          @boosting_duration_in_seconds : Int64? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAttachmentRequest
        include JSON::Serializable

        # The unique identifier for the Amazon Q Business application environment.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier for the attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # The unique identifier of the conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The unique identifier of the user involved in the conversation.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @attachment_id : String,
          @conversation_id : String,
          @user_id : String? = nil
        )
        end
      end


      struct DeleteAttachmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteChatControlsConfigurationRequest
        include JSON::Serializable

        # The identifier of the application the chat controls have been configured for.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct DeleteChatControlsConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteChatResponseConfigurationRequest
        include JSON::Serializable

        # The unique identifier of theAmazon Q Business application from which to delete the chat response
        # configuration.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the chat response configuration to delete from the specified application.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String

        def initialize(
          @application_id : String,
          @chat_response_configuration_id : String
        )
        end
      end


      struct DeleteChatResponseConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConversationRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application associated with the conversation.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business web experience conversation being deleted.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The identifier of the user who is deleting the conversation.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @conversation_id : String,
          @user_id : String? = nil
        )
        end
      end


      struct DeleteConversationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataAccessorRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the data accessor to delete.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String

        def initialize(
          @application_id : String,
          @data_accessor_id : String
        )
        end
      end


      struct DeleteDataAccessorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataSourceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application used with the data source connector.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector that you want to delete.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String
        )
        end
      end


      struct DeleteDataSourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A document deleted from an Amazon Q Business data source connector.

      struct DeleteDocument
        include JSON::Serializable

        # The identifier of the deleted document.

        @[JSON::Field(key: "documentId")]
        getter document_id : String

        def initialize(
          @document_id : String
        )
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable

        # The identifier of the application in which the group mapping belongs.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The name of the group you want to delete.

        @[JSON::Field(key: "groupName")]
        getter group_name : String

        # The identifier of the index you want to delete the group from.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data source linked to the group A group can be tied to multiple data sources.
        # You can delete a group from accessing documents in a certain data source. For example, the groups
        # "Research", "Engineering", and "Sales and Marketing" are all tied to the company's documents stored
        # in the data sources Confluence and Salesforce. You want to delete "Research" and "Engineering"
        # groups from Salesforce, so that these groups cannot access customer-related documents stored in
        # Salesforce. Only "Sales and Marketing" should access documents in the Salesforce data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        def initialize(
          @application_id : String,
          @group_name : String,
          @index_id : String,
          @data_source_id : String? = nil
        )
        end
      end


      struct DeleteGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteIndexRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application the Amazon Q Business index is linked to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @index_id : String
        )
        end
      end


      struct DeleteIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePluginRequest
        include JSON::Serializable

        # The identifier the application attached to the Amazon Q Business plugin.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the plugin being deleted.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        def initialize(
          @application_id : String,
          @plugin_id : String
        )
        end
      end


      struct DeletePluginResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRetrieverRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the retriever.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the retriever being deleted.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String

        def initialize(
          @application_id : String,
          @retriever_id : String
        )
        end
      end


      struct DeleteRetrieverResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteUserRequest
        include JSON::Serializable

        # The identifier of the application from which the user is being deleted.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The user email being deleted.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @application_id : String,
          @user_id : String
        )
        end
      end


      struct DeleteUserResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWebExperienceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the Amazon Q Business web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business web experience being deleted.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String

        def initialize(
          @application_id : String,
          @web_experience_id : String
        )
        end
      end


      struct DeleteWebExperienceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociatePermissionRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The statement ID of the permission to remove.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        def initialize(
          @application_id : String,
          @statement_id : String
        )
        end
      end


      struct DisassociatePermissionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A document in an Amazon Q Business application.

      struct Document
        include JSON::Serializable

        # The identifier of the document.

        @[JSON::Field(key: "id")]
        getter id : String

        # Configuration information for access permission to a document.

        @[JSON::Field(key: "accessConfiguration")]
        getter access_configuration : Types::AccessConfiguration?

        # Custom attributes to apply to the document for refining Amazon Q Business web experience responses.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::DocumentAttribute)?

        # The contents of the document.

        @[JSON::Field(key: "content")]
        getter content : Types::DocumentContent?

        # The file type of the document in the Blob field. If you want to index snippets or subsets of HTML
        # documents instead of the entirety of the HTML documents, you add the HTML start and closing tags (
        # &lt;HTML&gt;content&lt;/HTML&gt; ) around the content.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The configuration information for altering document metadata and content during the document
        # ingestion process.

        @[JSON::Field(key: "documentEnrichmentConfiguration")]
        getter document_enrichment_configuration : Types::DocumentEnrichmentConfiguration?

        # The configuration for extracting information from media in the document.

        @[JSON::Field(key: "mediaExtractionConfiguration")]
        getter media_extraction_configuration : Types::MediaExtractionConfiguration?

        # The title of the document.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @id : String,
          @access_configuration : Types::AccessConfiguration? = nil,
          @attributes : Array(Types::DocumentAttribute)? = nil,
          @content : Types::DocumentContent? = nil,
          @content_type : String? = nil,
          @document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
          @media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
          @title : String? = nil
        )
        end
      end

      # Represents the Access Control List (ACL) for a document, containing both allowlist and denylist
      # conditions.

      struct DocumentAcl
        include JSON::Serializable

        # The allowlist conditions for the document. Users or groups matching these conditions are granted
        # access to the document.

        @[JSON::Field(key: "allowlist")]
        getter allowlist : Types::DocumentAclMembership?

        # The denylist conditions for the document. Users or groups matching these conditions are denied
        # access to the document, overriding allowlist permissions.

        @[JSON::Field(key: "denyList")]
        getter deny_list : Types::DocumentAclMembership?

        def initialize(
          @allowlist : Types::DocumentAclMembership? = nil,
          @deny_list : Types::DocumentAclMembership? = nil
        )
        end
      end

      # Represents a condition in the document's ACL, specifying access rules for users and groups.

      struct DocumentAclCondition
        include JSON::Serializable

        # An array of group identifiers that this condition applies to. Groups listed here are subject to the
        # access rule defined by this condition.

        @[JSON::Field(key: "groups")]
        getter groups : Array(Types::DocumentAclGroup)?

        # The logical relation between members in the condition, determining how multiple user or group
        # conditions are combined.

        @[JSON::Field(key: "memberRelation")]
        getter member_relation : String?

        # An array of user identifiers that this condition applies to. Users listed here are subject to the
        # access rule defined by this condition.

        @[JSON::Field(key: "users")]
        getter users : Array(Types::DocumentAclUser)?

        def initialize(
          @groups : Array(Types::DocumentAclGroup)? = nil,
          @member_relation : String? = nil,
          @users : Array(Types::DocumentAclUser)? = nil
        )
        end
      end

      # Represents a group in the document's ACL, used to define access permissions for multiple users
      # collectively.

      struct DocumentAclGroup
        include JSON::Serializable

        # The name of the group in the document's ACL. This is used to identify the group when applying access
        # rules.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the group. This indicates the scope of the group's applicability in access control.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents membership rules in the document's ACL, defining how users or groups are associated with
      # access permissions.

      struct DocumentAclMembership
        include JSON::Serializable

        # An array of conditions that define the membership rules. Each condition specifies criteria for users
        # or groups to be included in this membership.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::DocumentAclCondition)?

        # The logical relation between members in the membership rule, determining how multiple conditions are
        # combined.

        @[JSON::Field(key: "memberRelation")]
        getter member_relation : String?

        def initialize(
          @conditions : Array(Types::DocumentAclCondition)? = nil,
          @member_relation : String? = nil
        )
        end
      end

      # Represents a user in the document's ACL, used to define access permissions for individual users.

      struct DocumentAclUser
        include JSON::Serializable

        # The unique identifier of the user in the document's ACL. This is used to identify the user when
        # applying access rules.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of the user. This indicates the scope of the user's applicability in access control.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A document attribute or metadata field.

      struct DocumentAttribute
        include JSON::Serializable

        # The identifier for the attribute.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the attribute.

        @[JSON::Field(key: "value")]
        getter value : Types::DocumentAttributeValue

        def initialize(
          @name : String,
          @value : Types::DocumentAttributeValue
        )
        end
      end

      # Provides information on boosting supported Amazon Q Business document attribute types. When an end
      # user chat query matches document attributes that have been boosted, Amazon Q Business prioritizes
      # generating responses from content that matches the boosted document attributes. In version 2,
      # boosting uses numeric values (ONE, TWO) to indicate priority tiers that establish clear hierarchical
      # relationships between boosted attributes. This allows for more precise control over how different
      # attributes influence search results. For STRING and STRING_LIST type document attributes to be used
      # for boosting on the console and the API, they must be enabled for search using the
      # DocumentAttributeConfiguration object of the UpdateIndex API. If you haven't enabled searching on
      # these attributes, you can't boost attributes of these data types on either the console or the API.
      # For more information on how boosting document attributes work in Amazon Q Business, see Boosting
      # using document attributes .

      struct DocumentAttributeBoostingConfiguration
        include JSON::Serializable

        # Provides information on boosting DATE type document attributes. Version 2 assigns priority tiers to
        # DATE attributes, establishing clear hierarchical relationships with other boosted attributes.

        @[JSON::Field(key: "dateConfiguration")]
        getter date_configuration : Types::DateAttributeBoostingConfiguration?

        # Provides information on boosting NUMBER type document attributes. NUMBER attributes are not
        # supported when using NativeIndexConfiguration version 2, which focuses on DATE attributes for
        # recency and STRING attributes for source prioritization.

        @[JSON::Field(key: "numberConfiguration")]
        getter number_configuration : Types::NumberAttributeBoostingConfiguration?

        # Provides information on boosting STRING type document attributes. Version 2 assigns priority tiers
        # to STRING attributes, establishing clear hierarchical relationships with other boosted attributes.

        @[JSON::Field(key: "stringConfiguration")]
        getter string_configuration : Types::StringAttributeBoostingConfiguration?

        # Provides information on boosting STRING_LIST type document attributes. STRING_LIST attributes are
        # not supported when using NativeIndexConfiguration version 2, which focuses on DATE attributes for
        # recency and STRING attributes for source prioritization.

        @[JSON::Field(key: "stringListConfiguration")]
        getter string_list_configuration : Types::StringListAttributeBoostingConfiguration?

        def initialize(
          @date_configuration : Types::DateAttributeBoostingConfiguration? = nil,
          @number_configuration : Types::NumberAttributeBoostingConfiguration? = nil,
          @string_configuration : Types::StringAttributeBoostingConfiguration? = nil,
          @string_list_configuration : Types::StringListAttributeBoostingConfiguration? = nil
        )
        end
      end

      # The condition used for the target document attribute or metadata field when ingesting documents into
      # Amazon Q Business. You use this with DocumentAttributeTarget to apply the condition. For example,
      # you can create the 'Department' target field and have it prefill department names associated with
      # the documents based on information in the 'Source_URI' field. Set the condition that if the
      # 'Source_URI' field contains 'financial' in its URI value, then prefill the target field 'Department'
      # with the target value 'Finance' for the document. Amazon Q Business can't create a target field if
      # it has not already been created as an index field. After you create your index field, you can create
      # a document metadata field using DocumentAttributeTarget . Amazon Q Business then will map your newly
      # created metadata field to your index field.

      struct DocumentAttributeCondition
        include JSON::Serializable

        # The identifier of the document attribute used for the condition. For example, 'Source_URI' could be
        # an identifier for the attribute or metadata field that contains source URIs associated with the
        # documents. Amazon Q Business currently doesn't support _document_body as an attribute key used for
        # the condition.

        @[JSON::Field(key: "key")]
        getter key : String

        # The identifier of the document attribute used for the condition. For example, 'Source_URI' could be
        # an identifier for the attribute or metadata field that contains source URIs associated with the
        # documents. Amazon Q Business currently does not support _document_body as an attribute key used for
        # the condition.

        @[JSON::Field(key: "operator")]
        getter operator : String


        @[JSON::Field(key: "value")]
        getter value : Types::DocumentAttributeValue?

        def initialize(
          @key : String,
          @operator : String,
          @value : Types::DocumentAttributeValue? = nil
        )
        end
      end

      # Configuration information for document attributes. Document attributes are metadata or fields
      # associated with your documents. For example, the company department name associated with each
      # document. For more information, see Understanding document attributes .

      struct DocumentAttributeConfiguration
        include JSON::Serializable

        # The name of the document attribute.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Information about whether the document attribute can be used by an end user to search for
        # information on their web experience.

        @[JSON::Field(key: "search")]
        getter search : String?

        # The type of document attribute.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @search : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The target document attribute or metadata field you want to alter when ingesting documents into
      # Amazon Q Business. For example, you can delete all customer identification numbers associated with
      # the documents, stored in the document metadata field called 'Customer_ID' by setting the target key
      # as 'Customer_ID' and the deletion flag to TRUE . This removes all customer ID values in the field
      # 'Customer_ID'. This would scrub personally identifiable information from each document's metadata.
      # Amazon Q Business can't create a target field if it has not already been created as an index field.
      # After you create your index field, you can create a document metadata field using
      # DocumentAttributeTarget . Amazon Q Business will then map your newly created document attribute to
      # your index field. You can also use this with DocumentAttributeCondition .

      struct DocumentAttributeTarget
        include JSON::Serializable

        # The identifier of the target document attribute or metadata field. For example, 'Department' could
        # be an identifier for the target attribute or metadata field that includes the department names
        # associated with the documents.

        @[JSON::Field(key: "key")]
        getter key : String

        # TRUE to delete the existing target value for your specified target attribute key. You cannot create
        # a target value and set this to TRUE .

        @[JSON::Field(key: "attributeValueOperator")]
        getter attribute_value_operator : String?


        @[JSON::Field(key: "value")]
        getter value : Types::DocumentAttributeValue?

        def initialize(
          @key : String,
          @attribute_value_operator : String? = nil,
          @value : Types::DocumentAttributeValue? = nil
        )
        end
      end

      # The value of a document attribute. You can only provide one value for a document attribute.

      struct DocumentAttributeValue
        include JSON::Serializable

        # A date expressed as an ISO 8601 string. It's important for the time zone to be included in the ISO
        # 8601 date-time format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601 date-time format for
        # March 25th 2012 at 12:30PM (plus 10 seconds) in Central European Time.

        @[JSON::Field(key: "dateValue")]
        getter date_value : Time?

        # A long integer value.

        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # A list of strings.

        @[JSON::Field(key: "stringListValue")]
        getter string_list_value : Array(String)?

        # A string.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @date_value : Time? = nil,
          @long_value : Int64? = nil,
          @string_list_value : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # The contents of a document. Documents have size limitations. The maximum file size for a document is
      # 50 MB. The maximum amount of text that can be extracted from a single document is 5 MB. For more
      # information, see Supported document formats in Amazon Q Business .

      struct DocumentContent
        include JSON::Serializable

        # The contents of the document. Documents passed to the blob parameter must be base64 encoded. Your
        # code might not need to encode the document file bytes if you're using an Amazon Web Services SDK to
        # call Amazon Q Business APIs. If you are calling the Amazon Q Business endpoint directly using REST,
        # you must base64 encode the contents before sending.

        @[JSON::Field(key: "blob")]
        getter blob : Bytes?

        # The path to the document in an Amazon S3 bucket.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3?

        def initialize(
          @blob : Bytes? = nil,
          @s3 : Types::S3? = nil
        )
        end
      end

      # The details of a document within an Amazon Q Business index.

      struct DocumentDetails
        include JSON::Serializable

        # The timestamp for when the document was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The identifier of the document.

        @[JSON::Field(key: "documentId")]
        getter document_id : String?

        # An error message associated with the document.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The current status of the document.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp for when the document was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @document_id : String? = nil,
          @error : Types::ErrorDetail? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides the configuration information for altering document metadata and content during the
      # document ingestion process. For more information, see Custom document enrichment .

      struct DocumentEnrichmentConfiguration
        include JSON::Serializable

        # Configuration information to alter document attributes or metadata fields and content when ingesting
        # documents into Amazon Q Business.

        @[JSON::Field(key: "inlineConfigurations")]
        getter inline_configurations : Array(Types::InlineDocumentEnrichmentConfiguration)?


        @[JSON::Field(key: "postExtractionHookConfiguration")]
        getter post_extraction_hook_configuration : Types::HookConfiguration?


        @[JSON::Field(key: "preExtractionHookConfiguration")]
        getter pre_extraction_hook_configuration : Types::HookConfiguration?

        def initialize(
          @inline_configurations : Array(Types::InlineDocumentEnrichmentConfiguration)? = nil,
          @post_extraction_hook_configuration : Types::HookConfiguration? = nil,
          @pre_extraction_hook_configuration : Types::HookConfiguration? = nil
        )
        end
      end

      # The identifier of the data source Amazon Q Business will generate responses from.

      struct EligibleDataSource
        include JSON::Serializable

        # The identifier of the data source.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The identifier of the index the data source is attached to.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        def initialize(
          @data_source_id : String? = nil,
          @index_id : String? = nil
        )
        end
      end

      # Provides the identifier of the KMS key used to encrypt data indexed by Amazon Q Business. Amazon Q
      # Business doesn't support asymmetric keys.

      struct EncryptionConfiguration
        include JSON::Serializable

        # The identifier of the KMS key. Amazon Q Business doesn't support asymmetric keys.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # The end of the streaming input for the Chat API.

      struct EndOfInputEvent
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about a Amazon Q Business request error.

      struct ErrorDetail
        include JSON::Serializable

        # The code associated with the Amazon Q Business request error.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message explaining the Amazon Q Business request error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # An external resource that you configured with your application is returning errors and preventing
      # this operation from succeeding. Fix those errors and try again.

      struct ExternalResourceException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A failed file upload during web experience chat.

      struct FailedAttachmentEvent
        include JSON::Serializable


        @[JSON::Field(key: "attachment")]
        getter attachment : Types::AttachmentOutput?

        # The identifier of the conversation associated with the failed file upload.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The identifier of the AI-generated message associated with the file upload.

        @[JSON::Field(key: "systemMessageId")]
        getter system_message_id : String?

        # The identifier of the end user chat message associated with the file upload.

        @[JSON::Field(key: "userMessageId")]
        getter user_message_id : String?

        def initialize(
          @attachment : Types::AttachmentOutput? = nil,
          @conversation_id : String? = nil,
          @system_message_id : String? = nil,
          @user_message_id : String? = nil
        )
        end
      end

      # A list of documents that could not be removed from an Amazon Q Business index. Each entry contains
      # an error message that indicates why the document couldn't be removed from the index.

      struct FailedDocument
        include JSON::Serializable

        # The identifier of the Amazon Q Business data source connector that contains the failed document.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # An explanation for why the document couldn't be removed from the index.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The identifier of the document that couldn't be removed from the Amazon Q Business index.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @data_source_id : String? = nil,
          @error : Types::ErrorDetail? = nil,
          @id : String? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q Business application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # Settings for whether end users can upload files directly during chat.

        @[JSON::Field(key: "attachmentsConfiguration")]
        getter attachments_configuration : Types::AppliedAttachmentsConfiguration?

        # Settings for auto-subscription behavior for this application. This is only applicable to SAML and
        # OIDC applications.

        @[JSON::Field(key: "autoSubscriptionConfiguration")]
        getter auto_subscription_configuration : Types::AutoSubscriptionConfiguration?

        # The OIDC client ID for a Amazon Q Business application.

        @[JSON::Field(key: "clientIdsForOIDC")]
        getter client_ids_for_oidc : Array(String)?

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A description for the Amazon Q Business application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Amazon Q Business application.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The identifier of the Amazon Web Services KMS key that is used to encrypt your data. Amazon Q
        # Business doesn't support asymmetric keys.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # If the Status field is set to ERROR , the ErrorMessage field contains a description of the error
        # that caused the synchronization to fail.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The Amazon Resource Name (ARN) of an identity provider being used by an Amazon Q Business
        # application.

        @[JSON::Field(key: "iamIdentityProviderArn")]
        getter iam_identity_provider_arn : String?

        # The Amazon Resource Name (ARN) of the AWS IAM Identity Center instance attached to your Amazon Q
        # Business application.

        @[JSON::Field(key: "identityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # The authentication type being used by a Amazon Q Business application.

        @[JSON::Field(key: "identityType")]
        getter identity_type : String?

        # Configuration information about chat response personalization. For more information, see
        # Personalizing chat responses .

        @[JSON::Field(key: "personalizationConfiguration")]
        getter personalization_configuration : Types::PersonalizationConfiguration?

        # Settings for whether end users can create and use Amazon Q Apps in the web experience.

        @[JSON::Field(key: "qAppsConfiguration")]
        getter q_apps_configuration : Types::QAppsConfiguration?

        # The Amazon Quick Suite authentication configuration for the Amazon Q Business application.

        @[JSON::Field(key: "quickSightConfiguration")]
        getter quick_sight_configuration : Types::QuickSightConfiguration?

        # The Amazon Resource Name (ARN) of the IAM with permissions to access your CloudWatch logs and
        # metrics.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the Amazon Q Business application.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @application_arn : String? = nil,
          @application_id : String? = nil,
          @attachments_configuration : Types::AppliedAttachmentsConfiguration? = nil,
          @auto_subscription_configuration : Types::AutoSubscriptionConfiguration? = nil,
          @client_ids_for_oidc : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @error : Types::ErrorDetail? = nil,
          @iam_identity_provider_arn : String? = nil,
          @identity_center_application_arn : String? = nil,
          @identity_type : String? = nil,
          @personalization_configuration : Types::PersonalizationConfiguration? = nil,
          @q_apps_configuration : Types::QAppsConfiguration? = nil,
          @quick_sight_configuration : Types::QuickSightConfiguration? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetChatControlsConfigurationRequest
        include JSON::Serializable

        # The identifier of the application for which the chat controls are configured.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of configured chat controls to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business chat controls configured.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetChatControlsConfigurationResponse
        include JSON::Serializable

        # The phrases blocked from chat by your chat control configuration.

        @[JSON::Field(key: "blockedPhrases")]
        getter blocked_phrases : Types::BlockedPhrasesConfiguration?

        # The configuration details for CREATOR_MODE .

        @[JSON::Field(key: "creatorModeConfiguration")]
        getter creator_mode_configuration : Types::AppliedCreatorModeConfiguration?

        # The hallucination reduction settings for your application.

        @[JSON::Field(key: "hallucinationReductionConfiguration")]
        getter hallucination_reduction_configuration : Types::HallucinationReductionConfiguration?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business chat controls configured.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The chat response orchestration settings for your application. Chat orchestration is optimized to
        # work for English language content. For more details on language support in Amazon Q Business, see
        # Supported languages .

        @[JSON::Field(key: "orchestrationConfiguration")]
        getter orchestration_configuration : Types::AppliedOrchestrationConfiguration?

        # The response scope configured for a Amazon Q Business application. This determines whether your
        # application uses its retrieval augmented generation (RAG) system to generate answers only from your
        # enterprise data, or also uses the large language models (LLM) knowledge to respons to end user
        # questions in chat.

        @[JSON::Field(key: "responseScope")]
        getter response_scope : String?

        # The topic specific controls configured for a Amazon Q Business application.

        @[JSON::Field(key: "topicConfigurations")]
        getter topic_configurations : Array(Types::TopicConfiguration)?

        def initialize(
          @blocked_phrases : Types::BlockedPhrasesConfiguration? = nil,
          @creator_mode_configuration : Types::AppliedCreatorModeConfiguration? = nil,
          @hallucination_reduction_configuration : Types::HallucinationReductionConfiguration? = nil,
          @next_token : String? = nil,
          @orchestration_configuration : Types::AppliedOrchestrationConfiguration? = nil,
          @response_scope : String? = nil,
          @topic_configurations : Array(Types::TopicConfiguration)? = nil
        )
        end
      end


      struct GetChatResponseConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application containing the chat response
        # configuration to retrieve.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the chat response configuration to retrieve from the specified application.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String

        def initialize(
          @application_id : String,
          @chat_response_configuration_id : String
        )
        end
      end


      struct GetChatResponseConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the retrieved chat response configuration, which uniquely
        # identifies the resource across all Amazon Web Services services.

        @[JSON::Field(key: "chatResponseConfigurationArn")]
        getter chat_response_configuration_arn : String?

        # The unique identifier of the retrieved chat response configuration.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String?

        # The timestamp indicating when the chat response configuration was initially created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The human-readable name of the retrieved chat response configuration, making it easier to identify
        # among multiple configurations.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The currently active configuration settings that are being used to generate responses in the Amazon
        # Q Business application.

        @[JSON::Field(key: "inUseConfiguration")]
        getter in_use_configuration : Types::ChatResponseConfigurationDetail?

        # Information about the most recent update to the configuration, including timestamp and modification
        # details.

        @[JSON::Field(key: "lastUpdateConfiguration")]
        getter last_update_configuration : Types::ChatResponseConfigurationDetail?

        def initialize(
          @chat_response_configuration_arn : String? = nil,
          @chat_response_configuration_id : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @in_use_configuration : Types::ChatResponseConfigurationDetail? = nil,
          @last_update_configuration : Types::ChatResponseConfigurationDetail? = nil
        )
        end
      end


      struct GetDataAccessorRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the data accessor to retrieve.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String

        def initialize(
          @application_id : String,
          @data_accessor_id : String
        )
        end
      end


      struct GetDataAccessorResponse
        include JSON::Serializable

        # The list of action configurations specifying the allowed actions and any associated filters.

        @[JSON::Field(key: "actionConfigurations")]
        getter action_configurations : Array(Types::ActionConfiguration)?

        # The unique identifier of the Amazon Q Business application associated with this data accessor.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The authentication configuration details for the data accessor. This specifies how the ISV
        # authenticates when accessing data through this data accessor.

        @[JSON::Field(key: "authenticationDetail")]
        getter authentication_detail : Types::DataAccessorAuthenticationDetail?

        # The timestamp when the data accessor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the data accessor.

        @[JSON::Field(key: "dataAccessorArn")]
        getter data_accessor_arn : String?

        # The unique identifier of the data accessor.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String?

        # The friendly name of the data accessor.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center application associated with this data
        # accessor.

        @[JSON::Field(key: "idcApplicationArn")]
        getter idc_application_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role for the ISV associated with this data accessor.

        @[JSON::Field(key: "principal")]
        getter principal : String?

        # The timestamp when the data accessor was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @action_configurations : Array(Types::ActionConfiguration)? = nil,
          @application_id : String? = nil,
          @authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
          @created_at : Time? = nil,
          @data_accessor_arn : String? = nil,
          @data_accessor_id : String? = nil,
          @display_name : String? = nil,
          @idc_application_arn : String? = nil,
          @principal : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetDataSourceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identfier of the index used with the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String
        )
        end
      end


      struct GetDataSourceResponse
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The details of how the data source connector is configured.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfiguration?

        # The Unix timestamp when the data source connector was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the data source.

        @[JSON::Field(key: "dataSourceArn")]
        getter data_source_arn : String?

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The description for the data source connector.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name for the data source connector.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "documentEnrichmentConfiguration")]
        getter document_enrichment_configuration : Types::DocumentEnrichmentConfiguration?

        # When the Status field value is FAILED , the ErrorMessage field contains a description of the error
        # that caused the data source connector to fail.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The identifier of the index linked to the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        # The configuration for extracting information from media in documents for the data source.

        @[JSON::Field(key: "mediaExtractionConfiguration")]
        getter media_extraction_configuration : Types::MediaExtractionConfiguration?

        # The Amazon Resource Name (ARN) of the role with permission to access the data source and required
        # resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The current status of the data source connector. When the Status field value is FAILED , the
        # ErrorMessage field contains a description of the error that caused the data source connector to
        # fail.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The schedule for Amazon Q Business to update the index.

        @[JSON::Field(key: "syncSchedule")]
        getter sync_schedule : String?

        # The type of the data source connector. For example, S3 .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Unix timestamp when the data source connector was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # Configuration information for an Amazon VPC (Virtual Private Cloud) to connect to your data source.

        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @application_id : String? = nil,
          @configuration : Types::DataSourceConfiguration? = nil,
          @created_at : Time? = nil,
          @data_source_arn : String? = nil,
          @data_source_id : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
          @error : Types::ErrorDetail? = nil,
          @index_id : String? = nil,
          @media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @sync_schedule : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct GetDocumentContentRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application containing the document. This ensures the
        # request is scoped to the correct application environment and its associated security policies.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the document that is indexed via BatchPutDocument API or file-upload or
        # connector sync. It is also found in chat or chatSync response.

        @[JSON::Field(key: "documentId")]
        getter document_id : String

        # The identifier of the index where documents are indexed.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data source from which the document was ingested. This field is not present if
        # the document is ingested by directly calling the BatchPutDocument API. If the document is from a
        # file-upload data source, the datasource will be "uploaded-docs-file-stat-datasourceid".

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # Document outputFormat. Defaults to RAW if not selected.

        @[JSON::Field(key: "outputFormat")]
        getter output_format : String?

        def initialize(
          @application_id : String,
          @document_id : String,
          @index_id : String,
          @data_source_id : String? = nil,
          @output_format : String? = nil
        )
        end
      end


      struct GetDocumentContentResponse
        include JSON::Serializable

        # The MIME type of the document content. When outputFormat is RAW, this corresponds to the original
        # document's MIME type (e.g., application/pdf, text/plain,
        # application/vnd.openxmlformats-officedocument.wordprocessingml.document). When outputFormat is
        # EXTRACTED, the MIME type is always application/json.

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String

        # A pre-signed URL that provides temporary access to download the document content directly from
        # Amazon Q Business. The URL expires after 5 minutes for security purposes. This URL is generated only
        # after successful ACL validation.

        @[JSON::Field(key: "presignedUrl")]
        getter presigned_url : String

        def initialize(
          @mime_type : String,
          @presigned_url : String
        )
        end
      end


      struct GetGroupRequest
        include JSON::Serializable

        # The identifier of the application id the group is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The name of the group.

        @[JSON::Field(key: "groupName")]
        getter group_name : String

        # The identifier of the index the group is attached to.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data source the group is attached to.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        def initialize(
          @application_id : String,
          @group_name : String,
          @index_id : String,
          @data_source_id : String? = nil
        )
        end
      end


      struct GetGroupResponse
        include JSON::Serializable

        # The current status of the group.

        @[JSON::Field(key: "status")]
        getter status : Types::GroupStatusDetail?

        # The status history of the group.

        @[JSON::Field(key: "statusHistory")]
        getter status_history : Array(Types::GroupStatusDetail)?

        def initialize(
          @status : Types::GroupStatusDetail? = nil,
          @status_history : Array(Types::GroupStatusDetail)? = nil
        )
        end
      end


      struct GetIndexRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application connected to the index.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business index you want information on.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @index_id : String
        )
        end
      end


      struct GetIndexResponse
        include JSON::Serializable

        # The identifier of the Amazon Q Business application associated with the index.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The storage capacity units chosen for your Amazon Q Business index.

        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::IndexCapacityConfiguration?

        # The Unix timestamp when the Amazon Q Business index was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description for the Amazon Q Business index.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Amazon Q Business index.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Configuration information for document attributes or metadata. Document metadata are fields
        # associated with your documents. For example, the company department name associated with each
        # document. For more information, see Understanding document attributes .

        @[JSON::Field(key: "documentAttributeConfigurations")]
        getter document_attribute_configurations : Array(Types::DocumentAttributeConfiguration)?

        # When the Status field value is FAILED , the ErrorMessage field contains a message that explains why.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # The Amazon Resource Name (ARN) of the Amazon Q Business index.

        @[JSON::Field(key: "indexArn")]
        getter index_arn : String?

        # The identifier of the Amazon Q Business index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        # Provides information about the number of documents indexed.

        @[JSON::Field(key: "indexStatistics")]
        getter index_statistics : Types::IndexStatistics?

        # The current status of the index. When the value is ACTIVE , the index is ready for use. If the
        # Status field value is FAILED , the ErrorMessage field contains a message that explains why.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of index attached to your Amazon Q Business application.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Unix timestamp when the Amazon Q Business index was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @application_id : String? = nil,
          @capacity_configuration : Types::IndexCapacityConfiguration? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @document_attribute_configurations : Array(Types::DocumentAttributeConfiguration)? = nil,
          @error : Types::ErrorDetail? = nil,
          @index_arn : String? = nil,
          @index_id : String? = nil,
          @index_statistics : Types::IndexStatistics? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetMediaRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business which contains the media object.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The identifier of the media object. You can find this in the sourceAttributions returned by the Chat
        # , ChatSync , and ListMessages API responses.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String

        # The identifier of the Amazon Q Business message.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        def initialize(
          @application_id : String,
          @conversation_id : String,
          @media_id : String,
          @message_id : String
        )
        end
      end


      struct GetMediaResponse
        include JSON::Serializable

        # The base64-encoded bytes of the media object.

        @[JSON::Field(key: "mediaBytes")]
        getter media_bytes : Bytes?

        # The MIME type of the media object (image/png).

        @[JSON::Field(key: "mediaMimeType")]
        getter media_mime_type : String?

        def initialize(
          @media_bytes : Bytes? = nil,
          @media_mime_type : String? = nil
        )
        end
      end


      struct GetPluginRequest
        include JSON::Serializable

        # The identifier of the application which contains the plugin.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        def initialize(
          @application_id : String,
          @plugin_id : String
        )
        end
      end


      struct GetPluginResponse
        include JSON::Serializable

        # The identifier of the application which contains the plugin.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?


        @[JSON::Field(key: "authConfiguration")]
        getter auth_configuration : Types::PluginAuthConfiguration?

        # The current status of a plugin. A plugin is modified asynchronously.

        @[JSON::Field(key: "buildStatus")]
        getter build_status : String?

        # The timestamp for when the plugin was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Configuration information required to create a custom plugin.

        @[JSON::Field(key: "customPluginConfiguration")]
        getter custom_plugin_configuration : Types::CustomPluginConfiguration?

        # The name of the plugin.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of the role with permission to access resources needed to create the
        # plugin.

        @[JSON::Field(key: "pluginArn")]
        getter plugin_arn : String?

        # The identifier of the plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        # The source URL used for plugin configuration.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        # The current state of the plugin.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The type of the plugin.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp for when the plugin was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @application_id : String? = nil,
          @auth_configuration : Types::PluginAuthConfiguration? = nil,
          @build_status : String? = nil,
          @created_at : Time? = nil,
          @custom_plugin_configuration : Types::CustomPluginConfiguration? = nil,
          @display_name : String? = nil,
          @plugin_arn : String? = nil,
          @plugin_id : String? = nil,
          @server_url : String? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetPolicyRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetPolicyResponse
        include JSON::Serializable

        # The JSON representation of the permission policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetRetrieverRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the retriever.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the retriever.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String

        def initialize(
          @application_id : String,
          @retriever_id : String
        )
        end
      end


      struct GetRetrieverResponse
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the retriever.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RetrieverConfiguration?

        # The Unix timestamp when the retriever was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The name of the retriever.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of the IAM role associated with the retriever.

        @[JSON::Field(key: "retrieverArn")]
        getter retriever_arn : String?

        # The identifier of the retriever.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String?

        # The Amazon Resource Name (ARN) of the role with the permission to access the retriever and required
        # resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The status of the retriever.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the retriever.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The Unix timestamp when the retriever was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @application_id : String? = nil,
          @configuration : Types::RetrieverConfiguration? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @retriever_arn : String? = nil,
          @retriever_id : String? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetUserRequest
        include JSON::Serializable

        # The identifier of the application connected to the user.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The user email address attached to the user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @application_id : String,
          @user_id : String
        )
        end
      end


      struct GetUserResponse
        include JSON::Serializable

        # A list of user aliases attached to a user.

        @[JSON::Field(key: "userAliases")]
        getter user_aliases : Array(Types::UserAlias)?

        def initialize(
          @user_aliases : Array(Types::UserAlias)? = nil
        )
        end
      end


      struct GetWebExperienceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String

        def initialize(
          @application_id : String,
          @web_experience_id : String
        )
        end
      end


      struct GetWebExperienceResponse
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The authentication configuration information for your Amazon Q Business web experience.

        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::WebExperienceAuthConfiguration?

        # The browser extension configuration for an Amazon Q Business web experience.

        @[JSON::Field(key: "browserExtensionConfiguration")]
        getter browser_extension_configuration : Types::BrowserExtensionConfiguration?

        # The Unix timestamp when the Amazon Q Business web experience was last created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Gets the custom logo, favicon, font, and color used in the Amazon Q web experience.

        @[JSON::Field(key: "customizationConfiguration")]
        getter customization_configuration : Types::CustomizationConfiguration?

        # The endpoint of your Amazon Q Business web experience.

        @[JSON::Field(key: "defaultEndpoint")]
        getter default_endpoint : String?

        # When the Status field value is FAILED , the ErrorMessage field contains a description of the error
        # that caused the data source connector to fail.

        @[JSON::Field(key: "error")]
        getter error : Types::ErrorDetail?

        # Information about the identity provider (IdP) used to authenticate end users of an Amazon Q Business
        # web experience.

        @[JSON::Field(key: "identityProviderConfiguration")]
        getter identity_provider_configuration : Types::IdentityProviderConfiguration?

        # Gets the website domain origins that are allowed to embed the Amazon Q Business web experience. The
        # domain origin refers to the base URL for accessing a website including the protocol ( http/https ),
        # the domain name, and the port number (if specified).

        @[JSON::Field(key: "origins")]
        getter origins : Array(String)?

        # The Amazon Resource Name (ARN) of the service role attached to your web experience.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Determines whether sample prompts are enabled in the web experience for an end user.

        @[JSON::Field(key: "samplePromptsControlMode")]
        getter sample_prompts_control_mode : String?

        # The current status of the Amazon Q Business web experience. When the Status field value is FAILED ,
        # the ErrorMessage field contains a description of the error that caused the data source connector to
        # fail.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The subtitle for your Amazon Q Business web experience.

        @[JSON::Field(key: "subtitle")]
        getter subtitle : String?

        # The title for your Amazon Q Business web experience.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The Unix timestamp when the Amazon Q Business web experience was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon Resource Name (ARN) of the role with the permission to access the Amazon Q Business web
        # experience and required resources.

        @[JSON::Field(key: "webExperienceArn")]
        getter web_experience_arn : String?

        # The identifier of the Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String?

        # The customized welcome message for end users of an Amazon Q Business web experience.

        @[JSON::Field(key: "welcomeMessage")]
        getter welcome_message : String?

        def initialize(
          @application_id : String? = nil,
          @authentication_configuration : Types::WebExperienceAuthConfiguration? = nil,
          @browser_extension_configuration : Types::BrowserExtensionConfiguration? = nil,
          @created_at : Time? = nil,
          @customization_configuration : Types::CustomizationConfiguration? = nil,
          @default_endpoint : String? = nil,
          @error : Types::ErrorDetail? = nil,
          @identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
          @origins : Array(String)? = nil,
          @role_arn : String? = nil,
          @sample_prompts_control_mode : String? = nil,
          @status : String? = nil,
          @subtitle : String? = nil,
          @title : String? = nil,
          @updated_at : Time? = nil,
          @web_experience_arn : String? = nil,
          @web_experience_id : String? = nil,
          @welcome_message : String? = nil
        )
        end
      end

      # A list of users or sub groups that belong to a group. This is for generating Amazon Q Business chat
      # results only from document a user has access to.

      struct GroupMembers
        include JSON::Serializable

        # A list of sub groups that belong to a group. For example, the sub groups "Research", "Engineering",
        # and "Sales and Marketing" all belong to the group "Company".

        @[JSON::Field(key: "memberGroups")]
        getter member_groups : Array(Types::MemberGroup)?

        # A list of users that belong to a group. For example, a list of interns all belong to the "Interns"
        # group.

        @[JSON::Field(key: "memberUsers")]
        getter member_users : Array(Types::MemberUser)?


        @[JSON::Field(key: "s3PathForGroupMembers")]
        getter s3_path_for_group_members : Types::S3?

        def initialize(
          @member_groups : Array(Types::MemberGroup)? = nil,
          @member_users : Array(Types::MemberUser)? = nil,
          @s3_path_for_group_members : Types::S3? = nil
        )
        end
      end

      # Provides the details of a group's status.

      struct GroupStatusDetail
        include JSON::Serializable

        # The details of an error associated a group status.

        @[JSON::Field(key: "errorDetail")]
        getter error_detail : Types::ErrorDetail?

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The status of a group.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_detail : Types::ErrorDetail? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information for groups.

      struct GroupSummary
        include JSON::Serializable

        # The name of the group the summary information is for.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @group_name : String? = nil
        )
        end
      end

      # Configuration information required to setup hallucination reduction. For more information, see
      # hallucination reduction . The hallucination reduction feature won't work if chat orchestration
      # controls are enabled for your application.

      struct HallucinationReductionConfiguration
        include JSON::Serializable

        # Controls whether hallucination reduction has been enabled or disabled for your application. The
        # default status is DISABLED .

        @[JSON::Field(key: "hallucinationReductionControl")]
        getter hallucination_reduction_control : String?

        def initialize(
          @hallucination_reduction_control : String? = nil
        )
        end
      end

      # Provides the configuration information for invoking a Lambda function in Lambda to alter document
      # metadata and content when ingesting documents into Amazon Q Business. You can configure your Lambda
      # function using the PreExtractionHookConfiguration parameter if you want to apply advanced
      # alterations on the original or raw documents. If you want to apply advanced alterations on the
      # Amazon Q Business structured documents, you must configure your Lambda function using
      # PostExtractionHookConfiguration . You can only invoke one Lambda function. However, this function
      # can invoke other functions it requires. For more information, see Custom document enrichment .

      struct HookConfiguration
        include JSON::Serializable

        # The condition used for when a Lambda function should be invoked. For example, you can specify a
        # condition that if there are empty date-time values, then Amazon Q Business should invoke a function
        # that inserts the current date-time.

        @[JSON::Field(key: "invocationCondition")]
        getter invocation_condition : Types::DocumentAttributeCondition?

        # The Amazon Resource Name (ARN) of the Lambda function during ingestion. For more information, see
        # Using Lambda functions for Amazon Q Business document enrichment .

        @[JSON::Field(key: "lambdaArn")]
        getter lambda_arn : String?

        # The Amazon Resource Name (ARN) of a role with permission to run PreExtractionHookConfiguration and
        # PostExtractionHookConfiguration for altering document metadata and content during the document
        # ingestion process.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Stores the original, raw documents or the structured, parsed documents before and after altering
        # them. For more information, see Data contracts for Lambda functions .

        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        def initialize(
          @invocation_condition : Types::DocumentAttributeCondition? = nil,
          @lambda_arn : String? = nil,
          @role_arn : String? = nil,
          @s3_bucket_name : String? = nil
        )
        end
      end

      # Information about the IAM Identity Center Application used to configure authentication for a plugin.

      struct IdcAuthConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM Identity Center Application used to configure
        # authentication.

        @[JSON::Field(key: "idcApplicationArn")]
        getter idc_application_arn : String

        # The Amazon Resource Name (ARN) of the IAM role with permissions to perform actions on Amazon Web
        # Services services on your behalf.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @idc_application_arn : String,
          @role_arn : String
        )
        end
      end

      # Provides information about the identity provider (IdP) used to authenticate end users of an Amazon Q
      # Business web experience.

      struct IdentityProviderConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "openIDConnectConfiguration")]
        getter open_id_connect_configuration : Types::OpenIDConnectProviderConfiguration?


        @[JSON::Field(key: "samlConfiguration")]
        getter saml_configuration : Types::SamlProviderConfiguration?

        def initialize(
          @open_id_connect_configuration : Types::OpenIDConnectProviderConfiguration? = nil,
          @saml_configuration : Types::SamlProviderConfiguration? = nil
        )
        end
      end

      # The configuration for extracting semantic meaning from images in documents. For more information,
      # see Extracting semantic meaning from images and visuals .

      struct ImageExtractionConfiguration
        include JSON::Serializable

        # Specify whether to extract semantic meaning from images and visuals from documents.

        @[JSON::Field(key: "imageExtractionStatus")]
        getter image_extraction_status : String

        def initialize(
          @image_extraction_status : String
        )
        end
      end

      # Details about an image source, including its identifier and format.

      struct ImageSourceDetails
        include JSON::Serializable

        # Unique identifier for the image file.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String?

        # The MIME type of the image file.

        @[JSON::Field(key: "mediaMimeType")]
        getter media_mime_type : String?

        def initialize(
          @media_id : String? = nil,
          @media_mime_type : String? = nil
        )
        end
      end

      # Summary information for your Amazon Q Business index.

      struct Index
        include JSON::Serializable

        # The Unix timestamp when the index was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The name of the index.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The identifier for the index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        # The current status of the index. When the status is ACTIVE , the index is ready.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Unix timestamp when the index was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @index_id : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides information about index capacity configuration.

      struct IndexCapacityConfiguration
        include JSON::Serializable

        # The number of storage units configured for an Amazon Q Business index.

        @[JSON::Field(key: "units")]
        getter units : Int32?

        def initialize(
          @units : Int32? = nil
        )
        end
      end

      # Provides information about the number of documents in an index.

      struct IndexStatistics
        include JSON::Serializable

        # The number of documents indexed.

        @[JSON::Field(key: "textDocumentStatistics")]
        getter text_document_statistics : Types::TextDocumentStatistics?

        def initialize(
          @text_document_statistics : Types::TextDocumentStatistics? = nil
        )
        end
      end

      # Provides the configuration information for applying basic logic to alter document metadata and
      # content when ingesting documents into Amazon Q Business. To apply advanced logic, to go beyond what
      # you can do with basic logic, see HookConfiguration . For more information, see Custom document
      # enrichment .

      struct InlineDocumentEnrichmentConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "condition")]
        getter condition : Types::DocumentAttributeCondition?

        # TRUE to delete content if the condition used for the target attribute is met.

        @[JSON::Field(key: "documentContentOperator")]
        getter document_content_operator : String?


        @[JSON::Field(key: "target")]
        getter target : Types::DocumentAttributeTarget?

        def initialize(
          @condition : Types::DocumentAttributeCondition? = nil,
          @document_content_operator : String? = nil,
          @target : Types::DocumentAttributeTarget? = nil
        )
        end
      end

      # A set of instructions that define how Amazon Q Business should generate and format responses to user
      # queries. This collection includes parameters for controlling response characteristics such as
      # length, audience targeting, perspective, style, identity, tone, and custom instructions.

      struct InstructionCollection
        include JSON::Serializable

        # Allows administrators to provide specific, custom instructions that guide how Amazon Q Business
        # should respond in particular scenarios or to certain types of queries, enabling fine-grained control
        # over response generation.

        @[JSON::Field(key: "customInstructions")]
        getter custom_instructions : String?

        # Provides sample responses or templates that Amazon Q Business can reference when generating
        # responses, helping to establish consistent patterns and formats for different types of user queries.

        @[JSON::Field(key: "examples")]
        getter examples : String?

        # Defines the persona or identity that Amazon Q Business should adopt when responding to users,
        # allowing for customization of the assistant's character, role, or representation within an
        # organization.

        @[JSON::Field(key: "identity")]
        getter identity : String?

        # Specifies the formatting and structural style of responses, such as bullet points, paragraphs,
        # step-by-step instructions, or other organizational formats that enhance readability and
        # comprehension.

        @[JSON::Field(key: "outputStyle")]
        getter output_style : String?

        # Determines the point of view or perspective from which Amazon Q Business generates responses, such
        # as first-person, second-person, or third-person perspective, affecting how information is presented
        # to users.

        @[JSON::Field(key: "perspective")]
        getter perspective : String?

        # Specifies the desired length of responses generated by Amazon Q Business. This parameter allows
        # administrators to control whether responses are concise and brief or more detailed and
        # comprehensive.

        @[JSON::Field(key: "responseLength")]
        getter response_length : String?

        # Defines the intended audience for the responses, allowing Amazon Q Business to tailor its language,
        # terminology, and explanations appropriately. This could range from technical experts to general
        # users with varying levels of domain knowledge.

        @[JSON::Field(key: "targetAudience")]
        getter target_audience : String?

        # Controls the emotional tone and communication style of responses, such as formal, casual, technical,
        # friendly, or professional, to align with organizational communication standards and user
        # expectations.

        @[JSON::Field(key: "tone")]
        getter tone : String?

        def initialize(
          @custom_instructions : String? = nil,
          @examples : String? = nil,
          @identity : String? = nil,
          @output_style : String? = nil,
          @perspective : String? = nil,
          @response_length : String? = nil,
          @target_audience : String? = nil,
          @tone : String? = nil
        )
        end
      end

      # An issue occurred with the internal server used for your Amazon Q Business service. Wait some
      # minutes and try again, or contact Support for help.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Stores an Amazon Kendra index as a retriever.

      struct KendraIndexConfiguration
        include JSON::Serializable

        # The identifier of the Amazon Kendra index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @index_id : String
        )
        end
      end

      # You don't have permissions to perform the action because your license is inactive. Ask your admin to
      # activate your license and try again after your licence is active.

      struct LicenseNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The maximum number of Amazon Q Business applications to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business applications.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # An array of summary information on the configuration of one or more Amazon Q Business applications.

        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::Application)?

        # If the response is truncated, Amazon Q Business returns this token. You can use this token in a
        # subsequent request to retrieve the next set of applications.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::Application)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAttachmentsRequest
        include JSON::Serializable

        # The unique identifier for the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the Amazon Q Business web experience conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The maximum number of attachements to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the number of attachments returned exceeds maxResults , Amazon Q Business returns a next token as
        # a pagination token to retrieve the next set of attachments.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The unique identifier of the user involved in the Amazon Q Business web experience conversation.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @conversation_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct ListAttachmentsResponse
        include JSON::Serializable

        # An array of information on one or more attachments.

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::Attachment)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of attachments.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attachments : Array(Types::Attachment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChatResponseConfigurationsRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application for which to list available chat response
        # configurations.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of chat response configurations to return in a single response. This parameter
        # helps control pagination of results when many configurations exist.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token used to retrieve the next set of results when the number of configurations
        # exceeds the specified maxResults value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListChatResponseConfigurationsResponse
        include JSON::Serializable

        # A list of chat response configuration summaries, each containing key information about an available
        # configuration in the specified application.

        @[JSON::Field(key: "chatResponseConfigurations")]
        getter chat_response_configurations : Array(Types::ChatResponseConfiguration)?

        # A pagination token that can be used in a subsequent request to retrieve additional chat response
        # configurations if the results were truncated due to the maxResults parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @chat_response_configurations : Array(Types::ChatResponseConfiguration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConversationsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of Amazon Q Business conversations to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business conversations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the user involved in the Amazon Q Business web experience conversation.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct ListConversationsResponse
        include JSON::Serializable

        # An array of summary information on the configuration of one or more Amazon Q Business web
        # experiences.

        @[JSON::Field(key: "conversations")]
        getter conversations : Array(Types::Conversation)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of messages.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @conversations : Array(Types::Conversation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataAccessorsRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. (You received this token from a previous call.)

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataAccessorsResponse
        include JSON::Serializable

        # The list of data accessors.

        @[JSON::Field(key: "dataAccessors")]
        getter data_accessors : Array(Types::DataAccessor)?

        # The token to use to retrieve the next set of results, if there are any.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_accessors : Array(Types::DataAccessor)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourceSyncJobsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application connected to the data source.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the index used with the Amazon Q Business data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The end time of the data source connector sync.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The maximum number of synchronization jobs to return in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incpmplete because there is more data to retriever, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of responses.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The start time of the data source connector sync.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Only returns synchronization jobs with the Status field equal to the specified status.

        @[JSON::Field(key: "syncStatus")]
        getter status_filter : String?

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String,
          @end_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct ListDataSourceSyncJobsResponse
        include JSON::Serializable

        # A history of synchronization jobs for the data source connector.

        @[JSON::Field(key: "history")]
        getter history : Array(Types::DataSourceSyncJob)?

        # If the response is truncated, Amazon Q Business returns this token. You can use this token in any
        # subsequent request to retrieve the next set of jobs.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @history : Array(Types::DataSourceSyncJob)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the data source connectors.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the index used with one or more data source connectors.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The maximum number of data source connectors to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business data source connectors.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesResponse
        include JSON::Serializable

        # An array of summary information for one or more data source connector.

        @[JSON::Field(key: "dataSources")]
        getter data_sources : Array(Types::DataSource)?

        # If the response is truncated, Amazon Q Business returns this token. You can use this token in a
        # subsequent request to retrieve the next set of data source connectors.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_sources : Array(Types::DataSource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentsRequest
        include JSON::Serializable

        # The identifier of the application id the documents are attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the index the documents are attached to.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The identifier of the data sources the documents are attached to.

        @[JSON::Field(key: "dataSourceIds")]
        getter data_source_ids : Array(String)?

        # The maximum number of documents to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of documents.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @index_id : String,
          @data_source_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDocumentsResponse
        include JSON::Serializable

        # A list of document details.

        @[JSON::Field(key: "documentDetailList")]
        getter document_detail_list : Array(Types::DocumentDetails)?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of documents.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @document_detail_list : Array(Types::DocumentDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable

        # The identifier of the application for getting a list of groups mapped to users.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the index for getting a list of groups mapped to users.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The timestamp identifier used for the latest PUT or DELETE action for mapping users to their groups.

        @[JSON::Field(key: "updatedEarlierThan")]
        getter updated_earlier_than : Time

        # The identifier of the data source for getting a list of groups mapped to users.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The maximum number of returned groups that are mapped to users.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of groups that are mapped to users.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @index_id : String,
          @updated_earlier_than : Time,
          @data_source_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsResponse
        include JSON::Serializable

        # Summary information for list of groups that are mapped to users.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::GroupSummary)?

        # If the response is truncated, Amazon Q Business returns this token that you can use in the
        # subsequent request to retrieve the next set of groups that are mapped to users.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicesRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application connected to the index.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of indices to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business indices.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicesResponse
        include JSON::Serializable

        # An array of information on the items in one or more indexes.

        @[JSON::Field(key: "indices")]
        getter indices : Array(Types::Index)?

        # If the response is truncated, Amazon Q Business returns this token that you can use in the
        # subsequent request to retrieve the next set of indexes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @indices : Array(Types::Index)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMessagesRequest
        include JSON::Serializable

        # The identifier for the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business web experience conversation.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The maximum number of messages to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the number of messages returned exceeds maxResults , Amazon Q Business returns a next token as a
        # pagination token to retrieve the next set of messages.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the user involved in the Amazon Q Business web experience conversation.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @conversation_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct ListMessagesResponse
        include JSON::Serializable

        # An array of information on one or more messages.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of messages.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @messages : Array(Types::Message)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginActionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application the plugin is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        # The maximum number of plugin actions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the number of plugin actions returned exceeds maxResults , Amazon Q Business returns a next token
        # as a pagination token to retrieve the next set of plugin actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @plugin_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginActionsResponse
        include JSON::Serializable

        # An array of information on one or more plugin actions.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ActionSummary)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of plugin actions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ActionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginTypeActionsRequest
        include JSON::Serializable

        # The type of the plugin.

        @[JSON::Field(key: "pluginType")]
        getter plugin_type : String

        # The maximum number of plugins to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the number of plugins returned exceeds maxResults , Amazon Q Business returns a next token as a
        # pagination token to retrieve the next set of plugins.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @plugin_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginTypeActionsResponse
        include JSON::Serializable

        # An array of information on one or more plugins.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ActionSummary)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of plugins.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ActionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginTypeMetadataRequest
        include JSON::Serializable

        # The maximum number of plugin metadata items to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the metadata returned exceeds maxResults , Amazon Q Business returns a next token as a pagination
        # token to retrieve the next set of metadata.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginTypeMetadataResponse
        include JSON::Serializable

        # An array of information on plugin metadata.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::PluginTypeMetadataSummary)?

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of plugin metadata.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PluginTypeMetadataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginsRequest
        include JSON::Serializable

        # The identifier of the application the plugin is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of documents to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of plugins.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPluginsResponse
        include JSON::Serializable

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of plugins.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about a configured plugin.

        @[JSON::Field(key: "plugins")]
        getter plugins : Array(Types::Plugin)?

        def initialize(
          @next_token : String? = nil,
          @plugins : Array(Types::Plugin)? = nil
        )
        end
      end


      struct ListRetrieversRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the retriever.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of retrievers returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the number of retrievers returned exceeds maxResults , Amazon Q Business returns a next token as
        # a pagination token to retrieve the next set of retrievers.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRetrieversResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of retrievers.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of summary information for one or more retrievers.

        @[JSON::Field(key: "retrievers")]
        getter retrievers : Array(Types::Retriever)?

        def initialize(
          @next_token : String? = nil,
          @retrievers : Array(Types::Retriever)? = nil
        )
        end
      end


      struct ListSubscriptionsRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the subscription.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of Amazon Q Business subscriptions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business subscriptions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSubscriptionsResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Q Business returns this token. You can use this token in a
        # subsequent request to retrieve the next set of subscriptions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of summary information on the subscriptions configured for an Amazon Q Business
        # application.

        @[JSON::Field(key: "subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @next_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q Business application or data source to get a list of
        # tags for.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the Amazon Q Business application or data source.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWebExperiencesRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application linked to the listed web experiences.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of Amazon Q Business Web Experiences to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the maxResults response was incomplete because there is more data to retrieve, Amazon Q Business
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Q Business conversations.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWebExperiencesResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Q Business returns this token, which you can use in a later
        # request to list the next set of messages.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of summary information for one or more Amazon Q Business experiences.

        @[JSON::Field(key: "webExperiences")]
        getter web_experiences : Array(Types::WebExperience)?

        def initialize(
          @next_token : String? = nil,
          @web_experiences : Array(Types::WebExperience)? = nil
        )
        end
      end

      # The configuration for extracting information from media in documents.

      struct MediaExtractionConfiguration
        include JSON::Serializable

        # Configuration settings for extracting and processing audio content from media files.

        @[JSON::Field(key: "audioExtractionConfiguration")]
        getter audio_extraction_configuration : Types::AudioExtractionConfiguration?

        # The configuration for extracting semantic meaning from images in documents. For more information,
        # see Extracting semantic meaning from images and visuals .

        @[JSON::Field(key: "imageExtractionConfiguration")]
        getter image_extraction_configuration : Types::ImageExtractionConfiguration?

        # Configuration settings for extracting and processing video content from media files.

        @[JSON::Field(key: "videoExtractionConfiguration")]
        getter video_extraction_configuration : Types::VideoExtractionConfiguration?

        def initialize(
          @audio_extraction_configuration : Types::AudioExtractionConfiguration? = nil,
          @image_extraction_configuration : Types::ImageExtractionConfiguration? = nil,
          @video_extraction_configuration : Types::VideoExtractionConfiguration? = nil
        )
        end
      end

      # The requested media object is too large to be returned.

      struct MediaTooLargeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The sub groups that belong to a group.

      struct MemberGroup
        include JSON::Serializable

        # The name of the sub group.

        @[JSON::Field(key: "groupName")]
        getter group_name : String

        # The type of the sub group.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @group_name : String,
          @type : String? = nil
        )
        end
      end

      # The users that belong to a group.

      struct MemberUser
        include JSON::Serializable

        # The identifier of the user you want to map to a group.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The type of the user.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @user_id : String,
          @type : String? = nil
        )
        end
      end

      # A message in an Amazon Q Business web experience.

      struct Message
        include JSON::Serializable


        @[JSON::Field(key: "actionExecution")]
        getter action_execution : Types::ActionExecution?


        @[JSON::Field(key: "actionReview")]
        getter action_review : Types::ActionReview?

        # A file directly uploaded into an Amazon Q Business web experience chat.

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::AttachmentOutput)?

        # The content of the Amazon Q Business web experience message.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The identifier of the Amazon Q Business web experience message.

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        # The source documents used to generate Amazon Q Business web experience message.

        @[JSON::Field(key: "sourceAttribution")]
        getter source_attribution : Array(Types::SourceAttribution)?

        # The timestamp of the first Amazon Q Business web experience message.

        @[JSON::Field(key: "time")]
        getter time : Time?

        # The type of Amazon Q Business message, whether HUMAN or AI generated.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action_execution : Types::ActionExecution? = nil,
          @action_review : Types::ActionReview? = nil,
          @attachments : Array(Types::AttachmentOutput)? = nil,
          @body : String? = nil,
          @message_id : String? = nil,
          @source_attribution : Array(Types::SourceAttribution)? = nil,
          @time : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # End user feedback on an AI-generated web experience chat message usefulness.

      struct MessageUsefulnessFeedback
        include JSON::Serializable

        # The timestamp for when the feedback was submitted.

        @[JSON::Field(key: "submittedAt")]
        getter submitted_at : Time

        # The usefulness value assigned by an end user to a message.

        @[JSON::Field(key: "usefulness")]
        getter usefulness : String

        # A comment given by an end user on the usefulness of an AI-generated chat message.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The reason for a usefulness rating.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @submitted_at : Time,
          @usefulness : String,
          @comment : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A metadata event for a AI-generated text output message in a Amazon Q Business conversation,
      # containing associated metadata generated.

      struct MetadataEvent
        include JSON::Serializable

        # The identifier of the conversation with which the generated metadata is associated.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # The final text output message generated by the system.

        @[JSON::Field(key: "finalTextMessage")]
        getter final_text_message : String?

        # The source documents used to generate the conversation response.

        @[JSON::Field(key: "sourceAttributions")]
        getter source_attributions : Array(Types::SourceAttribution)?

        # The identifier of an Amazon Q Business AI generated message within the conversation.

        @[JSON::Field(key: "systemMessageId")]
        getter system_message_id : String?

        # The identifier of an Amazon Q Business end user text input message within the conversation.

        @[JSON::Field(key: "userMessageId")]
        getter user_message_id : String?

        def initialize(
          @conversation_id : String? = nil,
          @final_text_message : String? = nil,
          @source_attributions : Array(Types::SourceAttribution)? = nil,
          @system_message_id : String? = nil,
          @user_message_id : String? = nil
        )
        end
      end

      # Configuration information for an Amazon Q Business index.

      struct NativeIndexConfiguration
        include JSON::Serializable

        # The identifier for the Amazon Q Business index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # Overrides the default boosts applied by Amazon Q Business to supported document attribute data
        # types.

        @[JSON::Field(key: "boostingOverride")]
        getter boosting_override : Hash(String, Types::DocumentAttributeBoostingConfiguration)?

        # A read-only field that specifies the version of the NativeIndexConfiguration . Amazon Q Business
        # introduces enhanced document retrieval capabilities in version 2 of NativeIndexConfiguration ,
        # focusing on streamlined metadata boosting that prioritizes recency and source relevance to deliver
        # more accurate responses to your queries. Version 2 has the following differences from version 1:
        # Version 2 supports a single Date field (created_at OR last_updated_at) for recency boosting Version
        # 2 supports a single String field with an ordered list of up to 5 values Version 2 introduces
        # number-based boost levels (ONE, TWO) alongside the text-based levels Version 2 allows specifying
        # prioritization between Date and String fields Version 2 maintains backward compatibility with
        # existing configurations

        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @index_id : String,
          @boosting_override : Hash(String, Types::DocumentAttributeBoostingConfiguration)? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Information about invoking a custom plugin without any authentication or authorization requirement.

      struct NoAuthConfiguration
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information on boosting NUMBER type document attributes. In the current boosting
      # implementation, boosting focuses primarily on DATE attributes for recency and STRING attributes for
      # source prioritization. NUMBER attributes can serve as additional boosting factors when needed, but
      # are not supported when using NativeIndexConfiguration version 2. For more information on how
      # boosting document attributes work in Amazon Q Business, see Boosting using document attributes .

      struct NumberAttributeBoostingConfiguration
        include JSON::Serializable

        # Specifies the priority of boosted document attributes in relation to other boosted attributes. This
        # parameter determines how strongly the attribute influences document ranking in search results.
        # NUMBER attributes can serve as additional boosting factors when needed, but are not supported when
        # using NativeIndexConfiguration version 2.

        @[JSON::Field(key: "boostingLevel")]
        getter boosting_level : String

        # Specifies whether higher or lower numeric values should be prioritized when boosting. Valid values
        # are ASCENDING (higher numbers are more important) and DESCENDING (lower numbers are more important).

        @[JSON::Field(key: "boostingType")]
        getter boosting_type : String?

        def initialize(
          @boosting_level : String,
          @boosting_type : String? = nil
        )
        end
      end

      # Information about the OAuth 2.0 authentication credential/token used to configure a plugin.

      struct OAuth2ClientCredentialConfiguration
        include JSON::Serializable

        # The ARN of an IAM role used by Amazon Q Business to access the OAuth 2.0 authentication credentials
        # stored in a Secrets Manager secret.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The ARN of the Secrets Manager secret that stores the OAuth 2.0 credentials/token used for plugin
        # configuration.

        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String

        # The redirect URL required by the OAuth 2.0 protocol for Amazon Q Business to authenticate a plugin
        # user through a third party authentication server.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String?

        # The URL required by the OAuth 2.0 protocol to exchange an end user authorization code for an access
        # token.

        @[JSON::Field(key: "tokenUrl")]
        getter token_url : String?

        def initialize(
          @role_arn : String,
          @secret_arn : String,
          @authorization_url : String? = nil,
          @token_url : String? = nil
        )
        end
      end

      # Information about the OIDC-compliant identity provider (IdP) used to authenticate end users of an
      # Amazon Q Business web experience.

      struct OpenIDConnectProviderConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a Secrets Manager secret containing the OIDC client secret.

        @[JSON::Field(key: "secretsArn")]
        getter secrets_arn : String

        # An IAM role with permissions to access KMS to decrypt the Secrets Manager secret containing your
        # OIDC client secret.

        @[JSON::Field(key: "secretsRole")]
        getter secrets_role : String

        def initialize(
          @secrets_arn : String,
          @secrets_role : String
        )
        end
      end

      # Configuration information required to enable chat orchestration for your Amazon Q Business
      # application. Chat orchestration is optimized to work for English language content. For more details
      # on language support in Amazon Q Business, see Supported languages .

      struct OrchestrationConfiguration
        include JSON::Serializable

        # Status information about whether chat orchestration is activated or deactivated for your Amazon Q
        # Business application.

        @[JSON::Field(key: "control")]
        getter control : String

        def initialize(
          @control : String
        )
        end
      end

      # Defines a condition that restricts when a permission is effective. Conditions allow you to control
      # access based on specific attributes of the request.

      struct PermissionCondition
        include JSON::Serializable

        # The key for the condition. This identifies the attribute that the condition applies to.

        @[JSON::Field(key: "conditionKey")]
        getter condition_key : String

        # The operator to use for the condition evaluation. This determines how the condition values are
        # compared.

        @[JSON::Field(key: "conditionOperator")]
        getter condition_operator : String

        # The values to compare against using the specified condition operator.

        @[JSON::Field(key: "conditionValues")]
        getter condition_values : Array(String)

        def initialize(
          @condition_key : String,
          @condition_operator : String,
          @condition_values : Array(String)
        )
        end
      end

      # Configuration information about chat response personalization. For more information, see
      # Personalizing chat responses .

      struct PersonalizationConfiguration
        include JSON::Serializable

        # An option to allow Amazon Q Business to customize chat responses using user specific
        # metadata—specifically, location and job information—in your IAM Identity Center instance.

        @[JSON::Field(key: "personalizationControlMode")]
        getter personalization_control_mode : String

        def initialize(
          @personalization_control_mode : String
        )
        end
      end

      # Information about an Amazon Q Business plugin and its configuration.

      struct Plugin
        include JSON::Serializable

        # The status of the plugin.

        @[JSON::Field(key: "buildStatus")]
        getter build_status : String?

        # The timestamp for when the plugin was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The name of the plugin.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The identifier of the plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String?

        # The plugin server URL used for configuration.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        # The current status of the plugin.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The type of the plugin.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp for when the plugin was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @build_status : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @plugin_id : String? = nil,
          @server_url : String? = nil,
          @state : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Authentication configuration information for an Amazon Q Business plugin.

      struct PluginAuthConfiguration
        include JSON::Serializable

        # Information about the basic authentication credentials used to configure a plugin.

        @[JSON::Field(key: "basicAuthConfiguration")]
        getter basic_auth_configuration : Types::BasicAuthConfiguration?

        # Information about the IAM Identity Center Application used to configure authentication for a plugin.

        @[JSON::Field(key: "idcAuthConfiguration")]
        getter idc_auth_configuration : Types::IdcAuthConfiguration?

        # Information about invoking a custom plugin without any authentication.

        @[JSON::Field(key: "noAuthConfiguration")]
        getter no_auth_configuration : Types::NoAuthConfiguration?

        # Information about the OAuth 2.0 authentication credential/token used to configure a plugin.

        @[JSON::Field(key: "oAuth2ClientCredentialConfiguration")]
        getter o_auth2_client_credential_configuration : Types::OAuth2ClientCredentialConfiguration?

        def initialize(
          @basic_auth_configuration : Types::BasicAuthConfiguration? = nil,
          @idc_auth_configuration : Types::IdcAuthConfiguration? = nil,
          @no_auth_configuration : Types::NoAuthConfiguration? = nil,
          @o_auth2_client_credential_configuration : Types::OAuth2ClientCredentialConfiguration? = nil
        )
        end
      end

      # Configuration information required to invoke chat in PLUGIN_MODE . For more information, see Admin
      # controls and guardrails , Plugins , and Conversation settings .

      struct PluginConfiguration
        include JSON::Serializable

        # The identifier of the plugin you want to use.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        def initialize(
          @plugin_id : String
        )
        end
      end

      # Summary metadata information for a Amazon Q Business plugin.

      struct PluginTypeMetadataSummary
        include JSON::Serializable

        # The category of the plugin type.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The description assigned by Amazon Q Business to a plugin. You can't modify this value.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The type of the plugin.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @category : String? = nil,
          @description : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides user and group information used for filtering documents to use for generating Amazon Q
      # Business conversation responses.

      struct Principal
        include JSON::Serializable

        # The group associated with the principal.

        @[JSON::Field(key: "group")]
        getter group : Types::PrincipalGroup?

        # The user associated with the principal.

        @[JSON::Field(key: "user")]
        getter user : Types::PrincipalUser?

        def initialize(
          @group : Types::PrincipalGroup? = nil,
          @user : Types::PrincipalUser? = nil
        )
        end
      end

      # Provides information about a group associated with the principal.

      struct PrincipalGroup
        include JSON::Serializable

        # Provides information about whether to allow or deny access to the principal.

        @[JSON::Field(key: "access")]
        getter access : String

        # The type of group.

        @[JSON::Field(key: "membershipType")]
        getter membership_type : String?

        # The name of the group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @access : String,
          @membership_type : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides information about a user associated with a principal.

      struct PrincipalUser
        include JSON::Serializable

        # Provides information about whether to allow or deny access to the principal.

        @[JSON::Field(key: "access")]
        getter access : String

        # The identifier of the user.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The type of group.

        @[JSON::Field(key: "membershipType")]
        getter membership_type : String?

        def initialize(
          @access : String,
          @id : String? = nil,
          @membership_type : String? = nil
        )
        end
      end


      struct PutFeedbackRequest
        include JSON::Serializable

        # The identifier of the application associated with the feedback.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the conversation the feedback is attached to.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String

        # The identifier of the chat message that the feedback was given for.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        # The timestamp for when the feedback was recorded.

        @[JSON::Field(key: "messageCopiedAt")]
        getter message_copied_at : Time?

        # The feedback usefulness value given by the user to the chat message.

        @[JSON::Field(key: "messageUsefulness")]
        getter message_usefulness : Types::MessageUsefulnessFeedback?

        # The identifier of the user giving the feedback.

        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @application_id : String,
          @conversation_id : String,
          @message_id : String,
          @message_copied_at : Time? = nil,
          @message_usefulness : Types::MessageUsefulnessFeedback? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct PutGroupRequest
        include JSON::Serializable

        # The identifier of the application in which the user and group mapping belongs.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String


        @[JSON::Field(key: "groupMembers")]
        getter group_members : Types::GroupMembers

        # The list that contains your users or sub groups that belong the same group. For example, the group
        # "Company" includes the user "CEO" and the sub groups "Research", "Engineering", and "Sales and
        # Marketing".

        @[JSON::Field(key: "groupName")]
        getter group_name : String

        # The identifier of the index in which you want to map users to their groups.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The type of the group.

        @[JSON::Field(key: "type")]
        getter type : String

        # The identifier of the data source for which you want to map users to their groups. This is useful if
        # a group is tied to multiple data sources, but you only want the group to access documents of a
        # certain data source. For example, the groups "Research", "Engineering", and "Sales and Marketing"
        # are all tied to the company's documents stored in the data sources Confluence and Salesforce.
        # However, "Sales and Marketing" team only needs access to customer-related documents stored in
        # Salesforce.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The Amazon Resource Name (ARN) of an IAM role that has access to the S3 file that contains your list
        # of users that belong to a group.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @application_id : String,
          @group_members : Types::GroupMembers,
          @group_name : String,
          @index_id : String,
          @type : String,
          @data_source_id : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct PutGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration information about Amazon Q Apps.

      struct QAppsConfiguration
        include JSON::Serializable

        # Status information about whether end users can create and use Amazon Q Apps in the web experience.

        @[JSON::Field(key: "qAppsControlMode")]
        getter q_apps_control_mode : String

        def initialize(
          @q_apps_control_mode : String
        )
        end
      end

      # The Amazon Quick Suite configuration for an Amazon Q Business application that uses Quick Suite as
      # the identity provider. For more information, see Creating an Amazon Quick Suite integrated
      # application .

      struct QuickSightConfiguration
        include JSON::Serializable

        # The Amazon Quick Suite namespace that is used as the identity provider. For more information about
        # Quick Suite namespaces, see Namespace operations .

        @[JSON::Field(key: "clientNamespace")]
        getter client_namespace : String

        def initialize(
          @client_namespace : String
        )
        end
      end

      # Represents a piece of content that is relevant to a search query.

      struct RelevantContent
        include JSON::Serializable

        # The actual content of the relevant item.

        @[JSON::Field(key: "content")]
        getter content : String?

        # Additional attributes of the document containing the relevant content.

        @[JSON::Field(key: "documentAttributes")]
        getter document_attributes : Array(Types::DocumentAttribute)?

        # The unique identifier of the document containing the relevant content.

        @[JSON::Field(key: "documentId")]
        getter document_id : String?

        # The title of the document containing the relevant content.

        @[JSON::Field(key: "documentTitle")]
        getter document_title : String?

        # The URI of the document containing the relevant content.

        @[JSON::Field(key: "documentUri")]
        getter document_uri : String?

        # Attributes related to the relevance score of the content.

        @[JSON::Field(key: "scoreAttributes")]
        getter score_attributes : Types::ScoreAttributes?

        def initialize(
          @content : String? = nil,
          @document_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_id : String? = nil,
          @document_title : String? = nil,
          @document_uri : String? = nil,
          @score_attributes : Types::ScoreAttributes? = nil
        )
        end
      end

      # The application or plugin resource you want to use doesn’t exist. Make sure you have provided the
      # correct resource and try again.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The message describing a ResourceNotFoundException .

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource affected.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource affected.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Configuration settings to define how Amazon Q Business generates and formats responses to user
      # queries. This includes customization options for response style, tone, length, and other
      # characteristics.

      struct ResponseConfiguration
        include JSON::Serializable

        # A collection of instructions that guide how Amazon Q Business generates responses, including
        # parameters for response length, target audience, perspective, output style, identity, tone, and
        # custom instructions.

        @[JSON::Field(key: "instructionCollection")]
        getter instruction_collection : Types::InstructionCollection?

        def initialize(
          @instruction_collection : Types::InstructionCollection? = nil
        )
        end
      end

      # Summary information for the retriever used for your Amazon Q Business application.

      struct Retriever
        include JSON::Serializable

        # The identifier of the Amazon Q Business application using the retriever.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The name of your retriever.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The identifier of the retriever used by your Amazon Q Business application.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String?

        # The status of your retriever.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of your retriever.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @application_id : String? = nil,
          @display_name : String? = nil,
          @retriever_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides information on how the retriever used for your Amazon Q Business application is configured.

      struct RetrieverConfiguration
        include JSON::Serializable

        # Provides information on how the Amazon Kendra index used as a retriever for your Amazon Q Business
        # application is configured.

        @[JSON::Field(key: "kendraIndexConfiguration")]
        getter kendra_index_configuration : Types::KendraIndexConfiguration?

        # Provides information on how a Amazon Q Business index used as a retriever for your Amazon Q Business
        # application is configured.

        @[JSON::Field(key: "nativeIndexConfiguration")]
        getter native_index_configuration : Types::NativeIndexConfiguration?

        def initialize(
          @kendra_index_configuration : Types::KendraIndexConfiguration? = nil,
          @native_index_configuration : Types::NativeIndexConfiguration? = nil
        )
        end
      end

      # Specifies a retriever as the content source for a search.

      struct RetrieverContentSource
        include JSON::Serializable

        # The unique identifier of the retriever to use as the content source.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String

        def initialize(
          @retriever_id : String
        )
        end
      end

      # Guardrail rules for an Amazon Q Business application. Amazon Q Business supports only one rule at a
      # time.

      struct Rule
        include JSON::Serializable

        # The type of rule.

        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # Users and groups to be excluded from a rule.

        @[JSON::Field(key: "excludedUsersAndGroups")]
        getter excluded_users_and_groups : Types::UsersAndGroups?

        # Users and groups to be included in a rule.

        @[JSON::Field(key: "includedUsersAndGroups")]
        getter included_users_and_groups : Types::UsersAndGroups?

        # The configuration information for a rule.

        @[JSON::Field(key: "ruleConfiguration")]
        getter rule_configuration : Types::RuleConfiguration?

        def initialize(
          @rule_type : String,
          @excluded_users_and_groups : Types::UsersAndGroups? = nil,
          @included_users_and_groups : Types::UsersAndGroups? = nil,
          @rule_configuration : Types::RuleConfiguration? = nil
        )
        end
      end

      # Provides configuration information about a rule.

      struct RuleConfiguration
        include JSON::Serializable

        # A rule for configuring how Amazon Q Business responds when it encounters a a blocked topic.

        @[JSON::Field(key: "contentBlockerRule")]
        getter content_blocker_rule : Types::ContentBlockerRule?


        @[JSON::Field(key: "contentRetrievalRule")]
        getter content_retrieval_rule : Types::ContentRetrievalRule?

        def initialize(
          @content_blocker_rule : Types::ContentBlockerRule? = nil,
          @content_retrieval_rule : Types::ContentRetrievalRule? = nil
        )
        end
      end

      # Information required for Amazon Q Business to find a specific file in an Amazon S3 bucket.

      struct S3
        include JSON::Serializable

        # The name of the S3 bucket that contains the file.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The name of the file.

        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Provides the SAML 2.0 compliant identity provider (IdP) configuration information Amazon Q Business
      # needs to deploy a Amazon Q Business web experience.

      struct SamlConfiguration
        include JSON::Serializable

        # The metadata XML that your IdP generated.

        @[JSON::Field(key: "metadataXML")]
        getter metadata_xml : String

        # The Amazon Resource Name (ARN) of an IAM role assumed by users when they authenticate into their
        # Amazon Q Business web experience, containing the relevant Amazon Q Business permissions for
        # conversing with Amazon Q Business.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The user attribute name in your IdP that maps to the user email.

        @[JSON::Field(key: "userIdAttribute")]
        getter user_id_attribute : String

        # The group attribute name in your IdP that maps to user groups.

        @[JSON::Field(key: "userGroupAttribute")]
        getter user_group_attribute : String?

        def initialize(
          @metadata_xml : String,
          @role_arn : String,
          @user_id_attribute : String,
          @user_group_attribute : String? = nil
        )
        end
      end

      # Information about the SAML 2.0-compliant identity provider (IdP) used to authenticate end users of
      # an Amazon Q Business web experience.

      struct SamlProviderConfiguration
        include JSON::Serializable

        # The URL where Amazon Q Business end users will be redirected for authentication.

        @[JSON::Field(key: "authenticationUrl")]
        getter authentication_url : String

        def initialize(
          @authentication_url : String
        )
        end
      end

      # Provides information about the relevance score of content.

      struct ScoreAttributes
        include JSON::Serializable

        # The confidence level of the relevance score.

        @[JSON::Field(key: "scoreConfidence")]
        getter score_confidence : String?

        def initialize(
          @score_confidence : String? = nil
        )
        end
      end


      struct SearchRelevantContentRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application to search.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The source of content to search in.

        @[JSON::Field(key: "contentSource")]
        getter content_source : Types::ContentSource

        # The text to search for.

        @[JSON::Field(key: "queryText")]
        getter query_text : String


        @[JSON::Field(key: "attributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. (You received this token from a previous call.)

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @content_source : Types::ContentSource,
          @query_text : String,
          @attribute_filter : Types::AttributeFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchRelevantContentResponse
        include JSON::Serializable

        # The token to use to retrieve the next set of results, if there are any.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of relevant content items found.

        @[JSON::Field(key: "relevantContent")]
        getter relevant_content : Array(Types::RelevantContent)?

        def initialize(
          @next_token : String? = nil,
          @relevant_content : Array(Types::RelevantContent)? = nil
        )
        end
      end

      # You have exceeded the set limits for your Amazon Q Business service.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The message describing a ServiceQuotaExceededException .

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource affected.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource affected.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Contains the relevant text excerpt from a source that was used to generate a citation text segment
      # in an Amazon Q Business chat response.

      struct SnippetExcerpt
        include JSON::Serializable

        # The relevant text excerpt from a source that was used to generate a citation text segment in an
        # Amazon Q chat response.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # The documents used to generate an Amazon Q Business web experience response.

      struct SourceAttribution
        include JSON::Serializable

        # The number attached to a citation in an Amazon Q Business generated response.

        @[JSON::Field(key: "citationNumber")]
        getter citation_number : Int32?

        # The identifier of the data source from which the document was ingested. This field is not present if
        # the document is ingested by directly calling the BatchPutDocument API (similar to
        # checkDocumentAccess). If the document is from a file-upload data source, the datasource will be
        # "uploaded-docs-file-stat-datasourceid".

        @[JSON::Field(key: "datasourceId")]
        getter datasource_id : String?

        # The unique identifier of the source document used in the citation, obtained from the Amazon Q
        # Business index during chat response generation. This ID is used as input to the GetDocumentContent
        # API to retrieve the actual document content for user verification.

        @[JSON::Field(key: "documentId")]
        getter document_id : String?

        # The identifier of the index containing the source document's metadata and access control
        # information. This links the citation back to the specific Amazon Q Business index where the
        # document's searchable content and permissions are stored.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        # The content extract from the document on which the generated response is based.

        @[JSON::Field(key: "snippet")]
        getter snippet : String?

        # A text extract from a source document that is used for source attribution.

        @[JSON::Field(key: "textMessageSegments")]
        getter text_message_segments : Array(Types::TextSegment)?

        # The title of the document which is the source for the Amazon Q Business generated response.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The URL of the document which is the source for the Amazon Q Business generated response.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @citation_number : Int32? = nil,
          @datasource_id : String? = nil,
          @document_id : String? = nil,
          @index_id : String? = nil,
          @snippet : String? = nil,
          @text_message_segments : Array(Types::TextSegment)? = nil,
          @title : String? = nil,
          @updated_at : Time? = nil,
          @url : String? = nil
        )
        end
      end

      # Container for details about different types of media sources (image, audio, or video).

      struct SourceDetails
        include JSON::Serializable

        # Details specific to audio content within the source.

        @[JSON::Field(key: "audioSourceDetails")]
        getter audio_source_details : Types::AudioSourceDetails?

        # Details specific to image content within the source.

        @[JSON::Field(key: "imageSourceDetails")]
        getter image_source_details : Types::ImageSourceDetails?

        # Details specific to video content within the source.

        @[JSON::Field(key: "videoSourceDetails")]
        getter video_source_details : Types::VideoSourceDetails?

        def initialize(
          @audio_source_details : Types::AudioSourceDetails? = nil,
          @image_source_details : Types::ImageSourceDetails? = nil,
          @video_source_details : Types::VideoSourceDetails? = nil
        )
        end
      end


      struct StartDataSourceSyncJobRequest
        include JSON::Serializable

        # The identifier of Amazon Q Business application the data source is connected to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String
        )
        end
      end


      struct StartDataSourceSyncJobResponse
        include JSON::Serializable

        # The identifier for a particular synchronization job.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        def initialize(
          @execution_id : String? = nil
        )
        end
      end


      struct StopDataSourceSyncJobRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application that the data source is connected to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the index used with the Amazon Q Business data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String
        )
        end
      end


      struct StopDataSourceSyncJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information on boosting STRING type document attributes. For STRING and STRING_LIST type
      # document attributes to be used for boosting on the console and the API, they must be enabled for
      # search using the DocumentAttributeConfiguration object of the UpdateIndex API. If you haven't
      # enabled searching on these attributes, you can't boost attributes of these data types on either the
      # console or the API. For more information on how boosting document attributes work in Amazon Q
      # Business, see Boosting using document attributes .

      struct StringAttributeBoostingConfiguration
        include JSON::Serializable

        # Specifies the priority tier ranking of boosting applied to document attributes. For version 2, this
        # parameter indicates the relative ranking between boosted fields (ONE being highest priority, TWO
        # being second highest, etc.) and determines the order in which attributes influence document ranking
        # in search results. For version 1, this parameter specifies the boosting intensity. For version 2,
        # boosting intensity (VERY HIGH, HIGH, MEDIUM, LOW, NONE) are not supported. Note that in version 2,
        # you are not allowed to boost on only one field and make this value TWO.

        @[JSON::Field(key: "boostingLevel")]
        getter boosting_level : String

        # Specifies specific values of a STRING type document attribute being boosted. When using
        # NativeIndexConfiguration version 2, you can specify up to five values in order of priority.

        @[JSON::Field(key: "attributeValueBoosting")]
        getter attribute_value_boosting : Hash(String, String)?

        def initialize(
          @boosting_level : String,
          @attribute_value_boosting : Hash(String, String)? = nil
        )
        end
      end

      # Provides information on boosting STRING_LIST type document attributes. In the current boosting
      # implementation, boosting focuses primarily on DATE attributes for recency and STRING attributes for
      # source prioritization. STRING_LIST attributes can serve as additional boosting factors when needed,
      # but are not supported when using NativeIndexConfiguration version 2. For STRING and STRING_LIST type
      # document attributes to be used for boosting on the console and the API, they must be enabled for
      # search using the DocumentAttributeConfiguration object of the UpdateIndex API. If you haven't
      # enabled searching on these attributes, you can't boost attributes of these data types on either the
      # console or the API. For more information on how boosting document attributes work in Amazon Q
      # Business, see Boosting using document attributes .

      struct StringListAttributeBoostingConfiguration
        include JSON::Serializable

        # Specifies the priority of boosted document attributes in relation to other boosted attributes. This
        # parameter determines how strongly the attribute influences document ranking in search results.
        # STRING_LIST attributes can serve as additional boosting factors when needed, but are not supported
        # when using NativeIndexConfiguration version 2.

        @[JSON::Field(key: "boostingLevel")]
        getter boosting_level : String

        def initialize(
          @boosting_level : String
        )
        end
      end

      # Information about an Amazon Q Business subscription. Subscriptions are used to provide access for an
      # IAM Identity Center user or a group to an Amazon Q Business application. Amazon Q Business offers
      # two subscription tiers: Q_LITE and Q_BUSINESS . Subscription tier determines feature access for the
      # user. For more information on subscriptions and pricing tiers, see Amazon Q Business pricing .

      struct Subscription
        include JSON::Serializable

        # The type of your current Amazon Q Business subscription.

        @[JSON::Field(key: "currentSubscription")]
        getter current_subscription : Types::SubscriptionDetails?

        # The type of the Amazon Q Business subscription for the next month.

        @[JSON::Field(key: "nextSubscription")]
        getter next_subscription : Types::SubscriptionDetails?

        # The IAM Identity Center UserId or GroupId of a user or group in the IAM Identity Center instance
        # connected to the Amazon Q Business application.

        @[JSON::Field(key: "principal")]
        getter principal : Types::SubscriptionPrincipal?

        # The Amazon Resource Name (ARN) of the Amazon Q Business subscription that was updated.

        @[JSON::Field(key: "subscriptionArn")]
        getter subscription_arn : String?

        # The identifier of the Amazon Q Business subscription to be updated.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        def initialize(
          @current_subscription : Types::SubscriptionDetails? = nil,
          @next_subscription : Types::SubscriptionDetails? = nil,
          @principal : Types::SubscriptionPrincipal? = nil,
          @subscription_arn : String? = nil,
          @subscription_id : String? = nil
        )
        end
      end

      # The details of an Amazon Q Business subscription.

      struct SubscriptionDetails
        include JSON::Serializable

        # The type of an Amazon Q Business subscription.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # A user or group in the IAM Identity Center instance connected to the Amazon Q Business application.

      struct SubscriptionPrincipal
        include JSON::Serializable

        # The identifier of a group in the IAM Identity Center instance connected to the Amazon Q Business
        # application.

        @[JSON::Field(key: "group")]
        getter group : String?

        # The identifier of a user in the IAM Identity Center instance connected to the Amazon Q Business
        # application.

        @[JSON::Field(key: "user")]
        getter user : String?

        def initialize(
          @group : String? = nil,
          @user : String? = nil
        )
        end
      end

      # A list of key/value pairs that identify an index, FAQ, or data source. Tag keys and values can
      # consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.

      struct Tag
        include JSON::Serializable

        # The key for the tag. Keys are not case sensitive and must be unique for the Amazon Q Business
        # application or data source.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value associated with the tag. The value may be an empty string but it can't be null.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q Business application or data source to tag.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # A list of tag keys to add to the Amazon Q Business application or data source. If a tag already
        # exists, the existing value is replaced with the new value.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides information about text documents in an index.

      struct TextDocumentStatistics
        include JSON::Serializable

        # The total size, in bytes, of the indexed documents.

        @[JSON::Field(key: "indexedTextBytes")]
        getter indexed_text_bytes : Int64?

        # The number of text documents indexed.

        @[JSON::Field(key: "indexedTextDocumentCount")]
        getter indexed_text_document_count : Int32?

        def initialize(
          @indexed_text_bytes : Int64? = nil,
          @indexed_text_document_count : Int32? = nil
        )
        end
      end

      # An input event for a end user message in an Amazon Q Business web experience.

      struct TextInputEvent
        include JSON::Serializable

        # A user message in a text message input event.

        @[JSON::Field(key: "userMessage")]
        getter user_message : String

        def initialize(
          @user_message : String
        )
        end
      end

      # An output event for an AI-generated response in an Amazon Q Business web experience.

      struct TextOutputEvent
        include JSON::Serializable

        # The identifier of the conversation with which the text output event is associated.

        @[JSON::Field(key: "conversationId")]
        getter conversation_id : String?

        # An AI-generated message in a TextOutputEvent .

        @[JSON::Field(key: "systemMessage")]
        getter system_message : String?

        # The identifier of an AI-generated message in a TextOutputEvent .

        @[JSON::Field(key: "systemMessageId")]
        getter system_message_id : String?

        # The type of AI-generated message in a TextOutputEvent . Amazon Q Business currently supports two
        # types of messages: RESPONSE - The Amazon Q Business system response. GROUNDED_RESPONSE - The
        # corrected, hallucination-reduced, response returned by Amazon Q Business. Available only if
        # hallucination reduction is supported and configured for the application and detected in the end user
        # chat query by Amazon Q Business.

        @[JSON::Field(key: "systemMessageType")]
        getter system_message_type : String?

        # The identifier of an end user message in a TextOutputEvent .

        @[JSON::Field(key: "userMessageId")]
        getter user_message_id : String?

        def initialize(
          @conversation_id : String? = nil,
          @system_message : String? = nil,
          @system_message_id : String? = nil,
          @system_message_type : String? = nil,
          @user_message_id : String? = nil
        )
        end
      end

      # Provides information about a text extract in a chat response that can be attributed to a source
      # document.

      struct TextSegment
        include JSON::Serializable

        # The zero-based location in the response string where the source attribution starts.

        @[JSON::Field(key: "beginOffset")]
        getter begin_offset : Int32?

        # The zero-based location in the response string where the source attribution ends.

        @[JSON::Field(key: "endOffset")]
        getter end_offset : Int32?

        # The identifier of the media object associated with the text segment in the source attribution.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String?

        # The MIME type (image/png) of the media object associated with the text segment in the source
        # attribution.

        @[JSON::Field(key: "mediaMimeType")]
        getter media_mime_type : String?

        # The relevant text excerpt from a source that was used to generate a citation text segment in an
        # Amazon Q Business chat response.

        @[JSON::Field(key: "snippetExcerpt")]
        getter snippet_excerpt : Types::SnippetExcerpt?

        # Source information for a segment of extracted text, including its media type.

        @[JSON::Field(key: "sourceDetails")]
        getter source_details : Types::SourceDetails?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @media_id : String? = nil,
          @media_mime_type : String? = nil,
          @snippet_excerpt : Types::SnippetExcerpt? = nil,
          @source_details : Types::SourceDetails? = nil
        )
        end
      end

      # The request was denied due to throttling. Reduce the number of requests and try again.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The topic specific controls configured for an Amazon Q Business application.

      struct TopicConfiguration
        include JSON::Serializable

        # A name for your topic control configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # Rules defined for a topic configuration.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::Rule)

        # A description for your topic control configuration. Use this to outline how the large language model
        # (LLM) should use this topic control configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of example phrases that you expect the end user to use in relation to the topic.

        @[JSON::Field(key: "exampleChatMessages")]
        getter example_chat_messages : Array(String)?

        def initialize(
          @name : String,
          @rules : Array(Types::Rule),
          @description : String? = nil,
          @example_chat_messages : Array(String)? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Q Business application, or data source to remove the
        # tag from.

        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # A list of tag keys to remove from the Amazon Q Business application or data source. If a tag key
        # does not exist on the resource, it is ignored.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateApplicationRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # An option to allow end users to upload files directly during chat.

        @[JSON::Field(key: "attachmentsConfiguration")]
        getter attachments_configuration : Types::AttachmentsConfiguration?

        # An option to enable updating the default subscription type assigned to an Amazon Q Business
        # application using IAM identity federation for user management.

        @[JSON::Field(key: "autoSubscriptionConfiguration")]
        getter auto_subscription_configuration : Types::AutoSubscriptionConfiguration?

        # A description for the Amazon Q Business application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A name for the Amazon Q Business application.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of the IAM Identity Center instance you are either creating for—or
        # connecting to—your Amazon Q Business application.

        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        # Configuration information about chat response personalization. For more information, see
        # Personalizing chat responses .

        @[JSON::Field(key: "personalizationConfiguration")]
        getter personalization_configuration : Types::PersonalizationConfiguration?

        # An option to allow end users to create and use Amazon Q Apps in the web experience.

        @[JSON::Field(key: "qAppsConfiguration")]
        getter q_apps_configuration : Types::QAppsConfiguration?

        # An Amazon Web Services Identity and Access Management (IAM) role that gives Amazon Q Business
        # permission to access Amazon CloudWatch logs and metrics.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @application_id : String,
          @attachments_configuration : Types::AttachmentsConfiguration? = nil,
          @auto_subscription_configuration : Types::AutoSubscriptionConfiguration? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @identity_center_instance_arn : String? = nil,
          @personalization_configuration : Types::PersonalizationConfiguration? = nil,
          @q_apps_configuration : Types::QAppsConfiguration? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateChatControlsConfigurationRequest
        include JSON::Serializable

        # The identifier of the application for which the chat controls are configured.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The phrases blocked from chat by your chat control configuration.

        @[JSON::Field(key: "blockedPhrasesConfigurationUpdate")]
        getter blocked_phrases_configuration_update : Types::BlockedPhrasesConfigurationUpdate?

        # A token that you provide to identify the request to update a Amazon Q Business application chat
        # configuration.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration details for CREATOR_MODE .

        @[JSON::Field(key: "creatorModeConfiguration")]
        getter creator_mode_configuration : Types::CreatorModeConfiguration?

        # The hallucination reduction settings for your application.

        @[JSON::Field(key: "hallucinationReductionConfiguration")]
        getter hallucination_reduction_configuration : Types::HallucinationReductionConfiguration?

        # The chat response orchestration settings for your application.

        @[JSON::Field(key: "orchestrationConfiguration")]
        getter orchestration_configuration : Types::OrchestrationConfiguration?

        # The response scope configured for your application. This determines whether your application uses
        # its retrieval augmented generation (RAG) system to generate answers only from your enterprise data,
        # or also uses the large language models (LLM) knowledge to respons to end user questions in chat.

        @[JSON::Field(key: "responseScope")]
        getter response_scope : String?

        # The configured topic specific chat controls you want to update.

        @[JSON::Field(key: "topicConfigurationsToCreateOrUpdate")]
        getter topic_configurations_to_create_or_update : Array(Types::TopicConfiguration)?

        # The configured topic specific chat controls you want to delete.

        @[JSON::Field(key: "topicConfigurationsToDelete")]
        getter topic_configurations_to_delete : Array(Types::TopicConfiguration)?

        def initialize(
          @application_id : String,
          @blocked_phrases_configuration_update : Types::BlockedPhrasesConfigurationUpdate? = nil,
          @client_token : String? = nil,
          @creator_mode_configuration : Types::CreatorModeConfiguration? = nil,
          @hallucination_reduction_configuration : Types::HallucinationReductionConfiguration? = nil,
          @orchestration_configuration : Types::OrchestrationConfiguration? = nil,
          @response_scope : String? = nil,
          @topic_configurations_to_create_or_update : Array(Types::TopicConfiguration)? = nil,
          @topic_configurations_to_delete : Array(Types::TopicConfiguration)? = nil
        )
        end
      end


      struct UpdateChatControlsConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateChatResponseConfigurationRequest
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application containing the chat response
        # configuration to update.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the chat response configuration to update within the specified application.

        @[JSON::Field(key: "chatResponseConfigurationId")]
        getter chat_response_configuration_id : String

        # The updated collection of response configuration settings that define how Amazon Q Business
        # generates and formats responses to user queries.

        @[JSON::Field(key: "responseConfigurations")]
        getter response_configurations : Hash(String, Types::ResponseConfiguration)

        # A unique, case-sensitive identifier to ensure idempotency of the request. This helps prevent the
        # same update from being processed multiple times if retries occur.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The new human-readable name to assign to the chat response configuration, making it easier to
        # identify among multiple configurations.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @application_id : String,
          @chat_response_configuration_id : String,
          @response_configurations : Hash(String, Types::ResponseConfiguration),
          @client_token : String? = nil,
          @display_name : String? = nil
        )
        end
      end


      struct UpdateChatResponseConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDataAccessorRequest
        include JSON::Serializable

        # The updated list of action configurations specifying the allowed actions and any associated filters.

        @[JSON::Field(key: "actionConfigurations")]
        getter action_configurations : Array(Types::ActionConfiguration)

        # The unique identifier of the Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the data accessor to update.

        @[JSON::Field(key: "dataAccessorId")]
        getter data_accessor_id : String

        # The updated authentication configuration details for the data accessor. This specifies how the ISV
        # will authenticate when accessing data through this data accessor.

        @[JSON::Field(key: "authenticationDetail")]
        getter authentication_detail : Types::DataAccessorAuthenticationDetail?

        # The updated friendly name for the data accessor.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @action_configurations : Array(Types::ActionConfiguration),
          @application_id : String,
          @data_accessor_id : String,
          @authentication_detail : Types::DataAccessorAuthenticationDetail? = nil,
          @display_name : String? = nil
        )
        end
      end


      struct UpdateDataAccessorResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDataSourceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application the data source is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the data source connector.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the index attached to the data source connector.

        @[JSON::Field(key: "indexId")]
        getter index_id : String


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfiguration?

        # The description of the data source connector.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A name of the data source connector.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "documentEnrichmentConfiguration")]
        getter document_enrichment_configuration : Types::DocumentEnrichmentConfiguration?

        # The configuration for extracting information from media in documents for your data source.

        @[JSON::Field(key: "mediaExtractionConfiguration")]
        getter media_extraction_configuration : Types::MediaExtractionConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required
        # resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The chosen update frequency for your data source.

        @[JSON::Field(key: "syncSchedule")]
        getter sync_schedule : String?


        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @application_id : String,
          @data_source_id : String,
          @index_id : String,
          @configuration : Types::DataSourceConfiguration? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @document_enrichment_configuration : Types::DocumentEnrichmentConfiguration? = nil,
          @media_extraction_configuration : Types::MediaExtractionConfiguration? = nil,
          @role_arn : String? = nil,
          @sync_schedule : String? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct UpdateDataSourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateIndexRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application connected to the index.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business index.

        @[JSON::Field(key: "indexId")]
        getter index_id : String

        # The storage capacity units you want to provision for your Amazon Q Business index. You can add and
        # remove capacity to fit your usage needs.

        @[JSON::Field(key: "capacityConfiguration")]
        getter capacity_configuration : Types::IndexCapacityConfiguration?

        # The description of the Amazon Q Business index.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the Amazon Q Business index.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Configuration information for document metadata or fields. Document metadata are fields or
        # attributes associated with your documents. For example, the company department name associated with
        # each document. For more information, see Understanding document attributes .

        @[JSON::Field(key: "documentAttributeConfigurations")]
        getter document_attribute_configurations : Array(Types::DocumentAttributeConfiguration)?

        def initialize(
          @application_id : String,
          @index_id : String,
          @capacity_configuration : Types::IndexCapacityConfiguration? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @document_attribute_configurations : Array(Types::DocumentAttributeConfiguration)? = nil
        )
        end
      end


      struct UpdateIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdatePluginRequest
        include JSON::Serializable

        # The identifier of the application the plugin is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the plugin.

        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        # The authentication configuration the plugin is using.

        @[JSON::Field(key: "authConfiguration")]
        getter auth_configuration : Types::PluginAuthConfiguration?

        # The configuration for a custom plugin.

        @[JSON::Field(key: "customPluginConfiguration")]
        getter custom_plugin_configuration : Types::CustomPluginConfiguration?

        # The name of the plugin.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The source URL used for plugin configuration.

        @[JSON::Field(key: "serverUrl")]
        getter server_url : String?

        # The status of the plugin.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @application_id : String,
          @plugin_id : String,
          @auth_configuration : Types::PluginAuthConfiguration? = nil,
          @custom_plugin_configuration : Types::CustomPluginConfiguration? = nil,
          @display_name : String? = nil,
          @server_url : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdatePluginResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRetrieverRequest
        include JSON::Serializable

        # The identifier of your Amazon Q Business application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of your retriever.

        @[JSON::Field(key: "retrieverId")]
        getter retriever_id : String


        @[JSON::Field(key: "configuration")]
        getter configuration : Types::RetrieverConfiguration?

        # The name of your retriever.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the retriever and required
        # resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @application_id : String,
          @retriever_id : String,
          @configuration : Types::RetrieverConfiguration? = nil,
          @display_name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateRetrieverResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateSubscriptionRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application where the subscription update should take
        # effect.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business subscription to be updated.

        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String

        # The type of the Amazon Q Business subscription to be updated.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @application_id : String,
          @subscription_id : String,
          @type : String
        )
        end
      end


      struct UpdateSubscriptionResponse
        include JSON::Serializable

        # The type of your current Amazon Q Business subscription.

        @[JSON::Field(key: "currentSubscription")]
        getter current_subscription : Types::SubscriptionDetails?

        # The type of the Amazon Q Business subscription for the next month.

        @[JSON::Field(key: "nextSubscription")]
        getter next_subscription : Types::SubscriptionDetails?

        # The Amazon Resource Name (ARN) of the Amazon Q Business subscription that was updated.

        @[JSON::Field(key: "subscriptionArn")]
        getter subscription_arn : String?

        def initialize(
          @current_subscription : Types::SubscriptionDetails? = nil,
          @next_subscription : Types::SubscriptionDetails? = nil,
          @subscription_arn : String? = nil
        )
        end
      end


      struct UpdateUserRequest
        include JSON::Serializable

        # The identifier of the application the user is attached to.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The email id attached to the user.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The user aliases attached to the user id that are to be deleted.

        @[JSON::Field(key: "userAliasesToDelete")]
        getter user_aliases_to_delete : Array(Types::UserAlias)?

        # The user aliases attached to the user id that are to be updated.

        @[JSON::Field(key: "userAliasesToUpdate")]
        getter user_aliases_to_update : Array(Types::UserAlias)?

        def initialize(
          @application_id : String,
          @user_id : String,
          @user_aliases_to_delete : Array(Types::UserAlias)? = nil,
          @user_aliases_to_update : Array(Types::UserAlias)? = nil
        )
        end
      end


      struct UpdateUserResponse
        include JSON::Serializable

        # The user aliases that have been to be added to a user id.

        @[JSON::Field(key: "userAliasesAdded")]
        getter user_aliases_added : Array(Types::UserAlias)?

        # The user aliases that have been deleted from a user id.

        @[JSON::Field(key: "userAliasesDeleted")]
        getter user_aliases_deleted : Array(Types::UserAlias)?

        # The user aliases attached to a user id that have been updated.

        @[JSON::Field(key: "userAliasesUpdated")]
        getter user_aliases_updated : Array(Types::UserAlias)?

        def initialize(
          @user_aliases_added : Array(Types::UserAlias)? = nil,
          @user_aliases_deleted : Array(Types::UserAlias)? = nil,
          @user_aliases_updated : Array(Types::UserAlias)? = nil
        )
        end
      end


      struct UpdateWebExperienceRequest
        include JSON::Serializable

        # The identifier of the Amazon Q Business application attached to the web experience.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The identifier of the Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String

        # The authentication configuration of the Amazon Q Business web experience.

        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::WebExperienceAuthConfiguration?

        # The browser extension configuration for an Amazon Q Business web experience. For Amazon Q Business
        # application using external OIDC-compliant identity providers (IdPs). The IdP administrator must add
        # the browser extension sign-in redirect URLs to the IdP application. For more information, see
        # Configure external OIDC identity provider for your browser extensions. .

        @[JSON::Field(key: "browserExtensionConfiguration")]
        getter browser_extension_configuration : Types::BrowserExtensionConfiguration?

        # Updates the custom logo, favicon, font, and color used in the Amazon Q web experience.

        @[JSON::Field(key: "customizationConfiguration")]
        getter customization_configuration : Types::CustomizationConfiguration?

        # Information about the identity provider (IdP) used to authenticate end users of an Amazon Q Business
        # web experience.

        @[JSON::Field(key: "identityProviderConfiguration")]
        getter identity_provider_configuration : Types::IdentityProviderConfiguration?

        # Updates the website domain origins that are allowed to embed the Amazon Q Business web experience.
        # The domain origin refers to the base URL for accessing a website including the protocol ( http/https
        # ), the domain name, and the port number (if specified). Any values except null submitted as part of
        # this update will replace all previous values. You must only submit a base URL and not a full path.
        # For example, https://docs.aws.amazon.com .

        @[JSON::Field(key: "origins")]
        getter origins : Array(String)?

        # The Amazon Resource Name (ARN) of the role with permission to access the Amazon Q Business web
        # experience and required resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Determines whether sample prompts are enabled in the web experience for an end user.

        @[JSON::Field(key: "samplePromptsControlMode")]
        getter sample_prompts_control_mode : String?

        # The subtitle of the Amazon Q Business web experience.

        @[JSON::Field(key: "subtitle")]
        getter subtitle : String?

        # The title of the Amazon Q Business web experience.

        @[JSON::Field(key: "title")]
        getter title : String?

        # A customized welcome message for an end user in an Amazon Q Business web experience.

        @[JSON::Field(key: "welcomeMessage")]
        getter welcome_message : String?

        def initialize(
          @application_id : String,
          @web_experience_id : String,
          @authentication_configuration : Types::WebExperienceAuthConfiguration? = nil,
          @browser_extension_configuration : Types::BrowserExtensionConfiguration? = nil,
          @customization_configuration : Types::CustomizationConfiguration? = nil,
          @identity_provider_configuration : Types::IdentityProviderConfiguration? = nil,
          @origins : Array(String)? = nil,
          @role_arn : String? = nil,
          @sample_prompts_control_mode : String? = nil,
          @subtitle : String? = nil,
          @title : String? = nil,
          @welcome_message : String? = nil
        )
        end
      end


      struct UpdateWebExperienceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Aliases attached to a user id within an Amazon Q Business application.

      struct UserAlias
        include JSON::Serializable

        # The identifier of the user id associated with the user aliases.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # The identifier of the data source that the user aliases are associated with.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The identifier of the index that the user aliases are associated with.

        @[JSON::Field(key: "indexId")]
        getter index_id : String?

        def initialize(
          @user_id : String,
          @data_source_id : String? = nil,
          @index_id : String? = nil
        )
        end
      end

      # Provides information about users and group names associated with a topic control rule.

      struct UsersAndGroups
        include JSON::Serializable

        # The user group names associated with a topic control rule.

        @[JSON::Field(key: "userGroups")]
        getter user_groups : Array(String)?

        # The user ids associated with a topic control rule.

        @[JSON::Field(key: "userIds")]
        getter user_ids : Array(String)?

        def initialize(
          @user_groups : Array(String)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end

      # The input doesn't meet the constraints set by the Amazon Q Business service. Provide the correct
      # input and try again.

      struct ValidationException
        include JSON::Serializable

        # The message describing the ValidationException .

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the ValidationException .

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The input field(s) that failed validation.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @fields : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by Amazon Q Business in a specified field.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message about the validation exception.

        @[JSON::Field(key: "message")]
        getter message : String

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Configuration settings for video content extraction and processing.

      struct VideoExtractionConfiguration
        include JSON::Serializable

        # The status of video extraction (ENABLED or DISABLED) for processing video content from files.

        @[JSON::Field(key: "videoExtractionStatus")]
        getter video_extraction_status : String

        def initialize(
          @video_extraction_status : String
        )
        end
      end

      # Details about a video source, including its identifier, format, and time information.

      struct VideoSourceDetails
        include JSON::Serializable

        # The ending timestamp in milliseconds for the relevant video segment.

        @[JSON::Field(key: "endTimeMilliseconds")]
        getter end_time_milliseconds : Int64?

        # Unique identifier for the video media file.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String?

        # The MIME type of the video file (e.g., video/mp4, video/avi).

        @[JSON::Field(key: "mediaMimeType")]
        getter media_mime_type : String?

        # The starting timestamp in milliseconds for the relevant video segment.

        @[JSON::Field(key: "startTimeMilliseconds")]
        getter start_time_milliseconds : Int64?

        # The type of video extraction performed on the content.

        @[JSON::Field(key: "videoExtractionType")]
        getter video_extraction_type : String?

        def initialize(
          @end_time_milliseconds : Int64? = nil,
          @media_id : String? = nil,
          @media_mime_type : String? = nil,
          @start_time_milliseconds : Int64? = nil,
          @video_extraction_type : String? = nil
        )
        end
      end

      # Provides information for an Amazon Q Business web experience.

      struct WebExperience
        include JSON::Serializable

        # The Unix timestamp when the Amazon Q Business application was last updated.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The endpoint URLs for your Amazon Q Business web experience. The URLs are unique and fully hosted by
        # Amazon Web Services.

        @[JSON::Field(key: "defaultEndpoint")]
        getter default_endpoint : String?

        # The status of your Amazon Q Business web experience.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Unix timestamp when your Amazon Q Business web experience was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The identifier of your Amazon Q Business web experience.

        @[JSON::Field(key: "webExperienceId")]
        getter web_experience_id : String?

        def initialize(
          @created_at : Time? = nil,
          @default_endpoint : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @web_experience_id : String? = nil
        )
        end
      end

      # Provides the authorization configuration information needed to deploy a Amazon Q Business web
      # experience to end users.

      struct WebExperienceAuthConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "samlConfiguration")]
        getter saml_configuration : Types::SamlConfiguration?

        def initialize(
          @saml_configuration : Types::SamlConfiguration? = nil
        )
        end
      end
    end
  end
end
