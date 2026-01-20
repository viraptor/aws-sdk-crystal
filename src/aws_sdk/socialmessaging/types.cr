require "json"
require "time"

module AwsSdk
  module SocialMessaging
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedByMetaException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateWhatsAppBusinessAccountInput
        include JSON::Serializable

        # A JSON object that contains the phone numbers and WhatsApp Business Account to link to your account.

        @[JSON::Field(key: "setupFinalization")]
        getter setup_finalization : Types::WhatsAppSetupFinalization?

        # Contains the callback access token.

        @[JSON::Field(key: "signupCallback")]
        getter signup_callback : Types::WhatsAppSignupCallback?

        def initialize(
          @setup_finalization : Types::WhatsAppSetupFinalization? = nil,
          @signup_callback : Types::WhatsAppSignupCallback? = nil
        )
        end
      end


      struct AssociateWhatsAppBusinessAccountOutput
        include JSON::Serializable

        # Contains your WhatsApp registration status.

        @[JSON::Field(key: "signupCallbackResult")]
        getter signup_callback_result : Types::WhatsAppSignupCallbackResult?

        # The status code for the response.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @signup_callback_result : Types::WhatsAppSignupCallbackResult? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct CreateWhatsAppMessageTemplateFromLibraryInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account to associate with this template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The template configuration from Meta's library, including customizations for buttons and body text.

        @[JSON::Field(key: "metaLibraryTemplate")]
        getter meta_library_template : Types::MetaLibraryTemplate

        def initialize(
          @id : String,
          @meta_library_template : Types::MetaLibraryTemplate
        )
        end
      end


      struct CreateWhatsAppMessageTemplateFromLibraryOutput
        include JSON::Serializable

        # The category of the template (for example, UTILITY or MARKETING).

        @[JSON::Field(key: "category")]
        getter category : String?

        # The numeric ID assigned to the template by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String?

        # The status of the created template (for example, PENDING or APPROVED).

        @[JSON::Field(key: "templateStatus")]
        getter template_status : String?

        def initialize(
          @category : String? = nil,
          @meta_template_id : String? = nil,
          @template_status : String? = nil
        )
        end
      end


      struct CreateWhatsAppMessageTemplateInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account to associate with this template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The complete template definition as a JSON blob.

        @[JSON::Field(key: "templateDefinition")]
        getter template_definition : Bytes

        def initialize(
          @id : String,
          @template_definition : Bytes
        )
        end
      end


      struct CreateWhatsAppMessageTemplateMediaInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account associated with this media upload.

        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "sourceS3File")]
        getter source_s3_file : Types::S3File?

        def initialize(
          @id : String,
          @source_s3_file : Types::S3File? = nil
        )
        end
      end


      struct CreateWhatsAppMessageTemplateMediaOutput
        include JSON::Serializable

        # The handle assigned to the uploaded media by Meta, used to reference the media in templates.

        @[JSON::Field(key: "metaHeaderHandle")]
        getter meta_header_handle : String?

        def initialize(
          @meta_header_handle : String? = nil
        )
        end
      end


      struct CreateWhatsAppMessageTemplateOutput
        include JSON::Serializable

        # The category of the template, such as UTILITY or MARKETING.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The numeric ID assigned to the template by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String?

        # The status of the created template, such as PENDING or APPROVED..

        @[JSON::Field(key: "templateStatus")]
        getter template_status : String?

        def initialize(
          @category : String? = nil,
          @meta_template_id : String? = nil,
          @template_status : String? = nil
        )
        end
      end


      struct DeleteWhatsAppMessageMediaInput
        include JSON::Serializable

        # The unique identifier of the media file to delete. Use the mediaId returned from
        # PostWhatsAppMessageMedia .

        @[JSON::Field(key: "mediaId")]
        getter media_id : String

        # The unique identifier of the originating phone number associated with the media. Phone number
        # identifiers are formatted as phone-number-id-01234567890123456789012345678901 . Use
        # GetLinkedWhatsAppBusinessAccount to find a phone number's id.

        @[JSON::Field(key: "originationPhoneNumberId")]
        getter origination_phone_number_id : String

        def initialize(
          @media_id : String,
          @origination_phone_number_id : String
        )
        end
      end


      struct DeleteWhatsAppMessageMediaOutput
        include JSON::Serializable

        # Success indicator for deleting the media file.

        @[JSON::Field(key: "success")]
        getter success : Bool?

        def initialize(
          @success : Bool? = nil
        )
        end
      end


      struct DeleteWhatsAppMessageTemplateInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account associated with this template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the template to delete.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # If true, deletes all language versions of the template.

        @[JSON::Field(key: "deleteAllTemplates")]
        getter delete_all_languages : Bool?

        # The numeric ID of the template assigned by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String?

        def initialize(
          @id : String,
          @template_name : String,
          @delete_all_languages : Bool? = nil,
          @meta_template_id : String? = nil
        )
        end
      end


      struct DeleteWhatsAppMessageTemplateOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Thrown when performing an action because a dependency would be broken.

      struct DependencyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DisassociateWhatsAppBusinessAccountInput
        include JSON::Serializable

        # The unique identifier of your WhatsApp Business Account. WABA identifiers are formatted as
        # waba-01234567890123456789012345678901 . Use ListLinkedWhatsAppBusinessAccounts to list all WABAs and
        # their details.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DisassociateWhatsAppBusinessAccountOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetLinkedWhatsAppBusinessAccountInput
        include JSON::Serializable

        # The unique identifier, from Amazon Web Services, of the linked WhatsApp Business Account. WABA
        # identifiers are formatted as waba-01234567890123456789012345678901 . Use
        # ListLinkedWhatsAppBusinessAccounts to list all WABAs and their details.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetLinkedWhatsAppBusinessAccountOutput
        include JSON::Serializable

        # The details of the linked WhatsApp Business Account.

        @[JSON::Field(key: "account")]
        getter account : Types::LinkedWhatsAppBusinessAccount?

        def initialize(
          @account : Types::LinkedWhatsAppBusinessAccount? = nil
        )
        end
      end


      struct GetLinkedWhatsAppBusinessAccountPhoneNumberInput
        include JSON::Serializable

        # The unique identifier of the phone number. Phone number identifiers are formatted as
        # phone-number-id-01234567890123456789012345678901 . Use GetLinkedWhatsAppBusinessAccount to find a
        # phone number's id.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetLinkedWhatsAppBusinessAccountPhoneNumberOutput
        include JSON::Serializable

        # The WABA identifier linked to the phone number, formatted as waba-01234567890123456789012345678901 .

        @[JSON::Field(key: "linkedWhatsAppBusinessAccountId")]
        getter linked_whats_app_business_account_id : String?


        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : Types::WhatsAppPhoneNumberDetail?

        def initialize(
          @linked_whats_app_business_account_id : String? = nil,
          @phone_number : Types::WhatsAppPhoneNumberDetail? = nil
        )
        end
      end


      struct GetWhatsAppMessageMediaInput
        include JSON::Serializable

        # The unique identifier for the media file.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String

        # The unique identifier of the originating phone number for the WhatsApp message media. The phone
        # number identifiers are formatted as phone-number-id-01234567890123456789012345678901 . Use
        # GetLinkedWhatsAppBusinessAccount to find a phone number's id.

        @[JSON::Field(key: "originationPhoneNumberId")]
        getter origination_phone_number_id : String

        # The bucketName and key of the S3 media file.

        @[JSON::Field(key: "destinationS3File")]
        getter destination_s3_file : Types::S3File?

        # The presign url of the media file.

        @[JSON::Field(key: "destinationS3PresignedUrl")]
        getter destination_s3_presigned_url : Types::S3PresignedUrl?

        # Set to True to get only the metadata for the file.

        @[JSON::Field(key: "metadataOnly")]
        getter metadata_only : Bool?

        def initialize(
          @media_id : String,
          @origination_phone_number_id : String,
          @destination_s3_file : Types::S3File? = nil,
          @destination_s3_presigned_url : Types::S3PresignedUrl? = nil,
          @metadata_only : Bool? = nil
        )
        end
      end


      struct GetWhatsAppMessageMediaOutput
        include JSON::Serializable

        # The size of the media file, in KB.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int64?

        # The MIME type of the media.

        @[JSON::Field(key: "mimeType")]
        getter mime_type : String?

        def initialize(
          @file_size : Int64? = nil,
          @mime_type : String? = nil
        )
        end
      end


      struct GetWhatsAppMessageTemplateInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account associated with this template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The numeric ID of the template assigned by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String

        def initialize(
          @id : String,
          @meta_template_id : String
        )
        end
      end


      struct GetWhatsAppMessageTemplateOutput
        include JSON::Serializable

        # The complete template definition as a JSON string (maximum 6000 characters).

        @[JSON::Field(key: "template")]
        getter template : String?

        def initialize(
          @template : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters provided to the action are not valid.

      struct InvalidParametersException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration options for customizing the body content of a template from Meta's library.

      struct LibraryTemplateBodyInputs
        include JSON::Serializable

        # When true, includes a contact number in the template body.

        @[JSON::Field(key: "addContactNumber")]
        getter add_contact_number : Bool?

        # When true, includes a "learn more" link in the template body.

        @[JSON::Field(key: "addLearnMoreLink")]
        getter add_learn_more_link : Bool?

        # When true, includes security recommendations in the template body.

        @[JSON::Field(key: "addSecurityRecommendation")]
        getter add_security_recommendation : Bool?

        # When true, includes a package tracking link in the template body.

        @[JSON::Field(key: "addTrackPackageLink")]
        getter add_track_package_link : Bool?

        # The number of minutes until a verification code or OTP expires.

        @[JSON::Field(key: "codeExpirationMinutes")]
        getter code_expiration_minutes : Int32?

        def initialize(
          @add_contact_number : Bool? = nil,
          @add_learn_more_link : Bool? = nil,
          @add_security_recommendation : Bool? = nil,
          @add_track_package_link : Bool? = nil,
          @code_expiration_minutes : Int32? = nil
        )
        end
      end

      # Configuration options for customizing buttons in a template from Meta's library.

      struct LibraryTemplateButtonInput
        include JSON::Serializable

        # The type of one-time password for OTP buttons.

        @[JSON::Field(key: "otpType")]
        getter otp_type : String?

        # The phone number in E.164 format for CALL-type buttons.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String?

        # List of supported applications for this button type.

        @[JSON::Field(key: "supportedApps")]
        getter supported_apps : Array(Hash(String, String))?

        # The type of button (for example, QUICK_REPLY, CALL, or URL).

        @[JSON::Field(key: "type")]
        getter type : String?

        # The URL with dynamic parameters for URL-type buttons.

        @[JSON::Field(key: "url")]
        getter url : Hash(String, String)?

        # When true, indicates acceptance of zero-tap terms for the button.

        @[JSON::Field(key: "zeroTapTermsAccepted")]
        getter zero_tap_terms_accepted : Bool?

        def initialize(
          @otp_type : String? = nil,
          @phone_number : String? = nil,
          @supported_apps : Array(Hash(String, String))? = nil,
          @type : String? = nil,
          @url : Hash(String, String)? = nil,
          @zero_tap_terms_accepted : Bool? = nil
        )
        end
      end

      # Defines a button in a template from Meta's library.

      struct LibraryTemplateButtonList
        include JSON::Serializable

        # The type of one-time password for OTP buttons.

        @[JSON::Field(key: "otpType")]
        getter otp_type : String?

        # The phone number in E.164 format for CALL-type buttons.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String?

        # List of supported applications for this button type.

        @[JSON::Field(key: "supportedApps")]
        getter supported_apps : Array(Hash(String, String))?

        # The text displayed on the button (maximum 40 characters).

        @[JSON::Field(key: "text")]
        getter text : String?

        # The type of button (for example, QUICK_REPLY, CALL, or URL).

        @[JSON::Field(key: "type")]
        getter type : String?

        # The URL for URL-type buttons.

        @[JSON::Field(key: "url")]
        getter url : String?

        # When true, indicates acceptance of zero-tap terms for the button.

        @[JSON::Field(key: "zeroTapTermsAccepted")]
        getter zero_tap_terms_accepted : Bool?

        def initialize(
          @otp_type : String? = nil,
          @phone_number : String? = nil,
          @supported_apps : Array(Hash(String, String))? = nil,
          @text : String? = nil,
          @type : String? = nil,
          @url : String? = nil,
          @zero_tap_terms_accepted : Bool? = nil
        )
        end
      end

      # The request was denied because it would exceed one or more service quotas or limits.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details of your linked WhatsApp Business Account.

      struct LinkedWhatsAppBusinessAccount
        include JSON::Serializable

        # The ARN of the linked WhatsApp Business Account.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The event destinations for the linked WhatsApp Business Account.

        @[JSON::Field(key: "eventDestinations")]
        getter event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination)

        # The ID of the linked WhatsApp Business Account, formatted as waba-01234567890123456789012345678901 .

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the WhatsApp Business Account was linked.

        @[JSON::Field(key: "linkDate")]
        getter link_date : Time

        # The phone numbers associated with the Linked WhatsApp Business Account.

        @[JSON::Field(key: "phoneNumbers")]
        getter phone_numbers : Array(Types::WhatsAppPhoneNumberSummary)

        # The registration status of the linked WhatsApp Business Account.

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The WhatsApp Business Account ID from meta.

        @[JSON::Field(key: "wabaId")]
        getter waba_id : String

        # The name of the linked WhatsApp Business Account.

        @[JSON::Field(key: "wabaName")]
        getter waba_name : String

        def initialize(
          @arn : String,
          @event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination),
          @id : String,
          @link_date : Time,
          @phone_numbers : Array(Types::WhatsAppPhoneNumberSummary),
          @registration_status : String,
          @waba_id : String,
          @waba_name : String
        )
        end
      end

      # Contains your WhatsApp registration status and details of any unregistered WhatsApp phone number.

      struct LinkedWhatsAppBusinessAccountIdMetaData
        include JSON::Serializable

        # The name of your account.

        @[JSON::Field(key: "accountName")]
        getter account_name : String?

        # The registration status of the linked WhatsApp Business Account.

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String?

        # The details for unregistered WhatsApp phone numbers.

        @[JSON::Field(key: "unregisteredWhatsAppPhoneNumbers")]
        getter unregistered_whats_app_phone_numbers : Array(Types::WhatsAppPhoneNumberDetail)?

        # The Amazon Resource Name (ARN) of the WhatsApp Business Account ID.

        @[JSON::Field(key: "wabaId")]
        getter waba_id : String?

        def initialize(
          @account_name : String? = nil,
          @registration_status : String? = nil,
          @unregistered_whats_app_phone_numbers : Array(Types::WhatsAppPhoneNumberDetail)? = nil,
          @waba_id : String? = nil
        )
        end
      end

      # The details of a linked WhatsApp Business Account.

      struct LinkedWhatsAppBusinessAccountSummary
        include JSON::Serializable

        # The ARN of the linked WhatsApp Business Account.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The event destinations for the linked WhatsApp Business Account.

        @[JSON::Field(key: "eventDestinations")]
        getter event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination)

        # The ID of the linked WhatsApp Business Account, formatted as waba-01234567890123456789012345678901 .

        @[JSON::Field(key: "id")]
        getter id : String

        # The date the WhatsApp Business Account was linked.

        @[JSON::Field(key: "linkDate")]
        getter link_date : Time

        # The registration status of the linked WhatsApp Business Account.

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The WhatsApp Business Account ID provided by Meta.

        @[JSON::Field(key: "wabaId")]
        getter waba_id : String

        # The name of the linked WhatsApp Business Account.

        @[JSON::Field(key: "wabaName")]
        getter waba_name : String

        def initialize(
          @arn : String,
          @event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination),
          @id : String,
          @link_date : Time,
          @registration_status : String,
          @waba_id : String,
          @waba_name : String
        )
        end
      end


      struct ListLinkedWhatsAppBusinessAccountsInput
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next token for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLinkedWhatsAppBusinessAccountsOutput
        include JSON::Serializable

        # A list of WhatsApp Business Accounts linked to your Amazon Web Services account.

        @[JSON::Field(key: "linkedAccounts")]
        getter linked_accounts : Array(Types::LinkedWhatsAppBusinessAccountSummary)?

        # The next token for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @linked_accounts : Array(Types::LinkedWhatsAppBusinessAccountSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to retrieve the tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The status code of the response.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @status_code : Int32? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWhatsAppMessageTemplatesInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account to list templates for.

        @[JSON::Field(key: "id")]
        getter id : String

        # The maximum number of results to return per page (1-100).

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWhatsAppMessageTemplatesOutput
        include JSON::Serializable

        # The token to retrieve the next page of results, if any.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of template summaries.

        @[JSON::Field(key: "templates")]
        getter templates : Array(Types::TemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @templates : Array(Types::TemplateSummary)? = nil
        )
        end
      end


      struct ListWhatsAppTemplateLibraryInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account to list library templates for.

        @[JSON::Field(key: "id")]
        getter id : String

        # Map of filters to apply (searchKey, topic, usecase, industry, language).

        @[JSON::Field(key: "filters")]
        getter filters : Hash(String, String)?

        # The maximum number of results to return per page (1-100).

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @filters : Hash(String, String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWhatsAppTemplateLibraryOutput
        include JSON::Serializable

        # A list of templates from Meta's library.

        @[JSON::Field(key: "metaLibraryTemplates")]
        getter meta_library_templates : Array(Types::MetaLibraryTemplateDefinition)?

        # The token to retrieve the next page of results, if any.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @meta_library_templates : Array(Types::MetaLibraryTemplateDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a template from Meta's library with customization options.

      struct MetaLibraryTemplate
        include JSON::Serializable

        # The name of the template in Meta's library.

        @[JSON::Field(key: "libraryTemplateName")]
        getter library_template_name : String

        # The category of the template (for example, UTILITY or MARKETING).

        @[JSON::Field(key: "templateCategory")]
        getter template_category : String

        # The language code for the template (for example, en_US).

        @[JSON::Field(key: "templateLanguage")]
        getter template_language : String

        # The name to assign to the template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String

        # Body text customizations for the template.

        @[JSON::Field(key: "libraryTemplateBodyInputs")]
        getter library_template_body_inputs : Types::LibraryTemplateBodyInputs?

        # Button customizations for the template.

        @[JSON::Field(key: "libraryTemplateButtonInputs")]
        getter library_template_button_inputs : Array(Types::LibraryTemplateButtonInput)?

        def initialize(
          @library_template_name : String,
          @template_category : String,
          @template_language : String,
          @template_name : String,
          @library_template_body_inputs : Types::LibraryTemplateBodyInputs? = nil,
          @library_template_button_inputs : Array(Types::LibraryTemplateButtonInput)? = nil
        )
        end
      end

      # Defines the complete structure and content of a template in Meta's library.

      struct MetaLibraryTemplateDefinition
        include JSON::Serializable

        # The body text of the template.

        @[JSON::Field(key: "templateBody")]
        getter template_body : String?

        # Example parameter values for the template body, used to demonstrate how dynamic content appears in
        # the template.

        @[JSON::Field(key: "templateBodyExampleParams")]
        getter template_body_example_params : Array(String)?

        # The buttons included in the template.

        @[JSON::Field(key: "templateButtons")]
        getter template_buttons : Array(Types::LibraryTemplateButtonList)?

        # The category of the template (for example, UTILITY or MARKETING).

        @[JSON::Field(key: "templateCategory")]
        getter template_category : String?

        # The header text of the template.

        @[JSON::Field(key: "templateHeader")]
        getter template_header : String?

        # The ID of the template in Meta's library.

        @[JSON::Field(key: "templateId")]
        getter template_id : String?

        # The industries the template is designed for.

        @[JSON::Field(key: "templateIndustry")]
        getter template_industry : Array(String)?

        # The language code for the template (for example, en_US).

        @[JSON::Field(key: "templateLanguage")]
        getter template_language : String?

        # The name of the template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The topic or subject matter of the template.

        @[JSON::Field(key: "templateTopic")]
        getter template_topic : String?

        # The intended use case for the template.

        @[JSON::Field(key: "templateUseCase")]
        getter template_use_case : String?

        def initialize(
          @template_body : String? = nil,
          @template_body_example_params : Array(String)? = nil,
          @template_buttons : Array(Types::LibraryTemplateButtonList)? = nil,
          @template_category : String? = nil,
          @template_header : String? = nil,
          @template_id : String? = nil,
          @template_industry : Array(String)? = nil,
          @template_language : String? = nil,
          @template_name : String? = nil,
          @template_topic : String? = nil,
          @template_use_case : String? = nil
        )
        end
      end


      struct PostWhatsAppMessageMediaInput
        include JSON::Serializable

        # The ID of the phone number to associate with the WhatsApp media file. The phone number identifiers
        # are formatted as phone-number-id-01234567890123456789012345678901 . Use
        # GetLinkedWhatsAppBusinessAccount to find a phone number's id.

        @[JSON::Field(key: "originationPhoneNumberId")]
        getter origination_phone_number_id : String

        # The source S3 url for the media file.

        @[JSON::Field(key: "sourceS3File")]
        getter source_s3_file : Types::S3File?

        # The source presign url of the media file.

        @[JSON::Field(key: "sourceS3PresignedUrl")]
        getter source_s3_presigned_url : Types::S3PresignedUrl?

        def initialize(
          @origination_phone_number_id : String,
          @source_s3_file : Types::S3File? = nil,
          @source_s3_presigned_url : Types::S3PresignedUrl? = nil
        )
        end
      end


      struct PostWhatsAppMessageMediaOutput
        include JSON::Serializable

        # The unique identifier of the posted WhatsApp message.

        @[JSON::Field(key: "mediaId")]
        getter media_id : String?

        def initialize(
          @media_id : String? = nil
        )
        end
      end


      struct PutWhatsAppBusinessAccountEventDestinationsInput
        include JSON::Serializable

        # An array of WhatsAppBusinessAccountEventDestination event destinations.

        @[JSON::Field(key: "eventDestinations")]
        getter event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination)

        # The unique identifier of your WhatsApp Business Account. WABA identifiers are formatted as
        # waba-01234567890123456789012345678901 . Use ListLinkedWhatsAppBusinessAccounts to list all WABAs and
        # their details.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination),
          @id : String
        )
        end
      end


      struct PutWhatsAppBusinessAccountEventDestinationsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information for the S3 bucket that contains media files.

      struct S3File
        include JSON::Serializable

        # The bucket name.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The S3 key prefix that defines the storage location of your media files. The prefix works like a
        # folder path in S3, and is combined with the WhatsApp mediaId to create the final file path. For
        # example, if a media file's WhatsApp mediaId is 123.ogg , and the key is audio/example.ogg , the
        # final file path is audio/example.ogg123.ogg . For the same mediaId, a key of audio/ results in the
        # file path audio/123.ogg .

        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket_name : String,
          @key : String
        )
        end
      end

      # You can use presigned URLs to grant time-limited access to objects in Amazon S3 without updating
      # your bucket policy. For more information, see Working with presigned URLs in the Amazon S3 User
      # Guide .

      struct S3PresignedUrl
        include JSON::Serializable

        # A map of headers and their values. You must specify the Content-Type header when using
        # PostWhatsAppMessageMedia . For a list of common headers, see Common Request Headers in the Amazon S3
        # API Reference

        @[JSON::Field(key: "headers")]
        getter headers : Hash(String, String)

        # The presign url to the object.

        @[JSON::Field(key: "url")]
        getter url : String

        def initialize(
          @headers : Hash(String, String),
          @url : String
        )
        end
      end


      struct SendWhatsAppMessageInput
        include JSON::Serializable

        # The message to send through WhatsApp. The length is in KB. The message field passes through a
        # WhatsApp Message object, see Messages in the WhatsApp Business Platform Cloud API Reference .

        @[JSON::Field(key: "message")]
        getter message : Bytes

        # The API version for the request formatted as v{VersionNumber} . For a list of supported API versions
        # and Amazon Web Services Regions, see Amazon Web Services End User Messaging Social API Service
        # Endpoints in the Amazon Web Services General Reference .

        @[JSON::Field(key: "metaApiVersion")]
        getter meta_api_version : String

        # The ID of the phone number used to send the WhatsApp message. If you are sending a media file only
        # the originationPhoneNumberId used to upload the file can be used. Phone number identifiers are
        # formatted as phone-number-id-01234567890123456789012345678901 . Use GetLinkedWhatsAppBusinessAccount
        # to find a phone number's id.

        @[JSON::Field(key: "originationPhoneNumberId")]
        getter origination_phone_number_id : String

        def initialize(
          @message : Bytes,
          @meta_api_version : String,
          @origination_phone_number_id : String
        )
        end
      end


      struct SendWhatsAppMessageOutput
        include JSON::Serializable

        # The unique identifier of the message.

        @[JSON::Field(key: "messageId")]
        getter message_id : String?

        def initialize(
          @message_id : String? = nil
        )
        end
      end

      # The tag for a resource.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        # The status code of the tag resource operation.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      # Provides a summary of a WhatsApp message template's key attributes.

      struct TemplateSummary
        include JSON::Serializable

        # The numeric ID assigned to the template by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String?

        # The category of the template (for example, UTILITY or MARKETING).

        @[JSON::Field(key: "templateCategory")]
        getter template_category : String?

        # The language code of the template (for example, en_US).

        @[JSON::Field(key: "templateLanguage")]
        getter template_language : String?

        # The name of the template.

        @[JSON::Field(key: "templateName")]
        getter template_name : String?

        # The quality score assigned to the template by Meta.

        @[JSON::Field(key: "templateQualityScore")]
        getter template_quality_score : String?

        # The current status of the template (for example, APPROVED, PENDING, or REJECTED).

        @[JSON::Field(key: "templateStatus")]
        getter template_status : String?

        def initialize(
          @meta_template_id : String? = nil,
          @template_category : String? = nil,
          @template_language : String? = nil,
          @template_name : String? = nil,
          @template_quality_score : String? = nil,
          @template_status : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottledRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        # The status code of the untag resource operation.

        @[JSON::Field(key: "statusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end


      struct UpdateWhatsAppMessageTemplateInput
        include JSON::Serializable

        # The ID of the WhatsApp Business Account associated with this template.

        @[JSON::Field(key: "id")]
        getter id : String

        # The numeric ID of the template assigned by Meta.

        @[JSON::Field(key: "metaTemplateId")]
        getter meta_template_id : String

        # When true, disables click tracking for call-to-action URL buttons in the template.

        @[JSON::Field(key: "ctaUrlLinkTrackingOptedOut")]
        getter cta_url_link_tracking_opted_out : Bool?

        # The format specification for parameters in the template, this can be either 'named' or 'positional'.

        @[JSON::Field(key: "parameterFormat")]
        getter parameter_format : String?

        # The new category for the template (for example, UTILITY or MARKETING).

        @[JSON::Field(key: "templateCategory")]
        getter template_category : String?

        # The updated components of the template as a JSON blob (maximum 3000 characters).

        @[JSON::Field(key: "templateComponents")]
        getter template_components : Bytes?

        def initialize(
          @id : String,
          @meta_template_id : String,
          @cta_url_link_tracking_opted_out : Bool? = nil,
          @parameter_format : String? = nil,
          @template_category : String? = nil,
          @template_components : Bytes? = nil
        )
        end
      end


      struct UpdateWhatsAppMessageTemplateOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request contains an invalid parameter value.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The registration details for a linked phone number.

      struct WabaPhoneNumberSetupFinalization
        include JSON::Serializable

        # The unique identifier of the originating phone number associated with the media. Phone number
        # identifiers are formatted as phone-number-id-01234567890123456789012345678901 . Use the
        # GetLinkedWhatsAppBusinessAccount API action to find a phone number's id.

        @[JSON::Field(key: "id")]
        getter id : String

        # The PIN to use for two-step verification. To reset your PIN follow the directions in Updating PIN in
        # the WhatsApp Business Platform Cloud API Reference .

        @[JSON::Field(key: "twoFactorPin")]
        getter two_factor_pin : String

        # The two letter ISO region for the location of where Meta will store data. Asia–Pacific (APAC)
        # Australia AU Indonesia ID India IN Japan JP Singapore SG South Korea KR Europe Germany DE
        # Switzerland CH United Kingdom GB Latin America (LATAM) Brazil BR Middle East and Africa (MEA)
        # Bahrain BH South Africa ZA United Arab Emirates AE North America (NORAM) Canada CA

        @[JSON::Field(key: "dataLocalizationRegion")]
        getter data_localization_region : String?

        # An array of key and value pair tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @id : String,
          @two_factor_pin : String,
          @data_localization_region : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The registration details for a linked WhatsApp Business Account.

      struct WabaSetupFinalization
        include JSON::Serializable

        # The event destinations for the linked WhatsApp Business Account.

        @[JSON::Field(key: "eventDestinations")]
        getter event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination)?

        # The ID of the linked WhatsApp Business Account, formatted as waba-01234567890123456789012345678901 .

        @[JSON::Field(key: "id")]
        getter id : String?

        # An array of key and value pair tags.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination)? = nil,
          @id : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains information on the event destination.

      struct WhatsAppBusinessAccountEventDestination
        include JSON::Serializable

        # The ARN of the event destination.

        @[JSON::Field(key: "eventDestinationArn")]
        getter event_destination_arn : String

        # The Amazon Resource Name (ARN) of an Identity and Access Management role that is able to import
        # phone numbers and write events.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @event_destination_arn : String,
          @role_arn : String? = nil
        )
        end
      end

      # The details of your WhatsApp phone number.

      struct WhatsAppPhoneNumberDetail
        include JSON::Serializable

        # The ARN of the WhatsApp phone number.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The phone number that appears in the recipients display.

        @[JSON::Field(key: "displayPhoneNumber")]
        getter display_phone_number : String

        # The display name for this phone number.

        @[JSON::Field(key: "displayPhoneNumberName")]
        getter display_phone_number_name : String

        # The phone number ID from Meta.

        @[JSON::Field(key: "metaPhoneNumberId")]
        getter meta_phone_number_id : String

        # The phone number for sending WhatsApp.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String

        # The phone number ID. Phone number identifiers are formatted as
        # phone-number-id-01234567890123456789012345678901 .

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        # The quality rating of the phone number.

        @[JSON::Field(key: "qualityRating")]
        getter quality_rating : String

        # The geographic region where the WhatsApp phone number's data is stored and processed.

        @[JSON::Field(key: "dataLocalizationRegion")]
        getter data_localization_region : String?

        def initialize(
          @arn : String,
          @display_phone_number : String,
          @display_phone_number_name : String,
          @meta_phone_number_id : String,
          @phone_number : String,
          @phone_number_id : String,
          @quality_rating : String,
          @data_localization_region : String? = nil
        )
        end
      end

      # The details of a linked phone number.

      struct WhatsAppPhoneNumberSummary
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the phone number.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The phone number that appears in the recipients display.

        @[JSON::Field(key: "displayPhoneNumber")]
        getter display_phone_number : String

        # The display name for this phone number.

        @[JSON::Field(key: "displayPhoneNumberName")]
        getter display_phone_number_name : String

        # The phone number ID from Meta.

        @[JSON::Field(key: "metaPhoneNumberId")]
        getter meta_phone_number_id : String

        # The phone number associated with the Linked WhatsApp Business Account.

        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String

        # The phone number ID. Phone number identifiers are formatted as
        # phone-number-id-01234567890123456789012345678901 .

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        # The quality rating of the phone number. This is from Meta.

        @[JSON::Field(key: "qualityRating")]
        getter quality_rating : String

        # The geographic region where the WhatsApp phone number's data is stored and processed.

        @[JSON::Field(key: "dataLocalizationRegion")]
        getter data_localization_region : String?

        def initialize(
          @arn : String,
          @display_phone_number : String,
          @display_phone_number_name : String,
          @meta_phone_number_id : String,
          @phone_number : String,
          @phone_number_id : String,
          @quality_rating : String,
          @data_localization_region : String? = nil
        )
        end
      end

      # The details of linking a WhatsApp Business Account to your Amazon Web Services account.

      struct WhatsAppSetupFinalization
        include JSON::Serializable

        # An Amazon Web Services access token generated by WhatsAppSignupCallback and used by
        # WhatsAppSetupFinalization .

        @[JSON::Field(key: "associateInProgressToken")]
        getter associate_in_progress_token : String

        # An array of WabaPhoneNumberSetupFinalization objects containing the details of each phone number
        # associated with the WhatsApp Business Account.

        @[JSON::Field(key: "phoneNumbers")]
        getter phone_numbers : Array(Types::WabaPhoneNumberSetupFinalization)

        # Used to add a new phone number to an existing WhatsApp Business Account. This field can't be used
        # when the waba field is present.

        @[JSON::Field(key: "phoneNumberParent")]
        getter phone_number_parent : String?

        # Used to create a new WhatsApp Business Account and add a phone number. This field can't be used when
        # the phoneNumberParent field is present.

        @[JSON::Field(key: "waba")]
        getter waba : Types::WabaSetupFinalization?

        def initialize(
          @associate_in_progress_token : String,
          @phone_numbers : Array(Types::WabaPhoneNumberSetupFinalization),
          @phone_number_parent : String? = nil,
          @waba : Types::WabaSetupFinalization? = nil
        )
        end
      end

      # Contains the accessToken provided by Meta during signup.

      struct WhatsAppSignupCallback
        include JSON::Serializable

        # The access token for your WhatsApp Business Account. The accessToken value is provided by Meta.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String

        # The URL where WhatsApp will send callback notifications for this account.

        @[JSON::Field(key: "callbackUrl")]
        getter callback_url : String?

        def initialize(
          @access_token : String,
          @callback_url : String? = nil
        )
        end
      end

      # Contains the results of WhatsAppSignupCallback.

      struct WhatsAppSignupCallbackResult
        include JSON::Serializable

        # An Amazon Web Services access token generated by WhatsAppSignupCallback and used by
        # WhatsAppSetupFinalization .

        @[JSON::Field(key: "associateInProgressToken")]
        getter associate_in_progress_token : String?

        # A LinkedWhatsAppBusinessAccountIdMetaData object map containing the details of any WhatsAppBusiness
        # accounts that have incomplete setup.

        @[JSON::Field(key: "linkedAccountsWithIncompleteSetup")]
        getter linked_accounts_with_incomplete_setup : Hash(String, Types::LinkedWhatsAppBusinessAccountIdMetaData)?

        def initialize(
          @associate_in_progress_token : String? = nil,
          @linked_accounts_with_incomplete_setup : Hash(String, Types::LinkedWhatsAppBusinessAccountIdMetaData)? = nil
        )
        end
      end
    end
  end
end
