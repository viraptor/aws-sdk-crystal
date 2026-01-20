module AwsSdk
  module SocialMessaging
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

      # This is only used through the Amazon Web Services console during sign-up to associate your WhatsApp
      # Business Account to your Amazon Web Services account.

      def associate_whats_app_business_account(
        setup_finalization : Types::WhatsAppSetupFinalization? = nil,
        signup_callback : Types::WhatsAppSignupCallback? = nil
      ) : Protocol::Request
        input = Types::AssociateWhatsAppBusinessAccountInput.new(setup_finalization: setup_finalization, signup_callback: signup_callback)
        associate_whats_app_business_account(input)
      end

      def associate_whats_app_business_account(input : Types::AssociateWhatsAppBusinessAccountInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WHATS_APP_BUSINESS_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new WhatsApp message template from a custom definition. Amazon Web Services End User
      # Messaging Social does not store any WhatsApp message template content.

      def create_whats_app_message_template(
        id : String,
        template_definition : Bytes
      ) : Protocol::Request
        input = Types::CreateWhatsAppMessageTemplateInput.new(id: id, template_definition: template_definition)
        create_whats_app_message_template(input)
      end

      def create_whats_app_message_template(input : Types::CreateWhatsAppMessageTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WHATS_APP_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new WhatsApp message template using a template from Meta's template library.

      def create_whats_app_message_template_from_library(
        id : String,
        meta_library_template : Types::MetaLibraryTemplate
      ) : Protocol::Request
        input = Types::CreateWhatsAppMessageTemplateFromLibraryInput.new(id: id, meta_library_template: meta_library_template)
        create_whats_app_message_template_from_library(input)
      end

      def create_whats_app_message_template_from_library(input : Types::CreateWhatsAppMessageTemplateFromLibraryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WHATS_APP_MESSAGE_TEMPLATE_FROM_LIBRARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads media for use in a WhatsApp message template.

      def create_whats_app_message_template_media(
        id : String,
        source_s3_file : Types::S3File? = nil
      ) : Protocol::Request
        input = Types::CreateWhatsAppMessageTemplateMediaInput.new(id: id, source_s3_file: source_s3_file)
        create_whats_app_message_template_media(input)
      end

      def create_whats_app_message_template_media(input : Types::CreateWhatsAppMessageTemplateMediaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WHATS_APP_MESSAGE_TEMPLATE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a media object from the WhatsApp service. If the object is still in an Amazon S3 bucket you
      # should delete it from there too.

      def delete_whats_app_message_media(
        media_id : String,
        origination_phone_number_id : String
      ) : Protocol::Request
        input = Types::DeleteWhatsAppMessageMediaInput.new(media_id: media_id, origination_phone_number_id: origination_phone_number_id)
        delete_whats_app_message_media(input)
      end

      def delete_whats_app_message_media(input : Types::DeleteWhatsAppMessageMediaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WHATS_APP_MESSAGE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a WhatsApp message template.

      def delete_whats_app_message_template(
        id : String,
        template_name : String,
        delete_all_languages : Bool? = nil,
        meta_template_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteWhatsAppMessageTemplateInput.new(id: id, template_name: template_name, delete_all_languages: delete_all_languages, meta_template_id: meta_template_id)
        delete_whats_app_message_template(input)
      end

      def delete_whats_app_message_template(input : Types::DeleteWhatsAppMessageTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WHATS_APP_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociate a WhatsApp Business Account (WABA) from your Amazon Web Services account.

      def disassociate_whats_app_business_account(
        id : String
      ) : Protocol::Request
        input = Types::DisassociateWhatsAppBusinessAccountInput.new(id: id)
        disassociate_whats_app_business_account(input)
      end

      def disassociate_whats_app_business_account(input : Types::DisassociateWhatsAppBusinessAccountInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WHATS_APP_BUSINESS_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the details of your linked WhatsApp Business Account.

      def get_linked_whats_app_business_account(
        id : String
      ) : Protocol::Request
        input = Types::GetLinkedWhatsAppBusinessAccountInput.new(id: id)
        get_linked_whats_app_business_account(input)
      end

      def get_linked_whats_app_business_account(input : Types::GetLinkedWhatsAppBusinessAccountInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINKED_WHATS_APP_BUSINESS_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the WABA account id and phone number details of a WhatsApp business account phone number.

      def get_linked_whats_app_business_account_phone_number(
        id : String
      ) : Protocol::Request
        input = Types::GetLinkedWhatsAppBusinessAccountPhoneNumberInput.new(id: id)
        get_linked_whats_app_business_account_phone_number(input)
      end

      def get_linked_whats_app_business_account_phone_number(input : Types::GetLinkedWhatsAppBusinessAccountPhoneNumberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINKED_WHATS_APP_BUSINESS_ACCOUNT_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a media file from the WhatsApp service. On successful completion the media file is retrieved
      # from Meta and stored in the specified Amazon S3 bucket. Use either destinationS3File or
      # destinationS3PresignedUrl for the destination. If both are used then an InvalidParameterException is
      # returned.

      def get_whats_app_message_media(
        media_id : String,
        origination_phone_number_id : String,
        destination_s3_file : Types::S3File? = nil,
        destination_s3_presigned_url : Types::S3PresignedUrl? = nil,
        metadata_only : Bool? = nil
      ) : Protocol::Request
        input = Types::GetWhatsAppMessageMediaInput.new(media_id: media_id, origination_phone_number_id: origination_phone_number_id, destination_s3_file: destination_s3_file, destination_s3_presigned_url: destination_s3_presigned_url, metadata_only: metadata_only)
        get_whats_app_message_media(input)
      end

      def get_whats_app_message_media(input : Types::GetWhatsAppMessageMediaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WHATS_APP_MESSAGE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specific WhatsApp message template.

      def get_whats_app_message_template(
        id : String,
        meta_template_id : String
      ) : Protocol::Request
        input = Types::GetWhatsAppMessageTemplateInput.new(id: id, meta_template_id: meta_template_id)
        get_whats_app_message_template(input)
      end

      def get_whats_app_message_template(input : Types::GetWhatsAppMessageTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WHATS_APP_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all WhatsApp Business Accounts linked to your Amazon Web Services account.

      def list_linked_whats_app_business_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLinkedWhatsAppBusinessAccountsInput.new(max_results: max_results, next_token: next_token)
        list_linked_whats_app_business_accounts(input)
      end

      def list_linked_whats_app_business_accounts(input : Types::ListLinkedWhatsAppBusinessAccountsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINKED_WHATS_APP_BUSINESS_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tags associated with a resource, such as a phone number or WABA.

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

      # Lists WhatsApp message templates for a specific WhatsApp Business Account.

      def list_whats_app_message_templates(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWhatsAppMessageTemplatesInput.new(id: id, max_results: max_results, next_token: next_token)
        list_whats_app_message_templates(input)
      end

      def list_whats_app_message_templates(input : Types::ListWhatsAppMessageTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WHATS_APP_MESSAGE_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists templates available in Meta's template library for WhatsApp messaging.

      def list_whats_app_template_library(
        id : String,
        filters : Hash(String, String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWhatsAppTemplateLibraryInput.new(id: id, filters: filters, max_results: max_results, next_token: next_token)
        list_whats_app_template_library(input)
      end

      def list_whats_app_template_library(input : Types::ListWhatsAppTemplateLibraryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WHATS_APP_TEMPLATE_LIBRARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upload a media file to the WhatsApp service. Only the specified originationPhoneNumberId has the
      # permissions to send the media file when using SendWhatsAppMessage . You must use either sourceS3File
      # or sourceS3PresignedUrl for the source. If both or neither are specified then an
      # InvalidParameterException is returned.

      def post_whats_app_message_media(
        origination_phone_number_id : String,
        source_s3_file : Types::S3File? = nil,
        source_s3_presigned_url : Types::S3PresignedUrl? = nil
      ) : Protocol::Request
        input = Types::PostWhatsAppMessageMediaInput.new(origination_phone_number_id: origination_phone_number_id, source_s3_file: source_s3_file, source_s3_presigned_url: source_s3_presigned_url)
        post_whats_app_message_media(input)
      end

      def post_whats_app_message_media(input : Types::PostWhatsAppMessageMediaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_WHATS_APP_MESSAGE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add an event destination to log event data from WhatsApp for a WhatsApp Business Account (WABA). A
      # WABA can only have one event destination at a time. All resources associated with the WABA use the
      # same event destination.

      def put_whats_app_business_account_event_destinations(
        event_destinations : Array(Types::WhatsAppBusinessAccountEventDestination),
        id : String
      ) : Protocol::Request
        input = Types::PutWhatsAppBusinessAccountEventDestinationsInput.new(event_destinations: event_destinations, id: id)
        put_whats_app_business_account_event_destinations(input)
      end

      def put_whats_app_business_account_event_destinations(input : Types::PutWhatsAppBusinessAccountEventDestinationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_WHATS_APP_BUSINESS_ACCOUNT_EVENT_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send a WhatsApp message. For examples of sending a message using the Amazon Web Services CLI, see
      # Sending messages in the Amazon Web Services End User Messaging Social User Guide .

      def send_whats_app_message(
        message : Bytes,
        meta_api_version : String,
        origination_phone_number_id : String
      ) : Protocol::Request
        input = Types::SendWhatsAppMessageInput.new(message: message, meta_api_version: meta_api_version, origination_phone_number_id: origination_phone_number_id)
        send_whats_app_message(input)
      end

      def send_whats_app_message(input : Types::SendWhatsAppMessageInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_WHATS_APP_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or overwrites only the specified tags for the specified resource. When you specify an existing
      # tag key, the value is overwritten with the new value.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from a resource.

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

      # Updates an existing WhatsApp message template.

      def update_whats_app_message_template(
        id : String,
        meta_template_id : String,
        cta_url_link_tracking_opted_out : Bool? = nil,
        parameter_format : String? = nil,
        template_category : String? = nil,
        template_components : Bytes? = nil
      ) : Protocol::Request
        input = Types::UpdateWhatsAppMessageTemplateInput.new(id: id, meta_template_id: meta_template_id, cta_url_link_tracking_opted_out: cta_url_link_tracking_opted_out, parameter_format: parameter_format, template_category: template_category, template_components: template_components)
        update_whats_app_message_template(input)
      end

      def update_whats_app_message_template(input : Types::UpdateWhatsAppMessageTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WHATS_APP_MESSAGE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
