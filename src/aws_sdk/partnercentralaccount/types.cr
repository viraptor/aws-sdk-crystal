require "json"
require "time"

module AwsSdk
  module PartnerCentralAccount
    module Types


      struct AcceptConnectionInvitationRequest
        include JSON::Serializable

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the connection invitation to accept.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @identifier : String
        )
        end
      end


      struct AcceptConnectionInvitationResponse
        include JSON::Serializable

        # The details of the accepted connection between the two partners.

        @[JSON::Field(key: "Connection")]
        getter connection : Types::Connection

        def initialize(
          @connection : Types::Connection
        )
        end
      end

      # The request was denied due to insufficient permissions. The caller does not have the required
      # permissions to perform this operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The specific reason for the access denial.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end

      # Summary information about an AWS account.

      struct AccountSummary
        include JSON::Serializable

        # The name associated with the AWS account.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains contact information for the primary alliance lead responsible for partnership activities.

      struct AllianceLeadContact
        include JSON::Serializable

        # The business title or role of the alliance lead contact person.

        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String

        # The email address of the alliance lead contact person.

        @[JSON::Field(key: "Email")]
        getter email : String

        # The first name of the alliance lead contact person.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String

        # The last name of the alliance lead contact person.

        @[JSON::Field(key: "LastName")]
        getter last_name : String

        def initialize(
          @business_title : String,
          @email : String,
          @first_name : String,
          @last_name : String
        )
        end
      end


      struct AssociateAwsTrainingCertificationEmailDomainRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The email address used to verify domain ownership for AWS training and certification association.

        @[JSON::Field(key: "Email")]
        getter email : String

        # The verification code sent to the email address to confirm domain ownership.

        @[JSON::Field(key: "EmailVerificationCode")]
        getter email_verification_code : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @email : String,
          @email_verification_code : String,
          @identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct AssociateAwsTrainingCertificationEmailDomainResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about a business rule validation error that occurred during an operation.

      struct BusinessValidationError
        include JSON::Serializable

        # A code identifying the specific business validation error.

        @[JSON::Field(key: "Code")]
        getter code : String

        # A description of the business validation error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end

      # Contains the business information required for verifying a company's legal status and registration
      # details within AWS Partner Central.

      struct BusinessVerificationDetails
        include JSON::Serializable

        # The ISO 3166-1 alpha-2 country code where the business is legally registered and operates.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String

        # The official legal name of the business as registered with the appropriate government authorities.

        @[JSON::Field(key: "LegalName")]
        getter legal_name : String

        # The unique business registration identifier assigned by the government or regulatory authority, such
        # as a company registration number or tax identification number.

        @[JSON::Field(key: "RegistrationId")]
        getter registration_id : String

        # The specific legal jurisdiction or state where the business was incorporated or registered,
        # providing additional location context beyond the country code.

        @[JSON::Field(key: "JurisdictionOfIncorporation")]
        getter jurisdiction_of_incorporation : String?

        def initialize(
          @country_code : String,
          @legal_name : String,
          @registration_id : String,
          @jurisdiction_of_incorporation : String? = nil
        )
        end
      end

      # Contains the response information and results from a business verification process, including any
      # verification-specific data returned by the verification service.

      struct BusinessVerificationResponse
        include JSON::Serializable

        # The business verification details that were processed and verified, potentially including additional
        # information discovered during the verification process.

        @[JSON::Field(key: "BusinessVerificationDetails")]
        getter business_verification_details : Types::BusinessVerificationDetails

        def initialize(
          @business_verification_details : Types::BusinessVerificationDetails
        )
        end
      end


      struct CancelConnectionInvitationRequest
        include JSON::Serializable

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the connection invitation to cancel.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @identifier : String
        )
        end
      end


      struct CancelConnectionInvitationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the canceled connection invitation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection invitation was canceled.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection that was being invited for.

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The timestamp when the connection invitation was originally created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the canceled connection invitation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The message that was included with the original connection invitation.

        @[JSON::Field(key: "InvitationMessage")]
        getter invitation_message : String

        # The email address of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterEmail")]
        getter inviter_email : String

        # The name of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterName")]
        getter inviter_name : String

        # The identifier of the other participant who was invited to connect.

        @[JSON::Field(key: "OtherParticipantIdentifier")]
        getter other_participant_identifier : String

        # The type of participant (inviter or invitee) in the connection invitation.

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # The current status of the connection invitation (canceled).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when the connection invitation was last updated (canceled).

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The identifier of the connection associated with the canceled invitation.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The timestamp when the connection invitation would have expired if not canceled.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_type : String,
          @created_at : Time,
          @id : String,
          @invitation_message : String,
          @inviter_email : String,
          @inviter_name : String,
          @other_participant_identifier : String,
          @participant_type : String,
          @status : String,
          @updated_at : Time,
          @connection_id : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end


      struct CancelConnectionRequest
        include JSON::Serializable

        # The catalog identifier where the connection exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The type of connection to cancel (e.g., reseller, distributor, technology partner).

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The unique identifier of the connection to cancel.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The reason for canceling the connection, providing context for the termination.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @connection_type : String,
          @identifier : String,
          @reason : String
        )
        end
      end


      struct CancelConnectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the canceled connection.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection was canceled.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The list of connection types that were active before cancellation.

        @[JSON::Field(key: "ConnectionTypes")]
        getter connection_types : Hash(String, Types::ConnectionTypeDetail)

        # The unique identifier of the canceled connection.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The AWS account ID of the other participant in the canceled connection.

        @[JSON::Field(key: "OtherParticipantAccountId")]
        getter other_participant_account_id : String

        # The timestamp when the connection was last updated (canceled).

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_types : Hash(String, Types::ConnectionTypeDetail),
          @id : String,
          @other_participant_account_id : String,
          @updated_at : Time
        )
        end
      end


      struct CancelProfileUpdateTaskRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The unique identifier of the profile update task to cancel.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @task_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct CancelProfileUpdateTaskResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the canceled profile update task.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The timestamp when the profile update task was started.

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The current status of the profile update task (canceled).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The details of the profile update task that was canceled.

        @[JSON::Field(key: "TaskDetails")]
        getter task_details : Types::TaskDetails

        # The unique identifier of the canceled profile update task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The timestamp when the profile update task was ended (canceled).

        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # A list of error details if any errors occurred during the profile update task.

        @[JSON::Field(key: "ErrorDetailList")]
        getter error_detail_list : Array(Types::ErrorDetail)?

        def initialize(
          @arn : String,
          @catalog : String,
          @id : String,
          @started_at : Time,
          @status : String,
          @task_details : Types::TaskDetails,
          @task_id : String,
          @ended_at : Time? = nil,
          @error_detail_list : Array(Types::ErrorDetail)? = nil
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the resource. This
      # typically occurs when trying to create a resource that already exists or modify a resource that has
      # been changed by another process.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The specific reason for the conflict.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end

      # Base structure containing common connection properties.

      struct Connection
        include JSON::Serializable

        # The AWS Resource Name (ARN) of the connection.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier that the connection belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection.

        @[JSON::Field(key: "ConnectionTypes")]
        getter connection_types : Hash(String, Types::ConnectionTypeDetail)

        # The unique identifier of the connection.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The AWS account ID of the other participant in the connection.

        @[JSON::Field(key: "OtherParticipantAccountId")]
        getter other_participant_account_id : String

        # The timestamp when the connection was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_types : Hash(String, Types::ConnectionTypeDetail),
          @id : String,
          @other_participant_account_id : String,
          @updated_at : Time
        )
        end
      end

      # A summary view of a connection invitation containing key information without full details.

      struct ConnectionInvitationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection invitation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection being requested in the invitation.

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The timestamp when the connection invitation was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the connection invitation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the other participant in the connection invitation.

        @[JSON::Field(key: "OtherParticipantIdentifier")]
        getter other_participant_identifier : String

        # The type of participant (inviter or invitee) in the connection invitation.

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # The current status of the connection invitation.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when the connection invitation was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The identifier of the connection associated with this invitation.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The timestamp when the connection invitation will expire.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_type : String,
          @created_at : Time,
          @id : String,
          @other_participant_identifier : String,
          @participant_type : String,
          @status : String,
          @updated_at : Time,
          @connection_id : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end

      # A summary view of an active connection between partners containing key information.

      struct ConnectionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A map of connection types and their summary information for this connection.

        @[JSON::Field(key: "ConnectionTypes")]
        getter connection_types : Hash(String, Types::ConnectionTypeSummary)

        # The unique identifier of the connection.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The AWS account ID of the other participant in the connection.

        @[JSON::Field(key: "OtherParticipantAccountId")]
        getter other_participant_account_id : String

        # The timestamp when the connection was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_types : Hash(String, Types::ConnectionTypeSummary),
          @id : String,
          @other_participant_account_id : String,
          @updated_at : Time
        )
        end
      end

      # Detailed information about a specific connection type within a connection.

      struct ConnectionTypeDetail
        include JSON::Serializable

        # The timestamp when this connection type was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The email address of the person who initiated this connection type.

        @[JSON::Field(key: "InviterEmail")]
        getter inviter_email : String

        # The name of the person who initiated this connection type.

        @[JSON::Field(key: "InviterName")]
        getter inviter_name : String

        # Information about the other participant in this connection type.

        @[JSON::Field(key: "OtherParticipant")]
        getter other_participant : Types::Participant

        # The current status of this connection type.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when this connection type was cancelled, if applicable.

        @[JSON::Field(key: "CanceledAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter canceled_at : Time?

        # The AWS account ID of the participant who cancelled this connection type.

        @[JSON::Field(key: "CanceledBy")]
        getter canceled_by : String?

        def initialize(
          @created_at : Time,
          @inviter_email : String,
          @inviter_name : String,
          @other_participant : Types::Participant,
          @status : String,
          @canceled_at : Time? = nil,
          @canceled_by : String? = nil
        )
        end
      end

      # Summary information about a specific connection type between partners.

      struct ConnectionTypeSummary
        include JSON::Serializable

        # Information about the other participant in this connection type.

        @[JSON::Field(key: "OtherParticipant")]
        getter other_participant : Types::Participant

        # The current status of this connection type (active, canceled, etc.).

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @other_participant : Types::Participant,
          @status : String
        )
        end
      end


      struct CreateConnectionInvitationRequest
        include JSON::Serializable

        # The catalog identifier where the connection invitation will be created.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The type of connection being requested (e.g., reseller, distributor, technology partner).

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The email address of the person to send the connection invitation to.

        @[JSON::Field(key: "Email")]
        getter email : String

        # A custom message to include with the connection invitation.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the person sending the connection invitation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The identifier of the organization or partner to invite for connection.

        @[JSON::Field(key: "ReceiverIdentifier")]
        getter receiver_identifier : String

        def initialize(
          @catalog : String,
          @client_token : String,
          @connection_type : String,
          @email : String,
          @message : String,
          @name : String,
          @receiver_identifier : String
        )
        end
      end


      struct CreateConnectionInvitationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created connection invitation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection invitation was created.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection being requested in the invitation.

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The timestamp when the connection invitation was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the created connection invitation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The custom message included with the connection invitation.

        @[JSON::Field(key: "InvitationMessage")]
        getter invitation_message : String

        # The email address of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterEmail")]
        getter inviter_email : String

        # The name of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterName")]
        getter inviter_name : String

        # The identifier of the organization or partner being invited.

        @[JSON::Field(key: "OtherParticipantIdentifier")]
        getter other_participant_identifier : String

        # The type of participant (inviter or invitee) in the connection invitation.

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # The current status of the connection invitation (pending, accepted, rejected, etc.).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when the connection invitation was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The identifier of the connection associated with this invitation.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The timestamp when the connection invitation will expire if not responded to.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_type : String,
          @created_at : Time,
          @id : String,
          @invitation_message : String,
          @inviter_email : String,
          @inviter_name : String,
          @other_participant_identifier : String,
          @participant_type : String,
          @status : String,
          @updated_at : Time,
          @connection_id : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end


      struct CreatePartnerRequest
        include JSON::Serializable

        # The primary contact person for alliance and partnership matters.

        @[JSON::Field(key: "AllianceLeadContact")]
        getter alliance_lead_contact : Types::AllianceLeadContact

        # The catalog identifier where the partner account will be created.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The verification code sent to the alliance lead contact's email to confirm account creation.

        @[JSON::Field(key: "EmailVerificationCode")]
        getter email_verification_code : String

        # The legal name of the organization becoming a partner.

        @[JSON::Field(key: "LegalName")]
        getter legal_name : String

        # The primary type of solution or service the partner provides (e.g., consulting, software, managed
        # services).

        @[JSON::Field(key: "PrimarySolutionType")]
        getter primary_solution_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A list of tags to associate with the partner account for organization and billing purposes.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @alliance_lead_contact : Types::AllianceLeadContact,
          @catalog : String,
          @email_verification_code : String,
          @legal_name : String,
          @primary_solution_type : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePartnerResponse
        include JSON::Serializable

        # The alliance lead contact information for the partner account.

        @[JSON::Field(key: "AllianceLeadContact")]
        getter alliance_lead_contact : Types::AllianceLeadContact

        # The Amazon Resource Name (ARN) of the created partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the partner account was created.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The timestamp when the partner account was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the created partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The legal name of the partner organization.

        @[JSON::Field(key: "LegalName")]
        getter legal_name : String

        # The partner profile information including display name, description, and other public details.

        @[JSON::Field(key: "Profile")]
        getter profile : Types::PartnerProfile

        # The list of verified email domains associated with AWS training and certification credentials for
        # the partner organization.

        @[JSON::Field(key: "AwsTrainingCertificationEmailDomains")]
        getter aws_training_certification_email_domains : Array(Types::PartnerDomain)?

        def initialize(
          @alliance_lead_contact : Types::AllianceLeadContact,
          @arn : String,
          @catalog : String,
          @created_at : Time,
          @id : String,
          @legal_name : String,
          @profile : Types::PartnerProfile,
          @aws_training_certification_email_domains : Array(Types::PartnerDomain)? = nil
        )
        end
      end


      struct DisassociateAwsTrainingCertificationEmailDomainRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The domain name to disassociate from AWS training and certification.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @domain_name : String,
          @identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DisassociateAwsTrainingCertificationEmailDomainResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains detailed information about an error that occurred during an operation.

      struct ErrorDetail
        include JSON::Serializable

        # The locale or language code for the error message.

        @[JSON::Field(key: "Locale")]
        getter locale : String

        # A human-readable description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # A machine-readable code or reason for the error.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @locale : String,
          @message : String,
          @reason : String
        )
        end
      end

      # Contains information about a field-level validation error that occurred during an operation.

      struct FieldValidationError
        include JSON::Serializable

        # A code identifying the specific field validation error.

        @[JSON::Field(key: "Code")]
        getter code : String

        # A description of the field validation error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field that failed validation.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @code : String,
          @message : String,
          @name : String
        )
        end
      end


      struct GetAllianceLeadContactRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetAllianceLeadContactResponse
        include JSON::Serializable

        # The alliance lead contact information including name, email, and business title.

        @[JSON::Field(key: "AllianceLeadContact")]
        getter alliance_lead_contact : Types::AllianceLeadContact

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @alliance_lead_contact : Types::AllianceLeadContact,
          @arn : String,
          @catalog : String,
          @id : String
        )
        end
      end


      struct GetConnectionInvitationRequest
        include JSON::Serializable

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the connection invitation to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetConnectionInvitationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection invitation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection being requested in the invitation.

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The timestamp when the connection invitation was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the connection invitation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The custom message included with the connection invitation.

        @[JSON::Field(key: "InvitationMessage")]
        getter invitation_message : String

        # The email address of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterEmail")]
        getter inviter_email : String

        # The name of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterName")]
        getter inviter_name : String

        # The identifier of the other participant in the connection invitation.

        @[JSON::Field(key: "OtherParticipantIdentifier")]
        getter other_participant_identifier : String

        # The type of participant (inviter or invitee) in the connection invitation.

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # The current status of the connection invitation.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when the connection invitation was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The identifier of the connection associated with this invitation.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The timestamp when the connection invitation will expire.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_type : String,
          @created_at : Time,
          @id : String,
          @invitation_message : String,
          @inviter_email : String,
          @inviter_name : String,
          @other_participant_identifier : String,
          @participant_type : String,
          @status : String,
          @updated_at : Time,
          @connection_id : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end


      struct GetConnectionPreferencesRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        def initialize(
          @catalog : String
        )
        end
      end


      struct GetConnectionPreferencesResponse
        include JSON::Serializable

        # The access type setting for connections (e.g., open, restricted, invitation-only).

        @[JSON::Field(key: "AccessType")]
        getter access_type : String

        # The Amazon Resource Name (ARN) of the connection preferences.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The revision number of the connection preferences for optimistic locking.

        @[JSON::Field(key: "Revision")]
        getter revision : Int64

        # The timestamp when the connection preferences were last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # A list of participant IDs that are excluded from connection requests or interactions.

        @[JSON::Field(key: "ExcludedParticipantIds")]
        getter excluded_participant_ids : Array(String)?

        def initialize(
          @access_type : String,
          @arn : String,
          @catalog : String,
          @revision : Int64,
          @updated_at : Time,
          @excluded_participant_ids : Array(String)? = nil
        )
        end
      end


      struct GetConnectionRequest
        include JSON::Serializable

        # The catalog identifier where the connection exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the connection to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetConnectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the connection.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The list of connection types active between the partners.

        @[JSON::Field(key: "ConnectionTypes")]
        getter connection_types : Hash(String, Types::ConnectionTypeDetail)

        # The unique identifier of the connection.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The AWS account ID of the other participant in the connection.

        @[JSON::Field(key: "OtherParticipantAccountId")]
        getter other_participant_account_id : String

        # The timestamp when the connection was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_types : Hash(String, Types::ConnectionTypeDetail),
          @id : String,
          @other_participant_account_id : String,
          @updated_at : Time
        )
        end
      end


      struct GetPartnerRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetPartnerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The timestamp when the partner account was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The legal name of the partner organization.

        @[JSON::Field(key: "LegalName")]
        getter legal_name : String

        # The partner profile information including display name, description, and other public details.

        @[JSON::Field(key: "Profile")]
        getter profile : Types::PartnerProfile

        # The list of verified email domains associated with AWS training and certification credentials for
        # the partner organization.

        @[JSON::Field(key: "AwsTrainingCertificationEmailDomains")]
        getter aws_training_certification_email_domains : Array(Types::PartnerDomain)?

        def initialize(
          @arn : String,
          @catalog : String,
          @created_at : Time,
          @id : String,
          @legal_name : String,
          @profile : Types::PartnerProfile,
          @aws_training_certification_email_domains : Array(Types::PartnerDomain)? = nil
        )
        end
      end


      struct GetProfileUpdateTaskRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetProfileUpdateTaskResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the profile update task.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The timestamp when the profile update task was started.

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The current status of the profile update task (in progress, completed, failed, etc.).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The details of the profile update task including what changes are being made.

        @[JSON::Field(key: "TaskDetails")]
        getter task_details : Types::TaskDetails

        # The unique identifier of the profile update task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The timestamp when the profile update task was completed or failed.

        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # A list of error details if any errors occurred during the profile update task.

        @[JSON::Field(key: "ErrorDetailList")]
        getter error_detail_list : Array(Types::ErrorDetail)?

        def initialize(
          @arn : String,
          @catalog : String,
          @id : String,
          @started_at : Time,
          @status : String,
          @task_details : Types::TaskDetails,
          @task_id : String,
          @ended_at : Time? = nil,
          @error_detail_list : Array(Types::ErrorDetail)? = nil
        )
        end
      end


      struct GetProfileVisibilityRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetProfileVisibilityResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The unique identifier of the partner profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The visibility setting for the partner profile (public, private, restricted, etc.).

        @[JSON::Field(key: "Visibility")]
        getter visibility : String

        def initialize(
          @arn : String,
          @catalog : String,
          @id : String,
          @profile_id : String,
          @visibility : String
        )
        end
      end


      struct GetVerificationRequest
        include JSON::Serializable

        # The type of verification to retrieve information for. Valid values include business verification for
        # company registration details and registrant verification for individual identity confirmation.

        @[JSON::Field(key: "VerificationType")]
        getter verification_type : String

        def initialize(
          @verification_type : String
        )
        end
      end


      struct GetVerificationResponse
        include JSON::Serializable

        # The timestamp when the verification process was initiated.

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # Detailed response information specific to the type of verification performed, including any
        # verification-specific data or results.

        @[JSON::Field(key: "VerificationResponseDetails")]
        getter verification_response_details : Types::VerificationResponseDetails

        # The current status of the verification process. Possible values include pending, in-progress,
        # completed, failed, or expired.

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String

        # The type of verification that was requested and processed.

        @[JSON::Field(key: "VerificationType")]
        getter verification_type : String

        # The timestamp when the verification process was completed. This field is null if the verification is
        # still in progress.

        @[JSON::Field(key: "CompletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # Additional information explaining the current verification status, particularly useful when the
        # status indicates a failure or requires additional action.

        @[JSON::Field(key: "VerificationStatusReason")]
        getter verification_status_reason : String?

        def initialize(
          @started_at : Time,
          @verification_response_details : Types::VerificationResponseDetails,
          @verification_status : String,
          @verification_type : String,
          @completed_at : Time? = nil,
          @verification_status_reason : String? = nil
        )
        end
      end

      # An internal server error occurred while processing the request. This is typically a temporary
      # condition and the request may be retried.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListConnectionInvitationsRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filter results by connection type (e.g., reseller, distributor, technology partner).

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String?

        # The maximum number of connection invitations to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results in paginated responses.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter results by specific participant identifiers.

        @[JSON::Field(key: "OtherParticipantIdentifiers")]
        getter other_participant_identifiers : Array(String)?

        # Filter results by participant type (inviter or invitee).

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String?

        # Filter results by invitation status (pending, accepted, rejected, canceled, expired).

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @catalog : String,
          @connection_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @other_participant_identifiers : Array(String)? = nil,
          @participant_type : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListConnectionInvitationsResponse
        include JSON::Serializable

        # A list of connection invitation summaries matching the specified criteria.

        @[JSON::Field(key: "ConnectionInvitationSummaries")]
        getter connection_invitation_summaries : Array(Types::ConnectionInvitationSummary)

        # The token for retrieving the next page of results if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_invitation_summaries : Array(Types::ConnectionInvitationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectionsRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filter results by connection type (e.g., reseller, distributor, technology partner).

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String?

        # The maximum number of connections to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for retrieving the next page of results in paginated responses.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter results by specific participant identifiers.

        @[JSON::Field(key: "OtherParticipantIdentifiers")]
        getter other_participant_identifiers : Array(String)?

        def initialize(
          @catalog : String,
          @connection_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @other_participant_identifiers : Array(String)? = nil
        )
        end
      end


      struct ListConnectionsResponse
        include JSON::Serializable

        # A list of connection summaries matching the specified criteria.

        @[JSON::Field(key: "ConnectionSummaries")]
        getter connection_summaries : Array(Types::ConnectionSummary)

        # The token for retrieving the next page of results if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_summaries : Array(Types::ConnectionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnersRequest
        include JSON::Serializable

        # The catalog identifier to list partners from.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The token for retrieving the next page of results in paginated responses.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @catalog : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnersResponse
        include JSON::Serializable

        # A list of partner summaries including basic information about each partner account.

        @[JSON::Field(key: "PartnerSummaryList")]
        getter partner_summary_list : Array(Types::PartnerSummary)

        # The token for retrieving the next page of results if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @partner_summary_list : Array(Types::PartnerSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to list tags for.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that the tags are associated with.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags associated with the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains localized content for a partner profile in a specific language or locale.

      struct LocalizedContent
        include JSON::Serializable

        # The localized description of the partner's business and services.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The localized display name for the partner.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The locale or language code for the localized content.

        @[JSON::Field(key: "Locale")]
        getter locale : String

        # The URL to the partner's logo image for this locale.

        @[JSON::Field(key: "LogoUrl")]
        getter logo_url : String

        # The localized website URL for the partner.

        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String

        def initialize(
          @description : String,
          @display_name : String,
          @locale : String,
          @logo_url : String,
          @website_url : String
        )
        end
      end

      # Represents a participant in a partner connection, containing their profile and account information.

      struct Participant
        include JSON::Serializable

        # The AWS account information for the participant.

        @[JSON::Field(key: "Account")]
        getter account : Types::AccountSummary?

        # The partner profile information for the participant.

        @[JSON::Field(key: "PartnerProfile")]
        getter partner_profile : Types::PartnerProfileSummary?

        # The seller profile information for the participant.

        @[JSON::Field(key: "SellerProfile")]
        getter seller_profile : Types::SellerProfileSummary?

        def initialize(
          @account : Types::AccountSummary? = nil,
          @partner_profile : Types::PartnerProfileSummary? = nil,
          @seller_profile : Types::SellerProfileSummary? = nil
        )
        end
      end

      # Represents a verified domain associated with a partner account.

      struct PartnerDomain
        include JSON::Serializable

        # The domain name that has been verified for the partner account.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The timestamp when the domain was registered and verified for the partner account.

        @[JSON::Field(key: "RegisteredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter registered_at : Time

        def initialize(
          @domain_name : String,
          @registered_at : Time
        )
        end
      end

      # Contains comprehensive profile information for a partner including public-facing details.

      struct PartnerProfile
        include JSON::Serializable

        # A description of the partner's business, services, and capabilities.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The public display name for the partner organization.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The industry segments or verticals that the partner serves.

        @[JSON::Field(key: "IndustrySegments")]
        getter industry_segments : Array(String)

        # The URL to the partner's logo image.

        @[JSON::Field(key: "LogoUrl")]
        getter logo_url : String

        # The primary type of solution or service the partner provides.

        @[JSON::Field(key: "PrimarySolutionType")]
        getter primary_solution_type : String

        # The source locale used for automatic translation of profile content.

        @[JSON::Field(key: "TranslationSourceLocale")]
        getter translation_source_locale : String

        # The partner's primary website URL.

        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String

        # A list of localized content versions for different languages and regions.

        @[JSON::Field(key: "LocalizedContents")]
        getter localized_contents : Array(Types::LocalizedContent)?

        # The unique identifier of the partner profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        def initialize(
          @description : String,
          @display_name : String,
          @industry_segments : Array(String),
          @logo_url : String,
          @primary_solution_type : String,
          @translation_source_locale : String,
          @website_url : String,
          @localized_contents : Array(Types::LocalizedContent)? = nil,
          @profile_id : String? = nil
        )
        end
      end

      # A summary view of a partner profile containing basic identifying information.

      struct PartnerProfileSummary
        include JSON::Serializable

        # The unique identifier of the partner profile.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The display name of the partner.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end

      # A summary view of a partner account containing basic information for listing purposes.

      struct PartnerSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The timestamp when the partner account was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The legal name of the partner organization.

        @[JSON::Field(key: "LegalName")]
        getter legal_name : String

        def initialize(
          @arn : String,
          @catalog : String,
          @created_at : Time,
          @id : String,
          @legal_name : String
        )
        end
      end


      struct PutAllianceLeadContactRequest
        include JSON::Serializable

        # The alliance lead contact information to set for the partner account.

        @[JSON::Field(key: "AllianceLeadContact")]
        getter alliance_lead_contact : Types::AllianceLeadContact

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The verification code sent to the alliance lead contact's email to confirm the update.

        @[JSON::Field(key: "EmailVerificationCode")]
        getter email_verification_code : String?

        def initialize(
          @alliance_lead_contact : Types::AllianceLeadContact,
          @catalog : String,
          @identifier : String,
          @email_verification_code : String? = nil
        )
        end
      end


      struct PutAllianceLeadContactResponse
        include JSON::Serializable

        # The updated alliance lead contact information.

        @[JSON::Field(key: "AllianceLeadContact")]
        getter alliance_lead_contact : Types::AllianceLeadContact

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @alliance_lead_contact : Types::AllianceLeadContact,
          @arn : String,
          @catalog : String,
          @id : String
        )
        end
      end


      struct PutProfileVisibilityRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The visibility setting to apply to the partner profile.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String

        def initialize(
          @catalog : String,
          @identifier : String,
          @visibility : String
        )
        end
      end


      struct PutProfileVisibilityResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the partner account.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The unique identifier of the partner profile.

        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The updated visibility setting for the partner profile.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String

        def initialize(
          @arn : String,
          @catalog : String,
          @id : String,
          @profile_id : String,
          @visibility : String
        )
        end
      end

      # Contains the personal information required for verifying an individual's identity as part of the
      # partner registration process in AWS Partner Central.

      struct RegistrantVerificationDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the response information from a registrant verification process, including any
      # verification-specific data and next steps for the individual verification workflow.

      struct RegistrantVerificationResponse
        include JSON::Serializable

        # A secure URL where the registrant can complete additional verification steps, such as document
        # upload or identity confirmation through a third-party verification service.

        @[JSON::Field(key: "CompletionUrl")]
        getter completion_url : String

        # The timestamp when the completion URL expires and is no longer valid for accessing the verification
        # workflow.

        @[JSON::Field(key: "CompletionUrlExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_url_expires_at : Time

        def initialize(
          @completion_url : String,
          @completion_url_expires_at : Time
        )
        end
      end


      struct RejectConnectionInvitationRequest
        include JSON::Serializable

        # The catalog identifier where the connection invitation exists.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the connection invitation to reject.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The reason for rejecting the connection invitation.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @catalog : String,
          @client_token : String,
          @identifier : String,
          @reason : String? = nil
        )
        end
      end


      struct RejectConnectionInvitationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rejected connection invitation.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier where the connection invitation was rejected.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of connection that was being invited for.

        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String

        # The timestamp when the connection invitation was originally created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The unique identifier of the rejected connection invitation.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The message that was included with the original connection invitation.

        @[JSON::Field(key: "InvitationMessage")]
        getter invitation_message : String

        # The email address of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterEmail")]
        getter inviter_email : String

        # The name of the person who sent the connection invitation.

        @[JSON::Field(key: "InviterName")]
        getter inviter_name : String

        # The identifier of the other participant who sent the invitation.

        @[JSON::Field(key: "OtherParticipantIdentifier")]
        getter other_participant_identifier : String

        # The type of participant (inviter or invitee) in the connection invitation.

        @[JSON::Field(key: "ParticipantType")]
        getter participant_type : String

        # The current status of the connection invitation (rejected).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The timestamp when the connection invitation was last updated (rejected).

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The identifier of the connection associated with the rejected invitation.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The timestamp when the connection invitation would have expired.

        @[JSON::Field(key: "ExpiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        def initialize(
          @arn : String,
          @catalog : String,
          @connection_type : String,
          @created_at : Time,
          @id : String,
          @invitation_message : String,
          @inviter_email : String,
          @inviter_name : String,
          @other_participant_identifier : String,
          @participant_type : String,
          @status : String,
          @updated_at : Time,
          @connection_id : String? = nil,
          @expires_at : Time? = nil
        )
        end
      end

      # The specified resource could not be found. This may occur when referencing a resource that does not
      # exist or has been deleted.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The specific reason why the resource was not found.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end

      # A summary view of a seller profile containing basic identifying information.

      struct SellerProfileSummary
        include JSON::Serializable

        # The unique identifier of the seller profile.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The display name of the seller.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end


      struct SendEmailVerificationCodeRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The email address to send the verification code to.

        @[JSON::Field(key: "Email")]
        getter email : String

        def initialize(
          @catalog : String,
          @email : String
        )
        end
      end


      struct SendEmailVerificationCodeResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was rejected because it would exceed a service quota or limit. This may occur when
      # trying to create more resources than allowed by the service limits.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The specific reason for the service quota being exceeded.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end


      struct StartProfileUpdateTaskRequest
        include JSON::Serializable

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The details of the profile updates to be performed.

        @[JSON::Field(key: "TaskDetails")]
        getter task_details : Types::TaskDetails

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @task_details : Types::TaskDetails,
          @client_token : String? = nil
        )
        end
      end


      struct StartProfileUpdateTaskResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the started profile update task.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the partner account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The timestamp when the profile update task was started.

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # The current status of the profile update task (in progress).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The details of the profile update task that was started.

        @[JSON::Field(key: "TaskDetails")]
        getter task_details : Types::TaskDetails

        # The unique identifier of the started profile update task.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The timestamp when the profile update task ended (null for in-progress tasks).

        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # A list of error details if any errors occurred during the profile update task.

        @[JSON::Field(key: "ErrorDetailList")]
        getter error_detail_list : Array(Types::ErrorDetail)?

        def initialize(
          @arn : String,
          @catalog : String,
          @id : String,
          @started_at : Time,
          @status : String,
          @task_details : Types::TaskDetails,
          @task_id : String,
          @ended_at : Time? = nil,
          @error_detail_list : Array(Types::ErrorDetail)? = nil
        )
        end
      end


      struct StartVerificationRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # prevents duplicate verification processes from being started accidentally.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The specific details required for the verification process, including business information for
        # business verification or personal information for registrant verification.

        @[JSON::Field(key: "VerificationDetails")]
        getter verification_details : Types::VerificationDetails?

        def initialize(
          @client_token : String? = nil,
          @verification_details : Types::VerificationDetails? = nil
        )
        end
      end


      struct StartVerificationResponse
        include JSON::Serializable

        # The timestamp when the verification process was successfully initiated.

        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time

        # Initial response details specific to the type of verification started, which may include next steps
        # or additional requirements.

        @[JSON::Field(key: "VerificationResponseDetails")]
        getter verification_response_details : Types::VerificationResponseDetails

        # The initial status of the verification process after it has been started. Typically this will be
        # pending or in-progress.

        @[JSON::Field(key: "VerificationStatus")]
        getter verification_status : String

        # The type of verification that was started based on the provided verification details.

        @[JSON::Field(key: "VerificationType")]
        getter verification_type : String

        # The timestamp when the verification process was completed. This field is typically null for newly
        # started verifications unless they complete immediately.

        @[JSON::Field(key: "CompletedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # Additional information about the initial verification status, including any immediate feedback about
        # the submitted verification details.

        @[JSON::Field(key: "VerificationStatusReason")]
        getter verification_status_reason : String?

        def initialize(
          @started_at : Time,
          @verification_response_details : Types::VerificationResponseDetails,
          @verification_status : String,
          @verification_type : String,
          @completed_at : Time? = nil,
          @verification_status_reason : String? = nil
        )
        end
      end

      # A key-value pair used to associate metadata with AWS Partner Central Account resources.

      struct Tag
        include JSON::Serializable

        # The key name of the tag. Tag keys are case-sensitive.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value associated with the tag key. Tag values are case-sensitive.

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

        # The Amazon Resource Name (ARN) of the resource to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags to add or update for the specified resource.

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

      # Contains detailed information about a profile update task including the changes to be made.

      struct TaskDetails
        include JSON::Serializable

        # The updated description for the partner profile.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The updated display name for the partner profile.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String

        # The updated industry segments for the partner profile.

        @[JSON::Field(key: "IndustrySegments")]
        getter industry_segments : Array(String)

        # The updated logo URL for the partner profile.

        @[JSON::Field(key: "LogoUrl")]
        getter logo_url : String

        # The updated primary solution type for the partner profile.

        @[JSON::Field(key: "PrimarySolutionType")]
        getter primary_solution_type : String

        # The updated translation source locale for the partner profile.

        @[JSON::Field(key: "TranslationSourceLocale")]
        getter translation_source_locale : String

        # The updated website URL for the partner profile.

        @[JSON::Field(key: "WebsiteUrl")]
        getter website_url : String

        # The updated localized content for the partner profile.

        @[JSON::Field(key: "LocalizedContents")]
        getter localized_contents : Array(Types::LocalizedContent)?

        def initialize(
          @description : String,
          @display_name : String,
          @industry_segments : Array(String),
          @logo_url : String,
          @primary_solution_type : String,
          @translation_source_locale : String,
          @website_url : String,
          @localized_contents : Array(Types::LocalizedContent)? = nil
        )
        end
      end

      # The request was throttled due to too many requests being sent in a short period of time. The client
      # should implement exponential backoff and retry the request.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota code associated with the throttling error.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The service code associated with the throttling error.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the specified resource.

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


      struct UpdateConnectionPreferencesRequest
        include JSON::Serializable

        # The access type setting for connections (e.g., open, restricted, invitation-only).

        @[JSON::Field(key: "AccessType")]
        getter access_type : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The revision number of the connection preferences for optimistic locking.

        @[JSON::Field(key: "Revision")]
        getter revision : Int64

        # The updated list of participant identifiers to exclude from connections.

        @[JSON::Field(key: "ExcludedParticipantIdentifiers")]
        getter excluded_participant_identifiers : Array(String)?

        def initialize(
          @access_type : String,
          @catalog : String,
          @revision : Int64,
          @excluded_participant_identifiers : Array(String)? = nil
        )
        end
      end


      struct UpdateConnectionPreferencesResponse
        include JSON::Serializable

        # The updated access type setting for connections.

        @[JSON::Field(key: "AccessType")]
        getter access_type : String

        # The Amazon Resource Name (ARN) of the updated connection preferences.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The catalog identifier for the partner account.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The updated revision number of the connection preferences.

        @[JSON::Field(key: "Revision")]
        getter revision : Int64

        # The timestamp when the connection preferences were last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # A list of participant IDs that are excluded from connection requests or interactions.

        @[JSON::Field(key: "ExcludedParticipantIds")]
        getter excluded_participant_ids : Array(String)?

        def initialize(
          @access_type : String,
          @arn : String,
          @catalog : String,
          @revision : Int64,
          @updated_at : Time,
          @excluded_participant_ids : Array(String)? = nil
        )
        end
      end

      # Contains information about a validation error, which can be either a field-level or business rule
      # validation error.

      struct ValidationError
        include JSON::Serializable

        # Details about a business rule validation error, if applicable.

        @[JSON::Field(key: "BusinessValidationError")]
        getter business_validation_error : Types::BusinessValidationError?

        # Details about a field-level validation error, if applicable.

        @[JSON::Field(key: "FieldValidationError")]
        getter field_validation_error : Types::FieldValidationError?

        def initialize(
          @business_validation_error : Types::BusinessValidationError? = nil,
          @field_validation_error : Types::FieldValidationError? = nil
        )
        end
      end

      # The request failed validation. One or more input parameters are invalid, missing, or do not meet the
      # required format or constraints.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # A list of detailed validation errors that occurred during request processing.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Array(Types::ValidationError)?

        def initialize(
          @message : String,
          @reason : String,
          @error_details : Array(Types::ValidationError)? = nil
        )
        end
      end

      # A union structure containing the specific details required for different types of verification
      # processes supported by AWS Partner Central.

      struct VerificationDetails
        include JSON::Serializable

        # The business verification details to be used when starting a business verification process.

        @[JSON::Field(key: "BusinessVerificationDetails")]
        getter business_verification_details : Types::BusinessVerificationDetails?

        # The registrant verification details to be used when starting an individual identity verification
        # process.

        @[JSON::Field(key: "RegistrantVerificationDetails")]
        getter registrant_verification_details : Types::RegistrantVerificationDetails?

        def initialize(
          @business_verification_details : Types::BusinessVerificationDetails? = nil,
          @registrant_verification_details : Types::RegistrantVerificationDetails? = nil
        )
        end
      end

      # A union structure containing the response details specific to different types of verification
      # processes, providing type-specific information and results.

      struct VerificationResponseDetails
        include JSON::Serializable

        # The response details from a business verification process, including verification results and any
        # additional business information discovered.

        @[JSON::Field(key: "BusinessVerificationResponse")]
        getter business_verification_response : Types::BusinessVerificationResponse?

        # The response details from a registrant verification process, including verification results and any
        # additional steps required for identity confirmation.

        @[JSON::Field(key: "RegistrantVerificationResponse")]
        getter registrant_verification_response : Types::RegistrantVerificationResponse?

        def initialize(
          @business_verification_response : Types::BusinessVerificationResponse? = nil,
          @registrant_verification_response : Types::RegistrantVerificationResponse? = nil
        )
        end
      end
    end
  end
end
