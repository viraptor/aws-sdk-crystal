require "json"
require "time"

module AwsSdk
  module ConnectCampaigns
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

      # Agentless Dialer config

      struct AgentlessDialerConfig
        include JSON::Serializable


        @[JSON::Field(key: "dialingCapacity")]
        getter dialing_capacity : Float64?

        def initialize(
          @dialing_capacity : Float64? = nil
        )
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


        @[JSON::Field(key: "dialerConfig")]
        getter dialer_config : Types::DialerConfig


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "outboundCallConfig")]
        getter outbound_call_config : Types::OutboundCallConfig


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @connect_instance_id : String,
          @dialer_config : Types::DialerConfig,
          @id : String,
          @name : String,
          @outbound_call_config : Types::OutboundCallConfig,
          @tags : Hash(String, String)? = nil
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


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @connect_instance_id : String,
          @id : String,
          @name : String
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

      # The request for Create Campaign API.

      struct CreateCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String


        @[JSON::Field(key: "dialerConfig")]
        getter dialer_config : Types::DialerConfig


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "outboundCallConfig")]
        getter outbound_call_config : Types::OutboundCallConfig


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connect_instance_id : String,
          @dialer_config : Types::DialerConfig,
          @name : String,
          @outbound_call_config : Types::OutboundCallConfig,
          @tags : Hash(String, String)? = nil
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

      # DeleteCampaignRequest

      struct DeleteCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # DeleteCampaignRequest

      struct DeleteConnectInstanceConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
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

      # DescribeCampaignRequests

      struct DescribeCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # DescribeCampaignResponse

      struct DescribeCampaignResponse
        include JSON::Serializable


        @[JSON::Field(key: "campaign")]
        getter campaign : Types::Campaign?

        def initialize(
          @campaign : Types::Campaign? = nil
        )
        end
      end

      # A dial request for a campaign.

      struct DialRequest
        include JSON::Serializable


        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)


        @[JSON::Field(key: "clientToken")]
        getter client_token : String


        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time


        @[JSON::Field(key: "phoneNumber")]
        getter phone_number : String

        def initialize(
          @attributes : Hash(String, String),
          @client_token : String,
          @expiration_time : Time,
          @phone_number : String
        )
        end
      end

      # The possible types of dialer config parameters

      struct DialerConfig
        include JSON::Serializable


        @[JSON::Field(key: "agentlessDialerConfig")]
        getter agentless_dialer_config : Types::AgentlessDialerConfig?


        @[JSON::Field(key: "predictiveDialerConfig")]
        getter predictive_dialer_config : Types::PredictiveDialerConfig?


        @[JSON::Field(key: "progressiveDialerConfig")]
        getter progressive_dialer_config : Types::ProgressiveDialerConfig?

        def initialize(
          @agentless_dialer_config : Types::AgentlessDialerConfig? = nil,
          @predictive_dialer_config : Types::PredictiveDialerConfig? = nil,
          @progressive_dialer_config : Types::ProgressiveDialerConfig? = nil
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

      # GetCampaignStateBatchRequest

      struct GetCampaignStateBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "campaignIds")]
        getter campaign_ids : Array(String)

        def initialize(
          @campaign_ids : Array(String)
        )
        end
      end

      # GetCampaignStateBatchResponse

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

      # GetCampaignStateRequest

      struct GetCampaignStateRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # GetCampaignStateResponse

      struct GetCampaignStateResponse
        include JSON::Serializable


        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # GetConnectInstanceConfigRequest

      struct GetConnectInstanceConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # GetConnectInstanceConfigResponse

      struct GetConnectInstanceConfigResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceConfig")]
        getter connect_instance_config : Types::InstanceConfig?

        def initialize(
          @connect_instance_config : Types::InstanceConfig? = nil
        )
        end
      end

      # GetInstanceOnboardingJobStatusRequest

      struct GetInstanceOnboardingJobStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceId")]
        getter connect_instance_id : String

        def initialize(
          @connect_instance_id : String
        )
        end
      end

      # GetInstanceOnboardingJobStatusResponse

      struct GetInstanceOnboardingJobStatusResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectInstanceOnboardingJobStatus")]
        getter connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus?

        def initialize(
          @connect_instance_onboarding_job_status : Types::InstanceOnboardingJobStatus? = nil
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

      # ListCampaignsRequest

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

      # ListCampaignsResponse

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

      # ListTagsForResource

      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # ListTagsForResponse

      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration used for outbound calls.

      struct OutboundCallConfig
        include JSON::Serializable


        @[JSON::Field(key: "connectContactFlowId")]
        getter connect_contact_flow_id : String


        @[JSON::Field(key: "answerMachineDetectionConfig")]
        getter answer_machine_detection_config : Types::AnswerMachineDetectionConfig?


        @[JSON::Field(key: "connectQueueId")]
        getter connect_queue_id : String?


        @[JSON::Field(key: "connectSourcePhoneNumber")]
        getter connect_source_phone_number : String?

        def initialize(
          @connect_contact_flow_id : String,
          @answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
          @connect_queue_id : String? = nil,
          @connect_source_phone_number : String? = nil
        )
        end
      end

      # PauseCampaignRequest

      struct PauseCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Predictive Dialer config

      struct PredictiveDialerConfig
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthAllocation")]
        getter bandwidth_allocation : Float64


        @[JSON::Field(key: "dialingCapacity")]
        getter dialing_capacity : Float64?

        def initialize(
          @bandwidth_allocation : Float64,
          @dialing_capacity : Float64? = nil
        )
        end
      end

      # Progressive Dialer config

      struct ProgressiveDialerConfig
        include JSON::Serializable


        @[JSON::Field(key: "bandwidthAllocation")]
        getter bandwidth_allocation : Float64


        @[JSON::Field(key: "dialingCapacity")]
        getter dialing_capacity : Float64?

        def initialize(
          @bandwidth_allocation : Float64,
          @dialing_capacity : Float64? = nil
        )
        end
      end

      # PutDialRequestBatchRequest

      struct PutDialRequestBatchRequest
        include JSON::Serializable


        @[JSON::Field(key: "dialRequests")]
        getter dial_requests : Array(Types::DialRequest)


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @dial_requests : Array(Types::DialRequest),
          @id : String
        )
        end
      end

      # PutDialRequestBatchResponse

      struct PutDialRequestBatchResponse
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

      # ResumeCampaignRequest

      struct ResumeCampaignRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
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

      # StartCampaignRequest

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

      # StopCampaignRequest

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

      # TagResourceRequest

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

      # UntagResourceRequest

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

      # UpdateCampaignDialerConfigRequest

      struct UpdateCampaignDialerConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "dialerConfig")]
        getter dialer_config : Types::DialerConfig


        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @dialer_config : Types::DialerConfig,
          @id : String
        )
        end
      end

      # UpdateCampaignNameRequest

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

      # UpdateCampaignOutboundCallConfigRequest

      struct UpdateCampaignOutboundCallConfigRequest
        include JSON::Serializable


        @[JSON::Field(key: "id")]
        getter id : String


        @[JSON::Field(key: "answerMachineDetectionConfig")]
        getter answer_machine_detection_config : Types::AnswerMachineDetectionConfig?


        @[JSON::Field(key: "connectContactFlowId")]
        getter connect_contact_flow_id : String?


        @[JSON::Field(key: "connectSourcePhoneNumber")]
        getter connect_source_phone_number : String?

        def initialize(
          @id : String,
          @answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
          @connect_contact_flow_id : String? = nil,
          @connect_source_phone_number : String? = nil
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
    end
  end
end
