require "json"
require "time"

module Aws
  module MPA
    module Types

      # You do not have sufficient access to perform this action. Check your permissions, and try again.

      struct AccessDeniedException
        include JSON::Serializable

        # Message for the AccessDeniedException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Strategy for how an approval team grants approval.

      struct ApprovalStrategy
        include JSON::Serializable

        # Minimum number of approvals (M) required for a total number of approvers (N).

        @[JSON::Field(key: "MofN")]
        getter mof_n : Types::MofNApprovalStrategy?

        def initialize(
          @mof_n : Types::MofNApprovalStrategy? = nil
        )
        end
      end

      # Contains details for how an approval team grants approval.

      struct ApprovalStrategyResponse
        include JSON::Serializable

        # Minimum number of approvals (M) required for a total number of approvers (N).

        @[JSON::Field(key: "MofN")]
        getter mof_n : Types::MofNApprovalStrategy?

        def initialize(
          @mof_n : Types::MofNApprovalStrategy? = nil
        )
        end
      end

      # Contains details for an approver.

      struct ApprovalTeamRequestApprover
        include JSON::Serializable

        # ID for the user.

        @[JSON::Field(key: "PrimaryIdentityId")]
        getter primary_identity_id : String

        # Amazon Resource Name (ARN) for the identity source. The identity source manages the user
        # authentication for approvers.

        @[JSON::Field(key: "PrimaryIdentitySourceArn")]
        getter primary_identity_source_arn : String

        def initialize(
          @primary_identity_id : String,
          @primary_identity_source_arn : String
        )
        end
      end


      struct CancelSessionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the session.

        @[JSON::Field(key: "SessionArn")]
        getter session_arn : String

        def initialize(
          @session_arn : String
        )
        end
      end


      struct CancelSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request cannot be completed because it conflicts with the current state of a resource.

      struct ConflictException
        include JSON::Serializable

        # Message for the ConflictException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateApprovalTeamRequest
        include JSON::Serializable

        # An ApprovalStrategy object. Contains details for how the team grants approval.

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategy

        # An array of ApprovalTeamRequesterApprovers objects. Contains details for the approvers in the team.

        @[JSON::Field(key: "Approvers")]
        getter approvers : Array(Types::ApprovalTeamRequestApprover)

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String

        # Name of the team.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An array of PolicyReference objects. Contains a list of policies that define the permissions for
        # team resources. The protected operation for a service integration might require specific
        # permissions. For more information, see How other services work with Multi-party approval in the
        # Multi-party approval User Guide .

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicyReference)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not
        # provided, the Amazon Web Services populates this field. What is idempotency? When you make a
        # mutating API request, the request typically returns a result before the operation's asynchronous
        # workflows have completed. Operations might also time out or encounter other server issues before
        # they complete, even though the request has already returned a result. This could make it difficult
        # to determine whether the request succeeded or not, and could lead to multiple retries to ensure that
        # the operation completes successfully. However, if the original request and the subsequent retries
        # are successful, the operation is completed multiple times. This means that you might create more
        # resources than you intended. Idempotency ensures that an API request completes no more than one
        # time. With an idempotent request, if the original request completes successfully, any subsequent
        # retries complete successfully without performing any further actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Tags you want to attach to the team.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @approval_strategy : Types::ApprovalStrategy,
          @approvers : Array(Types::ApprovalTeamRequestApprover),
          @description : String,
          @name : String,
          @policies : Array(Types::PolicyReference),
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApprovalTeamResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team that was created.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Timestamp when the team was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Name of the team that was created.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Version ID for the team that was created. When a team is updated, the version ID changes.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct CreateIdentitySourceRequest
        include JSON::Serializable

        # A IdentitySourceParameters object. Contains details for the resource that provides identities to the
        # identity source. For example, an IAM Identity Center instance.

        @[JSON::Field(key: "IdentitySourceParameters")]
        getter identity_source_parameters : Types::IdentitySourceParameters

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If not
        # provided, the Amazon Web Services populates this field. What is idempotency? When you make a
        # mutating API request, the request typically returns a result before the operation's asynchronous
        # workflows have completed. Operations might also time out or encounter other server issues before
        # they complete, even though the request has already returned a result. This could make it difficult
        # to determine whether the request succeeded or not, and could lead to multiple retries to ensure that
        # the operation completes successfully. However, if the original request and the subsequent retries
        # are successful, the operation is completed multiple times. This means that you might create more
        # resources than you intended. Idempotency ensures that an API request completes no more than one
        # time. With an idempotent request, if the original request completes successfully, any subsequent
        # retries complete successfully without performing any further actions.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Tag you want to attach to the identity source.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @identity_source_parameters : Types::IdentitySourceParameters,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIdentitySourceResponse
        include JSON::Serializable

        # Timestamp when the identity source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Amazon Resource Name (ARN) for the identity source that was created.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String?

        # The type of resource that provided identities to the identity source. For example, an IAM Identity
        # Center instance.

        @[JSON::Field(key: "IdentitySourceType")]
        getter identity_source_type : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_source_arn : String? = nil,
          @identity_source_type : String? = nil
        )
        end
      end


      struct DeleteIdentitySourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for identity source.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String

        def initialize(
          @identity_source_arn : String
        )
        end
      end


      struct DeleteInactiveApprovalTeamVersionRequest
        include JSON::Serializable

        # Amaazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Version ID for the team.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String

        def initialize(
          @arn : String,
          @version_id : String
        )
        end
      end


      struct DeleteInactiveApprovalTeamVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the filter to apply to requests. You can specify up to 10 filters for a request.

      struct Filter
        include JSON::Serializable

        # Name of the filter to use. Supported filters The supported filters for ListSessions are: ActionName
        # , SessionStatus , and InitationTime .

        @[JSON::Field(key: "FieldName")]
        getter field_name : String?

        # Operator to use for filtering. EQ : Equal to the specified value NE : Not equal to the specified
        # value GT : Greater than the specified value LT : Less than the specified value GTE : Greater than or
        # equal to the specified value LTE : Less than or equal to the specified value CONTAINS : Contains the
        # specified value NOT_CONTAINS : Does not contain the specified value BETWEEN : Between two values,
        # inclusive of the specified values. Supported operators for each filter : ActionName : EQ | NE |
        # CONTAINS | NOT_CONTAINS SessionStatus : EQ | NE InitiationTime : GT | LT | GTE | LTE | BETWEEN

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # Value to use for filtering. For the BETWEEN operator, specify values in the format a AND b ( AND is
        # case-insensitive).

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @field_name : String? = nil,
          @operator : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct GetApprovalTeamRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetApprovalTeamResponse
        include JSON::Serializable

        # An ApprovalStrategyResponse object. Contains details for how the team grants approval.

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategyResponse?

        # An array of GetApprovalTeamResponseApprover objects. Contains details for the approvers in the team.

        @[JSON::Field(key: "Approvers")]
        getter approvers : Array(Types::GetApprovalTeamResponseApprover)?

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Timestamp when the team was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Timestamp when the team was last updated.

        @[JSON::Field(key: "LastUpdateTime")]
        getter last_update_time : Time?

        # Name of the approval team.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Total number of approvers in the team.

        @[JSON::Field(key: "NumberOfApprovers")]
        getter number_of_approvers : Int32?

        # A PendingUpdate object. Contains details for the pending updates for the team, if applicable.

        @[JSON::Field(key: "PendingUpdate")]
        getter pending_update : Types::PendingUpdate?

        # An array of PolicyReference objects. Contains a list of policies that define the permissions for
        # team resources. The protected operation for a service integration might require specific
        # permissions. For more information, see How other services work with Multi-party approval in the
        # Multi-party approval User Guide .

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicyReference)?

        # Status for the team. For more information, see Team health in the Multi-party approval User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code for the approval team. For more information, see Team health in the Multi-party approval
        # User Guide .

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for the team.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Amazon Resource Name (ARN) for the session.

        @[JSON::Field(key: "UpdateSessionArn")]
        getter update_session_arn : String?

        # Version ID for the team.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @approval_strategy : Types::ApprovalStrategyResponse? = nil,
          @approvers : Array(Types::GetApprovalTeamResponseApprover)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @last_update_time : Time? = nil,
          @name : String? = nil,
          @number_of_approvers : Int32? = nil,
          @pending_update : Types::PendingUpdate? = nil,
          @policies : Array(Types::PolicyReference)? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil,
          @update_session_arn : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Contains details for an approver.

      struct GetApprovalTeamResponseApprover
        include JSON::Serializable

        # ID for the approver.

        @[JSON::Field(key: "ApproverId")]
        getter approver_id : String?

        # ID for the user.

        @[JSON::Field(key: "PrimaryIdentityId")]
        getter primary_identity_id : String?

        # Amazon Resource Name (ARN) for the identity source. The identity source manages the user
        # authentication for approvers.

        @[JSON::Field(key: "PrimaryIdentitySourceArn")]
        getter primary_identity_source_arn : String?

        # Status for the identity source. For example, if an approver has accepted a team invitation with a
        # user authentication method managed by the identity source.

        @[JSON::Field(key: "PrimaryIdentityStatus")]
        getter primary_identity_status : String?

        # Timestamp when the approver responded to an approval team invitation.

        @[JSON::Field(key: "ResponseTime")]
        getter response_time : Time?

        def initialize(
          @approver_id : String? = nil,
          @primary_identity_id : String? = nil,
          @primary_identity_source_arn : String? = nil,
          @primary_identity_status : String? = nil,
          @response_time : Time? = nil
        )
        end
      end


      struct GetIdentitySourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the identity source.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String

        def initialize(
          @identity_source_arn : String
        )
        end
      end


      struct GetIdentitySourceResponse
        include JSON::Serializable

        # Timestamp when the identity source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Amazon Resource Name (ARN) for the identity source.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String?

        # A IdentitySourceParameters object. Contains details for the resource that provides identities to the
        # identity source. For example, an IAM Identity Center instance.

        @[JSON::Field(key: "IdentitySourceParameters")]
        getter identity_source_parameters : Types::IdentitySourceParametersForGet?

        # The type of resource that provided identities to the identity source. For example, an IAM Identity
        # Center instance.

        @[JSON::Field(key: "IdentitySourceType")]
        getter identity_source_type : String?

        # Status for the identity source. For example, if the identity source is ACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code of the identity source.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for the identity source.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_source_arn : String? = nil,
          @identity_source_parameters : Types::IdentitySourceParametersForGet? = nil,
          @identity_source_type : String? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct GetPolicyVersionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "PolicyVersionArn")]
        getter policy_version_arn : String

        def initialize(
          @policy_version_arn : String
        )
        end
      end


      struct GetPolicyVersionResponse
        include JSON::Serializable

        # A PolicyVersion object. Contains details for the version of the policy. Policies define the
        # permissions for team resources. The protected operation for a service integration might require
        # specific permissions. For more information, see How other services work with Multi-party approval in
        # the Multi-party approval User Guide .

        @[JSON::Field(key: "PolicyVersion")]
        getter policy_version : Types::PolicyVersion

        def initialize(
          @policy_version : Types::PolicyVersion
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # Name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The type of policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy_name : String,
          @policy_type : String,
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # Document that contains the contents for the policy.

        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # Name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The type of policy

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Amazon Resource Name (ARN) for the policy version.

        @[JSON::Field(key: "PolicyVersionArn")]
        getter policy_version_arn : String?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @policy_type : String,
          @resource_arn : String,
          @policy_version_arn : String? = nil
        )
        end
      end


      struct GetSessionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the session.

        @[JSON::Field(key: "SessionArn")]
        getter session_arn : String

        def initialize(
          @session_arn : String
        )
        end
      end


      struct GetSessionResponse
        include JSON::Serializable

        # Strategy for executing the protected operation. AUTO_COMPLETION_UPON_APPROVAL means the operation is
        # automatically executed using the requester's permissions, if approved.

        @[JSON::Field(key: "ActionCompletionStrategy")]
        getter action_completion_strategy : String?

        # Name of the protected operation.

        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        # An ApprovalStrategyResponse object. Contains details for how the team grants approval

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategyResponse?

        # Amazon Resource Name (ARN) for the approval team.

        @[JSON::Field(key: "ApprovalTeamArn")]
        getter approval_team_arn : String?

        # Name of the approval team.

        @[JSON::Field(key: "ApprovalTeamName")]
        getter approval_team_name : String?

        # An array of GetSessionResponseApproverResponse objects. Contains details for approver responses in
        # the session.

        @[JSON::Field(key: "ApproverResponses")]
        getter approver_responses : Array(Types::GetSessionResponseApproverResponse)?

        # Timestamp when the session completed.

        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # Description for the session.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Status for the protected operation. For example, if the operation is PENDING .

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : String?

        # Timestamp when the session will expire.

        @[JSON::Field(key: "ExpirationTime")]
        getter expiration_time : Time?

        # Timestamp when the session was initiated.

        @[JSON::Field(key: "InitiationTime")]
        getter initiation_time : Time?

        # Metadata for the session.

        @[JSON::Field(key: "Metadata")]
        getter metadata : Hash(String, String)?

        # Total number of approvers in the session.

        @[JSON::Field(key: "NumberOfApprovers")]
        getter number_of_approvers : Int32?

        # Amazon Resource Name (ARN) for the protected operation.

        @[JSON::Field(key: "ProtectedResourceArn")]
        getter protected_resource_arn : String?

        # ID for the account that made the operation request.

        @[JSON::Field(key: "RequesterAccountId")]
        getter requester_account_id : String?

        # Message from the account that made the operation request

        @[JSON::Field(key: "RequesterComment")]
        getter requester_comment : String?

        # IAM principal that made the operation request.

        @[JSON::Field(key: "RequesterPrincipalArn")]
        getter requester_principal_arn : String?

        # Amazon Web Services Region where the operation request originated.

        @[JSON::Field(key: "RequesterRegion")]
        getter requester_region : String?

        # Service principal for the service associated with the protected operation.

        @[JSON::Field(key: "RequesterServicePrincipal")]
        getter requester_service_principal : String?

        # Amazon Resource Name (ARN) for the session.

        @[JSON::Field(key: "SessionArn")]
        getter session_arn : String?

        # Status for the session. For example, if the team has approved the requested operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code of the session.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for session.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @action_completion_strategy : String? = nil,
          @action_name : String? = nil,
          @approval_strategy : Types::ApprovalStrategyResponse? = nil,
          @approval_team_arn : String? = nil,
          @approval_team_name : String? = nil,
          @approver_responses : Array(Types::GetSessionResponseApproverResponse)? = nil,
          @completion_time : Time? = nil,
          @description : String? = nil,
          @execution_status : String? = nil,
          @expiration_time : Time? = nil,
          @initiation_time : Time? = nil,
          @metadata : Hash(String, String)? = nil,
          @number_of_approvers : Int32? = nil,
          @protected_resource_arn : String? = nil,
          @requester_account_id : String? = nil,
          @requester_comment : String? = nil,
          @requester_principal_arn : String? = nil,
          @requester_region : String? = nil,
          @requester_service_principal : String? = nil,
          @session_arn : String? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains details for an approver response in an approval session.

      struct GetSessionResponseApproverResponse
        include JSON::Serializable

        # ID for the approver.

        @[JSON::Field(key: "ApproverId")]
        getter approver_id : String?

        # ID for the identity source. The identity source manages the user authentication for approvers.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # Amazon Resource Name (ARN) for the identity source. The identity source manages the user
        # authentication for approvers.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String?

        # Response to the operation request.

        @[JSON::Field(key: "Response")]
        getter response : String?

        # Timestamp when a approver responded to the operation request.

        @[JSON::Field(key: "ResponseTime")]
        getter response_time : Time?

        def initialize(
          @approver_id : String? = nil,
          @identity_id : String? = nil,
          @identity_source_arn : String? = nil,
          @response : String? = nil,
          @response_time : Time? = nil
        )
        end
      end

      # IAM Identity Center credentials. For more information see, IAM Identity Center .

      struct IamIdentityCenter
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the IAM Identity Center instance.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String

        # Amazon Web Services Region where the IAM Identity Center instance is located.

        @[JSON::Field(key: "Region")]
        getter region : String

        def initialize(
          @instance_arn : String,
          @region : String
        )
        end
      end

      # IAM Identity Center credentials. For more information see, IAM Identity Center .

      struct IamIdentityCenterForGet
        include JSON::Serializable

        # URL for the approval portal associated with the IAM Identity Center instance.

        @[JSON::Field(key: "ApprovalPortalUrl")]
        getter approval_portal_url : String?

        # Amazon Resource Name (ARN) for the IAM Identity Center instance.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # Amazon Web Services Region where the IAM Identity Center instance is located.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @approval_portal_url : String? = nil,
          @instance_arn : String? = nil,
          @region : String? = nil
        )
        end
      end

      # IAM Identity Center credentials. For more information see, IAM Identity Center .

      struct IamIdentityCenterForList
        include JSON::Serializable

        # URL for the approval portal associated with the IAM Identity Center instance.

        @[JSON::Field(key: "ApprovalPortalUrl")]
        getter approval_portal_url : String?

        # Amazon Resource Name (ARN) for the IAM Identity Center instance.

        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # Amazon Web Services Region where the IAM Identity Center instance is located.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @approval_portal_url : String? = nil,
          @instance_arn : String? = nil,
          @region : String? = nil
        )
        end
      end

      # Contains details for an identity source. For more information, see Identity source in the
      # Multi-party approval User Guide .

      struct IdentitySourceForList
        include JSON::Serializable

        # Timestamp when the identity source was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Amazon Resource Name (ARN) for the identity source.

        @[JSON::Field(key: "IdentitySourceArn")]
        getter identity_source_arn : String?

        # A IdentitySourceParametersForList object. Contains details for the resource that provides identities
        # to the identity source. For example, an IAM Identity Center instance.

        @[JSON::Field(key: "IdentitySourceParameters")]
        getter identity_source_parameters : Types::IdentitySourceParametersForList?

        # The type of resource that provided identities to the identity source. For example, an IAM Identity
        # Center instance.

        @[JSON::Field(key: "IdentitySourceType")]
        getter identity_source_type : String?

        # Status for the identity source. For example, if the identity source is ACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code of the identity source.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for the identity source.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time? = nil,
          @identity_source_arn : String? = nil,
          @identity_source_parameters : Types::IdentitySourceParametersForList? = nil,
          @identity_source_type : String? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains details for the resource that provides identities to the identity source. For example, an
      # IAM Identity Center instance.

      struct IdentitySourceParameters
        include JSON::Serializable

        # IAM Identity Center credentials.

        @[JSON::Field(key: "IamIdentityCenter")]
        getter iam_identity_center : Types::IamIdentityCenter?

        def initialize(
          @iam_identity_center : Types::IamIdentityCenter? = nil
        )
        end
      end

      # Contains details for the resource that provides identities to the identity source. For example, an
      # IAM Identity Center instance. For more information, see Identity source in the Multi-party approval
      # User Guide .

      struct IdentitySourceParametersForGet
        include JSON::Serializable

        # IAM Identity Center credentials.

        @[JSON::Field(key: "IamIdentityCenter")]
        getter iam_identity_center : Types::IamIdentityCenterForGet?

        def initialize(
          @iam_identity_center : Types::IamIdentityCenterForGet? = nil
        )
        end
      end

      # Contains details for the resource that provides identities to the identity source. For example, an
      # IAM Identity Center instance. For more information, see Identity source in the Multi-party approval
      # User Guide .

      struct IdentitySourceParametersForList
        include JSON::Serializable

        # IAM Identity Center credentials.

        @[JSON::Field(key: "IamIdentityCenter")]
        getter iam_identity_center : Types::IamIdentityCenterForList?

        def initialize(
          @iam_identity_center : Types::IamIdentityCenterForList? = nil
        )
        end
      end

      # The service encountered an internal error. Try your request again. If the problem persists, contact
      # Amazon Web Services Support.

      struct InternalServerException
        include JSON::Serializable

        # Message for the InternalServerException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request contains an invalid parameter value.

      struct InvalidParameterException
        include JSON::Serializable

        # Message for the InvalidParameterException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListApprovalTeamsRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApprovalTeamsResponse
        include JSON::Serializable

        # An array of ListApprovalTeamsResponseApprovalTeam objects. Contains details for approval teams.

        @[JSON::Field(key: "ApprovalTeams")]
        getter approval_teams : Array(Types::ListApprovalTeamsResponseApprovalTeam)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @approval_teams : Array(Types::ListApprovalTeamsResponseApprovalTeam)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains details for an approval team

      struct ListApprovalTeamsResponseApprovalTeam
        include JSON::Serializable

        # An ApprovalStrategyResponse object. Contains details for how an approval team grants approval.

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategyResponse?

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Timestamp when the team was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Name of the team.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Total number of approvers in the team.

        @[JSON::Field(key: "NumberOfApprovers")]
        getter number_of_approvers : Int32?

        # Status for the team. For more information, see Team health in the Multi-party approval User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code for the team. For more information, see Team health in the Multi-party approval User
        # Guide .

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for the team.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @approval_strategy : Types::ApprovalStrategyResponse? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @number_of_approvers : Int32? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct ListIdentitySourcesRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIdentitySourcesResponse
        include JSON::Serializable

        # A IdentitySources . Contains details for identity sources.

        @[JSON::Field(key: "IdentitySources")]
        getter identity_sources : Array(Types::IdentitySourceForList)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_sources : Array(Types::IdentitySourceForList)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPoliciesRequest
        include JSON::Serializable

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPoliciesResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of Policy objects. Contains a list of policies that define the permissions for team
        # resources. The protected operation for a service integration might require specific permissions. For
        # more information, see How other services work with Multi-party approval in the Multi-party approval
        # User Guide .

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::Policy)?

        def initialize(
          @next_token : String? = nil,
          @policies : Array(Types::Policy)? = nil
        )
        end
      end


      struct ListPolicyVersionsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @policy_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPolicyVersionsResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of PolicyVersionSummary objects. Contains details for the version of the policies that
        # define the permissions for team resources. The protected operation for a service integration might
        # require specific permissions. For more information, see How other services work with Multi-party
        # approval in the Multi-party approval User Guide .

        @[JSON::Field(key: "PolicyVersions")]
        getter policy_versions : Array(Types::PolicyVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @policy_versions : Array(Types::PolicyVersionSummary)? = nil
        )
        end
      end


      struct ListResourcePoliciesRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourcePoliciesResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ListResourcePoliciesResponseResourcePolicy objects. Contains details about the policy
        # for the resource.

        @[JSON::Field(key: "ResourcePolicies")]
        getter resource_policies : Array(Types::ListResourcePoliciesResponseResourcePolicy)?

        def initialize(
          @next_token : String? = nil,
          @resource_policies : Array(Types::ListResourcePoliciesResponseResourcePolicy)? = nil
        )
        end
      end

      # Contains details about a policy for a resource.

      struct ListResourcePoliciesResponseResourcePolicy
        include JSON::Serializable

        # Amazon Resource Name (ARN) for policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String?

        # Name of the policy.

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # The type of policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @policy_arn : String? = nil,
          @policy_name : String? = nil,
          @policy_type : String? = nil
        )
        end
      end


      struct ListSessionsRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the approval team.

        @[JSON::Field(key: "ApprovalTeamArn")]
        getter approval_team_arn : String

        # An array of Filter objects. Contains the filter to apply when listing sessions.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum number of items to return in the response. If more results exist than the specified
        # MaxResults value, a token is included in the response so that you can retrieve the remaining
        # results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @approval_team_arn : String,
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSessionsResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a next call to the operation to get more output.
        # You can repeat this until the NextToken response element returns null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ListSessionsResponseSession objects. Contains details for the sessions.

        @[JSON::Field(key: "Sessions")]
        getter sessions : Array(Types::ListSessionsResponseSession)?

        def initialize(
          @next_token : String? = nil,
          @sessions : Array(Types::ListSessionsResponseSession)? = nil
        )
        end
      end

      # Contains details for an approval session. For more information, see Session in the Multi-party
      # approval User Guide

      struct ListSessionsResponseSession
        include JSON::Serializable

        # Strategy for executing the protected operation. AUTO_COMPLETION_UPON_APPROVAL means the operation is
        # executed automatically using the requester's permissions, if approved.

        @[JSON::Field(key: "ActionCompletionStrategy")]
        getter action_completion_strategy : String?

        # Name of the protected operation.

        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        # Amazon Resource Name (ARN) for the approval team.

        @[JSON::Field(key: "ApprovalTeamArn")]
        getter approval_team_arn : String?

        # Name of the approval team.

        @[JSON::Field(key: "ApprovalTeamName")]
        getter approval_team_name : String?

        # Timestamp when the session was completed.

        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Timestamp when the session was expire.

        @[JSON::Field(key: "ExpirationTime")]
        getter expiration_time : Time?

        # Timestamp when the session was initiated.

        @[JSON::Field(key: "InitiationTime")]
        getter initiation_time : Time?

        # Amazon Resource Name (ARN) for the protected operation.

        @[JSON::Field(key: "ProtectedResourceArn")]
        getter protected_resource_arn : String?

        # ID for the account that made the operation request.

        @[JSON::Field(key: "RequesterAccountId")]
        getter requester_account_id : String?

        # IAM principal that made the operation request.

        @[JSON::Field(key: "RequesterPrincipalArn")]
        getter requester_principal_arn : String?

        # Amazon Web Services Region where the operation request originated.

        @[JSON::Field(key: "RequesterRegion")]
        getter requester_region : String?

        # Service principal for the service associated with the protected operation.

        @[JSON::Field(key: "RequesterServicePrincipal")]
        getter requester_service_principal : String?

        # Amazon Resource Name (ARN) for the session.

        @[JSON::Field(key: "SessionArn")]
        getter session_arn : String?

        # Status for the protected operation. For example, if the operation is PENDING .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code of the session.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for session.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @action_completion_strategy : String? = nil,
          @action_name : String? = nil,
          @approval_team_arn : String? = nil,
          @approval_team_name : String? = nil,
          @completion_time : Time? = nil,
          @description : String? = nil,
          @expiration_time : Time? = nil,
          @initiation_time : Time? = nil,
          @protected_resource_arn : String? = nil,
          @requester_account_id : String? = nil,
          @requester_principal_arn : String? = nil,
          @requester_region : String? = nil,
          @requester_service_principal : String? = nil,
          @session_arn : String? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags attached to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Strategy for how an approval team grants approval.

      struct MofNApprovalStrategy
        include JSON::Serializable

        # Minimum number of approvals (M) required for a total number of approvers (N).

        @[JSON::Field(key: "MinApprovalsRequired")]
        getter min_approvals_required : Int32

        def initialize(
          @min_approvals_required : Int32
        )
        end
      end

      # Contains details for the pending updates for an approval team, if applicable.

      struct PendingUpdate
        include JSON::Serializable

        # An ApprovalStrategyResponse object. Contains details for how the team grants approval.

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategyResponse?

        # An array of GetApprovalTeamResponseApprover objects. Contains details for the approvers in the team.

        @[JSON::Field(key: "Approvers")]
        getter approvers : Array(Types::GetApprovalTeamResponseApprover)?

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Total number of approvers in the team.

        @[JSON::Field(key: "NumberOfApprovers")]
        getter number_of_approvers : Int32?

        # Status for the team. For more information, see Team health in the Multi-party approval User Guide .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status code for the update. For more information, see Team health in the Multi-party approval User
        # Guide .

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # Message describing the status for the team.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Timestamp when the update request was initiated.

        @[JSON::Field(key: "UpdateInitiationTime")]
        getter update_initiation_time : Time?

        # Version ID for the team.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @approval_strategy : Types::ApprovalStrategyResponse? = nil,
          @approvers : Array(Types::GetApprovalTeamResponseApprover)? = nil,
          @description : String? = nil,
          @number_of_approvers : Int32? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil,
          @update_initiation_time : Time? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Contains details for a policy. Policies define what operations a team that define the permissions
      # for team resources. The protected operation for a service integration might require specific
      # permissions. For more information, see How other services work with Multi-party approval in the
      # Multi-party approval User Guide .

      struct Policy
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Determines if the specified policy is the default for the team.

        @[JSON::Field(key: "DefaultVersion")]
        getter default_version : Int32

        # Name of the policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        def initialize(
          @arn : String,
          @default_version : Int32,
          @name : String,
          @policy_type : String
        )
        end
      end

      # Contains the Amazon Resource Name (ARN) for a policy. Policies define what operations a team that
      # define the permissions for team resources. The protected operation for a service integration might
      # require specific permissions. For more information, see How other services work with Multi-party
      # approval in the Multi-party approval User Guide .

      struct PolicyReference
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        def initialize(
          @policy_arn : String
        )
        end
      end

      # Contains details for the version of a policy. Policies define what operations a team that define the
      # permissions for team resources. The protected operation for a service integration might require
      # specific permissions. For more information, see How other services work with Multi-party approval in
      # the Multi-party approval User Guide .

      struct PolicyVersion
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Timestamp when the policy was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # Document that contains the policy contents.

        @[JSON::Field(key: "Document")]
        getter document : String

        # Determines if the specified policy is the default for the team.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool

        # Timestamp when the policy was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # Name of the policy.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The type of policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # Status for the policy. For example, if the policy is attachable or deprecated .

        @[JSON::Field(key: "Status")]
        getter status : String

        # Verison ID

        @[JSON::Field(key: "VersionId")]
        getter version_id : Int32

        def initialize(
          @arn : String,
          @creation_time : Time,
          @document : String,
          @is_default : Bool,
          @last_updated_time : Time,
          @name : String,
          @policy_arn : String,
          @policy_type : String,
          @status : String,
          @version_id : Int32
        )
        end
      end

      # Contains details for the version of a policy. Policies define what operations a team that define the
      # permissions for team resources. The protected operation for a service integration might require
      # specific permissions. For more information, see How other services work with Multi-party approval in
      # the Multi-party approval User Guide .

      struct PolicyVersionSummary
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Timestamp when the policy was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # Determines if the specified policy is the default for the team.

        @[JSON::Field(key: "IsDefault")]
        getter is_default : Bool

        # Timestamp when the policy was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # Name of the policy

        @[JSON::Field(key: "Name")]
        getter name : String

        # Amazon Resource Name (ARN) for the policy.

        @[JSON::Field(key: "PolicyArn")]
        getter policy_arn : String

        # The type of policy.

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String

        # Status for the policy. For example, if the policy is attachable or deprecated .

        @[JSON::Field(key: "Status")]
        getter status : String

        # Version ID for the policy.

        @[JSON::Field(key: "VersionId")]
        getter version_id : Int32

        def initialize(
          @arn : String,
          @creation_time : Time,
          @is_default : Bool,
          @last_updated_time : Time,
          @name : String,
          @policy_arn : String,
          @policy_type : String,
          @status : String,
          @version_id : Int32
        )
        end
      end

      # The specified resource doesn't exist. Check the resource ID, and try again.

      struct ResourceNotFoundException
        include JSON::Serializable

        # Message for the ResourceNotFoundException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request exceeds the service quota for your account. Request a quota increase or reduce your
      # request size.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Message for the ServiceQuotaExceededException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct StartActiveApprovalTeamDeletionRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Number of days between when the team approves the delete request and when the team is deleted.

        @[JSON::Field(key: "PendingWindowDays")]
        getter pending_window_days : Int32?

        def initialize(
          @arn : String,
          @pending_window_days : Int32? = nil
        )
        end
      end


      struct StartActiveApprovalTeamDeletionResponse
        include JSON::Serializable

        # Timestamp when the deletion process is scheduled to complete.

        @[JSON::Field(key: "DeletionCompletionTime")]
        getter deletion_completion_time : Time?

        # Timestamp when the deletion process was initiated.

        @[JSON::Field(key: "DeletionStartTime")]
        getter deletion_start_time : Time?

        def initialize(
          @deletion_completion_time : Time? = nil,
          @deletion_start_time : Time? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the resource you want to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tags that you have added to the specified resource.

        @[JSON::Field(key: "Tags")]
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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable

        # Message for the ThrottlingException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request exceeds the maximum number of tags allowed for this resource. Remove some tags, and try
      # again.

      struct TooManyTagsException
        include JSON::Serializable

        # Message for the TooManyTagsException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # Name of the resource for the TooManyTagsException error.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String,
          @resource_name : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the resource you want to untag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Array of tag key-value pairs that you want to untag.

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


      struct UpdateApprovalTeamRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) for the team.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An ApprovalStrategy object. Contains details for how the team grants approval.

        @[JSON::Field(key: "ApprovalStrategy")]
        getter approval_strategy : Types::ApprovalStrategy?

        # An array of ApprovalTeamRequestApprover objects. Contains details for the approvers in the team.

        @[JSON::Field(key: "Approvers")]
        getter approvers : Array(Types::ApprovalTeamRequestApprover)?

        # Description for the team.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @arn : String,
          @approval_strategy : Types::ApprovalStrategy? = nil,
          @approvers : Array(Types::ApprovalTeamRequestApprover)? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateApprovalTeamResponse
        include JSON::Serializable

        # Version ID for the team that was created. When an approval team is updated, the version ID changes.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @version_id : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable

        # Message for the ValidationException error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
