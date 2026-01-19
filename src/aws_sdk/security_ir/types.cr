require "json"
require "time"

module AwsSdk
  module SecurityIR
    module Types

      struct AccessDeniedException
        include JSON::Serializable

        # The ID of the resource which lead to the access denial.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct BatchGetMemberAccountDetailsRequest
        include JSON::Serializable

        # Optional element to query the membership relationship status to a provided list of account IDs. AWS
        # account ID's may appear less than 12 characters and need to be zero-prepended. An example would be
        # 123123123 which is nine digits, and with zero-prepend would be 000123123123 . Not zero-prepending to
        # 12 digits could result in errors.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # Required element used in combination with BatchGetMemberAccountDetails to identify the membership ID
        # to query.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        def initialize(
          @account_ids : Array(String),
          @membership_id : String
        )
        end
      end

      struct BatchGetMemberAccountDetailsResponse
        include JSON::Serializable

        # The response element providing error messages for requests to GetMembershipAccountDetails.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetMembershipAccountDetailError)?

        # The response element providing responses for requests to GetMembershipAccountDetails.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::GetMembershipAccountDetailItem)?

        def initialize(
          @errors : Array(Types::GetMembershipAccountDetailError)? = nil,
          @items : Array(Types::GetMembershipAccountDetailItem)? = nil
        )
        end
      end

      struct CancelMembershipRequest
        include JSON::Serializable

        # Required element used in combination with CancelMembershipRequest to identify the membership ID to
        # cancel.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        def initialize(
          @membership_id : String
        )
        end
      end

      struct CancelMembershipResponse
        include JSON::Serializable

        # The response element providing responses for requests to CancelMembershipRequest.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        def initialize(
          @membership_id : String
        )
        end
      end

      struct CaseAttachmentAttributes
        include JSON::Serializable

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        @[JSON::Field(key: "attachmentStatus")]
        getter attachment_status : String

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time

        @[JSON::Field(key: "creator")]
        getter creator : String

        @[JSON::Field(key: "fileName")]
        getter file_name : String

        def initialize(
          @attachment_id : String,
          @attachment_status : String,
          @created_date : Time,
          @creator : String,
          @file_name : String
        )
        end
      end

      struct CaseEditItem
        include JSON::Serializable

        @[JSON::Field(key: "action")]
        getter action : String?

        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "principal")]
        getter principal : String?

        def initialize(
          @action : String? = nil,
          @event_timestamp : Time? = nil,
          @message : String? = nil,
          @principal : String? = nil
        )
        end
      end

      # Represents a single metadata entry associated with a case. Each entry consists of a key-value pair
      # that provides additional contextual information about the case, such as classification tags, custom
      # attributes, or system-generated properties.
      struct CaseMetadataEntry
        include JSON::Serializable

        # The identifier for the metadata field. This key uniquely identifies the type of metadata being
        # stored, such as "severity", "category", or "assignee".
        @[JSON::Field(key: "key")]
        getter key : String

        # The value associated with the metadata key. This contains the actual data for the metadata field
        # identified by the key.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct CloseCaseRequest
        include JSON::Serializable

        # Required element used in combination with CloseCase to identify the case ID to close.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_id : String
        )
        end
      end

      struct CloseCaseResponse
        include JSON::Serializable

        # A response element providing responses for requests to CloseCase. This element responds Closed if
        # successful.
        @[JSON::Field(key: "caseStatus")]
        getter case_status : String?

        # A response element providing responses for requests to CloseCase. This element responds with the
        # ISO-8601 formatted timestamp of the moment when the case was closed.
        @[JSON::Field(key: "closedDate")]
        getter closed_date : Time?

        def initialize(
          @case_status : String? = nil,
          @closed_date : Time? = nil
        )
        end
      end

      struct ConflictException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the conflicting resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the conflicting resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateCaseCommentRequest
        include JSON::Serializable

        # Required element used in combination with CreateCaseComment to add content for the new comment.
        @[JSON::Field(key: "body")]
        getter body : String

        # Required element used in combination with CreateCaseComment to specify a case ID.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The clientToken field is an idempotency key used to ensure that repeated attempts for a single
        # action will be ignored by the server during retries. A caller supplied unique ID (typically a UUID)
        # should be provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @body : String,
          @case_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateCaseCommentResponse
        include JSON::Serializable

        # Response element indicating the new comment ID.
        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        def initialize(
          @comment_id : String
        )
        end
      end

      struct CreateCaseRequest
        include JSON::Serializable

        # Required element used in combination with CreateCase to provide a description for the new case.
        @[JSON::Field(key: "description")]
        getter description : String

        # Required element used in combination with CreateCase to provide an engagement type for the new
        # cases. Available engagement types include Security Incident | Investigation
        @[JSON::Field(key: "engagementType")]
        getter engagement_type : String

        # Required element used in combination with CreateCase to provide a list of impacted accounts. AWS
        # account ID's may appear less than 12 characters and need to be zero-prepended. An example would be
        # 123123123 which is nine digits, and with zero-prepend would be 000123123123 . Not zero-prepending to
        # 12 digits could result in errors.
        @[JSON::Field(key: "impactedAccounts")]
        getter impacted_accounts : Array(String)

        # Required element used in combination with CreateCase to provide an initial start date for the
        # unauthorized activity.
        @[JSON::Field(key: "reportedIncidentStartDate")]
        getter reported_incident_start_date : Time

        # Required element used in combination with CreateCase to identify the resolver type.
        @[JSON::Field(key: "resolverType")]
        getter resolver_type : String

        # Required element used in combination with CreateCase to provide a title for the new case.
        @[JSON::Field(key: "title")]
        getter title : String

        # Required element used in combination with CreateCase to provide a list of entities to receive
        # notifications for case updates.
        @[JSON::Field(key: "watchers")]
        getter watchers : Array(Types::Watcher)

        # The clientToken field is an idempotency key used to ensure that repeated attempts for a single
        # action will be ignored by the server during retries. A caller supplied unique ID (typically a UUID)
        # should be provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional element used in combination with CreateCase to provide a list of impacted regions.
        @[JSON::Field(key: "impactedAwsRegions")]
        getter impacted_aws_regions : Array(Types::ImpactedAwsRegion)?

        # An optional element used in combination with CreateCase to provide a list of services impacted.
        @[JSON::Field(key: "impactedServices")]
        getter impacted_services : Array(String)?

        # An optional element used in combination with CreateCase to add customer specified tags to a case.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # An optional element used in combination with CreateCase to provide a list of suspicious internet
        # protocol addresses associated with unauthorized activity.
        @[JSON::Field(key: "threatActorIpAddresses")]
        getter threat_actor_ip_addresses : Array(Types::ThreatActorIp)?

        def initialize(
          @description : String,
          @engagement_type : String,
          @impacted_accounts : Array(String),
          @reported_incident_start_date : Time,
          @resolver_type : String,
          @title : String,
          @watchers : Array(Types::Watcher),
          @client_token : String? = nil,
          @impacted_aws_regions : Array(Types::ImpactedAwsRegion)? = nil,
          @impacted_services : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @threat_actor_ip_addresses : Array(Types::ThreatActorIp)? = nil
        )
        end
      end

      struct CreateCaseResponse
        include JSON::Serializable

        # A response element providing responses for requests to CreateCase. This element responds with the
        # case ID.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_id : String
        )
        end
      end

      struct CreateMembershipRequest
        include JSON::Serializable

        # Required element used in combination with CreateMembership to add customer incident response team
        # members and trusted partners to the membership.
        @[JSON::Field(key: "incidentResponseTeam")]
        getter incident_response_team : Array(Types::IncidentResponder)

        # Required element used in combination with CreateMembership to create a name for the membership.
        @[JSON::Field(key: "membershipName")]
        getter membership_name : String

        # The clientToken field is an idempotency key used to ensure that repeated attempts for a single
        # action will be ignored by the server during retries. A caller supplied unique ID (typically a UUID)
        # should be provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The coverEntireOrganization parameter is a boolean flag that determines whether the membership
        # should be applied to the entire Amazon Web Services Organization. When set to true, the membership
        # will be created for all accounts within the organization. When set to false, the membership will
        # only be created for specified accounts. This parameter is optional. If not specified, the default
        # value is false. If set to true : The membership will automatically include all existing and future
        # accounts in the Amazon Web Services Organization. If set to false : The membership will only apply
        # to explicitly specified accounts.
        @[JSON::Field(key: "coverEntireOrganization")]
        getter cover_entire_organization : Bool?

        # Optional element to enable the monitoring and investigation opt-in features for the service.
        @[JSON::Field(key: "optInFeatures")]
        getter opt_in_features : Array(Types::OptInFeature)?

        # Optional element for customer configured tags.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @incident_response_team : Array(Types::IncidentResponder),
          @membership_name : String,
          @client_token : String? = nil,
          @cover_entire_organization : Bool? = nil,
          @opt_in_features : Array(Types::OptInFeature)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateMembershipResponse
        include JSON::Serializable

        # Response element for CreateMembership providing the newly created membership ID.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        def initialize(
          @membership_id : String
        )
        end
      end

      struct GetCaseAttachmentDownloadUrlRequest
        include JSON::Serializable

        # Required element for GetCaseAttachmentDownloadUrl to identify the attachment ID for downloading an
        # attachment.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        # Required element for GetCaseAttachmentDownloadUrl to identify the case ID for downloading an
        # attachment from.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @attachment_id : String,
          @case_id : String
        )
        end
      end

      struct GetCaseAttachmentDownloadUrlResponse
        include JSON::Serializable

        # Response element providing the Amazon S3 presigned URL to download an attachment.
        @[JSON::Field(key: "attachmentPresignedUrl")]
        getter attachment_presigned_url : String

        def initialize(
          @attachment_presigned_url : String
        )
        end
      end

      struct GetCaseAttachmentUploadUrlRequest
        include JSON::Serializable

        # Required element for GetCaseAttachmentUploadUrl to identify the case ID for uploading an attachment.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Required element for GetCaseAttachmentUploadUrl to identify the size of the file attachment.
        @[JSON::Field(key: "contentLength")]
        getter content_length : Int64

        # Required element for GetCaseAttachmentUploadUrl to identify the file name of the attachment to
        # upload.
        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The clientToken field is an idempotency key used to ensure that repeated attempts for a single
        # action will be ignored by the server during retries. A caller supplied unique ID (typically a UUID)
        # should be provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @case_id : String,
          @content_length : Int64,
          @file_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct GetCaseAttachmentUploadUrlResponse
        include JSON::Serializable

        # Response element providing the Amazon S3 presigned URL to upload the attachment.
        @[JSON::Field(key: "attachmentPresignedUrl")]
        getter attachment_presigned_url : String

        def initialize(
          @attachment_presigned_url : String
        )
        end
      end

      struct GetCaseRequest
        include JSON::Serializable

        # Required element for GetCase to identify the requested case ID.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        def initialize(
          @case_id : String
        )
        end
      end

      struct GetCaseResponse
        include JSON::Serializable

        # Response element for GetCase that provides the actual incident start date as identified by data
        # analysis during the investigation.
        @[JSON::Field(key: "actualIncidentStartDate")]
        getter actual_incident_start_date : Time?

        # Response element for GetCase that provides the case ARN
        @[JSON::Field(key: "caseArn")]
        getter case_arn : String?

        # Response element for GetCase that provides a list of current case attachments.
        @[JSON::Field(key: "caseAttachments")]
        getter case_attachments : Array(Types::CaseAttachmentAttributes)?

        # Case response metadata
        @[JSON::Field(key: "caseMetadata")]
        getter case_metadata : Array(Types::CaseMetadataEntry)?

        # Response element for GetCase that provides the case status. Options for statuses include Submitted |
        # Detection and Analysis | Eradication, Containment and Recovery | Post-Incident Activities | Closed
        @[JSON::Field(key: "caseStatus")]
        getter case_status : String?

        # Response element for GetCase that provides the date a specified case was closed.
        @[JSON::Field(key: "closedDate")]
        getter closed_date : Time?

        # Response element for GetCase that provides the summary code for why a case was closed.
        @[JSON::Field(key: "closureCode")]
        getter closure_code : String?

        # Response element for GetCase that provides the date the case was created.
        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # Response element for GetCase that provides contents of the case description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Response element for GetCase that provides the engagement type. Options for engagement type include
        # Active Security Event | Investigations
        @[JSON::Field(key: "engagementType")]
        getter engagement_type : String?

        # Response element for GetCase that provides a list of impacted accounts.
        @[JSON::Field(key: "impactedAccounts")]
        getter impacted_accounts : Array(String)?

        # Response element for GetCase that provides the impacted regions.
        @[JSON::Field(key: "impactedAwsRegions")]
        getter impacted_aws_regions : Array(Types::ImpactedAwsRegion)?

        # Response element for GetCase that provides a list of impacted services.
        @[JSON::Field(key: "impactedServices")]
        getter impacted_services : Array(String)?

        # Response element for GetCase that provides the date a case was last modified.
        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # Response element for GetCase that identifies the case is waiting on customer input.
        @[JSON::Field(key: "pendingAction")]
        getter pending_action : String?

        # Response element for GetCase that provides the customer provided incident start date.
        @[JSON::Field(key: "reportedIncidentStartDate")]
        getter reported_incident_start_date : Time?

        # Response element for GetCase that provides the current resolver types.
        @[JSON::Field(key: "resolverType")]
        getter resolver_type : String?

        # Response element for GetCase that provides a list of suspicious IP addresses associated with
        # unauthorized activity.
        @[JSON::Field(key: "threatActorIpAddresses")]
        getter threat_actor_ip_addresses : Array(Types::ThreatActorIp)?

        # Response element for GetCase that provides the case title.
        @[JSON::Field(key: "title")]
        getter title : String?

        # Response element for GetCase that provides a list of Watchers added to the case.
        @[JSON::Field(key: "watchers")]
        getter watchers : Array(Types::Watcher)?

        def initialize(
          @actual_incident_start_date : Time? = nil,
          @case_arn : String? = nil,
          @case_attachments : Array(Types::CaseAttachmentAttributes)? = nil,
          @case_metadata : Array(Types::CaseMetadataEntry)? = nil,
          @case_status : String? = nil,
          @closed_date : Time? = nil,
          @closure_code : String? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @engagement_type : String? = nil,
          @impacted_accounts : Array(String)? = nil,
          @impacted_aws_regions : Array(Types::ImpactedAwsRegion)? = nil,
          @impacted_services : Array(String)? = nil,
          @last_updated_date : Time? = nil,
          @pending_action : String? = nil,
          @reported_incident_start_date : Time? = nil,
          @resolver_type : String? = nil,
          @threat_actor_ip_addresses : Array(Types::ThreatActorIp)? = nil,
          @title : String? = nil,
          @watchers : Array(Types::Watcher)? = nil
        )
        end
      end

      struct GetMembershipAccountDetailError
        include JSON::Serializable

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        @[JSON::Field(key: "error")]
        getter error : String

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @account_id : String,
          @error : String,
          @message : String
        )
        end
      end

      struct GetMembershipAccountDetailItem
        include JSON::Serializable

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        @[JSON::Field(key: "relationshipType")]
        getter relationship_type : String?

        def initialize(
          @account_id : String? = nil,
          @relationship_status : String? = nil,
          @relationship_type : String? = nil
        )
        end
      end

      struct GetMembershipRequest
        include JSON::Serializable

        # Required element for GetMembership to identify the membership ID to query.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        def initialize(
          @membership_id : String
        )
        end
      end

      struct GetMembershipResponse
        include JSON::Serializable

        # Response element for GetMembership that provides the queried membership ID.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # Response element for GetMembership that provides the account configured to manage the membership.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Response element for GetMembership that provides the configured membership type. Options include
        # Standalone | Organizations .
        @[JSON::Field(key: "customerType")]
        getter customer_type : String?

        # Response element for GetMembership that provides the configured membership incident response team
        # members.
        @[JSON::Field(key: "incidentResponseTeam")]
        getter incident_response_team : Array(Types::IncidentResponder)?

        # The membershipAccountsConfigurations field contains the configuration details for member accounts
        # within the Amazon Web Services Organizations membership structure. This field returns a structure
        # containing information about: Account configurations for member accounts Membership settings and
        # preferences Account-level permissions and roles
        @[JSON::Field(key: "membershipAccountsConfigurations")]
        getter membership_accounts_configurations : Types::MembershipAccountsConfigurations?

        # Response element for GetMembership that provides the configured membership activation timestamp.
        @[JSON::Field(key: "membershipActivationTimestamp")]
        getter membership_activation_timestamp : Time?

        # Response element for GetMembership that provides the membership ARN.
        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String?

        # Response element for GetMembership that provides the configured membership name deactivation
        # timestamp.
        @[JSON::Field(key: "membershipDeactivationTimestamp")]
        getter membership_deactivation_timestamp : Time?

        # Response element for GetMembership that provides the configured membership name.
        @[JSON::Field(key: "membershipName")]
        getter membership_name : String?

        # Response element for GetMembership that provides the current membership status.
        @[JSON::Field(key: "membershipStatus")]
        getter membership_status : String?

        # Response element for GetMembership that provides the number of accounts in the membership.
        @[JSON::Field(key: "numberOfAccountsCovered")]
        getter number_of_accounts_covered : Int64?

        # Response element for GetMembership that provides the if opt-in features have been enabled.
        @[JSON::Field(key: "optInFeatures")]
        getter opt_in_features : Array(Types::OptInFeature)?

        # Response element for GetMembership that provides the region configured to manage the membership.
        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @membership_id : String,
          @account_id : String? = nil,
          @customer_type : String? = nil,
          @incident_response_team : Array(Types::IncidentResponder)? = nil,
          @membership_accounts_configurations : Types::MembershipAccountsConfigurations? = nil,
          @membership_activation_timestamp : Time? = nil,
          @membership_arn : String? = nil,
          @membership_deactivation_timestamp : Time? = nil,
          @membership_name : String? = nil,
          @membership_status : String? = nil,
          @number_of_accounts_covered : Int64? = nil,
          @opt_in_features : Array(Types::OptInFeature)? = nil,
          @region : String? = nil
        )
        end
      end

      struct ImpactedAwsRegion
        include JSON::Serializable

        @[JSON::Field(key: "region")]
        getter region : String

        def initialize(
          @region : String
        )
        end
      end

      struct IncidentResponder
        include JSON::Serializable

        @[JSON::Field(key: "email")]
        getter email : String

        @[JSON::Field(key: "jobTitle")]
        getter job_title : String

        @[JSON::Field(key: "name")]
        getter name : String

        @[JSON::Field(key: "communicationPreferences")]
        getter communication_preferences : Array(String)?

        def initialize(
          @email : String,
          @job_title : String,
          @name : String,
          @communication_preferences : Array(String)? = nil
        )
        end
      end

      struct InternalServerException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds after which to retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct InvalidTokenException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents an investigation action performed within a case. This structure captures the details of
      # an automated or manual investigation, including its status, results, and user feedback.
      struct InvestigationAction
        include JSON::Serializable

        # The type of investigation action being performed. This categorizes the investigation method or
        # approach used in the case.
        @[JSON::Field(key: "actionType")]
        getter action_type : String

        # Detailed investigation results in rich markdown format. This field contains the comprehensive
        # findings, analysis, and conclusions from the investigation.
        @[JSON::Field(key: "content")]
        getter content : String

        # The unique identifier for this investigation action. This ID is used to track and reference the
        # specific investigation throughout its lifecycle.
        @[JSON::Field(key: "investigationId")]
        getter investigation_id : String

        # ISO 8601 timestamp of the most recent status update. This indicates when the investigation was last
        # modified or when its status last changed.
        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time

        # The current execution status of the investigation. This indicates whether the investigation is
        # pending, in progress, completed, or failed.
        @[JSON::Field(key: "status")]
        getter status : String

        # Human-readable summary of the investigation focus. This provides a brief description of what the
        # investigation is examining or analyzing.
        @[JSON::Field(key: "title")]
        getter title : String

        # User feedback for this investigation result. This contains the user's assessment and comments about
        # the quality and usefulness of the investigation findings.
        @[JSON::Field(key: "feedback")]
        getter feedback : Types::InvestigationFeedback?

        def initialize(
          @action_type : String,
          @content : String,
          @investigation_id : String,
          @last_updated : Time,
          @status : String,
          @title : String,
          @feedback : Types::InvestigationFeedback? = nil
        )
        end
      end

      # Represents user feedback for an investigation result. This structure captures the user's evaluation
      # of the investigation's quality, usefulness, and any additional comments.
      struct InvestigationFeedback
        include JSON::Serializable

        # Optional user comments providing additional context about the investigation feedback. This allows
        # users to explain their rating or provide suggestions for improvement.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # ISO 8601 timestamp when the feedback was submitted. This records when the user provided their
        # assessment of the investigation results.
        @[JSON::Field(key: "submittedAt")]
        getter submitted_at : Time?

        # User assessment of the investigation result's quality and helpfulness. This rating indicates how
        # valuable the investigation findings were in addressing the case.
        @[JSON::Field(key: "usefulness")]
        getter usefulness : String?

        def initialize(
          @comment : String? = nil,
          @submitted_at : Time? = nil,
          @usefulness : String? = nil
        )
        end
      end

      struct ListCaseEditsRequest
        include JSON::Serializable

        # Required element used with ListCaseEdits to identify the case to query.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Optional element to identify how many results to obtain. There is a maximum value of 25.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListCaseEdits. When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCaseEditsResponse
        include JSON::Serializable

        # Response element for ListCaseEdits that includes the action, event timestamp, message, and principal
        # for the response.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::CaseEditItem)?

        # An optional string that, if supplied on subsequent calls to ListCaseEdits, allows the API to fetch
        # the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Response element for ListCaseEdits that identifies the total number of edits.
        @[JSON::Field(key: "total")]
        getter total : Int32?

        def initialize(
          @items : Array(Types::CaseEditItem)? = nil,
          @next_token : String? = nil,
          @total : Int32? = nil
        )
        end
      end

      struct ListCasesItem
        include JSON::Serializable

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        @[JSON::Field(key: "caseArn")]
        getter case_arn : String?

        @[JSON::Field(key: "caseStatus")]
        getter case_status : String?

        @[JSON::Field(key: "closedDate")]
        getter closed_date : Time?

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        @[JSON::Field(key: "engagementType")]
        getter engagement_type : String?

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        @[JSON::Field(key: "pendingAction")]
        getter pending_action : String?

        @[JSON::Field(key: "resolverType")]
        getter resolver_type : String?

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @case_id : String,
          @case_arn : String? = nil,
          @case_status : String? = nil,
          @closed_date : Time? = nil,
          @created_date : Time? = nil,
          @engagement_type : String? = nil,
          @last_updated_date : Time? = nil,
          @pending_action : String? = nil,
          @resolver_type : String? = nil,
          @title : String? = nil
        )
        end
      end

      struct ListCasesRequest
        include JSON::Serializable

        # Optional element for ListCases to limit the number of responses.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListCases. When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCasesResponse
        include JSON::Serializable

        # Response element for ListCases that includes caseARN, caseID, caseStatus, closedDate, createdDate,
        # engagementType, lastUpdatedDate, pendingAction, resolverType, and title for each response.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListCasesItem)?

        # An optional string that, if supplied on subsequent calls to ListCases, allows the API to fetch the
        # next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Response element for ListCases providing the total number of responses.
        @[JSON::Field(key: "total")]
        getter total : Int64?

        def initialize(
          @items : Array(Types::ListCasesItem)? = nil,
          @next_token : String? = nil,
          @total : Int64? = nil
        )
        end
      end

      struct ListCommentsItem
        include JSON::Serializable

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        @[JSON::Field(key: "body")]
        getter body : String?

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        @[JSON::Field(key: "creator")]
        getter creator : String?

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        def initialize(
          @comment_id : String,
          @body : String? = nil,
          @created_date : Time? = nil,
          @creator : String? = nil,
          @last_updated_by : String? = nil,
          @last_updated_date : Time? = nil
        )
        end
      end

      struct ListCommentsRequest
        include JSON::Serializable

        # Required element for ListComments to designate the case to query.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Optional element for ListComments to limit the number of responses.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListComments. When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCommentsResponse
        include JSON::Serializable

        # Response element for ListComments providing the body, commentID, createDate, creator, lastUpdatedBy
        # and lastUpdatedDate for each response.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListCommentsItem)?

        # An optional string that, if supplied on subsequent calls to ListComments, allows the API to fetch
        # the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Response element for ListComments identifying the number of responses.
        @[JSON::Field(key: "total")]
        getter total : Int32?

        def initialize(
          @items : Array(Types::ListCommentsItem)? = nil,
          @next_token : String? = nil,
          @total : Int32? = nil
        )
        end
      end

      struct ListInvestigationsRequest
        include JSON::Serializable

        # Investigation performed by an agent for a security incident per caseID
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Investigation performed by an agent for a security incident request, returning max results
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Investigation performed by an agent for a security incident request
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListInvestigationsResponse
        include JSON::Serializable

        # Investigation performed by an agent for a security incid…Unique identifier for the specific
        # investigation&gt;
        @[JSON::Field(key: "investigationActions")]
        getter investigation_actions : Array(Types::InvestigationAction)

        # Investigation performed by an agent for a security incident for next Token
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @investigation_actions : Array(Types::InvestigationAction),
          @next_token : String? = nil
        )
        end
      end

      struct ListMembershipItem
        include JSON::Serializable

        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        @[JSON::Field(key: "membershipArn")]
        getter membership_arn : String?

        @[JSON::Field(key: "membershipStatus")]
        getter membership_status : String?

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @membership_id : String,
          @account_id : String? = nil,
          @membership_arn : String? = nil,
          @membership_status : String? = nil,
          @region : String? = nil
        )
        end
      end

      struct ListMembershipsRequest
        include JSON::Serializable

        # Request element for ListMemberships to limit the number of responses.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListMemberships. When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMembershipsResponse
        include JSON::Serializable

        # Request element for ListMemberships including the accountID, membershipARN, membershipID,
        # membershipStatus, and region for each response.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListMembershipItem)?

        # An optional string that, if supplied on subsequent calls to ListMemberships, allows the API to fetch
        # the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListMembershipItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # Required element for ListTagsForResource to provide the ARN to identify a specific resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # Response element for ListTagsForResource providing content for each configured tag.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # The MembershipAccountsConfigurations structure defines the configuration settings for managing
      # membership accounts withinAmazon Web Services. This structure contains settings that determine how
      # member accounts are configured and managed within your organization, including: Account
      # configuration preferences Membership validation rules Account access settings You can use this
      # structure to define and maintain standardized configurations across multiple member accounts in your
      # organization.
      struct MembershipAccountsConfigurations
        include JSON::Serializable

        # The coverEntireOrganization field is a boolean value that determines whether the membership
        # configuration applies to all accounts within an Amazon Web Services Organization. When set to true ,
        # the configuration will be applied across all accounts in the organization. When set to false , the
        # configuration will only apply to specifically designated accounts under the AWS Organizational Units
        # specificied.
        @[JSON::Field(key: "coverEntireOrganization")]
        getter cover_entire_organization : Bool?

        # A list of organizational unit IDs that follow the pattern ou-[0-9a-z]{4,32}-[a-z0-9]{8,32} . These
        # IDs represent the organizational units within an Amazon Web Services Organizations structure that
        # are covered by the membership. Each organizational unit ID in the list must: Begin with the prefix
        # 'ou-' Contain between 4 and 32 alphanumeric characters in the first segment Contain between 8 and 32
        # alphanumeric characters in the second segment
        @[JSON::Field(key: "organizationalUnits")]
        getter organizational_units : Array(String)?

        def initialize(
          @cover_entire_organization : Bool? = nil,
          @organizational_units : Array(String)? = nil
        )
        end
      end

      # The MembershipAccountsConfigurationsUpdate structure represents the configuration updates for member
      # accounts within an Amazon Web Services organization. This structure is used to modify existing
      # account configurations and settings for members in the organization. When applying updates, ensure
      # all required fields are properly specified to maintain account consistency. Key considerations when
      # using this structure: All configuration changes are validated before being applied Updates are
      # processed asynchronously in the background Configuration changes may take several minutes to
      # propagate across all affected accounts
      struct MembershipAccountsConfigurationsUpdate
        include JSON::Serializable

        # The coverEntireOrganization field is a boolean value that determines whether the membership
        # configuration should be applied across the entire Amazon Web Services Organization. When set to true
        # , the configuration will be applied to all accounts within the organization. When set to false , the
        # configuration will only apply to specifically designated accounts.
        @[JSON::Field(key: "coverEntireOrganization")]
        getter cover_entire_organization : Bool?

        # A list of organizational unit IDs to add to the membership configuration. Each organizational unit
        # ID must match the pattern ou-[0-9a-z]{4,32}-[a-z0-9]{8,32} . The list must contain between 1 and 5
        # organizational unit IDs.
        @[JSON::Field(key: "organizationalUnitsToAdd")]
        getter organizational_units_to_add : Array(String)?

        # A list of organizational unit IDs to remove from the membership configuration. Each organizational
        # unit ID must match the pattern ou-[0-9a-z]{4,32}-[a-z0-9]{8,32} . The list must contain between 1
        # and 5 organizational unit IDs per invocation of the API request.
        @[JSON::Field(key: "organizationalUnitsToRemove")]
        getter organizational_units_to_remove : Array(String)?

        def initialize(
          @cover_entire_organization : Bool? = nil,
          @organizational_units_to_add : Array(String)? = nil,
          @organizational_units_to_remove : Array(String)? = nil
        )
        end
      end

      struct OptInFeature
        include JSON::Serializable

        @[JSON::Field(key: "featureName")]
        getter feature_name : String

        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool

        def initialize(
          @feature_name : String,
          @is_enabled : Bool
        )
        end
      end

      struct ResourceNotFoundException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct SecurityIncidentResponseNotActiveException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct SendFeedbackRequest
        include JSON::Serializable

        # Send feedback based on request caseID
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Send feedback based on request result ID
        @[JSON::Field(key: "resultId")]
        getter result_id : String

        # Required enum value indicating user assessment of result q.....
        @[JSON::Field(key: "usefulness")]
        getter usefulness : String

        # Send feedback based on request comments
        @[JSON::Field(key: "comment")]
        getter comment : String?

        def initialize(
          @case_id : String,
          @result_id : String,
          @usefulness : String,
          @comment : String? = nil
        )
        end
      end

      struct SendFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The code of the quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The ID of the requested resource which lead to the service quota exception.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the requested resource which lead to the service quota exception.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The service code of the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # Required element for TagResource to identify the ARN for the resource to add a tag to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Required element for ListTagsForResource to provide the content for a tag.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct ThreatActorIp
        include JSON::Serializable

        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String

        @[JSON::Field(key: "userAgent")]
        getter user_agent : String?

        def initialize(
          @ip_address : String,
          @user_agent : String? = nil
        )
        end
      end

      struct ThrottlingException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The quota code of the exception.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds after which to retry the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The service code of the exception.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # Required element for UnTagResource to identify the ARN for the resource to remove a tag from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Required element for UnTagResource to identify tag to remove.
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

        def initialize
        end
      end

      struct UpdateCaseCommentRequest
        include JSON::Serializable

        # Required element for UpdateCaseComment to identify the content for the comment to be updated.
        @[JSON::Field(key: "body")]
        getter body : String

        # Required element for UpdateCaseComment to identify the case ID containing the comment to be updated.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Required element for UpdateCaseComment to identify the case ID to be updated.
        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        def initialize(
          @body : String,
          @case_id : String,
          @comment_id : String
        )
        end
      end

      struct UpdateCaseCommentResponse
        include JSON::Serializable

        # Response element for UpdateCaseComment providing the updated comment ID.
        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        # Response element for UpdateCaseComment providing the updated comment content.
        @[JSON::Field(key: "body")]
        getter body : String?

        def initialize(
          @comment_id : String,
          @body : String? = nil
        )
        end
      end

      struct UpdateCaseRequest
        include JSON::Serializable

        # Required element for UpdateCase to identify the case ID for updates.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Optional element for UpdateCase to provide content for the incident start date field.
        @[JSON::Field(key: "actualIncidentStartDate")]
        getter actual_incident_start_date : Time?

        # Update the case request with case metadata
        @[JSON::Field(key: "caseMetadata")]
        getter case_metadata : Array(Types::CaseMetadataEntry)?

        # Optional element for UpdateCase to provide content for the description field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Optional element for UpdateCase to provide content for the engagement type field. Available
        # engagement types include Security Incident | Investigation .
        @[JSON::Field(key: "engagementType")]
        getter engagement_type : String?

        # Optional element for UpdateCase to provide content to add accounts impacted. AWS account ID's may
        # appear less than 12 characters and need to be zero-prepended. An example would be 123123123 which is
        # nine digits, and with zero-prepend would be 000123123123 . Not zero-prepending to 12 digits could
        # result in errors.
        @[JSON::Field(key: "impactedAccountsToAdd")]
        getter impacted_accounts_to_add : Array(String)?

        # Optional element for UpdateCase to provide content to add accounts impacted. AWS account ID's may
        # appear less than 12 characters and need to be zero-prepended. An example would be 123123123 which is
        # nine digits, and with zero-prepend would be 000123123123 . Not zero-prepending to 12 digits could
        # result in errors.
        @[JSON::Field(key: "impactedAccountsToDelete")]
        getter impacted_accounts_to_delete : Array(String)?

        # Optional element for UpdateCase to provide content to add regions impacted.
        @[JSON::Field(key: "impactedAwsRegionsToAdd")]
        getter impacted_aws_regions_to_add : Array(Types::ImpactedAwsRegion)?

        # Optional element for UpdateCase to provide content to remove regions impacted.
        @[JSON::Field(key: "impactedAwsRegionsToDelete")]
        getter impacted_aws_regions_to_delete : Array(Types::ImpactedAwsRegion)?

        # Optional element for UpdateCase to provide content to add services impacted.
        @[JSON::Field(key: "impactedServicesToAdd")]
        getter impacted_services_to_add : Array(String)?

        # Optional element for UpdateCase to provide content to remove services impacted.
        @[JSON::Field(key: "impactedServicesToDelete")]
        getter impacted_services_to_delete : Array(String)?

        # Optional element for UpdateCase to provide content for the customer reported incident start date
        # field.
        @[JSON::Field(key: "reportedIncidentStartDate")]
        getter reported_incident_start_date : Time?

        # Optional element for UpdateCase to provide content to add additional suspicious IP addresses related
        # to a case.
        @[JSON::Field(key: "threatActorIpAddressesToAdd")]
        getter threat_actor_ip_addresses_to_add : Array(Types::ThreatActorIp)?

        # Optional element for UpdateCase to provide content to remove suspicious IP addresses from a case.
        @[JSON::Field(key: "threatActorIpAddressesToDelete")]
        getter threat_actor_ip_addresses_to_delete : Array(Types::ThreatActorIp)?

        # Optional element for UpdateCase to provide content for the title field.
        @[JSON::Field(key: "title")]
        getter title : String?

        # Optional element for UpdateCase to provide content to add additional watchers to a case.
        @[JSON::Field(key: "watchersToAdd")]
        getter watchers_to_add : Array(Types::Watcher)?

        # Optional element for UpdateCase to provide content to remove existing watchers from a case.
        @[JSON::Field(key: "watchersToDelete")]
        getter watchers_to_delete : Array(Types::Watcher)?

        def initialize(
          @case_id : String,
          @actual_incident_start_date : Time? = nil,
          @case_metadata : Array(Types::CaseMetadataEntry)? = nil,
          @description : String? = nil,
          @engagement_type : String? = nil,
          @impacted_accounts_to_add : Array(String)? = nil,
          @impacted_accounts_to_delete : Array(String)? = nil,
          @impacted_aws_regions_to_add : Array(Types::ImpactedAwsRegion)? = nil,
          @impacted_aws_regions_to_delete : Array(Types::ImpactedAwsRegion)? = nil,
          @impacted_services_to_add : Array(String)? = nil,
          @impacted_services_to_delete : Array(String)? = nil,
          @reported_incident_start_date : Time? = nil,
          @threat_actor_ip_addresses_to_add : Array(Types::ThreatActorIp)? = nil,
          @threat_actor_ip_addresses_to_delete : Array(Types::ThreatActorIp)? = nil,
          @title : String? = nil,
          @watchers_to_add : Array(Types::Watcher)? = nil,
          @watchers_to_delete : Array(Types::Watcher)? = nil
        )
        end
      end

      struct UpdateCaseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateCaseStatusRequest
        include JSON::Serializable

        # Required element for UpdateCaseStatus to identify the case to update.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Required element for UpdateCaseStatus to identify the status for a case. Options include Submitted |
        # Detection and Analysis | Containment, Eradication and Recovery | Post-incident Activities .
        @[JSON::Field(key: "caseStatus")]
        getter case_status : String

        def initialize(
          @case_id : String,
          @case_status : String
        )
        end
      end

      struct UpdateCaseStatusResponse
        include JSON::Serializable

        # Response element for UpdateCaseStatus showing the newly configured status.
        @[JSON::Field(key: "caseStatus")]
        getter case_status : String?

        def initialize(
          @case_status : String? = nil
        )
        end
      end

      struct UpdateMembershipRequest
        include JSON::Serializable

        # Required element for UpdateMembership to identify the membership to update.
        @[JSON::Field(key: "membershipId")]
        getter membership_id : String

        # Optional element for UpdateMembership to update the membership name.
        @[JSON::Field(key: "incidentResponseTeam")]
        getter incident_response_team : Array(Types::IncidentResponder)?

        # The membershipAccountsConfigurationsUpdate field in the UpdateMembershipRequest structure allows you
        # to update the configuration settings for accounts within a membership. This field is optional and
        # contains a structure of type MembershipAccountsConfigurationsUpdate that specifies the updated
        # account configurations for the membership.
        @[JSON::Field(key: "membershipAccountsConfigurationsUpdate")]
        getter membership_accounts_configurations_update : Types::MembershipAccountsConfigurationsUpdate?

        # Optional element for UpdateMembership to update the membership name.
        @[JSON::Field(key: "membershipName")]
        getter membership_name : String?

        # Optional element for UpdateMembership to enable or disable opt-in features for the service.
        @[JSON::Field(key: "optInFeatures")]
        getter opt_in_features : Array(Types::OptInFeature)?

        # The undoMembershipCancellation parameter is a boolean flag that indicates whether to reverse a
        # previously requested membership cancellation. When set to true, this will revoke the cancellation
        # request and maintain the membership status. This parameter is optional and can be used in scenarios
        # where you need to restore a membership that was marked for cancellation but hasn't been fully
        # terminated yet. If set to true , the cancellation request will be revoked If set to false the
        # service will throw a ValidationException.
        @[JSON::Field(key: "undoMembershipCancellation")]
        getter undo_membership_cancellation : Bool?

        def initialize(
          @membership_id : String,
          @incident_response_team : Array(Types::IncidentResponder)? = nil,
          @membership_accounts_configurations_update : Types::MembershipAccountsConfigurationsUpdate? = nil,
          @membership_name : String? = nil,
          @opt_in_features : Array(Types::OptInFeature)? = nil,
          @undo_membership_cancellation : Bool? = nil
        )
        end
      end

      struct UpdateMembershipResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateResolverTypeRequest
        include JSON::Serializable

        # Required element for UpdateResolverType to identify the case to update.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Required element for UpdateResolverType to identify the new resolver.
        @[JSON::Field(key: "resolverType")]
        getter resolver_type : String

        def initialize(
          @case_id : String,
          @resolver_type : String
        )
        end
      end

      struct UpdateResolverTypeResponse
        include JSON::Serializable

        # Response element for UpdateResolver identifying the case ID being updated.
        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # Response element for UpdateResolver identifying the current status of the case.
        @[JSON::Field(key: "caseStatus")]
        getter case_status : String?

        # Response element for UpdateResolver identifying the current resolver of the case.
        @[JSON::Field(key: "resolverType")]
        getter resolver_type : String?

        def initialize(
          @case_id : String,
          @case_status : String? = nil,
          @resolver_type : String? = nil
        )
        end
      end

      struct ValidationException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the exception.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The fields which lead to the exception.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      struct ValidationExceptionField
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      struct Watcher
        include JSON::Serializable

        @[JSON::Field(key: "email")]
        getter email : String

        @[JSON::Field(key: "jobTitle")]
        getter job_title : String?

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @email : String,
          @job_title : String? = nil,
          @name : String? = nil
        )
        end
      end
    end
  end
end
