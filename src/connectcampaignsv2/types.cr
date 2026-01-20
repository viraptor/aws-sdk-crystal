require "json"
require "time"

module Aws
  module ConnectCampaignsV2
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # Agentless config

      struct AgentlessConfig
        include JSON::Serializable

        def initialize
        end
      end

      # Answering Machine Detection config

      struct AnswerMachineDetectionConfig
        include JSON::Serializable

        # Enable or disable answering machine detection

        @[JSON::Field(key: "enableAnswerMachineDetection")]
        getter enable_answer_machine_detection : Bool

        # Enable or disable await answer machine prompt

        @[JSON::Field(key: "awaitAnswerMachinePrompt")]
        getter await_answer_machine_prompt : Bool?

        def initialize(
          @enable_answer_machine_detection : Bool,
          @await_answer_machine_prompt : Bool? = nil
        )
        end
      end

      # An Amazon Connect campaign.

      struct Campaign
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "channelSubtypeConfig")]
        getter channel_subtype_config : Types::ChannelSubtypeConfig?


        @[JSON::Field(key: "communicationLimitsOverride")]
        getter communication_limits_override : Types::CommunicationLimitsConfig?


        @[JSON::Field(key: "communicationTimeConfig")]
        getter communication_time_config : Types::CommunicationTimeConfig?


        @[JSON::Field(key: "connectCampaignFlowArn")]
        getter connect_campaign_flow_arn : String?


        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?


        @[JSON::Field(key: "source")]
        getter source : Types::Source?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String,
          @connect_instance_id : String,
          @id : String,
          @name : String,
          @channel_subtype_config : Types::ChannelSubtypeConfig? = nil,
          @communication_limits_override : Types::CommunicationLimitsConfig? = nil,
          @communication_time_config : Types::CommunicationTimeConfig? = nil,
          @connect_campaign_flow_arn : String? = nil,
          @schedule : Types::Schedule? = nil,
          @source : Types::Source? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Filter model by type

      struct CampaignFilters
        include JSON::Serializable


        @[JSON::Field(key: "instanceIdFilter")]
        getter instance_id_filter : Types::InstanceIdFilter?

        def initialize(
          @instance_id_filter : Types::InstanceIdFilter? = nil
        )
        end
      end

      # An Amazon Connect campaign summary.

      struct CampaignSummary
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "channelSubtypes")]
        getter channel_subtypes : Array(String)


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "connectCampaignFlowArn")]
        getter connect_campaign_flow_arn : String?


        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String,
          @channel_subtypes : Array(String),
          @connect_instance_id : String,
          @id : String,
          @name : String,
          @connect_campaign_flow_arn : String? = nil,
          @schedule : Types::Schedule? = nil,
          @type : String? = nil
        )
        end
      end

      # Campaign Channel Subtype config

      struct ChannelSubtypeConfig
        include JSON::Serializable


        @[JSON::Field(key: "email")]
        getter email : Types::EmailChannelSubtypeConfig?


        @[JSON::Field(key: "sms")]
        getter sms : Types::SmsChannelSubtypeConfig?


        @[JSON::Field(key: "telephony")]
        getter telephony : Types::TelephonyChannelSubtypeConfig?


        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::WhatsAppChannelSubtypeConfig?

        def initialize(
          @email : Types::EmailChannelSubtypeConfig? = nil,
          @sms : Types::SmsChannelSubtypeConfig? = nil,
          @telephony : Types::TelephonyChannelSubtypeConfig? = nil,
          @whats_app : Types::WhatsAppChannelSubtypeConfig? = nil
        )
        end
      end

      # ChannelSubtypeParameters for an outbound request

      struct ChannelSubtypeParameters
        include JSON::Serializable


        @[JSON::Field(key: "email")]
        getter email : Types::EmailChannelSubtypeParameters?


        @[JSON::Field(key: "sms")]
        getter sms : Types::SmsChannelSubtypeParameters?


        @[JSON::Field(key: "telephony")]
        getter telephony : Types::TelephonyChannelSubtypeParameters?


        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::WhatsAppChannelSubtypeParameters?

        def initialize(
          @email : Types::EmailChannelSubtypeParameters? = nil,
          @sms : Types::SmsChannelSubtypeParameters? = nil,
          @telephony : Types::TelephonyChannelSubtypeParameters? = nil,
          @whats_app : Types::WhatsAppChannelSubtypeParameters? = nil
        )
        end
      end

      # Communication Limit

      struct CommunicationLimit
        include JSON::Serializable

        # The number of days to consider with regards to this limit.

        @[JSON::Field(key: "frequency")]
        getter frequency : Int32

        # Maximum number of contacts allowed for a given target within the given frequency.

        @[JSON::Field(key: "maxCountPerRecipient")]
        getter max_count_per_recipient : Int32


        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @frequency : Int32,
          @max_count_per_recipient : Int32,
          @unit : String
        )
        end
      end

      # Communication limits

      struct CommunicationLimits
        include JSON::Serializable


        @[JSON::Field(key: "communicationLimitsList")]
        getter communication_limits_list : Array(Types::CommunicationLimit)?

        def initialize(
          @communication_limits_list : Array(Types::CommunicationLimit)? = nil
        )
        end
      end

      # Communication limits config

      struct CommunicationLimitsConfig
        include JSON::Serializable


        @[JSON::Field(key: "allChannelSubtypes")]
        getter all_channel_subtypes : Types::CommunicationLimits?


        @[JSON::Field(key: "instanceLimitsHandling")]
        getter instance_limits_handling : String?

        def initialize(
          @all_channel_subtypes : Types::CommunicationLimits? = nil,
          @instance_limits_handling : String? = nil
        )
        end
      end

      # Campaign communication time config

      struct CommunicationTimeConfig
        include JSON::Serializable


        @[JSON::Field(key: "localTimeZoneConfig")]
        getter local_time_zone_config : Types::LocalTimeZoneConfig


        @[JSON::Field(key: "email")]
        getter email : Types::TimeWindow?


        @[JSON::Field(key: "sms")]
        getter sms : Types::TimeWindow?


        @[JSON::Field(key: "telephony")]
        getter telephony : Types::TimeWindow?


        @[JSON::Field(key: "whatsApp")]
        getter whats_app : Types::TimeWindow?

        def initialize(
          @local_time_zone_config : Types::LocalTimeZoneConfig,
          @email : Types::TimeWindow? = nil,
          @sms : Types::TimeWindow? = nil,
          @telephony : Types::TimeWindow? = nil,
          @whats_app : Types::TimeWindow? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # The request for CreateCampaign API.

      struct CreateCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "channelSubtypeConfig")]
        getter channel_subtype_config : Types::ChannelSubtypeConfig?


        @[JSON::Field(key: "communicationLimitsOverride")]
        getter communication_limits_override : Types::CommunicationLimitsConfig?


        @[JSON::Field(key: "communicationTimeConfig")]
        getter communication_time_config : Types::CommunicationTimeConfig?


        @[JSON::Field(key: "connectCampaignFlowArn")]
        getter connect_campaign_flow_arn : String?


        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?


        @[JSON::Field(key: "source")]
        getter source : Types::Source?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @connect_instance_id : String,
          @name : String,
          @channel_subtype_config : Types::ChannelSubtypeConfig? = nil,
          @communication_limits_override : Types::CommunicationLimitsConfig? = nil,
          @communication_time_config : Types::CommunicationTimeConfig? = nil,
          @connect_campaign_flow_arn : String? = nil,
          @schedule : Types::Schedule? = nil,
          @source : Types::Source? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # The response for Create Campaign API

      struct CreateCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Customer Profiles integration config

      struct CustomerProfilesIntegrationConfig
        include JSON::Serializable


        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String


        @[JSON::Field(key: "objectTypeNames")]
        getter object_type_names : Hash(String, String)

        def initialize(
          @domain_arn : String,
          @object_type_names : Hash(String, String)
        )
        end
      end

      # Customer Profiles integration identifier

      struct CustomerProfilesIntegrationIdentifier
        include JSON::Serializable


        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String

        def initialize(
          @domain_arn : String
        )
        end
      end

      # Customer Profiles integration summary

      struct CustomerProfilesIntegrationSummary
        include JSON::Serializable


        @[JSON::Field(key: "domainArn")]
        getter domain_arn : String


        @[JSON::Field(key: "objectTypeNames")]
        getter object_type_names : Hash(String, String)

        def initialize(
          @domain_arn : String,
          @object_type_names : Hash(String, String)
        )
        end
      end

      # The request for DeleteCampaignChannelSubtypeConfig API.

      struct DeleteCampaignChannelSubtypeConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelSubtype")]
        getter channel_subtype : String


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @channel_subtype : String,
          @id : String
        )
        end
      end

      # The request for DeleteCampaignCommunicationLimits API.

      struct DeleteCampaignCommunicationLimitsRequest
        include JSON::Serializable


        @[JSON::Field(key: "config")]
        getter config : String


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @config : String,
          @id : String
        )
        end
      end

      # The request for DeleteCampaignCommunicationTime API.

      struct DeleteCampaignCommunicationTimeRequest
        include JSON::Serializable


        @[JSON::Field(key: "config")]
        getter config : String


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @config : String,
          @id : String
        )
        end
      end

      # The request for DeleteCampaign API.

      struct DeleteCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The request for DeleteConnectInstanceConfig API.

      struct DeleteConnectInstanceConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "campaignDeletionPolicy")]
        getter campaign_deletion_policy : String?

        def initialize(
          @connect_instance_id : String,
          @campaign_deletion_policy : String? = nil
        )
        end
      end

      # The request for DeleteConnectInstanceIntegration API.

      struct DeleteConnectInstanceIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "integrationIdentifier")]
        getter integration_identifier : Types::IntegrationIdentifier

        def initialize(
          @connect_instance_id : String,
          @integration_identifier : Types::IntegrationIdentifier
        )
        end
      end

      # The request for DeleteInstanceOnboardingJob API.

      struct DeleteInstanceOnboardingJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # The request for DescribeCampaign API.

      struct DescribeCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The response for DescribeCampaign API.

      struct DescribeCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "campaign")]
        getter campaign : Types::Campaign?

        def initialize(
          @campaign : Types::Campaign? = nil
        )
        end
      end

      # Email Channel Subtype config

      struct EmailChannelSubtypeConfig
        include JSON::Serializable


        @[JSON::Field(key: "defaultOutboundConfig")]
        getter default_outbound_config : Types::EmailOutboundConfig


        @[JSON::Field(key: "outboundMode")]
        getter outbound_mode : Types::EmailOutboundMode


        @[JSON::Field(key: "capacity")]
        getter capacity : Float64?

        def initialize(
          @default_outbound_config : Types::EmailOutboundConfig,
          @outbound_mode : Types::EmailOutboundMode,
          @capacity : Float64? = nil
        )
        end
      end

      # Parameters for the Email Channel Subtype

      struct EmailChannelSubtypeParameters
        include JSON::Serializable


        @[JSON::Field(key: "destinationEmailAddress")]
        getter destination_email_address : String


        @[JSON::Field(key: "templateParameters")]
        getter template_parameters : Hash(String, String)


        @[JSON::Field(key: "connectSourceEmailAddress")]
        getter connect_source_email_address : String?


        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        def initialize(
          @destination_email_address : String,
          @template_parameters : Hash(String, String),
          @connect_source_email_address : String? = nil,
          @template_arn : String? = nil
        )
        end
      end

      # Default Email Outbound config

      struct EmailOutboundConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectSourceEmailAddress")]
        getter connect_source_email_address : String


        @[JSON::Field(key: "wisdomTemplateArn")]
        getter wisdom_template_arn : String


        @[JSON::Field(key: "sourceEmailAddressDisplayName")]
        getter source_email_address_display_name : String?

        def initialize(
          @connect_source_email_address : String,
          @wisdom_template_arn : String,
          @source_email_address_display_name : String? = nil
        )
        end
      end

      # Email Outbound Mode

      struct EmailOutboundMode
        include JSON::Serializable


        @[JSON::Field(key: "agentless")]
        getter agentless : Types::AgentlessConfig?

        def initialize(
          @agentless : Types::AgentlessConfig? = nil
        )
        end
      end

      # Encryption config for Connect Instance. Note that sensitive data will always be encrypted. If
      # disabled, service will perform encryption with its own key. If enabled, a KMS key id needs to be
      # provided and KMS charges will apply. KMS is only type supported

      struct EncryptionConfig
        include JSON::Serializable


        @[JSON::Field(key: "enabled")]
        getter enabled : Bool


        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String?


        @[JSON::Field(key: "keyArn")]
        getter key_arn : String?

        def initialize(
          @enabled : Bool,
          @encryption_type : String? = nil,
          @key_arn : String? = nil
        )
        end
      end

      # Event trigger of the campaign

      struct EventTrigger
        include JSON::Serializable


        @[JSON::Field(key: "customerProfilesDomainArn")]
        getter customer_profiles_domain_arn : String?

        def initialize(
          @customer_profiles_domain_arn : String? = nil
        )
        end
      end

      # Failed response of campaign state

      struct FailedCampaignStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "campaignId")]
        getter campaign_id : String?


        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        def initialize(
          @campaign_id : String? = nil,
          @failure_code : String? = nil
        )
        end
      end

      # Failure details for a profile outbound request

      struct FailedProfileOutboundRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @client_token : String? = nil,
          @failure_code : String? = nil,
          @id : String? = nil
        )
        end
      end

      # A failed request identified by the unique client token.

      struct FailedRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @client_token : String? = nil,
          @failure_code : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The request for GetCampaignStateBatch API.

      struct GetCampaignStateBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "campaignIds")]
        getter campaign_ids : Array(String)

        def initialize(
          @campaign_ids : Array(String)
        )
        end
      end

      # The response for GetCampaignStateBatch API.

      struct GetCampaignStateBatchResponse
        include JSON::Serializable


        @[JSON::Field(key: "failedRequests")]
        getter failed_requests : Array(Types::FailedCampaignStateResponse)?


        @[JSON::Field(key: "successfulRequests")]
        getter successful_requests : Array(Types::SuccessfulCampaignStateResponse)?

        def initialize(
          @failed_requests : Array(Types::FailedCampaignStateResponse)? = nil,
          @successful_requests : Array(Types::SuccessfulCampaignStateResponse)? = nil
        )
        end
      end

      # The request for GetCampaignState API.

      struct GetCampaignStateRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The response for GetCampaignState API.

      struct GetCampaignStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # The request for GetConnectInstanceConfig API.

      struct GetConnectInstanceConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # The response for GetConnectInstanceConfig API.

      struct GetConnectInstanceConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceConfig")]
        getter connect_instance_config : Types::InstanceConfig?

        def initialize(
          @connect_instance_config : Types::InstanceConfig? = nil
        )
        end
      end

      # The request for GetInstanceCommunicationLimits API.

      struct GetInstanceCommunicationLimitsRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # The response for GetInstanceCommunicationLimits API.

      struct GetInstanceCommunicationLimitsResponse
        include JSON::Serializable


        @[JSON::Field(key: "communicationLimitsConfig")]
        getter communication_limits_config : Types::InstanceCommunicationLimitsConfig?

        def initialize(
          @communication_limits_config : Types::InstanceCommunicationLimitsConfig? = nil
        )
        end
      end

      # The request for GetInstanceOnboardingJobStatus API.

      struct GetInstanceOnboardingJobStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # The response for GetInstanceOnboardingJobStatus API.

      struct GetInstanceOnboardingJobStatusResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceOnboardingJobStatus")]
        getter connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus?

        def initialize(
          @connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus? = nil
        )
        end
      end

      # Instance Communication limits config

      struct InstanceCommunicationLimitsConfig
        include JSON::Serializable


        @[JSON::Field(key: "allChannelSubtypes")]
        getter all_channel_subtypes : Types::CommunicationLimits?

        def initialize(
          @all_channel_subtypes : Types::CommunicationLimits? = nil
        )
        end
      end

      # Instance config object

      struct InstanceConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig


        @[JSON::Field(key: "serviceLinkedRoleArn")]
        getter service_linked_role_arn : String

        def initialize(
          @connect_instance_id : String,
          @encryption_config : Types::EncryptionConfig,
          @service_linked_role_arn : String
        )
        end
      end

      # Connect instance identifier filter

      struct InstanceIdFilter
        include JSON::Serializable


        @[JSON::Field(key: "operator")]
        getter operator : String


        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @operator : String,
          @value : String
        )
        end
      end

      # Instance onboarding job status object

      struct InstanceOnboardingJobStatus
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "status")]
        getter status : String


        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        def initialize(
          @connect_instance_id : String,
          @status : String,
          @failure_code : String? = nil
        )
        end
      end

      # Integration config for Connect Instance

      struct IntegrationConfig
        include JSON::Serializable


        @[JSON::Field(key: "customerProfiles")]
        getter customer_profiles : Types::CustomerProfilesIntegrationConfig?


        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaIntegrationConfig?


        @[JSON::Field(key: "qConnect")]
        getter q_connect : Types::QConnectIntegrationConfig?

        def initialize(
          @customer_profiles : Types::CustomerProfilesIntegrationConfig? = nil,
          @lambda : Types::LambdaIntegrationConfig? = nil,
          @q_connect : Types::QConnectIntegrationConfig? = nil
        )
        end
      end

      # Integration identifier for Connect instance

      struct IntegrationIdentifier
        include JSON::Serializable


        @[JSON::Field(key: "customerProfiles")]
        getter customer_profiles : Types::CustomerProfilesIntegrationIdentifier?


        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaIntegrationIdentifier?


        @[JSON::Field(key: "qConnect")]
        getter q_connect : Types::QConnectIntegrationIdentifier?

        def initialize(
          @customer_profiles : Types::CustomerProfilesIntegrationIdentifier? = nil,
          @lambda : Types::LambdaIntegrationIdentifier? = nil,
          @q_connect : Types::QConnectIntegrationIdentifier? = nil
        )
        end
      end

      # Integration summary for Connect instance.

      struct IntegrationSummary
        include JSON::Serializable


        @[JSON::Field(key: "customerProfiles")]
        getter customer_profiles : Types::CustomerProfilesIntegrationSummary?


        @[JSON::Field(key: "lambda")]
        getter lambda : Types::LambdaIntegrationSummary?


        @[JSON::Field(key: "qConnect")]
        getter q_connect : Types::QConnectIntegrationSummary?

        def initialize(
          @customer_profiles : Types::CustomerProfilesIntegrationSummary? = nil,
          @lambda : Types::LambdaIntegrationSummary? = nil,
          @q_connect : Types::QConnectIntegrationSummary? = nil
        )
        end
      end

      # Request processing failed because of an error or failure with the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the campaign.

      struct InvalidCampaignStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "state")]
        getter state : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @state : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state.

      struct InvalidStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # Lambda integration config

      struct LambdaIntegrationConfig
        include JSON::Serializable


        @[JSON::Field(key: "functionArn")]
        getter function_arn : String

        def initialize(
          @function_arn : String
        )
        end
      end

      # Lambda integration identifier

      struct LambdaIntegrationIdentifier
        include JSON::Serializable


        @[JSON::Field(key: "functionArn")]
        getter function_arn : String

        def initialize(
          @function_arn : String
        )
        end
      end

      # Lambda integration summary

      struct LambdaIntegrationSummary
        include JSON::Serializable


        @[JSON::Field(key: "functionArn")]
        getter function_arn : String

        def initialize(
          @function_arn : String
        )
        end
      end

      # The request for ListCampaigns API.

      struct ListCampaignsRequest
        include JSON::Serializable


        @[JSON::Field(key: "filters")]
        getter filters : Types::CampaignFilters?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Types::CampaignFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response for ListCampaigns API.

      struct ListCampaignsResponse
        include JSON::Serializable


        @[JSON::Field(key: "campaignSummaryList")]
        getter campaign_summary_list : Array(Types::CampaignSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @campaign_summary_list : Array(Types::CampaignSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request for ListConnectInstanceIntegrations API.

      struct ListConnectInstanceIntegrationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @connect_instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response for ListConnectInstanceIntegrations API.

      struct ListConnectInstanceIntegrationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "integrationSummaryList")]
        getter integration_summary_list : Array(Types::IntegrationSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @integration_summary_list : Array(Types::IntegrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request for ListTagsForResource API.

      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The request for ListTagsForResource API.

      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Local time zone config

      struct LocalTimeZoneConfig
        include JSON::Serializable


        @[JSON::Field(key: "defaultTimeZone")]
        getter default_time_zone : String?


        @[JSON::Field(key: "localTimeZoneDetection")]
        getter local_time_zone_detection : Array(String)?

        def initialize(
          @default_time_zone : String? = nil,
          @local_time_zone_detection : Array(String)? = nil
        )
        end
      end

      # Open Hours config

      struct OpenHours
        include JSON::Serializable


        @[JSON::Field(key: "dailyHours")]
        getter daily_hours : Hash(String, Array(Types::TimeRange))?

        def initialize(
          @daily_hours : Hash(String, Array(Types::TimeRange))? = nil
        )
        end
      end

      # An outbound request for a campaign.

      struct OutboundRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelSubtypeParameters")]
        getter channel_subtype_parameters : Types::ChannelSubtypeParameters


        @[JSON::Field(key: "clientToken")]
        getter client_token : String


        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time

        def initialize(
          @channel_subtype_parameters : Types::ChannelSubtypeParameters,
          @client_token : String,
          @expiration_time : Time
        )
        end
      end

      # The request for PauseCampaign API.

      struct PauseCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Predictive config

      struct PredictiveConfig
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthAllocation")]
        getter bandwidth_allocation : Float64

        def initialize(
          @bandwidth_allocation : Float64
        )
        end
      end

      # Preview config

      struct PreviewConfig
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthAllocation")]
        getter bandwidth_allocation : Float64


        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig


        @[JSON::Field(key: "agentActions")]
        getter agent_actions : Array(String)?

        def initialize(
          @bandwidth_allocation : Float64,
          @timeout_config : Types::TimeoutConfig,
          @agent_actions : Array(String)? = nil
        )
        end
      end

      # Information about a profile outbound request

      struct ProfileOutboundRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String


        @[JSON::Field(key: "profileId")]
        getter profile_id : String


        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time?

        def initialize(
          @client_token : String,
          @profile_id : String,
          @expiration_time : Time? = nil
        )
        end
      end

      # Progressive config

      struct ProgressiveConfig
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthAllocation")]
        getter bandwidth_allocation : Float64

        def initialize(
          @bandwidth_allocation : Float64
        )
        end
      end

      # The request for PutConnectInstanceIntegration API.

      struct PutConnectInstanceIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "integrationConfig")]
        getter integration_config : Types::IntegrationConfig

        def initialize(
          @connect_instance_id : String,
          @integration_config : Types::IntegrationConfig
        )
        end
      end

      # The request for PutInstanceCommunicationLimits API.

      struct PutInstanceCommunicationLimitsRequest
        include JSON::Serializable


        @[JSON::Field(key: "communicationLimitsConfig")]
        getter communication_limits_config : Types::InstanceCommunicationLimitsConfig


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @communication_limits_config : Types::InstanceCommunicationLimitsConfig,
          @connect_instance_id : String
        )
        end
      end

      # The request for PutOutboundRequestBatch API.

      struct PutOutboundRequestBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "outboundRequests")]
        getter outbound_requests : Array(Types::OutboundRequest)

        def initialize(
          @id : String,
          @outbound_requests : Array(Types::OutboundRequest)
        )
        end
      end

      # The response for PutOutboundRequestBatch API.

      struct PutOutboundRequestBatchResponse
        include JSON::Serializable


        @[JSON::Field(key: "failedRequests")]
        getter failed_requests : Array(Types::FailedRequest)?


        @[JSON::Field(key: "successfulRequests")]
        getter successful_requests : Array(Types::SuccessfulRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedRequest)? = nil,
          @successful_requests : Array(Types::SuccessfulRequest)? = nil
        )
        end
      end

      # The request for PutProfileOutboundRequestBatch API

      struct PutProfileOutboundRequestBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "profileOutboundRequests")]
        getter profile_outbound_requests : Array(Types::ProfileOutboundRequest)

        def initialize(
          @id : String,
          @profile_outbound_requests : Array(Types::ProfileOutboundRequest)
        )
        end
      end

      # The response for PutProfileOutboundRequestBatch API

      struct PutProfileOutboundRequestBatchResponse
        include JSON::Serializable


        @[JSON::Field(key: "failedRequests")]
        getter failed_requests : Array(Types::FailedProfileOutboundRequest)?


        @[JSON::Field(key: "successfulRequests")]
        getter successful_requests : Array(Types::SuccessfulProfileOutboundRequest)?

        def initialize(
          @failed_requests : Array(Types::FailedProfileOutboundRequest)? = nil,
          @successful_requests : Array(Types::SuccessfulProfileOutboundRequest)? = nil
        )
        end
      end

      # Q Connect integration config

      struct QConnectIntegrationConfig
        include JSON::Serializable


        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        def initialize(
          @knowledge_base_arn : String
        )
        end
      end

      # Q Connect integration identifier

      struct QConnectIntegrationIdentifier
        include JSON::Serializable


        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        def initialize(
          @knowledge_base_arn : String
        )
        end
      end

      # Q Connect integration summary

      struct QConnectIntegrationSummary
        include JSON::Serializable


        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        def initialize(
          @knowledge_base_arn : String
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # Restricted period

      struct RestrictedPeriod
        include JSON::Serializable


        @[JSON::Field(key: "endDate")]
        getter end_date : String


        @[JSON::Field(key: "startDate")]
        getter start_date : String


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @end_date : String,
          @start_date : String,
          @name : String? = nil
        )
        end
      end

      # Restricted period config

      struct RestrictedPeriods
        include JSON::Serializable


        @[JSON::Field(key: "restrictedPeriodList")]
        getter restricted_period_list : Array(Types::RestrictedPeriod)?

        def initialize(
          @restricted_period_list : Array(Types::RestrictedPeriod)? = nil
        )
        end
      end

      # The request for ResumeCampaign API.

      struct ResumeCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Campaign schedule

      struct Schedule
        include JSON::Serializable


        @[JSON::Field(key: "endTime")]
        getter end_time : Time


        @[JSON::Field(key: "startTime")]
        getter start_time : Time


        @[JSON::Field(key: "refreshFrequency")]
        getter refresh_frequency : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @refresh_frequency : String? = nil
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # SMS Channel Subtype config

      struct SmsChannelSubtypeConfig
        include JSON::Serializable


        @[JSON::Field(key: "defaultOutboundConfig")]
        getter default_outbound_config : Types::SmsOutboundConfig


        @[JSON::Field(key: "outboundMode")]
        getter outbound_mode : Types::SmsOutboundMode


        @[JSON::Field(key: "capacity")]
        getter capacity : Float64?

        def initialize(
          @default_outbound_config : Types::SmsOutboundConfig,
          @outbound_mode : Types::SmsOutboundMode,
          @capacity : Float64? = nil
        )
        end
      end

      # Parameters for the SMS Channel Subtype

      struct SmsChannelSubtypeParameters
        include JSON::Serializable


        @[JSON::Field(key: "destinationPhoneNumber")]
        getter destination_phone_number : String


        @[JSON::Field(key: "templateParameters")]
        getter template_parameters : Hash(String, String)


        @[JSON::Field(key: "connectSourcePhoneNumberArn")]
        getter connect_source_phone_number_arn : String?


        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        def initialize(
          @destination_phone_number : String,
          @template_parameters : Hash(String, String),
          @connect_source_phone_number_arn : String? = nil,
          @template_arn : String? = nil
        )
        end
      end

      # Default SMS Outbound config

      struct SmsOutboundConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectSourcePhoneNumberArn")]
        getter connect_source_phone_number_arn : String


        @[JSON::Field(key: "wisdomTemplateArn")]
        getter wisdom_template_arn : String

        def initialize(
          @connect_source_phone_number_arn : String,
          @wisdom_template_arn : String
        )
        end
      end

      # SMS Outbound Mode

      struct SmsOutboundMode
        include JSON::Serializable


        @[JSON::Field(key: "agentless")]
        getter agentless : Types::AgentlessConfig?

        def initialize(
          @agentless : Types::AgentlessConfig? = nil
        )
        end
      end

      # Source of the campaign

      struct Source
        include JSON::Serializable


        @[JSON::Field(key: "customerProfilesSegmentArn")]
        getter customer_profiles_segment_arn : String?


        @[JSON::Field(key: "eventTrigger")]
        getter event_trigger : Types::EventTrigger?

        def initialize(
          @customer_profiles_segment_arn : String? = nil,
          @event_trigger : Types::EventTrigger? = nil
        )
        end
      end

      # The request for StartCampaign API.

      struct StartCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # The request for StartInstanceOnboardingJob API.

      struct StartInstanceOnboardingJobRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig

        def initialize(
          @connect_instance_id : String,
          @encryption_config : Types::EncryptionConfig
        )
        end
      end

      # The response for StartInstanceOnboardingJob API.

      struct StartInstanceOnboardingJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceOnboardingJobStatus")]
        getter connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus?

        def initialize(
          @connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus? = nil
        )
        end
      end

      # The request for StopCampaign API.

      struct StopCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Successful response of campaign state

      struct SuccessfulCampaignStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "campaignId")]
        getter campaign_id : String?


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @campaign_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Success details for a profile outbound request

      struct SuccessfulProfileOutboundRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @client_token : String? = nil,
          @id : String? = nil
        )
        end
      end

      # A successful request identified by the unique client token.

      struct SuccessfulRequest
        include JSON::Serializable


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?


        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @client_token : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The request for TagResource API.

      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # Telephony Channel Subtype config

      struct TelephonyChannelSubtypeConfig
        include JSON::Serializable


        @[JSON::Field(key: "defaultOutboundConfig")]
        getter default_outbound_config : Types::TelephonyOutboundConfig


        @[JSON::Field(key: "outboundMode")]
        getter outbound_mode : Types::TelephonyOutboundMode


        @[JSON::Field(key: "capacity")]
        getter capacity : Float64?


        @[JSON::Field(key: "connectQueueId")]
        getter connect_queue_id : String?

        def initialize(
          @default_outbound_config : Types::TelephonyOutboundConfig,
          @outbound_mode : Types::TelephonyOutboundMode,
          @capacity : Float64? = nil,
          @connect_queue_id : String? = nil
        )
        end
      end

      # Parameters for the Telephony Channel Subtype

      struct TelephonyChannelSubtypeParameters
        include JSON::Serializable


        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)


        @[JSON::Field(key: "destinationPhoneNumber")]
        getter destination_phone_number : String


        @[JSON::Field(key: "answerMachineDetectionConfig")]
        getter answer_machine_detection_config : Types::AnswerMachineDetectionConfig?


        @[JSON::Field(key: "connectSourcePhoneNumber")]
        getter connect_source_phone_number : String?


        @[JSON::Field(key: "ringTimeout")]
        getter ring_timeout : Int32?

        def initialize(
          @attributes : Hash(String, String),
          @destination_phone_number : String,
          @answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
          @connect_source_phone_number : String? = nil,
          @ring_timeout : Int32? = nil
        )
        end
      end

      # Default Telephony Outbound config

      struct TelephonyOutboundConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectContactFlowId")]
        getter connect_contact_flow_id : String


        @[JSON::Field(key: "answerMachineDetectionConfig")]
        getter answer_machine_detection_config : Types::AnswerMachineDetectionConfig?


        @[JSON::Field(key: "connectSourcePhoneNumber")]
        getter connect_source_phone_number : String?


        @[JSON::Field(key: "ringTimeout")]
        getter ring_timeout : Int32?

        def initialize(
          @connect_contact_flow_id : String,
          @answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
          @connect_source_phone_number : String? = nil,
          @ring_timeout : Int32? = nil
        )
        end
      end

      # Telephony Outbound Mode

      struct TelephonyOutboundMode
        include JSON::Serializable


        @[JSON::Field(key: "agentless")]
        getter agentless : Types::AgentlessConfig?


        @[JSON::Field(key: "predictive")]
        getter predictive : Types::PredictiveConfig?


        @[JSON::Field(key: "preview")]
        getter preview : Types::PreviewConfig?


        @[JSON::Field(key: "progressive")]
        getter progressive : Types::ProgressiveConfig?

        def initialize(
          @agentless : Types::AgentlessConfig? = nil,
          @predictive : Types::PredictiveConfig? = nil,
          @preview : Types::PreviewConfig? = nil,
          @progressive : Types::ProgressiveConfig? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # Time range in 24 hour format

      struct TimeRange
        include JSON::Serializable


        @[JSON::Field(key: "endTime")]
        getter end_time : String


        @[JSON::Field(key: "startTime")]
        getter start_time : String

        def initialize(
          @end_time : String,
          @start_time : String
        )
        end
      end

      # Time window config

      struct TimeWindow
        include JSON::Serializable


        @[JSON::Field(key: "openHours")]
        getter open_hours : Types::OpenHours


        @[JSON::Field(key: "restrictedPeriods")]
        getter restricted_periods : Types::RestrictedPeriods?

        def initialize(
          @open_hours : Types::OpenHours,
          @restricted_periods : Types::RestrictedPeriods? = nil
        )
        end
      end

      # Timeout Config for preview contacts.

      struct TimeoutConfig
        include JSON::Serializable


        @[JSON::Field(key: "durationInSeconds")]
        getter duration_in_seconds : Int32

        def initialize(
          @duration_in_seconds : Int32
        )
        end
      end

      # The request for UntagResource API.

      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # The request for UpdateCampaignChannelSubtypeConfig API.

      struct UpdateCampaignChannelSubtypeConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "channelSubtypeConfig")]
        getter channel_subtype_config : Types::ChannelSubtypeConfig


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @channel_subtype_config : Types::ChannelSubtypeConfig,
          @id : String
        )
        end
      end

      # The request for UpdateCampaignCommunicationLimits API.

      struct UpdateCampaignCommunicationLimitsRequest
        include JSON::Serializable


        @[JSON::Field(key: "communicationLimitsOverride")]
        getter communication_limits_override : Types::CommunicationLimitsConfig


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @communication_limits_override : Types::CommunicationLimitsConfig,
          @id : String
        )
        end
      end

      # The request for UpdateCampaignCommunicationTime API.

      struct UpdateCampaignCommunicationTimeRequest
        include JSON::Serializable


        @[JSON::Field(key: "communicationTimeConfig")]
        getter communication_time_config : Types::CommunicationTimeConfig


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @communication_time_config : Types::CommunicationTimeConfig,
          @id : String
        )
        end
      end

      # The request for UpdateCampaignFlowAssociation API.

      struct UpdateCampaignFlowAssociationRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectCampaignFlowArn")]
        getter connect_campaign_flow_arn : String


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @connect_campaign_flow_arn : String,
          @id : String
        )
        end
      end

      # The request for UpdateCampaignName API.

      struct UpdateCampaignNameRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end

      # The request for UpdateCampaignSchedule API.

      struct UpdateCampaignScheduleRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule

        def initialize(
          @id : String,
          @schedule : Types::Schedule
        )
        end
      end

      # The request for UpdateCampaignSource API.

      struct UpdateCampaignSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "source")]
        getter source : Types::Source

        def initialize(
          @id : String,
          @source : Types::Source
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter x_amz_error_type : String?

        def initialize(
          @message : String,
          @x_amz_error_type : String? = nil
        )
        end
      end

      # WhatsApp Channel Subtype config

      struct WhatsAppChannelSubtypeConfig
        include JSON::Serializable


        @[JSON::Field(key: "defaultOutboundConfig")]
        getter default_outbound_config : Types::WhatsAppOutboundConfig


        @[JSON::Field(key: "outboundMode")]
        getter outbound_mode : Types::WhatsAppOutboundMode


        @[JSON::Field(key: "capacity")]
        getter capacity : Float64?

        def initialize(
          @default_outbound_config : Types::WhatsAppOutboundConfig,
          @outbound_mode : Types::WhatsAppOutboundMode,
          @capacity : Float64? = nil
        )
        end
      end

      # Parameters for the WhatsApp Channel Subtype

      struct WhatsAppChannelSubtypeParameters
        include JSON::Serializable


        @[JSON::Field(key: "destinationPhoneNumber")]
        getter destination_phone_number : String


        @[JSON::Field(key: "templateParameters")]
        getter template_parameters : Hash(String, String)


        @[JSON::Field(key: "connectSourcePhoneNumberArn")]
        getter connect_source_phone_number_arn : String?


        @[JSON::Field(key: "templateArn")]
        getter template_arn : String?

        def initialize(
          @destination_phone_number : String,
          @template_parameters : Hash(String, String),
          @connect_source_phone_number_arn : String? = nil,
          @template_arn : String? = nil
        )
        end
      end

      # Default WhatsApp Outbound config

      struct WhatsAppOutboundConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectSourcePhoneNumberArn")]
        getter connect_source_phone_number_arn : String


        @[JSON::Field(key: "wisdomTemplateArn")]
        getter wisdom_template_arn : String

        def initialize(
          @connect_source_phone_number_arn : String,
          @wisdom_template_arn : String
        )
        end
      end

      # WhatsApp Outbound Mode

      struct WhatsAppOutboundMode
        include JSON::Serializable


        @[JSON::Field(key: "agentless")]
        getter agentless : Types::AgentlessConfig?

        def initialize(
          @agentless : Types::AgentlessConfig? = nil
        )
        end
      end
    end
  end
end
