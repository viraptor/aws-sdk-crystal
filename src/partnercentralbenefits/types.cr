require "json"
require "time"

module Aws
  module PartnerCentralBenefits
    module Types

      # Thrown when the caller does not have sufficient permissions to perform the requested operation.

      struct AccessDeniedException
        include JSON::Serializable

        # A message describing the access denial.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about access-based benefit fulfillment, such as service permissions or feature
      # access.

      struct AccessDetails
        include JSON::Serializable

        # A description of the access privileges or permissions granted by this benefit.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct AmendBenefitApplicationInput
        include JSON::Serializable

        # A descriptive reason explaining why the benefit application is being amended.

        @[JSON::Field(key: "AmendmentReason")]
        getter amendment_reason : String

        # A list of specific field amendments to apply to the benefit application.

        @[JSON::Field(key: "Amendments")]
        getter amendments : Array(Types::Amendment)

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the amendment request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the benefit application to be amended.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The current revision number of the benefit application to ensure optimistic concurrency control.

        @[JSON::Field(key: "Revision")]
        getter revision : String

        def initialize(
          @amendment_reason : String,
          @amendments : Array(Types::Amendment),
          @catalog : String,
          @client_token : String,
          @identifier : String,
          @revision : String
        )
        end
      end


      struct AmendBenefitApplicationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a specific change to be made to a benefit application field.

      struct Amendment
        include JSON::Serializable

        # The JSON path or field identifier specifying which field in the benefit application to modify.

        @[JSON::Field(key: "FieldPath")]
        getter field_path : String

        # The new value to set for the specified field in the benefit application.

        @[JSON::Field(key: "NewValue")]
        getter new_value : String

        def initialize(
          @field_path : String,
          @new_value : String
        )
        end
      end


      struct AssociateBenefitApplicationResourceInput
        include JSON::Serializable

        # The unique identifier of the benefit application to associate the resource with.

        @[JSON::Field(key: "BenefitApplicationIdentifier")]
        getter benefit_application_identifier : String

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Amazon Resource Name (ARN) of the AWS resource to associate with the benefit application.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @benefit_application_identifier : String,
          @catalog : String,
          @resource_arn : String
        )
        end
      end


      struct AssociateBenefitApplicationResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit application after the resource association.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the benefit application after the resource association.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The updated revision number of the benefit application after the resource association.

        @[JSON::Field(key: "Revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # Represents an AWS resource that is associated with a benefit application for tracking and
      # management.

      struct AssociatedResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the AWS resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The unique identifier of the AWS resource within its service.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # The type of AWS resource (e.g., EC2 instance, S3 bucket, Lambda function).

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_arn : String? = nil,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A summary view of a benefit allocation containing key information for list operations.

      struct BenefitAllocationSummary
        include JSON::Serializable

        # The identifiers of the benefits applicable for this allocation.

        @[JSON::Field(key: "ApplicableBenefitIds")]
        getter applicable_benefit_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the benefit allocation.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the benefit application that resulted in this allocation.

        @[JSON::Field(key: "BenefitApplicationId")]
        getter benefit_application_id : String?

        # The identifier of the benefit that this allocation is based on.

        @[JSON::Field(key: "BenefitId")]
        getter benefit_id : String?

        # The catalog identifier that the benefit allocation belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # The timestamp when the benefit allocation was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp when the benefit allocation expires.

        @[JSON::Field(key: "ExpiresAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The fulfillment types used for this benefit allocation.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The unique identifier of the benefit allocation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit allocation.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the benefit allocation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information explaining the current status of the benefit allocation.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @applicable_benefit_ids : Array(String)? = nil,
          @arn : String? = nil,
          @benefit_application_id : String? = nil,
          @benefit_id : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @expires_at : Time? = nil,
          @fulfillment_types : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # A summary view of a benefit application containing key information for list operations.

      struct BenefitApplicationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # AWS resources that are associated with this benefit application.

        @[JSON::Field(key: "AssociatedResources")]
        getter associated_resources : Array(String)?

        # Additional attributes and metadata associated with the benefit application.

        @[JSON::Field(key: "BenefitApplicationDetails")]
        getter benefit_application_details : Hash(String, String)?

        # The identifier of the benefit being requested in this application.

        @[JSON::Field(key: "BenefitId")]
        getter benefit_id : String?

        # The catalog identifier that the benefit application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # The timestamp when the benefit application was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The fulfillment types requested for this benefit application.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The unique identifier of the benefit application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The AWS partner programs associated with this benefit application.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # The current stage in the benefit application processing workflow..

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # The current processing status of the benefit application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The timestamp when the benefit application was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @associated_resources : Array(String)? = nil,
          @benefit_application_details : Hash(String, String)? = nil,
          @benefit_id : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @fulfillment_types : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @programs : Array(String)? = nil,
          @stage : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A summary view of a benefit containing key information for list operations.

      struct BenefitSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The catalog identifier that the benefit belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # A brief description of the benefit and its purpose.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The available fulfillment types for this benefit.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The unique identifier of the benefit.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The AWS partner programs that this benefit is associated with.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # The current status of the benefit.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @catalog : String? = nil,
          @description : String? = nil,
          @fulfillment_types : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @programs : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct CancelBenefitApplicationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the cancellation request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the benefit application to cancel.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A descriptive reason explaining why the benefit application is being cancelled.

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


      struct CancelBenefitApplicationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Thrown when the request conflicts with the current state of the resource, such as attempting to
      # modify a resource that has been changed by another process.

      struct ConflictException
        include JSON::Serializable

        # A message describing the conflict.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains information about consumable benefit fulfillment, such as usage quotas or service limits.

      struct ConsumableDetails
        include JSON::Serializable

        # The total amount of the consumable benefit that has been allocated.

        @[JSON::Field(key: "AllocatedAmount")]
        getter allocated_amount : Types::MonetaryValue?

        # Detailed information about how the consumable benefit was issued and distributed.

        @[JSON::Field(key: "IssuanceDetails")]
        getter issuance_details : Types::IssuanceDetail?

        # The remaining amount of the consumable benefit that is still available for use.

        @[JSON::Field(key: "RemainingAmount")]
        getter remaining_amount : Types::MonetaryValue?

        # The amount of the consumable benefit that has already been used.

        @[JSON::Field(key: "UtilizedAmount")]
        getter utilized_amount : Types::MonetaryValue?

        def initialize(
          @allocated_amount : Types::MonetaryValue? = nil,
          @issuance_details : Types::IssuanceDetail? = nil,
          @remaining_amount : Types::MonetaryValue? = nil,
          @utilized_amount : Types::MonetaryValue? = nil
        )
        end
      end

      # Represents contact information for a partner representative.

      struct Contact
        include JSON::Serializable

        # The business title or role of the contact person within the organization.

        @[JSON::Field(key: "BusinessTitle")]
        getter business_title : String?

        # The email address of the contact person.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # The first name of the contact person.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The last name of the contact person.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The phone number of the contact person.

        @[JSON::Field(key: "Phone")]
        getter phone : String?

        def initialize(
          @business_title : String? = nil,
          @email : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @phone : String? = nil
        )
        end
      end


      struct CreateBenefitApplicationInput
        include JSON::Serializable

        # The unique identifier of the benefit being requested in this application.

        @[JSON::Field(key: "BenefitIdentifier")]
        getter benefit_identifier : String

        # The catalog identifier that specifies which benefit catalog to create the application in.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the creation request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # AWS resources that are associated with this benefit application.

        @[JSON::Field(key: "AssociatedResources")]
        getter associated_resources : Array(String)?

        # Detailed information and requirements specific to the benefit being requested.

        @[JSON::Field(key: "BenefitApplicationDetails")]
        getter benefit_application_details : Types::Document?

        # A detailed description of the benefit application and its intended use.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Supporting documents and files attached to the benefit application.

        @[JSON::Field(key: "FileDetails")]
        getter file_details : Array(Types::FileInput)?

        # The types of fulfillment requested for this benefit application (e.g., credits, access,
        # disbursement).

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # A human-readable name for the benefit application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Contact information for partner representatives responsible for this benefit application.

        @[JSON::Field(key: "PartnerContacts")]
        getter partner_contacts : Array(Types::Contact)?

        # Key-value pairs to categorize and organize the benefit application.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @benefit_identifier : String,
          @catalog : String,
          @client_token : String,
          @associated_resources : Array(String)? = nil,
          @benefit_application_details : Types::Document? = nil,
          @description : String? = nil,
          @file_details : Array(Types::FileInput)? = nil,
          @fulfillment_types : Array(String)? = nil,
          @name : String? = nil,
          @partner_contacts : Array(Types::Contact)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateBenefitApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created benefit application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier assigned to the newly created benefit application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The initial revision number of the newly created benefit application.

        @[JSON::Field(key: "Revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # Represents an AWS credit code that can be applied to an AWS account for billing purposes.

      struct CreditCode
        include JSON::Serializable

        # The AWS account ID that the credit code is associated with or can be applied to.

        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String

        # The actual credit code string that can be redeemed in the AWS billing console.

        @[JSON::Field(key: "AwsCreditCode")]
        getter aws_credit_code : String

        # The timestamp when the credit code expires and can no longer be redeemed.

        @[JSON::Field(key: "ExpiresAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expires_at : Time

        # The timestamp when the credit code was issued.

        @[JSON::Field(key: "IssuedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter issued_at : Time

        # The current status of the credit code (e.g., active, redeemed, expired).

        @[JSON::Field(key: "Status")]
        getter status : String

        # The monetary value of the credit code.

        @[JSON::Field(key: "Value")]
        getter value : Types::MonetaryValue

        def initialize(
          @aws_account_id : String,
          @aws_credit_code : String,
          @expires_at : Time,
          @issued_at : Time,
          @status : String,
          @value : Types::MonetaryValue
        )
        end
      end

      # Contains information about credit-based benefit fulfillment, including AWS promotional credits.

      struct CreditDetails
        include JSON::Serializable

        # The total amount of credits that have been allocated for this benefit.

        @[JSON::Field(key: "AllocatedAmount")]
        getter allocated_amount : Types::MonetaryValue

        # A list of credit codes that have been generated for this benefit allocation.

        @[JSON::Field(key: "Codes")]
        getter codes : Array(Types::CreditCode)

        # The amount of credits that have actually been issued and are available for use.

        @[JSON::Field(key: "IssuedAmount")]
        getter issued_amount : Types::MonetaryValue

        def initialize(
          @allocated_amount : Types::MonetaryValue,
          @codes : Array(Types::CreditCode),
          @issued_amount : Types::MonetaryValue
        )
        end
      end


      struct DisassociateBenefitApplicationResourceInput
        include JSON::Serializable

        # The unique identifier of the benefit application to disassociate the resource from.

        @[JSON::Field(key: "BenefitApplicationIdentifier")]
        getter benefit_application_identifier : String

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The Amazon Resource Name (ARN) of the AWS resource to disassociate from the benefit application.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @benefit_application_identifier : String,
          @catalog : String,
          @resource_arn : String
        )
        end
      end


      struct DisassociateBenefitApplicationResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit application after the resource disassociation.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the benefit application after the resource disassociation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The updated revision number of the benefit application after the resource disassociation.

        @[JSON::Field(key: "Revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # Contains information about disbursement-based benefit fulfillment, such as direct payments or
      # reimbursements.

      struct DisbursementDetails
        include JSON::Serializable

        # The total amount that has been disbursed for this benefit allocation.

        @[JSON::Field(key: "DisbursedAmount")]
        getter disbursed_amount : Types::MonetaryValue?

        # Detailed information about how the disbursement was issued and processed.

        @[JSON::Field(key: "IssuanceDetails")]
        getter issuance_details : Types::IssuanceDetail?

        def initialize(
          @disbursed_amount : Types::MonetaryValue? = nil,
          @issuance_details : Types::IssuanceDetail? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Represents detailed information about a file attached to a benefit application.

      struct FileDetail
        include JSON::Serializable

        # The URI or location where the file is stored.

        @[JSON::Field(key: "FileURI")]
        getter file_uri : String

        # The business purpose or use case that this file supports in the benefit application.

        @[JSON::Field(key: "BusinessUseCase")]
        getter business_use_case : String?

        # The timestamp when the file was uploaded.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the user who uploaded the file.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The original name of the uploaded file.

        @[JSON::Field(key: "FileName")]
        getter file_name : String?

        # The current processing status of the file (e.g., uploaded, processing, approved, rejected).

        @[JSON::Field(key: "FileStatus")]
        getter file_status : String?

        # The reason for that particulat file status.

        @[JSON::Field(key: "FileStatusReason")]
        getter file_status_reason : String?

        # The type or category of the file (e.g., document, image, spreadsheet).

        @[JSON::Field(key: "FileType")]
        getter file_type : String?

        def initialize(
          @file_uri : String,
          @business_use_case : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @file_name : String? = nil,
          @file_status : String? = nil,
          @file_status_reason : String? = nil,
          @file_type : String? = nil
        )
        end
      end

      # Represents input information for uploading a file to a benefit application.

      struct FileInput
        include JSON::Serializable

        # The URI or location where the file should be stored or has been uploaded.

        @[JSON::Field(key: "FileURI")]
        getter file_uri : String

        # The business purpose or use case that this file supports in the benefit application.

        @[JSON::Field(key: "BusinessUseCase")]
        getter business_use_case : String?

        def initialize(
          @file_uri : String,
          @business_use_case : String? = nil
        )
        end
      end

      # Contains comprehensive information about how a benefit allocation is fulfilled across different
      # fulfillment types.

      struct FulfillmentDetails
        include JSON::Serializable

        # Details about access-based fulfillment, if applicable to this benefit allocation.

        @[JSON::Field(key: "AccessDetails")]
        getter access_details : Types::AccessDetails?

        # Details about consumable-based fulfillment, if applicable to this benefit allocation.

        @[JSON::Field(key: "ConsumableDetails")]
        getter consumable_details : Types::ConsumableDetails?

        # Details about credit-based fulfillment, if applicable to this benefit allocation.

        @[JSON::Field(key: "CreditDetails")]
        getter credit_details : Types::CreditDetails?

        # Details about disbursement-based fulfillment, if applicable to this benefit allocation.

        @[JSON::Field(key: "DisbursementDetails")]
        getter disbursement_details : Types::DisbursementDetails?

        def initialize(
          @access_details : Types::AccessDetails? = nil,
          @consumable_details : Types::ConsumableDetails? = nil,
          @credit_details : Types::CreditDetails? = nil,
          @disbursement_details : Types::DisbursementDetails? = nil
        )
        end
      end


      struct GetBenefitAllocationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog to query.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the benefit allocation to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetBenefitAllocationOutput
        include JSON::Serializable

        # A list of benefit identifiers that this allocation can be applied to.

        @[JSON::Field(key: "ApplicableBenefitIds")]
        getter applicable_benefit_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the benefit allocation.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The identifier of the benefit application that resulted in this allocation.

        @[JSON::Field(key: "BenefitApplicationId")]
        getter benefit_application_id : String?

        # The identifier of the benefit that this allocation is based on.

        @[JSON::Field(key: "BenefitId")]
        getter benefit_id : String?

        # The catalog identifier that the benefit allocation belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # The timestamp when the benefit allocation was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A detailed description of the benefit allocation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp when the benefit allocation expires and is no longer usable.

        @[JSON::Field(key: "ExpiresAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # Detailed information about how the benefit allocation is fulfilled.

        @[JSON::Field(key: "FulfillmentDetail")]
        getter fulfillment_detail : Types::FulfillmentDetails?

        # The fulfillment type used for this benefit allocation.

        @[JSON::Field(key: "FulfillmentType")]
        getter fulfillment_type : String?

        # The unique identifier of the benefit allocation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit allocation.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The timestamp when the benefit allocation becomes active and usable.

        @[JSON::Field(key: "StartsAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter starts_at : Time?

        # The current status of the benefit allocation (e.g., active, expired, consumed).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information explaining the current status of the benefit allocation.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The timestamp when the benefit allocation was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @applicable_benefit_ids : Array(String)? = nil,
          @arn : String? = nil,
          @benefit_application_id : String? = nil,
          @benefit_id : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @expires_at : Time? = nil,
          @fulfillment_detail : Types::FulfillmentDetails? = nil,
          @fulfillment_type : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @starts_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetBenefitApplicationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog to query.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the benefit application to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetBenefitApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # AWS resources that are associated with this benefit application.

        @[JSON::Field(key: "AssociatedResources")]
        getter associated_resources : Array(String)?

        # Detailed information and requirements specific to the benefit being requested.

        @[JSON::Field(key: "BenefitApplicationDetails")]
        getter benefit_application_details : Types::Document?

        # The identifier of the benefit being requested in this application.

        @[JSON::Field(key: "BenefitId")]
        getter benefit_id : String?

        # The catalog identifier that the benefit application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # The timestamp when the benefit application was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A detailed description of the benefit application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Supporting documents and files attached to the benefit application.

        @[JSON::Field(key: "FileDetails")]
        getter file_details : Array(Types::FileDetail)?

        # The fulfillment types requested for this benefit application.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The unique identifier of the benefit application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Contact information for partner representatives responsible for this benefit application.

        @[JSON::Field(key: "PartnerContacts")]
        getter partner_contacts : Array(Types::Contact)?

        # The AWS partner programs associated with this benefit application.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # The current revision number of the benefit application.

        @[JSON::Field(key: "Revision")]
        getter revision : String?

        # The current stage in the benefit application processing workflow.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # The current processing status of the benefit application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information explaining the current status of the benefit application.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # A standardized code representing the reason for the current status.

        @[JSON::Field(key: "StatusReasonCode")]
        getter status_reason_code : String?

        # The list of standardized codes representing the reason for the current status.

        @[JSON::Field(key: "StatusReasonCodes")]
        getter status_reason_codes : Array(String)?

        # The timestamp when the benefit application was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @associated_resources : Array(String)? = nil,
          @benefit_application_details : Types::Document? = nil,
          @benefit_id : String? = nil,
          @catalog : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @file_details : Array(Types::FileDetail)? = nil,
          @fulfillment_types : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @partner_contacts : Array(Types::Contact)? = nil,
          @programs : Array(String)? = nil,
          @revision : String? = nil,
          @stage : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @status_reason_code : String? = nil,
          @status_reason_codes : Array(String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetBenefitInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog to query.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the benefit to retrieve.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct GetBenefitOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the benefit.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The schema definition that describes the required fields for requesting this benefit.

        @[JSON::Field(key: "BenefitRequestSchema")]
        getter benefit_request_schema : Types::Document?

        # The catalog identifier that the benefit belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String?

        # A detailed description of the benefit and its purpose.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The available fulfillment types for this benefit (e.g., credits, access, disbursement).

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The unique identifier of the benefit.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The human-readable name of the benefit.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The AWS partner programs that this benefit is associated with.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # The current status of the benefit (e.g., active, inactive, deprecated).

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @benefit_request_schema : Types::Document? = nil,
          @catalog : String? = nil,
          @description : String? = nil,
          @fulfillment_types : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @programs : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # Thrown when an unexpected error occurs on the server side during request processing.

      struct InternalServerException
        include JSON::Serializable

        # A message describing the internal server error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Represents detailed information about a specific issuance of benefit value.

      struct IssuanceDetail
        include JSON::Serializable

        # The monetary amount or value that was issued in this specific issuance.

        @[JSON::Field(key: "IssuanceAmount")]
        getter issuance_amount : Types::MonetaryValue?

        # The unique identifier for this specific issuance.

        @[JSON::Field(key: "IssuanceId")]
        getter issuance_id : String?

        # The timestamp when this specific issuance was processed.

        @[JSON::Field(key: "IssuedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter issued_at : Time?

        def initialize(
          @issuance_amount : Types::MonetaryValue? = nil,
          @issuance_id : String? = nil,
          @issued_at : Time? = nil
        )
        end
      end


      struct ListBenefitAllocationsInput
        include JSON::Serializable

        # The catalog identifier to filter benefit allocations by catalog.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filter benefit allocations by specific benefit application identifiers.

        @[JSON::Field(key: "BenefitApplicationIdentifiers")]
        getter benefit_application_identifiers : Array(String)?

        # Filter benefit allocations by specific benefit identifiers.

        @[JSON::Field(key: "BenefitIdentifiers")]
        getter benefit_identifiers : Array(String)?

        # Filter benefit allocations by specific fulfillment types.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The maximum number of benefit allocations to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token to retrieve the next set of results from a previous request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter benefit allocations by their current status.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @catalog : String,
          @benefit_application_identifiers : Array(String)? = nil,
          @benefit_identifiers : Array(String)? = nil,
          @fulfillment_types : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : Array(String)? = nil
        )
        end
      end


      struct ListBenefitAllocationsOutput
        include JSON::Serializable

        # A list of benefit allocation summaries matching the specified criteria.

        @[JSON::Field(key: "BenefitAllocationSummaries")]
        getter benefit_allocation_summaries : Array(Types::BenefitAllocationSummary)?

        # A pagination token to retrieve the next set of results, if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @benefit_allocation_summaries : Array(Types::BenefitAllocationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBenefitApplicationsInput
        include JSON::Serializable

        # The catalog identifier to filter benefit applications by catalog.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filter benefit applications by specific AWS resource ARNs.

        @[JSON::Field(key: "AssociatedResourceArns")]
        getter associated_resource_arns : Array(String)?

        # Filter benefit applications by associated AWS resources.

        @[JSON::Field(key: "AssociatedResources")]
        getter associated_resources : Array(Types::AssociatedResource)?

        # Filter benefit applications by specific benefit identifiers.

        @[JSON::Field(key: "BenefitIdentifiers")]
        getter benefit_identifiers : Array(String)?

        # Filter benefit applications by specific fulfillment types.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The maximum number of benefit applications to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token to retrieve the next set of results from a previous request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter benefit applications by specific AWS partner programs.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # Filter benefit applications by their current processing stage.

        @[JSON::Field(key: "Stages")]
        getter stages : Array(String)?

        # Filter benefit applications by their current processing status.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @catalog : String,
          @associated_resource_arns : Array(String)? = nil,
          @associated_resources : Array(Types::AssociatedResource)? = nil,
          @benefit_identifiers : Array(String)? = nil,
          @fulfillment_types : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @programs : Array(String)? = nil,
          @stages : Array(String)? = nil,
          @status : Array(String)? = nil
        )
        end
      end


      struct ListBenefitApplicationsOutput
        include JSON::Serializable

        # A list of benefit application summaries matching the specified criteria.

        @[JSON::Field(key: "BenefitApplicationSummaries")]
        getter benefit_application_summaries : Array(Types::BenefitApplicationSummary)?

        # A pagination token to retrieve the next set of results, if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @benefit_application_summaries : Array(Types::BenefitApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBenefitsInput
        include JSON::Serializable

        # The catalog identifier to filter benefits by catalog.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Filter benefits by specific fulfillment types.

        @[JSON::Field(key: "FulfillmentTypes")]
        getter fulfillment_types : Array(String)?

        # The maximum number of benefits to return in a single response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token to retrieve the next set of results from a previous request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter benefits by specific AWS partner programs.

        @[JSON::Field(key: "Programs")]
        getter programs : Array(String)?

        # Filter benefits by their current status.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        def initialize(
          @catalog : String,
          @fulfillment_types : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @programs : Array(String)? = nil,
          @status : Array(String)? = nil
        )
        end
      end


      struct ListBenefitsOutput
        include JSON::Serializable

        # A list of benefit summaries matching the specified criteria.

        @[JSON::Field(key: "BenefitSummaries")]
        getter benefit_summaries : Array(Types::BenefitSummary)?

        # A pagination token to retrieve the next set of results, if more results are available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @benefit_summaries : Array(Types::BenefitSummary)? = nil,
          @next_token : String? = nil
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

        # A list of key-value pairs representing the tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents a monetary amount with its associated currency.

      struct MonetaryValue
        include JSON::Serializable

        # The numeric amount of the monetary value.

        @[JSON::Field(key: "Amount")]
        getter amount : String

        # The ISO 4217 currency code (e.g., USD, EUR) for the monetary amount.

        @[JSON::Field(key: "CurrencyCode")]
        getter currency_code : String

        def initialize(
          @amount : String,
          @currency_code : String
        )
        end
      end


      struct RecallBenefitApplicationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the benefit application to recall.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A descriptive reason explaining why the benefit application is being recalled.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the recall request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @catalog : String,
          @identifier : String,
          @reason : String,
          @client_token : String? = nil
        )
        end
      end


      struct RecallBenefitApplicationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Thrown when the requested resource cannot be found or does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # A message describing the resource not found error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Thrown when the request would exceed the service quotas or limits for the account.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # A message describing the service quota exceeded error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The code identifying the specific quota that would be exceeded.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The identifier of the resource that would exceed the quota.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource that would exceed the quota.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct SubmitBenefitApplicationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The unique identifier of the benefit application to submit.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @catalog : String,
          @identifier : String
        )
        end
      end


      struct SubmitBenefitApplicationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a key-value pair used for categorizing and organizing AWS resources.

      struct Tag
        include JSON::Serializable

        # The tag key, which acts as a category or label for the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag value, which provides additional information or context for the tag key.

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

        # The Amazon Resource Name (ARN) of the resource to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of key-value pairs to add as tags to the resource.

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

      # Thrown when the request rate exceeds the allowed limits and the request is being throttled.

      struct ThrottlingException
        include JSON::Serializable

        # A message describing the throttling error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource.

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


      struct UpdateBenefitApplicationInput
        include JSON::Serializable

        # The catalog identifier that specifies which benefit catalog the application belongs to.

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # A unique, case-sensitive identifier to ensure idempotent processing of the update request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The unique identifier of the benefit application to update.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The current revision number of the benefit application to ensure optimistic concurrency control.

        @[JSON::Field(key: "Revision")]
        getter revision : String

        # Updated detailed information and requirements specific to the benefit being requested.

        @[JSON::Field(key: "BenefitApplicationDetails")]
        getter benefit_application_details : Types::Document?

        # The updated detailed description of the benefit application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Updated supporting documents and files attached to the benefit application.

        @[JSON::Field(key: "FileDetails")]
        getter file_details : Array(Types::FileInput)?

        # The updated human-readable name for the benefit application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Updated contact information for partner representatives responsible for this benefit application.

        @[JSON::Field(key: "PartnerContacts")]
        getter partner_contacts : Array(Types::Contact)?

        def initialize(
          @catalog : String,
          @client_token : String,
          @identifier : String,
          @revision : String,
          @benefit_application_details : Types::Document? = nil,
          @description : String? = nil,
          @file_details : Array(Types::FileInput)? = nil,
          @name : String? = nil,
          @partner_contacts : Array(Types::Contact)? = nil
        )
        end
      end


      struct UpdateBenefitApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated benefit application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the updated benefit application.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The new revision number of the benefit application after the update.

        @[JSON::Field(key: "Revision")]
        getter revision : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # Thrown when the request contains invalid parameters or fails input validation requirements.

      struct ValidationException
        include JSON::Serializable

        # A message describing the validation error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # A list of fields that failed validation.

        @[JSON::Field(key: "FieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Represents a field-specific validation error with detailed information.

      struct ValidationExceptionField
        include JSON::Serializable

        # A detailed message explaining why the field validation failed.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field that failed validation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # An error code explaining why the field validation failed.

        @[JSON::Field(key: "Code")]
        getter code : String?

        def initialize(
          @message : String,
          @name : String,
          @code : String? = nil
        )
        end
      end
    end
  end
end
