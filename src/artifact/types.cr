require "json"
require "time"

module Aws
  module Artifact
    module Types

      # User does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Account settings for the customer.

      struct AccountSettings
        include JSON::Serializable

        # Notification subscription status of the customer.

        @[JSON::Field(key: "notificationSubscriptionStatus")]
        getter notification_subscription_status : String?

        def initialize(
          @notification_subscription_status : String? = nil
        )
        end
      end

      # Request to create/modify content would result in a conflict.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the affected resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the affected resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Summary for customer-agreement resource.

      struct CustomerAgreementSummary
        include JSON::Serializable

        # Terms required to accept the agreement resource.

        @[JSON::Field(key: "acceptanceTerms")]
        getter acceptance_terms : Array(String)?

        # ARN of the agreement resource the customer-agreement resource represents.

        @[JSON::Field(key: "agreementArn")]
        getter agreement_arn : String?

        # ARN of the customer-agreement resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # AWS account Id that owns the resource.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Description of the resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Timestamp indicating when the agreement was terminated.

        @[JSON::Field(key: "effectiveEnd")]
        getter effective_end : Time?

        # Timestamp indicating when the agreement became effective.

        @[JSON::Field(key: "effectiveStart")]
        getter effective_start : Time?

        # Identifier of the customer-agreement resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Name of the customer-agreement resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # ARN of the organization that owns the resource.

        @[JSON::Field(key: "organizationArn")]
        getter organization_arn : String?

        # State of the resource.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Terms required to terminate the customer-agreement resource.

        @[JSON::Field(key: "terminateTerms")]
        getter terminate_terms : Array(String)?

        # Type of the customer-agreement resource.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @acceptance_terms : Array(String)? = nil,
          @agreement_arn : String? = nil,
          @arn : String? = nil,
          @aws_account_id : String? = nil,
          @description : String? = nil,
          @effective_end : Time? = nil,
          @effective_start : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @organization_arn : String? = nil,
          @state : String? = nil,
          @terminate_terms : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetAccountSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "accountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end


      struct GetReportMetadataRequest
        include JSON::Serializable

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        # Version for the report resource.

        @[JSON::Field(key: "reportVersion")]
        getter report_version : Int64?

        def initialize(
          @report_id : String,
          @report_version : Int64? = nil
        )
        end
      end


      struct GetReportMetadataResponse
        include JSON::Serializable

        # Report resource detail.

        @[JSON::Field(key: "reportDetails")]
        getter report_details : Types::ReportDetail?

        def initialize(
          @report_details : Types::ReportDetail? = nil
        )
        end
      end


      struct GetReportRequest
        include JSON::Serializable

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        # Unique download token provided by GetTermForReport API.

        @[JSON::Field(key: "termToken")]
        getter term_token : String

        # Version for the report resource.

        @[JSON::Field(key: "reportVersion")]
        getter report_version : Int64?

        def initialize(
          @report_id : String,
          @term_token : String,
          @report_version : Int64? = nil
        )
        end
      end


      struct GetReportResponse
        include JSON::Serializable

        # Presigned S3 url to access the report content.

        @[JSON::Field(key: "documentPresignedUrl")]
        getter document_presigned_url : String?

        def initialize(
          @document_presigned_url : String? = nil
        )
        end
      end


      struct GetTermForReportRequest
        include JSON::Serializable

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        # Version for the report resource.

        @[JSON::Field(key: "reportVersion")]
        getter report_version : Int64?

        def initialize(
          @report_id : String,
          @report_version : Int64? = nil
        )
        end
      end


      struct GetTermForReportResponse
        include JSON::Serializable

        # Presigned S3 url to access the term content.

        @[JSON::Field(key: "documentPresignedUrl")]
        getter document_presigned_url : String?

        # Unique token representing this request event.

        @[JSON::Field(key: "termToken")]
        getter term_token : String?

        def initialize(
          @document_presigned_url : String? = nil,
          @term_token : String? = nil
        )
        end
      end

      # An unknown server exception has occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Number of seconds in which the caller can retry the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListCustomerAgreementsRequest
        include JSON::Serializable

        # Maximum number of resources to return in the paginated response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomerAgreementsResponse
        include JSON::Serializable

        # List of customer-agreement resources.

        @[JSON::Field(key: "customerAgreements")]
        getter customer_agreements : Array(Types::CustomerAgreementSummary)

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @customer_agreements : Array(Types::CustomerAgreementSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListReportVersionsRequest
        include JSON::Serializable

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        # Maximum number of resources to return in the paginated response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @report_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReportVersionsResponse
        include JSON::Serializable

        # List of report resources.

        @[JSON::Field(key: "reports")]
        getter reports : Array(Types::ReportSummary)

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reports : Array(Types::ReportSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListReportsRequest
        include JSON::Serializable

        # Maximum number of resources to return in the paginated response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReportsResponse
        include JSON::Serializable

        # Pagination token to request the next page of resources.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of report resources.

        @[JSON::Field(key: "reports")]
        getter reports : Array(Types::ReportSummary)?

        def initialize(
          @next_token : String? = nil,
          @reports : Array(Types::ReportSummary)? = nil
        )
        end
      end


      struct PutAccountSettingsRequest
        include JSON::Serializable

        # Desired notification subscription status.

        @[JSON::Field(key: "notificationSubscriptionStatus")]
        getter notification_subscription_status : String?

        def initialize(
          @notification_subscription_status : String? = nil
        )
        end
      end


      struct PutAccountSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "accountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end

      # Full detail for report resource metadata.

      struct ReportDetail
        include JSON::Serializable

        # Acceptance type for report.

        @[JSON::Field(key: "acceptanceType")]
        getter acceptance_type : String?

        # ARN for the report resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Category for the report resource.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Associated company name for the report resource.

        @[JSON::Field(key: "companyName")]
        getter company_name : String?

        # Timestamp indicating when the report resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Timestamp indicating when the report resource was deleted.

        @[JSON::Field(key: "deletedAt")]
        getter deleted_at : Time?

        # Description for the report resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Timestamp indicating when the report resource was last modified.

        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time?

        # Name for the report resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Timestamp indicating the report resource effective end.

        @[JSON::Field(key: "periodEnd")]
        getter period_end : Time?

        # Timestamp indicating the report resource effective start.

        @[JSON::Field(key: "periodStart")]
        getter period_start : Time?

        # Associated product name for the report resource.

        @[JSON::Field(key: "productName")]
        getter product_name : String?

        # Sequence number to enforce optimistic locking.

        @[JSON::Field(key: "sequenceNumber")]
        getter sequence_number : Int64?

        # Series for the report resource.

        @[JSON::Field(key: "series")]
        getter series : String?

        # Current state of the report resource

        @[JSON::Field(key: "state")]
        getter state : String?

        # The message associated with the current upload state.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # Unique resource ARN for term resource.

        @[JSON::Field(key: "termArn")]
        getter term_arn : String?

        # The current state of the document upload.

        @[JSON::Field(key: "uploadState")]
        getter upload_state : String?

        # Version for the report resource.

        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @acceptance_type : String? = nil,
          @arn : String? = nil,
          @category : String? = nil,
          @company_name : String? = nil,
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_at : Time? = nil,
          @name : String? = nil,
          @period_end : Time? = nil,
          @period_start : Time? = nil,
          @product_name : String? = nil,
          @sequence_number : Int64? = nil,
          @series : String? = nil,
          @state : String? = nil,
          @status_message : String? = nil,
          @term_arn : String? = nil,
          @upload_state : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Summary for report resource.

      struct ReportSummary
        include JSON::Serializable

        # Acceptance type for report.

        @[JSON::Field(key: "acceptanceType")]
        getter acceptance_type : String?

        # ARN for the report resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Category for the report resource.

        @[JSON::Field(key: "category")]
        getter category : String?

        # Associated company name for the report resource.

        @[JSON::Field(key: "companyName")]
        getter company_name : String?

        # Description for the report resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Unique resource ID for the report resource.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Name for the report resource.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Timestamp indicating the report resource effective end.

        @[JSON::Field(key: "periodEnd")]
        getter period_end : Time?

        # Timestamp indicating the report resource effective start.

        @[JSON::Field(key: "periodStart")]
        getter period_start : Time?

        # Associated product name for the report resource.

        @[JSON::Field(key: "productName")]
        getter product_name : String?

        # Series for the report resource.

        @[JSON::Field(key: "series")]
        getter series : String?

        # Current state of the report resource.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The message associated with the current upload state.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The current state of the document upload.

        @[JSON::Field(key: "uploadState")]
        getter upload_state : String?

        # Version for the report resource.

        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @acceptance_type : String? = nil,
          @arn : String? = nil,
          @category : String? = nil,
          @company_name : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @period_end : Time? = nil,
          @period_start : Time? = nil,
          @product_name : String? = nil,
          @series : String? = nil,
          @state : String? = nil,
          @status_message : String? = nil,
          @upload_state : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Request references a resource which does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the affected resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the affected resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Code for the affected quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # Identifier of the affected resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the affected resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Code for the affected service.

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

      # Request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Code for the affected quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Number of seconds in which the caller can retry the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # Code for the affected service.

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

      # Request fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Reason the request failed validation.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The field that caused the error, if applicable.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Validation exception message and name.

      struct ValidationExceptionField
        include JSON::Serializable

        # Message describing why the field failed validation.

        @[JSON::Field(key: "message")]
        getter message : String

        # Name of validation exception.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
