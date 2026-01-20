require "json"
require "time"

module AwsSdk
  module ChimeSDKVoice
    module Types

      # You don't have the permissions needed to run this action.

      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # A validated address.

      struct Address
        include JSON::Serializable

        # The city of an address.

        @[JSON::Field(key: "city")]
        getter city : String?

        # The country of an address.

        @[JSON::Field(key: "country")]
        getter country : String?

        # An address suffix location, such as the S. Unit A in Central Park S. Unit A .

        @[JSON::Field(key: "postDirectional")]
        getter post_directional : String?

        # The postal code of an address.

        @[JSON::Field(key: "postalCode")]
        getter postal_code : String?

        # The zip + 4 or postal code + 4 of an address.

        @[JSON::Field(key: "postalCodePlus4")]
        getter postal_code_plus4 : String?

        # An address prefix location, such as the N in N. Third St.

        @[JSON::Field(key: "preDirectional")]
        getter pre_directional : String?

        # The state of an address.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The address street, such as 8th Avenue .

        @[JSON::Field(key: "streetName")]
        getter street_name : String?

        # The numeric portion of an address.

        @[JSON::Field(key: "streetNumber")]
        getter street_number : String?

        # The address suffix, such as the N in 8th Avenue N .

        @[JSON::Field(key: "streetSuffix")]
        getter street_suffix : String?

        def initialize(
          @city : String? = nil,
          @country : String? = nil,
          @post_directional : String? = nil,
          @postal_code : String? = nil,
          @postal_code_plus4 : String? = nil,
          @pre_directional : String? = nil,
          @state : String? = nil,
          @street_name : String? = nil,
          @street_number : String? = nil,
          @street_suffix : String? = nil
        )
        end
      end


      struct AssociatePhoneNumbersWithVoiceConnectorGroupRequest
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The Amazon Chime SDK Voice Connector group ID.

        @[JSON::Field(key: "voiceConnectorGroupId")]
        getter voice_connector_group_id : String

        # If true, associates the provided phone numbers with the provided Amazon Chime SDK Voice Connector
        # Group and removes any previously existing associations. If false, does not associate any phone
        # numbers that have previously existing associations.

        @[JSON::Field(key: "ForceAssociate")]
        getter force_associate : Bool?

        def initialize(
          @e164_phone_numbers : Array(String),
          @voice_connector_group_id : String,
          @force_associate : Bool? = nil
        )
        end
      end


      struct AssociatePhoneNumbersWithVoiceConnectorGroupResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end


      struct AssociatePhoneNumbersWithVoiceConnectorRequest
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # If true, associates the provided phone numbers with the provided Amazon Chime SDK Voice Connector
        # and removes any previously existing associations. If false, does not associate any phone numbers
        # that have previously existing associations.

        @[JSON::Field(key: "ForceAssociate")]
        getter force_associate : Bool?

        def initialize(
          @e164_phone_numbers : Array(String),
          @voice_connector_id : String,
          @force_associate : Bool? = nil
        )
        end
      end


      struct AssociatePhoneNumbersWithVoiceConnectorResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end

      # The input parameters don't match the service's restrictions.

      struct BadRequestException
        include JSON::Serializable

        def initialize
        end
      end


      struct BatchDeletePhoneNumberRequest
        include JSON::Serializable

        # List of phone number IDs.

        @[JSON::Field(key: "PhoneNumberIds")]
        getter phone_number_ids : Array(String)

        def initialize(
          @phone_number_ids : Array(String)
        )
        end
      end


      struct BatchDeletePhoneNumberResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end


      struct BatchUpdatePhoneNumberRequest
        include JSON::Serializable

        # Lists the phone numbers in the update request.

        @[JSON::Field(key: "UpdatePhoneNumberRequestItems")]
        getter update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)

        def initialize(
          @update_phone_number_request_items : Array(Types::UpdatePhoneNumberRequestItem)
        )
        end
      end


      struct BatchUpdatePhoneNumberResponse
        include JSON::Serializable

        # A list of failed phone numbers and their error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end

      # The details of an Amazon Chime SDK Voice Connector call.

      struct CallDetails
        include JSON::Serializable

        # Identifies a person as the caller or the callee.

        @[JSON::Field(key: "IsCaller")]
        getter is_caller : Bool?

        # The transaction ID of a Voice Connector call.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String?

        def initialize(
          @is_caller : Bool? = nil,
          @transaction_id : String? = nil,
          @voice_connector_id : String? = nil
        )
        end
      end

      # A suggested address.

      struct CandidateAddress
        include JSON::Serializable

        # The city of the candidate address.

        @[JSON::Field(key: "city")]
        getter city : String?

        # The country of the candidate address.

        @[JSON::Field(key: "country")]
        getter country : String?

        # The postal code of the candidate address.

        @[JSON::Field(key: "postalCode")]
        getter postal_code : String?

        # The zip + 4 or postal code +4 of the candidate address.

        @[JSON::Field(key: "postalCodePlus4")]
        getter postal_code_plus4 : String?

        # The state of the candidate address.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The street information of the candidate address.

        @[JSON::Field(key: "streetInfo")]
        getter street_info : String?

        # The numeric portion of the candidate address.

        @[JSON::Field(key: "streetNumber")]
        getter street_number : String?

        def initialize(
          @city : String? = nil,
          @country : String? = nil,
          @postal_code : String? = nil,
          @postal_code_plus4 : String? = nil,
          @state : String? = nil,
          @street_info : String? = nil,
          @street_number : String? = nil
        )
        end
      end

      # Multiple instances of the same request were made simultaneously.

      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end


      struct CreatePhoneNumberOrderRequest
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The phone number product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String

        # Specifies the name assigned to one or more phone numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @e164_phone_numbers : Array(String),
          @product_type : String,
          @name : String? = nil
        )
        end
      end


      struct CreatePhoneNumberOrderResponse
        include JSON::Serializable

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrder")]
        getter phone_number_order : Types::PhoneNumberOrder?

        def initialize(
          @phone_number_order : Types::PhoneNumberOrder? = nil
        )
        end
      end


      struct CreateProxySessionRequest
        include JSON::Serializable

        # The proxy session's capabilities.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)

        # The participant phone numbers.

        @[JSON::Field(key: "ParticipantPhoneNumbers")]
        getter participant_phone_numbers : Array(String)

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # The number of minutes allowed for the proxy session.

        @[JSON::Field(key: "ExpiryMinutes")]
        getter expiry_minutes : Int32?

        # The preference for matching the country or area code of the proxy phone number with that of the
        # first participant.

        @[JSON::Field(key: "GeoMatchLevel")]
        getter geo_match_level : String?

        # The country and area code for the proxy phone number.

        @[JSON::Field(key: "GeoMatchParams")]
        getter geo_match_params : Types::GeoMatchParams?

        # The name of the proxy session.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The preference for proxy phone number reuse, or stickiness, between the same participants across
        # sessions.

        @[JSON::Field(key: "NumberSelectionBehavior")]
        getter number_selection_behavior : String?

        def initialize(
          @capabilities : Array(String),
          @participant_phone_numbers : Array(String),
          @voice_connector_id : String,
          @expiry_minutes : Int32? = nil,
          @geo_match_level : String? = nil,
          @geo_match_params : Types::GeoMatchParams? = nil,
          @name : String? = nil,
          @number_selection_behavior : String? = nil
        )
        end
      end


      struct CreateProxySessionResponse
        include JSON::Serializable

        # The proxy session details.

        @[JSON::Field(key: "ProxySession")]
        getter proxy_session : Types::ProxySession?

        def initialize(
          @proxy_session : Types::ProxySession? = nil
        )
        end
      end


      struct CreateSipMediaApplicationCallRequest
        include JSON::Serializable

        # The phone number that a user calls from. This is a phone number in your Amazon Chime SDK phone
        # number inventory.

        @[JSON::Field(key: "FromPhoneNumber")]
        getter from_phone_number : String

        # The ID of the SIP media application.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        # The phone number that the service should call.

        @[JSON::Field(key: "ToPhoneNumber")]
        getter to_phone_number : String

        # Context passed to a CreateSipMediaApplication API call. For example, you could pass key-value pairs
        # such as: "FirstName": "John", "LastName": "Doe"

        @[JSON::Field(key: "ArgumentsMap")]
        getter arguments_map : Hash(String, String)?

        # The SIP headers added to an outbound call leg.

        @[JSON::Field(key: "SipHeaders")]
        getter sip_headers : Hash(String, String)?

        def initialize(
          @from_phone_number : String,
          @sip_media_application_id : String,
          @to_phone_number : String,
          @arguments_map : Hash(String, String)? = nil,
          @sip_headers : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSipMediaApplicationCallResponse
        include JSON::Serializable

        # The actual call.

        @[JSON::Field(key: "SipMediaApplicationCall")]
        getter sip_media_application_call : Types::SipMediaApplicationCall?

        def initialize(
          @sip_media_application_call : Types::SipMediaApplicationCall? = nil
        )
        end
      end


      struct CreateSipMediaApplicationRequest
        include JSON::Serializable

        # The AWS Region assigned to the SIP media application.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String

        # List of endpoints (Lambda ARNs) specified for the SIP media application.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::SipMediaApplicationEndpoint)

        # The SIP media application's name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The tags assigned to the SIP media application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @aws_region : String,
          @endpoints : Array(Types::SipMediaApplicationEndpoint),
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSipMediaApplicationResponse
        include JSON::Serializable

        # The SIP media application details.

        @[JSON::Field(key: "SipMediaApplication")]
        getter sip_media_application : Types::SipMediaApplication?

        def initialize(
          @sip_media_application : Types::SipMediaApplication? = nil
        )
        end
      end


      struct CreateSipRuleRequest
        include JSON::Serializable

        # The name of the SIP rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of trigger assigned to the SIP rule in TriggerValue , currently RequestUriHostname or
        # ToPhoneNumber .

        @[JSON::Field(key: "TriggerType")]
        getter trigger_type : String

        # If TriggerType is RequestUriHostname , the value can be the outbound host name of a Voice Connector.
        # If TriggerType is ToPhoneNumber , the value can be a customer-owned phone number in the E164 format.
        # The SipMediaApplication specified in the SipRule is triggered if the request URI in an incoming SIP
        # request matches the RequestUriHostname , or if the To header in the incoming SIP request matches the
        # ToPhoneNumber value.

        @[JSON::Field(key: "TriggerValue")]
        getter trigger_value : String

        # Disables or enables a SIP rule. You must disable SIP rules before you can delete them.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # List of SIP media applications, with priority and AWS Region. Only one SIP application per AWS
        # Region can be used.

        @[JSON::Field(key: "TargetApplications")]
        getter target_applications : Array(Types::SipRuleTargetApplication)?

        def initialize(
          @name : String,
          @trigger_type : String,
          @trigger_value : String,
          @disabled : Bool? = nil,
          @target_applications : Array(Types::SipRuleTargetApplication)? = nil
        )
        end
      end


      struct CreateSipRuleResponse
        include JSON::Serializable

        # The SIP rule information, including the rule ID, triggers, and target applications.

        @[JSON::Field(key: "SipRule")]
        getter sip_rule : Types::SipRule?

        def initialize(
          @sip_rule : Types::SipRule? = nil
        )
        end
      end


      struct CreateVoiceConnectorGroupRequest
        include JSON::Serializable

        # The name of the Voice Connector group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Lists the Voice Connectors that inbound calls are routed to.

        @[JSON::Field(key: "VoiceConnectorItems")]
        getter voice_connector_items : Array(Types::VoiceConnectorItem)?

        def initialize(
          @name : String,
          @voice_connector_items : Array(Types::VoiceConnectorItem)? = nil
        )
        end
      end


      struct CreateVoiceConnectorGroupResponse
        include JSON::Serializable

        # The details of the Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorGroup")]
        getter voice_connector_group : Types::VoiceConnectorGroup?

        def initialize(
          @voice_connector_group : Types::VoiceConnectorGroup? = nil
        )
        end
      end


      struct CreateVoiceConnectorRequest
        include JSON::Serializable

        # The name of the Voice Connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Enables or disables encryption for the Voice Connector.

        @[JSON::Field(key: "RequireEncryption")]
        getter require_encryption : Bool

        # The AWS Region in which the Amazon Chime SDK Voice Connector is created. Default value: us-east-1 .

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The connectors for use with Amazon Connect. The following options are available:
        # CONNECT_CALL_TRANSFER_CONNECTOR - Enables enterprises to integrate Amazon Connect with other voice
        # systems to directly transfer voice calls and metadata without using the public telephone network.
        # They can use Amazon Connect telephony and Interactive Voice Response (IVR) with their existing voice
        # systems to modernize the IVR experience of their existing contact center and their enterprise and
        # branch voice systems. Additionally, enterprises migrating their contact center to Amazon Connect can
        # start with Connect telephony and IVR for immediate modernization ahead of agent migration.
        # CONNECT_ANALYTICS_CONNECTOR - Enables enterprises to integrate Amazon Connect with other voice
        # systems for real-time and post-call analytics. They can use Amazon Connect Contact Lens with their
        # existing voice systems to provides call recordings, conversational analytics (including contact
        # transcript, sensitive data redaction, content categorization, theme detection, sentiment analysis,
        # real-time alerts, and post-contact summary), and agent performance evaluations (including evaluation
        # forms, automated evaluation, supervisor review) with a rich user experience to display, search and
        # filter customer interactions, and programmatic access to data streams and the data lake.
        # Additionally, enterprises migrating their contact center to Amazon Connect can start with Contact
        # Lens analytics and performance insights ahead of agent migration.

        @[JSON::Field(key: "IntegrationType")]
        getter integration_type : String?

        # The type of network for the Voice Connector. Either IPv4 only or dual-stack (IPv4 and IPv6).

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The tags assigned to the Voice Connector.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @require_encryption : Bool,
          @aws_region : String? = nil,
          @integration_type : String? = nil,
          @network_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateVoiceConnectorResponse
        include JSON::Serializable

        # The details of the Voice Connector.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnector?

        def initialize(
          @voice_connector : Types::VoiceConnector? = nil
        )
        end
      end


      struct CreateVoiceProfileDomainRequest
        include JSON::Serializable

        # The name of the voice profile domain.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The server-side encryption configuration for the request.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration

        # The unique identifier for the client request. Use a different token for different domain creation
        # requests.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A description of the voice profile domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags assigned to the domain.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateVoiceProfileDomainResponse
        include JSON::Serializable

        # The requested voice profile domain.

        @[JSON::Field(key: "VoiceProfileDomain")]
        getter voice_profile_domain : Types::VoiceProfileDomain?

        def initialize(
          @voice_profile_domain : Types::VoiceProfileDomain? = nil
        )
        end
      end


      struct CreateVoiceProfileRequest
        include JSON::Serializable

        # The ID of the speaker search task.

        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String

        def initialize(
          @speaker_search_task_id : String
        )
        end
      end


      struct CreateVoiceProfileResponse
        include JSON::Serializable

        # The requested voice profile.

        @[JSON::Field(key: "VoiceProfile")]
        getter voice_profile : Types::VoiceProfile?

        def initialize(
          @voice_profile : Types::VoiceProfile? = nil
        )
        end
      end

      # The SIP credentials used to authenticate requests to an Amazon Chime SDK Voice Connector.

      struct Credential
        include JSON::Serializable

        # The RFC2617 compliant password associated with the SIP credentials, in US-ASCII format.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The RFC2617 compliant user name associated with the SIP credentials, in US-ASCII format.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The Dialed Number Identification Service (DNIS) emergency calling configuration details associated
      # with an Amazon Chime SDK Voice Connector's emergency calling configuration.

      struct DNISEmergencyCallingConfiguration
        include JSON::Serializable

        # The country from which emergency calls are allowed, in ISO 3166-1 alpha-2 format.

        @[JSON::Field(key: "CallingCountry")]
        getter calling_country : String

        # The DNIS phone number that you route emergency calls to, in E.164 format.

        @[JSON::Field(key: "EmergencyPhoneNumber")]
        getter emergency_phone_number : String

        # The DNIS phone number for routing test emergency calls to, in E.164 format.

        @[JSON::Field(key: "TestPhoneNumber")]
        getter test_phone_number : String?

        def initialize(
          @calling_country : String,
          @emergency_phone_number : String,
          @test_phone_number : String? = nil
        )
        end
      end


      struct DeletePhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct DeleteProxySessionRequest
        include JSON::Serializable

        # The proxy session ID.

        @[JSON::Field(key: "proxySessionId")]
        getter proxy_session_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @proxy_session_id : String,
          @voice_connector_id : String
        )
        end
      end


      struct DeleteSipMediaApplicationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        def initialize(
          @sip_media_application_id : String
        )
        end
      end


      struct DeleteSipRuleRequest
        include JSON::Serializable

        # The SIP rule ID.

        @[JSON::Field(key: "sipRuleId")]
        getter sip_rule_id : String

        def initialize(
          @sip_rule_id : String
        )
        end
      end


      struct DeleteVoiceConnectorEmergencyCallingConfigurationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorExternalSystemsConfigurationRequest
        include JSON::Serializable

        # The ID of the Voice Connector for which to delete the external system configuration.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorGroupRequest
        include JSON::Serializable

        # The Voice Connector Group ID.

        @[JSON::Field(key: "voiceConnectorGroupId")]
        getter voice_connector_group_id : String

        def initialize(
          @voice_connector_group_id : String
        )
        end
      end


      struct DeleteVoiceConnectorOriginationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorProxyRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorStreamingConfigurationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorTerminationCredentialsRequest
        include JSON::Serializable

        # The RFC2617 compliant username associated with the SIP credentials, in US-ASCII format.

        @[JSON::Field(key: "Usernames")]
        getter usernames : Array(String)

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @usernames : Array(String),
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceConnectorTerminationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct DeleteVoiceProfileDomainRequest
        include JSON::Serializable

        # The voice profile domain ID.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String

        def initialize(
          @voice_profile_domain_id : String
        )
        end
      end


      struct DeleteVoiceProfileRequest
        include JSON::Serializable

        # The voice profile ID.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String

        def initialize(
          @voice_profile_id : String
        )
        end
      end


      struct DisassociatePhoneNumbersFromVoiceConnectorGroupRequest
        include JSON::Serializable

        # The list of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The Voice Connector group ID.

        @[JSON::Field(key: "voiceConnectorGroupId")]
        getter voice_connector_group_id : String

        def initialize(
          @e164_phone_numbers : Array(String),
          @voice_connector_group_id : String
        )
        end
      end


      struct DisassociatePhoneNumbersFromVoiceConnectorGroupResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end


      struct DisassociatePhoneNumbersFromVoiceConnectorRequest
        include JSON::Serializable

        # List of phone numbers, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @e164_phone_numbers : Array(String),
          @voice_connector_id : String
        )
        end
      end


      struct DisassociatePhoneNumbersFromVoiceConnectorResponse
        include JSON::Serializable

        # If the action fails for one or more of the phone numbers in the request, a list of the phone numbers
        # is returned, along with error codes and error messages.

        @[JSON::Field(key: "PhoneNumberErrors")]
        getter phone_number_errors : Array(Types::PhoneNumberError)?

        def initialize(
          @phone_number_errors : Array(Types::PhoneNumberError)? = nil
        )
        end
      end

      # The emergency calling configuration details associated with an Amazon Chime SDK Voice Connector.

      struct EmergencyCallingConfiguration
        include JSON::Serializable

        # The Dialed Number Identification Service (DNIS) emergency calling configuration details.

        @[JSON::Field(key: "DNIS")]
        getter dnis : Array(Types::DNISEmergencyCallingConfiguration)?

        def initialize(
          @dnis : Array(Types::DNISEmergencyCallingConfiguration)? = nil
        )
        end
      end

      # Contains information about an external systems configuration for a Voice Connector.

      struct ExternalSystemsConfiguration
        include JSON::Serializable

        # The contact center system.

        @[JSON::Field(key: "ContactCenterSystemTypes")]
        getter contact_center_system_types : Array(String)?

        # The session border controllers.

        @[JSON::Field(key: "SessionBorderControllerTypes")]
        getter session_border_controller_types : Array(String)?

        def initialize(
          @contact_center_system_types : Array(String)? = nil,
          @session_border_controller_types : Array(String)? = nil
        )
        end
      end

      # The client is permanently forbidden from making the request.

      struct ForbiddenException
        include JSON::Serializable

        def initialize
        end
      end

      # The country and area code for a proxy phone number in a proxy phone session.

      struct GeoMatchParams
        include JSON::Serializable

        # The area code.

        @[JSON::Field(key: "AreaCode")]
        getter area_code : String

        # The country.

        @[JSON::Field(key: "Country")]
        getter country : String

        def initialize(
          @area_code : String,
          @country : String
        )
        end
      end


      struct GetGlobalSettingsResponse
        include JSON::Serializable

        # The Voice Connector settings.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnectorSettings?

        def initialize(
          @voice_connector : Types::VoiceConnectorSettings? = nil
        )
        end
      end


      struct GetPhoneNumberOrderRequest
        include JSON::Serializable

        # The ID of the phone number order .

        @[JSON::Field(key: "phoneNumberOrderId")]
        getter phone_number_order_id : String

        def initialize(
          @phone_number_order_id : String
        )
        end
      end


      struct GetPhoneNumberOrderResponse
        include JSON::Serializable

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrder")]
        getter phone_number_order : Types::PhoneNumberOrder?

        def initialize(
          @phone_number_order : Types::PhoneNumberOrder? = nil
        )
        end
      end


      struct GetPhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct GetPhoneNumberResponse
        include JSON::Serializable

        # The phone number details.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end


      struct GetPhoneNumberSettingsResponse
        include JSON::Serializable

        # The default outbound calling name for the account.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The updated outbound calling name timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CallingNameUpdatedTimestamp")]
        getter calling_name_updated_timestamp : Time?

        def initialize(
          @calling_name : String? = nil,
          @calling_name_updated_timestamp : Time? = nil
        )
        end
      end


      struct GetProxySessionRequest
        include JSON::Serializable

        # The proxy session ID.

        @[JSON::Field(key: "proxySessionId")]
        getter proxy_session_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @proxy_session_id : String,
          @voice_connector_id : String
        )
        end
      end


      struct GetProxySessionResponse
        include JSON::Serializable

        # The proxy session details.

        @[JSON::Field(key: "ProxySession")]
        getter proxy_session : Types::ProxySession?

        def initialize(
          @proxy_session : Types::ProxySession? = nil
        )
        end
      end


      struct GetSipMediaApplicationAlexaSkillConfigurationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        def initialize(
          @sip_media_application_id : String
        )
        end
      end


      struct GetSipMediaApplicationAlexaSkillConfigurationResponse
        include JSON::Serializable

        # Returns the Alexa Skill configuration.

        @[JSON::Field(key: "SipMediaApplicationAlexaSkillConfiguration")]
        getter sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration?

        def initialize(
          @sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration? = nil
        )
        end
      end


      struct GetSipMediaApplicationLoggingConfigurationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        def initialize(
          @sip_media_application_id : String
        )
        end
      end


      struct GetSipMediaApplicationLoggingConfigurationResponse
        include JSON::Serializable

        # The actual logging configuration.

        @[JSON::Field(key: "SipMediaApplicationLoggingConfiguration")]
        getter sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration?

        def initialize(
          @sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration? = nil
        )
        end
      end


      struct GetSipMediaApplicationRequest
        include JSON::Serializable

        # The SIP media application ID .

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        def initialize(
          @sip_media_application_id : String
        )
        end
      end


      struct GetSipMediaApplicationResponse
        include JSON::Serializable

        # The details of the SIP media application.

        @[JSON::Field(key: "SipMediaApplication")]
        getter sip_media_application : Types::SipMediaApplication?

        def initialize(
          @sip_media_application : Types::SipMediaApplication? = nil
        )
        end
      end


      struct GetSipRuleRequest
        include JSON::Serializable

        # The SIP rule ID.

        @[JSON::Field(key: "sipRuleId")]
        getter sip_rule_id : String

        def initialize(
          @sip_rule_id : String
        )
        end
      end


      struct GetSipRuleResponse
        include JSON::Serializable

        # The SIP rule details.

        @[JSON::Field(key: "SipRule")]
        getter sip_rule : Types::SipRule?

        def initialize(
          @sip_rule : Types::SipRule? = nil
        )
        end
      end


      struct GetSpeakerSearchTaskRequest
        include JSON::Serializable

        # The ID of the speaker search task.

        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @speaker_search_task_id : String,
          @voice_connector_id : String
        )
        end
      end


      struct GetSpeakerSearchTaskResponse
        include JSON::Serializable

        # The details of the speaker search task.

        @[JSON::Field(key: "SpeakerSearchTask")]
        getter speaker_search_task : Types::SpeakerSearchTask?

        def initialize(
          @speaker_search_task : Types::SpeakerSearchTask? = nil
        )
        end
      end


      struct GetVoiceConnectorEmergencyCallingConfigurationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorEmergencyCallingConfigurationResponse
        include JSON::Serializable

        # The details of the emergency calling configuration.

        @[JSON::Field(key: "EmergencyCallingConfiguration")]
        getter emergency_calling_configuration : Types::EmergencyCallingConfiguration?

        def initialize(
          @emergency_calling_configuration : Types::EmergencyCallingConfiguration? = nil
        )
        end
      end


      struct GetVoiceConnectorExternalSystemsConfigurationRequest
        include JSON::Serializable

        # The ID of the Voice Connector for which to return information about the external system
        # configuration.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorExternalSystemsConfigurationResponse
        include JSON::Serializable

        # An object that contains information about an external systems configuration for a Voice Connector.

        @[JSON::Field(key: "ExternalSystemsConfiguration")]
        getter external_systems_configuration : Types::ExternalSystemsConfiguration?

        def initialize(
          @external_systems_configuration : Types::ExternalSystemsConfiguration? = nil
        )
        end
      end


      struct GetVoiceConnectorGroupRequest
        include JSON::Serializable

        # The Voice Connector group ID.

        @[JSON::Field(key: "voiceConnectorGroupId")]
        getter voice_connector_group_id : String

        def initialize(
          @voice_connector_group_id : String
        )
        end
      end


      struct GetVoiceConnectorGroupResponse
        include JSON::Serializable

        # The details of the Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorGroup")]
        getter voice_connector_group : Types::VoiceConnectorGroup?

        def initialize(
          @voice_connector_group : Types::VoiceConnectorGroup? = nil
        )
        end
      end


      struct GetVoiceConnectorLoggingConfigurationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorLoggingConfigurationResponse
        include JSON::Serializable

        # The logging configuration details .

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end


      struct GetVoiceConnectorOriginationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorOriginationResponse
        include JSON::Serializable

        # The origination setting details.

        @[JSON::Field(key: "Origination")]
        getter origination : Types::Origination?

        def initialize(
          @origination : Types::Origination? = nil
        )
        end
      end


      struct GetVoiceConnectorProxyRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorProxyResponse
        include JSON::Serializable

        # The proxy configuration details.

        @[JSON::Field(key: "Proxy")]
        getter proxy : Types::Proxy?

        def initialize(
          @proxy : Types::Proxy? = nil
        )
        end
      end


      struct GetVoiceConnectorRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorResponse
        include JSON::Serializable

        # The Voice Connector details.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnector?

        def initialize(
          @voice_connector : Types::VoiceConnector? = nil
        )
        end
      end


      struct GetVoiceConnectorStreamingConfigurationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorStreamingConfigurationResponse
        include JSON::Serializable

        # The details of the streaming configuration.

        @[JSON::Field(key: "StreamingConfiguration")]
        getter streaming_configuration : Types::StreamingConfiguration?

        def initialize(
          @streaming_configuration : Types::StreamingConfiguration? = nil
        )
        end
      end


      struct GetVoiceConnectorTerminationHealthRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorTerminationHealthResponse
        include JSON::Serializable

        # The termination health details.

        @[JSON::Field(key: "TerminationHealth")]
        getter termination_health : Types::TerminationHealth?

        def initialize(
          @termination_health : Types::TerminationHealth? = nil
        )
        end
      end


      struct GetVoiceConnectorTerminationRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct GetVoiceConnectorTerminationResponse
        include JSON::Serializable

        # The termination setting details.

        @[JSON::Field(key: "Termination")]
        getter termination : Types::Termination?

        def initialize(
          @termination : Types::Termination? = nil
        )
        end
      end


      struct GetVoiceProfileDomainRequest
        include JSON::Serializable

        # The voice profile domain ID.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String

        def initialize(
          @voice_profile_domain_id : String
        )
        end
      end


      struct GetVoiceProfileDomainResponse
        include JSON::Serializable

        # The details of the voice profile domain.

        @[JSON::Field(key: "VoiceProfileDomain")]
        getter voice_profile_domain : Types::VoiceProfileDomain?

        def initialize(
          @voice_profile_domain : Types::VoiceProfileDomain? = nil
        )
        end
      end


      struct GetVoiceProfileRequest
        include JSON::Serializable

        # The voice profile ID.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String

        def initialize(
          @voice_profile_id : String
        )
        end
      end


      struct GetVoiceProfileResponse
        include JSON::Serializable

        # The voice profile details.

        @[JSON::Field(key: "VoiceProfile")]
        getter voice_profile : Types::VoiceProfile?

        def initialize(
          @voice_profile : Types::VoiceProfile? = nil
        )
        end
      end


      struct GetVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # Specifies whether the voice being analyzed is the caller (originator) or the callee (responder).

        @[JSON::Field(key: "isCaller")]
        getter is_caller : Bool

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        # The ID of the voice tone analysis task.

        @[JSON::Field(key: "VoiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String

        def initialize(
          @is_caller : Bool,
          @voice_connector_id : String,
          @voice_tone_analysis_task_id : String
        )
        end
      end


      struct GetVoiceToneAnalysisTaskResponse
        include JSON::Serializable

        # The details of the voice tone analysis task.

        @[JSON::Field(key: "VoiceToneAnalysisTask")]
        getter voice_tone_analysis_task : Types::VoiceToneAnalysisTask?

        def initialize(
          @voice_tone_analysis_task : Types::VoiceToneAnalysisTask? = nil
        )
        end
      end

      # Access to the target resource is no longer available at the origin server. This condition is likely
      # to be permanent.

      struct GoneException
        include JSON::Serializable

        def initialize
        end
      end


      struct ListAvailableVoiceConnectorRegionsResponse
        include JSON::Serializable

        # The list of AWS Regions.

        @[JSON::Field(key: "VoiceConnectorRegions")]
        getter voice_connector_regions : Array(String)?

        def initialize(
          @voice_connector_regions : Array(String)? = nil
        )
        end
      end


      struct ListPhoneNumberOrdersRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPhoneNumberOrdersResponse
        include JSON::Serializable

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The phone number order details.

        @[JSON::Field(key: "PhoneNumberOrders")]
        getter phone_number_orders : Array(Types::PhoneNumberOrder)?

        def initialize(
          @next_token : String? = nil,
          @phone_number_orders : Array(Types::PhoneNumberOrder)? = nil
        )
        end
      end


      struct ListPhoneNumbersRequest
        include JSON::Serializable

        # The filter to limit the number of results.

        @[JSON::Field(key: "filter-name")]
        getter filter_name : String?

        # The filter value.

        @[JSON::Field(key: "filter-value")]
        getter filter_value : String?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The phone number product types.

        @[JSON::Field(key: "product-type")]
        getter product_type : String?

        # The status of your organization's phone numbers.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @filter_name : String? = nil,
          @filter_value : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListPhoneNumbersResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The phone number details.

        @[JSON::Field(key: "PhoneNumbers")]
        getter phone_numbers : Array(Types::PhoneNumber)?

        def initialize(
          @next_token : String? = nil,
          @phone_numbers : Array(Types::PhoneNumber)? = nil
        )
        end
      end


      struct ListProxySessionsRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The proxy session status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @voice_connector_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListProxySessionsResponse
        include JSON::Serializable

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The proxy sessions' details.

        @[JSON::Field(key: "ProxySessions")]
        getter proxy_sessions : Array(Types::ProxySession)?

        def initialize(
          @next_token : String? = nil,
          @proxy_sessions : Array(Types::ProxySession)? = nil
        )
        end
      end


      struct ListSipMediaApplicationsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. Defaults to 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSipMediaApplicationsResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of SIP media applications and application details.

        @[JSON::Field(key: "SipMediaApplications")]
        getter sip_media_applications : Array(Types::SipMediaApplication)?

        def initialize(
          @next_token : String? = nil,
          @sip_media_applications : Array(Types::SipMediaApplication)? = nil
        )
        end
      end


      struct ListSipRulesRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call. Defaults to 100.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # The SIP media application ID.

        @[JSON::Field(key: "sip-media-application")]
        getter sip_media_application_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sip_media_application_id : String? = nil
        )
        end
      end


      struct ListSipRulesResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of SIP rules and details.

        @[JSON::Field(key: "SipRules")]
        getter sip_rules : Array(Types::SipRule)?

        def initialize(
          @next_token : String? = nil,
          @sip_rules : Array(Types::SipRule)? = nil
        )
        end
      end


      struct ListSupportedPhoneNumberCountriesRequest
        include JSON::Serializable

        # The phone number product type.

        @[JSON::Field(key: "product-type")]
        getter product_type : String

        def initialize(
          @product_type : String
        )
        end
      end


      struct ListSupportedPhoneNumberCountriesResponse
        include JSON::Serializable

        # The supported phone number countries.

        @[JSON::Field(key: "PhoneNumberCountries")]
        getter phone_number_countries : Array(Types::PhoneNumberCountry)?

        def initialize(
          @phone_number_countries : Array(Types::PhoneNumberCountry)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags in the list.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListVoiceConnectorGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVoiceConnectorGroupsResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The details of the Voice Connector groups.

        @[JSON::Field(key: "VoiceConnectorGroups")]
        getter voice_connector_groups : Array(Types::VoiceConnectorGroup)?

        def initialize(
          @next_token : String? = nil,
          @voice_connector_groups : Array(Types::VoiceConnectorGroup)? = nil
        )
        end
      end


      struct ListVoiceConnectorTerminationCredentialsRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @voice_connector_id : String
        )
        end
      end


      struct ListVoiceConnectorTerminationCredentialsResponse
        include JSON::Serializable

        # A list of user names.

        @[JSON::Field(key: "Usernames")]
        getter usernames : Array(String)?

        def initialize(
          @usernames : Array(String)? = nil
        )
        end
      end


      struct ListVoiceConnectorsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVoiceConnectorsResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The details of the Voice Connectors.

        @[JSON::Field(key: "VoiceConnectors")]
        getter voice_connectors : Array(Types::VoiceConnector)?

        def initialize(
          @next_token : String? = nil,
          @voice_connectors : Array(Types::VoiceConnector)? = nil
        )
        end
      end


      struct ListVoiceProfileDomainsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVoiceProfileDomainsResponse
        include JSON::Serializable

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of voice profile domains.

        @[JSON::Field(key: "VoiceProfileDomains")]
        getter voice_profile_domains : Array(Types::VoiceProfileDomainSummary)?

        def initialize(
          @next_token : String? = nil,
          @voice_profile_domains : Array(Types::VoiceProfileDomainSummary)? = nil
        )
        end
      end


      struct ListVoiceProfilesRequest
        include JSON::Serializable

        # The ID of the voice profile domain.

        @[JSON::Field(key: "voice-profile-domain-id")]
        getter voice_profile_domain_id : String

        # The maximum number of results in the request.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @voice_profile_domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVoiceProfilesResponse
        include JSON::Serializable

        # The token used to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of voice profiles.

        @[JSON::Field(key: "VoiceProfiles")]
        getter voice_profiles : Array(Types::VoiceProfileSummary)?

        def initialize(
          @next_token : String? = nil,
          @voice_profiles : Array(Types::VoiceProfileSummary)? = nil
        )
        end
      end

      # The logging configuration associated with an Amazon Chime SDK Voice Connector. Specifies whether SIP
      # message logs can be sent to Amazon CloudWatch Logs.

      struct LoggingConfiguration
        include JSON::Serializable

        # Enables or disables media metrics logging.

        @[JSON::Field(key: "EnableMediaMetricLogs")]
        getter enable_media_metric_logs : Bool?

        # Boolean that enables sending SIP message logs to Amazon CloudWatch.

        @[JSON::Field(key: "EnableSIPLogs")]
        getter enable_sip_logs : Bool?

        def initialize(
          @enable_media_metric_logs : Bool? = nil,
          @enable_sip_logs : Bool? = nil
        )
        end
      end

      # The configuration for a call analytics task.

      struct MediaInsightsConfiguration
        include JSON::Serializable

        # The configuration's ARN.

        @[JSON::Field(key: "ConfigurationArn")]
        getter configuration_arn : String?

        # Denotes the configuration as enabled or disabled.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        def initialize(
          @configuration_arn : String? = nil,
          @disabled : Bool? = nil
        )
        end
      end

      # The requested resource couldn't be found.

      struct NotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # A phone number for which an order has been placed.

      struct OrderedPhoneNumber
        include JSON::Serializable

        # The phone number, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String?

        # The phone number status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @e164_phone_number : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Origination settings enable your SIP hosts to receive inbound calls using your Amazon Chime SDK
      # Voice Connector. The parameters listed below are not required, but you must use at least one.

      struct Origination
        include JSON::Serializable

        # When origination settings are disabled, inbound calls are not enabled for your Amazon Chime SDK
        # Voice Connector. This parameter is not required, but you must specify this parameter or Routes .

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The call distribution properties defined for your SIP hosts. Valid range: Minimum value of 1.
        # Maximum value of 20. This parameter is not required, but you must specify this parameter or Disabled
        # .

        @[JSON::Field(key: "Routes")]
        getter routes : Array(Types::OriginationRoute)?

        def initialize(
          @disabled : Bool? = nil,
          @routes : Array(Types::OriginationRoute)? = nil
        )
        end
      end

      # Origination routes define call distribution properties for your SIP hosts to receive inbound calls
      # using an Amazon Chime SDK Voice Connector. Limit: Ten origination routes for each Voice Connector.
      # The parameters listed below are not required, but you must use at least one.

      struct OriginationRoute
        include JSON::Serializable

        # The FQDN or IP address to contact for origination traffic.

        @[JSON::Field(key: "Host")]
        getter host : String?

        # The designated origination route port. Defaults to 5060.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The priority associated with the host, with 1 being the highest priority. Higher priority hosts are
        # attempted first.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The protocol to use for the origination route. Encryption-enabled Amazon Chime SDK Voice Connectors
        # use TCP protocol by default.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The weight assigned to an origination route. When hosts have equal priority, calls are distributed
        # between them based on their relative weights.

        @[JSON::Field(key: "Weight")]
        getter weight : Int32?

        def initialize(
          @host : String? = nil,
          @port : Int32? = nil,
          @priority : Int32? = nil,
          @protocol : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # The phone number and proxy phone number for a participant in an Amazon Chime SDK Voice Connector
      # proxy session.

      struct Participant
        include JSON::Serializable

        # The participant's phone number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The participant's proxy phone number.

        @[JSON::Field(key: "ProxyPhoneNumber")]
        getter proxy_phone_number : String?

        def initialize(
          @phone_number : String? = nil,
          @proxy_phone_number : String? = nil
        )
        end
      end

      # A phone number used to call an Amazon Chime SDK Voice Connector.

      struct PhoneNumber
        include JSON::Serializable

        # The phone number's associations.

        @[JSON::Field(key: "Associations")]
        getter associations : Array(Types::PhoneNumberAssociation)?

        # The outbound calling name associated with the phone number.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The outbound calling name status.

        @[JSON::Field(key: "CallingNameStatus")]
        getter calling_name_status : String?

        # The phone number's capabilities.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::PhoneNumberCapabilities?

        # The phone number's country. Format: ISO 3166-1 alpha-2.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The phone number creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The deleted phone number timestamp, in ISO 8601 format.

        @[JSON::Field(key: "DeletionTimestamp")]
        getter deletion_timestamp : Time?

        # The phone number, in E.164 format.

        @[JSON::Field(key: "E164PhoneNumber")]
        getter e164_phone_number : String?

        # The name of the phone number.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The phone number's order ID.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # The phone number's ID.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        # The phone number's product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        # The phone number's status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The phone number's type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The updated phone number timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @associations : Array(Types::PhoneNumberAssociation)? = nil,
          @calling_name : String? = nil,
          @calling_name_status : String? = nil,
          @capabilities : Types::PhoneNumberCapabilities? = nil,
          @country : String? = nil,
          @created_timestamp : Time? = nil,
          @deletion_timestamp : Time? = nil,
          @e164_phone_number : String? = nil,
          @name : String? = nil,
          @order_id : String? = nil,
          @phone_number_id : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The phone number associations, such as an Amazon Chime SDK account ID, user ID, Voice Connector ID,
      # or Voice Connector group ID.

      struct PhoneNumberAssociation
        include JSON::Serializable

        # The timestamp of the phone number association, in ISO 8601 format.

        @[JSON::Field(key: "AssociatedTimestamp")]
        getter associated_timestamp : Time?

        # Defines the association with an Amazon Chime SDK account ID, user ID, Voice Connector ID, or Voice
        # Connector group ID.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Contains the ID for the entity specified in Name.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @associated_timestamp : Time? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The phone number capabilities for Amazon Chime SDK phone numbers, such as enabled inbound and
      # outbound calling, and text messaging.

      struct PhoneNumberCapabilities
        include JSON::Serializable

        # Allows or denies inbound calling for the specified phone number.

        @[JSON::Field(key: "InboundCall")]
        getter inbound_call : Bool?

        # Allows or denies inbound MMS messaging for the specified phone number.

        @[JSON::Field(key: "InboundMMS")]
        getter inbound_mms : Bool?

        # Allows or denies inbound SMS messaging for the specified phone number.

        @[JSON::Field(key: "InboundSMS")]
        getter inbound_sms : Bool?

        # Allows or denies outbound calling for the specified phone number.

        @[JSON::Field(key: "OutboundCall")]
        getter outbound_call : Bool?

        # Allows or denies inbound MMS messaging for the specified phone number.

        @[JSON::Field(key: "OutboundMMS")]
        getter outbound_mms : Bool?

        # Allows or denies outbound SMS messaging for the specified phone number.

        @[JSON::Field(key: "OutboundSMS")]
        getter outbound_sms : Bool?

        def initialize(
          @inbound_call : Bool? = nil,
          @inbound_mms : Bool? = nil,
          @inbound_sms : Bool? = nil,
          @outbound_call : Bool? = nil,
          @outbound_mms : Bool? = nil,
          @outbound_sms : Bool? = nil
        )
        end
      end

      # The phone number's country.

      struct PhoneNumberCountry
        include JSON::Serializable

        # The phone number country code. Format: ISO 3166-1 alpha-2.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # The supported phone number types.

        @[JSON::Field(key: "SupportedPhoneNumberTypes")]
        getter supported_phone_number_types : Array(String)?

        def initialize(
          @country_code : String? = nil,
          @supported_phone_number_types : Array(String)? = nil
        )
        end
      end

      # If a phone number action fails for one or more of the phone numbers in a request, a list of the
      # failed phone numbers is returned, along with error codes and error messages.

      struct PhoneNumberError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The phone number ID for which the action failed.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @phone_number_id : String? = nil
        )
        end
      end

      # The details of an Amazon Chime SDK phone number order.

      struct PhoneNumberOrder
        include JSON::Serializable

        # The phone number order creation time stamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The Firm Order Commitment (FOC) date for phone number porting orders. This field is null if a phone
        # number order is not a porting order.

        @[JSON::Field(key: "FocDate")]
        getter foc_date : Time?

        # The type of phone number being ordered, local or toll-free.

        @[JSON::Field(key: "OrderType")]
        getter order_type : String?

        # The ordered phone number details, such as the phone number in E.164 format and the phone number
        # status.

        @[JSON::Field(key: "OrderedPhoneNumbers")]
        getter ordered_phone_numbers : Array(Types::OrderedPhoneNumber)?

        # The ID of the phone order.

        @[JSON::Field(key: "PhoneNumberOrderId")]
        getter phone_number_order_id : String?

        # The phone number order product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        # The status of the phone number order.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The updated phone number order time stamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @foc_date : Time? = nil,
          @order_type : String? = nil,
          @ordered_phone_numbers : Array(Types::OrderedPhoneNumber)? = nil,
          @phone_number_order_id : String? = nil,
          @product_type : String? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The proxy configuration for an Amazon Chime SDK Voice Connector.

      struct Proxy
        include JSON::Serializable

        # The default number of minutes allowed for proxy sessions.

        @[JSON::Field(key: "DefaultSessionExpiryMinutes")]
        getter default_session_expiry_minutes : Int32?

        # When true, stops proxy sessions from being created on the specified Amazon Chime SDK Voice
        # Connector.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The phone number to route calls to after a proxy session expires.

        @[JSON::Field(key: "FallBackPhoneNumber")]
        getter fall_back_phone_number : String?

        # The countries for proxy phone numbers to be selected from.

        @[JSON::Field(key: "PhoneNumberCountries")]
        getter phone_number_countries : Array(String)?

        def initialize(
          @default_session_expiry_minutes : Int32? = nil,
          @disabled : Bool? = nil,
          @fall_back_phone_number : String? = nil,
          @phone_number_countries : Array(String)? = nil
        )
        end
      end

      # The proxy session for an Amazon Chime SDK Voice Connector.

      struct ProxySession
        include JSON::Serializable

        # The proxy session capabilities.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)?

        # The created time stamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The ended time stamp, in ISO 8601 format.

        @[JSON::Field(key: "EndedTimestamp")]
        getter ended_timestamp : Time?

        # The number of minutes allowed for the proxy session.

        @[JSON::Field(key: "ExpiryMinutes")]
        getter expiry_minutes : Int32?

        # The preference for matching the country or area code of the proxy phone number with that of the
        # first participant.

        @[JSON::Field(key: "GeoMatchLevel")]
        getter geo_match_level : String?

        # The country and area code for the proxy phone number.

        @[JSON::Field(key: "GeoMatchParams")]
        getter geo_match_params : Types::GeoMatchParams?

        # The proxy session name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The preference for proxy phone number reuse, or stickiness, between the same participants across
        # sessions.

        @[JSON::Field(key: "NumberSelectionBehavior")]
        getter number_selection_behavior : String?

        # The proxy session participants.

        @[JSON::Field(key: "Participants")]
        getter participants : Array(Types::Participant)?

        # The proxy session ID.

        @[JSON::Field(key: "ProxySessionId")]
        getter proxy_session_id : String?

        # The proxy session status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The updated time stamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String?

        def initialize(
          @capabilities : Array(String)? = nil,
          @created_timestamp : Time? = nil,
          @ended_timestamp : Time? = nil,
          @expiry_minutes : Int32? = nil,
          @geo_match_level : String? = nil,
          @geo_match_params : Types::GeoMatchParams? = nil,
          @name : String? = nil,
          @number_selection_behavior : String? = nil,
          @participants : Array(Types::Participant)? = nil,
          @proxy_session_id : String? = nil,
          @status : String? = nil,
          @updated_timestamp : Time? = nil,
          @voice_connector_id : String? = nil
        )
        end
      end


      struct PutSipMediaApplicationAlexaSkillConfigurationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        # The Alexa Skill configuration.

        @[JSON::Field(key: "SipMediaApplicationAlexaSkillConfiguration")]
        getter sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration?

        def initialize(
          @sip_media_application_id : String,
          @sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration? = nil
        )
        end
      end


      struct PutSipMediaApplicationAlexaSkillConfigurationResponse
        include JSON::Serializable

        # Returns the Alexa Skill configuration.

        @[JSON::Field(key: "SipMediaApplicationAlexaSkillConfiguration")]
        getter sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration?

        def initialize(
          @sip_media_application_alexa_skill_configuration : Types::SipMediaApplicationAlexaSkillConfiguration? = nil
        )
        end
      end


      struct PutSipMediaApplicationLoggingConfigurationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        # The logging configuration for the specified SIP media application.

        @[JSON::Field(key: "SipMediaApplicationLoggingConfiguration")]
        getter sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration?

        def initialize(
          @sip_media_application_id : String,
          @sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration? = nil
        )
        end
      end


      struct PutSipMediaApplicationLoggingConfigurationResponse
        include JSON::Serializable

        # The updated logging configuration for the specified SIP media application.

        @[JSON::Field(key: "SipMediaApplicationLoggingConfiguration")]
        getter sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration?

        def initialize(
          @sip_media_application_logging_configuration : Types::SipMediaApplicationLoggingConfiguration? = nil
        )
        end
      end


      struct PutVoiceConnectorEmergencyCallingConfigurationRequest
        include JSON::Serializable

        # The configuration being updated.

        @[JSON::Field(key: "EmergencyCallingConfiguration")]
        getter emergency_calling_configuration : Types::EmergencyCallingConfiguration

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @emergency_calling_configuration : Types::EmergencyCallingConfiguration,
          @voice_connector_id : String
        )
        end
      end


      struct PutVoiceConnectorEmergencyCallingConfigurationResponse
        include JSON::Serializable

        # The updated configuration.

        @[JSON::Field(key: "EmergencyCallingConfiguration")]
        getter emergency_calling_configuration : Types::EmergencyCallingConfiguration?

        def initialize(
          @emergency_calling_configuration : Types::EmergencyCallingConfiguration? = nil
        )
        end
      end


      struct PutVoiceConnectorExternalSystemsConfigurationRequest
        include JSON::Serializable

        # The ID of the Voice Connector for which to add the external system configuration.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # The contact center system to use.

        @[JSON::Field(key: "ContactCenterSystemTypes")]
        getter contact_center_system_types : Array(String)?

        # The session border controllers to use.

        @[JSON::Field(key: "SessionBorderControllerTypes")]
        getter session_border_controller_types : Array(String)?

        def initialize(
          @voice_connector_id : String,
          @contact_center_system_types : Array(String)? = nil,
          @session_border_controller_types : Array(String)? = nil
        )
        end
      end


      struct PutVoiceConnectorExternalSystemsConfigurationResponse
        include JSON::Serializable

        # An object that contains information about an external systems configuration for a Voice Connector.

        @[JSON::Field(key: "ExternalSystemsConfiguration")]
        getter external_systems_configuration : Types::ExternalSystemsConfiguration?

        def initialize(
          @external_systems_configuration : Types::ExternalSystemsConfiguration? = nil
        )
        end
      end


      struct PutVoiceConnectorLoggingConfigurationRequest
        include JSON::Serializable

        # The logging configuration being updated.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @logging_configuration : Types::LoggingConfiguration,
          @voice_connector_id : String
        )
        end
      end


      struct PutVoiceConnectorLoggingConfigurationResponse
        include JSON::Serializable

        # The updated logging configuration.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end


      struct PutVoiceConnectorOriginationRequest
        include JSON::Serializable

        # The origination settings being updated.

        @[JSON::Field(key: "Origination")]
        getter origination : Types::Origination

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @origination : Types::Origination,
          @voice_connector_id : String
        )
        end
      end


      struct PutVoiceConnectorOriginationResponse
        include JSON::Serializable

        # The updated origination settings.

        @[JSON::Field(key: "Origination")]
        getter origination : Types::Origination?

        def initialize(
          @origination : Types::Origination? = nil
        )
        end
      end


      struct PutVoiceConnectorProxyRequest
        include JSON::Serializable

        # The default number of minutes allowed for proxy session.

        @[JSON::Field(key: "DefaultSessionExpiryMinutes")]
        getter default_session_expiry_minutes : Int32

        # The countries for proxy phone numbers to be selected from.

        @[JSON::Field(key: "PhoneNumberPoolCountries")]
        getter phone_number_pool_countries : Array(String)

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # When true, stops proxy sessions from being created on the specified Amazon Chime SDK Voice
        # Connector.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The phone number to route calls to after a proxy session expires.

        @[JSON::Field(key: "FallBackPhoneNumber")]
        getter fall_back_phone_number : String?

        def initialize(
          @default_session_expiry_minutes : Int32,
          @phone_number_pool_countries : Array(String),
          @voice_connector_id : String,
          @disabled : Bool? = nil,
          @fall_back_phone_number : String? = nil
        )
        end
      end


      struct PutVoiceConnectorProxyResponse
        include JSON::Serializable

        # The proxy configuration details.

        @[JSON::Field(key: "Proxy")]
        getter proxy : Types::Proxy?

        def initialize(
          @proxy : Types::Proxy? = nil
        )
        end
      end


      struct PutVoiceConnectorStreamingConfigurationRequest
        include JSON::Serializable

        # The streaming settings being updated.

        @[JSON::Field(key: "StreamingConfiguration")]
        getter streaming_configuration : Types::StreamingConfiguration

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @streaming_configuration : Types::StreamingConfiguration,
          @voice_connector_id : String
        )
        end
      end


      struct PutVoiceConnectorStreamingConfigurationResponse
        include JSON::Serializable

        # The updated streaming settings.

        @[JSON::Field(key: "StreamingConfiguration")]
        getter streaming_configuration : Types::StreamingConfiguration?

        def initialize(
          @streaming_configuration : Types::StreamingConfiguration? = nil
        )
        end
      end


      struct PutVoiceConnectorTerminationCredentialsRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # The termination credentials being updated.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Array(Types::Credential)?

        def initialize(
          @voice_connector_id : String,
          @credentials : Array(Types::Credential)? = nil
        )
        end
      end


      struct PutVoiceConnectorTerminationRequest
        include JSON::Serializable

        # The termination settings to be updated.

        @[JSON::Field(key: "Termination")]
        getter termination : Types::Termination

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @termination : Types::Termination,
          @voice_connector_id : String
        )
        end
      end


      struct PutVoiceConnectorTerminationResponse
        include JSON::Serializable

        # The updated termination settings.

        @[JSON::Field(key: "Termination")]
        getter termination : Types::Termination?

        def initialize(
          @termination : Types::Termination? = nil
        )
        end
      end

      # The request exceeds the resource limit.

      struct ResourceLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct RestorePhoneNumberRequest
        include JSON::Serializable

        # The ID of the phone number being restored.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        def initialize(
          @phone_number_id : String
        )
        end
      end


      struct RestorePhoneNumberResponse
        include JSON::Serializable

        # The restored phone number.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end


      struct SearchAvailablePhoneNumbersRequest
        include JSON::Serializable

        # Confines a search to just the phone numbers associated with the specified area code.

        @[JSON::Field(key: "area-code")]
        getter area_code : String?

        # Confines a search to just the phone numbers associated with the specified city.

        @[JSON::Field(key: "city")]
        getter city : String?

        # Confines a search to just the phone numbers associated with the specified country.

        @[JSON::Field(key: "country")]
        getter country : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token used to return the next page of results.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        # Confines a search to just the phone numbers associated with the specified phone number type, either
        # local or toll-free .

        @[JSON::Field(key: "phone-number-type")]
        getter phone_number_type : String?

        # Confines a search to just the phone numbers associated with the specified state.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Confines a search to just the phone numbers associated with the specified toll-free prefix.

        @[JSON::Field(key: "toll-free-prefix")]
        getter toll_free_prefix : String?

        def initialize(
          @area_code : String? = nil,
          @city : String? = nil,
          @country : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @phone_number_type : String? = nil,
          @state : String? = nil,
          @toll_free_prefix : String? = nil
        )
        end
      end


      struct SearchAvailablePhoneNumbersResponse
        include JSON::Serializable

        # Confines a search to just the phone numbers in the E.164 format.

        @[JSON::Field(key: "E164PhoneNumbers")]
        getter e164_phone_numbers : Array(String)?

        # The token used to return the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @e164_phone_numbers : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that contains the configuration settings for server-side encryption. We only support
      # symmetric keys. Do not use asymmetric or HMAC keys, or KMS aliases.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The ARN of the KMS key used to encrypt the enrollment data in a voice profile domain. Asymmetric
        # customer managed keys are not supported.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String

        def initialize(
          @kms_key_arn : String
        )
        end
      end

      # The service encountered an unexpected error.

      struct ServiceFailureException
        include JSON::Serializable

        def initialize
        end
      end

      # The service is currently unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable

        def initialize
        end
      end

      # The details of the SIP media application, including name and endpoints. An AWS account can have
      # multiple SIP media applications.

      struct SipMediaApplication
        include JSON::Serializable

        # The AWS Region in which the SIP media application is created.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The SIP media application creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # List of endpoints for a SIP media application. Currently, only one endpoint per SIP media
        # application is permitted.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::SipMediaApplicationEndpoint)?

        # The SIP media application's name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the SIP media application.

        @[JSON::Field(key: "SipMediaApplicationArn")]
        getter sip_media_application_arn : String?

        # A SIP media application's ID.

        @[JSON::Field(key: "SipMediaApplicationId")]
        getter sip_media_application_id : String?

        # The time at which the SIP media application was updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @aws_region : String? = nil,
          @created_timestamp : Time? = nil,
          @endpoints : Array(Types::SipMediaApplicationEndpoint)? = nil,
          @name : String? = nil,
          @sip_media_application_arn : String? = nil,
          @sip_media_application_id : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # The Alexa Skill configuration of a SIP media application. Due to changes made by the Amazon Alexa
      # service, this data type is no longer available for use. For more information, refer to the Alexa
      # Smart Properties page.

      struct SipMediaApplicationAlexaSkillConfiguration
        include JSON::Serializable

        # The ID of the Alexa Skill configuration.

        @[JSON::Field(key: "AlexaSkillIds")]
        getter alexa_skill_ids : Array(String)

        # The status of the Alexa Skill configuration.

        @[JSON::Field(key: "AlexaSkillStatus")]
        getter alexa_skill_status : String

        def initialize(
          @alexa_skill_ids : Array(String),
          @alexa_skill_status : String
        )
        end
      end

      # A Call instance for a SIP media application.

      struct SipMediaApplicationCall
        include JSON::Serializable

        # The call's transaction ID.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String?

        def initialize(
          @transaction_id : String? = nil
        )
        end
      end

      # The endpoint assigned to a SIP media application.

      struct SipMediaApplicationEndpoint
        include JSON::Serializable

        # Valid Amazon Resource Name (ARN) of the Lambda function, version, or alias. The function must be
        # created in the same AWS Region as the SIP media application.

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String?

        def initialize(
          @lambda_arn : String? = nil
        )
        end
      end

      # The logging configuration of a SIP media application.

      struct SipMediaApplicationLoggingConfiguration
        include JSON::Serializable

        # Enables message logging for the specified SIP media application.

        @[JSON::Field(key: "EnableSipMediaApplicationMessageLogs")]
        getter enable_sip_media_application_message_logs : Bool?

        def initialize(
          @enable_sip_media_application_message_logs : Bool? = nil
        )
        end
      end

      # The details of a SIP rule, including name, triggers, and target applications. An AWS account can
      # have multiple SIP rules.

      struct SipRule
        include JSON::Serializable

        # The time at which the SIP rule was created, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # Indicates whether the SIP rule is enabled or disabled. You must disable a rule before you can delete
        # it.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # A SIP rule's name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A SIP rule's ID.

        @[JSON::Field(key: "SipRuleId")]
        getter sip_rule_id : String?

        # The target SIP media application and other details, such as priority and AWS Region, to be specified
        # in the SIP rule. Only one SIP rule per AWS Region can be provided.

        @[JSON::Field(key: "TargetApplications")]
        getter target_applications : Array(Types::SipRuleTargetApplication)?

        # The type of trigger set for a SIP rule, either a phone number or a URI request host name.

        @[JSON::Field(key: "TriggerType")]
        getter trigger_type : String?

        # The value set for a SIP rule's trigger type. Either a phone number or a URI hostname.

        @[JSON::Field(key: "TriggerValue")]
        getter trigger_value : String?

        # The time at which the SIP rule was updated, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @created_timestamp : Time? = nil,
          @disabled : Bool? = nil,
          @name : String? = nil,
          @sip_rule_id : String? = nil,
          @target_applications : Array(Types::SipRuleTargetApplication)? = nil,
          @trigger_type : String? = nil,
          @trigger_value : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end

      # A target SIP media application and other details, such as priority and AWS Region, to be specified
      # in the SIP rule. Only one SIP rule per AWS Region can be provided.

      struct SipRuleTargetApplication
        include JSON::Serializable

        # The AWS Region of a rule's target SIP media application.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The priority setting of a rule's target SIP media application.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # The ID of a rule's target SIP media application.

        @[JSON::Field(key: "SipMediaApplicationId")]
        getter sip_media_application_id : String?

        def initialize(
          @aws_region : String? = nil,
          @priority : Int32? = nil,
          @sip_media_application_id : String? = nil
        )
        end
      end

      # The details of a speaker search task.

      struct SpeakerSearchDetails
        include JSON::Serializable

        # The result value in the speaker search details.

        @[JSON::Field(key: "Results")]
        getter results : Array(Types::SpeakerSearchResult)?

        # The status of a voice print generation operation, VoiceprintGenerationSuccess or
        # VoiceprintGenerationFailure ..

        @[JSON::Field(key: "VoiceprintGenerationStatus")]
        getter voiceprint_generation_status : String?

        def initialize(
          @results : Array(Types::SpeakerSearchResult)? = nil,
          @voiceprint_generation_status : String? = nil
        )
        end
      end

      # The result of a speaker search analysis.

      struct SpeakerSearchResult
        include JSON::Serializable

        # The confidence score in the speaker search analysis.

        @[JSON::Field(key: "ConfidenceScore")]
        getter confidence_score : Float64?

        # The voice profile ID.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String?

        def initialize(
          @confidence_score : Float64? = nil,
          @voice_profile_id : String? = nil
        )
        end
      end

      # A representation of an asynchronous request to perform speaker search analysis on a Voice Connector
      # call.

      struct SpeakerSearchTask
        include JSON::Serializable

        # The call details of a speaker search task.

        @[JSON::Field(key: "CallDetails")]
        getter call_details : Types::CallDetails?

        # The time at which a speaker search task was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The details of a speaker search task.

        @[JSON::Field(key: "SpeakerSearchDetails")]
        getter speaker_search_details : Types::SpeakerSearchDetails?

        # The speaker search task ID.

        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String?

        # The status of the speaker search task, IN_QUEUE , IN_PROGRESS , PARTIAL_SUCCESS , SUCCEEDED , FAILED
        # , or STOPPED .

        @[JSON::Field(key: "SpeakerSearchTaskStatus")]
        getter speaker_search_task_status : String?

        # The time at which the speaker search task began.

        @[JSON::Field(key: "StartedTimestamp")]
        getter started_timestamp : Time?

        # A detailed message about the status of a speaker search.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The time at which a speaker search task was updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        def initialize(
          @call_details : Types::CallDetails? = nil,
          @created_timestamp : Time? = nil,
          @speaker_search_details : Types::SpeakerSearchDetails? = nil,
          @speaker_search_task_id : String? = nil,
          @speaker_search_task_status : String? = nil,
          @started_timestamp : Time? = nil,
          @status_message : String? = nil,
          @updated_timestamp : Time? = nil
        )
        end
      end


      struct StartSpeakerSearchTaskRequest
        include JSON::Serializable

        # The transaction ID of the call being analyzed.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        # The ID of the voice profile domain that will store the voice profile.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String

        # Specifies which call leg to stream for speaker search.

        @[JSON::Field(key: "CallLeg")]
        getter call_leg : String?

        # The unique identifier for the client request. Use a different token for different speaker search
        # tasks.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @transaction_id : String,
          @voice_connector_id : String,
          @voice_profile_domain_id : String,
          @call_leg : String? = nil,
          @client_request_token : String? = nil
        )
        end
      end


      struct StartSpeakerSearchTaskResponse
        include JSON::Serializable

        # The details of the speaker search task.

        @[JSON::Field(key: "SpeakerSearchTask")]
        getter speaker_search_task : Types::SpeakerSearchTask?

        def initialize(
          @speaker_search_task : Types::SpeakerSearchTask? = nil
        )
        end
      end


      struct StartVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # The language code.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The transaction ID.

        @[JSON::Field(key: "TransactionId")]
        getter transaction_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        # The unique identifier for the client request. Use a different token for different voice tone
        # analysis tasks.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @language_code : String,
          @transaction_id : String,
          @voice_connector_id : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct StartVoiceToneAnalysisTaskResponse
        include JSON::Serializable

        # The details of the voice tone analysis task.

        @[JSON::Field(key: "VoiceToneAnalysisTask")]
        getter voice_tone_analysis_task : Types::VoiceToneAnalysisTask?

        def initialize(
          @voice_tone_analysis_task : Types::VoiceToneAnalysisTask? = nil
        )
        end
      end


      struct StopSpeakerSearchTaskRequest
        include JSON::Serializable

        # The speaker search task ID.

        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @speaker_search_task_id : String,
          @voice_connector_id : String
        )
        end
      end


      struct StopVoiceToneAnalysisTaskRequest
        include JSON::Serializable

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        # The ID of the voice tone analysis task.

        @[JSON::Field(key: "VoiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String

        def initialize(
          @voice_connector_id : String,
          @voice_tone_analysis_task_id : String
        )
        end
      end

      # The streaming configuration associated with an Amazon Chime SDK Voice Connector. Specifies whether
      # media streaming is enabled for sending to Amazon Kinesis, and shows the retention period for the
      # Amazon Kinesis data, in hours.

      struct StreamingConfiguration
        include JSON::Serializable

        # The amount of time, in hours, to the Kinesis data.

        @[JSON::Field(key: "DataRetentionInHours")]
        getter data_retention_in_hours : Int32

        # When true, streaming to Kinesis is off.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool

        # The call analytics configuration.

        @[JSON::Field(key: "MediaInsightsConfiguration")]
        getter media_insights_configuration : Types::MediaInsightsConfiguration?

        # The streaming notification targets.

        @[JSON::Field(key: "StreamingNotificationTargets")]
        getter streaming_notification_targets : Array(Types::StreamingNotificationTarget)?

        def initialize(
          @data_retention_in_hours : Int32,
          @disabled : Bool,
          @media_insights_configuration : Types::MediaInsightsConfiguration? = nil,
          @streaming_notification_targets : Array(Types::StreamingNotificationTarget)? = nil
        )
        end
      end

      # The target recipient for a streaming configuration notification.

      struct StreamingNotificationTarget
        include JSON::Serializable

        # The streaming notification target.

        @[JSON::Field(key: "NotificationTarget")]
        getter notification_target : String?

        def initialize(
          @notification_target : String? = nil
        )
        end
      end

      # Describes a tag applied to a resource.

      struct Tag
        include JSON::Serializable

        # The tag's key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource being tagged.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of the tags being added to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Termination settings enable SIP hosts to make outbound calls using an Amazon Chime SDK Voice
      # Connector.

      struct Termination
        include JSON::Serializable

        # The countries to which calls are allowed, in ISO 3166-1 alpha-2 format. Required.

        @[JSON::Field(key: "CallingRegions")]
        getter calling_regions : Array(String)?

        # The IP addresses allowed to make calls, in CIDR format.

        @[JSON::Field(key: "CidrAllowedList")]
        getter cidr_allowed_list : Array(String)?

        # The limit on calls per second. Max value based on account service quota. Default value of 1.

        @[JSON::Field(key: "CpsLimit")]
        getter cps_limit : Int32?

        # The default outbound calling number.

        @[JSON::Field(key: "DefaultPhoneNumber")]
        getter default_phone_number : String?

        # When termination is disabled, outbound calls cannot be made.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        def initialize(
          @calling_regions : Array(String)? = nil,
          @cidr_allowed_list : Array(String)? = nil,
          @cps_limit : Int32? = nil,
          @default_phone_number : String? = nil,
          @disabled : Bool? = nil
        )
        end
      end

      # The termination health details, including the source IP address and timestamp of the last successful
      # SIP OPTIONS message from your SIP infrastructure.

      struct TerminationHealth
        include JSON::Serializable

        # The source IP address.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The timestamp, in ISO 8601 format.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @source : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # The number of customer requests exceeds the request rate limit.

      struct ThrottledClientException
        include JSON::Serializable

        def initialize
        end
      end

      # The client isn't authorized to request a resource.

      struct UnauthorizedClientException
        include JSON::Serializable

        def initialize
        end
      end

      # A well-formed request couldn't be followed due to semantic errors.

      struct UnprocessableEntityException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource having its tags removed.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The keys of the tags being removed from the resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateGlobalSettingsRequest
        include JSON::Serializable

        # The Voice Connector settings.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnectorSettings?

        def initialize(
          @voice_connector : Types::VoiceConnectorSettings? = nil
        )
        end
      end


      struct UpdatePhoneNumberRequest
        include JSON::Serializable

        # The phone number ID.

        @[JSON::Field(key: "phoneNumberId")]
        getter phone_number_id : String

        # The outbound calling name associated with the phone number.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # Specifies the updated name assigned to one or more phone numbers.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The product type.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        def initialize(
          @phone_number_id : String,
          @calling_name : String? = nil,
          @name : String? = nil,
          @product_type : String? = nil
        )
        end
      end

      # The phone number ID, product type, or calling name fields to update, used with the
      # BatchUpdatePhoneNumber and UpdatePhoneNumber actions.

      struct UpdatePhoneNumberRequestItem
        include JSON::Serializable

        # The phone number ID to update.

        @[JSON::Field(key: "PhoneNumberId")]
        getter phone_number_id : String

        # The outbound calling name to update.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String?

        # The name of the phone number.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The product type to update.

        @[JSON::Field(key: "ProductType")]
        getter product_type : String?

        def initialize(
          @phone_number_id : String,
          @calling_name : String? = nil,
          @name : String? = nil,
          @product_type : String? = nil
        )
        end
      end


      struct UpdatePhoneNumberResponse
        include JSON::Serializable

        # The updated phone number details.

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : Types::PhoneNumber?

        def initialize(
          @phone_number : Types::PhoneNumber? = nil
        )
        end
      end


      struct UpdatePhoneNumberSettingsRequest
        include JSON::Serializable

        # The default outbound calling name for the account.

        @[JSON::Field(key: "CallingName")]
        getter calling_name : String

        def initialize(
          @calling_name : String
        )
        end
      end


      struct UpdateProxySessionRequest
        include JSON::Serializable

        # The proxy session capabilities.

        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Array(String)

        # The proxy session ID.

        @[JSON::Field(key: "proxySessionId")]
        getter proxy_session_id : String

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        # The number of minutes allowed for the proxy session.

        @[JSON::Field(key: "ExpiryMinutes")]
        getter expiry_minutes : Int32?

        def initialize(
          @capabilities : Array(String),
          @proxy_session_id : String,
          @voice_connector_id : String,
          @expiry_minutes : Int32? = nil
        )
        end
      end


      struct UpdateProxySessionResponse
        include JSON::Serializable

        # The updated proxy session details.

        @[JSON::Field(key: "ProxySession")]
        getter proxy_session : Types::ProxySession?

        def initialize(
          @proxy_session : Types::ProxySession? = nil
        )
        end
      end


      struct UpdateSipMediaApplicationCallRequest
        include JSON::Serializable

        # Arguments made available to the Lambda function as part of the CALL_UPDATE_REQUESTED event. Can
        # contain 0-20 key-value pairs.

        @[JSON::Field(key: "Arguments")]
        getter arguments : Hash(String, String)

        # The ID of the SIP media application handling the call.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        # The ID of the call transaction.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String

        def initialize(
          @arguments : Hash(String, String),
          @sip_media_application_id : String,
          @transaction_id : String
        )
        end
      end


      struct UpdateSipMediaApplicationCallResponse
        include JSON::Serializable

        # A Call instance for a SIP media application.

        @[JSON::Field(key: "SipMediaApplicationCall")]
        getter sip_media_application_call : Types::SipMediaApplicationCall?

        def initialize(
          @sip_media_application_call : Types::SipMediaApplicationCall? = nil
        )
        end
      end


      struct UpdateSipMediaApplicationRequest
        include JSON::Serializable

        # The SIP media application ID.

        @[JSON::Field(key: "sipMediaApplicationId")]
        getter sip_media_application_id : String

        # The new set of endpoints for the specified SIP media application.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::SipMediaApplicationEndpoint)?

        # The new name for the specified SIP media application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @sip_media_application_id : String,
          @endpoints : Array(Types::SipMediaApplicationEndpoint)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateSipMediaApplicationResponse
        include JSON::Serializable

        # The updated SIP media application’s details.

        @[JSON::Field(key: "SipMediaApplication")]
        getter sip_media_application : Types::SipMediaApplication?

        def initialize(
          @sip_media_application : Types::SipMediaApplication? = nil
        )
        end
      end


      struct UpdateSipRuleRequest
        include JSON::Serializable

        # The new name for the specified SIP rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The SIP rule ID.

        @[JSON::Field(key: "sipRuleId")]
        getter sip_rule_id : String

        # The new value that indicates whether the rule is disabled.

        @[JSON::Field(key: "Disabled")]
        getter disabled : Bool?

        # The new list of target applications.

        @[JSON::Field(key: "TargetApplications")]
        getter target_applications : Array(Types::SipRuleTargetApplication)?

        def initialize(
          @name : String,
          @sip_rule_id : String,
          @disabled : Bool? = nil,
          @target_applications : Array(Types::SipRuleTargetApplication)? = nil
        )
        end
      end


      struct UpdateSipRuleResponse
        include JSON::Serializable

        # The updated SIP rule details.

        @[JSON::Field(key: "SipRule")]
        getter sip_rule : Types::SipRule?

        def initialize(
          @sip_rule : Types::SipRule? = nil
        )
        end
      end


      struct UpdateVoiceConnectorGroupRequest
        include JSON::Serializable

        # The name of the Voice Connector group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorGroupId")]
        getter voice_connector_group_id : String

        # The VoiceConnectorItems to associate with the Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorItems")]
        getter voice_connector_items : Array(Types::VoiceConnectorItem)

        def initialize(
          @name : String,
          @voice_connector_group_id : String,
          @voice_connector_items : Array(Types::VoiceConnectorItem)
        )
        end
      end


      struct UpdateVoiceConnectorGroupResponse
        include JSON::Serializable

        # The updated Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorGroup")]
        getter voice_connector_group : Types::VoiceConnectorGroup?

        def initialize(
          @voice_connector_group : Types::VoiceConnectorGroup? = nil
        )
        end
      end


      struct UpdateVoiceConnectorRequest
        include JSON::Serializable

        # The name of the Voice Connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # When enabled, requires encryption for the Voice Connector.

        @[JSON::Field(key: "RequireEncryption")]
        getter require_encryption : Bool

        # The Voice Connector ID.

        @[JSON::Field(key: "voiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @name : String,
          @require_encryption : Bool,
          @voice_connector_id : String
        )
        end
      end


      struct UpdateVoiceConnectorResponse
        include JSON::Serializable

        # The updated Voice Connector details.

        @[JSON::Field(key: "VoiceConnector")]
        getter voice_connector : Types::VoiceConnector?

        def initialize(
          @voice_connector : Types::VoiceConnector? = nil
        )
        end
      end


      struct UpdateVoiceProfileDomainRequest
        include JSON::Serializable

        # The domain ID.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String

        # The description of the voice profile domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the voice profile domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @voice_profile_domain_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateVoiceProfileDomainResponse
        include JSON::Serializable

        # The updated details of the voice profile domain.

        @[JSON::Field(key: "VoiceProfileDomain")]
        getter voice_profile_domain : Types::VoiceProfileDomain?

        def initialize(
          @voice_profile_domain : Types::VoiceProfileDomain? = nil
        )
        end
      end


      struct UpdateVoiceProfileRequest
        include JSON::Serializable

        # The ID of the speaker search task.

        @[JSON::Field(key: "SpeakerSearchTaskId")]
        getter speaker_search_task_id : String

        # The profile ID.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String

        def initialize(
          @speaker_search_task_id : String,
          @voice_profile_id : String
        )
        end
      end


      struct UpdateVoiceProfileResponse
        include JSON::Serializable

        # The updated voice profile settings.

        @[JSON::Field(key: "VoiceProfile")]
        getter voice_profile : Types::VoiceProfile?

        def initialize(
          @voice_profile : Types::VoiceProfile? = nil
        )
        end
      end


      struct ValidateE911AddressRequest
        include JSON::Serializable

        # The AWS account ID.

        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # The address city, such as Portland .

        @[JSON::Field(key: "City")]
        getter city : String

        # The country in the address being validated as two-letter country code in ISO 3166-1 alpha-2 format,
        # such as US . For more information, see ISO 3166-1 alpha-2 in Wikipedia.

        @[JSON::Field(key: "Country")]
        getter country : String

        # The dress postal code, such 04352 .

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String

        # The address state, such as ME .

        @[JSON::Field(key: "State")]
        getter state : String

        # The address street information, such as 8th Avenue .

        @[JSON::Field(key: "StreetInfo")]
        getter street_info : String

        # The address street number, such as 200 or 2121 .

        @[JSON::Field(key: "StreetNumber")]
        getter street_number : String

        def initialize(
          @aws_account_id : String,
          @city : String,
          @country : String,
          @postal_code : String,
          @state : String,
          @street_info : String,
          @street_number : String
        )
        end
      end


      struct ValidateE911AddressResponse
        include JSON::Serializable

        # The validated address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The ID that represents the address.

        @[JSON::Field(key: "AddressExternalId")]
        getter address_external_id : String?

        # The list of address suggestions..

        @[JSON::Field(key: "CandidateAddressList")]
        getter candidate_address_list : Array(Types::CandidateAddress)?

        # Number indicating the result of address validation. Each possible result is defined as follows: 0 -
        # Address validation succeeded. 1 - Address validation succeeded. The address was a close enough match
        # and has been corrected as part of the address object. 2 - Address validation failed. You should
        # re-submit the validation request with candidates from the CandidateAddressList result, if it's a
        # close match.

        @[JSON::Field(key: "ValidationResult")]
        getter validation_result : Int32?

        def initialize(
          @address : Types::Address? = nil,
          @address_external_id : String? = nil,
          @candidate_address_list : Array(Types::CandidateAddress)? = nil,
          @validation_result : Int32? = nil
        )
        end
      end

      # The Amazon Chime SDK Voice Connector configuration, including outbound host name and encryption
      # settings.

      struct VoiceConnector
        include JSON::Serializable

        # The AWS Region in which the Voice Connector is created. Default: us-east-1.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The Voice Connector's creation timestamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The connectors for use with Amazon Connect.

        @[JSON::Field(key: "IntegrationType")]
        getter integration_type : String?

        # The Voice Connector's name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of network of the Voice Connector. Either IPv4 only or dual-stack (IPv4 and IPv6).

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The outbound host name for the Voice Connector.

        @[JSON::Field(key: "OutboundHostName")]
        getter outbound_host_name : String?

        # Enables or disables encryption for the Voice Connector.

        @[JSON::Field(key: "RequireEncryption")]
        getter require_encryption : Bool?

        # The Voice Connector's updated timestamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ARN of the Voice Connector.

        @[JSON::Field(key: "VoiceConnectorArn")]
        getter voice_connector_arn : String?

        # The Voice Connector's ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String?

        def initialize(
          @aws_region : String? = nil,
          @created_timestamp : Time? = nil,
          @integration_type : String? = nil,
          @name : String? = nil,
          @network_type : String? = nil,
          @outbound_host_name : String? = nil,
          @require_encryption : Bool? = nil,
          @updated_timestamp : Time? = nil,
          @voice_connector_arn : String? = nil,
          @voice_connector_id : String? = nil
        )
        end
      end

      # The Amazon Chime SDK Voice Connector group configuration, including associated Voice Connectors. You
      # can include Voice Connectors from different AWS Regions in a group. This creates a fault tolerant
      # mechanism for fallback in case of availability events.

      struct VoiceConnectorGroup
        include JSON::Serializable

        # The Voice Connector group's creation time stamp, in ISO 8601 format.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The name of a Voice Connector group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Voice Connector group's creation time stamp, in ISO 8601 format.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ARN of the Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorGroupArn")]
        getter voice_connector_group_arn : String?

        # The ID of a Voice Connector group.

        @[JSON::Field(key: "VoiceConnectorGroupId")]
        getter voice_connector_group_id : String?

        # The Voice Connectors to which you route inbound calls.

        @[JSON::Field(key: "VoiceConnectorItems")]
        getter voice_connector_items : Array(Types::VoiceConnectorItem)?

        def initialize(
          @created_timestamp : Time? = nil,
          @name : String? = nil,
          @updated_timestamp : Time? = nil,
          @voice_connector_group_arn : String? = nil,
          @voice_connector_group_id : String? = nil,
          @voice_connector_items : Array(Types::VoiceConnectorItem)? = nil
        )
        end
      end

      # For Amazon Chime SDK Voice Connector groups, the Amazon Chime SDK Voice Connectors to which you
      # route inbound calls. Includes priority configuration settings. Limit: 3 VoiceConnectorItems per
      # Voice Connector group.

      struct VoiceConnectorItem
        include JSON::Serializable

        # The priority setting of a Voice Connector item. Calls are routed to hosts in priority order, with 1
        # as the highest priority. When hosts have equal priority, the system distributes calls among them
        # based on their relative weight.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The Voice Connector ID.

        @[JSON::Field(key: "VoiceConnectorId")]
        getter voice_connector_id : String

        def initialize(
          @priority : Int32,
          @voice_connector_id : String
        )
        end
      end

      # The Amazon Chime SDK Voice Connector settings. Includes any Amazon S3 buckets designated for storing
      # call detail records.

      struct VoiceConnectorSettings
        include JSON::Serializable

        # The S3 bucket that stores the Voice Connector's call detail records.

        @[JSON::Field(key: "CdrBucket")]
        getter cdr_bucket : String?

        def initialize(
          @cdr_bucket : String? = nil
        )
        end
      end

      # The combination of a voice print and caller ID.

      struct VoiceProfile
        include JSON::Serializable

        # The time at which the voice profile was created and enrolled.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a voice profile expires unless you re-enroll the caller via the UpdateVoiceProfile
        # API.

        @[JSON::Field(key: "ExpirationTimestamp")]
        getter expiration_timestamp : Time?

        # The time at which the voice profile was last updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ARN of the voice profile.

        @[JSON::Field(key: "VoiceProfileArn")]
        getter voice_profile_arn : String?

        # The ID of the domain that contains the voice profile.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String?

        # The ID of the voice profile.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @expiration_timestamp : Time? = nil,
          @updated_timestamp : Time? = nil,
          @voice_profile_arn : String? = nil,
          @voice_profile_domain_id : String? = nil,
          @voice_profile_id : String? = nil
        )
        end
      end

      # A collection of voice profiles.

      struct VoiceProfileDomain
        include JSON::Serializable

        # The time at which the voice profile domain was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The description of the voice profile domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the voice profile domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A structure that contains the configuration settings for server-side encryption.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The time at which the voice profile was last updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The voice profile domain's Amazon Resource Number (ARN).

        @[JSON::Field(key: "VoiceProfileDomainArn")]
        getter voice_profile_domain_arn : String?

        # The ID of the voice profile domain.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @updated_timestamp : Time? = nil,
          @voice_profile_domain_arn : String? = nil,
          @voice_profile_domain_id : String? = nil
        )
        end
      end

      # A high-level overview of a voice profile domain.

      struct VoiceProfileDomainSummary
        include JSON::Serializable

        # The time at which the voice profile domain summary was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # Describes the voice profile domain summary.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the voice profile domain summary.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The time at which the voice profile domain summary was last updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ARN of a voice profile in a voice profile domain summary.

        @[JSON::Field(key: "VoiceProfileDomainArn")]
        getter voice_profile_domain_arn : String?

        # The ID of the voice profile domain summary.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @updated_timestamp : Time? = nil,
          @voice_profile_domain_arn : String? = nil,
          @voice_profile_domain_id : String? = nil
        )
        end
      end

      # A high-level summary of a voice profile.

      struct VoiceProfileSummary
        include JSON::Serializable

        # The time at which a voice profile summary was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # Extends the life of the voice profile. You can use UpdateVoiceProfile to refresh an existing voice
        # profile's voice print and extend the life of the summary.

        @[JSON::Field(key: "ExpirationTimestamp")]
        getter expiration_timestamp : Time?

        # The time at which a voice profile summary was last updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ARN of the voice profile in a voice profile summary.

        @[JSON::Field(key: "VoiceProfileArn")]
        getter voice_profile_arn : String?

        # The ID of the voice profile domain in a voice profile summary.

        @[JSON::Field(key: "VoiceProfileDomainId")]
        getter voice_profile_domain_id : String?

        # The ID of the voice profile in a voice profile summary.

        @[JSON::Field(key: "VoiceProfileId")]
        getter voice_profile_id : String?

        def initialize(
          @created_timestamp : Time? = nil,
          @expiration_timestamp : Time? = nil,
          @updated_timestamp : Time? = nil,
          @voice_profile_arn : String? = nil,
          @voice_profile_domain_id : String? = nil,
          @voice_profile_id : String? = nil
        )
        end
      end

      # A representation of an asynchronous request to perform voice tone analysis on a Voice Connector
      # call.

      struct VoiceToneAnalysisTask
        include JSON::Serializable

        # The call details of a voice tone analysis task.

        @[JSON::Field(key: "CallDetails")]
        getter call_details : Types::CallDetails?

        # The time at which a voice tone analysis task was created.

        @[JSON::Field(key: "CreatedTimestamp")]
        getter created_timestamp : Time?

        # The time at which a voice tone analysis task started.

        @[JSON::Field(key: "StartedTimestamp")]
        getter started_timestamp : Time?

        # The status of a voice tone analysis task.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The time at which a voice tone analysis task was updated.

        @[JSON::Field(key: "UpdatedTimestamp")]
        getter updated_timestamp : Time?

        # The ID of the voice tone analysis task.

        @[JSON::Field(key: "VoiceToneAnalysisTaskId")]
        getter voice_tone_analysis_task_id : String?

        # The status of a voice tone analysis task, IN_QUEUE , IN_PROGRESS , PARTIAL_SUCCESS , SUCCEEDED ,
        # FAILED , or STOPPED .

        @[JSON::Field(key: "VoiceToneAnalysisTaskStatus")]
        getter voice_tone_analysis_task_status : String?

        def initialize(
          @call_details : Types::CallDetails? = nil,
          @created_timestamp : Time? = nil,
          @started_timestamp : Time? = nil,
          @status_message : String? = nil,
          @updated_timestamp : Time? = nil,
          @voice_tone_analysis_task_id : String? = nil,
          @voice_tone_analysis_task_status : String? = nil
        )
        end
      end
    end
  end
end
