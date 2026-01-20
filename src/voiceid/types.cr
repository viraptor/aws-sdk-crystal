require "json"
require "time"

module Aws
  module VoiceID
    module Types

      # You do not have sufficient permissions to perform this action. Check the error message and try
      # again.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateFraudsterRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the fraudster to be associated with the watchlist.

        @[JSON::Field(key: "FraudsterId")]
        getter fraudster_id : String

        # The identifier of the watchlist you want to associate with the fraudster.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String

        def initialize(
          @domain_id : String,
          @fraudster_id : String,
          @watchlist_id : String
        )
        end
      end


      struct AssociateFraudsterResponse
        include JSON::Serializable


        @[JSON::Field(key: "Fraudster")]
        getter fraudster : Types::Fraudster?

        def initialize(
          @fraudster : Types::Fraudster? = nil
        )
        end
      end

      # The configuration used to authenticate a speaker during a session.

      struct AuthenticationConfiguration
        include JSON::Serializable

        # The minimum threshold needed to successfully authenticate a speaker.

        @[JSON::Field(key: "AcceptanceThreshold")]
        getter acceptance_threshold : Int32

        def initialize(
          @acceptance_threshold : Int32
        )
        end
      end

      # The authentication result produced by Voice ID, processed against the current session state and
      # streamed audio of the speaker.

      struct AuthenticationResult
        include JSON::Serializable

        # A timestamp of when audio aggregation ended for this authentication result.

        @[JSON::Field(key: "AudioAggregationEndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter audio_aggregation_ended_at : Time?

        # A timestamp of when audio aggregation started for this authentication result.

        @[JSON::Field(key: "AudioAggregationStartedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter audio_aggregation_started_at : Time?

        # The unique identifier for this authentication result. Because there can be multiple authentications
        # for a given session, this field helps to identify if the returned result is from a previous
        # streaming activity or a new result. Note that in absence of any new streaming activity,
        # AcceptanceThreshold changes, or SpeakerId changes, Voice ID always returns cached Authentication
        # Result for this API.

        @[JSON::Field(key: "AuthenticationResultId")]
        getter authentication_result_id : String?

        # The AuthenticationConfiguration used to generate this authentication result.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::AuthenticationConfiguration?

        # The client-provided identifier for the speaker whose authentication result is produced. Only present
        # if a SpeakerId is provided for the session.

        @[JSON::Field(key: "CustomerSpeakerId")]
        getter customer_speaker_id : String?

        # The authentication decision produced by Voice ID, processed against the current session state and
        # streamed audio of the speaker.

        @[JSON::Field(key: "Decision")]
        getter decision : String?

        # The service-generated identifier for the speaker whose authentication result is produced.

        @[JSON::Field(key: "GeneratedSpeakerId")]
        getter generated_speaker_id : String?

        # The authentication score for the speaker whose authentication result is produced. This value is only
        # present if the authentication decision is either ACCEPT or REJECT .

        @[JSON::Field(key: "Score")]
        getter score : Int32?

        def initialize(
          @audio_aggregation_ended_at : Time? = nil,
          @audio_aggregation_started_at : Time? = nil,
          @authentication_result_id : String? = nil,
          @configuration : Types::AuthenticationConfiguration? = nil,
          @customer_speaker_id : String? = nil,
          @decision : String? = nil,
          @generated_speaker_id : String? = nil,
          @score : Int32? = nil
        )
        end
      end

      # The request failed due to a conflict. Check the ConflictType and error message for more details.

      struct ConflictException
        include JSON::Serializable

        # The type of conflict which caused a ConflictException. Possible types and the corresponding error
        # messages are as follows: DOMAIN_NOT_ACTIVE : The domain is not active.
        # CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT : You cannot change the speaker ID after an enrollment has
        # been requested. ENROLLMENT_ALREADY_EXISTS : There is already an enrollment for this session.
        # SPEAKER_NOT_SET : You must set the speaker ID before requesting an enrollment. SPEAKER_OPTED_OUT :
        # You cannot request an enrollment for an opted out speaker. CONCURRENT_CHANGES : The request could
        # not be processed as the resource was modified by another request during execution.

        @[JSON::Field(key: "ConflictType")]
        getter conflict_type : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @conflict_type : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The configuration, containing the KMS key identifier, to be used by Voice ID for the server-side
        # encryption of your data. Refer to Amazon Connect Voice ID encryption at rest for more details on how
        # the KMS key is used.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A brief description of this domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of tags you want added to the domain.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDomainResponse
        include JSON::Serializable

        # Information about the newly created domain.

        @[JSON::Field(key: "Domain")]
        getter domain : Types::Domain?

        def initialize(
          @domain : Types::Domain? = nil
        )
        end
      end


      struct CreateWatchlistRequest
        include JSON::Serializable

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The name of the watchlist.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A brief description of this watchlist.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateWatchlistResponse
        include JSON::Serializable

        # Information about the newly created watchlist.

        @[JSON::Field(key: "Watchlist")]
        getter watchlist : Types::Watchlist?

        def initialize(
          @watchlist : Types::Watchlist? = nil
        )
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # The identifier of the domain you want to delete.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        def initialize(
          @domain_id : String
        )
        end
      end


      struct DeleteFraudsterRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the fraudster you want to delete.

        @[JSON::Field(key: "FraudsterId")]
        getter fraudster_id : String

        def initialize(
          @domain_id : String,
          @fraudster_id : String
        )
        end
      end


      struct DeleteSpeakerRequest
        include JSON::Serializable

        # The identifier of the domain that contains the speaker.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the speaker you want to delete.

        @[JSON::Field(key: "SpeakerId")]
        getter speaker_id : String

        def initialize(
          @domain_id : String,
          @speaker_id : String
        )
        end
      end


      struct DeleteWatchlistRequest
        include JSON::Serializable

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the watchlist to be deleted.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String

        def initialize(
          @domain_id : String,
          @watchlist_id : String
        )
        end
      end


      struct DescribeDomainRequest
        include JSON::Serializable

        # The identifier of the domain that you are describing.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        def initialize(
          @domain_id : String
        )
        end
      end


      struct DescribeDomainResponse
        include JSON::Serializable

        # Information about the specified domain.

        @[JSON::Field(key: "Domain")]
        getter domain : Types::Domain?

        def initialize(
          @domain : Types::Domain? = nil
        )
        end
      end


      struct DescribeFraudsterRegistrationJobRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster registration job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the fraudster registration job you are describing.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_id : String,
          @job_id : String
        )
        end
      end


      struct DescribeFraudsterRegistrationJobResponse
        include JSON::Serializable

        # Contains details about the specified fraudster registration job.

        @[JSON::Field(key: "Job")]
        getter job : Types::FraudsterRegistrationJob?

        def initialize(
          @job : Types::FraudsterRegistrationJob? = nil
        )
        end
      end


      struct DescribeFraudsterRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the fraudster you are describing.

        @[JSON::Field(key: "FraudsterId")]
        getter fraudster_id : String

        def initialize(
          @domain_id : String,
          @fraudster_id : String
        )
        end
      end


      struct DescribeFraudsterResponse
        include JSON::Serializable

        # Information about the specified fraudster.

        @[JSON::Field(key: "Fraudster")]
        getter fraudster : Types::Fraudster?

        def initialize(
          @fraudster : Types::Fraudster? = nil
        )
        end
      end


      struct DescribeSpeakerEnrollmentJobRequest
        include JSON::Serializable

        # The identifier of the domain that contains the speaker enrollment job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the speaker enrollment job you are describing.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @domain_id : String,
          @job_id : String
        )
        end
      end


      struct DescribeSpeakerEnrollmentJobResponse
        include JSON::Serializable

        # Contains details about the specified speaker enrollment job.

        @[JSON::Field(key: "Job")]
        getter job : Types::SpeakerEnrollmentJob?

        def initialize(
          @job : Types::SpeakerEnrollmentJob? = nil
        )
        end
      end


      struct DescribeSpeakerRequest
        include JSON::Serializable

        # The identifier of the domain that contains the speaker.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the speaker you are describing.

        @[JSON::Field(key: "SpeakerId")]
        getter speaker_id : String

        def initialize(
          @domain_id : String,
          @speaker_id : String
        )
        end
      end


      struct DescribeSpeakerResponse
        include JSON::Serializable

        # Information about the specified speaker.

        @[JSON::Field(key: "Speaker")]
        getter speaker : Types::Speaker?

        def initialize(
          @speaker : Types::Speaker? = nil
        )
        end
      end


      struct DescribeWatchlistRequest
        include JSON::Serializable

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the watchlist that you are describing.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String

        def initialize(
          @domain_id : String,
          @watchlist_id : String
        )
        end
      end


      struct DescribeWatchlistResponse
        include JSON::Serializable

        # Information about the specified watchlist.

        @[JSON::Field(key: "Watchlist")]
        getter watchlist : Types::Watchlist?

        def initialize(
          @watchlist : Types::Watchlist? = nil
        )
        end
      end


      struct DisassociateFraudsterRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the fraudster to be disassociated from the watchlist.

        @[JSON::Field(key: "FraudsterId")]
        getter fraudster_id : String

        # The identifier of the watchlist that you want to disassociate from the fraudster.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String

        def initialize(
          @domain_id : String,
          @fraudster_id : String,
          @watchlist_id : String
        )
        end
      end


      struct DisassociateFraudsterResponse
        include JSON::Serializable


        @[JSON::Field(key: "Fraudster")]
        getter fraudster : Types::Fraudster?

        def initialize(
          @fraudster : Types::Fraudster? = nil
        )
        end
      end

      # Contains all the information about a domain.

      struct Domain
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the domain.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description of the domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The current status of the domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : String?

        # The name for the domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The server-side encryption configuration containing the KMS key identifier you want Voice ID to use
        # to encrypt your data.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Details about the most recent server-side encryption configuration update. When the server-side
        # encryption configuration is changed, dependency on the old KMS key is removed through an
        # asynchronous process. When this update is complete, the domain's data can only be accessed using the
        # new KMS key.

        @[JSON::Field(key: "ServerSideEncryptionUpdateDetails")]
        getter server_side_encryption_update_details : Types::ServerSideEncryptionUpdateDetails?

        # The timestamp of when the domain was last update.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The watchlist details of a domain. Contains the default watchlist ID of the domain.

        @[JSON::Field(key: "WatchlistDetails")]
        getter watchlist_details : Types::WatchlistDetails?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @domain_status : String? = nil,
          @name : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @server_side_encryption_update_details : Types::ServerSideEncryptionUpdateDetails? = nil,
          @updated_at : Time? = nil,
          @watchlist_details : Types::WatchlistDetails? = nil
        )
        end
      end

      # Contains a summary of information about a domain.

      struct DomainSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the domain.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The timestamp of when the domain was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description of the domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The current status of the domain.

        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : String?

        # The client-provided name for the domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The server-side encryption configuration containing the KMS key identifier you want Voice ID to use
        # to encrypt your data.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Details about the most recent server-side encryption configuration update. When the server-side
        # encryption configuration is changed, dependency on the old KMS key is removed through an
        # asynchronous process. When this update is complete, the domain's data can only be accessed using the
        # new KMS key.

        @[JSON::Field(key: "ServerSideEncryptionUpdateDetails")]
        getter server_side_encryption_update_details : Types::ServerSideEncryptionUpdateDetails?

        # The timestamp of when the domain was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # Provides information about watchlistDetails and DefaultWatchlistID .

        @[JSON::Field(key: "WatchlistDetails")]
        getter watchlist_details : Types::WatchlistDetails?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @domain_status : String? = nil,
          @name : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @server_side_encryption_update_details : Types::ServerSideEncryptionUpdateDetails? = nil,
          @updated_at : Time? = nil,
          @watchlist_details : Types::WatchlistDetails? = nil
        )
        end
      end

      # Contains configurations defining enrollment behavior for the batch job.

      struct EnrollmentConfig
        include JSON::Serializable

        # The action to take when the specified speaker is already enrolled in the specified domain. The
        # default value is SKIP , which skips the enrollment for the existing speaker. Setting the value to
        # OVERWRITE replaces the existing voice prints and enrollment audio stored for that speaker with new
        # data generated from the latest audio.

        @[JSON::Field(key: "ExistingEnrollmentAction")]
        getter existing_enrollment_action : String?

        # The fraud detection configuration to use for the speaker enrollment job.

        @[JSON::Field(key: "FraudDetectionConfig")]
        getter fraud_detection_config : Types::EnrollmentJobFraudDetectionConfig?

        def initialize(
          @existing_enrollment_action : String? = nil,
          @fraud_detection_config : Types::EnrollmentJobFraudDetectionConfig? = nil
        )
        end
      end

      # The fraud detection configuration to be used during the batch speaker enrollment job.

      struct EnrollmentJobFraudDetectionConfig
        include JSON::Serializable

        # The action to take when the given speaker is flagged by the fraud detection system. The default
        # value is FAIL , which fails the speaker enrollment. Changing this value to IGNORE results in the
        # speaker being enrolled even if they are flagged by the fraud detection system.

        @[JSON::Field(key: "FraudDetectionAction")]
        getter fraud_detection_action : String?

        # Threshold value for determining whether the speaker is a high risk to be fraudulent. If the detected
        # risk score calculated by Voice ID is greater than or equal to the threshold, the speaker is
        # considered a fraudster.

        @[JSON::Field(key: "RiskThreshold")]
        getter risk_threshold : Int32?

        # The identifier of watchlists against which fraud detection is performed.

        @[JSON::Field(key: "WatchlistIds")]
        getter watchlist_ids : Array(String)?

        def initialize(
          @fraud_detection_action : String? = nil,
          @risk_threshold : Int32? = nil,
          @watchlist_ids : Array(String)? = nil
        )
        end
      end


      struct EvaluateSessionRequest
        include JSON::Serializable

        # The identifier of the domain where the session started.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The session identifier, or name of the session, that you want to evaluate. In Voice ID integration,
        # this is the Contact-Id.

        @[JSON::Field(key: "SessionNameOrId")]
        getter session_name_or_id : String

        def initialize(
          @domain_id : String,
          @session_name_or_id : String
        )
        end
      end


      struct EvaluateSessionResponse
        include JSON::Serializable

        # Details resulting from the authentication process, such as authentication decision and
        # authentication score.

        @[JSON::Field(key: "AuthenticationResult")]
        getter authentication_result : Types::AuthenticationResult?

        # The identifier of the domain that contains the session.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # Details resulting from the fraud detection process, such as fraud detection decision and risk score.

        @[JSON::Field(key: "FraudDetectionResult")]
        getter fraud_detection_result : Types::FraudDetectionResult?

        # The service-generated identifier of the session.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        # The client-provided name of the session.

        @[JSON::Field(key: "SessionName")]
        getter session_name : String?

        # The current status of audio streaming for this session. This field is useful to infer next steps
        # when the Authentication or Fraud Detection results are empty or the decision is NOT_ENOUGH_SPEECH .
        # In this situation, if the StreamingStatus is ONGOING/PENDING_CONFIGURATION , it can mean that the
        # client should call the API again later, after Voice ID has enough audio to produce a result. If the
        # decision remains NOT_ENOUGH_SPEECH even after StreamingStatus is ENDED , it means that the
        # previously streamed session did not have enough speech to perform evaluation, and a new streaming
        # session is needed to try again.

        @[JSON::Field(key: "StreamingStatus")]
        getter streaming_status : String?

        def initialize(
          @authentication_result : Types::AuthenticationResult? = nil,
          @domain_id : String? = nil,
          @fraud_detection_result : Types::FraudDetectionResult? = nil,
          @session_id : String? = nil,
          @session_name : String? = nil,
          @streaming_status : String? = nil
        )
        end
      end

      # Contains error details for a failed batch job.

      struct FailureDetails
        include JSON::Serializable

        # A description of the error that caused the batch job failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # An HTTP status code representing the nature of the error.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @message : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # The configuration used for performing fraud detection over a speaker during a session.

      struct FraudDetectionConfiguration
        include JSON::Serializable

        # Threshold value for determining whether the speaker is a fraudster. If the detected risk score
        # calculated by Voice ID is higher than the threshold, the speaker is considered a fraudster.

        @[JSON::Field(key: "RiskThreshold")]
        getter risk_threshold : Int32?

        # The identifier of the watchlist against which fraud detection is performed.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String?

        def initialize(
          @risk_threshold : Int32? = nil,
          @watchlist_id : String? = nil
        )
        end
      end

      # The fraud detection result produced by Voice ID, processed against the current session state and
      # streamed audio of the speaker.

      struct FraudDetectionResult
        include JSON::Serializable

        # A timestamp of when audio aggregation ended for this fraud detection result.

        @[JSON::Field(key: "AudioAggregationEndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter audio_aggregation_ended_at : Time?

        # A timestamp of when audio aggregation started for this fraud detection result.

        @[JSON::Field(key: "AudioAggregationStartedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter audio_aggregation_started_at : Time?

        # The FraudDetectionConfiguration used to generate this fraud detection result.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::FraudDetectionConfiguration?

        # The fraud detection decision produced by Voice ID, processed against the current session state and
        # streamed audio of the speaker.

        @[JSON::Field(key: "Decision")]
        getter decision : String?

        # The unique identifier for this fraud detection result. Given there can be multiple fraud detections
        # for a given session, this field helps in identifying if the returned result is from previous
        # streaming activity or a new result. Note that in the absence of any new streaming activity or risk
        # threshold changes, Voice ID always returns cached Fraud Detection result for this API.

        @[JSON::Field(key: "FraudDetectionResultId")]
        getter fraud_detection_result_id : String?

        # The reason speaker was flagged by the fraud detection system. This is only be populated if fraud
        # detection Decision is HIGH_RISK , and the following possible values: KNOWN_FRAUDSTER and
        # VOICE_SPOOFING .

        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        # Details about each risk analyzed for this speaker. Currently, this contains KnownFraudsterRisk and
        # VoiceSpoofingRisk details.

        @[JSON::Field(key: "RiskDetails")]
        getter risk_details : Types::FraudRiskDetails?

        def initialize(
          @audio_aggregation_ended_at : Time? = nil,
          @audio_aggregation_started_at : Time? = nil,
          @configuration : Types::FraudDetectionConfiguration? = nil,
          @decision : String? = nil,
          @fraud_detection_result_id : String? = nil,
          @reasons : Array(String)? = nil,
          @risk_details : Types::FraudRiskDetails? = nil
        )
        end
      end

      # Details regarding various fraud risk analyses performed against the current session state and
      # streamed audio of the speaker.

      struct FraudRiskDetails
        include JSON::Serializable

        # The details resulting from 'Known Fraudster Risk' analysis of the speaker.

        @[JSON::Field(key: "KnownFraudsterRisk")]
        getter known_fraudster_risk : Types::KnownFraudsterRisk

        # The details resulting from 'Voice Spoofing Risk' analysis of the speaker.

        @[JSON::Field(key: "VoiceSpoofingRisk")]
        getter voice_spoofing_risk : Types::VoiceSpoofingRisk

        def initialize(
          @known_fraudster_risk : Types::KnownFraudsterRisk,
          @voice_spoofing_risk : Types::VoiceSpoofingRisk
        )
        end
      end

      # Contains all the information about a fraudster.

      struct Fraudster
        include JSON::Serializable

        # The timestamp of when Voice ID identified the fraudster.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the domain that contains the fraudster.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The service-generated identifier for the fraudster.

        @[JSON::Field(key: "GeneratedFraudsterId")]
        getter generated_fraudster_id : String?

        # The identifier of the watchlists the fraudster is a part of.

        @[JSON::Field(key: "WatchlistIds")]
        getter watchlist_ids : Array(String)?

        def initialize(
          @created_at : Time? = nil,
          @domain_id : String? = nil,
          @generated_fraudster_id : String? = nil,
          @watchlist_ids : Array(String)? = nil
        )
        end
      end

      # Contains all the information about a fraudster registration job.

      struct FraudsterRegistrationJob
        include JSON::Serializable

        # A timestamp of when the fraudster registration job was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access customer's
        # buckets to read the input manifest file and write the job output file.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The identifier of the domain that contains the fraudster registration job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # A timestamp of when the fraudster registration job ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # Contains details that are populated when an entire batch job fails. In cases of individual
        # registration job failures, the batch job as a whole doesn't fail; it is completed with a JobStatus
        # of COMPLETED_WITH_ERRORS . You can use the job output file to identify the individual registration
        # requests that failed.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # The input data config containing an S3 URI for the input manifest file that contains the list of
        # fraudster registration job requests.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The service-generated identifier for the fraudster registration job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The client-provided name for the fraudster registration job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Shows the completed percentage of registration requests listed in the input file.

        @[JSON::Field(key: "JobProgress")]
        getter job_progress : Types::JobProgress?

        # The current status of the fraudster registration job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The output data config containing the S3 location where you want Voice ID to write your job output
        # file; you must also include a KMS key ID in order to encrypt the file.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The registration config containing details such as the action to take when a duplicate fraudster is
        # detected, and the similarity threshold to use for detecting a duplicate fraudster.

        @[JSON::Field(key: "RegistrationConfig")]
        getter registration_config : Types::RegistrationConfig?

        def initialize(
          @created_at : Time? = nil,
          @data_access_role_arn : String? = nil,
          @domain_id : String? = nil,
          @ended_at : Time? = nil,
          @failure_details : Types::FailureDetails? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_progress : Types::JobProgress? = nil,
          @job_status : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @registration_config : Types::RegistrationConfig? = nil
        )
        end
      end

      # Contains a summary of information about a fraudster registration job.

      struct FraudsterRegistrationJobSummary
        include JSON::Serializable

        # A timestamp of when the fraudster registration job was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the domain that contains the fraudster registration job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # A timestamp of when the fraudster registration job ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # Contains details that are populated when an entire batch job fails. In cases of individual
        # registration job failures, the batch job as a whole doesn't fail; it is completed with a JobStatus
        # of COMPLETED_WITH_ERRORS . You can use the job output file to identify the individual registration
        # requests that failed.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # The service-generated identifier for the fraudster registration job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The client-provided name for the fraudster registration job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Shows the completed percentage of registration requests listed in the input file.

        @[JSON::Field(key: "JobProgress")]
        getter job_progress : Types::JobProgress?

        # The current status of the fraudster registration job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @created_at : Time? = nil,
          @domain_id : String? = nil,
          @ended_at : Time? = nil,
          @failure_details : Types::FailureDetails? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_progress : Types::JobProgress? = nil,
          @job_status : String? = nil
        )
        end
      end

      # Contains a summary of information about a fraudster.

      struct FraudsterSummary
        include JSON::Serializable

        # The timestamp of when the fraudster summary was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the domain that contains the fraudster summary.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The service-generated identifier for the fraudster.

        @[JSON::Field(key: "GeneratedFraudsterId")]
        getter generated_fraudster_id : String?

        # The identifier of the watchlists the fraudster is a part of.

        @[JSON::Field(key: "WatchlistIds")]
        getter watchlist_ids : Array(String)?

        def initialize(
          @created_at : Time? = nil,
          @domain_id : String? = nil,
          @generated_fraudster_id : String? = nil,
          @watchlist_ids : Array(String)? = nil
        )
        end
      end

      # The configuration containing input file information for a batch job.

      struct InputDataConfig
        include JSON::Serializable

        # The S3 location for the input manifest file that contains the list of individual enrollment or
        # registration job requests.

        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # The request failed due to an unknown error on the server side.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates the completion progress for a batch job.

      struct JobProgress
        include JSON::Serializable

        # Shows the completed percentage of enrollment or registration requests listed in the input file.

        @[JSON::Field(key: "PercentComplete")]
        getter percent_complete : Int32?

        def initialize(
          @percent_complete : Int32? = nil
        )
        end
      end

      # Contains details produced as a result of performing known fraudster risk analysis on a speaker.

      struct KnownFraudsterRisk
        include JSON::Serializable

        # The score indicating the likelihood the speaker is a known fraudster.

        @[JSON::Field(key: "RiskScore")]
        getter risk_score : Int32

        # The identifier of the fraudster that is the closest match to the speaker. If there are no fraudsters
        # registered in a given domain, or if there are no fraudsters with a non-zero RiskScore, this value is
        # null .

        @[JSON::Field(key: "GeneratedFraudsterId")]
        getter generated_fraudster_id : String?

        def initialize(
          @risk_score : Int32,
          @generated_fraudster_id : String? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsResponse
        include JSON::Serializable

        # A list containing details about each domain in the Amazon Web Services account.

        @[JSON::Field(key: "DomainSummaries")]
        getter domain_summaries : Array(Types::DomainSummary)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_summaries : Array(Types::DomainSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFraudsterRegistrationJobsRequest
        include JSON::Serializable

        # The identifier of the domain that contains the fraudster registration Jobs.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # Provides the status of your fraudster registration job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFraudsterRegistrationJobsResponse
        include JSON::Serializable

        # A list containing details about each specified fraudster registration job.

        @[JSON::Field(key: "JobSummaries")]
        getter job_summaries : Array(Types::FraudsterRegistrationJobSummary)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::FraudsterRegistrationJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFraudstersRequest
        include JSON::Serializable

        # The identifier of the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The identifier of the watchlist. If provided, all fraudsters in the watchlist are listed. If not
        # provided, all fraudsters in the domain are listed.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @watchlist_id : String? = nil
        )
        end
      end


      struct ListFraudstersResponse
        include JSON::Serializable

        # A list that contains details about each fraudster in the Amazon Web Services account.

        @[JSON::Field(key: "FraudsterSummaries")]
        getter fraudster_summaries : Array(Types::FraudsterSummary)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @fraudster_summaries : Array(Types::FraudsterSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpeakerEnrollmentJobsRequest
        include JSON::Serializable

        # The identifier of the domain that contains the speaker enrollment jobs.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # Provides the status of your speaker enrollment Job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpeakerEnrollmentJobsResponse
        include JSON::Serializable

        # A list containing details about each specified speaker enrollment job.

        @[JSON::Field(key: "JobSummaries")]
        getter job_summaries : Array(Types::SpeakerEnrollmentJobSummary)?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_summaries : Array(Types::SpeakerEnrollmentJobSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpeakersRequest
        include JSON::Serializable

        # The identifier of the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSpeakersResponse
        include JSON::Serializable

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing details about each speaker in the Amazon Web Services account.

        @[JSON::Field(key: "SpeakerSummaries")]
        getter speaker_summaries : Array(Types::SpeakerSummary)?

        def initialize(
          @next_token : String? = nil,
          @speaker_summaries : Array(Types::SpeakerSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Voice ID resource for which you want to list the tags.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags associated with the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWatchlistsRequest
        include JSON::Serializable

        # The identifier of the domain.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The maximum number of results that are returned per call. You can use NextToken to obtain more pages
        # of results. The default is 100; the maximum allowed page size is also 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWatchlistsResponse
        include JSON::Serializable

        # If NextToken is returned, there are more results available. The value of NextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list that contains details about each watchlist in the Amazon Web Services account.

        @[JSON::Field(key: "WatchlistSummaries")]
        getter watchlist_summaries : Array(Types::WatchlistSummary)?

        def initialize(
          @next_token : String? = nil,
          @watchlist_summaries : Array(Types::WatchlistSummary)? = nil
        )
        end
      end


      struct OptOutSpeakerRequest
        include JSON::Serializable

        # The identifier of the domain that contains the speaker.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the speaker you want opted-out.

        @[JSON::Field(key: "SpeakerId")]
        getter speaker_id : String

        def initialize(
          @domain_id : String,
          @speaker_id : String
        )
        end
      end


      struct OptOutSpeakerResponse
        include JSON::Serializable

        # Details about the opted-out speaker.

        @[JSON::Field(key: "Speaker")]
        getter speaker : Types::Speaker?

        def initialize(
          @speaker : Types::Speaker? = nil
        )
        end
      end

      # The configuration containing output file information for a batch job.

      struct OutputDataConfig
        include JSON::Serializable

        # The S3 path of the folder where Voice ID writes the job output file. It has a *.out extension. For
        # example, if the input file name is input-file.json and the output folder path is
        # s3://output-bucket/output-folder , the full output file path is
        # s3://output-bucket/output-folder/job-Id/input-file.json.out .

        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The identifier of the KMS key you want Voice ID to use to encrypt the output file of a speaker
        # enrollment job/fraudster registration job.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # The registration configuration to be used during the batch fraudster registration job.

      struct RegistrationConfig
        include JSON::Serializable

        # The action to take when a fraudster is identified as a duplicate. The default action is SKIP , which
        # skips registering the duplicate fraudster. Setting the value to REGISTER_AS_NEW always registers a
        # new fraudster into the specified domain.

        @[JSON::Field(key: "DuplicateRegistrationAction")]
        getter duplicate_registration_action : String?

        # The minimum similarity score between the new and old fraudsters in order to consider the new
        # fraudster a duplicate.

        @[JSON::Field(key: "FraudsterSimilarityThreshold")]
        getter fraudster_similarity_threshold : Int32?

        # The identifiers of watchlists that a fraudster is registered to. If a watchlist isn't provided, the
        # fraudsters are registered to the default watchlist.

        @[JSON::Field(key: "WatchlistIds")]
        getter watchlist_ids : Array(String)?

        def initialize(
          @duplicate_registration_action : String? = nil,
          @fraudster_similarity_threshold : Int32? = nil,
          @watchlist_ids : Array(String)? = nil
        )
        end
      end

      # The specified resource cannot be found. Check the ResourceType and error message for more details.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of resource which cannot not be found. Possible types are BATCH_JOB , COMPLIANCE_CONSENT ,
        # DOMAIN , FRAUDSTER , SESSION and SPEAKER .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The configuration containing information about the customer managed key used for encrypting customer
      # data.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The identifier of the KMS key to use to encrypt data stored by Voice ID. Voice ID doesn't support
        # asymmetric customer managed keys.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String

        def initialize(
          @kms_key_id : String
        )
        end
      end

      # Details about the most recent server-side encryption configuration update. When the server-side
      # encryption configuration is changed, dependency on the old KMS key is removed through an
      # asynchronous process. When this update is complete, the domain’s data can only be accessed using the
      # new KMS key.

      struct ServerSideEncryptionUpdateDetails
        include JSON::Serializable

        # Message explaining the current UpdateStatus. When the UpdateStatus is FAILED, this message explains
        # the cause of the failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The previous KMS key ID the domain was encrypted with, before ServerSideEncryptionConfiguration was
        # updated to a new KMS key ID.

        @[JSON::Field(key: "OldKmsKeyId")]
        getter old_kms_key_id : String?

        # Status of the server-side encryption update. During an update, if there is an issue with the
        # domain's current or old KMS key ID, such as an inaccessible or disabled key, then the status is
        # FAILED. In order to resolve this, the key needs to be made accessible, and then an UpdateDomain call
        # with the existing server-side encryption configuration will re-attempt this update process.

        @[JSON::Field(key: "UpdateStatus")]
        getter update_status : String?

        def initialize(
          @message : String? = nil,
          @old_kms_key_id : String? = nil,
          @update_status : String? = nil
        )
        end
      end

      # The request exceeded the service quota. Refer to Voice ID Service Quotas and try your request again.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains all the information about a speaker.

      struct Speaker
        include JSON::Serializable

        # A timestamp of when the speaker was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The client-provided identifier for the speaker.

        @[JSON::Field(key: "CustomerSpeakerId")]
        getter customer_speaker_id : String?

        # The identifier of the domain that contains the speaker.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The service-generated identifier for the speaker.

        @[JSON::Field(key: "GeneratedSpeakerId")]
        getter generated_speaker_id : String?

        # The timestamp of when the speaker was last accessed for enrollment, re-enrollment or a successful
        # authentication. This timestamp is accurate to one hour.

        @[JSON::Field(key: "LastAccessedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_at : Time?

        # The current status of the speaker.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A timestamp of the speaker's last update.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @customer_speaker_id : String? = nil,
          @domain_id : String? = nil,
          @generated_speaker_id : String? = nil,
          @last_accessed_at : Time? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains all the information about a speaker enrollment job.

      struct SpeakerEnrollmentJob
        include JSON::Serializable

        # A timestamp of when the speaker enrollment job was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access customer's
        # buckets to read the input manifest file and write the job output file.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The identifier of the domain that contains the speaker enrollment job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # A timestamp of when the speaker enrollment job ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # The configuration that defines the action to take when the speaker is already enrolled in Voice ID,
        # and the FraudDetectionConfig to use.

        @[JSON::Field(key: "EnrollmentConfig")]
        getter enrollment_config : Types::EnrollmentConfig?

        # Contains details that are populated when an entire batch job fails. In cases of individual
        # registration job failures, the batch job as a whole doesn't fail; it is completed with a JobStatus
        # of COMPLETED_WITH_ERRORS . You can use the job output file to identify the individual registration
        # requests that failed.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # The input data config containing an S3 URI for the input manifest file that contains the list of
        # speaker enrollment job requests.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The service-generated identifier for the speaker enrollment job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The client-provided name for the speaker enrollment job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Provides details on job progress. This field shows the completed percentage of registration requests
        # listed in the input file.

        @[JSON::Field(key: "JobProgress")]
        getter job_progress : Types::JobProgress?

        # The current status of the speaker enrollment job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The output data config containing the S3 location where Voice ID writes the job output file; you
        # must also include a KMS key ID to encrypt the file.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        def initialize(
          @created_at : Time? = nil,
          @data_access_role_arn : String? = nil,
          @domain_id : String? = nil,
          @ended_at : Time? = nil,
          @enrollment_config : Types::EnrollmentConfig? = nil,
          @failure_details : Types::FailureDetails? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_progress : Types::JobProgress? = nil,
          @job_status : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil
        )
        end
      end

      # Contains a summary of information about a speaker enrollment job.

      struct SpeakerEnrollmentJobSummary
        include JSON::Serializable

        # A timestamp of when of the speaker enrollment job was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the domain that contains the speaker enrollment job.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # A timestamp of when the speaker enrollment job ended.

        @[JSON::Field(key: "EndedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # Contains details that are populated when an entire batch job fails. In cases of individual
        # registration job failures, the batch job as a whole doesn't fail; it is completed with a JobStatus
        # of COMPLETED_WITH_ERRORS . You can use the job output file to identify the individual registration
        # requests that failed.

        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::FailureDetails?

        # The service-generated identifier for the speaker enrollment job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The client-provided name for the speaker enrollment job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Provides details regarding job progress. This field shows the completed percentage of enrollment
        # requests listed in the input file.

        @[JSON::Field(key: "JobProgress")]
        getter job_progress : Types::JobProgress?

        # The current status of the speaker enrollment job.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @created_at : Time? = nil,
          @domain_id : String? = nil,
          @ended_at : Time? = nil,
          @failure_details : Types::FailureDetails? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_progress : Types::JobProgress? = nil,
          @job_status : String? = nil
        )
        end
      end

      # Contains a summary of information about a speaker.

      struct SpeakerSummary
        include JSON::Serializable

        # A timestamp showing the speaker's creation time.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The client-provided identifier for the speaker.

        @[JSON::Field(key: "CustomerSpeakerId")]
        getter customer_speaker_id : String?

        # The identifier of the domain that contains the speaker.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The service-generated identifier for the speaker.

        @[JSON::Field(key: "GeneratedSpeakerId")]
        getter generated_speaker_id : String?

        # The timestamp when the speaker was last accessed for enrollment, re-enrollment or a successful
        # authentication. This timestamp is accurate to one hour.

        @[JSON::Field(key: "LastAccessedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_at : Time?

        # The current status of the speaker.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A timestamp showing the speaker's last update.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @customer_speaker_id : String? = nil,
          @domain_id : String? = nil,
          @generated_speaker_id : String? = nil,
          @last_accessed_at : Time? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct StartFraudsterRegistrationJobRequest
        include JSON::Serializable

        # The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access customer's
        # buckets to read the input manifest file and write the Job output file. Refer to the Create and edit
        # a fraudster watchlist documentation for the permissions needed in this role.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The identifier of the domain that contains the fraudster registration job and in which the
        # fraudsters are registered.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The input data config containing an S3 URI for the input manifest file that contains the list of
        # fraudster registration requests.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The output data config containing the S3 location where Voice ID writes the job output file; you
        # must also include a KMS key ID to encrypt the file.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The name of the new fraudster registration job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The registration config containing details such as the action to take when a duplicate fraudster is
        # detected, and the similarity threshold to use for detecting a duplicate fraudster.

        @[JSON::Field(key: "RegistrationConfig")]
        getter registration_config : Types::RegistrationConfig?

        def initialize(
          @data_access_role_arn : String,
          @domain_id : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @client_token : String? = nil,
          @job_name : String? = nil,
          @registration_config : Types::RegistrationConfig? = nil
        )
        end
      end


      struct StartFraudsterRegistrationJobResponse
        include JSON::Serializable

        # Details about the started fraudster registration job.

        @[JSON::Field(key: "Job")]
        getter job : Types::FraudsterRegistrationJob?

        def initialize(
          @job : Types::FraudsterRegistrationJob? = nil
        )
        end
      end


      struct StartSpeakerEnrollmentJobRequest
        include JSON::Serializable

        # The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to access customer's
        # buckets to read the input manifest file and write the job output file. Refer to Batch enrollment
        # using audio data from prior calls for the permissions needed in this role.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The identifier of the domain that contains the speaker enrollment job and in which the speakers are
        # enrolled.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The input data config containing the S3 location for the input manifest file that contains the list
        # of speaker enrollment requests.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The output data config containing the S3 location where Voice ID writes the job output file; you
        # must also include a KMS key ID to encrypt the file.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The enrollment config that contains details such as the action to take when a speaker is already
        # enrolled in Voice ID or when a speaker is identified as a fraudster.

        @[JSON::Field(key: "EnrollmentConfig")]
        getter enrollment_config : Types::EnrollmentConfig?

        # A name for your speaker enrollment job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        def initialize(
          @data_access_role_arn : String,
          @domain_id : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @client_token : String? = nil,
          @enrollment_config : Types::EnrollmentConfig? = nil,
          @job_name : String? = nil
        )
        end
      end


      struct StartSpeakerEnrollmentJobResponse
        include JSON::Serializable

        # Details about the started speaker enrollment job.

        @[JSON::Field(key: "Job")]
        getter job : Types::SpeakerEnrollmentJob?

        def initialize(
          @job : Types::SpeakerEnrollmentJob? = nil
        )
        end
      end

      # The tags used to organize, track, or control access for this resource. For example, { "tags":
      # {"key1":"value1", "key2":"value2"} }.

      struct Tag
        include JSON::Serializable

        # The first part of a key:value pair that forms a tag associated with a given resource. For example,
        # in the tag 'Department':'Sales', the key is 'Department'.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The second part of a key:value pair that forms a tag associated with a given resource. For example,
        # in the tag 'Department':'Sales', the value is 'Sales'.

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

        # The Amazon Resource Name (ARN) of the Voice ID resource you want to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tags to assign to the specified resource.

        @[JSON::Field(key: "Tags")]
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

      # The request was denied due to request throttling. Please slow down your request rate. Refer to
      # Amazon Connect Voice ID Service API throttling quotas and try your request again.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Voice ID resource you want to remove tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys you want to remove from the specified resource.

        @[JSON::Field(key: "TagKeys")]
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


      struct UpdateDomainRequest
        include JSON::Serializable

        # The identifier of the domain to be updated.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The name of the domain.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The configuration, containing the KMS key identifier, to be used by Voice ID for the server-side
        # encryption of your data. Changing the domain's associated KMS key immediately triggers an
        # asynchronous process to remove dependency on the old KMS key, such that the domain's data can only
        # be accessed using the new KMS key. The domain's ServerSideEncryptionUpdateDetails contains the
        # details for this process.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration

        # A brief description about this domain.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
          @description : String? = nil
        )
        end
      end


      struct UpdateDomainResponse
        include JSON::Serializable

        # Details about the updated domain

        @[JSON::Field(key: "Domain")]
        getter domain : Types::Domain?

        def initialize(
          @domain : Types::Domain? = nil
        )
        end
      end


      struct UpdateWatchlistRequest
        include JSON::Serializable

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String

        # The identifier of the watchlist to be updated.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String

        # A brief description about this watchlist.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the watchlist.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @domain_id : String,
          @watchlist_id : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateWatchlistResponse
        include JSON::Serializable

        # Details about the updated watchlist.

        @[JSON::Field(key: "Watchlist")]
        getter watchlist : Types::Watchlist?

        def initialize(
          @watchlist : Types::Watchlist? = nil
        )
        end
      end

      # The request failed one or more validations; check the error message for more details.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The details resulting from 'Voice Spoofing Risk' analysis of the speaker.

      struct VoiceSpoofingRisk
        include JSON::Serializable

        # The score indicating the likelihood of speaker’s voice being spoofed.

        @[JSON::Field(key: "RiskScore")]
        getter risk_score : Int32

        def initialize(
          @risk_score : Int32
        )
        end
      end

      # Contains all the information about a watchlist.

      struct Watchlist
        include JSON::Serializable

        # The timestamp of when the watchlist was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Whether the specified watchlist is the default watchlist of a domain.

        @[JSON::Field(key: "DefaultWatchlist")]
        getter default_watchlist : Bool?

        # The description of the watchlist.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The name for the watchlist.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The timestamp of when the watchlist was updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The identifier of the watchlist.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String?

        def initialize(
          @created_at : Time? = nil,
          @default_watchlist : Bool? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @name : String? = nil,
          @updated_at : Time? = nil,
          @watchlist_id : String? = nil
        )
        end
      end

      # Details of the watchlists in a domain.

      struct WatchlistDetails
        include JSON::Serializable

        # The identifier of the default watchlist.

        @[JSON::Field(key: "DefaultWatchlistId")]
        getter default_watchlist_id : String

        def initialize(
          @default_watchlist_id : String
        )
        end
      end

      # Contains a summary of information about a watchlist.

      struct WatchlistSummary
        include JSON::Serializable

        # The timestamp of when the watchlist was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Whether the specified watchlist is the default watchlist of a domain.

        @[JSON::Field(key: "DefaultWatchlist")]
        getter default_watchlist : Bool?

        # The description of the watchlist.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the domain that contains the watchlist.

        @[JSON::Field(key: "DomainId")]
        getter domain_id : String?

        # The name for the watchlist.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The timestamp of when the watchlist was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The identifier of the watchlist.

        @[JSON::Field(key: "WatchlistId")]
        getter watchlist_id : String?

        def initialize(
          @created_at : Time? = nil,
          @default_watchlist : Bool? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @name : String? = nil,
          @updated_at : Time? = nil,
          @watchlist_id : String? = nil
        )
        end
      end
    end
  end
end
