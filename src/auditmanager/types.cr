require "json"
require "time"

module Aws
  module AuditManager
    module Types

      # The wrapper of Amazon Web Services account details, such as account ID or email address.

      struct AWSAccount
        include JSON::Serializable

        # The email address that's associated with the Amazon Web Services account.

        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # The identifier for the Amazon Web Services account.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the Amazon Web Services account.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @email_address : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An Amazon Web Services service such as Amazon S3 or CloudTrail. For an example of how to find an
      # Amazon Web Services service name and how to define it in your assessment scope, see the following:
      # Finding an Amazon Web Services service name to use in your assessment scope Defining an Amazon Web
      # Services service name in your assessment scope

      struct AWSService
        include JSON::Serializable

        # The name of the Amazon Web Services service.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @service_name : String? = nil
        )
        end
      end

      # Your account isn't registered with Audit Manager. Check the delegated administrator setup on the
      # Audit Manager settings page, and try again.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An entity that defines the scope of audit evidence collected by Audit Manager. An Audit Manager
      # assessment is an implementation of an Audit Manager framework.

      struct Assessment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the assessment.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The Amazon Web Services account that's associated with the assessment.

        @[JSON::Field(key: "awsAccount")]
        getter aws_account : Types::AWSAccount?

        # The framework that the assessment was created from.

        @[JSON::Field(key: "framework")]
        getter framework : Types::AssessmentFramework?

        # The metadata for the assessment.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::AssessmentMetadata?

        # The tags that are associated with the assessment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @aws_account : Types::AWSAccount? = nil,
          @framework : Types::AssessmentFramework? = nil,
          @metadata : Types::AssessmentMetadata? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The control entity that represents a standard control or a custom control in an Audit Manager
      # assessment.

      struct AssessmentControl
        include JSON::Serializable

        # The amount of evidence in the assessment report.

        @[JSON::Field(key: "assessmentReportEvidenceCount")]
        getter assessment_report_evidence_count : Int32?

        # The list of comments that's attached to the control.

        @[JSON::Field(key: "comments")]
        getter comments : Array(Types::ControlComment)?

        # The description of the control.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The amount of evidence that's collected for the control.

        @[JSON::Field(key: "evidenceCount")]
        getter evidence_count : Int32?

        # The list of data sources for the evidence.

        @[JSON::Field(key: "evidenceSources")]
        getter evidence_sources : Array(String)?

        # The identifier for the control.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the control.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The response of the control.

        @[JSON::Field(key: "response")]
        getter response : String?

        # The status of the control.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_report_evidence_count : Int32? = nil,
          @comments : Array(Types::ControlComment)? = nil,
          @description : String? = nil,
          @evidence_count : Int32? = nil,
          @evidence_sources : Array(String)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @response : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents a set of controls in an Audit Manager assessment.

      struct AssessmentControlSet
        include JSON::Serializable

        # The list of controls that's contained with the control set.

        @[JSON::Field(key: "controls")]
        getter controls : Array(Types::AssessmentControl)?

        # The delegations that are associated with the control set.

        @[JSON::Field(key: "delegations")]
        getter delegations : Array(Types::Delegation)?

        # The description for the control set.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the control set in the assessment. This is the control set name in a plain string
        # format.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The total number of evidence objects that are uploaded manually to the control set.

        @[JSON::Field(key: "manualEvidenceCount")]
        getter manual_evidence_count : Int32?

        # The roles that are associated with the control set.

        @[JSON::Field(key: "roles")]
        getter roles : Array(Types::Role)?

        # The current status of the control set.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The total number of evidence objects that are retrieved automatically for the control set.

        @[JSON::Field(key: "systemEvidenceCount")]
        getter system_evidence_count : Int32?

        def initialize(
          @controls : Array(Types::AssessmentControl)? = nil,
          @delegations : Array(Types::Delegation)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @manual_evidence_count : Int32? = nil,
          @roles : Array(Types::Role)? = nil,
          @status : String? = nil,
          @system_evidence_count : Int32? = nil
        )
        end
      end

      # The folder where Audit Manager stores evidence for an assessment.

      struct AssessmentEvidenceFolder
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The total count of evidence that's included in the assessment report.

        @[JSON::Field(key: "assessmentReportSelectionCount")]
        getter assessment_report_selection_count : Int32?

        # The name of the user who created the evidence folder.

        @[JSON::Field(key: "author")]
        getter author : String?

        # The unique identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String?

        # The name of the control.

        @[JSON::Field(key: "controlName")]
        getter control_name : String?

        # The identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String?

        # The Amazon Web Services service that the evidence was collected from.

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The date when the first evidence was added to the evidence folder.

        @[JSON::Field(key: "date")]
        getter date : Time?

        # The total number of Amazon Web Services resources that were assessed to generate the evidence.

        @[JSON::Field(key: "evidenceAwsServiceSourceCount")]
        getter evidence_aws_service_source_count : Int32?

        # The number of evidence that falls under the compliance check category. This evidence is collected
        # from Config or Security Hub.

        @[JSON::Field(key: "evidenceByTypeComplianceCheckCount")]
        getter evidence_by_type_compliance_check_count : Int32?

        # The total number of issues that were reported directly from Security Hub, Config, or both.

        @[JSON::Field(key: "evidenceByTypeComplianceCheckIssuesCount")]
        getter evidence_by_type_compliance_check_issues_count : Int32?

        # The number of evidence that falls under the configuration data category. This evidence is collected
        # from configuration snapshots of other Amazon Web Services services such as Amazon EC2, Amazon S3, or
        # IAM.

        @[JSON::Field(key: "evidenceByTypeConfigurationDataCount")]
        getter evidence_by_type_configuration_data_count : Int32?

        # The number of evidence that falls under the manual category. This evidence is imported manually.

        @[JSON::Field(key: "evidenceByTypeManualCount")]
        getter evidence_by_type_manual_count : Int32?

        # The number of evidence that falls under the user activity category. This evidence is collected from
        # CloudTrail logs.

        @[JSON::Field(key: "evidenceByTypeUserActivityCount")]
        getter evidence_by_type_user_activity_count : Int32?

        # The amount of evidence that's included in the evidence folder.

        @[JSON::Field(key: "evidenceResourcesIncludedCount")]
        getter evidence_resources_included_count : Int32?

        # The identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the evidence folder.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The total amount of evidence in the evidence folder.

        @[JSON::Field(key: "totalEvidence")]
        getter total_evidence : Int32?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_report_selection_count : Int32? = nil,
          @author : String? = nil,
          @control_id : String? = nil,
          @control_name : String? = nil,
          @control_set_id : String? = nil,
          @data_source : String? = nil,
          @date : Time? = nil,
          @evidence_aws_service_source_count : Int32? = nil,
          @evidence_by_type_compliance_check_count : Int32? = nil,
          @evidence_by_type_compliance_check_issues_count : Int32? = nil,
          @evidence_by_type_configuration_data_count : Int32? = nil,
          @evidence_by_type_manual_count : Int32? = nil,
          @evidence_by_type_user_activity_count : Int32? = nil,
          @evidence_resources_included_count : Int32? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @total_evidence : Int32? = nil
        )
        end
      end

      # The file used to structure and automate Audit Manager assessments for a given compliance standard.

      struct AssessmentFramework
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the framework.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The control sets that are associated with the framework.

        @[JSON::Field(key: "controlSets")]
        getter control_sets : Array(Types::AssessmentControlSet)?

        # The unique identifier for the framework.

        @[JSON::Field(key: "id")]
        getter id : String?


        @[JSON::Field(key: "metadata")]
        getter metadata : Types::FrameworkMetadata?

        def initialize(
          @arn : String? = nil,
          @control_sets : Array(Types::AssessmentControlSet)? = nil,
          @id : String? = nil,
          @metadata : Types::FrameworkMetadata? = nil
        )
        end
      end

      # The metadata that's associated with a standard framework or a custom framework.

      struct AssessmentFrameworkMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the framework.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The compliance type that the new custom framework supports, such as CIS or HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # The number of control sets that are associated with the framework.

        @[JSON::Field(key: "controlSetsCount")]
        getter control_sets_count : Int32?

        # The number of controls that are associated with the framework.

        @[JSON::Field(key: "controlsCount")]
        getter controls_count : Int32?

        # The time when the framework was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the framework.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the framework.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the framework was most recently updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The logo that's associated with the framework.

        @[JSON::Field(key: "logo")]
        getter logo : String?

        # The name of the framework.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The framework type, such as a standard framework or a custom framework.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @compliance_type : String? = nil,
          @control_sets_count : Int32? = nil,
          @controls_count : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @logo : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents a share request for a custom framework in Audit Manager.

      struct AssessmentFrameworkShareRequest
        include JSON::Serializable

        # An optional comment from the sender about the share request.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The compliance type that the shared custom framework supports, such as CIS or HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # The time when the share request was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The number of custom controls that are part of the shared custom framework.

        @[JSON::Field(key: "customControlsCount")]
        getter custom_controls_count : Int32?

        # The Amazon Web Services account of the recipient.

        @[JSON::Field(key: "destinationAccount")]
        getter destination_account : String?

        # The Amazon Web Services Region of the recipient.

        @[JSON::Field(key: "destinationRegion")]
        getter destination_region : String?

        # The time when the share request expires.

        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Time?

        # The description of the shared custom framework.

        @[JSON::Field(key: "frameworkDescription")]
        getter framework_description : String?

        # The unique identifier for the shared custom framework.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String?

        # The name of the custom framework that the share request is for.

        @[JSON::Field(key: "frameworkName")]
        getter framework_name : String?

        # The unique identifier for the share request.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Specifies when the share request was last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The Amazon Web Services account of the sender.

        @[JSON::Field(key: "sourceAccount")]
        getter source_account : String?

        # The number of standard controls that are part of the shared custom framework.

        @[JSON::Field(key: "standardControlsCount")]
        getter standard_controls_count : Int32?

        # The status of the share request.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @comment : String? = nil,
          @compliance_type : String? = nil,
          @creation_time : Time? = nil,
          @custom_controls_count : Int32? = nil,
          @destination_account : String? = nil,
          @destination_region : String? = nil,
          @expiration_time : Time? = nil,
          @framework_description : String? = nil,
          @framework_id : String? = nil,
          @framework_name : String? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @source_account : String? = nil,
          @standard_controls_count : Int32? = nil,
          @status : String? = nil
        )
        end
      end

      # The metadata that's associated with the specified assessment.

      struct AssessmentMetadata
        include JSON::Serializable

        # The destination that evidence reports are stored in for the assessment.

        @[JSON::Field(key: "assessmentReportsDestination")]
        getter assessment_reports_destination : Types::AssessmentReportsDestination?

        # The name of the compliance standard that's related to the assessment, such as PCI-DSS.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # Specifies when the assessment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The delegations that are associated with the assessment.

        @[JSON::Field(key: "delegations")]
        getter delegations : Array(Types::Delegation)?

        # The description of the assessment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the assessment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time of the most recent update.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The name of the assessment.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The roles that are associated with the assessment.

        @[JSON::Field(key: "roles")]
        getter roles : Array(Types::Role)?

        # The wrapper of Amazon Web Services accounts and services that are in scope for the assessment.

        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope?

        # The overall status of the assessment.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
          @compliance_type : String? = nil,
          @creation_time : Time? = nil,
          @delegations : Array(Types::Delegation)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil,
          @roles : Array(Types::Role)? = nil,
          @scope : Types::Scope? = nil,
          @status : String? = nil
        )
        end
      end

      # A metadata object that's associated with an assessment in Audit Manager.

      struct AssessmentMetadataItem
        include JSON::Serializable

        # The name of the compliance standard that's related to the assessment, such as PCI-DSS.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # Specifies when the assessment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The delegations that are associated with the assessment.

        @[JSON::Field(key: "delegations")]
        getter delegations : Array(Types::Delegation)?

        # The unique identifier for the assessment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time of the most recent update.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The name of the assessment.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The roles that are associated with the assessment.

        @[JSON::Field(key: "roles")]
        getter roles : Array(Types::Role)?

        # The current status of the assessment.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @compliance_type : String? = nil,
          @creation_time : Time? = nil,
          @delegations : Array(Types::Delegation)? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil,
          @roles : Array(Types::Role)? = nil,
          @status : String? = nil
        )
        end
      end

      # A finalized document that's generated from an Audit Manager assessment. These reports summarize the
      # relevant evidence that was collected for your audit, and link to the relevant evidence folders.
      # These evidence folders are named and organized according to the controls that are specified in your
      # assessment.

      struct AssessmentReport
        include JSON::Serializable

        # The identifier for the specified assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The name of the associated assessment.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The name of the user who created the assessment report.

        @[JSON::Field(key: "author")]
        getter author : String?

        # The identifier for the specified Amazon Web Services account.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # Specifies when the assessment report was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the specified assessment report.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the assessment report.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name that's given to the assessment report.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the specified assessment report.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_name : String? = nil,
          @author : String? = nil,
          @aws_account_id : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An error entity for assessment report evidence errors. This is used to provide more meaningful
      # errors than a simple string message.

      struct AssessmentReportEvidenceError
        include JSON::Serializable

        # The error code that was returned.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message that was returned.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The identifier for the evidence.

        @[JSON::Field(key: "evidenceId")]
        getter evidence_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @evidence_id : String? = nil
        )
        end
      end

      # The metadata objects that are associated with the specified assessment report.

      struct AssessmentReportMetadata
        include JSON::Serializable

        # The unique identifier for the associated assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The name of the associated assessment.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The name of the user who created the assessment report.

        @[JSON::Field(key: "author")]
        getter author : String?

        # Specifies when the assessment report was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the assessment report.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the assessment report.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the assessment report.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the assessment report.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_name : String? = nil,
          @author : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The location where Audit Manager saves assessment reports for the given assessment.

      struct AssessmentReportsDestination
        include JSON::Serializable

        # The destination bucket where Audit Manager stores assessment reports.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The destination type, such as Amazon S3.

        @[JSON::Field(key: "destinationType")]
        getter destination_type : String?

        def initialize(
          @destination : String? = nil,
          @destination_type : String? = nil
        )
        end
      end


      struct AssociateAssessmentReportEvidenceFolderRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        def initialize(
          @assessment_id : String,
          @evidence_folder_id : String
        )
        end
      end


      struct AssociateAssessmentReportEvidenceFolderResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct BatchAssociateAssessmentReportEvidenceRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        # The list of evidence identifiers.

        @[JSON::Field(key: "evidenceIds")]
        getter evidence_ids : Array(String)

        def initialize(
          @assessment_id : String,
          @evidence_folder_id : String,
          @evidence_ids : Array(String)
        )
        end
      end


      struct BatchAssociateAssessmentReportEvidenceResponse
        include JSON::Serializable

        # A list of errors that the BatchAssociateAssessmentReportEvidence API returned.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AssessmentReportEvidenceError)?

        # The list of evidence identifiers.

        @[JSON::Field(key: "evidenceIds")]
        getter evidence_ids : Array(String)?

        def initialize(
          @errors : Array(Types::AssessmentReportEvidenceError)? = nil,
          @evidence_ids : Array(String)? = nil
        )
        end
      end

      # An error entity for the BatchCreateDelegationByAssessment API. This is used to provide more
      # meaningful errors than a simple string message.

      struct BatchCreateDelegationByAssessmentError
        include JSON::Serializable

        # The API request to batch create delegations in Audit Manager.

        @[JSON::Field(key: "createDelegationRequest")]
        getter create_delegation_request : Types::CreateDelegationRequest?

        # The error code that the BatchCreateDelegationByAssessment API returned.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message that the BatchCreateDelegationByAssessment API returned.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @create_delegation_request : Types::CreateDelegationRequest? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct BatchCreateDelegationByAssessmentRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The API request to batch create delegations in Audit Manager.

        @[JSON::Field(key: "createDelegationRequests")]
        getter create_delegation_requests : Array(Types::CreateDelegationRequest)

        def initialize(
          @assessment_id : String,
          @create_delegation_requests : Array(Types::CreateDelegationRequest)
        )
        end
      end


      struct BatchCreateDelegationByAssessmentResponse
        include JSON::Serializable

        # The delegations that are associated with the assessment.

        @[JSON::Field(key: "delegations")]
        getter delegations : Array(Types::Delegation)?

        # A list of errors that the BatchCreateDelegationByAssessment API returned.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchCreateDelegationByAssessmentError)?

        def initialize(
          @delegations : Array(Types::Delegation)? = nil,
          @errors : Array(Types::BatchCreateDelegationByAssessmentError)? = nil
        )
        end
      end

      # An error entity for the BatchDeleteDelegationByAssessment API. This is used to provide more
      # meaningful errors than a simple string message.

      struct BatchDeleteDelegationByAssessmentError
        include JSON::Serializable

        # The identifier for the delegation.

        @[JSON::Field(key: "delegationId")]
        getter delegation_id : String?

        # The error code that the BatchDeleteDelegationByAssessment API returned.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message that the BatchDeleteDelegationByAssessment API returned.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @delegation_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct BatchDeleteDelegationByAssessmentRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifiers for the delegations.

        @[JSON::Field(key: "delegationIds")]
        getter delegation_ids : Array(String)

        def initialize(
          @assessment_id : String,
          @delegation_ids : Array(String)
        )
        end
      end


      struct BatchDeleteDelegationByAssessmentResponse
        include JSON::Serializable

        # A list of errors that the BatchDeleteDelegationByAssessment API returned.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteDelegationByAssessmentError)?

        def initialize(
          @errors : Array(Types::BatchDeleteDelegationByAssessmentError)? = nil
        )
        end
      end


      struct BatchDisassociateAssessmentReportEvidenceRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        # The list of evidence identifiers.

        @[JSON::Field(key: "evidenceIds")]
        getter evidence_ids : Array(String)

        def initialize(
          @assessment_id : String,
          @evidence_folder_id : String,
          @evidence_ids : Array(String)
        )
        end
      end


      struct BatchDisassociateAssessmentReportEvidenceResponse
        include JSON::Serializable

        # A list of errors that the BatchDisassociateAssessmentReportEvidence API returned.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AssessmentReportEvidenceError)?

        # The identifier for the evidence.

        @[JSON::Field(key: "evidenceIds")]
        getter evidence_ids : Array(String)?

        def initialize(
          @errors : Array(Types::AssessmentReportEvidenceError)? = nil,
          @evidence_ids : Array(String)? = nil
        )
        end
      end

      # An error entity for the BatchImportEvidenceToAssessmentControl API. This is used to provide more
      # meaningful errors than a simple string message.

      struct BatchImportEvidenceToAssessmentControlError
        include JSON::Serializable

        # The error code that the BatchImportEvidenceToAssessmentControl API returned.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message that the BatchImportEvidenceToAssessmentControl API returned.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Manual evidence that can't be collected automatically by Audit Manager.

        @[JSON::Field(key: "manualEvidence")]
        getter manual_evidence : Types::ManualEvidence?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @manual_evidence : Types::ManualEvidence? = nil
        )
        end
      end


      struct BatchImportEvidenceToAssessmentControlRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        # The identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The list of manual evidence objects.

        @[JSON::Field(key: "manualEvidence")]
        getter manual_evidence : Array(Types::ManualEvidence)

        def initialize(
          @assessment_id : String,
          @control_id : String,
          @control_set_id : String,
          @manual_evidence : Array(Types::ManualEvidence)
        )
        end
      end


      struct BatchImportEvidenceToAssessmentControlResponse
        include JSON::Serializable

        # A list of errors that the BatchImportEvidenceToAssessmentControl API returned.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchImportEvidenceToAssessmentControlError)?

        def initialize(
          @errors : Array(Types::BatchImportEvidenceToAssessmentControlError)? = nil
        )
        end
      end

      # The record of a change within Audit Manager. For example, this could be the status change of an
      # assessment or the delegation of a control set.

      struct ChangeLog
        include JSON::Serializable

        # The action that was performed.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The time when the action was performed and the changelog record was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or role that performed the action.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The name of the object that changed. This could be the name of an assessment, control, or control
        # set.

        @[JSON::Field(key: "objectName")]
        getter object_name : String?

        # The object that was changed, such as an assessment, control, or control set.

        @[JSON::Field(key: "objectType")]
        getter object_type : String?

        def initialize(
          @action : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @object_name : String? = nil,
          @object_type : String? = nil
        )
        end
      end

      # A control in Audit Manager.

      struct Control
        include JSON::Serializable

        # The recommended actions to carry out if the control isn't fulfilled.

        @[JSON::Field(key: "actionPlanInstructions")]
        getter action_plan_instructions : String?

        # The title of the action plan for remediating the control.

        @[JSON::Field(key: "actionPlanTitle")]
        getter action_plan_title : String?

        # The Amazon Resource Name (ARN) of the control.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The data mapping sources for the control.

        @[JSON::Field(key: "controlMappingSources")]
        getter control_mapping_sources : Array(Types::ControlMappingSource)?

        # The data source types that determine where Audit Manager collects evidence from for the control.

        @[JSON::Field(key: "controlSources")]
        getter control_sources : String?

        # The time when the control was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or role that created the control.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the control.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the control.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the control was most recently updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The user or role that most recently updated the control.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The name of the control.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the control. The END_OF_SUPPORT state is applicable to standard controls only. This
        # state indicates that the standard control can still be used to collect evidence, but Audit Manager
        # is no longer updating or maintaining that control.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The tags associated with the control.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The steps that you should follow to determine if the control has been satisfied.

        @[JSON::Field(key: "testingInformation")]
        getter testing_information : String?

        # Specifies whether the control is a standard control or a custom control.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @action_plan_instructions : String? = nil,
          @action_plan_title : String? = nil,
          @arn : String? = nil,
          @control_mapping_sources : Array(Types::ControlMappingSource)? = nil,
          @control_sources : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @testing_information : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A comment that's posted by a user on a control. This includes the author's name, the comment text,
      # and a timestamp.

      struct ControlComment
        include JSON::Serializable

        # The name of the user who authored the comment.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The body text of a control comment.

        @[JSON::Field(key: "commentBody")]
        getter comment_body : String?

        # The time when the comment was posted.

        @[JSON::Field(key: "postedDate")]
        getter posted_date : Time?

        def initialize(
          @author_name : String? = nil,
          @comment_body : String? = nil,
          @posted_date : Time? = nil
        )
        end
      end

      # A summary of the latest analytics data for a specific control domain. Control domain insights are
      # grouped by control domain, and ranked by the highest total count of non-compliant evidence.

      struct ControlDomainInsights
        include JSON::Serializable

        # The number of controls in the control domain that collected non-compliant evidence on the
        # lastUpdated date.

        @[JSON::Field(key: "controlsCountByNoncompliantEvidence")]
        getter controls_count_by_noncompliant_evidence : Int32?

        # A breakdown of the compliance check status for the evidence that’s associated with the control
        # domain.

        @[JSON::Field(key: "evidenceInsights")]
        getter evidence_insights : Types::EvidenceInsights?

        # The unique identifier for the control domain. Audit Manager supports the control domains that are
        # provided by Amazon Web Services Control Catalog. For information about how to find a list of
        # available control domains, see ListDomains in the Amazon Web Services Control Catalog API Reference.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the control domain insights were last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The name of the control domain.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The total number of controls in the control domain.

        @[JSON::Field(key: "totalControlsCount")]
        getter total_controls_count : Int32?

        def initialize(
          @controls_count_by_noncompliant_evidence : Int32? = nil,
          @evidence_insights : Types::EvidenceInsights? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil,
          @total_controls_count : Int32? = nil
        )
        end
      end

      # A summary of the latest analytics data for a specific control in a specific active assessment.
      # Control insights are grouped by control domain, and ranked by the highest total count of
      # non-compliant evidence.

      struct ControlInsightsMetadataByAssessmentItem
        include JSON::Serializable

        # The name of the control set that the assessment control belongs to.

        @[JSON::Field(key: "controlSetName")]
        getter control_set_name : String?

        # A breakdown of the compliance check status for the evidence that’s associated with the assessment
        # control.

        @[JSON::Field(key: "evidenceInsights")]
        getter evidence_insights : Types::EvidenceInsights?

        # The unique identifier for the assessment control.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the assessment control insights were last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The name of the assessment control.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @control_set_name : String? = nil,
          @evidence_insights : Types::EvidenceInsights? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A summary of the latest analytics data for a specific control. This data reflects the total counts
      # for the specified control across all active assessments. Control insights are grouped by control
      # domain, and ranked by the highest total count of non-compliant evidence.

      struct ControlInsightsMetadataItem
        include JSON::Serializable

        # A breakdown of the compliance check status for the evidence that’s associated with the control.

        @[JSON::Field(key: "evidenceInsights")]
        getter evidence_insights : Types::EvidenceInsights?

        # The unique identifier for the control.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the control insights were last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The name of the control.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @evidence_insights : Types::EvidenceInsights? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The data source that determines where Audit Manager collects evidence from for the control.

      struct ControlMappingSource
        include JSON::Serializable

        # The description of the source.

        @[JSON::Field(key: "sourceDescription")]
        getter source_description : String?

        # Specifies how often evidence is collected from the control mapping source.

        @[JSON::Field(key: "sourceFrequency")]
        getter source_frequency : String?

        # The unique identifier for the source.

        @[JSON::Field(key: "sourceId")]
        getter source_id : String?


        @[JSON::Field(key: "sourceKeyword")]
        getter source_keyword : Types::SourceKeyword?

        # The name of the source.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The setup option for the data source. This option reflects if the evidence collection method is
        # automated or manual. If you don’t provide a value for sourceSetUpOption , Audit Manager
        # automatically infers and populates the correct value based on the sourceType that you specify.

        @[JSON::Field(key: "sourceSetUpOption")]
        getter source_set_up_option : String?

        # Specifies which type of data source is used to collect evidence. The source can be an individual
        # data source type, such as AWS_Cloudtrail , AWS_Config , AWS_Security_Hub , AWS_API_Call , or MANUAL
        # . The source can also be a managed grouping of data sources, such as a Core_Control or a
        # Common_Control .

        @[JSON::Field(key: "sourceType")]
        getter source_type : String?

        # The instructions for troubleshooting the control.

        @[JSON::Field(key: "troubleshootingText")]
        getter troubleshooting_text : String?

        def initialize(
          @source_description : String? = nil,
          @source_frequency : String? = nil,
          @source_id : String? = nil,
          @source_keyword : Types::SourceKeyword? = nil,
          @source_name : String? = nil,
          @source_set_up_option : String? = nil,
          @source_type : String? = nil,
          @troubleshooting_text : String? = nil
        )
        end
      end

      # The metadata that's associated with the standard control or custom control.

      struct ControlMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the control.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The data source that determines where Audit Manager collects evidence from for the control.

        @[JSON::Field(key: "controlSources")]
        getter control_sources : String?

        # The time when the control was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The unique identifier for the control.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the control was most recently updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the control.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @control_sources : String? = nil,
          @created_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A set of controls in Audit Manager.

      struct ControlSet
        include JSON::Serializable

        # The list of controls within the control set.

        @[JSON::Field(key: "controls")]
        getter controls : Array(Types::Control)?

        # The identifier of the control set in the assessment. This is the control set name in a plain string
        # format.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the control set.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @controls : Array(Types::Control)? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The control entity attributes that uniquely identify an existing control to be added to a framework
      # in Audit Manager.

      struct CreateAssessmentFrameworkControl
        include JSON::Serializable

        # The unique identifier of the control.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # A controlSet entity that represents a collection of controls in Audit Manager. This doesn't contain
      # the control set ID.

      struct CreateAssessmentFrameworkControlSet
        include JSON::Serializable

        # The name of the control set.

        @[JSON::Field(key: "name")]
        getter name : String

        # The list of controls within the control set. This doesn't contain the control set ID.

        @[JSON::Field(key: "controls")]
        getter controls : Array(Types::CreateAssessmentFrameworkControl)?

        def initialize(
          @name : String,
          @controls : Array(Types::CreateAssessmentFrameworkControl)? = nil
        )
        end
      end


      struct CreateAssessmentFrameworkRequest
        include JSON::Serializable

        # The control sets that are associated with the framework. The Controls object returns a partial
        # response when called through Framework APIs. For a complete Controls object, use GetControl .

        @[JSON::Field(key: "controlSets")]
        getter control_sets : Array(Types::CreateAssessmentFrameworkControlSet)

        # The name of the new custom framework.

        @[JSON::Field(key: "name")]
        getter name : String

        # The compliance type that the new custom framework supports, such as CIS or HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # An optional description for the new custom framework.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags that are associated with the framework.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @control_sets : Array(Types::CreateAssessmentFrameworkControlSet),
          @name : String,
          @compliance_type : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssessmentFrameworkResponse
        include JSON::Serializable

        # The new framework object that the CreateAssessmentFramework API returned.

        @[JSON::Field(key: "framework")]
        getter framework : Types::Framework?

        def initialize(
          @framework : Types::Framework? = nil
        )
        end
      end


      struct CreateAssessmentReportRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The name of the new assessment report.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the assessment report.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A SQL statement that represents an evidence finder query. Provide this parameter when you want to
        # generate an assessment report from the results of an evidence finder search query. When you use this
        # parameter, Audit Manager generates a one-time report using only the evidence from the query output.
        # This report does not include any assessment evidence that was manually added to a report using the
        # console , or associated with a report using the API . To use this parameter, the enablementStatus of
        # evidence finder must be ENABLED . For examples and help resolving queryStatement validation
        # exceptions, see Troubleshooting evidence finder issues in the Audit Manager User Guide.

        @[JSON::Field(key: "queryStatement")]
        getter query_statement : String?

        def initialize(
          @assessment_id : String,
          @name : String,
          @description : String? = nil,
          @query_statement : String? = nil
        )
        end
      end


      struct CreateAssessmentReportResponse
        include JSON::Serializable

        # The new assessment report that the CreateAssessmentReport API returned.

        @[JSON::Field(key: "assessmentReport")]
        getter assessment_report : Types::AssessmentReport?

        def initialize(
          @assessment_report : Types::AssessmentReport? = nil
        )
        end
      end


      struct CreateAssessmentRequest
        include JSON::Serializable

        # The assessment report storage destination for the assessment that's being created.

        @[JSON::Field(key: "assessmentReportsDestination")]
        getter assessment_reports_destination : Types::AssessmentReportsDestination

        # The identifier for the framework that the assessment will be created from.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String

        # The name of the assessment to be created.

        @[JSON::Field(key: "name")]
        getter name : String

        # The list of roles for the assessment.

        @[JSON::Field(key: "roles")]
        getter roles : Array(Types::Role)


        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope

        # The optional description of the assessment to be created.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags that are associated with the assessment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assessment_reports_destination : Types::AssessmentReportsDestination,
          @framework_id : String,
          @name : String,
          @roles : Array(Types::Role),
          @scope : Types::Scope,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateAssessmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "assessment")]
        getter assessment : Types::Assessment?

        def initialize(
          @assessment : Types::Assessment? = nil
        )
        end
      end

      # The mapping attributes that determine the evidence source for a given control, along with related
      # parameters and metadata. This doesn't contain mappingID .

      struct CreateControlMappingSource
        include JSON::Serializable

        # The description of the data source that determines where Audit Manager collects evidence from for
        # the control.

        @[JSON::Field(key: "sourceDescription")]
        getter source_description : String?

        # Specifies how often evidence is collected from the control mapping source.

        @[JSON::Field(key: "sourceFrequency")]
        getter source_frequency : String?


        @[JSON::Field(key: "sourceKeyword")]
        getter source_keyword : Types::SourceKeyword?

        # The name of the control mapping data source.

        @[JSON::Field(key: "sourceName")]
        getter source_name : String?

        # The setup option for the data source. This option reflects if the evidence collection method is
        # automated or manual. If you don’t provide a value for sourceSetUpOption , Audit Manager
        # automatically infers and populates the correct value based on the sourceType that you specify.

        @[JSON::Field(key: "sourceSetUpOption")]
        getter source_set_up_option : String?

        # Specifies which type of data source is used to collect evidence. The source can be an individual
        # data source type, such as AWS_Cloudtrail , AWS_Config , AWS_Security_Hub , AWS_API_Call , or MANUAL
        # . The source can also be a managed grouping of data sources, such as a Core_Control or a
        # Common_Control .

        @[JSON::Field(key: "sourceType")]
        getter source_type : String?

        # The instructions for troubleshooting the control.

        @[JSON::Field(key: "troubleshootingText")]
        getter troubleshooting_text : String?

        def initialize(
          @source_description : String? = nil,
          @source_frequency : String? = nil,
          @source_keyword : Types::SourceKeyword? = nil,
          @source_name : String? = nil,
          @source_set_up_option : String? = nil,
          @source_type : String? = nil,
          @troubleshooting_text : String? = nil
        )
        end
      end


      struct CreateControlRequest
        include JSON::Serializable

        # The data mapping sources for the control.

        @[JSON::Field(key: "controlMappingSources")]
        getter control_mapping_sources : Array(Types::CreateControlMappingSource)

        # The name of the control.

        @[JSON::Field(key: "name")]
        getter name : String

        # The recommended actions to carry out if the control isn't fulfilled.

        @[JSON::Field(key: "actionPlanInstructions")]
        getter action_plan_instructions : String?

        # The title of the action plan for remediating the control.

        @[JSON::Field(key: "actionPlanTitle")]
        getter action_plan_title : String?

        # The description of the control.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags that are associated with the control.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The steps to follow to determine if the control is satisfied.

        @[JSON::Field(key: "testingInformation")]
        getter testing_information : String?

        def initialize(
          @control_mapping_sources : Array(Types::CreateControlMappingSource),
          @name : String,
          @action_plan_instructions : String? = nil,
          @action_plan_title : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil,
          @testing_information : String? = nil
        )
        end
      end


      struct CreateControlResponse
        include JSON::Serializable

        # The new control that the CreateControl API returned.

        @[JSON::Field(key: "control")]
        getter control : Types::Control?

        def initialize(
          @control : Types::Control? = nil
        )
        end
      end

      # A collection of attributes that's used to create a delegation for an assessment in Audit Manager.

      struct CreateDelegationRequest
        include JSON::Serializable

        # A comment that's related to the delegation request.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String?

        # The Amazon Resource Name (ARN) of the IAM role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The type of customer persona. In CreateAssessment , roleType can only be PROCESS_OWNER . In
        # UpdateSettings , roleType can only be PROCESS_OWNER . In BatchCreateDelegationByAssessment ,
        # roleType can only be RESOURCE_OWNER .

        @[JSON::Field(key: "roleType")]
        getter role_type : String?

        def initialize(
          @comment : String? = nil,
          @control_set_id : String? = nil,
          @role_arn : String? = nil,
          @role_type : String? = nil
        )
        end
      end

      # The default s3 bucket where Audit Manager saves the files that you export from evidence finder.

      struct DefaultExportDestination
        include JSON::Serializable

        # The destination bucket where Audit Manager stores exported files.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The destination type, such as Amazon S3.

        @[JSON::Field(key: "destinationType")]
        getter destination_type : String?

        def initialize(
          @destination : String? = nil,
          @destination_type : String? = nil
        )
        end
      end

      # The assignment of a control set to a delegate for review.

      struct Delegation
        include JSON::Serializable

        # The identifier for the assessment that's associated with the delegation.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The name of the assessment that's associated with the delegation.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The comment that's related to the delegation.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The identifier for the control set that's associated with the delegation.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String?

        # The user or role that created the delegation.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # Specifies when the delegation was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The unique identifier for the delegation.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Specifies when the delegation was last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The Amazon Resource Name (ARN) of the IAM role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The type of customer persona. In CreateAssessment , roleType can only be PROCESS_OWNER . In
        # UpdateSettings , roleType can only be PROCESS_OWNER . In BatchCreateDelegationByAssessment ,
        # roleType can only be RESOURCE_OWNER .

        @[JSON::Field(key: "roleType")]
        getter role_type : String?

        # The status of the delegation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_name : String? = nil,
          @comment : String? = nil,
          @control_set_id : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @role_arn : String? = nil,
          @role_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The metadata that's associated with the delegation.

      struct DelegationMetadata
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The name of the associated assessment.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # Specifies the name of the control set that was delegated for review.

        @[JSON::Field(key: "controlSetName")]
        getter control_set_name : String?

        # Specifies when the delegation was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The unique identifier for the delegation.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the IAM role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The current status of the delegation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_name : String? = nil,
          @control_set_name : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @role_arn : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteAssessmentFrameworkRequest
        include JSON::Serializable

        # The identifier for the custom framework.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String

        def initialize(
          @framework_id : String
        )
        end
      end


      struct DeleteAssessmentFrameworkResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssessmentFrameworkShareRequest
        include JSON::Serializable

        # The unique identifier for the share request to be deleted.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # Specifies whether the share request is a sent request or a received request.

        @[JSON::Field(key: "requestType")]
        getter request_type : String

        def initialize(
          @request_id : String,
          @request_type : String
        )
        end
      end


      struct DeleteAssessmentFrameworkShareResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssessmentReportRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the assessment report.

        @[JSON::Field(key: "assessmentReportId")]
        getter assessment_report_id : String

        def initialize(
          @assessment_id : String,
          @assessment_report_id : String
        )
        end
      end


      struct DeleteAssessmentReportResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAssessmentRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end


      struct DeleteAssessmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteControlRequest
        include JSON::Serializable

        # The unique identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        def initialize(
          @control_id : String
        )
        end
      end


      struct DeleteControlResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterAccountResponse
        include JSON::Serializable

        # The registration status of the account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct DeregisterOrganizationAdminAccountRequest
        include JSON::Serializable

        # The identifier for the administrator account.

        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String?

        def initialize(
          @admin_account_id : String? = nil
        )
        end
      end


      struct DeregisterOrganizationAdminAccountResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The deregistration policy for the data that's stored in Audit Manager. You can use this attribute to
      # determine how your data is handled when you deregister Audit Manager . By default, Audit Manager
      # retains evidence data for two years from the time of its creation. Other Audit Manager resources
      # (including assessments, custom controls, and custom frameworks) remain in Audit Manager
      # indefinitely, and are available if you re-register Audit Manager in the future. For more information
      # about data retention, see Data Protection in the Audit Manager User Guide . If you choose to delete
      # all data, this action permanently deletes all evidence data in your account within seven days. It
      # also deletes all of the Audit Manager resources that you created, including assessments, custom
      # controls, and custom frameworks. Your data will not be available if you re-register Audit Manager in
      # the future.

      struct DeregistrationPolicy
        include JSON::Serializable

        # Specifies which Audit Manager data will be deleted when you deregister Audit Manager. If you set the
        # value to ALL , all of your data is deleted within seven days of deregistration. If you set the value
        # to DEFAULT , none of your data is deleted at the time of deregistration. However, keep in mind that
        # the Audit Manager data retention policy still applies. As a result, any evidence data will be
        # deleted two years after its creation date. Your other Audit Manager resources will continue to exist
        # indefinitely.

        @[JSON::Field(key: "deleteResources")]
        getter delete_resources : String?

        def initialize(
          @delete_resources : String? = nil
        )
        end
      end


      struct DisassociateAssessmentReportEvidenceFolderRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        def initialize(
          @assessment_id : String,
          @evidence_folder_id : String
        )
        end
      end


      struct DisassociateAssessmentReportEvidenceFolderResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A record that contains the information needed to demonstrate compliance with the requirements
      # specified by a control. Examples of evidence include change activity invoked by a user, or a system
      # configuration snapshot.

      struct Evidence
        include JSON::Serializable

        # Specifies whether the evidence is included in the assessment report.

        @[JSON::Field(key: "assessmentReportSelection")]
        getter assessment_report_selection : String?

        # The names and values that are used by the evidence event. This includes an attribute name (such as
        # allowUsersToChangePassword ) and value (such as true or false ).

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The identifier for the Amazon Web Services account.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services account that the evidence is collected from, and its organization path.

        @[JSON::Field(key: "awsOrganization")]
        getter aws_organization : String?

        # The evaluation status for automated evidence that falls under the compliance check category. Audit
        # Manager classes evidence as non-compliant if Security Hub reports a Fail result, or if Config
        # reports a Non-compliant result. Audit Manager classes evidence as compliant if Security Hub reports
        # a Pass result, or if Config reports a Compliant result. If a compliance check isn't available or
        # applicable, then no compliance evaluation can be made for that evidence. This is the case if the
        # evidence uses Config or Security Hub as the underlying data source type, but those services aren't
        # enabled. This is also the case if the evidence uses an underlying data source type that doesn't
        # support compliance checks (such as manual evidence, Amazon Web Services API calls, or CloudTrail).

        @[JSON::Field(key: "complianceCheck")]
        getter compliance_check : String?

        # The data source where the evidence was collected from.

        @[JSON::Field(key: "dataSource")]
        getter data_source : String?

        # The name of the evidence event.

        @[JSON::Field(key: "eventName")]
        getter event_name : String?

        # The Amazon Web Services service that the evidence is collected from.

        @[JSON::Field(key: "eventSource")]
        getter event_source : String?

        # The identifier for the Amazon Web Services account.

        @[JSON::Field(key: "evidenceAwsAccountId")]
        getter evidence_aws_account_id : String?

        # The type of automated evidence.

        @[JSON::Field(key: "evidenceByType")]
        getter evidence_by_type : String?

        # The identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String?

        # The unique identifier for the user or role that's associated with the evidence.

        @[JSON::Field(key: "iamId")]
        getter iam_id : String?

        # The identifier for the evidence.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The list of resources that are assessed to generate the evidence.

        @[JSON::Field(key: "resourcesIncluded")]
        getter resources_included : Array(Types::Resource)?

        # The timestamp that represents when the evidence was collected.

        @[JSON::Field(key: "time")]
        getter time : Time?

        def initialize(
          @assessment_report_selection : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @aws_account_id : String? = nil,
          @aws_organization : String? = nil,
          @compliance_check : String? = nil,
          @data_source : String? = nil,
          @event_name : String? = nil,
          @event_source : String? = nil,
          @evidence_aws_account_id : String? = nil,
          @evidence_by_type : String? = nil,
          @evidence_folder_id : String? = nil,
          @iam_id : String? = nil,
          @id : String? = nil,
          @resources_included : Array(Types::Resource)? = nil,
          @time : Time? = nil
        )
        end
      end

      # The settings object that specifies whether evidence finder is enabled. This object also describes
      # the related event data store, and the backfill status for populating the event data store with
      # evidence data.

      struct EvidenceFinderEnablement
        include JSON::Serializable

        # The current status of the evidence data backfill process. The backfill starts after you enable
        # evidence finder. During this task, Audit Manager populates an event data store with your past two
        # years’ worth of evidence data so that your evidence can be queried. NOT_STARTED means that the
        # backfill hasn’t started yet. IN_PROGRESS means that the backfill is in progress. This can take up to
        # 7 days to complete, depending on the amount of evidence data. COMPLETED means that the backfill is
        # complete. All of your past evidence is now queryable.

        @[JSON::Field(key: "backfillStatus")]
        getter backfill_status : String?

        # The current status of the evidence finder feature and the related event data store.
        # ENABLE_IN_PROGRESS means that you requested to enable evidence finder. An event data store is
        # currently being created to support evidence finder queries. ENABLED means that an event data store
        # was successfully created and evidence finder is enabled. We recommend that you wait 7 days until the
        # event data store is backfilled with your past two years’ worth of evidence data. You can use
        # evidence finder in the meantime, but not all data might be available until the backfill is complete.
        # DISABLE_IN_PROGRESS means that you requested to disable evidence finder, and your request is pending
        # the deletion of the event data store. DISABLED means that you have permanently disabled evidence
        # finder and the event data store has been deleted. You can't re-enable evidence finder after this
        # point.

        @[JSON::Field(key: "enablementStatus")]
        getter enablement_status : String?

        # Represents any errors that occurred when enabling or disabling evidence finder.

        @[JSON::Field(key: "error")]
        getter error : String?

        # The Amazon Resource Name (ARN) of the CloudTrail Lake event data store that’s used by evidence
        # finder. The event data store is the lake of evidence data that evidence finder runs queries against.

        @[JSON::Field(key: "eventDataStoreArn")]
        getter event_data_store_arn : String?

        def initialize(
          @backfill_status : String? = nil,
          @enablement_status : String? = nil,
          @error : String? = nil,
          @event_data_store_arn : String? = nil
        )
        end
      end

      # A breakdown of the latest compliance check status for the evidence in your Audit Manager
      # assessments.

      struct EvidenceInsights
        include JSON::Serializable

        # The number of compliance check evidence that Audit Manager classified as compliant. This includes
        # evidence that was collected from Security Hub with a Pass ruling, or collected from Config with a
        # Compliant ruling.

        @[JSON::Field(key: "compliantEvidenceCount")]
        getter compliant_evidence_count : Int32?

        # The number of evidence that a compliance check ruling isn't available for. Evidence is inconclusive
        # when the associated control uses Security Hub or Config as a data source but you didn't enable those
        # services. This is also the case when a control uses a data source that doesn’t support compliance
        # checks (for example, manual evidence, API calls, or CloudTrail). If evidence has a compliance check
        # status of not applicable in the console, it's classified as inconclusive in EvidenceInsights data.

        @[JSON::Field(key: "inconclusiveEvidenceCount")]
        getter inconclusive_evidence_count : Int32?

        # The number of compliance check evidence that Audit Manager classified as non-compliant. This
        # includes evidence that was collected from Security Hub with a Fail ruling, or collected from Config
        # with a Non-compliant ruling.

        @[JSON::Field(key: "noncompliantEvidenceCount")]
        getter noncompliant_evidence_count : Int32?

        def initialize(
          @compliant_evidence_count : Int32? = nil,
          @inconclusive_evidence_count : Int32? = nil,
          @noncompliant_evidence_count : Int32? = nil
        )
        end
      end

      # The file that's used to structure and automate Audit Manager assessments for a given compliance
      # standard.

      struct Framework
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the framework.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The compliance type that the framework supports, such as CIS or HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # The control sets that are associated with the framework. The Controls object returns a partial
        # response when called through Framework APIs. For a complete Controls object, use GetControl .

        @[JSON::Field(key: "controlSets")]
        getter control_sets : Array(Types::ControlSet)?

        # The control data sources where Audit Manager collects evidence from. This API parameter is no longer
        # supported.

        @[JSON::Field(key: "controlSources")]
        getter control_sources : String?

        # The time when the framework was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or role that created the framework.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the framework.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier for the framework.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time when the framework was most recently updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The user or role that most recently updated the framework.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The logo that's associated with the framework.

        @[JSON::Field(key: "logo")]
        getter logo : String?

        # The name of the framework.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The tags that are associated with the framework.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Specifies whether the framework is a standard framework or a custom framework.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @compliance_type : String? = nil,
          @control_sets : Array(Types::ControlSet)? = nil,
          @control_sources : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @logo : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # The metadata of a framework, such as the name, ID, or description.

      struct FrameworkMetadata
        include JSON::Serializable

        # The compliance standard that's associated with the framework. For example, this could be PCI DSS or
        # HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # The description of the framework.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The logo that's associated with the framework.

        @[JSON::Field(key: "logo")]
        getter logo : String?

        # The name of the framework.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @compliance_type : String? = nil,
          @description : String? = nil,
          @logo : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetAccountStatusRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountStatusResponse
        include JSON::Serializable

        # The status of the Amazon Web Services account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct GetAssessmentFrameworkRequest
        include JSON::Serializable

        # The identifier for the framework.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String

        def initialize(
          @framework_id : String
        )
        end
      end


      struct GetAssessmentFrameworkResponse
        include JSON::Serializable

        # The framework that the GetAssessmentFramework API returned. The Controls object returns a partial
        # response when called through Framework APIs. For a complete Controls object, use GetControl .

        @[JSON::Field(key: "framework")]
        getter framework : Types::Framework?

        def initialize(
          @framework : Types::Framework? = nil
        )
        end
      end


      struct GetAssessmentReportUrlRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the assessment report.

        @[JSON::Field(key: "assessmentReportId")]
        getter assessment_report_id : String

        def initialize(
          @assessment_id : String,
          @assessment_report_id : String
        )
        end
      end


      struct GetAssessmentReportUrlResponse
        include JSON::Serializable


        @[JSON::Field(key: "preSignedUrl")]
        getter pre_signed_url : Types::URL?

        def initialize(
          @pre_signed_url : Types::URL? = nil
        )
        end
      end


      struct GetAssessmentRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end


      struct GetAssessmentResponse
        include JSON::Serializable


        @[JSON::Field(key: "assessment")]
        getter assessment : Types::Assessment?


        @[JSON::Field(key: "userRole")]
        getter user_role : Types::Role?

        def initialize(
          @assessment : Types::Assessment? = nil,
          @user_role : Types::Role? = nil
        )
        end
      end


      struct GetChangeLogsRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String?

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String?

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @control_id : String? = nil,
          @control_set_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetChangeLogsResponse
        include JSON::Serializable

        # The list of user activity for the control.

        @[JSON::Field(key: "changeLogs")]
        getter change_logs : Array(Types::ChangeLog)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @change_logs : Array(Types::ChangeLog)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetControlRequest
        include JSON::Serializable

        # The identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        def initialize(
          @control_id : String
        )
        end
      end


      struct GetControlResponse
        include JSON::Serializable

        # The details of the control that the GetControl API returned.

        @[JSON::Field(key: "control")]
        getter control : Types::Control?

        def initialize(
          @control : Types::Control? = nil
        )
        end
      end


      struct GetDelegationsRequest
        include JSON::Serializable

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDelegationsResponse
        include JSON::Serializable

        # The list of delegations that the GetDelegations API returned.

        @[JSON::Field(key: "delegations")]
        getter delegations : Array(Types::DelegationMetadata)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @delegations : Array(Types::DelegationMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceByEvidenceFolderRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The unique identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @control_set_id : String,
          @evidence_folder_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceByEvidenceFolderResponse
        include JSON::Serializable

        # The list of evidence that the GetEvidenceByEvidenceFolder API returned.

        @[JSON::Field(key: "evidence")]
        getter evidence : Array(Types::Evidence)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @evidence : Array(Types::Evidence)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceFileUploadUrlRequest
        include JSON::Serializable

        # The file that you want to upload. For a list of supported file formats, see Supported file types for
        # manual evidence in the Audit Manager User Guide .

        @[JSON::Field(key: "fileName")]
        getter file_name : String

        def initialize(
          @file_name : String
        )
        end
      end


      struct GetEvidenceFileUploadUrlResponse
        include JSON::Serializable

        # The name of the uploaded manual evidence file that the presigned URL was generated for.

        @[JSON::Field(key: "evidenceFileName")]
        getter evidence_file_name : String?

        # The presigned URL that was generated.

        @[JSON::Field(key: "uploadUrl")]
        getter upload_url : String?

        def initialize(
          @evidence_file_name : String? = nil,
          @upload_url : String? = nil
        )
        end
      end


      struct GetEvidenceFolderRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The unique identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        def initialize(
          @assessment_id : String,
          @control_set_id : String,
          @evidence_folder_id : String
        )
        end
      end


      struct GetEvidenceFolderResponse
        include JSON::Serializable

        # The folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolder")]
        getter evidence_folder : Types::AssessmentEvidenceFolder?

        def initialize(
          @evidence_folder : Types::AssessmentEvidenceFolder? = nil
        )
        end
      end


      struct GetEvidenceFoldersByAssessmentControlRequest
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        # The identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @control_id : String,
          @control_set_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceFoldersByAssessmentControlResponse
        include JSON::Serializable

        # The list of evidence folders that the GetEvidenceFoldersByAssessmentControl API returned.

        @[JSON::Field(key: "evidenceFolders")]
        getter evidence_folders : Array(Types::AssessmentEvidenceFolder)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @evidence_folders : Array(Types::AssessmentEvidenceFolder)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceFoldersByAssessmentRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceFoldersByAssessmentResponse
        include JSON::Serializable

        # The list of evidence folders that the GetEvidenceFoldersByAssessment API returned.

        @[JSON::Field(key: "evidenceFolders")]
        getter evidence_folders : Array(Types::AssessmentEvidenceFolder)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @evidence_folders : Array(Types::AssessmentEvidenceFolder)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetEvidenceRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The unique identifier for the folder that the evidence is stored in.

        @[JSON::Field(key: "evidenceFolderId")]
        getter evidence_folder_id : String

        # The unique identifier for the evidence.

        @[JSON::Field(key: "evidenceId")]
        getter evidence_id : String

        def initialize(
          @assessment_id : String,
          @control_set_id : String,
          @evidence_folder_id : String,
          @evidence_id : String
        )
        end
      end


      struct GetEvidenceResponse
        include JSON::Serializable

        # The evidence that the GetEvidence API returned.

        @[JSON::Field(key: "evidence")]
        getter evidence : Types::Evidence?

        def initialize(
          @evidence : Types::Evidence? = nil
        )
        end
      end


      struct GetInsightsByAssessmentRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end


      struct GetInsightsByAssessmentResponse
        include JSON::Serializable

        # The assessment analytics data that the GetInsightsByAssessment API returned.

        @[JSON::Field(key: "insights")]
        getter insights : Types::InsightsByAssessment?

        def initialize(
          @insights : Types::InsightsByAssessment? = nil
        )
        end
      end


      struct GetInsightsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetInsightsResponse
        include JSON::Serializable

        # The analytics data that the GetInsights API returned.

        @[JSON::Field(key: "insights")]
        getter insights : Types::Insights?

        def initialize(
          @insights : Types::Insights? = nil
        )
        end
      end


      struct GetOrganizationAdminAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetOrganizationAdminAccountResponse
        include JSON::Serializable

        # The identifier for the administrator account.

        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String?

        # The identifier for the organization.

        @[JSON::Field(key: "organizationId")]
        getter organization_id : String?

        def initialize(
          @admin_account_id : String? = nil,
          @organization_id : String? = nil
        )
        end
      end


      struct GetServicesInScopeRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetServicesInScopeResponse
        include JSON::Serializable

        # The metadata that's associated with the Amazon Web Services service.

        @[JSON::Field(key: "serviceMetadata")]
        getter service_metadata : Array(Types::ServiceMetadata)?

        def initialize(
          @service_metadata : Array(Types::ServiceMetadata)? = nil
        )
        end
      end


      struct GetSettingsRequest
        include JSON::Serializable

        # The list of setting attribute enum values.

        @[JSON::Field(key: "attribute")]
        getter attribute : String

        def initialize(
          @attribute : String
        )
        end
      end


      struct GetSettingsResponse
        include JSON::Serializable

        # The settings object that holds all supported Audit Manager settings.

        @[JSON::Field(key: "settings")]
        getter settings : Types::Settings?

        def initialize(
          @settings : Types::Settings? = nil
        )
        end
      end

      # A summary of the latest analytics data for all your active assessments. This summary is a snapshot
      # of the data that your active assessments collected on the lastUpdated date. It’s important to
      # understand that the following totals are daily counts based on this date — they aren’t a total sum
      # to date. The Insights data is eventually consistent. This means that, when you read data from
      # Insights , the response might not instantly reflect the results of a recently completed write or
      # update operation. If you repeat your read request after a few hours, the response should return the
      # latest data. If you delete an assessment or change its status to inactive, InsightsByAssessment
      # includes data for that assessment as follows. Inactive assessments - If Audit Manager collected
      # evidence for your assessment before you changed it inactive, that evidence is included in the
      # InsightsByAssessment counts for that day. Deleted assessments - If Audit Manager collected evidence
      # for your assessment before you deleted it, that evidence isn't included in the InsightsByAssessment
      # counts for that day.

      struct Insights
        include JSON::Serializable

        # The number of active assessments in Audit Manager.

        @[JSON::Field(key: "activeAssessmentsCount")]
        getter active_assessments_count : Int32?

        # The number of assessment controls that collected non-compliant evidence on the lastUpdated date.

        @[JSON::Field(key: "assessmentControlsCountByNoncompliantEvidence")]
        getter assessment_controls_count_by_noncompliant_evidence : Int32?

        # The number of compliance check evidence that Audit Manager classified as compliant on the
        # lastUpdated date. This includes evidence that was collected from Security Hub with a Pass ruling, or
        # collected from Config with a Compliant ruling.

        @[JSON::Field(key: "compliantEvidenceCount")]
        getter compliant_evidence_count : Int32?

        # The number of evidence without a compliance check ruling. Evidence is inconclusive when the
        # associated control uses Security Hub or Config as a data source but you didn't enable those
        # services. This is also the case when a control uses a data source that doesn’t support compliance
        # checks (for example: manual evidence, API calls, or CloudTrail). If evidence has a compliance check
        # status of not applicable , it's classed as inconclusive in Insights data.

        @[JSON::Field(key: "inconclusiveEvidenceCount")]
        getter inconclusive_evidence_count : Int32?

        # The time when the cross-assessment insights were last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The number of compliance check evidence that Audit Manager classified as non-compliant on the
        # lastUpdated date. This includes evidence that was collected from Security Hub with a Fail ruling, or
        # collected from Config with a Non-compliant ruling.

        @[JSON::Field(key: "noncompliantEvidenceCount")]
        getter noncompliant_evidence_count : Int32?

        # The total number of controls across all active assessments.

        @[JSON::Field(key: "totalAssessmentControlsCount")]
        getter total_assessment_controls_count : Int32?

        def initialize(
          @active_assessments_count : Int32? = nil,
          @assessment_controls_count_by_noncompliant_evidence : Int32? = nil,
          @compliant_evidence_count : Int32? = nil,
          @inconclusive_evidence_count : Int32? = nil,
          @last_updated : Time? = nil,
          @noncompliant_evidence_count : Int32? = nil,
          @total_assessment_controls_count : Int32? = nil
        )
        end
      end

      # A summary of the latest analytics data for a specific active assessment. This summary is a snapshot
      # of the data that was collected on the lastUpdated date. It’s important to understand that the totals
      # in InsightsByAssessment are daily counts based on this date — they aren’t a total sum to date. The
      # InsightsByAssessment data is eventually consistent. This means that when you read data from
      # InsightsByAssessment , the response might not instantly reflect the results of a recently completed
      # write or update operation. If you repeat your read request after a few hours, the response returns
      # the latest data. If you delete an assessment or change its status to inactive, InsightsByAssessment
      # includes data for that assessment as follows. Inactive assessments - If Audit Manager collected
      # evidence for your assessment before you changed it inactive, that evidence is included in the
      # InsightsByAssessment counts for that day. Deleted assessments - If Audit Manager collected evidence
      # for your assessment before you deleted it, that evidence isn't included in the InsightsByAssessment
      # counts for that day.

      struct InsightsByAssessment
        include JSON::Serializable

        # The number of assessment controls that collected non-compliant evidence on the lastUpdated date.

        @[JSON::Field(key: "assessmentControlsCountByNoncompliantEvidence")]
        getter assessment_controls_count_by_noncompliant_evidence : Int32?

        # The number of compliance check evidence that Audit Manager classified as compliant. This includes
        # evidence that was collected from Security Hub with a Pass ruling, or collected from Config with a
        # Compliant ruling.

        @[JSON::Field(key: "compliantEvidenceCount")]
        getter compliant_evidence_count : Int32?

        # The amount of evidence without a compliance check ruling. Evidence is inconclusive if the associated
        # control uses Security Hub or Config as a data source and you didn't enable those services. This is
        # also the case if a control uses a data source that doesn’t support compliance checks (for example,
        # manual evidence, API calls, or CloudTrail). If evidence has a compliance check status of not
        # applicable , it's classified as inconclusive in InsightsByAssessment data.

        @[JSON::Field(key: "inconclusiveEvidenceCount")]
        getter inconclusive_evidence_count : Int32?

        # The time when the assessment insights were last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time?

        # The number of compliance check evidence that Audit Manager classified as non-compliant. This
        # includes evidence that was collected from Security Hub with a Fail ruling, or collected from Config
        # with a Non-compliant ruling.

        @[JSON::Field(key: "noncompliantEvidenceCount")]
        getter noncompliant_evidence_count : Int32?

        # The total number of controls in the assessment.

        @[JSON::Field(key: "totalAssessmentControlsCount")]
        getter total_assessment_controls_count : Int32?

        def initialize(
          @assessment_controls_count_by_noncompliant_evidence : Int32? = nil,
          @compliant_evidence_count : Int32? = nil,
          @inconclusive_evidence_count : Int32? = nil,
          @last_updated : Time? = nil,
          @noncompliant_evidence_count : Int32? = nil,
          @total_assessment_controls_count : Int32? = nil
        )
        end
      end

      # An internal service error occurred during the processing of your request. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListAssessmentControlInsightsByControlDomainRequest
        include JSON::Serializable

        # The unique identifier for the active assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the control domain. Audit Manager supports the control domains that are
        # provided by Amazon Web Services Control Catalog. For information about how to find a list of
        # available control domains, see ListDomains in the Amazon Web Services Control Catalog API Reference.

        @[JSON::Field(key: "controlDomainId")]
        getter control_domain_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @control_domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentControlInsightsByControlDomainResponse
        include JSON::Serializable

        # The assessment control analytics data that the ListAssessmentControlInsightsByControlDomain API
        # returned.

        @[JSON::Field(key: "controlInsightsByAssessment")]
        getter control_insights_by_assessment : Array(Types::ControlInsightsMetadataByAssessmentItem)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_insights_by_assessment : Array(Types::ControlInsightsMetadataByAssessmentItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentFrameworkShareRequestsRequest
        include JSON::Serializable

        # Specifies whether the share request is a sent request or a received request.

        @[JSON::Field(key: "requestType")]
        getter request_type : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @request_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentFrameworkShareRequestsResponse
        include JSON::Serializable

        # The list of share requests that the ListAssessmentFrameworkShareRequests API returned.

        @[JSON::Field(key: "assessmentFrameworkShareRequests")]
        getter assessment_framework_share_requests : Array(Types::AssessmentFrameworkShareRequest)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_framework_share_requests : Array(Types::AssessmentFrameworkShareRequest)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentFrameworksRequest
        include JSON::Serializable

        # The type of framework, such as a standard framework or a custom framework.

        @[JSON::Field(key: "frameworkType")]
        getter framework_type : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @framework_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentFrameworksResponse
        include JSON::Serializable

        # A list of metadata that the ListAssessmentFrameworks API returns for each framework.

        @[JSON::Field(key: "frameworkMetadataList")]
        getter framework_metadata_list : Array(Types::AssessmentFrameworkMetadata)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @framework_metadata_list : Array(Types::AssessmentFrameworkMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentReportsRequest
        include JSON::Serializable

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentReportsResponse
        include JSON::Serializable

        # The list of assessment reports that the ListAssessmentReports API returned.

        @[JSON::Field(key: "assessmentReports")]
        getter assessment_reports : Array(Types::AssessmentReportMetadata)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_reports : Array(Types::AssessmentReportMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssessmentsRequest
        include JSON::Serializable

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The current status of the assessment.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListAssessmentsResponse
        include JSON::Serializable

        # The metadata that the ListAssessments API returns for each assessment.

        @[JSON::Field(key: "assessmentMetadata")]
        getter assessment_metadata : Array(Types::AssessmentMetadataItem)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_metadata : Array(Types::AssessmentMetadataItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlDomainInsightsByAssessmentRequest
        include JSON::Serializable

        # The unique identifier for the active assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assessment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlDomainInsightsByAssessmentResponse
        include JSON::Serializable

        # The control domain analytics data that the ListControlDomainInsightsByAssessment API returned.

        @[JSON::Field(key: "controlDomainInsights")]
        getter control_domain_insights : Array(Types::ControlDomainInsights)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_domain_insights : Array(Types::ControlDomainInsights)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlDomainInsightsRequest
        include JSON::Serializable

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlDomainInsightsResponse
        include JSON::Serializable

        # The control domain analytics data that the ListControlDomainInsights API returned.

        @[JSON::Field(key: "controlDomainInsights")]
        getter control_domain_insights : Array(Types::ControlDomainInsights)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_domain_insights : Array(Types::ControlDomainInsights)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlInsightsByControlDomainRequest
        include JSON::Serializable

        # The unique identifier for the control domain. Audit Manager supports the control domains that are
        # provided by Amazon Web Services Control Catalog. For information about how to find a list of
        # available control domains, see ListDomains in the Amazon Web Services Control Catalog API Reference.

        @[JSON::Field(key: "controlDomainId")]
        getter control_domain_id : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_domain_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlInsightsByControlDomainResponse
        include JSON::Serializable

        # The control analytics data that the ListControlInsightsByControlDomain API returned.

        @[JSON::Field(key: "controlInsightsMetadata")]
        getter control_insights_metadata : Array(Types::ControlInsightsMetadataItem)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_insights_metadata : Array(Types::ControlInsightsMetadataItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlsRequest
        include JSON::Serializable

        # A filter that narrows the list of controls to a specific type.

        @[JSON::Field(key: "controlType")]
        getter control_type : String

        # A filter that narrows the list of controls to a specific resource from the Amazon Web Services
        # Control Catalog. To use this parameter, specify the ARN of the Control Catalog resource. You can
        # specify either a control domain, a control objective, or a common control. For information about how
        # to find the ARNs for these resources, see ListDomains , ListObjectives , and ListCommonControls .
        # You can only filter by one Control Catalog resource at a time. Specifying multiple resource ARNs
        # isn’t currently supported. If you want to filter by more than one ARN, we recommend that you run the
        # ListControls operation separately for each ARN. Alternatively, specify UNCATEGORIZED to list
        # controls that aren't mapped to a Control Catalog resource. For example, this operation might return
        # a list of custom controls that don't belong to any control domain or control objective.

        @[JSON::Field(key: "controlCatalogId")]
        getter control_catalog_id : String?

        # The maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_type : String,
          @control_catalog_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListControlsResponse
        include JSON::Serializable

        # A list of metadata that the ListControls API returns for each control.

        @[JSON::Field(key: "controlMetadataList")]
        getter control_metadata_list : Array(Types::ControlMetadata)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @control_metadata_list : Array(Types::ControlMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKeywordsForDataSourceRequest
        include JSON::Serializable

        # The control mapping data source that the keywords apply to.

        @[JSON::Field(key: "source")]
        getter source : String

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @source : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListKeywordsForDataSourceResponse
        include JSON::Serializable

        # The list of keywords for the control mapping source.

        @[JSON::Field(key: "keywords")]
        getter keywords : Array(String)?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @keywords : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationsRequest
        include JSON::Serializable

        # Represents the maximum number of results on a page or for an API request call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNotificationsResponse
        include JSON::Serializable

        # The pagination token that's used to fetch the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The returned list of notifications.

        @[JSON::Field(key: "notifications")]
        getter notifications : Array(Types::Notification)?

        def initialize(
          @next_token : String? = nil,
          @notifications : Array(Types::Notification)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags that the ListTagsForResource API returned.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Evidence that's manually added to a control in Audit Manager. manualEvidence can be one of the
      # following: evidenceFileName , s3ResourcePath , or textResponse .

      struct ManualEvidence
        include JSON::Serializable

        # The name of the file that's uploaded as manual evidence. This name is populated using the
        # evidenceFileName value from the GetEvidenceFileUploadUrl API response.

        @[JSON::Field(key: "evidenceFileName")]
        getter evidence_file_name : String?

        # The S3 URL of the object that's imported as manual evidence.

        @[JSON::Field(key: "s3ResourcePath")]
        getter s3_resource_path : String?

        # The plain text response that's entered and saved as manual evidence.

        @[JSON::Field(key: "textResponse")]
        getter text_response : String?

        def initialize(
          @evidence_file_name : String? = nil,
          @s3_resource_path : String? = nil,
          @text_response : String? = nil
        )
        end
      end

      # The notification that informs a user of an update in Audit Manager. For example, this includes the
      # notification that's sent when a control set is delegated for review.

      struct Notification
        include JSON::Serializable

        # The identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String?

        # The name of the related assessment.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String?

        # Specifies the name of the control set that the notification is about.

        @[JSON::Field(key: "controlSetName")]
        getter control_set_name : String?

        # The description of the notification.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time when the notification was sent.

        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The unique identifier for the notification.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The sender of the notification.

        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @assessment_id : String? = nil,
          @assessment_name : String? = nil,
          @control_set_id : String? = nil,
          @control_set_name : String? = nil,
          @description : String? = nil,
          @event_time : Time? = nil,
          @id : String? = nil,
          @source : String? = nil
        )
        end
      end


      struct RegisterAccountRequest
        include JSON::Serializable

        # The delegated administrator account for Audit Manager.

        @[JSON::Field(key: "delegatedAdminAccount")]
        getter delegated_admin_account : String?

        # The KMS key details.

        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        def initialize(
          @delegated_admin_account : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct RegisterAccountResponse
        include JSON::Serializable

        # The status of the account registration request.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end


      struct RegisterOrganizationAdminAccountRequest
        include JSON::Serializable

        # The identifier for the delegated administrator account.

        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String

        def initialize(
          @admin_account_id : String
        )
        end
      end


      struct RegisterOrganizationAdminAccountResponse
        include JSON::Serializable

        # The identifier for the delegated administrator account.

        @[JSON::Field(key: "adminAccountId")]
        getter admin_account_id : String?

        # The identifier for the organization.

        @[JSON::Field(key: "organizationId")]
        getter organization_id : String?

        def initialize(
          @admin_account_id : String? = nil,
          @organization_id : String? = nil
        )
        end
      end

      # A system asset that's evaluated in an Audit Manager assessment.

      struct Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The evaluation status for a resource that was assessed when collecting compliance check evidence.
        # Audit Manager classes the resource as non-compliant if Security Hub reports a Fail result, or if
        # Config reports a Non-compliant result. Audit Manager classes the resource as compliant if Security
        # Hub reports a Pass result, or if Config reports a Compliant result. If a compliance check isn't
        # available or applicable, then no compliance evaluation can be made for that resource. This is the
        # case if a resource assessment uses Config or Security Hub as the underlying data source type, but
        # those services aren't enabled. This is also the case if the resource assessment uses an underlying
        # data source type that doesn't support compliance checks (such as manual evidence, Amazon Web
        # Services API calls, or CloudTrail).

        @[JSON::Field(key: "complianceCheck")]
        getter compliance_check : String?

        # The value of the resource.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @arn : String? = nil,
          @compliance_check : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The resource that's specified in the request can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier for the resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that's affected by the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The wrapper that contains the Audit Manager role information of the current user. This includes the
      # role type and IAM Amazon Resource Name (ARN).

      struct Role
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The type of customer persona. In CreateAssessment , roleType can only be PROCESS_OWNER . In
        # UpdateSettings , roleType can only be PROCESS_OWNER . In BatchCreateDelegationByAssessment ,
        # roleType can only be RESOURCE_OWNER .

        @[JSON::Field(key: "roleType")]
        getter role_type : String

        def initialize(
          @role_arn : String,
          @role_type : String
        )
        end
      end

      # The wrapper that contains the Amazon Web Services accounts that are in scope for the assessment. You
      # no longer need to specify which Amazon Web Services services are in scope when you create or update
      # an assessment. Audit Manager infers the services in scope by examining your assessment controls and
      # their data sources, and then mapping this information to the relevant Amazon Web Services services.
      # If an underlying data source changes for your assessment, we automatically update the services scope
      # as needed to reflect the correct Amazon Web Services services. This ensures that your assessment
      # collects accurate and comprehensive evidence about all of the relevant services in your AWS
      # environment.

      struct Scope
        include JSON::Serializable

        # The Amazon Web Services accounts that are included in the scope of the assessment.

        @[JSON::Field(key: "awsAccounts")]
        getter aws_accounts : Array(Types::AWSAccount)?

        # The Amazon Web Services services that are included in the scope of the assessment. This API
        # parameter is no longer supported. If you use this parameter to specify one or more Amazon Web
        # Services services, Audit Manager ignores this input. Instead, the value for awsServices will show as
        # empty.

        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(Types::AWSService)?

        def initialize(
          @aws_accounts : Array(Types::AWSAccount)? = nil,
          @aws_services : Array(Types::AWSService)? = nil
        )
        end
      end

      # The metadata that's associated with the Amazon Web Services service.

      struct ServiceMetadata
        include JSON::Serializable

        # The category that the Amazon Web Services service belongs to, such as compute, storage, or database.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The description of the Amazon Web Services service.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the Amazon Web Services service.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The name of the Amazon Web Services service.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @category : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # You've reached your account quota for this resource type. To perform the requested action, delete
      # some existing resources or request a quota increase from the Service Quotas console. For a list of
      # Audit Manager service quotas, see Quotas and restrictions for Audit Manager .

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The settings object that holds all supported Audit Manager settings.

      struct Settings
        include JSON::Serializable

        # The default S3 destination bucket for storing assessment reports.

        @[JSON::Field(key: "defaultAssessmentReportsDestination")]
        getter default_assessment_reports_destination : Types::AssessmentReportsDestination?

        # The default S3 destination bucket for storing evidence finder exports.

        @[JSON::Field(key: "defaultExportDestination")]
        getter default_export_destination : Types::DefaultExportDestination?

        # The designated default audit owners.

        @[JSON::Field(key: "defaultProcessOwners")]
        getter default_process_owners : Array(Types::Role)?

        # The deregistration policy for your Audit Manager data. You can use this attribute to determine how
        # your data is handled when you deregister Audit Manager.

        @[JSON::Field(key: "deregistrationPolicy")]
        getter deregistration_policy : Types::DeregistrationPolicy?

        # The current evidence finder status and event data store details.

        @[JSON::Field(key: "evidenceFinderEnablement")]
        getter evidence_finder_enablement : Types::EvidenceFinderEnablement?

        # Specifies whether Organizations is enabled.

        @[JSON::Field(key: "isAwsOrgEnabled")]
        getter is_aws_org_enabled : Bool?

        # The KMS key details.

        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        # The designated Amazon Simple Notification Service (Amazon SNS) topic.

        @[JSON::Field(key: "snsTopic")]
        getter sns_topic : String?

        def initialize(
          @default_assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
          @default_export_destination : Types::DefaultExportDestination? = nil,
          @default_process_owners : Array(Types::Role)? = nil,
          @deregistration_policy : Types::DeregistrationPolicy? = nil,
          @evidence_finder_enablement : Types::EvidenceFinderEnablement? = nil,
          @is_aws_org_enabled : Bool? = nil,
          @kms_key : String? = nil,
          @sns_topic : String? = nil
        )
        end
      end

      # A keyword that relates to the control data source. For manual evidence, this keyword indicates if
      # the manual evidence is a file or text. For automated evidence, this keyword identifies a specific
      # CloudTrail event, Config rule, Security Hub control, or Amazon Web Services API name. To learn more
      # about the supported keywords that you can use when mapping a control data source, see the following
      # pages in the Audit Manager User Guide : Config rules supported by Audit Manager Security Hub
      # controls supported by Audit Manager API calls supported by Audit Manager CloudTrail event names
      # supported by Audit Manager

      struct SourceKeyword
        include JSON::Serializable

        # The input method for the keyword. SELECT_FROM_LIST is used when mapping a data source for automated
        # evidence. When keywordInputType is SELECT_FROM_LIST , a keyword must be selected to collect
        # automated evidence. For example, this keyword can be a CloudTrail event name, a rule name for
        # Config, a Security Hub control, or the name of an Amazon Web Services API call. UPLOAD_FILE and
        # INPUT_TEXT are only used when mapping a data source for manual evidence. When keywordInputType is
        # UPLOAD_FILE , a file must be uploaded as manual evidence. When keywordInputType is INPUT_TEXT , text
        # must be entered as manual evidence.

        @[JSON::Field(key: "keywordInputType")]
        getter keyword_input_type : String?

        # The value of the keyword that's used when mapping a control data source. For example, this can be a
        # CloudTrail event name, a rule name for Config, a Security Hub control, or the name of an Amazon Web
        # Services API call. If you’re mapping a data source to a rule in Config, the keywordValue that you
        # specify depends on the type of rule: For managed rules , you can use the rule identifier as the
        # keywordValue . You can find the rule identifier from the list of Config managed rules . For some
        # rules, the rule identifier is different from the rule name. For example, the rule name
        # restricted-ssh has the following rule identifier: INCOMING_SSH_DISABLED . Make sure to use the rule
        # identifier, not the rule name. Keyword example for managed rules: Managed rule name:
        # s3-bucket-acl-prohibited keywordValue : S3_BUCKET_ACL_PROHIBITED For custom rules , you form the
        # keywordValue by adding the Custom_ prefix to the rule name. This prefix distinguishes the custom
        # rule from a managed rule. Keyword example for custom rules: Custom rule name: my-custom-config-rule
        # keywordValue : Custom_my-custom-config-rule For service-linked rules , you form the keywordValue by
        # adding the Custom_ prefix to the rule name. In addition, you remove the suffix ID that appears at
        # the end of the rule name. Keyword examples for service-linked rules: Service-linked rule name:
        # CustomRuleForAccount-conformance-pack-szsm1uv0w keywordValue :
        # Custom_CustomRuleForAccount-conformance-pack Service-linked rule name:
        # OrgConfigRule-s3-bucket-versioning-enabled-dbgzf8ba keywordValue :
        # Custom_OrgConfigRule-s3-bucket-versioning-enabled The keywordValue is case sensitive. If you enter a
        # value incorrectly, Audit Manager might not recognize the data source mapping. As a result, you might
        # not successfully collect evidence from that data source as intended. Keep in mind the following
        # requirements, depending on the data source type that you're using. For Config: For managed rules,
        # make sure that the keywordValue is the rule identifier in ALL_CAPS_WITH_UNDERSCORES . For example,
        # CLOUDWATCH_LOG_GROUP_ENCRYPTED . For accuracy, we recommend that you reference the list of supported
        # Config managed rules . For custom rules, make sure that the keywordValue has the Custom_ prefix
        # followed by the custom rule name. The format of the custom rule name itself may vary. For accuracy,
        # we recommend that you visit the Config console to verify your custom rule name. For Security Hub:
        # The format varies for Security Hub control names. For accuracy, we recommend that you reference the
        # list of supported Security Hub controls . For Amazon Web Services API calls: Make sure that the
        # keywordValue is written as serviceprefix_ActionName . For example, iam_ListGroups . For accuracy, we
        # recommend that you reference the list of supported API calls . For CloudTrail: Make sure that the
        # keywordValue is written as serviceprefix_ActionName . For example, cloudtrail_StartLogging . For
        # accuracy, we recommend that you review the Amazon Web Services service prefix and action names in
        # the Service Authorization Reference .

        @[JSON::Field(key: "keywordValue")]
        getter keyword_value : String?

        def initialize(
          @keyword_input_type : String? = nil,
          @keyword_value : String? = nil
        )
        end
      end


      struct StartAssessmentFrameworkShareRequest
        include JSON::Serializable

        # The Amazon Web Services account of the recipient.

        @[JSON::Field(key: "destinationAccount")]
        getter destination_account : String

        # The Amazon Web Services Region of the recipient.

        @[JSON::Field(key: "destinationRegion")]
        getter destination_region : String

        # The unique identifier for the custom framework to be shared.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String

        # An optional comment from the sender about the share request.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        def initialize(
          @destination_account : String,
          @destination_region : String,
          @framework_id : String,
          @comment : String? = nil
        )
        end
      end


      struct StartAssessmentFrameworkShareResponse
        include JSON::Serializable

        # The share request that's created by the StartAssessmentFrameworkShare API.

        @[JSON::Field(key: "assessmentFrameworkShareRequest")]
        getter assessment_framework_share_request : Types::AssessmentFrameworkShareRequest?

        def initialize(
          @assessment_framework_share_request : Types::AssessmentFrameworkShareRequest? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags that are associated with the resource.

        @[JSON::Field(key: "tags")]
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


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Short for uniform resource locator. A URL is used as a unique identifier to locate a resource on the
      # internet.

      struct URL
        include JSON::Serializable

        # The name or word that's used as a hyperlink to the URL.

        @[JSON::Field(key: "hyperlinkName")]
        getter hyperlink_name : String?

        # The unique identifier for the internet resource.

        @[JSON::Field(key: "link")]
        getter link : String?

        def initialize(
          @hyperlink_name : String? = nil,
          @link : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The name or key of the tag.

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


      struct UpdateAssessmentControlRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The unique identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The comment body text for the control.

        @[JSON::Field(key: "commentBody")]
        getter comment_body : String?

        # The status of the control.

        @[JSON::Field(key: "controlStatus")]
        getter control_status : String?

        def initialize(
          @assessment_id : String,
          @control_id : String,
          @control_set_id : String,
          @comment_body : String? = nil,
          @control_status : String? = nil
        )
        end
      end


      struct UpdateAssessmentControlResponse
        include JSON::Serializable

        # The name of the updated control set that the UpdateAssessmentControl API returned.

        @[JSON::Field(key: "control")]
        getter control : Types::AssessmentControl?

        def initialize(
          @control : Types::AssessmentControl? = nil
        )
        end
      end


      struct UpdateAssessmentControlSetStatusRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The comment that's related to the status update.

        @[JSON::Field(key: "comment")]
        getter comment : String

        # The unique identifier for the control set.

        @[JSON::Field(key: "controlSetId")]
        getter control_set_id : String

        # The status of the control set that's being updated.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @assessment_id : String,
          @comment : String,
          @control_set_id : String,
          @status : String
        )
        end
      end


      struct UpdateAssessmentControlSetStatusResponse
        include JSON::Serializable

        # The name of the updated control set that the UpdateAssessmentControlSetStatus API returned.

        @[JSON::Field(key: "controlSet")]
        getter control_set : Types::AssessmentControlSet?

        def initialize(
          @control_set : Types::AssessmentControlSet? = nil
        )
        end
      end

      # A controlSet entity that represents a collection of controls in Audit Manager. This doesn't contain
      # the control set ID.

      struct UpdateAssessmentFrameworkControlSet
        include JSON::Serializable

        # The list of controls that are contained within the control set.

        @[JSON::Field(key: "controls")]
        getter controls : Array(Types::CreateAssessmentFrameworkControl)

        # The name of the control set.

        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier for the control set.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @controls : Array(Types::CreateAssessmentFrameworkControl),
          @name : String,
          @id : String? = nil
        )
        end
      end


      struct UpdateAssessmentFrameworkRequest
        include JSON::Serializable

        # The control sets that are associated with the framework. The Controls object returns a partial
        # response when called through Framework APIs. For a complete Controls object, use GetControl .

        @[JSON::Field(key: "controlSets")]
        getter control_sets : Array(Types::UpdateAssessmentFrameworkControlSet)

        # The unique identifier for the framework.

        @[JSON::Field(key: "frameworkId")]
        getter framework_id : String

        # The name of the framework to be updated.

        @[JSON::Field(key: "name")]
        getter name : String

        # The compliance type that the new custom framework supports, such as CIS or HIPAA.

        @[JSON::Field(key: "complianceType")]
        getter compliance_type : String?

        # The description of the updated framework.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @control_sets : Array(Types::UpdateAssessmentFrameworkControlSet),
          @framework_id : String,
          @name : String,
          @compliance_type : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateAssessmentFrameworkResponse
        include JSON::Serializable

        # The framework object.

        @[JSON::Field(key: "framework")]
        getter framework : Types::Framework?

        def initialize(
          @framework : Types::Framework? = nil
        )
        end
      end


      struct UpdateAssessmentFrameworkShareRequest
        include JSON::Serializable

        # Specifies the update action for the share request.

        @[JSON::Field(key: "action")]
        getter action : String

        # The unique identifier for the share request.

        @[JSON::Field(key: "requestId")]
        getter request_id : String

        # Specifies whether the share request is a sent request or a received request.

        @[JSON::Field(key: "requestType")]
        getter request_type : String

        def initialize(
          @action : String,
          @request_id : String,
          @request_type : String
        )
        end
      end


      struct UpdateAssessmentFrameworkShareResponse
        include JSON::Serializable

        # The updated share request that's returned by the UpdateAssessmentFrameworkShare operation.

        @[JSON::Field(key: "assessmentFrameworkShareRequest")]
        getter assessment_framework_share_request : Types::AssessmentFrameworkShareRequest?

        def initialize(
          @assessment_framework_share_request : Types::AssessmentFrameworkShareRequest? = nil
        )
        end
      end


      struct UpdateAssessmentRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The scope of the assessment.

        @[JSON::Field(key: "scope")]
        getter scope : Types::Scope

        # The description of the assessment.

        @[JSON::Field(key: "assessmentDescription")]
        getter assessment_description : String?

        # The name of the assessment to be updated.

        @[JSON::Field(key: "assessmentName")]
        getter assessment_name : String?

        # The assessment report storage destination for the assessment that's being updated.

        @[JSON::Field(key: "assessmentReportsDestination")]
        getter assessment_reports_destination : Types::AssessmentReportsDestination?

        # The list of roles for the assessment.

        @[JSON::Field(key: "roles")]
        getter roles : Array(Types::Role)?

        def initialize(
          @assessment_id : String,
          @scope : Types::Scope,
          @assessment_description : String? = nil,
          @assessment_name : String? = nil,
          @assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
          @roles : Array(Types::Role)? = nil
        )
        end
      end


      struct UpdateAssessmentResponse
        include JSON::Serializable

        # The response object for the UpdateAssessment API. This is the name of the updated assessment.

        @[JSON::Field(key: "assessment")]
        getter assessment : Types::Assessment?

        def initialize(
          @assessment : Types::Assessment? = nil
        )
        end
      end


      struct UpdateAssessmentStatusRequest
        include JSON::Serializable

        # The unique identifier for the assessment.

        @[JSON::Field(key: "assessmentId")]
        getter assessment_id : String

        # The current status of the assessment.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @assessment_id : String,
          @status : String
        )
        end
      end


      struct UpdateAssessmentStatusResponse
        include JSON::Serializable

        # The name of the updated assessment that the UpdateAssessmentStatus API returned.

        @[JSON::Field(key: "assessment")]
        getter assessment : Types::Assessment?

        def initialize(
          @assessment : Types::Assessment? = nil
        )
        end
      end


      struct UpdateControlRequest
        include JSON::Serializable

        # The identifier for the control.

        @[JSON::Field(key: "controlId")]
        getter control_id : String

        # The data mapping sources for the control.

        @[JSON::Field(key: "controlMappingSources")]
        getter control_mapping_sources : Array(Types::ControlMappingSource)

        # The name of the updated control.

        @[JSON::Field(key: "name")]
        getter name : String

        # The recommended actions to carry out if the control isn't fulfilled.

        @[JSON::Field(key: "actionPlanInstructions")]
        getter action_plan_instructions : String?

        # The title of the action plan for remediating the control.

        @[JSON::Field(key: "actionPlanTitle")]
        getter action_plan_title : String?

        # The optional description of the control.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The steps that you should follow to determine if the control is met.

        @[JSON::Field(key: "testingInformation")]
        getter testing_information : String?

        def initialize(
          @control_id : String,
          @control_mapping_sources : Array(Types::ControlMappingSource),
          @name : String,
          @action_plan_instructions : String? = nil,
          @action_plan_title : String? = nil,
          @description : String? = nil,
          @testing_information : String? = nil
        )
        end
      end


      struct UpdateControlResponse
        include JSON::Serializable

        # The name of the updated control set that the UpdateControl API returned.

        @[JSON::Field(key: "control")]
        getter control : Types::Control?

        def initialize(
          @control : Types::Control? = nil
        )
        end
      end


      struct UpdateSettingsRequest
        include JSON::Serializable

        # The default S3 destination bucket for storing assessment reports.

        @[JSON::Field(key: "defaultAssessmentReportsDestination")]
        getter default_assessment_reports_destination : Types::AssessmentReportsDestination?

        # The default S3 destination bucket for storing evidence finder exports.

        @[JSON::Field(key: "defaultExportDestination")]
        getter default_export_destination : Types::DefaultExportDestination?

        # A list of the default audit owners.

        @[JSON::Field(key: "defaultProcessOwners")]
        getter default_process_owners : Array(Types::Role)?

        # The deregistration policy for your Audit Manager data. You can use this attribute to determine how
        # your data is handled when you deregister Audit Manager.

        @[JSON::Field(key: "deregistrationPolicy")]
        getter deregistration_policy : Types::DeregistrationPolicy?

        # Specifies whether the evidence finder feature is enabled. Change this attribute to enable or disable
        # evidence finder. When you use this attribute to disable evidence finder, Audit Manager deletes the
        # event data store that’s used to query your evidence data. As a result, you can’t re-enable evidence
        # finder and use the feature again. Your only alternative is to deregister and then re-register Audit
        # Manager.

        @[JSON::Field(key: "evidenceFinderEnabled")]
        getter evidence_finder_enabled : Bool?

        # The KMS key details.

        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        # The Amazon Simple Notification Service (Amazon SNS) topic that Audit Manager sends notifications to.

        @[JSON::Field(key: "snsTopic")]
        getter sns_topic : String?

        def initialize(
          @default_assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
          @default_export_destination : Types::DefaultExportDestination? = nil,
          @default_process_owners : Array(Types::Role)? = nil,
          @deregistration_policy : Types::DeregistrationPolicy? = nil,
          @evidence_finder_enabled : Bool? = nil,
          @kms_key : String? = nil,
          @sns_topic : String? = nil
        )
        end
      end


      struct UpdateSettingsResponse
        include JSON::Serializable

        # The current list of settings.

        @[JSON::Field(key: "settings")]
        getter settings : Types::Settings?

        def initialize(
          @settings : Types::Settings? = nil
        )
        end
      end


      struct ValidateAssessmentReportIntegrityRequest
        include JSON::Serializable

        # The relative path of the Amazon S3 bucket that the assessment report is stored in.

        @[JSON::Field(key: "s3RelativePath")]
        getter s3_relative_path : String

        def initialize(
          @s3_relative_path : String
        )
        end
      end


      struct ValidateAssessmentReportIntegrityResponse
        include JSON::Serializable

        # The signature algorithm that's used to code sign the assessment report file.

        @[JSON::Field(key: "signatureAlgorithm")]
        getter signature_algorithm : String?

        # The date and time signature that specifies when the assessment report was created.

        @[JSON::Field(key: "signatureDateTime")]
        getter signature_date_time : String?

        # The unique identifier for the validation signature key.

        @[JSON::Field(key: "signatureKeyId")]
        getter signature_key_id : String?

        # Specifies whether the signature key is valid.

        @[JSON::Field(key: "signatureValid")]
        getter signature_valid : Bool?

        # Represents any errors that occurred when validating the assessment report.

        @[JSON::Field(key: "validationErrors")]
        getter validation_errors : Array(String)?

        def initialize(
          @signature_algorithm : String? = nil,
          @signature_date_time : String? = nil,
          @signature_key_id : String? = nil,
          @signature_valid : Bool? = nil,
          @validation_errors : Array(String)? = nil
        )
        end
      end

      # The request has invalid or missing parameters.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The fields that caused the error, if applicable.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason the request failed validation.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Indicates that the request has invalid or missing parameters for the field.

      struct ValidationExceptionField
        include JSON::Serializable

        # The body of the error message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the validation error.

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
