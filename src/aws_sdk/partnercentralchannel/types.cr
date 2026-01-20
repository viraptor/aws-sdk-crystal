require "json"
require "time"

module AwsSdk
  module PartnerCentralChannel
    module Types

      # Contains details about an accepted channel handshake.

      struct AcceptChannelHandshakeDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accepted handshake.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the accepted handshake.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The current status of the accepted handshake.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct AcceptChannelHandshakeRequest
        include JSON::Serializable

        # The catalog identifier for the handshake request.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the channel handshake to accept.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct AcceptChannelHandshakeResponse
        include JSON::Serializable

        # Details of the accepted channel handshake.

        @[JSON::Field(key: "channelHandshakeDetail")]
        getter channel_handshake_detail : Types::AcceptChannelHandshakeDetail?

        def initialize(
          @channel_handshake_detail : Types::AcceptChannelHandshakeDetail? = nil
        )
        end
      end

      # The request was denied due to insufficient permissions.

      struct AccessDeniedException
        include JSON::Serializable

        # A message describing the access denial.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the access denial.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end

      # Contains details about a canceled channel handshake.

      struct CancelChannelHandshakeDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the canceled handshake.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the canceled handshake.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The current status of the canceled handshake.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CancelChannelHandshakeRequest
        include JSON::Serializable

        # The catalog identifier for the handshake request.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the channel handshake to cancel.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct CancelChannelHandshakeResponse
        include JSON::Serializable

        # Details of the canceled channel handshake.

        @[JSON::Field(key: "channelHandshakeDetail")]
        getter channel_handshake_detail : Types::CancelChannelHandshakeDetail?

        def initialize(
          @channel_handshake_detail : Types::CancelChannelHandshakeDetail? = nil
        )
        end
      end

      # Contains the payload data for different types of channel handshakes.

      struct ChannelHandshakePayload
        include JSON::Serializable

        # Payload for revoking a service period handshake.

        @[JSON::Field(key: "revokeServicePeriodPayload")]
        getter revoke_service_period_payload : Types::RevokeServicePeriodPayload?

        # Payload for starting a service period handshake.

        @[JSON::Field(key: "startServicePeriodPayload")]
        getter start_service_period_payload : Types::StartServicePeriodPayload?

        def initialize(
          @revoke_service_period_payload : Types::RevokeServicePeriodPayload? = nil,
          @start_service_period_payload : Types::StartServicePeriodPayload? = nil
        )
        end
      end

      # Summary information about a channel handshake.

      struct ChannelHandshakeSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the handshake.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The identifier of the resource associated with the handshake.

        @[JSON::Field(key: "associatedResourceId")]
        getter associated_resource_id : String?

        # The catalog identifier associated with the handshake.

        @[JSON::Field(key: "catalog")]
        getter catalog : String?

        # The timestamp when the handshake was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Detailed information about the handshake.

        @[JSON::Field(key: "detail")]
        getter detail : Types::HandshakeDetail?

        # The type of the handshake.

        @[JSON::Field(key: "handshakeType")]
        getter handshake_type : String?

        # The unique identifier of the handshake.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The AWS account ID of the handshake owner.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String?

        # The AWS account ID of the handshake receiver.

        @[JSON::Field(key: "receiverAccountId")]
        getter receiver_account_id : String?

        # The AWS account ID of the handshake sender.

        @[JSON::Field(key: "senderAccountId")]
        getter sender_account_id : String?

        # The display name of the handshake sender.

        @[JSON::Field(key: "senderDisplayName")]
        getter sender_display_name : String?

        # The current status of the handshake.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp when the handshake was last updated.

        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @associated_resource_id : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @detail : Types::HandshakeDetail? = nil,
          @handshake_type : String? = nil,
          @id : String? = nil,
          @owner_account_id : String? = nil,
          @receiver_account_id : String? = nil,
          @sender_account_id : String? = nil,
          @sender_display_name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The request could not be completed due to a conflict with the current state of the resource.

      struct ConflictException
        include JSON::Serializable

        # A message describing the conflict.

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that caused the conflict.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that caused the conflict.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Contains details about a newly created channel handshake.

      struct CreateChannelHandshakeDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created handshake.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the created handshake.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateChannelHandshakeRequest
        include JSON::Serializable

        # The identifier of the resource associated with this handshake.

        @[JSON::Field(key: "associatedResourceIdentifier")]
        getter associated_resource_identifier : String

        # The catalog identifier for the handshake request.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The type of handshake to create (e.g., start service period, revoke service period).

        @[JSON::Field(key: "handshakeType")]
        getter handshake_type : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The payload containing specific details for the handshake type.

        @[JSON::Field(key: "payload")]
        getter payload : Types::ChannelHandshakePayload?

        # Key-value pairs to associate with the channel handshake.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @associated_resource_identifier : String,
          @catalog : String,
          @handshake_type : String,
          @client_token : String? = nil,
          @payload : Types::ChannelHandshakePayload? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateChannelHandshakeResponse
        include JSON::Serializable

        # Details of the created channel handshake.

        @[JSON::Field(key: "channelHandshakeDetail")]
        getter channel_handshake_detail : Types::CreateChannelHandshakeDetail?

        def initialize(
          @channel_handshake_detail : Types::CreateChannelHandshakeDetail? = nil
        )
        end
      end

      # Contains details about a newly created program management account.

      struct CreateProgramManagementAccountDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created program management account.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the created program management account.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateProgramManagementAccountRequest
        include JSON::Serializable

        # The AWS account ID to associate with the program management account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The catalog identifier for the program management account.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # A human-readable name for the program management account.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The program type for the management account.

        @[JSON::Field(key: "program")]
        getter program : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Key-value pairs to associate with the program management account.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String,
          @catalog : String,
          @display_name : String,
          @program : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateProgramManagementAccountResponse
        include JSON::Serializable

        # Details of the created program management account.

        @[JSON::Field(key: "programManagementAccountDetail")]
        getter program_management_account_detail : Types::CreateProgramManagementAccountDetail?

        def initialize(
          @program_management_account_detail : Types::CreateProgramManagementAccountDetail? = nil
        )
        end
      end

      # Contains details about a newly created relationship.

      struct CreateRelationshipDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created relationship.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the created relationship.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct CreateRelationshipRequest
        include JSON::Serializable

        # The AWS account ID to associate in this relationship.

        @[JSON::Field(key: "associatedAccountId")]
        getter associated_account_id : String

        # The type of association for the relationship (e.g., reseller, distributor).

        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The catalog identifier for the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # A human-readable name for the relationship.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The identifier of the program management account for this relationship.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        # The business sector for the relationship.

        @[JSON::Field(key: "sector")]
        getter sector : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The support plan requested for this relationship.

        @[JSON::Field(key: "requestedSupportPlan")]
        getter requested_support_plan : Types::SupportPlan?

        # The resale account model for the relationship.

        @[JSON::Field(key: "resaleAccountModel")]
        getter resale_account_model : String?

        # Key-value pairs to associate with the relationship.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @associated_account_id : String,
          @association_type : String,
          @catalog : String,
          @display_name : String,
          @program_management_account_identifier : String,
          @sector : String,
          @client_token : String? = nil,
          @requested_support_plan : Types::SupportPlan? = nil,
          @resale_account_model : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRelationshipResponse
        include JSON::Serializable

        # Details of the created relationship.

        @[JSON::Field(key: "relationshipDetail")]
        getter relationship_detail : Types::CreateRelationshipDetail?

        def initialize(
          @relationship_detail : Types::CreateRelationshipDetail? = nil
        )
        end
      end


      struct DeleteProgramManagementAccountRequest
        include JSON::Serializable

        # The catalog identifier for the program management account.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the program management account to delete.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteProgramManagementAccountResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRelationshipRequest
        include JSON::Serializable

        # The catalog identifier for the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the relationship to delete.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The identifier of the program management account associated with the relationship.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @program_management_account_identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteRelationshipResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetRelationshipRequest
        include JSON::Serializable

        # The catalog identifier for the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the relationship to retrieve.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The identifier of the program management account associated with the relationship.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        def initialize(
          @catalog : String,
          @identifier : String,
          @program_management_account_identifier : String
        )
        end
      end


      struct GetRelationshipResponse
        include JSON::Serializable

        # Details of the requested relationship.

        @[JSON::Field(key: "relationshipDetail")]
        getter relationship_detail : Types::RelationshipDetail?

        def initialize(
          @relationship_detail : Types::RelationshipDetail? = nil
        )
        end
      end

      # Contains detailed information about different types of handshakes.

      struct HandshakeDetail
        include JSON::Serializable

        # Details for a program management account handshake.

        @[JSON::Field(key: "programManagementAccountHandshakeDetail")]
        getter program_management_account_handshake_detail : Types::ProgramManagementAccountHandshakeDetail?

        # Details for a revoke service period handshake.

        @[JSON::Field(key: "revokeServicePeriodHandshakeDetail")]
        getter revoke_service_period_handshake_detail : Types::RevokeServicePeriodHandshakeDetail?

        # Details for a start service period handshake.

        @[JSON::Field(key: "startServicePeriodHandshakeDetail")]
        getter start_service_period_handshake_detail : Types::StartServicePeriodHandshakeDetail?

        def initialize(
          @program_management_account_handshake_detail : Types::ProgramManagementAccountHandshakeDetail? = nil,
          @revoke_service_period_handshake_detail : Types::RevokeServicePeriodHandshakeDetail? = nil,
          @start_service_period_handshake_detail : Types::StartServicePeriodHandshakeDetail? = nil
        )
        end
      end

      # An internal server error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable

        # A message describing the internal server error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListChannelHandshakesRequest
        include JSON::Serializable

        # The catalog identifier to filter handshakes.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Filter results by handshake type.

        @[JSON::Field(key: "handshakeType")]
        getter handshake_type : String

        # Filter by participant type (sender or receiver).

        @[JSON::Field(key: "participantType")]
        getter participant_type : String

        # Filter by associated resource identifiers.

        @[JSON::Field(key: "associatedResourceIdentifiers")]
        getter associated_resource_identifiers : Array(String)?

        # Type-specific filters for handshakes.

        @[JSON::Field(key: "handshakeTypeFilters")]
        getter handshake_type_filters : Types::ListChannelHandshakesTypeFilters?

        # Type-specific sorting options for handshakes.

        @[JSON::Field(key: "handshakeTypeSort")]
        getter handshake_type_sort : Types::ListChannelHandshakesTypeSort?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Token for retrieving the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filter results by handshake status.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @catalog : String,
          @handshake_type : String,
          @participant_type : String,
          @associated_resource_identifiers : Array(String)? = nil,
          @handshake_type_filters : Types::ListChannelHandshakesTypeFilters? = nil,
          @handshake_type_sort : Types::ListChannelHandshakesTypeSort? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListChannelHandshakesResponse
        include JSON::Serializable

        # List of channel handshakes matching the criteria.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ChannelHandshakeSummary)?

        # Token for retrieving the next page of results, if available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ChannelHandshakeSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Type-specific filters for listing channel handshakes.

      struct ListChannelHandshakesTypeFilters
        include JSON::Serializable

        # Filters specific to program management account handshakes.

        @[JSON::Field(key: "programManagementAccountTypeFilters")]
        getter program_management_account_type_filters : Types::ProgramManagementAccountTypeFilters?

        # Filters specific to revoke service period handshakes.

        @[JSON::Field(key: "revokeServicePeriodTypeFilters")]
        getter revoke_service_period_type_filters : Types::RevokeServicePeriodTypeFilters?

        # Filters specific to start service period handshakes.

        @[JSON::Field(key: "startServicePeriodTypeFilters")]
        getter start_service_period_type_filters : Types::StartServicePeriodTypeFilters?

        def initialize(
          @program_management_account_type_filters : Types::ProgramManagementAccountTypeFilters? = nil,
          @revoke_service_period_type_filters : Types::RevokeServicePeriodTypeFilters? = nil,
          @start_service_period_type_filters : Types::StartServicePeriodTypeFilters? = nil
        )
        end
      end

      # Type-specific sorting options for listing channel handshakes.

      struct ListChannelHandshakesTypeSort
        include JSON::Serializable

        # Sorting options specific to program management account handshakes.

        @[JSON::Field(key: "programManagementAccountTypeSort")]
        getter program_management_account_type_sort : Types::ProgramManagementAccountTypeSort?

        # Sorting options specific to revoke service period handshakes.

        @[JSON::Field(key: "revokeServicePeriodTypeSort")]
        getter revoke_service_period_type_sort : Types::RevokeServicePeriodTypeSort?

        # Sorting options specific to start service period handshakes.

        @[JSON::Field(key: "startServicePeriodTypeSort")]
        getter start_service_period_type_sort : Types::StartServicePeriodTypeSort?

        def initialize(
          @program_management_account_type_sort : Types::ProgramManagementAccountTypeSort? = nil,
          @revoke_service_period_type_sort : Types::RevokeServicePeriodTypeSort? = nil,
          @start_service_period_type_sort : Types::StartServicePeriodTypeSort? = nil
        )
        end
      end


      struct ListProgramManagementAccountsRequest
        include JSON::Serializable

        # The catalog identifier to filter accounts.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Filter by AWS account IDs.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # Filter by display names.

        @[JSON::Field(key: "displayNames")]
        getter display_names : Array(String)?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Token for retrieving the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filter by program types.

        @[JSON::Field(key: "programs")]
        getter programs : Array(String)?

        # Sorting options for the results.

        @[JSON::Field(key: "sort")]
        getter sort : Types::ListProgramManagementAccountsSortBase?

        # Filter by program management account statuses.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @catalog : String,
          @account_ids : Array(String)? = nil,
          @display_names : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @programs : Array(String)? = nil,
          @sort : Types::ListProgramManagementAccountsSortBase? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListProgramManagementAccountsResponse
        include JSON::Serializable

        # List of program management accounts matching the criteria.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProgramManagementAccountSummary)?

        # Token for retrieving the next page of results, if available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProgramManagementAccountSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Base sorting configuration for program management accounts.

      struct ListProgramManagementAccountsSortBase
        include JSON::Serializable

        # The field to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end


      struct ListRelationshipsRequest
        include JSON::Serializable

        # The catalog identifier to filter relationships.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Filter by associated AWS account IDs.

        @[JSON::Field(key: "associatedAccountIds")]
        getter associated_account_ids : Array(String)?

        # Filter by association types.

        @[JSON::Field(key: "associationTypes")]
        getter association_types : Array(String)?

        # Filter by display names.

        @[JSON::Field(key: "displayNames")]
        getter display_names : Array(String)?

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Token for retrieving the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filter by program management account identifiers.

        @[JSON::Field(key: "programManagementAccountIdentifiers")]
        getter program_management_account_identifiers : Array(String)?

        # Sorting options for the results.

        @[JSON::Field(key: "sort")]
        getter sort : Types::ListRelationshipsSortBase?

        def initialize(
          @catalog : String,
          @associated_account_ids : Array(String)? = nil,
          @association_types : Array(String)? = nil,
          @display_names : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @program_management_account_identifiers : Array(String)? = nil,
          @sort : Types::ListRelationshipsSortBase? = nil
        )
        end
      end


      struct ListRelationshipsResponse
        include JSON::Serializable

        # List of relationships matching the criteria.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::RelationshipSummary)?

        # Token for retrieving the next page of results, if available.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RelationshipSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Base sorting configuration for relationships.

      struct ListRelationshipsSortBase
        include JSON::Serializable

        # The field to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to list tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Key-value pairs associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Configuration for partner-led support plans.

      struct PartnerLedSupport
        include JSON::Serializable

        # The coverage level for partner-led support.

        @[JSON::Field(key: "coverage")]
        getter coverage : String

        # The location of the Technical Account Manager (TAM).

        @[JSON::Field(key: "tamLocation")]
        getter tam_location : String

        # The provider of the partner-led support.

        @[JSON::Field(key: "provider")]
        getter provider : String?

        def initialize(
          @coverage : String,
          @tam_location : String,
          @provider : String? = nil
        )
        end
      end

      # Details specific to program management account handshakes.

      struct ProgramManagementAccountHandshakeDetail
        include JSON::Serializable

        # The program associated with the handshake.

        @[JSON::Field(key: "program")]
        getter program : String?

        def initialize(
          @program : String? = nil
        )
        end
      end

      # Summary information about a program management account.

      struct ProgramManagementAccountSummary
        include JSON::Serializable

        # The AWS account ID associated with the program management account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Resource Name (ARN) of the program management account.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The catalog identifier associated with the account.

        @[JSON::Field(key: "catalog")]
        getter catalog : String?

        # The timestamp when the account was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The display name of the program management account.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The unique identifier of the program management account.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The program type for the management account.

        @[JSON::Field(key: "program")]
        getter program : String?

        # The current revision number of the program management account.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The start date of the program management account.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The current status of the program management account.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp when the account was last updated.

        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @program : String? = nil,
          @revision : String? = nil,
          @start_date : Time? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Type-specific filters for program management accounts.

      struct ProgramManagementAccountTypeFilters
        include JSON::Serializable

        # Filter by program types.

        @[JSON::Field(key: "programs")]
        getter programs : Array(String)?

        def initialize(
          @programs : Array(String)? = nil
        )
        end
      end

      # Type-specific sorting options for program management accounts.

      struct ProgramManagementAccountTypeSort
        include JSON::Serializable

        # The field to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # Contains details about a rejected channel handshake.

      struct RejectChannelHandshakeDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rejected handshake.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique identifier of the rejected handshake.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The current status of the rejected handshake.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct RejectChannelHandshakeRequest
        include JSON::Serializable

        # The catalog identifier for the handshake request.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the channel handshake to reject.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct RejectChannelHandshakeResponse
        include JSON::Serializable

        # Details of the rejected channel handshake.

        @[JSON::Field(key: "channelHandshakeDetail")]
        getter channel_handshake_detail : Types::RejectChannelHandshakeDetail?

        def initialize(
          @channel_handshake_detail : Types::RejectChannelHandshakeDetail? = nil
        )
        end
      end

      # Detailed information about a partner relationship.

      struct RelationshipDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the relationship.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The AWS account ID associated in this relationship.

        @[JSON::Field(key: "associatedAccountId")]
        getter associated_account_id : String?

        # The type of association for the relationship.

        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        # The catalog identifier associated with the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String?

        # The timestamp when the relationship was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The display name of the relationship.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The unique identifier of the relationship.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The identifier of the program management account.

        @[JSON::Field(key: "programManagementAccountId")]
        getter program_management_account_id : String?

        # The resale account model for the relationship.

        @[JSON::Field(key: "resaleAccountModel")]
        getter resale_account_model : String?

        # The current revision number of the relationship.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The business sector for the relationship.

        @[JSON::Field(key: "sector")]
        getter sector : String?

        # The start date of the relationship.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The timestamp when the relationship was last updated.

        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @associated_account_id : String? = nil,
          @association_type : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @program_management_account_id : String? = nil,
          @resale_account_model : String? = nil,
          @revision : String? = nil,
          @sector : String? = nil,
          @start_date : Time? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Summary information about a partner relationship.

      struct RelationshipSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the relationship.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The AWS account ID associated in this relationship.

        @[JSON::Field(key: "associatedAccountId")]
        getter associated_account_id : String?

        # The type of association for the relationship.

        @[JSON::Field(key: "associationType")]
        getter association_type : String?

        # The catalog identifier associated with the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String?

        # The timestamp when the relationship was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The display name of the relationship.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The unique identifier of the relationship.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The identifier of the program management account.

        @[JSON::Field(key: "programManagementAccountId")]
        getter program_management_account_id : String?

        # The current revision number of the relationship.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The business sector for the relationship.

        @[JSON::Field(key: "sector")]
        getter sector : String?

        # The start date of the relationship.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        # The timestamp when the relationship was last updated.

        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @associated_account_id : String? = nil,
          @association_type : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @program_management_account_id : String? = nil,
          @revision : String? = nil,
          @sector : String? = nil,
          @start_date : Time? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Configuration for resold business support plans.

      struct ResoldBusiness
        include JSON::Serializable

        # The coverage level for resold business support.

        @[JSON::Field(key: "coverage")]
        getter coverage : String

        def initialize(
          @coverage : String
        )
        end
      end

      # Configuration for resold enterprise support plans.

      struct ResoldEnterprise
        include JSON::Serializable

        # The coverage level for resold enterprise support.

        @[JSON::Field(key: "coverage")]
        getter coverage : String

        # The location of the Technical Account Manager (TAM).

        @[JSON::Field(key: "tamLocation")]
        getter tam_location : String

        # The AWS account ID to charge for the support plan.

        @[JSON::Field(key: "chargeAccountId")]
        getter charge_account_id : String?

        def initialize(
          @coverage : String,
          @tam_location : String,
          @charge_account_id : String? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable

        # A message describing the resource not found error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that was not found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that was not found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Details specific to revoke service period handshakes.

      struct RevokeServicePeriodHandshakeDetail
        include JSON::Serializable

        # The end date of the service period being revoked.

        @[JSON::Field(key: "endDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        # The minimum number of days notice required for revocation.

        @[JSON::Field(key: "minimumNoticeDays")]
        getter minimum_notice_days : String?

        # A note explaining the reason for revoking the service period.

        @[JSON::Field(key: "note")]
        getter note : String?

        # The type of service period being revoked.

        @[JSON::Field(key: "servicePeriodType")]
        getter service_period_type : String?

        # The start date of the service period being revoked.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        def initialize(
          @end_date : Time? = nil,
          @minimum_notice_days : String? = nil,
          @note : String? = nil,
          @service_period_type : String? = nil,
          @start_date : Time? = nil
        )
        end
      end

      # Payload for revoke service period handshake requests.

      struct RevokeServicePeriodPayload
        include JSON::Serializable

        # The identifier of the program management account.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        # A note explaining the reason for revoking the service period.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @program_management_account_identifier : String,
          @note : String? = nil
        )
        end
      end

      # Filters specific to revoke service period handshakes.

      struct RevokeServicePeriodTypeFilters
        include JSON::Serializable

        # Filter by service period types.

        @[JSON::Field(key: "servicePeriodTypes")]
        getter service_period_types : Array(String)?

        def initialize(
          @service_period_types : Array(String)? = nil
        )
        end
      end

      # Sorting options specific to revoke service period handshakes.

      struct RevokeServicePeriodTypeSort
        include JSON::Serializable

        # The field to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # The request would exceed a service quota limit.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # A message describing the service quota exceeded error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The code identifying the specific quota that would be exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The identifier of the resource that would exceed the quota.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that would exceed the quota.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Details specific to start service period handshakes.

      struct StartServicePeriodHandshakeDetail
        include JSON::Serializable

        # The end date of the service period.

        @[JSON::Field(key: "endDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        # The minimum number of days notice required for changes.

        @[JSON::Field(key: "minimumNoticeDays")]
        getter minimum_notice_days : String?

        # A note providing additional information about the service period.

        @[JSON::Field(key: "note")]
        getter note : String?

        # The type of service period being started.

        @[JSON::Field(key: "servicePeriodType")]
        getter service_period_type : String?

        # The start date of the service period.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time?

        def initialize(
          @end_date : Time? = nil,
          @minimum_notice_days : String? = nil,
          @note : String? = nil,
          @service_period_type : String? = nil,
          @start_date : Time? = nil
        )
        end
      end

      # Payload for start service period handshake requests.

      struct StartServicePeriodPayload
        include JSON::Serializable

        # The identifier of the program management account.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        # The type of service period being started.

        @[JSON::Field(key: "servicePeriodType")]
        getter service_period_type : String

        # The end date of the service period.

        @[JSON::Field(key: "endDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_date : Time?

        # The minimum number of days notice required for changes.

        @[JSON::Field(key: "minimumNoticeDays")]
        getter minimum_notice_days : String?

        # A note providing additional information about the service period.

        @[JSON::Field(key: "note")]
        getter note : String?

        def initialize(
          @program_management_account_identifier : String,
          @service_period_type : String,
          @end_date : Time? = nil,
          @minimum_notice_days : String? = nil,
          @note : String? = nil
        )
        end
      end

      # Filters specific to start service period handshakes.

      struct StartServicePeriodTypeFilters
        include JSON::Serializable

        # Filter by service period types.

        @[JSON::Field(key: "servicePeriodTypes")]
        getter service_period_types : Array(String)?

        def initialize(
          @service_period_types : Array(String)? = nil
        )
        end
      end

      # Sorting options specific to start service period handshakes.

      struct StartServicePeriodTypeSort
        include JSON::Serializable

        # The field to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @sort_by : String,
          @sort_order : String
        )
        end
      end

      # Configuration for different types of support plans.

      struct SupportPlan
        include JSON::Serializable

        # Configuration for partner-led support plans.

        @[JSON::Field(key: "partnerLedSupport")]
        getter partner_led_support : Types::PartnerLedSupport?

        # Configuration for resold business support plans.

        @[JSON::Field(key: "resoldBusiness")]
        getter resold_business : Types::ResoldBusiness?

        # Configuration for resold enterprise support plans.

        @[JSON::Field(key: "resoldEnterprise")]
        getter resold_enterprise : Types::ResoldEnterprise?

        def initialize(
          @partner_led_support : Types::PartnerLedSupport? = nil,
          @resold_business : Types::ResoldBusiness? = nil,
          @resold_enterprise : Types::ResoldEnterprise? = nil
        )
        end
      end

      # A key-value pair that can be associated with a resource.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag.

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

        # The Amazon Resource Name (ARN) of the resource to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Key-value pairs to associate with the resource.

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

      # The request was throttled due to too many requests being sent in a short period.

      struct ThrottlingException
        include JSON::Serializable

        # A message describing the throttling error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The quota code associated with the throttling error.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The service code associated with the throttling error.

        @[JSON::Field(key: "serviceCode")]
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


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains details about an updated program management account.

      struct UpdateProgramManagementAccountDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated program management account.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The updated display name of the program management account.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The unique identifier of the updated program management account.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The new revision number of the program management account.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end


      struct UpdateProgramManagementAccountRequest
        include JSON::Serializable

        # The catalog identifier for the program management account.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the program management account to update.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The new display name for the program management account.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The current revision number of the program management account.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @display_name : String? = nil,
          @revision : String? = nil
        )
        end
      end


      struct UpdateProgramManagementAccountResponse
        include JSON::Serializable

        # Details of the updated program management account.

        @[JSON::Field(key: "programManagementAccountDetail")]
        getter program_management_account_detail : Types::UpdateProgramManagementAccountDetail?

        def initialize(
          @program_management_account_detail : Types::UpdateProgramManagementAccountDetail? = nil
        )
        end
      end

      # Contains details about an updated relationship.

      struct UpdateRelationshipDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated relationship.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The updated display name of the relationship.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The unique identifier of the updated relationship.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The new revision number of the relationship.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end


      struct UpdateRelationshipRequest
        include JSON::Serializable

        # The catalog identifier for the relationship.

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The unique identifier of the relationship to update.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The identifier of the program management account associated with the relationship.

        @[JSON::Field(key: "programManagementAccountIdentifier")]
        getter program_management_account_identifier : String

        # The new display name for the relationship.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The updated support plan for the relationship.

        @[JSON::Field(key: "requestedSupportPlan")]
        getter requested_support_plan : Types::SupportPlan?

        # The current revision number of the relationship.

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @program_management_account_identifier : String,
          @display_name : String? = nil,
          @requested_support_plan : Types::SupportPlan? = nil,
          @revision : String? = nil
        )
        end
      end


      struct UpdateRelationshipResponse
        include JSON::Serializable

        # Details of the updated relationship.

        @[JSON::Field(key: "relationshipDetail")]
        getter relationship_detail : Types::UpdateRelationshipDetail?

        def initialize(
          @relationship_detail : Types::UpdateRelationshipDetail? = nil
        )
        end
      end

      # The request failed validation due to invalid input parameters.

      struct ValidationException
        include JSON::Serializable

        # A message describing the validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of fields that failed validation.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Information about a field that failed validation.

      struct ValidationExceptionField
        include JSON::Serializable

        # The validation error code for the field.

        @[JSON::Field(key: "code")]
        getter code : String

        # A descriptive message about the validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that failed validation.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @code : String,
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
