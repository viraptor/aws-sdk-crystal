module AwsSdk
  module PinpointSMSVoiceV2
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates the specified origination identity with a pool. If the origination identity is a phone
      # number and is already associated with another pool, an error is returned. A sender ID can be
      # associated with multiple pools. If the origination identity configuration doesn't match the pool's
      # configuration, an error is returned.

      def associate_origination_identity(
        iso_country_code : String,
        origination_identity : String,
        pool_id : String,
        client_token : String? = nil
      ) : Types::AssociateOriginationIdentityResult

        input = Types::AssociateOriginationIdentityRequest.new(iso_country_code: iso_country_code, origination_identity: origination_identity, pool_id: pool_id, client_token: client_token)
        associate_origination_identity(input)
      end

      def associate_origination_identity(input : Types::AssociateOriginationIdentityRequest) : Types::AssociateOriginationIdentityResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_ORIGINATION_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateOriginationIdentityResult, "AssociateOriginationIdentity")
      end

      # Associate a protect configuration with a configuration set. This replaces the configuration sets
      # current protect configuration. A configuration set can only be associated with one protect
      # configuration at a time. A protect configuration can be associated with multiple configuration sets.

      def associate_protect_configuration(
        configuration_set_name : String,
        protect_configuration_id : String
      ) : Types::AssociateProtectConfigurationResult

        input = Types::AssociateProtectConfigurationRequest.new(configuration_set_name: configuration_set_name, protect_configuration_id: protect_configuration_id)
        associate_protect_configuration(input)
      end

      def associate_protect_configuration(input : Types::AssociateProtectConfigurationRequest) : Types::AssociateProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateProtectConfigurationResult, "AssociateProtectConfiguration")
      end

      # Returns information about a destination phone number, including whether the number type and whether
      # it is valid, the carrier, and more.

      def carrier_lookup(
        phone_number : String
      ) : Types::CarrierLookupResult

        input = Types::CarrierLookupRequest.new(phone_number: phone_number)
        carrier_lookup(input)
      end

      def carrier_lookup(input : Types::CarrierLookupRequest) : Types::CarrierLookupResult
        request = Protocol::JsonRpc.build_request(Model::CARRIER_LOOKUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CarrierLookupResult, "CarrierLookup")
      end

      # Creates a new configuration set. After you create the configuration set, you can add one or more
      # event destinations to it. A configuration set is a set of rules that you apply to the SMS and voice
      # messages that you send. When you send a message, you can optionally specify a single configuration
      # set.

      def create_configuration_set(
        configuration_set_name : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateConfigurationSetResult

        input = Types::CreateConfigurationSetRequest.new(configuration_set_name: configuration_set_name, client_token: client_token, tags: tags)
        create_configuration_set(input)
      end

      def create_configuration_set(input : Types::CreateConfigurationSetRequest) : Types::CreateConfigurationSetResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONFIGURATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConfigurationSetResult, "CreateConfigurationSet")
      end

      # Creates a new event destination in a configuration set. An event destination is a location where you
      # send message events. The event options are Amazon CloudWatch, Amazon Data Firehose, or Amazon SNS.
      # For example, when a message is delivered successfully, you can send information about that event to
      # an event destination, or send notifications to endpoints that are subscribed to an Amazon SNS topic.
      # You can only create one event destination at a time. You must provide a value for a single event
      # destination using either CloudWatchLogsDestination , KinesisFirehoseDestination or SnsDestination .
      # If an event destination isn't provided then an exception is returned. Each configuration set can
      # contain between 0 and 5 event destinations. Each event destination can contain a reference to a
      # single destination, such as a CloudWatch or Firehose destination.

      def create_event_destination(
        configuration_set_name : String,
        event_destination_name : String,
        matching_event_types : Array(String),
        client_token : String? = nil,
        cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
        kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
        sns_destination : Types::SnsDestination? = nil
      ) : Types::CreateEventDestinationResult

        input = Types::CreateEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name, matching_event_types: matching_event_types, client_token: client_token, cloud_watch_logs_destination: cloud_watch_logs_destination, kinesis_firehose_destination: kinesis_firehose_destination, sns_destination: sns_destination)
        create_event_destination(input)
      end

      def create_event_destination(input : Types::CreateEventDestinationRequest) : Types::CreateEventDestinationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEventDestinationResult, "CreateEventDestination")
      end

      # Creates a new opt-out list. If the opt-out list name already exists, an error is returned. An
      # opt-out list is a list of phone numbers that are opted out, meaning you can't send SMS or voice
      # messages to them. If end user replies with the keyword "STOP," an entry for the phone number is
      # added to the opt-out list. In addition to STOP, your recipients can use any supported opt-out
      # keyword, such as CANCEL or OPTOUT. For a list of supported opt-out keywords, see SMS opt out in the
      # End User Messaging SMS User Guide.

      def create_opt_out_list(
        opt_out_list_name : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOptOutListResult

        input = Types::CreateOptOutListRequest.new(opt_out_list_name: opt_out_list_name, client_token: client_token, tags: tags)
        create_opt_out_list(input)
      end

      def create_opt_out_list(input : Types::CreateOptOutListRequest) : Types::CreateOptOutListResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_OPT_OUT_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOptOutListResult, "CreateOptOutList")
      end

      # Creates a new pool and associates the specified origination identity to the pool. A pool can include
      # one or more phone numbers and SenderIds that are associated with your Amazon Web Services account.
      # The new pool inherits its configuration from the specified origination identity. This includes
      # keywords, message type, opt-out list, two-way configuration, and self-managed opt-out configuration.
      # Deletion protection isn't inherited from the origination identity and defaults to false. If the
      # origination identity is a phone number and is already associated with another pool, an error is
      # returned. A sender ID can be associated with multiple pools.

      def create_pool(
        iso_country_code : String,
        message_type : String,
        origination_identity : String,
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePoolResult

        input = Types::CreatePoolRequest.new(iso_country_code: iso_country_code, message_type: message_type, origination_identity: origination_identity, client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, tags: tags)
        create_pool(input)
      end

      def create_pool(input : Types::CreatePoolRequest) : Types::CreatePoolResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePoolResult, "CreatePool")
      end

      # Create a new protect configuration. By default all country rule sets for each capability are set to
      # ALLOW . Update the country rule sets using UpdateProtectConfigurationCountryRuleSet . A protect
      # configurations name is stored as a Tag with the key set to Name and value as the name of the protect
      # configuration.

      def create_protect_configuration(
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProtectConfigurationResult

        input = Types::CreateProtectConfigurationRequest.new(client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, tags: tags)
        create_protect_configuration(input)
      end

      def create_protect_configuration(input : Types::CreateProtectConfigurationRequest) : Types::CreateProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProtectConfigurationResult, "CreateProtectConfiguration")
      end

      # Creates a new registration based on the RegistrationType field.

      def create_registration(
        registration_type : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRegistrationResult

        input = Types::CreateRegistrationRequest.new(registration_type: registration_type, client_token: client_token, tags: tags)
        create_registration(input)
      end

      def create_registration(input : Types::CreateRegistrationRequest) : Types::CreateRegistrationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegistrationResult, "CreateRegistration")
      end

      # Associate the registration with an origination identity such as a phone number or sender ID.

      def create_registration_association(
        registration_id : String,
        resource_id : String
      ) : Types::CreateRegistrationAssociationResult

        input = Types::CreateRegistrationAssociationRequest.new(registration_id: registration_id, resource_id: resource_id)
        create_registration_association(input)
      end

      def create_registration_association(input : Types::CreateRegistrationAssociationRequest) : Types::CreateRegistrationAssociationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGISTRATION_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegistrationAssociationResult, "CreateRegistrationAssociation")
      end

      # Create a new registration attachment to use for uploading a file or a URL to a file. The maximum
      # file size is 500KB and valid file extensions are PDF, JPEG and PNG. For example, many sender ID
      # registrations require a signed “letter of authorization” (LOA) to be submitted. Use either
      # AttachmentUrl or AttachmentBody to upload your attachment. If both are specified then an exception
      # is returned.

      def create_registration_attachment(
        attachment_body : Bytes? = nil,
        attachment_url : String? = nil,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRegistrationAttachmentResult

        input = Types::CreateRegistrationAttachmentRequest.new(attachment_body: attachment_body, attachment_url: attachment_url, client_token: client_token, tags: tags)
        create_registration_attachment(input)
      end

      def create_registration_attachment(input : Types::CreateRegistrationAttachmentRequest) : Types::CreateRegistrationAttachmentResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGISTRATION_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegistrationAttachmentResult, "CreateRegistrationAttachment")
      end

      # Create a new version of the registration and increase the VersionNumber . The previous version of
      # the registration becomes read-only.

      def create_registration_version(
        registration_id : String
      ) : Types::CreateRegistrationVersionResult

        input = Types::CreateRegistrationVersionRequest.new(registration_id: registration_id)
        create_registration_version(input)
      end

      def create_registration_version(input : Types::CreateRegistrationVersionRequest) : Types::CreateRegistrationVersionResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGISTRATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegistrationVersionResult, "CreateRegistrationVersion")
      end

      # You can only send messages to verified destination numbers when your account is in the sandbox. You
      # can add up to 10 verified destination numbers.

      def create_verified_destination_number(
        destination_phone_number : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateVerifiedDestinationNumberResult

        input = Types::CreateVerifiedDestinationNumberRequest.new(destination_phone_number: destination_phone_number, client_token: client_token, tags: tags)
        create_verified_destination_number(input)
      end

      def create_verified_destination_number(input : Types::CreateVerifiedDestinationNumberRequest) : Types::CreateVerifiedDestinationNumberResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_VERIFIED_DESTINATION_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVerifiedDestinationNumberResult, "CreateVerifiedDestinationNumber")
      end

      # Removes the current account default protect configuration.

      def delete_account_default_protect_configuration : Types::DeleteAccountDefaultProtectConfigurationResult
        input = Types::DeleteAccountDefaultProtectConfigurationRequest.new
        delete_account_default_protect_configuration(input)
      end

      def delete_account_default_protect_configuration(input : Types::DeleteAccountDefaultProtectConfigurationRequest) : Types::DeleteAccountDefaultProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCOUNT_DEFAULT_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccountDefaultProtectConfigurationResult, "DeleteAccountDefaultProtectConfiguration")
      end

      # Deletes an existing configuration set. A configuration set is a set of rules that you apply to voice
      # and SMS messages that you send. In a configuration set, you can specify a destination for specific
      # types of events related to voice and SMS messages.

      def delete_configuration_set(
        configuration_set_name : String
      ) : Types::DeleteConfigurationSetResult

        input = Types::DeleteConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set(input)
      end

      def delete_configuration_set(input : Types::DeleteConfigurationSetRequest) : Types::DeleteConfigurationSetResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONFIGURATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteConfigurationSetResult, "DeleteConfigurationSet")
      end

      # Deletes an existing default message type on a configuration set. A message type is a type of
      # messages that you plan to send. If you send account-related messages or time-sensitive messages such
      # as one-time passcodes, choose Transactional . If you plan to send messages that contain marketing
      # material or other promotional content, choose Promotional . This setting applies to your entire
      # Amazon Web Services account.

      def delete_default_message_type(
        configuration_set_name : String
      ) : Types::DeleteDefaultMessageTypeResult

        input = Types::DeleteDefaultMessageTypeRequest.new(configuration_set_name: configuration_set_name)
        delete_default_message_type(input)
      end

      def delete_default_message_type(input : Types::DeleteDefaultMessageTypeRequest) : Types::DeleteDefaultMessageTypeResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEFAULT_MESSAGE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDefaultMessageTypeResult, "DeleteDefaultMessageType")
      end

      # Deletes an existing default sender ID on a configuration set. A default sender ID is the identity
      # that appears on recipients' devices when they receive SMS messages. Support for sender ID
      # capabilities varies by country or region.

      def delete_default_sender_id(
        configuration_set_name : String
      ) : Types::DeleteDefaultSenderIdResult

        input = Types::DeleteDefaultSenderIdRequest.new(configuration_set_name: configuration_set_name)
        delete_default_sender_id(input)
      end

      def delete_default_sender_id(input : Types::DeleteDefaultSenderIdRequest) : Types::DeleteDefaultSenderIdResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEFAULT_SENDER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDefaultSenderIdResult, "DeleteDefaultSenderId")
      end

      # Deletes an existing event destination. An event destination is a location where you send response
      # information about the messages that you send. For example, when a message is delivered successfully,
      # you can send information about that event to an Amazon CloudWatch destination, or send notifications
      # to endpoints that are subscribed to an Amazon SNS topic.

      def delete_event_destination(
        configuration_set_name : String,
        event_destination_name : String
      ) : Types::DeleteEventDestinationResult

        input = Types::DeleteEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name)
        delete_event_destination(input)
      end

      def delete_event_destination(input : Types::DeleteEventDestinationRequest) : Types::DeleteEventDestinationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEventDestinationResult, "DeleteEventDestination")
      end

      # Deletes an existing keyword from an origination phone number or pool. A keyword is a word that you
      # can search for on a particular phone number or pool. It is also a specific word or phrase that an
      # end user can send to your number to elicit a response, such as an informational message or a special
      # offer. When your number receives a message that begins with a keyword, End User Messaging SMS
      # responds with a customizable message. Keywords "HELP" and "STOP" can't be deleted or modified.

      def delete_keyword(
        keyword : String,
        origination_identity : String
      ) : Types::DeleteKeywordResult

        input = Types::DeleteKeywordRequest.new(keyword: keyword, origination_identity: origination_identity)
        delete_keyword(input)
      end

      def delete_keyword(input : Types::DeleteKeywordRequest) : Types::DeleteKeywordResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_KEYWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteKeywordResult, "DeleteKeyword")
      end

      # Deletes an account-level monthly spending limit override for sending multimedia messages (MMS).
      # Deleting a spend limit override will set the EnforcedLimit to equal the MaxLimit , which is
      # controlled by Amazon Web Services. For more information on spend limits (quotas) see Quotas for
      # Server Migration Service in the Server Migration Service User Guide .

      def delete_media_message_spend_limit_override : Types::DeleteMediaMessageSpendLimitOverrideResult
        input = Types::DeleteMediaMessageSpendLimitOverrideRequest.new
        delete_media_message_spend_limit_override(input)
      end

      def delete_media_message_spend_limit_override(input : Types::DeleteMediaMessageSpendLimitOverrideRequest) : Types::DeleteMediaMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_MEDIA_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMediaMessageSpendLimitOverrideResult, "DeleteMediaMessageSpendLimitOverride")
      end

      # Deletes an existing opt-out list. All opted out phone numbers in the opt-out list are deleted. If
      # the specified opt-out list name doesn't exist or is in-use by an origination phone number or pool,
      # an error is returned.

      def delete_opt_out_list(
        opt_out_list_name : String
      ) : Types::DeleteOptOutListResult

        input = Types::DeleteOptOutListRequest.new(opt_out_list_name: opt_out_list_name)
        delete_opt_out_list(input)
      end

      def delete_opt_out_list(input : Types::DeleteOptOutListRequest) : Types::DeleteOptOutListResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_OPT_OUT_LIST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOptOutListResult, "DeleteOptOutList")
      end

      # Deletes an existing opted out destination phone number from the specified opt-out list. Each
      # destination phone number can only be deleted once every 30 days. If the specified destination phone
      # number doesn't exist or if the opt-out list doesn't exist, an error is returned.

      def delete_opted_out_number(
        opt_out_list_name : String,
        opted_out_number : String
      ) : Types::DeleteOptedOutNumberResult

        input = Types::DeleteOptedOutNumberRequest.new(opt_out_list_name: opt_out_list_name, opted_out_number: opted_out_number)
        delete_opted_out_number(input)
      end

      def delete_opted_out_number(input : Types::DeleteOptedOutNumberRequest) : Types::DeleteOptedOutNumberResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_OPTED_OUT_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOptedOutNumberResult, "DeleteOptedOutNumber")
      end

      # Deletes an existing pool. Deleting a pool disassociates all origination identities from that pool.
      # If the pool status isn't active or if deletion protection is enabled, an error is returned. A pool
      # is a collection of phone numbers and SenderIds. A pool can include one or more phone numbers and
      # SenderIds that are associated with your Amazon Web Services account.

      def delete_pool(
        pool_id : String
      ) : Types::DeletePoolResult

        input = Types::DeletePoolRequest.new(pool_id: pool_id)
        delete_pool(input)
      end

      def delete_pool(input : Types::DeletePoolRequest) : Types::DeletePoolResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePoolResult, "DeletePool")
      end

      # Permanently delete the protect configuration. The protect configuration must have deletion
      # protection disabled and must not be associated as the account default protect configuration or
      # associated with a configuration set.

      def delete_protect_configuration(
        protect_configuration_id : String
      ) : Types::DeleteProtectConfigurationResult

        input = Types::DeleteProtectConfigurationRequest.new(protect_configuration_id: protect_configuration_id)
        delete_protect_configuration(input)
      end

      def delete_protect_configuration(input : Types::DeleteProtectConfigurationRequest) : Types::DeleteProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProtectConfigurationResult, "DeleteProtectConfiguration")
      end

      # Permanently delete the protect configuration rule set number override.

      def delete_protect_configuration_rule_set_number_override(
        destination_phone_number : String,
        protect_configuration_id : String
      ) : Types::DeleteProtectConfigurationRuleSetNumberOverrideResult

        input = Types::DeleteProtectConfigurationRuleSetNumberOverrideRequest.new(destination_phone_number: destination_phone_number, protect_configuration_id: protect_configuration_id)
        delete_protect_configuration_rule_set_number_override(input)
      end

      def delete_protect_configuration_rule_set_number_override(input : Types::DeleteProtectConfigurationRuleSetNumberOverrideRequest) : Types::DeleteProtectConfigurationRuleSetNumberOverrideResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProtectConfigurationRuleSetNumberOverrideResult, "DeleteProtectConfigurationRuleSetNumberOverride")
      end

      # Permanently delete an existing registration from your account.

      def delete_registration(
        registration_id : String
      ) : Types::DeleteRegistrationResult

        input = Types::DeleteRegistrationRequest.new(registration_id: registration_id)
        delete_registration(input)
      end

      def delete_registration(input : Types::DeleteRegistrationRequest) : Types::DeleteRegistrationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGISTRATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegistrationResult, "DeleteRegistration")
      end

      # Permanently delete the specified registration attachment.

      def delete_registration_attachment(
        registration_attachment_id : String
      ) : Types::DeleteRegistrationAttachmentResult

        input = Types::DeleteRegistrationAttachmentRequest.new(registration_attachment_id: registration_attachment_id)
        delete_registration_attachment(input)
      end

      def delete_registration_attachment(input : Types::DeleteRegistrationAttachmentRequest) : Types::DeleteRegistrationAttachmentResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGISTRATION_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegistrationAttachmentResult, "DeleteRegistrationAttachment")
      end

      # Delete the value in a registration form field.

      def delete_registration_field_value(
        field_path : String,
        registration_id : String
      ) : Types::DeleteRegistrationFieldValueResult

        input = Types::DeleteRegistrationFieldValueRequest.new(field_path: field_path, registration_id: registration_id)
        delete_registration_field_value(input)
      end

      def delete_registration_field_value(input : Types::DeleteRegistrationFieldValueRequest) : Types::DeleteRegistrationFieldValueResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGISTRATION_FIELD_VALUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegistrationFieldValueResult, "DeleteRegistrationFieldValue")
      end

      # Deletes the resource-based policy document attached to the End User Messaging SMS resource. A shared
      # resource can be a Pool, Opt-out list, Sender Id, or Phone number.

      def delete_resource_policy(
        resource_arn : String
      ) : Types::DeleteResourcePolicyResult

        input = Types::DeleteResourcePolicyRequest.new(resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResult, "DeleteResourcePolicy")
      end

      # Deletes an account-level monthly spending limit override for sending text messages. Deleting a spend
      # limit override will set the EnforcedLimit to equal the MaxLimit , which is controlled by Amazon Web
      # Services. For more information on spend limits (quotas) see Quotas in the End User Messaging SMS
      # User Guide .

      def delete_text_message_spend_limit_override : Types::DeleteTextMessageSpendLimitOverrideResult
        input = Types::DeleteTextMessageSpendLimitOverrideRequest.new
        delete_text_message_spend_limit_override(input)
      end

      def delete_text_message_spend_limit_override(input : Types::DeleteTextMessageSpendLimitOverrideRequest) : Types::DeleteTextMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_TEXT_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTextMessageSpendLimitOverrideResult, "DeleteTextMessageSpendLimitOverride")
      end

      # Delete a verified destination phone number.

      def delete_verified_destination_number(
        verified_destination_number_id : String
      ) : Types::DeleteVerifiedDestinationNumberResult

        input = Types::DeleteVerifiedDestinationNumberRequest.new(verified_destination_number_id: verified_destination_number_id)
        delete_verified_destination_number(input)
      end

      def delete_verified_destination_number(input : Types::DeleteVerifiedDestinationNumberRequest) : Types::DeleteVerifiedDestinationNumberResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_VERIFIED_DESTINATION_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVerifiedDestinationNumberResult, "DeleteVerifiedDestinationNumber")
      end

      # Deletes an account level monthly spend limit override for sending voice messages. Deleting a spend
      # limit override sets the EnforcedLimit equal to the MaxLimit , which is controlled by Amazon Web
      # Services. For more information on spending limits (quotas) see Quotas in the End User Messaging SMS
      # User Guide .

      def delete_voice_message_spend_limit_override : Types::DeleteVoiceMessageSpendLimitOverrideResult
        input = Types::DeleteVoiceMessageSpendLimitOverrideRequest.new
        delete_voice_message_spend_limit_override(input)
      end

      def delete_voice_message_spend_limit_override(input : Types::DeleteVoiceMessageSpendLimitOverrideRequest) : Types::DeleteVoiceMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_VOICE_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVoiceMessageSpendLimitOverrideResult, "DeleteVoiceMessageSpendLimitOverride")
      end

      # Describes attributes of your Amazon Web Services account. The supported account attributes include
      # account tier, which indicates whether your account is in the sandbox or production environment. When
      # you're ready to move your account out of the sandbox, create an Amazon Web Services Support case for
      # a service limit increase request. New accounts are placed into an SMS or voice sandbox. The sandbox
      # protects both Amazon Web Services end recipients and SMS or voice recipients from fraud and abuse.

      def describe_account_attributes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAccountAttributesResult

        input = Types::DescribeAccountAttributesRequest.new(max_results: max_results, next_token: next_token)
        describe_account_attributes(input)
      end

      def describe_account_attributes(input : Types::DescribeAccountAttributesRequest) : Types::DescribeAccountAttributesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountAttributesResult, "DescribeAccountAttributes")
      end

      # Describes the current End User Messaging SMS SMS Voice V2 resource quotas for your account. The
      # description for a quota includes the quota name, current usage toward that quota, and the quota's
      # maximum value. When you establish an Amazon Web Services account, the account has initial quotas on
      # the maximum number of configuration sets, opt-out lists, phone numbers, and pools that you can
      # create in a given Region. For more information see Quotas in the End User Messaging SMS User Guide .

      def describe_account_limits(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAccountLimitsResult

        input = Types::DescribeAccountLimitsRequest.new(max_results: max_results, next_token: next_token)
        describe_account_limits(input)
      end

      def describe_account_limits(input : Types::DescribeAccountLimitsRequest) : Types::DescribeAccountLimitsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACCOUNT_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAccountLimitsResult, "DescribeAccountLimits")
      end

      # Describes the specified configuration sets or all in your account. If you specify configuration set
      # names, the output includes information for only the specified configuration sets. If you specify
      # filters, the output includes information for only those configuration sets that meet the filter
      # criteria. If you don't specify configuration set names or filters, the output includes information
      # for all configuration sets. If you specify a configuration set name that isn't valid, an error is
      # returned.

      def describe_configuration_sets(
        configuration_set_names : Array(String)? = nil,
        filters : Array(Types::ConfigurationSetFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConfigurationSetsResult

        input = Types::DescribeConfigurationSetsRequest.new(configuration_set_names: configuration_set_names, filters: filters, max_results: max_results, next_token: next_token)
        describe_configuration_sets(input)
      end

      def describe_configuration_sets(input : Types::DescribeConfigurationSetsRequest) : Types::DescribeConfigurationSetsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATION_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationSetsResult, "DescribeConfigurationSets")
      end

      # Describes the specified keywords or all keywords on your origination phone number or pool. A keyword
      # is a word that you can search for on a particular phone number or pool. It is also a specific word
      # or phrase that an end user can send to your number to elicit a response, such as an informational
      # message or a special offer. When your number receives a message that begins with a keyword, End User
      # Messaging SMS responds with a customizable message. If you specify a keyword that isn't valid, an
      # error is returned.

      def describe_keywords(
        origination_identity : String,
        filters : Array(Types::KeywordFilter)? = nil,
        keywords : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeKeywordsResult

        input = Types::DescribeKeywordsRequest.new(origination_identity: origination_identity, filters: filters, keywords: keywords, max_results: max_results, next_token: next_token)
        describe_keywords(input)
      end

      def describe_keywords(input : Types::DescribeKeywordsRequest) : Types::DescribeKeywordsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_KEYWORDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeKeywordsResult, "DescribeKeywords")
      end

      # Describes the specified opt-out list or all opt-out lists in your account. If you specify opt-out
      # list names, the output includes information for only the specified opt-out lists. Opt-out lists
      # include only those that meet the filter criteria. If you don't specify opt-out list names or
      # filters, the output includes information for all opt-out lists. If you specify an opt-out list name
      # that isn't valid, an error is returned.

      def describe_opt_out_lists(
        max_results : Int32? = nil,
        next_token : String? = nil,
        opt_out_list_names : Array(String)? = nil,
        owner : String? = nil
      ) : Types::DescribeOptOutListsResult

        input = Types::DescribeOptOutListsRequest.new(max_results: max_results, next_token: next_token, opt_out_list_names: opt_out_list_names, owner: owner)
        describe_opt_out_lists(input)
      end

      def describe_opt_out_lists(input : Types::DescribeOptOutListsRequest) : Types::DescribeOptOutListsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OPT_OUT_LISTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOptOutListsResult, "DescribeOptOutLists")
      end

      # Describes the specified opted out destination numbers or all opted out destination numbers in an
      # opt-out list. If you specify opted out numbers, the output includes information for only the
      # specified opted out numbers. If you specify filters, the output includes information for only those
      # opted out numbers that meet the filter criteria. If you don't specify opted out numbers or filters,
      # the output includes information for all opted out destination numbers in your opt-out list. If you
      # specify an opted out number that isn't valid, an exception is returned.

      def describe_opted_out_numbers(
        opt_out_list_name : String,
        filters : Array(Types::OptedOutFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        opted_out_numbers : Array(String)? = nil
      ) : Types::DescribeOptedOutNumbersResult

        input = Types::DescribeOptedOutNumbersRequest.new(opt_out_list_name: opt_out_list_name, filters: filters, max_results: max_results, next_token: next_token, opted_out_numbers: opted_out_numbers)
        describe_opted_out_numbers(input)
      end

      def describe_opted_out_numbers(input : Types::DescribeOptedOutNumbersRequest) : Types::DescribeOptedOutNumbersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OPTED_OUT_NUMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOptedOutNumbersResult, "DescribeOptedOutNumbers")
      end

      # Describes the specified origination phone number, or all the phone numbers in your account. If you
      # specify phone number IDs, the output includes information for only the specified phone numbers. If
      # you specify filters, the output includes information for only those phone numbers that meet the
      # filter criteria. If you don't specify phone number IDs or filters, the output includes information
      # for all phone numbers. If you specify a phone number ID that isn't valid, an error is returned.

      def describe_phone_numbers(
        filters : Array(Types::PhoneNumberFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil,
        phone_number_ids : Array(String)? = nil
      ) : Types::DescribePhoneNumbersResult

        input = Types::DescribePhoneNumbersRequest.new(filters: filters, max_results: max_results, next_token: next_token, owner: owner, phone_number_ids: phone_number_ids)
        describe_phone_numbers(input)
      end

      def describe_phone_numbers(input : Types::DescribePhoneNumbersRequest) : Types::DescribePhoneNumbersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PHONE_NUMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePhoneNumbersResult, "DescribePhoneNumbers")
      end

      # Retrieves the specified pools or all pools associated with your Amazon Web Services account. If you
      # specify pool IDs, the output includes information for only the specified pools. If you specify
      # filters, the output includes information for only those pools that meet the filter criteria. If you
      # don't specify pool IDs or filters, the output includes information for all pools. If you specify a
      # pool ID that isn't valid, an error is returned. A pool is a collection of phone numbers and
      # SenderIds. A pool can include one or more phone numbers and SenderIds that are associated with your
      # Amazon Web Services account.

      def describe_pools(
        filters : Array(Types::PoolFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil,
        pool_ids : Array(String)? = nil
      ) : Types::DescribePoolsResult

        input = Types::DescribePoolsRequest.new(filters: filters, max_results: max_results, next_token: next_token, owner: owner, pool_ids: pool_ids)
        describe_pools(input)
      end

      def describe_pools(input : Types::DescribePoolsRequest) : Types::DescribePoolsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePoolsResult, "DescribePools")
      end

      # Retrieves the protect configurations that match any of filters. If a filter isn’t provided then all
      # protect configurations are returned.

      def describe_protect_configurations(
        filters : Array(Types::ProtectConfigurationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        protect_configuration_ids : Array(String)? = nil
      ) : Types::DescribeProtectConfigurationsResult

        input = Types::DescribeProtectConfigurationsRequest.new(filters: filters, max_results: max_results, next_token: next_token, protect_configuration_ids: protect_configuration_ids)
        describe_protect_configurations(input)
      end

      def describe_protect_configurations(input : Types::DescribeProtectConfigurationsRequest) : Types::DescribeProtectConfigurationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROTECT_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProtectConfigurationsResult, "DescribeProtectConfigurations")
      end

      # Retrieves the specified registration attachments or all registration attachments associated with
      # your Amazon Web Services account.

      def describe_registration_attachments(
        filters : Array(Types::RegistrationAttachmentFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registration_attachment_ids : Array(String)? = nil
      ) : Types::DescribeRegistrationAttachmentsResult

        input = Types::DescribeRegistrationAttachmentsRequest.new(filters: filters, max_results: max_results, next_token: next_token, registration_attachment_ids: registration_attachment_ids)
        describe_registration_attachments(input)
      end

      def describe_registration_attachments(input : Types::DescribeRegistrationAttachmentsRequest) : Types::DescribeRegistrationAttachmentsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_ATTACHMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationAttachmentsResult, "DescribeRegistrationAttachments")
      end

      # Retrieves the specified registration type field definitions. You can use
      # DescribeRegistrationFieldDefinitions to view the requirements for creating, filling out, and
      # submitting each registration type.

      def describe_registration_field_definitions(
        registration_type : String,
        field_paths : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        section_path : String? = nil
      ) : Types::DescribeRegistrationFieldDefinitionsResult

        input = Types::DescribeRegistrationFieldDefinitionsRequest.new(registration_type: registration_type, field_paths: field_paths, max_results: max_results, next_token: next_token, section_path: section_path)
        describe_registration_field_definitions(input)
      end

      def describe_registration_field_definitions(input : Types::DescribeRegistrationFieldDefinitionsRequest) : Types::DescribeRegistrationFieldDefinitionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_FIELD_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationFieldDefinitionsResult, "DescribeRegistrationFieldDefinitions")
      end

      # Retrieves the specified registration field values.

      def describe_registration_field_values(
        registration_id : String,
        field_paths : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        section_path : String? = nil,
        version_number : Int64? = nil
      ) : Types::DescribeRegistrationFieldValuesResult

        input = Types::DescribeRegistrationFieldValuesRequest.new(registration_id: registration_id, field_paths: field_paths, max_results: max_results, next_token: next_token, section_path: section_path, version_number: version_number)
        describe_registration_field_values(input)
      end

      def describe_registration_field_values(input : Types::DescribeRegistrationFieldValuesRequest) : Types::DescribeRegistrationFieldValuesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_FIELD_VALUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationFieldValuesResult, "DescribeRegistrationFieldValues")
      end

      # Retrieves the specified registration section definitions. You can use
      # DescribeRegistrationSectionDefinitions to view the requirements for creating, filling out, and
      # submitting each registration type.

      def describe_registration_section_definitions(
        registration_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        section_paths : Array(String)? = nil
      ) : Types::DescribeRegistrationSectionDefinitionsResult

        input = Types::DescribeRegistrationSectionDefinitionsRequest.new(registration_type: registration_type, max_results: max_results, next_token: next_token, section_paths: section_paths)
        describe_registration_section_definitions(input)
      end

      def describe_registration_section_definitions(input : Types::DescribeRegistrationSectionDefinitionsRequest) : Types::DescribeRegistrationSectionDefinitionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_SECTION_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationSectionDefinitionsResult, "DescribeRegistrationSectionDefinitions")
      end

      # Retrieves the specified registration type definitions. You can use
      # DescribeRegistrationTypeDefinitions to view the requirements for creating, filling out, and
      # submitting each registration type.

      def describe_registration_type_definitions(
        filters : Array(Types::RegistrationTypeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registration_types : Array(String)? = nil
      ) : Types::DescribeRegistrationTypeDefinitionsResult

        input = Types::DescribeRegistrationTypeDefinitionsRequest.new(filters: filters, max_results: max_results, next_token: next_token, registration_types: registration_types)
        describe_registration_type_definitions(input)
      end

      def describe_registration_type_definitions(input : Types::DescribeRegistrationTypeDefinitionsRequest) : Types::DescribeRegistrationTypeDefinitionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_TYPE_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationTypeDefinitionsResult, "DescribeRegistrationTypeDefinitions")
      end

      # Retrieves the specified registration version.

      def describe_registration_versions(
        registration_id : String,
        filters : Array(Types::RegistrationVersionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        version_numbers : Array(Int64)? = nil
      ) : Types::DescribeRegistrationVersionsResult

        input = Types::DescribeRegistrationVersionsRequest.new(registration_id: registration_id, filters: filters, max_results: max_results, next_token: next_token, version_numbers: version_numbers)
        describe_registration_versions(input)
      end

      def describe_registration_versions(input : Types::DescribeRegistrationVersionsRequest) : Types::DescribeRegistrationVersionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationVersionsResult, "DescribeRegistrationVersions")
      end

      # Retrieves the specified registrations.

      def describe_registrations(
        filters : Array(Types::RegistrationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        registration_ids : Array(String)? = nil
      ) : Types::DescribeRegistrationsResult

        input = Types::DescribeRegistrationsRequest.new(filters: filters, max_results: max_results, next_token: next_token, registration_ids: registration_ids)
        describe_registrations(input)
      end

      def describe_registrations(input : Types::DescribeRegistrationsRequest) : Types::DescribeRegistrationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REGISTRATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRegistrationsResult, "DescribeRegistrations")
      end

      # Describes the specified SenderIds or all SenderIds associated with your Amazon Web Services account.
      # If you specify SenderIds, the output includes information for only the specified SenderIds. If you
      # specify filters, the output includes information for only those SenderIds that meet the filter
      # criteria. If you don't specify SenderIds or filters, the output includes information for all
      # SenderIds. f you specify a sender ID that isn't valid, an error is returned.

      def describe_sender_ids(
        filters : Array(Types::SenderIdFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil,
        sender_ids : Array(Types::SenderIdAndCountry)? = nil
      ) : Types::DescribeSenderIdsResult

        input = Types::DescribeSenderIdsRequest.new(filters: filters, max_results: max_results, next_token: next_token, owner: owner, sender_ids: sender_ids)
        describe_sender_ids(input)
      end

      def describe_sender_ids(input : Types::DescribeSenderIdsRequest) : Types::DescribeSenderIdsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SENDER_IDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSenderIdsResult, "DescribeSenderIds")
      end

      # Describes the current monthly spend limits for sending voice and text messages. When you establish
      # an Amazon Web Services account, the account has initial monthly spend limit in a given Region. For
      # more information on increasing your monthly spend limit, see Requesting increases to your monthly
      # SMS, MMS, or Voice spending quota in the End User Messaging SMS User Guide .

      def describe_spend_limits(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeSpendLimitsResult

        input = Types::DescribeSpendLimitsRequest.new(max_results: max_results, next_token: next_token)
        describe_spend_limits(input)
      end

      def describe_spend_limits(input : Types::DescribeSpendLimitsRequest) : Types::DescribeSpendLimitsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SPEND_LIMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSpendLimitsResult, "DescribeSpendLimits")
      end

      # Retrieves the specified verified destination numbers.

      def describe_verified_destination_numbers(
        destination_phone_numbers : Array(String)? = nil,
        filters : Array(Types::VerifiedDestinationNumberFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        verified_destination_number_ids : Array(String)? = nil
      ) : Types::DescribeVerifiedDestinationNumbersResult

        input = Types::DescribeVerifiedDestinationNumbersRequest.new(destination_phone_numbers: destination_phone_numbers, filters: filters, max_results: max_results, next_token: next_token, verified_destination_number_ids: verified_destination_number_ids)
        describe_verified_destination_numbers(input)
      end

      def describe_verified_destination_numbers(input : Types::DescribeVerifiedDestinationNumbersRequest) : Types::DescribeVerifiedDestinationNumbersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_VERIFIED_DESTINATION_NUMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeVerifiedDestinationNumbersResult, "DescribeVerifiedDestinationNumbers")
      end

      # Removes the specified origination identity from an existing pool. If the origination identity isn't
      # associated with the specified pool, an error is returned.

      def disassociate_origination_identity(
        iso_country_code : String,
        origination_identity : String,
        pool_id : String,
        client_token : String? = nil
      ) : Types::DisassociateOriginationIdentityResult

        input = Types::DisassociateOriginationIdentityRequest.new(iso_country_code: iso_country_code, origination_identity: origination_identity, pool_id: pool_id, client_token: client_token)
        disassociate_origination_identity(input)
      end

      def disassociate_origination_identity(input : Types::DisassociateOriginationIdentityRequest) : Types::DisassociateOriginationIdentityResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_ORIGINATION_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateOriginationIdentityResult, "DisassociateOriginationIdentity")
      end

      # Disassociate a protect configuration from a configuration set.

      def disassociate_protect_configuration(
        configuration_set_name : String,
        protect_configuration_id : String
      ) : Types::DisassociateProtectConfigurationResult

        input = Types::DisassociateProtectConfigurationRequest.new(configuration_set_name: configuration_set_name, protect_configuration_id: protect_configuration_id)
        disassociate_protect_configuration(input)
      end

      def disassociate_protect_configuration(input : Types::DisassociateProtectConfigurationRequest) : Types::DisassociateProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateProtectConfigurationResult, "DisassociateProtectConfiguration")
      end

      # Discard the current version of the registration.

      def discard_registration_version(
        registration_id : String
      ) : Types::DiscardRegistrationVersionResult

        input = Types::DiscardRegistrationVersionRequest.new(registration_id: registration_id)
        discard_registration_version(input)
      end

      def discard_registration_version(input : Types::DiscardRegistrationVersionRequest) : Types::DiscardRegistrationVersionResult
        request = Protocol::JsonRpc.build_request(Model::DISCARD_REGISTRATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DiscardRegistrationVersionResult, "DiscardRegistrationVersion")
      end

      # Retrieve the CountryRuleSet for the specified NumberCapability from a protect configuration.

      def get_protect_configuration_country_rule_set(
        number_capability : String,
        protect_configuration_id : String
      ) : Types::GetProtectConfigurationCountryRuleSetResult

        input = Types::GetProtectConfigurationCountryRuleSetRequest.new(number_capability: number_capability, protect_configuration_id: protect_configuration_id)
        get_protect_configuration_country_rule_set(input)
      end

      def get_protect_configuration_country_rule_set(input : Types::GetProtectConfigurationCountryRuleSetRequest) : Types::GetProtectConfigurationCountryRuleSetResult
        request = Protocol::JsonRpc.build_request(Model::GET_PROTECT_CONFIGURATION_COUNTRY_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProtectConfigurationCountryRuleSetResult, "GetProtectConfigurationCountryRuleSet")
      end

      # Retrieves the JSON text of the resource-based policy document attached to the End User Messaging SMS
      # resource. A shared resource can be a Pool, Opt-out list, Sender Id, or Phone number.

      def get_resource_policy(
        resource_arn : String
      ) : Types::GetResourcePolicyResult

        input = Types::GetResourcePolicyRequest.new(resource_arn: resource_arn)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResult
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResult, "GetResourcePolicy")
      end

      # Lists all associated origination identities in your pool. If you specify filters, the output
      # includes information for only those origination identities that meet the filter criteria.

      def list_pool_origination_identities(
        pool_id : String,
        filters : Array(Types::PoolOriginationIdentitiesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPoolOriginationIdentitiesResult

        input = Types::ListPoolOriginationIdentitiesRequest.new(pool_id: pool_id, filters: filters, max_results: max_results, next_token: next_token)
        list_pool_origination_identities(input)
      end

      def list_pool_origination_identities(input : Types::ListPoolOriginationIdentitiesRequest) : Types::ListPoolOriginationIdentitiesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_POOL_ORIGINATION_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPoolOriginationIdentitiesResult, "ListPoolOriginationIdentities")
      end

      # Retrieve all of the protect configuration rule set number overrides that match the filters.

      def list_protect_configuration_rule_set_number_overrides(
        protect_configuration_id : String,
        filters : Array(Types::ProtectConfigurationRuleSetNumberOverrideFilterItem)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProtectConfigurationRuleSetNumberOverridesResult

        input = Types::ListProtectConfigurationRuleSetNumberOverridesRequest.new(protect_configuration_id: protect_configuration_id, filters: filters, max_results: max_results, next_token: next_token)
        list_protect_configuration_rule_set_number_overrides(input)
      end

      def list_protect_configuration_rule_set_number_overrides(input : Types::ListProtectConfigurationRuleSetNumberOverridesRequest) : Types::ListProtectConfigurationRuleSetNumberOverridesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProtectConfigurationRuleSetNumberOverridesResult, "ListProtectConfigurationRuleSetNumberOverrides")
      end

      # Retrieve all of the origination identities that are associated with a registration.

      def list_registration_associations(
        registration_id : String,
        filters : Array(Types::RegistrationAssociationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRegistrationAssociationsResult

        input = Types::ListRegistrationAssociationsRequest.new(registration_id: registration_id, filters: filters, max_results: max_results, next_token: next_token)
        list_registration_associations(input)
      end

      def list_registration_associations(input : Types::ListRegistrationAssociationsRequest) : Types::ListRegistrationAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_REGISTRATION_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegistrationAssociationsResult, "ListRegistrationAssociations")
      end

      # List all tags associated with a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Creates or updates a keyword configuration on an origination phone number or pool. A keyword is a
      # word that you can search for on a particular phone number or pool. It is also a specific word or
      # phrase that an end user can send to your number to elicit a response, such as an informational
      # message or a special offer. When your number receives a message that begins with a keyword, End User
      # Messaging SMS responds with a customizable message. If you specify a keyword that isn't valid, an
      # error is returned.

      def put_keyword(
        keyword : String,
        keyword_message : String,
        origination_identity : String,
        keyword_action : String? = nil
      ) : Types::PutKeywordResult

        input = Types::PutKeywordRequest.new(keyword: keyword, keyword_message: keyword_message, origination_identity: origination_identity, keyword_action: keyword_action)
        put_keyword(input)
      end

      def put_keyword(input : Types::PutKeywordRequest) : Types::PutKeywordResult
        request = Protocol::JsonRpc.build_request(Model::PUT_KEYWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutKeywordResult, "PutKeyword")
      end

      # Set the MessageFeedbackStatus as RECEIVED or FAILED for the passed in MessageId. If you use message
      # feedback then you must update message feedback record. When you receive a signal that a user has
      # received the message you must use PutMessageFeedback to set the message feedback record as RECEIVED
      # ; Otherwise, an hour after the message feedback record is set to FAILED .

      def put_message_feedback(
        message_feedback_status : String,
        message_id : String
      ) : Types::PutMessageFeedbackResult

        input = Types::PutMessageFeedbackRequest.new(message_feedback_status: message_feedback_status, message_id: message_id)
        put_message_feedback(input)
      end

      def put_message_feedback(input : Types::PutMessageFeedbackRequest) : Types::PutMessageFeedbackResult
        request = Protocol::JsonRpc.build_request(Model::PUT_MESSAGE_FEEDBACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutMessageFeedbackResult, "PutMessageFeedback")
      end

      # Creates an opted out destination phone number in the opt-out list. If the destination phone number
      # isn't valid or if the specified opt-out list doesn't exist, an error is returned.

      def put_opted_out_number(
        opt_out_list_name : String,
        opted_out_number : String
      ) : Types::PutOptedOutNumberResult

        input = Types::PutOptedOutNumberRequest.new(opt_out_list_name: opt_out_list_name, opted_out_number: opted_out_number)
        put_opted_out_number(input)
      end

      def put_opted_out_number(input : Types::PutOptedOutNumberRequest) : Types::PutOptedOutNumberResult
        request = Protocol::JsonRpc.build_request(Model::PUT_OPTED_OUT_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutOptedOutNumberResult, "PutOptedOutNumber")
      end

      # Create or update a phone number rule override and associate it with a protect configuration.

      def put_protect_configuration_rule_set_number_override(
        action : String,
        destination_phone_number : String,
        protect_configuration_id : String,
        client_token : String? = nil,
        expiration_timestamp : Time? = nil
      ) : Types::PutProtectConfigurationRuleSetNumberOverrideResult

        input = Types::PutProtectConfigurationRuleSetNumberOverrideRequest.new(action: action, destination_phone_number: destination_phone_number, protect_configuration_id: protect_configuration_id, client_token: client_token, expiration_timestamp: expiration_timestamp)
        put_protect_configuration_rule_set_number_override(input)
      end

      def put_protect_configuration_rule_set_number_override(input : Types::PutProtectConfigurationRuleSetNumberOverrideRequest) : Types::PutProtectConfigurationRuleSetNumberOverrideResult
        request = Protocol::JsonRpc.build_request(Model::PUT_PROTECT_CONFIGURATION_RULE_SET_NUMBER_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutProtectConfigurationRuleSetNumberOverrideResult, "PutProtectConfigurationRuleSetNumberOverride")
      end

      # Creates or updates a field value for a registration.

      def put_registration_field_value(
        field_path : String,
        registration_id : String,
        registration_attachment_id : String? = nil,
        select_choices : Array(String)? = nil,
        text_value : String? = nil
      ) : Types::PutRegistrationFieldValueResult

        input = Types::PutRegistrationFieldValueRequest.new(field_path: field_path, registration_id: registration_id, registration_attachment_id: registration_attachment_id, select_choices: select_choices, text_value: text_value)
        put_registration_field_value(input)
      end

      def put_registration_field_value(input : Types::PutRegistrationFieldValueRequest) : Types::PutRegistrationFieldValueResult
        request = Protocol::JsonRpc.build_request(Model::PUT_REGISTRATION_FIELD_VALUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRegistrationFieldValueResult, "PutRegistrationFieldValue")
      end

      # Attaches a resource-based policy to a End User Messaging SMS resource(phone number, sender Id, phone
      # poll, or opt-out list) that is used for sharing the resource. A shared resource can be a Pool,
      # Opt-out list, Sender Id, or Phone number. For more information about resource-based policies, see
      # Working with shared resources in the End User Messaging SMS User Guide .

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutResourcePolicyResult

        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResult
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResult, "PutResourcePolicy")
      end

      # Releases an existing origination phone number in your account. Once released, a phone number is no
      # longer available for sending messages. If the origination phone number has deletion protection
      # enabled or is associated with a pool, an error is returned.

      def release_phone_number(
        phone_number_id : String
      ) : Types::ReleasePhoneNumberResult

        input = Types::ReleasePhoneNumberRequest.new(phone_number_id: phone_number_id)
        release_phone_number(input)
      end

      def release_phone_number(input : Types::ReleasePhoneNumberRequest) : Types::ReleasePhoneNumberResult
        request = Protocol::JsonRpc.build_request(Model::RELEASE_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReleasePhoneNumberResult, "ReleasePhoneNumber")
      end

      # Releases an existing sender ID in your account.

      def release_sender_id(
        iso_country_code : String,
        sender_id : String
      ) : Types::ReleaseSenderIdResult

        input = Types::ReleaseSenderIdRequest.new(iso_country_code: iso_country_code, sender_id: sender_id)
        release_sender_id(input)
      end

      def release_sender_id(input : Types::ReleaseSenderIdRequest) : Types::ReleaseSenderIdResult
        request = Protocol::JsonRpc.build_request(Model::RELEASE_SENDER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReleaseSenderIdResult, "ReleaseSenderId")
      end

      # Request an origination phone number for use in your account. For more information on phone number
      # request see Request a phone number in the End User Messaging SMS User Guide .

      def request_phone_number(
        iso_country_code : String,
        message_type : String,
        number_capabilities : Array(String),
        number_type : String,
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        international_sending_enabled : Bool? = nil,
        opt_out_list_name : String? = nil,
        pool_id : String? = nil,
        registration_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::RequestPhoneNumberResult

        input = Types::RequestPhoneNumberRequest.new(iso_country_code: iso_country_code, message_type: message_type, number_capabilities: number_capabilities, number_type: number_type, client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, international_sending_enabled: international_sending_enabled, opt_out_list_name: opt_out_list_name, pool_id: pool_id, registration_id: registration_id, tags: tags)
        request_phone_number(input)
      end

      def request_phone_number(input : Types::RequestPhoneNumberRequest) : Types::RequestPhoneNumberResult
        request = Protocol::JsonRpc.build_request(Model::REQUEST_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RequestPhoneNumberResult, "RequestPhoneNumber")
      end

      # Request a new sender ID that doesn't require registration.

      def request_sender_id(
        iso_country_code : String,
        sender_id : String,
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        message_types : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::RequestSenderIdResult

        input = Types::RequestSenderIdRequest.new(iso_country_code: iso_country_code, sender_id: sender_id, client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, message_types: message_types, tags: tags)
        request_sender_id(input)
      end

      def request_sender_id(input : Types::RequestSenderIdRequest) : Types::RequestSenderIdResult
        request = Protocol::JsonRpc.build_request(Model::REQUEST_SENDER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RequestSenderIdResult, "RequestSenderId")
      end

      # Before you can send test messages to a verified destination phone number you need to opt-in the
      # verified destination phone number. Creates a new text message with a verification code and send it
      # to a verified destination phone number. Once you have the verification code use
      # VerifyDestinationNumber to opt-in the verified destination phone number to receive messages.

      def send_destination_number_verification_code(
        verification_channel : String,
        verified_destination_number_id : String,
        configuration_set_name : String? = nil,
        context : Hash(String, String)? = nil,
        destination_country_parameters : Hash(String, String)? = nil,
        language_code : String? = nil,
        origination_identity : String? = nil
      ) : Types::SendDestinationNumberVerificationCodeResult

        input = Types::SendDestinationNumberVerificationCodeRequest.new(verification_channel: verification_channel, verified_destination_number_id: verified_destination_number_id, configuration_set_name: configuration_set_name, context: context, destination_country_parameters: destination_country_parameters, language_code: language_code, origination_identity: origination_identity)
        send_destination_number_verification_code(input)
      end

      def send_destination_number_verification_code(input : Types::SendDestinationNumberVerificationCodeRequest) : Types::SendDestinationNumberVerificationCodeResult
        request = Protocol::JsonRpc.build_request(Model::SEND_DESTINATION_NUMBER_VERIFICATION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendDestinationNumberVerificationCodeResult, "SendDestinationNumberVerificationCode")
      end

      # Creates a new multimedia message (MMS) and sends it to a recipient's phone number.

      def send_media_message(
        destination_phone_number : String,
        origination_identity : String,
        configuration_set_name : String? = nil,
        context : Hash(String, String)? = nil,
        dry_run : Bool? = nil,
        max_price : String? = nil,
        media_urls : Array(String)? = nil,
        message_body : String? = nil,
        message_feedback_enabled : Bool? = nil,
        protect_configuration_id : String? = nil,
        time_to_live : Int32? = nil
      ) : Types::SendMediaMessageResult

        input = Types::SendMediaMessageRequest.new(destination_phone_number: destination_phone_number, origination_identity: origination_identity, configuration_set_name: configuration_set_name, context: context, dry_run: dry_run, max_price: max_price, media_urls: media_urls, message_body: message_body, message_feedback_enabled: message_feedback_enabled, protect_configuration_id: protect_configuration_id, time_to_live: time_to_live)
        send_media_message(input)
      end

      def send_media_message(input : Types::SendMediaMessageRequest) : Types::SendMediaMessageResult
        request = Protocol::JsonRpc.build_request(Model::SEND_MEDIA_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendMediaMessageResult, "SendMediaMessage")
      end

      # Creates a new text message and sends it to a recipient's phone number. SendTextMessage only sends an
      # SMS message to one recipient each time it is invoked. SMS throughput limits are measured in Message
      # Parts per Second (MPS). Your MPS limit depends on the destination country of your messages, as well
      # as the type of phone number (origination number) that you use to send the message. For more
      # information about MPS, see Message Parts per Second (MPS) limits in the End User Messaging SMS User
      # Guide .

      def send_text_message(
        destination_phone_number : String,
        configuration_set_name : String? = nil,
        context : Hash(String, String)? = nil,
        destination_country_parameters : Hash(String, String)? = nil,
        dry_run : Bool? = nil,
        keyword : String? = nil,
        max_price : String? = nil,
        message_body : String? = nil,
        message_feedback_enabled : Bool? = nil,
        message_type : String? = nil,
        origination_identity : String? = nil,
        protect_configuration_id : String? = nil,
        time_to_live : Int32? = nil
      ) : Types::SendTextMessageResult

        input = Types::SendTextMessageRequest.new(destination_phone_number: destination_phone_number, configuration_set_name: configuration_set_name, context: context, destination_country_parameters: destination_country_parameters, dry_run: dry_run, keyword: keyword, max_price: max_price, message_body: message_body, message_feedback_enabled: message_feedback_enabled, message_type: message_type, origination_identity: origination_identity, protect_configuration_id: protect_configuration_id, time_to_live: time_to_live)
        send_text_message(input)
      end

      def send_text_message(input : Types::SendTextMessageRequest) : Types::SendTextMessageResult
        request = Protocol::JsonRpc.build_request(Model::SEND_TEXT_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendTextMessageResult, "SendTextMessage")
      end

      # Allows you to send a request that sends a voice message. This operation uses Amazon Polly to convert
      # a text script into a voice message.

      def send_voice_message(
        destination_phone_number : String,
        origination_identity : String,
        configuration_set_name : String? = nil,
        context : Hash(String, String)? = nil,
        dry_run : Bool? = nil,
        max_price_per_minute : String? = nil,
        message_body : String? = nil,
        message_body_text_type : String? = nil,
        message_feedback_enabled : Bool? = nil,
        protect_configuration_id : String? = nil,
        time_to_live : Int32? = nil,
        voice_id : String? = nil
      ) : Types::SendVoiceMessageResult

        input = Types::SendVoiceMessageRequest.new(destination_phone_number: destination_phone_number, origination_identity: origination_identity, configuration_set_name: configuration_set_name, context: context, dry_run: dry_run, max_price_per_minute: max_price_per_minute, message_body: message_body, message_body_text_type: message_body_text_type, message_feedback_enabled: message_feedback_enabled, protect_configuration_id: protect_configuration_id, time_to_live: time_to_live, voice_id: voice_id)
        send_voice_message(input)
      end

      def send_voice_message(input : Types::SendVoiceMessageRequest) : Types::SendVoiceMessageResult
        request = Protocol::JsonRpc.build_request(Model::SEND_VOICE_MESSAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendVoiceMessageResult, "SendVoiceMessage")
      end

      # Set a protect configuration as your account default. You can only have one account default protect
      # configuration at a time. The current account default protect configuration is replaced with the
      # provided protect configuration.

      def set_account_default_protect_configuration(
        protect_configuration_id : String
      ) : Types::SetAccountDefaultProtectConfigurationResult

        input = Types::SetAccountDefaultProtectConfigurationRequest.new(protect_configuration_id: protect_configuration_id)
        set_account_default_protect_configuration(input)
      end

      def set_account_default_protect_configuration(input : Types::SetAccountDefaultProtectConfigurationRequest) : Types::SetAccountDefaultProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::SET_ACCOUNT_DEFAULT_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetAccountDefaultProtectConfigurationResult, "SetAccountDefaultProtectConfiguration")
      end

      # Sets a configuration set's default for message feedback.

      def set_default_message_feedback_enabled(
        configuration_set_name : String,
        message_feedback_enabled : Bool
      ) : Types::SetDefaultMessageFeedbackEnabledResult

        input = Types::SetDefaultMessageFeedbackEnabledRequest.new(configuration_set_name: configuration_set_name, message_feedback_enabled: message_feedback_enabled)
        set_default_message_feedback_enabled(input)
      end

      def set_default_message_feedback_enabled(input : Types::SetDefaultMessageFeedbackEnabledRequest) : Types::SetDefaultMessageFeedbackEnabledResult
        request = Protocol::JsonRpc.build_request(Model::SET_DEFAULT_MESSAGE_FEEDBACK_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetDefaultMessageFeedbackEnabledResult, "SetDefaultMessageFeedbackEnabled")
      end

      # Sets the default message type on a configuration set. Choose the category of SMS messages that you
      # plan to send from this account. If you send account-related messages or time-sensitive messages such
      # as one-time passcodes, choose Transactional . If you plan to send messages that contain marketing
      # material or other promotional content, choose Promotional . This setting applies to your entire
      # Amazon Web Services account.

      def set_default_message_type(
        configuration_set_name : String,
        message_type : String
      ) : Types::SetDefaultMessageTypeResult

        input = Types::SetDefaultMessageTypeRequest.new(configuration_set_name: configuration_set_name, message_type: message_type)
        set_default_message_type(input)
      end

      def set_default_message_type(input : Types::SetDefaultMessageTypeRequest) : Types::SetDefaultMessageTypeResult
        request = Protocol::JsonRpc.build_request(Model::SET_DEFAULT_MESSAGE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetDefaultMessageTypeResult, "SetDefaultMessageType")
      end

      # Sets default sender ID on a configuration set. When sending a text message to a destination country
      # that supports sender IDs, the default sender ID on the configuration set specified will be used if
      # no dedicated origination phone numbers or registered sender IDs are available in your account.

      def set_default_sender_id(
        configuration_set_name : String,
        sender_id : String
      ) : Types::SetDefaultSenderIdResult

        input = Types::SetDefaultSenderIdRequest.new(configuration_set_name: configuration_set_name, sender_id: sender_id)
        set_default_sender_id(input)
      end

      def set_default_sender_id(input : Types::SetDefaultSenderIdRequest) : Types::SetDefaultSenderIdResult
        request = Protocol::JsonRpc.build_request(Model::SET_DEFAULT_SENDER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetDefaultSenderIdResult, "SetDefaultSenderId")
      end

      # Sets an account level monthly spend limit override for sending MMS messages. The requested spend
      # limit must be less than or equal to the MaxLimit , which is set by Amazon Web Services.

      def set_media_message_spend_limit_override(
        monthly_limit : Int64
      ) : Types::SetMediaMessageSpendLimitOverrideResult

        input = Types::SetMediaMessageSpendLimitOverrideRequest.new(monthly_limit: monthly_limit)
        set_media_message_spend_limit_override(input)
      end

      def set_media_message_spend_limit_override(input : Types::SetMediaMessageSpendLimitOverrideRequest) : Types::SetMediaMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::SET_MEDIA_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetMediaMessageSpendLimitOverrideResult, "SetMediaMessageSpendLimitOverride")
      end

      # Sets an account level monthly spend limit override for sending text messages. The requested spend
      # limit must be less than or equal to the MaxLimit , which is set by Amazon Web Services.

      def set_text_message_spend_limit_override(
        monthly_limit : Int64
      ) : Types::SetTextMessageSpendLimitOverrideResult

        input = Types::SetTextMessageSpendLimitOverrideRequest.new(monthly_limit: monthly_limit)
        set_text_message_spend_limit_override(input)
      end

      def set_text_message_spend_limit_override(input : Types::SetTextMessageSpendLimitOverrideRequest) : Types::SetTextMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::SET_TEXT_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetTextMessageSpendLimitOverrideResult, "SetTextMessageSpendLimitOverride")
      end

      # Sets an account level monthly spend limit override for sending voice messages. The requested spend
      # limit must be less than or equal to the MaxLimit , which is set by Amazon Web Services.

      def set_voice_message_spend_limit_override(
        monthly_limit : Int64
      ) : Types::SetVoiceMessageSpendLimitOverrideResult

        input = Types::SetVoiceMessageSpendLimitOverrideRequest.new(monthly_limit: monthly_limit)
        set_voice_message_spend_limit_override(input)
      end

      def set_voice_message_spend_limit_override(input : Types::SetVoiceMessageSpendLimitOverrideRequest) : Types::SetVoiceMessageSpendLimitOverrideResult
        request = Protocol::JsonRpc.build_request(Model::SET_VOICE_MESSAGE_SPEND_LIMIT_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetVoiceMessageSpendLimitOverrideResult, "SetVoiceMessageSpendLimitOverride")
      end

      # Submit the specified registration for review and approval.

      def submit_registration_version(
        registration_id : String,
        aws_review : Bool? = nil
      ) : Types::SubmitRegistrationVersionResult

        input = Types::SubmitRegistrationVersionRequest.new(registration_id: registration_id, aws_review: aws_review)
        submit_registration_version(input)
      end

      def submit_registration_version(input : Types::SubmitRegistrationVersionRequest) : Types::SubmitRegistrationVersionResult
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_REGISTRATION_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubmitRegistrationVersionResult, "SubmitRegistrationVersion")
      end

      # Adds or overwrites only the specified tags for the specified resource. When you specify an existing
      # tag key, the value is overwritten with the new value. Each tag consists of a key and an optional
      # value. Tag keys must be unique per resource. For more information about tags, see Tags in the End
      # User Messaging SMS User Guide .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResult

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResult
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResult, "TagResource")
      end

      # Removes the association of the specified tags from a resource. For more information on tags see Tags
      # in the End User Messaging SMS User Guide .

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResult

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResult
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResult, "UntagResource")
      end

      # Updates an existing event destination in a configuration set. You can update the IAM role ARN for
      # CloudWatch Logs and Firehose. You can also enable or disable the event destination. You may want to
      # update an event destination to change its matching event types or updating the destination resource
      # ARN. You can't change an event destination's type between CloudWatch Logs, Firehose, and Amazon SNS.

      def update_event_destination(
        configuration_set_name : String,
        event_destination_name : String,
        cloud_watch_logs_destination : Types::CloudWatchLogsDestination? = nil,
        enabled : Bool? = nil,
        kinesis_firehose_destination : Types::KinesisFirehoseDestination? = nil,
        matching_event_types : Array(String)? = nil,
        sns_destination : Types::SnsDestination? = nil
      ) : Types::UpdateEventDestinationResult

        input = Types::UpdateEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name, cloud_watch_logs_destination: cloud_watch_logs_destination, enabled: enabled, kinesis_firehose_destination: kinesis_firehose_destination, matching_event_types: matching_event_types, sns_destination: sns_destination)
        update_event_destination(input)
      end

      def update_event_destination(input : Types::UpdateEventDestinationRequest) : Types::UpdateEventDestinationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEventDestinationResult, "UpdateEventDestination")
      end

      # Updates the configuration of an existing origination phone number. You can update the opt-out list,
      # enable or disable two-way messaging, change the TwoWayChannelArn, enable or disable self-managed
      # opt-outs, and enable or disable deletion protection. If the origination phone number is associated
      # with a pool, an error is returned.

      def update_phone_number(
        phone_number_id : String,
        deletion_protection_enabled : Bool? = nil,
        international_sending_enabled : Bool? = nil,
        opt_out_list_name : String? = nil,
        self_managed_opt_outs_enabled : Bool? = nil,
        two_way_channel_arn : String? = nil,
        two_way_channel_role : String? = nil,
        two_way_enabled : Bool? = nil
      ) : Types::UpdatePhoneNumberResult

        input = Types::UpdatePhoneNumberRequest.new(phone_number_id: phone_number_id, deletion_protection_enabled: deletion_protection_enabled, international_sending_enabled: international_sending_enabled, opt_out_list_name: opt_out_list_name, self_managed_opt_outs_enabled: self_managed_opt_outs_enabled, two_way_channel_arn: two_way_channel_arn, two_way_channel_role: two_way_channel_role, two_way_enabled: two_way_enabled)
        update_phone_number(input)
      end

      def update_phone_number(input : Types::UpdatePhoneNumberRequest) : Types::UpdatePhoneNumberResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePhoneNumberResult, "UpdatePhoneNumber")
      end

      # Updates the configuration of an existing pool. You can update the opt-out list, enable or disable
      # two-way messaging, change the TwoWayChannelArn , enable or disable self-managed opt-outs, enable or
      # disable deletion protection, and enable or disable shared routes.

      def update_pool(
        pool_id : String,
        deletion_protection_enabled : Bool? = nil,
        opt_out_list_name : String? = nil,
        self_managed_opt_outs_enabled : Bool? = nil,
        shared_routes_enabled : Bool? = nil,
        two_way_channel_arn : String? = nil,
        two_way_channel_role : String? = nil,
        two_way_enabled : Bool? = nil
      ) : Types::UpdatePoolResult

        input = Types::UpdatePoolRequest.new(pool_id: pool_id, deletion_protection_enabled: deletion_protection_enabled, opt_out_list_name: opt_out_list_name, self_managed_opt_outs_enabled: self_managed_opt_outs_enabled, shared_routes_enabled: shared_routes_enabled, two_way_channel_arn: two_way_channel_arn, two_way_channel_role: two_way_channel_role, two_way_enabled: two_way_enabled)
        update_pool(input)
      end

      def update_pool(input : Types::UpdatePoolRequest) : Types::UpdatePoolResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePoolResult, "UpdatePool")
      end

      # Update the setting for an existing protect configuration.

      def update_protect_configuration(
        protect_configuration_id : String,
        deletion_protection_enabled : Bool? = nil
      ) : Types::UpdateProtectConfigurationResult

        input = Types::UpdateProtectConfigurationRequest.new(protect_configuration_id: protect_configuration_id, deletion_protection_enabled: deletion_protection_enabled)
        update_protect_configuration(input)
      end

      def update_protect_configuration(input : Types::UpdateProtectConfigurationRequest) : Types::UpdateProtectConfigurationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROTECT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProtectConfigurationResult, "UpdateProtectConfiguration")
      end

      # Update a country rule set to ALLOW , BLOCK , MONITOR , or FILTER messages to be sent to the
      # specified destination counties. You can update one or multiple countries at a time. The updates are
      # only applied to the specified NumberCapability type.

      def update_protect_configuration_country_rule_set(
        country_rule_set_updates : Hash(String, Types::ProtectConfigurationCountryRuleSetInformation),
        number_capability : String,
        protect_configuration_id : String
      ) : Types::UpdateProtectConfigurationCountryRuleSetResult

        input = Types::UpdateProtectConfigurationCountryRuleSetRequest.new(country_rule_set_updates: country_rule_set_updates, number_capability: number_capability, protect_configuration_id: protect_configuration_id)
        update_protect_configuration_country_rule_set(input)
      end

      def update_protect_configuration_country_rule_set(input : Types::UpdateProtectConfigurationCountryRuleSetRequest) : Types::UpdateProtectConfigurationCountryRuleSetResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROTECT_CONFIGURATION_COUNTRY_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProtectConfigurationCountryRuleSetResult, "UpdateProtectConfigurationCountryRuleSet")
      end

      # Updates the configuration of an existing sender ID.

      def update_sender_id(
        iso_country_code : String,
        sender_id : String,
        deletion_protection_enabled : Bool? = nil
      ) : Types::UpdateSenderIdResult

        input = Types::UpdateSenderIdRequest.new(iso_country_code: iso_country_code, sender_id: sender_id, deletion_protection_enabled: deletion_protection_enabled)
        update_sender_id(input)
      end

      def update_sender_id(input : Types::UpdateSenderIdRequest) : Types::UpdateSenderIdResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SENDER_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSenderIdResult, "UpdateSenderId")
      end

      # Use the verification code that was received by the verified destination phone number to opt-in the
      # verified destination phone number to receive more messages.

      def verify_destination_number(
        verification_code : String,
        verified_destination_number_id : String
      ) : Types::VerifyDestinationNumberResult

        input = Types::VerifyDestinationNumberRequest.new(verification_code: verification_code, verified_destination_number_id: verified_destination_number_id)
        verify_destination_number(input)
      end

      def verify_destination_number(input : Types::VerifyDestinationNumberRequest) : Types::VerifyDestinationNumberResult
        request = Protocol::JsonRpc.build_request(Model::VERIFY_DESTINATION_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::VerifyDestinationNumberResult, "VerifyDestinationNumber")
      end
    end
  end
end
