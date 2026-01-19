require "json"
require "time"

module AwsSdk
  module QApps
    module Types

      # The client is not authorized to perform the requested operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The definition of the Q App, specifying the cards and flow.
      struct AppDefinition
        include JSON::Serializable

        # The version of the app definition schema or specification.
        @[JSON::Field(key: "appDefinitionVersion")]
        getter app_definition_version : String

        # The cards that make up the Q App, such as text input, file upload, or query cards.
        @[JSON::Field(key: "cards")]
        getter cards : Array(Types::Card)

        # A flag indicating whether the Q App's definition can be edited by the user.
        @[JSON::Field(key: "canEdit")]
        getter can_edit : Bool?

        def initialize(
          @app_definition_version : String,
          @cards : Array(Types::Card),
          @can_edit : Bool? = nil
        )
        end
      end

      # The input for defining an Q App.
      struct AppDefinitionInput
        include JSON::Serializable

        # The cards that make up the Q App definition.
        @[JSON::Field(key: "cards")]
        getter cards : Array(Types::CardInput)

        # The initial prompt displayed when the Q App is started.
        @[JSON::Field(key: "initialPrompt")]
        getter initial_prompt : String?

        def initialize(
          @cards : Array(Types::CardInput),
          @initial_prompt : String? = nil
        )
        end
      end

      struct AssociateLibraryItemReviewInput
        include JSON::Serializable

        # The unique identifier for the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the library item to associate the review with.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        def initialize(
          @instance_id : String,
          @library_item_id : String
        )
        end
      end

      struct AssociateQAppWithUserInput
        include JSON::Serializable

        # The ID of the Amazon Q App to associate with the user.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @app_id : String,
          @instance_id : String
        )
        end
      end

      # The filter criteria used on responses based on document attributes or metadata fields.
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

        # Performs a greater than or equals operation on two document attributes or metadata fields. Supported
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

      struct BatchCreateCategoryInput
        include JSON::Serializable

        # The list of category objects to be created
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::BatchCreateCategoryInputCategory)

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @categories : Array(Types::BatchCreateCategoryInputCategory),
          @instance_id : String
        )
        end
      end

      # The category object to be created.
      struct BatchCreateCategoryInputCategory
        include JSON::Serializable

        # The name of the category.
        @[JSON::Field(key: "title")]
        getter title : String

        # The color to be associated with a category. The color must be a hexadecimal value of either 3 or 6
        # digits.
        @[JSON::Field(key: "color")]
        getter color : String?

        # The unique identifier to be associated with a category. If you don't include a value, the category
        # is automatically assigned a unique identifier.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @title : String,
          @color : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct BatchDeleteCategoryInput
        include JSON::Serializable

        # The list of IDs of the categories to be deleted.
        @[JSON::Field(key: "categories")]
        getter categories : Array(String)

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @categories : Array(String),
          @instance_id : String
        )
        end
      end

      struct BatchUpdateCategoryInput
        include JSON::Serializable

        # The list of categories to be updated with their new values.
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::CategoryInput)

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @categories : Array(Types::CategoryInput),
          @instance_id : String
        )
        end
      end

      # A card representing a component or step in an Amazon Q App's flow.
      struct Card
        include JSON::Serializable

        # A container for the properties of the file upload card.
        @[JSON::Field(key: "fileUpload")]
        getter file_upload : Types::FileUploadCard?

        # A container for the properties of the form input card.
        @[JSON::Field(key: "formInput")]
        getter form_input : Types::FormInputCard?

        # A container for the properties of the plugin card.
        @[JSON::Field(key: "qPlugin")]
        getter q_plugin : Types::QPluginCard?

        # A container for the properties of the query card.
        @[JSON::Field(key: "qQuery")]
        getter q_query : Types::QQueryCard?

        # A container for the properties of the text input card.
        @[JSON::Field(key: "textInput")]
        getter text_input : Types::TextInputCard?

        def initialize(
          @file_upload : Types::FileUploadCard? = nil,
          @form_input : Types::FormInputCard? = nil,
          @q_plugin : Types::QPluginCard? = nil,
          @q_query : Types::QQueryCard? = nil,
          @text_input : Types::TextInputCard? = nil
        )
        end
      end

      # The properties defining an input card in an Amazon Q App.
      struct CardInput
        include JSON::Serializable

        # A container for the properties of the file upload input card.
        @[JSON::Field(key: "fileUpload")]
        getter file_upload : Types::FileUploadCardInput?

        # A container for the properties of the form input card.
        @[JSON::Field(key: "formInput")]
        getter form_input : Types::FormInputCardInput?

        # A container for the properties of the plugin input card.
        @[JSON::Field(key: "qPlugin")]
        getter q_plugin : Types::QPluginCardInput?

        # A container for the properties of the query input card.
        @[JSON::Field(key: "qQuery")]
        getter q_query : Types::QQueryCardInput?

        # A container for the properties of the text input card.
        @[JSON::Field(key: "textInput")]
        getter text_input : Types::TextInputCardInput?

        def initialize(
          @file_upload : Types::FileUploadCardInput? = nil,
          @form_input : Types::FormInputCardInput? = nil,
          @q_plugin : Types::QPluginCardInput? = nil,
          @q_query : Types::QQueryCardInput? = nil,
          @text_input : Types::TextInputCardInput? = nil
        )
        end
      end

      # The current status and value of a card in an active Amazon Q App session.
      struct CardStatus
        include JSON::Serializable

        # The current state of the card.
        @[JSON::Field(key: "currentState")]
        getter current_state : String

        # The current value or result associated with the card.
        @[JSON::Field(key: "currentValue")]
        getter current_value : String

        # A list of previous submissions, if the card is a form card.
        @[JSON::Field(key: "submissions")]
        getter submissions : Array(Types::Submission)?

        def initialize(
          @current_state : String,
          @current_value : String,
          @submissions : Array(Types::Submission)? = nil
        )
        end
      end

      # The value or result associated with a card in a Amazon Q App session.
      struct CardValue
        include JSON::Serializable

        # The unique identifier of the card.
        @[JSON::Field(key: "cardId")]
        getter card_id : String

        # The value or result associated with the card.
        @[JSON::Field(key: "value")]
        getter value : String

        # The structure that describes how the current form card value is mutated. Only applies for form cards
        # when multiple responses are allowed.
        @[JSON::Field(key: "submissionMutation")]
        getter submission_mutation : Types::SubmissionMutation?

        def initialize(
          @card_id : String,
          @value : String,
          @submission_mutation : Types::SubmissionMutation? = nil
        )
        end
      end

      # A category used to classify and filter library items for Amazon Q Apps.
      struct Category
        include JSON::Serializable

        # The unique identifier of the category.
        @[JSON::Field(key: "id")]
        getter id : String

        # The title or name of the category.
        @[JSON::Field(key: "title")]
        getter title : String

        # The number of published Amazon Q Apps associated with a category
        @[JSON::Field(key: "appCount")]
        getter app_count : Int32?

        # The color of the category
        @[JSON::Field(key: "color")]
        getter color : String?

        def initialize(
          @id : String,
          @title : String,
          @app_count : Int32? = nil,
          @color : String? = nil
        )
        end
      end

      # A label that web experience users associate with a library item. Web experience users use Categories
      # to tag and filter library items.
      struct CategoryInput
        include JSON::Serializable

        # The unique identifier of the category.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the category.
        @[JSON::Field(key: "title")]
        getter title : String

        # The color of the category, represented as a hexadecimal value of either 3 or 6 digits.
        @[JSON::Field(key: "color")]
        getter color : String?

        def initialize(
          @id : String,
          @title : String,
          @color : String? = nil
        )
        end
      end

      # The requested operation could not be completed due to a conflict with the current state of the
      # resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier of the resource
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The requested operation could not be completed because the content exceeds the maximum allowed size.
      struct ContentTooLargeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier of the resource
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # A message in a conversation, used as input for generating an Amazon Q App definition.
      struct ConversationMessage
        include JSON::Serializable

        # The text content of the conversation message.
        @[JSON::Field(key: "body")]
        getter body : String

        # The type of the conversation message.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @body : String,
          @type : String
        )
        end
      end

      struct CreateLibraryItemInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q App to publish to the library.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Amazon Q App to publish to the library.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The categories to associate with the library item for easier discovery.
        @[JSON::Field(key: "categories")]
        getter categories : Array(String)

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @app_id : String,
          @app_version : Int32,
          @categories : Array(String),
          @instance_id : String
        )
        end
      end

      struct CreateLibraryItemOutput
        include JSON::Serializable

        # The date and time the library item was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the library item.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the new library item.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The number of ratings the library item has received from users.
        @[JSON::Field(key: "ratingCount")]
        getter rating_count : Int32

        # The status of the new library item, such as "Published".
        @[JSON::Field(key: "status")]
        getter status : String

        # Indicates whether the library item has been verified.
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        # The date and time the library item was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who last updated the library item.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @library_item_id : String,
          @rating_count : Int32,
          @status : String,
          @is_verified : Bool? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct CreatePresignedUrlInput
        include JSON::Serializable

        # The unique identifier of the Q App the file is associated with.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the card the file is associated with.
        @[JSON::Field(key: "cardId")]
        getter card_id : String

        # The Base64-encoded SHA-256 digest of the contents of the file to be uploaded.
        @[JSON::Field(key: "fileContentsSha256")]
        getter file_contents_sha256 : String

        # The name of the file to be uploaded.
        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # Whether the file is associated with a Q App definition or a specific Q App session.
        @[JSON::Field(key: "scope")]
        getter scope : String

        # The unique identifier of the Q App session the file is associated with, if applicable.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @app_id : String,
          @card_id : String,
          @file_contents_sha256 : String,
          @file_name : String,
          @instance_id : String,
          @scope : String,
          @session_id : String? = nil
        )
        end
      end

      struct CreatePresignedUrlOutput
        include JSON::Serializable

        # The unique identifier assigned to the file to be uploaded.
        @[JSON::Field(key: "fileId")]
        getter file_id : String

        # The URL for a presigned S3 POST operation used to upload a file.
        @[JSON::Field(key: "presignedUrl")]
        getter presigned_url : String

        # The date and time that the presigned URL will expire in ISO 8601 format.
        @[JSON::Field(key: "presignedUrlExpiration")]
        getter presigned_url_expiration : Time

        # The form fields to include in the presigned S3 POST operation used to upload a file.
        @[JSON::Field(key: "presignedUrlFields")]
        getter presigned_url_fields : Hash(String, String)

        def initialize(
          @file_id : String,
          @presigned_url : String,
          @presigned_url_expiration : Time,
          @presigned_url_fields : Hash(String, String)
        )
        end
      end

      struct CreateQAppInput
        include JSON::Serializable

        # The definition of the new Q App, specifying the cards and flow.
        @[JSON::Field(key: "appDefinition")]
        getter app_definition : Types::AppDefinitionInput

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The title of the new Q App.
        @[JSON::Field(key: "title")]
        getter title : String

        # The description of the new Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional tags to associate with the new Q App.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_definition : Types::AppDefinitionInput,
          @instance_id : String,
          @title : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateQAppOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new Q App.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The unique identifier of the new Q App.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the new Q App.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The date and time the Q App was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the Q App.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The status of the new Q App, such as "Created".
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the new Q App.
        @[JSON::Field(key: "title")]
        getter title : String

        # The date and time the Q App was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The user who last updated the Q App.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String

        # The description of the new Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The initial prompt displayed when the Q App is started.
        @[JSON::Field(key: "initialPrompt")]
        getter initial_prompt : String?

        # The capabilities required to run the Q App, such as file upload or third-party integrations.
        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Array(String)?

        def initialize(
          @app_arn : String,
          @app_id : String,
          @app_version : Int32,
          @created_at : Time,
          @created_by : String,
          @status : String,
          @title : String,
          @updated_at : Time,
          @updated_by : String,
          @description : String? = nil,
          @initial_prompt : String? = nil,
          @required_capabilities : Array(String)? = nil
        )
        end
      end

      struct DeleteLibraryItemInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the library item to delete.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        def initialize(
          @instance_id : String,
          @library_item_id : String
        )
        end
      end

      struct DeleteQAppInput
        include JSON::Serializable

        # The unique identifier of the Q App to delete.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @app_id : String,
          @instance_id : String
        )
        end
      end

      struct DescribeQAppPermissionsInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q App for which to retrieve permissions.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @app_id : String,
          @instance_id : String
        )
        end
      end

      struct DescribeQAppPermissionsOutput
        include JSON::Serializable

        # The unique identifier of the Amazon Q App for which permissions are returned.
        @[JSON::Field(key: "appId")]
        getter app_id : String?

        # The list of permissions granted for the Amazon Q App.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::PermissionOutput)?

        # The Amazon Resource Name (ARN) of the Amazon Q App for which permissions are returned.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @app_id : String? = nil,
          @permissions : Array(Types::PermissionOutput)? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct DisassociateLibraryItemReviewInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the library item to remove the review from.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        def initialize(
          @instance_id : String,
          @library_item_id : String
        )
        end
      end

      struct DisassociateQAppFromUserInput
        include JSON::Serializable

        # The unique identifier of the Q App to disassociate from the user.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @app_id : String,
          @instance_id : String
        )
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
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

      struct ExportQAppSessionDataInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App data collection session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @instance_id : String,
          @session_id : String
        )
        end
      end

      struct ExportQAppSessionDataOutput
        include JSON::Serializable

        # The link where the exported Q App session data can be downloaded from.
        @[JSON::Field(key: "csvFileLink")]
        getter csv_file_link : String

        # The date and time when the link for the exported Q App session data expires.
        @[JSON::Field(key: "expiresAt")]
        getter expires_at : Time

        # The Amazon Resource Name (ARN) of the Q App data collection session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        def initialize(
          @csv_file_link : String,
          @expires_at : Time,
          @session_arn : String
        )
        end
      end

      # A card in an Amazon Q App that allows the user to upload a file.
      struct FileUploadCard
        include JSON::Serializable

        # Any dependencies or requirements for the file upload card.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The unique identifier of the file upload card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The title of the file upload card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # A flag indicating if the user can override the default file for the upload card.
        @[JSON::Field(key: "allowOverride")]
        getter allow_override : Bool?

        # The unique identifier of the file associated with the card.
        @[JSON::Field(key: "fileId")]
        getter file_id : String?

        # The name of the file being uploaded.
        @[JSON::Field(key: "filename")]
        getter filename : String?

        def initialize(
          @dependencies : Array(String),
          @id : String,
          @title : String,
          @type : String,
          @allow_override : Bool? = nil,
          @file_id : String? = nil,
          @filename : String? = nil
        )
        end
      end

      # Represents a file upload card. It can optionally receive a filename and fileId to set a default
      # file. If not received, the user must provide the file when the Q App runs.
      struct FileUploadCardInput
        include JSON::Serializable

        # The unique identifier of the file upload card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The title or label of the file upload card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # A flag indicating if the user can override the default file for the upload card.
        @[JSON::Field(key: "allowOverride")]
        getter allow_override : Bool?

        # The identifier of a pre-uploaded file associated with the card.
        @[JSON::Field(key: "fileId")]
        getter file_id : String?

        # The default filename to use for the file upload card.
        @[JSON::Field(key: "filename")]
        getter filename : String?

        def initialize(
          @id : String,
          @title : String,
          @type : String,
          @allow_override : Bool? = nil,
          @file_id : String? = nil,
          @filename : String? = nil
        )
        end
      end

      # A card in an Amazon Q App that allows the user to submit a response.
      struct FormInputCard
        include JSON::Serializable

        # Any dependencies or requirements for the form input card.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The unique identifier of the form input card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The metadata that defines the form input card data.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::FormInputCardMetadata

        # The title of the form input card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The compute mode of the form input card. This property determines whether individual participants of
        # a data collection session can submit multiple response or one response. A compute mode of append
        # shall allow participants to submit the same form multiple times with different values. A compute
        # mode of replace code&gt; shall overwrite the current value for each participant.
        @[JSON::Field(key: "computeMode")]
        getter compute_mode : String?

        def initialize(
          @dependencies : Array(String),
          @id : String,
          @metadata : Types::FormInputCardMetadata,
          @title : String,
          @type : String,
          @compute_mode : String? = nil
        )
        end
      end

      # Represents a form input card for an Amazon Q App.
      struct FormInputCardInput
        include JSON::Serializable

        # The unique identifier of the form input card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The metadata that defines the form input card data.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::FormInputCardMetadata

        # The title or label of the form input card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The compute mode of the form input card. This property determines whether individual participants of
        # a data collection session can submit multiple response or one response. A compute mode of append
        # shall allow participants to submit the same form multiple times with different values. A compute
        # mode of replace code&gt; shall overwrite the current value for each participant.
        @[JSON::Field(key: "computeMode")]
        getter compute_mode : String?

        def initialize(
          @id : String,
          @metadata : Types::FormInputCardMetadata,
          @title : String,
          @type : String,
          @compute_mode : String? = nil
        )
        end
      end

      # The metadata of the form input card.
      struct FormInputCardMetadata
        include JSON::Serializable

        # The JSON schema that defines the shape of the response data.
        @[JSON::Field(key: "schema")]
        getter schema : Types::FormInputCardMetadataSchema

        def initialize(
          @schema : Types::FormInputCardMetadataSchema
        )
        end
      end

      struct FormInputCardMetadataSchema
        include JSON::Serializable

        def initialize
        end
      end

      struct GetLibraryItemInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the library item to retrieve.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The unique identifier of the Amazon Q App associated with the library item.
        @[JSON::Field(key: "appId")]
        getter app_id : String?

        def initialize(
          @instance_id : String,
          @library_item_id : String,
          @app_id : String? = nil
        )
        end
      end

      struct GetLibraryItemOutput
        include JSON::Serializable

        # The unique identifier of the Q App associated with the library item.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Q App associated with the library item.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The categories associated with the library item for discovery.
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::Category)

        # The date and time the library item was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the library item.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the library item.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The number of ratings the library item has received from users.
        @[JSON::Field(key: "ratingCount")]
        getter rating_count : Int32

        # The status of the library item, such as "Published".
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the current user has rated the library item.
        @[JSON::Field(key: "isRatedByUser")]
        getter is_rated_by_user : Bool?

        # Indicates whether the library item has been verified.
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        # The date and time the library item was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who last updated the library item.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The number of users who have associated the Q App with their account.
        @[JSON::Field(key: "userCount")]
        getter user_count : Int32?

        def initialize(
          @app_id : String,
          @app_version : Int32,
          @categories : Array(Types::Category),
          @created_at : Time,
          @created_by : String,
          @library_item_id : String,
          @rating_count : Int32,
          @status : String,
          @is_rated_by_user : Bool? = nil,
          @is_verified : Bool? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @user_count : Int32? = nil
        )
        end
      end

      struct GetQAppInput
        include JSON::Serializable

        # The unique identifier of the Q App to retrieve.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The version of the Q App.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32?

        def initialize(
          @app_id : String,
          @instance_id : String,
          @app_version : Int32? = nil
        )
        end
      end

      struct GetQAppOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Q App.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The full definition of the Q App, specifying the cards and flow.
        @[JSON::Field(key: "appDefinition")]
        getter app_definition : Types::AppDefinition

        # The unique identifier of the Q App.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Q App.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The date and time the Q App was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the Q App.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The status of the Q App.
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the Q App.
        @[JSON::Field(key: "title")]
        getter title : String

        # The date and time the Q App was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The user who last updated the Q App.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String

        # The description of the Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The initial prompt displayed when the Q App is started.
        @[JSON::Field(key: "initialPrompt")]
        getter initial_prompt : String?

        # The capabilities required to run the Q App, such as file upload or third-party integrations.
        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Array(String)?

        def initialize(
          @app_arn : String,
          @app_definition : Types::AppDefinition,
          @app_id : String,
          @app_version : Int32,
          @created_at : Time,
          @created_by : String,
          @status : String,
          @title : String,
          @updated_at : Time,
          @updated_by : String,
          @description : String? = nil,
          @initial_prompt : String? = nil,
          @required_capabilities : Array(String)? = nil
        )
        end
      end

      struct GetQAppSessionInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App session to retrieve.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @instance_id : String,
          @session_id : String
        )
        end
      end

      struct GetQAppSessionMetadataInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @instance_id : String,
          @session_id : String
        )
        end
      end

      struct GetQAppSessionMetadataOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Q App session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The sharing configuration of the Q App data collection session.
        @[JSON::Field(key: "sharingConfiguration")]
        getter sharing_configuration : Types::SessionSharingConfiguration

        # The name of the Q App session.
        @[JSON::Field(key: "sessionName")]
        getter session_name : String?

        # Indicates whether the current user is the owner of the Q App session.
        @[JSON::Field(key: "sessionOwner")]
        getter session_owner : Bool?

        def initialize(
          @session_arn : String,
          @session_id : String,
          @sharing_configuration : Types::SessionSharingConfiguration,
          @session_name : String? = nil,
          @session_owner : Bool? = nil
        )
        end
      end

      struct GetQAppSessionOutput
        include JSON::Serializable

        # The current status for each card in the Q App session.
        @[JSON::Field(key: "cardStatus")]
        getter card_status : Hash(String, Types::CardStatus)

        # The Amazon Resource Name (ARN) of the Q App session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The current status of the Q App session.
        @[JSON::Field(key: "status")]
        getter status : String

        # The version of the Q App used for the session.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32?

        # The latest published version of the Q App used for the session.
        @[JSON::Field(key: "latestPublishedAppVersion")]
        getter latest_published_app_version : Int32?

        # The name of the Q App session.
        @[JSON::Field(key: "sessionName")]
        getter session_name : String?

        # Indicates whether the current user is the owner of the Q App data collection session.
        @[JSON::Field(key: "userIsHost")]
        getter user_is_host : Bool?

        def initialize(
          @card_status : Hash(String, Types::CardStatus),
          @session_arn : String,
          @session_id : String,
          @status : String,
          @app_version : Int32? = nil,
          @latest_published_app_version : Int32? = nil,
          @session_name : String? = nil,
          @user_is_host : Bool? = nil
        )
        end
      end

      struct ImportDocumentInput
        include JSON::Serializable

        # The unique identifier of the Q App the file is associated with.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the card the file is associated with.
        @[JSON::Field(key: "cardId")]
        getter card_id : String

        # The base64-encoded contents of the file to upload.
        @[JSON::Field(key: "fileContentsBase64")]
        getter file_contents_base64 : String

        # The name of the file being uploaded.
        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # Whether the file is associated with a Q App definition or a specific Q App session.
        @[JSON::Field(key: "scope")]
        getter scope : String

        # The unique identifier of the Q App session the file is associated with, if applicable.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        def initialize(
          @app_id : String,
          @card_id : String,
          @file_contents_base64 : String,
          @file_name : String,
          @instance_id : String,
          @scope : String,
          @session_id : String? = nil
        )
        end
      end

      struct ImportDocumentOutput
        include JSON::Serializable

        # The unique identifier assigned to the uploaded file.
        @[JSON::Field(key: "fileId")]
        getter file_id : String?

        def initialize(
          @file_id : String? = nil
        )
        end
      end

      # An internal service error occurred while processing the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the operation
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # A library item is a snapshot of an Amazon Q App that can be published so the users in their Amazon Q
      # Apps library can discover it, clone it, and run it.
      struct LibraryItemMember
        include JSON::Serializable

        # The unique identifier of the Q App associated with the library item.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Q App associated with the library item.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The categories associated with the library item.
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::Category)

        # The date and time the library item was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the library item.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the library item.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The number of ratings the library item has received.
        @[JSON::Field(key: "ratingCount")]
        getter rating_count : Int32

        # The status of the library item.
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the current user has rated the library item.
        @[JSON::Field(key: "isRatedByUser")]
        getter is_rated_by_user : Bool?

        # Indicates whether the library item has been verified.
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        # The date and time the library item was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who last updated the library item.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The number of users who have the associated Q App.
        @[JSON::Field(key: "userCount")]
        getter user_count : Int32?

        def initialize(
          @app_id : String,
          @app_version : Int32,
          @categories : Array(Types::Category),
          @created_at : Time,
          @created_by : String,
          @library_item_id : String,
          @rating_count : Int32,
          @status : String,
          @is_rated_by_user : Bool? = nil,
          @is_verified : Bool? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @user_count : Int32? = nil
        )
        end
      end

      struct ListCategoriesInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        def initialize(
          @instance_id : String
        )
        end
      end

      struct ListCategoriesOutput
        include JSON::Serializable

        # The categories of a Amazon Q Business application environment instance.
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::Category)?

        def initialize(
          @categories : Array(Types::Category)? = nil
        )
        end
      end

      struct ListLibraryItemsInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # Optional category to filter the library items by.
        @[JSON::Field(key: "categoryId")]
        getter category_id : String?

        # The maximum number of library items to return in the response.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The token to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @category_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLibraryItemsOutput
        include JSON::Serializable

        # The list of library items meeting the request criteria.
        @[JSON::Field(key: "libraryItems")]
        getter library_items : Array(Types::LibraryItemMember)?

        # The token to use to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @library_items : Array(Types::LibraryItemMember)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListQAppSessionDataInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App data collection session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @instance_id : String,
          @session_id : String
        )
        end
      end

      struct ListQAppSessionDataOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Q App data collection session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the Q App data collection session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The pagination token that indicates the next set of results to retrieve.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The collected responses of a Q App session.
        @[JSON::Field(key: "sessionData")]
        getter session_data : Array(Types::QAppSessionData)?

        def initialize(
          @session_arn : String,
          @session_id : String,
          @next_token : String? = nil,
          @session_data : Array(Types::QAppSessionData)? = nil
        )
        end
      end

      struct ListQAppsInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The maximum number of Q Apps to return in the response.
        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The token to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListQAppsOutput
        include JSON::Serializable

        # The list of Amazon Q Apps meeting the request criteria.
        @[JSON::Field(key: "apps")]
        getter apps : Array(Types::UserAppItem)

        # The token to use to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @apps : Array(Types::UserAppItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose tags should be listed.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags that are assigned to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The permission to grant or revoke for a Amazon Q App.
      struct PermissionInput
        include JSON::Serializable

        # The action associated with the permission.
        @[JSON::Field(key: "action")]
        getter action : String

        # The principal user to which the permission applies.
        @[JSON::Field(key: "principal")]
        getter principal : String

        def initialize(
          @action : String,
          @principal : String
        )
        end
      end

      # The permission granted to the Amazon Q App.
      struct PermissionOutput
        include JSON::Serializable

        # The action associated with the permission.
        @[JSON::Field(key: "action")]
        getter action : String

        # The principal user to which the permission applies.
        @[JSON::Field(key: "principal")]
        getter principal : Types::PrincipalOutput

        def initialize(
          @action : String,
          @principal : Types::PrincipalOutput
        )
        end
      end

      # The definition of an Amazon Q App generated based on input such as a conversation or problem
      # statement.
      struct PredictAppDefinition
        include JSON::Serializable

        # The definition specifying the cards and flow of the generated Q App.
        @[JSON::Field(key: "appDefinition")]
        getter app_definition : Types::AppDefinitionInput

        # The title of the generated Q App definition.
        @[JSON::Field(key: "title")]
        getter title : String

        # The description of the generated Q App definition.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @app_definition : Types::AppDefinitionInput,
          @title : String,
          @description : String? = nil
        )
        end
      end

      struct PredictQAppInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The input to generate the Q App definition from, either a conversation or problem statement.
        @[JSON::Field(key: "options")]
        getter options : Types::PredictQAppInputOptions?

        def initialize(
          @instance_id : String,
          @options : Types::PredictQAppInputOptions? = nil
        )
        end
      end

      # The input options for generating an Q App definition.
      struct PredictQAppInputOptions
        include JSON::Serializable

        # A conversation to use as input for generating the Q App definition.
        @[JSON::Field(key: "conversation")]
        getter conversation : Array(Types::ConversationMessage)?

        # A problem statement to use as input for generating the Q App definition.
        @[JSON::Field(key: "problemStatement")]
        getter problem_statement : String?

        def initialize(
          @conversation : Array(Types::ConversationMessage)? = nil,
          @problem_statement : String? = nil
        )
        end
      end

      struct PredictQAppOutput
        include JSON::Serializable

        # The generated Q App definition.
        @[JSON::Field(key: "app")]
        getter app : Types::PredictAppDefinition

        # The problem statement extracted from the input conversation, if provided.
        @[JSON::Field(key: "problemStatement")]
        getter problem_statement : String

        def initialize(
          @app : Types::PredictAppDefinition,
          @problem_statement : String
        )
        end
      end

      # The principal for which the permission applies.
      struct PrincipalOutput
        include JSON::Serializable

        # The email address associated with the user.
        @[JSON::Field(key: "email")]
        getter email : String?

        # The unique identifier of the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # The type of the user.
        @[JSON::Field(key: "userType")]
        getter user_type : String?

        def initialize(
          @email : String? = nil,
          @user_id : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      # The response collected for a Amazon Q App session. This container represents a single response to a
      # Q App session.
      struct QAppSessionData
        include JSON::Serializable

        # The card Id associated with the response submitted for a Q App session.
        @[JSON::Field(key: "cardId")]
        getter card_id : String

        # The user who submitted the response for a Q App session.
        @[JSON::Field(key: "user")]
        getter user : Types::User

        # The unique identifier of the submission.
        @[JSON::Field(key: "submissionId")]
        getter submission_id : String?

        # The date and time when the session data is submitted.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        # The response submitted for a Q App session.
        @[JSON::Field(key: "value")]
        getter value : Types::Document?

        def initialize(
          @card_id : String,
          @user : Types::User,
          @submission_id : String? = nil,
          @timestamp : Time? = nil,
          @value : Types::Document? = nil
        )
        end
      end

      # A card in an Q App that integrates with a third-party plugin or service.
      struct QPluginCard
        include JSON::Serializable

        # Any dependencies or requirements for the plugin card.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The unique identifier of the plugin card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The unique identifier of the plugin used by the card.
        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        # The type or category of the plugin used by the card.
        @[JSON::Field(key: "pluginType")]
        getter plugin_type : String

        # The prompt or instructions displayed for the plugin card.
        @[JSON::Field(key: "prompt")]
        getter prompt : String

        # The title or label of the plugin card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The action identifier of the action to be performed by the plugin card.
        @[JSON::Field(key: "actionIdentifier")]
        getter action_identifier : String?

        def initialize(
          @dependencies : Array(String),
          @id : String,
          @plugin_id : String,
          @plugin_type : String,
          @prompt : String,
          @title : String,
          @type : String,
          @action_identifier : String? = nil
        )
        end
      end

      # The input shape for defining a plugin card in an Amazon Q App.
      struct QPluginCardInput
        include JSON::Serializable

        # The unique identifier of the plugin card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The unique identifier of the plugin used by the card.
        @[JSON::Field(key: "pluginId")]
        getter plugin_id : String

        # The prompt or instructions displayed for the plugin card.
        @[JSON::Field(key: "prompt")]
        getter prompt : String

        # The title or label of the plugin card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The action identifier of the action to be performed by the plugin card.
        @[JSON::Field(key: "actionIdentifier")]
        getter action_identifier : String?

        def initialize(
          @id : String,
          @plugin_id : String,
          @prompt : String,
          @title : String,
          @type : String,
          @action_identifier : String? = nil
        )
        end
      end

      # A card in a Amazon Q App that generates a response based on the Amazon Q Business service.
      struct QQueryCard
        include JSON::Serializable

        # Any dependencies or requirements for the query card.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The unique identifier of the query card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The source or type of output generated by the query card.
        @[JSON::Field(key: "outputSource")]
        getter output_source : String

        # The prompt or instructions displayed for the query card.
        @[JSON::Field(key: "prompt")]
        getter prompt : String

        # The title or label of the query card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon Q Business filters applied in this query card when resolving data sources
        @[JSON::Field(key: "attributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # Any dependencies for the query card, where the dependencies are references to the collected
        # responses.
        @[JSON::Field(key: "memoryReferences")]
        getter memory_references : Array(String)?

        def initialize(
          @dependencies : Array(String),
          @id : String,
          @output_source : String,
          @prompt : String,
          @title : String,
          @type : String,
          @attribute_filter : Types::AttributeFilter? = nil,
          @memory_references : Array(String)? = nil
        )
        end
      end

      # The input shape for defining a query card in an Amazon Q App.
      struct QQueryCardInput
        include JSON::Serializable

        # The unique identifier of the query card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The prompt or instructions displayed for the query card.
        @[JSON::Field(key: "prompt")]
        getter prompt : String

        # The title or label of the query card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # Turns on filtering of responses based on document attributes or metadata fields.
        @[JSON::Field(key: "attributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # The source or type of output to generate for the query card.
        @[JSON::Field(key: "outputSource")]
        getter output_source : String?

        def initialize(
          @id : String,
          @prompt : String,
          @title : String,
          @type : String,
          @attribute_filter : Types::AttributeFilter? = nil,
          @output_source : String? = nil
        )
        end
      end

      # The requested resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier of the resource
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The requested operation could not be completed because it would exceed the service's quota or limit.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code of the quota that was exceeded
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The unique identifier of the resource
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The code for the service where the quota was exceeded
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # The sharing configuration of an Amazon Q App data collection session.
      struct SessionSharingConfiguration
        include JSON::Serializable

        # Indicates whether an Q App session is shareable with other users.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # Indicates whether an Q App session can accept responses from users.
        @[JSON::Field(key: "acceptResponses")]
        getter accept_responses : Bool?

        # Indicates whether collected responses for an Q App session are revealed for all users.
        @[JSON::Field(key: "revealCards")]
        getter reveal_cards : Bool?

        def initialize(
          @enabled : Bool,
          @accept_responses : Bool? = nil,
          @reveal_cards : Bool? = nil
        )
        end
      end

      struct StartQAppSessionInput
        include JSON::Serializable

        # The unique identifier of the Q App to start a session for.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Q App to use for the session.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # Optional initial input values to provide for the Q App session.
        @[JSON::Field(key: "initialValues")]
        getter initial_values : Array(Types::CardValue)?

        # The unique identifier of the a Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # Optional tags to associate with the new Q App session.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_id : String,
          @app_version : Int32,
          @instance_id : String,
          @initial_values : Array(Types::CardValue)? = nil,
          @session_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartQAppSessionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new Q App session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the new or retrieved Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @session_arn : String,
          @session_id : String
        )
        end
      end

      struct StopQAppSessionInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App session to stop.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @instance_id : String,
          @session_id : String
        )
        end
      end

      # A record created when a user submits a form card.
      struct Submission
        include JSON::Serializable

        # The unique identifier of the submission.
        @[JSON::Field(key: "submissionId")]
        getter submission_id : String?

        # The date and time when the card is submitted.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        # The data submitted by the user.
        @[JSON::Field(key: "value")]
        getter value : Types::Document?

        def initialize(
          @submission_id : String? = nil,
          @timestamp : Time? = nil,
          @value : Types::Document? = nil
        )
        end
      end

      # Represents an action performed on a submission.
      struct SubmissionMutation
        include JSON::Serializable

        # The operation that is performed on a submission.
        @[JSON::Field(key: "mutationType")]
        getter mutation_type : String

        # The unique identifier of the submission.
        @[JSON::Field(key: "submissionId")]
        getter submission_id : String

        def initialize(
          @mutation_type : String,
          @submission_id : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The tags to associate with the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A card in an Amazon Q App that allows the user to input text.
      struct TextInputCard
        include JSON::Serializable

        # Any dependencies or requirements for the text input card.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The unique identifier of the text input card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The title or label of the text input card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The default value to pre-populate in the text input field.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The placeholder text to display in the text input field.
        @[JSON::Field(key: "placeholder")]
        getter placeholder : String?

        def initialize(
          @dependencies : Array(String),
          @id : String,
          @title : String,
          @type : String,
          @default_value : String? = nil,
          @placeholder : String? = nil
        )
        end
      end

      # The input shape for defining a text input card in an Amazon Q App.
      struct TextInputCardInput
        include JSON::Serializable

        # The unique identifier of the text input card.
        @[JSON::Field(key: "id")]
        getter id : String

        # The title or label of the text input card.
        @[JSON::Field(key: "title")]
        getter title : String

        # The type of the card.
        @[JSON::Field(key: "type")]
        getter type : String

        # The default value to pre-populate in the text input field.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The placeholder text to display in the text input field.
        @[JSON::Field(key: "placeholder")]
        getter placeholder : String?

        def initialize(
          @id : String,
          @title : String,
          @type : String,
          @default_value : String? = nil,
          @placeholder : String? = nil
        )
        end
      end

      # The requested operation could not be completed because too many requests were sent at once. Wait a
      # bit and try again later.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code of the quota that was exceeded
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The code for the service where the quota was exceeded
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The number of seconds to wait before retrying the operation
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The client is not authenticated or authorized to perform the requested operation.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to disassociate the tag from.
        @[JSON::Field(key: "resourceARN")]
        getter resource_arn : String

        # The keys of the tags to disassociate from the resource.
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

      struct UpdateLibraryItemInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the library item to update.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The new categories to associate with the library item.
        @[JSON::Field(key: "categories")]
        getter categories : Array(String)?

        # The new status to set for the library item, such as "Published" or "Hidden".
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @instance_id : String,
          @library_item_id : String,
          @categories : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateLibraryItemMetadataInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the updated library item.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The verification status of the library item
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        def initialize(
          @instance_id : String,
          @library_item_id : String,
          @is_verified : Bool? = nil
        )
        end
      end

      struct UpdateLibraryItemOutput
        include JSON::Serializable

        # The unique identifier of the Q App associated with the library item.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The version of the Q App associated with the library item.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The categories associated with the updated library item.
        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::Category)

        # The date and time the library item was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who originally created the library item.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the updated library item.
        @[JSON::Field(key: "libraryItemId")]
        getter library_item_id : String

        # The number of ratings the library item has received.
        @[JSON::Field(key: "ratingCount")]
        getter rating_count : Int32

        # The new status of the updated library item.
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the current user has rated the library item.
        @[JSON::Field(key: "isRatedByUser")]
        getter is_rated_by_user : Bool?

        # Indicates whether the library item has been verified.
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        # The date and time the library item was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who last updated the library item.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The number of users who have the associated Q App.
        @[JSON::Field(key: "userCount")]
        getter user_count : Int32?

        def initialize(
          @app_id : String,
          @app_version : Int32,
          @categories : Array(Types::Category),
          @created_at : Time,
          @created_by : String,
          @library_item_id : String,
          @rating_count : Int32,
          @status : String,
          @is_rated_by_user : Bool? = nil,
          @is_verified : Bool? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @user_count : Int32? = nil
        )
        end
      end

      struct UpdateQAppInput
        include JSON::Serializable

        # The unique identifier of the Q App to update.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The new definition specifying the cards and flow for the Q App.
        @[JSON::Field(key: "appDefinition")]
        getter app_definition : Types::AppDefinitionInput?

        # The new description for the Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The new title for the Q App.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @app_id : String,
          @instance_id : String,
          @app_definition : Types::AppDefinitionInput? = nil,
          @description : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct UpdateQAppOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated Q App.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The unique identifier of the updated Q App.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The new version of the updated Q App.
        @[JSON::Field(key: "appVersion")]
        getter app_version : Int32

        # The date and time the Q App was originally created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who originally created the Q App.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The status of the updated Q App.
        @[JSON::Field(key: "status")]
        getter status : String

        # The new title of the updated Q App.
        @[JSON::Field(key: "title")]
        getter title : String

        # The date and time the Q App was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The user who last updated the Q App.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String

        # The new description of the updated Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The initial prompt for the updated Q App.
        @[JSON::Field(key: "initialPrompt")]
        getter initial_prompt : String?

        # The capabilities required for the updated Q App.
        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Array(String)?

        def initialize(
          @app_arn : String,
          @app_id : String,
          @app_version : Int32,
          @created_at : Time,
          @created_by : String,
          @status : String,
          @title : String,
          @updated_at : Time,
          @updated_by : String,
          @description : String? = nil,
          @initial_prompt : String? = nil,
          @required_capabilities : Array(String)? = nil
        )
        end
      end

      struct UpdateQAppPermissionsInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q App for which permissions are being updated.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The list of permissions to grant for the Amazon Q App.
        @[JSON::Field(key: "grantPermissions")]
        getter grant_permissions : Array(Types::PermissionInput)?

        # The list of permissions to revoke for the Amazon Q App.
        @[JSON::Field(key: "revokePermissions")]
        getter revoke_permissions : Array(Types::PermissionInput)?

        def initialize(
          @app_id : String,
          @instance_id : String,
          @grant_permissions : Array(Types::PermissionInput)? = nil,
          @revoke_permissions : Array(Types::PermissionInput)? = nil
        )
        end
      end

      struct UpdateQAppPermissionsOutput
        include JSON::Serializable

        # The unique identifier of the Amazon Q App for which permissions were updated.
        @[JSON::Field(key: "appId")]
        getter app_id : String?

        # The updated list of permissions for the Amazon Q App.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::PermissionOutput)?

        # The Amazon Resource Name (ARN) of the Amazon Q App for which permissions were updated.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @app_id : String? = nil,
          @permissions : Array(Types::PermissionOutput)? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      struct UpdateQAppSessionInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App session to provide input for.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The input values to provide for the current state of the Q App session.
        @[JSON::Field(key: "values")]
        getter values : Array(Types::CardValue)?

        def initialize(
          @instance_id : String,
          @session_id : String,
          @values : Array(Types::CardValue)? = nil
        )
        end
      end

      struct UpdateQAppSessionMetadataInput
        include JSON::Serializable

        # The unique identifier of the Amazon Q Business application environment instance.
        @[JSON::Field(key: "instance-id")]
        getter instance_id : String

        # The unique identifier of the Q App session to update configuration for.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The new sharing configuration for the Q App data collection session.
        @[JSON::Field(key: "sharingConfiguration")]
        getter sharing_configuration : Types::SessionSharingConfiguration

        # The new name for the Q App session.
        @[JSON::Field(key: "sessionName")]
        getter session_name : String?

        def initialize(
          @instance_id : String,
          @session_id : String,
          @sharing_configuration : Types::SessionSharingConfiguration,
          @session_name : String? = nil
        )
        end
      end

      struct UpdateQAppSessionMetadataOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated Q App session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the updated Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The new sharing configuration of the updated Q App data collection session.
        @[JSON::Field(key: "sharingConfiguration")]
        getter sharing_configuration : Types::SessionSharingConfiguration

        # The new name of the updated Q App session.
        @[JSON::Field(key: "sessionName")]
        getter session_name : String?

        def initialize(
          @session_arn : String,
          @session_id : String,
          @sharing_configuration : Types::SessionSharingConfiguration,
          @session_name : String? = nil
        )
        end
      end

      struct UpdateQAppSessionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated Q App session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The unique identifier of the updated Q App session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @session_arn : String,
          @session_id : String
        )
        end
      end

      # A user of an Amazon Q App.
      struct User
        include JSON::Serializable

        # The unique identifier of a user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # An Amazon Q App associated with a user, either owned by the user or favorited.
      struct UserAppItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Q App.
        @[JSON::Field(key: "appArn")]
        getter app_arn : String

        # The unique identifier of the Q App.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The date and time the user's association with the Q App was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The title of the Q App.
        @[JSON::Field(key: "title")]
        getter title : String

        # A flag indicating whether the user can edit the Q App.
        @[JSON::Field(key: "canEdit")]
        getter can_edit : Bool?

        # The description of the Q App.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the Q App has been verified.
        @[JSON::Field(key: "isVerified")]
        getter is_verified : Bool?

        # The status of the user's association with the Q App.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_arn : String,
          @app_id : String,
          @created_at : Time,
          @title : String,
          @can_edit : Bool? = nil,
          @description : String? = nil,
          @is_verified : Bool? = nil,
          @status : String? = nil
        )
        end
      end

      # The input failed to satisfy the constraints specified by the service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
