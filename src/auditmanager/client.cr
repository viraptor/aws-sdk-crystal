module Aws
  module AuditManager
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates an evidence folder to an assessment report in an Audit Manager assessment.

      def associate_assessment_report_evidence_folder(
        assessment_id : String,
        evidence_folder_id : String
      ) : Protocol::Request
        input = Types::AssociateAssessmentReportEvidenceFolderRequest.new(assessment_id: assessment_id, evidence_folder_id: evidence_folder_id)
        associate_assessment_report_evidence_folder(input)
      end

      def associate_assessment_report_evidence_folder(input : Types::AssociateAssessmentReportEvidenceFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ASSESSMENT_REPORT_EVIDENCE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a list of evidence to an assessment report in an Audit Manager assessment.

      def batch_associate_assessment_report_evidence(
        assessment_id : String,
        evidence_folder_id : String,
        evidence_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchAssociateAssessmentReportEvidenceRequest.new(assessment_id: assessment_id, evidence_folder_id: evidence_folder_id, evidence_ids: evidence_ids)
        batch_associate_assessment_report_evidence(input)
      end

      def batch_associate_assessment_report_evidence(input : Types::BatchAssociateAssessmentReportEvidenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_ASSESSMENT_REPORT_EVIDENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a batch of delegations for an assessment in Audit Manager.

      def batch_create_delegation_by_assessment(
        assessment_id : String,
        create_delegation_requests : Array(Types::CreateDelegationRequest)
      ) : Protocol::Request
        input = Types::BatchCreateDelegationByAssessmentRequest.new(assessment_id: assessment_id, create_delegation_requests: create_delegation_requests)
        batch_create_delegation_by_assessment(input)
      end

      def batch_create_delegation_by_assessment(input : Types::BatchCreateDelegationByAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_DELEGATION_BY_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a batch of delegations for an assessment in Audit Manager.

      def batch_delete_delegation_by_assessment(
        assessment_id : String,
        delegation_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteDelegationByAssessmentRequest.new(assessment_id: assessment_id, delegation_ids: delegation_ids)
        batch_delete_delegation_by_assessment(input)
      end

      def batch_delete_delegation_by_assessment(input : Types::BatchDeleteDelegationByAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_DELEGATION_BY_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a list of evidence from an assessment report in Audit Manager.

      def batch_disassociate_assessment_report_evidence(
        assessment_id : String,
        evidence_folder_id : String,
        evidence_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDisassociateAssessmentReportEvidenceRequest.new(assessment_id: assessment_id, evidence_folder_id: evidence_folder_id, evidence_ids: evidence_ids)
        batch_disassociate_assessment_report_evidence(input)
      end

      def batch_disassociate_assessment_report_evidence(input : Types::BatchDisassociateAssessmentReportEvidenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_ASSESSMENT_REPORT_EVIDENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more pieces of evidence to a control in an Audit Manager assessment. You can import
      # manual evidence from any S3 bucket by specifying the S3 URI of the object. You can also upload a
      # file from your browser, or enter plain text in response to a risk assessment question. The following
      # restrictions apply to this action: manualEvidence can be only one of the following: evidenceFileName
      # , s3ResourcePath , or textResponse Maximum size of an individual evidence file: 100 MB Number of
      # daily manual evidence uploads per control: 100 Supported file formats: See Supported file types for
      # manual evidence in the Audit Manager User Guide For more information about Audit Manager service
      # restrictions, see Quotas and restrictions for Audit Manager .

      def batch_import_evidence_to_assessment_control(
        assessment_id : String,
        control_id : String,
        control_set_id : String,
        manual_evidence : Array(Types::ManualEvidence)
      ) : Protocol::Request
        input = Types::BatchImportEvidenceToAssessmentControlRequest.new(assessment_id: assessment_id, control_id: control_id, control_set_id: control_set_id, manual_evidence: manual_evidence)
        batch_import_evidence_to_assessment_control(input)
      end

      def batch_import_evidence_to_assessment_control(input : Types::BatchImportEvidenceToAssessmentControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_IMPORT_EVIDENCE_TO_ASSESSMENT_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an assessment in Audit Manager.

      def create_assessment(
        assessment_reports_destination : Types::AssessmentReportsDestination,
        framework_id : String,
        name : String,
        roles : Array(Types::Role),
        scope : Types::Scope,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssessmentRequest.new(assessment_reports_destination: assessment_reports_destination, framework_id: framework_id, name: name, roles: roles, scope: scope, description: description, tags: tags)
        create_assessment(input)
      end

      def create_assessment(input : Types::CreateAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom framework in Audit Manager.

      def create_assessment_framework(
        control_sets : Array(Types::CreateAssessmentFrameworkControlSet),
        name : String,
        compliance_type : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAssessmentFrameworkRequest.new(control_sets: control_sets, name: name, compliance_type: compliance_type, description: description, tags: tags)
        create_assessment_framework(input)
      end

      def create_assessment_framework(input : Types::CreateAssessmentFrameworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSESSMENT_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an assessment report for the specified assessment.

      def create_assessment_report(
        assessment_id : String,
        name : String,
        description : String? = nil,
        query_statement : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssessmentReportRequest.new(assessment_id: assessment_id, name: name, description: description, query_statement: query_statement)
        create_assessment_report(input)
      end

      def create_assessment_report(input : Types::CreateAssessmentReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSESSMENT_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new custom control in Audit Manager.

      def create_control(
        control_mapping_sources : Array(Types::CreateControlMappingSource),
        name : String,
        action_plan_instructions : String? = nil,
        action_plan_title : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        testing_information : String? = nil
      ) : Protocol::Request
        input = Types::CreateControlRequest.new(control_mapping_sources: control_mapping_sources, name: name, action_plan_instructions: action_plan_instructions, action_plan_title: action_plan_title, description: description, tags: tags, testing_information: testing_information)
        create_control(input)
      end

      def create_control(input : Types::CreateControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an assessment in Audit Manager.

      def delete_assessment(
        assessment_id : String
      ) : Protocol::Request
        input = Types::DeleteAssessmentRequest.new(assessment_id: assessment_id)
        delete_assessment(input)
      end

      def delete_assessment(input : Types::DeleteAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom framework in Audit Manager.

      def delete_assessment_framework(
        framework_id : String
      ) : Protocol::Request
        input = Types::DeleteAssessmentFrameworkRequest.new(framework_id: framework_id)
        delete_assessment_framework(input)
      end

      def delete_assessment_framework(input : Types::DeleteAssessmentFrameworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSESSMENT_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a share request for a custom framework in Audit Manager.

      def delete_assessment_framework_share(
        request_id : String,
        request_type : String
      ) : Protocol::Request
        input = Types::DeleteAssessmentFrameworkShareRequest.new(request_id: request_id, request_type: request_type)
        delete_assessment_framework_share(input)
      end

      def delete_assessment_framework_share(input : Types::DeleteAssessmentFrameworkShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSESSMENT_FRAMEWORK_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an assessment report in Audit Manager. When you run the DeleteAssessmentReport operation,
      # Audit Manager attempts to delete the following data: The specified assessment report that’s stored
      # in your S3 bucket The associated metadata that’s stored in Audit Manager If Audit Manager can’t
      # access the assessment report in your S3 bucket, the report isn’t deleted. In this event, the
      # DeleteAssessmentReport operation doesn’t fail. Instead, it proceeds to delete the associated
      # metadata only. You must then delete the assessment report from the S3 bucket yourself. This scenario
      # happens when Audit Manager receives a 403 (Forbidden) or 404 (Not Found) error from Amazon S3. To
      # avoid this, make sure that your S3 bucket is available, and that you configured the correct
      # permissions for Audit Manager to delete resources in your S3 bucket. For an example permissions
      # policy that you can use, see Assessment report destination permissions in the Audit Manager User
      # Guide . For information about the issues that could cause a 403 (Forbidden) or 404 (Not Found )
      # error from Amazon S3, see List of Error Codes in the Amazon Simple Storage Service API Reference .

      def delete_assessment_report(
        assessment_id : String,
        assessment_report_id : String
      ) : Protocol::Request
        input = Types::DeleteAssessmentReportRequest.new(assessment_id: assessment_id, assessment_report_id: assessment_report_id)
        delete_assessment_report(input)
      end

      def delete_assessment_report(input : Types::DeleteAssessmentReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSESSMENT_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom control in Audit Manager. When you invoke this operation, the custom control is
      # deleted from any frameworks or assessments that it’s currently part of. As a result, Audit Manager
      # will stop collecting evidence for that custom control in all of your assessments. This includes
      # assessments that you previously created before you deleted the custom control.

      def delete_control(
        control_id : String
      ) : Protocol::Request
        input = Types::DeleteControlRequest.new(control_id: control_id)
        delete_control(input)
      end

      def delete_control(input : Types::DeleteControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters an account in Audit Manager. Before you deregister, you can use the UpdateSettings API
      # operation to set your preferred data retention policy. By default, Audit Manager retains your data.
      # If you want to delete your data, you can use the DeregistrationPolicy attribute to request the
      # deletion of your data. For more information about data retention, see Data Protection in the Audit
      # Manager User Guide .

      def deregister_account : Protocol::Request
        input = Types::DeregisterAccountRequest.new
        deregister_account(input)
      end

      def deregister_account(input : Types::DeregisterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified Amazon Web Services account as a delegated administrator for Audit Manager.
      # When you remove a delegated administrator from your Audit Manager settings, you continue to have
      # access to the evidence that you previously collected under that account. This is also the case when
      # you deregister a delegated administrator from Organizations. However, Audit Manager stops collecting
      # and attaching evidence to that delegated administrator account moving forward. Keep in mind the
      # following cleanup task if you use evidence finder: Before you use your management account to remove
      # a delegated administrator, make sure that the current delegated administrator account signs in to
      # Audit Manager and disables evidence finder first. Disabling evidence finder automatically deletes
      # the event data store that was created in their account when they enabled evidence finder. If this
      # task isn’t completed, the event data store remains in their account. In this case, we recommend that
      # the original delegated administrator goes to CloudTrail Lake and manually deletes the event data
      # store . This cleanup task is necessary to ensure that you don't end up with multiple event data
      # stores. Audit Manager ignores an unused event data store after you remove or change a delegated
      # administrator account. However, the unused event data store continues to incur storage costs from
      # CloudTrail Lake if you don't delete it. When you deregister a delegated administrator account for
      # Audit Manager, the data for that account isn’t deleted. If you want to delete resource data for a
      # delegated administrator account, you must perform that task separately before you deregister the
      # account. Either, you can do this in the Audit Manager console. Or, you can use one of the delete API
      # operations that are provided by Audit Manager. To delete your Audit Manager resource data, see the
      # following instructions: DeleteAssessment (see also: Deleting an assessment in the Audit Manager User
      # Guide ) DeleteAssessmentFramework (see also: Deleting a custom framework in the Audit Manager User
      # Guide ) DeleteAssessmentFrameworkShare (see also: Deleting a share request in the Audit Manager User
      # Guide ) DeleteAssessmentReport (see also: Deleting an assessment report in the Audit Manager User
      # Guide ) DeleteControl (see also: Deleting a custom control in the Audit Manager User Guide ) At this
      # time, Audit Manager doesn't provide an option to delete evidence for a specific delegated
      # administrator. Instead, when your management account deregisters Audit Manager, we perform a cleanup
      # for the current delegated administrator account at the time of deregistration.

      def deregister_organization_admin_account(
        admin_account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeregisterOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id)
        deregister_organization_admin_account(input)
      end

      def deregister_organization_admin_account(input : Types::DeregisterOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an evidence folder from the specified assessment report in Audit Manager.

      def disassociate_assessment_report_evidence_folder(
        assessment_id : String,
        evidence_folder_id : String
      ) : Protocol::Request
        input = Types::DisassociateAssessmentReportEvidenceFolderRequest.new(assessment_id: assessment_id, evidence_folder_id: evidence_folder_id)
        disassociate_assessment_report_evidence_folder(input)
      end

      def disassociate_assessment_report_evidence_folder(input : Types::DisassociateAssessmentReportEvidenceFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ASSESSMENT_REPORT_EVIDENCE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the registration status of an account in Audit Manager.

      def get_account_status : Protocol::Request
        input = Types::GetAccountStatusRequest.new
        get_account_status(input)
      end

      def get_account_status(input : Types::GetAccountStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified assessment.

      def get_assessment(
        assessment_id : String
      ) : Protocol::Request
        input = Types::GetAssessmentRequest.new(assessment_id: assessment_id)
        get_assessment(input)
      end

      def get_assessment(input : Types::GetAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified framework.

      def get_assessment_framework(
        framework_id : String
      ) : Protocol::Request
        input = Types::GetAssessmentFrameworkRequest.new(framework_id: framework_id)
        get_assessment_framework(input)
      end

      def get_assessment_framework(input : Types::GetAssessmentFrameworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSESSMENT_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the URL of an assessment report in Audit Manager.

      def get_assessment_report_url(
        assessment_id : String,
        assessment_report_id : String
      ) : Protocol::Request
        input = Types::GetAssessmentReportUrlRequest.new(assessment_id: assessment_id, assessment_report_id: assessment_report_id)
        get_assessment_report_url(input)
      end

      def get_assessment_report_url(input : Types::GetAssessmentReportUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSESSMENT_REPORT_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of changelogs from Audit Manager.

      def get_change_logs(
        assessment_id : String,
        control_id : String? = nil,
        control_set_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetChangeLogsRequest.new(assessment_id: assessment_id, control_id: control_id, control_set_id: control_set_id, max_results: max_results, next_token: next_token)
        get_change_logs(input)
      end

      def get_change_logs(input : Types::GetChangeLogsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANGE_LOGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified control.

      def get_control(
        control_id : String
      ) : Protocol::Request
        input = Types::GetControlRequest.new(control_id: control_id)
        get_control(input)
      end

      def get_control(input : Types::GetControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of delegations from an audit owner to a delegate.

      def get_delegations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDelegationsRequest.new(max_results: max_results, next_token: next_token)
        get_delegations(input)
      end

      def get_delegations(input : Types::GetDelegationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELEGATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified evidence item.

      def get_evidence(
        assessment_id : String,
        control_set_id : String,
        evidence_folder_id : String,
        evidence_id : String
      ) : Protocol::Request
        input = Types::GetEvidenceRequest.new(assessment_id: assessment_id, control_set_id: control_set_id, evidence_folder_id: evidence_folder_id, evidence_id: evidence_id)
        get_evidence(input)
      end

      def get_evidence(input : Types::GetEvidenceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets all evidence from a specified evidence folder in Audit Manager.

      def get_evidence_by_evidence_folder(
        assessment_id : String,
        control_set_id : String,
        evidence_folder_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetEvidenceByEvidenceFolderRequest.new(assessment_id: assessment_id, control_set_id: control_set_id, evidence_folder_id: evidence_folder_id, max_results: max_results, next_token: next_token)
        get_evidence_by_evidence_folder(input)
      end

      def get_evidence_by_evidence_folder(input : Types::GetEvidenceByEvidenceFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE_BY_EVIDENCE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a presigned Amazon S3 URL that can be used to upload a file as manual evidence. For
      # instructions on how to use this operation, see Upload a file from your browser in the Audit Manager
      # User Guide . The following restrictions apply to this operation: Maximum size of an individual
      # evidence file: 100 MB Number of daily manual evidence uploads per control: 100 Supported file
      # formats: See Supported file types for manual evidence in the Audit Manager User Guide For more
      # information about Audit Manager service restrictions, see Quotas and restrictions for Audit Manager
      # .

      def get_evidence_file_upload_url(
        file_name : String
      ) : Protocol::Request
        input = Types::GetEvidenceFileUploadUrlRequest.new(file_name: file_name)
        get_evidence_file_upload_url(input)
      end

      def get_evidence_file_upload_url(input : Types::GetEvidenceFileUploadUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE_FILE_UPLOAD_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an evidence folder from a specified assessment in Audit Manager.

      def get_evidence_folder(
        assessment_id : String,
        control_set_id : String,
        evidence_folder_id : String
      ) : Protocol::Request
        input = Types::GetEvidenceFolderRequest.new(assessment_id: assessment_id, control_set_id: control_set_id, evidence_folder_id: evidence_folder_id)
        get_evidence_folder(input)
      end

      def get_evidence_folder(input : Types::GetEvidenceFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the evidence folders from a specified assessment in Audit Manager.

      def get_evidence_folders_by_assessment(
        assessment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetEvidenceFoldersByAssessmentRequest.new(assessment_id: assessment_id, max_results: max_results, next_token: next_token)
        get_evidence_folders_by_assessment(input)
      end

      def get_evidence_folders_by_assessment(input : Types::GetEvidenceFoldersByAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE_FOLDERS_BY_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of evidence folders that are associated with a specified control in an Audit Manager
      # assessment.

      def get_evidence_folders_by_assessment_control(
        assessment_id : String,
        control_id : String,
        control_set_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetEvidenceFoldersByAssessmentControlRequest.new(assessment_id: assessment_id, control_id: control_id, control_set_id: control_set_id, max_results: max_results, next_token: next_token)
        get_evidence_folders_by_assessment_control(input)
      end

      def get_evidence_folders_by_assessment_control(input : Types::GetEvidenceFoldersByAssessmentControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVIDENCE_FOLDERS_BY_ASSESSMENT_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the latest analytics data for all your current active assessments.

      def get_insights : Protocol::Request
        input = Types::GetInsightsRequest.new
        get_insights(input)
      end

      def get_insights(input : Types::GetInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the latest analytics data for a specific active assessment.

      def get_insights_by_assessment(
        assessment_id : String
      ) : Protocol::Request
        input = Types::GetInsightsByAssessmentRequest.new(assessment_id: assessment_id)
        get_insights_by_assessment(input)
      end

      def get_insights_by_assessment(input : Types::GetInsightsByAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHTS_BY_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the name of the delegated Amazon Web Services administrator account for a specified
      # organization.

      def get_organization_admin_account : Protocol::Request
        input = Types::GetOrganizationAdminAccountRequest.new
        get_organization_admin_account(input)
      end

      def get_organization_admin_account(input : Types::GetOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of the Amazon Web Services services from which Audit Manager can collect evidence. Audit
      # Manager defines which Amazon Web Services services are in scope for an assessment. Audit Manager
      # infers this scope by examining the assessment’s controls and their data sources, and then mapping
      # this information to one or more of the corresponding Amazon Web Services services that are in this
      # list. For information about why it's no longer possible to specify services in scope manually, see I
      # can't edit the services in scope for my assessment in the Troubleshooting section of the Audit
      # Manager user guide.

      def get_services_in_scope : Protocol::Request
        input = Types::GetServicesInScopeRequest.new
        get_services_in_scope(input)
      end

      def get_services_in_scope(input : Types::GetServicesInScopeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICES_IN_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the settings for a specified Amazon Web Services account.

      def get_settings(
        attribute : String
      ) : Protocol::Request
        input = Types::GetSettingsRequest.new(attribute: attribute)
        get_settings(input)
      end

      def get_settings(input : Types::GetSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the latest analytics data for controls within a specific control domain and a specific active
      # assessment. Control insights are listed only if the control belongs to the control domain and
      # assessment that was specified. Moreover, the control must have collected evidence on the lastUpdated
      # date of controlInsightsByAssessment . If neither of these conditions are met, no data is listed for
      # that control.

      def list_assessment_control_insights_by_control_domain(
        assessment_id : String,
        control_domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssessmentControlInsightsByControlDomainRequest.new(assessment_id: assessment_id, control_domain_id: control_domain_id, max_results: max_results, next_token: next_token)
        list_assessment_control_insights_by_control_domain(input)
      end

      def list_assessment_control_insights_by_control_domain(input : Types::ListAssessmentControlInsightsByControlDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSESSMENT_CONTROL_INSIGHTS_BY_CONTROL_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of sent or received share requests for custom frameworks in Audit Manager.

      def list_assessment_framework_share_requests(
        request_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssessmentFrameworkShareRequestsRequest.new(request_type: request_type, max_results: max_results, next_token: next_token)
        list_assessment_framework_share_requests(input)
      end

      def list_assessment_framework_share_requests(input : Types::ListAssessmentFrameworkShareRequestsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSESSMENT_FRAMEWORK_SHARE_REQUESTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the frameworks that are available in the Audit Manager framework library.

      def list_assessment_frameworks(
        framework_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssessmentFrameworksRequest.new(framework_type: framework_type, max_results: max_results, next_token: next_token)
        list_assessment_frameworks(input)
      end

      def list_assessment_frameworks(input : Types::ListAssessmentFrameworksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSESSMENT_FRAMEWORKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of assessment reports created in Audit Manager.

      def list_assessment_reports(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssessmentReportsRequest.new(max_results: max_results, next_token: next_token)
        list_assessment_reports(input)
      end

      def list_assessment_reports(input : Types::ListAssessmentReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSESSMENT_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of current and past assessments from Audit Manager.

      def list_assessments(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListAssessmentsRequest.new(max_results: max_results, next_token: next_token, status: status)
        list_assessments(input)
      end

      def list_assessments(input : Types::ListAssessmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSESSMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the latest analytics data for control domains across all of your active assessments. Audit
      # Manager supports the control domains that are provided by Amazon Web Services Control Catalog. For
      # information about how to find a list of available control domains, see ListDomains in the Amazon Web
      # Services Control Catalog API Reference. A control domain is listed only if at least one of the
      # controls within that domain collected evidence on the lastUpdated date of controlDomainInsights . If
      # this condition isn’t met, no data is listed for that control domain.

      def list_control_domain_insights(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlDomainInsightsRequest.new(max_results: max_results, next_token: next_token)
        list_control_domain_insights(input)
      end

      def list_control_domain_insights(input : Types::ListControlDomainInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_DOMAIN_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists analytics data for control domains within a specified active assessment. Audit Manager
      # supports the control domains that are provided by Amazon Web Services Control Catalog. For
      # information about how to find a list of available control domains, see ListDomains in the Amazon Web
      # Services Control Catalog API Reference. A control domain is listed only if at least one of the
      # controls within that domain collected evidence on the lastUpdated date of controlDomainInsights . If
      # this condition isn’t met, no data is listed for that domain.

      def list_control_domain_insights_by_assessment(
        assessment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlDomainInsightsByAssessmentRequest.new(assessment_id: assessment_id, max_results: max_results, next_token: next_token)
        list_control_domain_insights_by_assessment(input)
      end

      def list_control_domain_insights_by_assessment(input : Types::ListControlDomainInsightsByAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_DOMAIN_INSIGHTS_BY_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the latest analytics data for controls within a specific control domain across all active
      # assessments. Control insights are listed only if the control belongs to the control domain that was
      # specified and the control collected evidence on the lastUpdated date of controlInsightsMetadata . If
      # neither of these conditions are met, no data is listed for that control.

      def list_control_insights_by_control_domain(
        control_domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlInsightsByControlDomainRequest.new(control_domain_id: control_domain_id, max_results: max_results, next_token: next_token)
        list_control_insights_by_control_domain(input)
      end

      def list_control_insights_by_control_domain(input : Types::ListControlInsightsByControlDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROL_INSIGHTS_BY_CONTROL_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of controls from Audit Manager.

      def list_controls(
        control_type : String,
        control_catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListControlsRequest.new(control_type: control_type, control_catalog_id: control_catalog_id, max_results: max_results, next_token: next_token)
        list_controls(input)
      end

      def list_controls(input : Types::ListControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of keywords that are pre-mapped to the specified control data source.

      def list_keywords_for_data_source(
        source : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKeywordsForDataSourceRequest.new(source: source, max_results: max_results, next_token: next_token)
        list_keywords_for_data_source(input)
      end

      def list_keywords_for_data_source(input : Types::ListKeywordsForDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KEYWORDS_FOR_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all Audit Manager notifications.

      def list_notifications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationsRequest.new(max_results: max_results, next_token: next_token)
        list_notifications(input)
      end

      def list_notifications(input : Types::ListNotificationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for the specified resource in Audit Manager.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables Audit Manager for the specified Amazon Web Services account.

      def register_account(
        delegated_admin_account : String? = nil,
        kms_key : String? = nil
      ) : Protocol::Request
        input = Types::RegisterAccountRequest.new(delegated_admin_account: delegated_admin_account, kms_key: kms_key)
        register_account(input)
      end

      def register_account(input : Types::RegisterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables an Amazon Web Services account within the organization as the delegated administrator for
      # Audit Manager.

      def register_organization_admin_account(
        admin_account_id : String
      ) : Protocol::Request
        input = Types::RegisterOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id)
        register_organization_admin_account(input)
      end

      def register_organization_admin_account(input : Types::RegisterOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a share request for a custom framework in Audit Manager. The share request specifies a
      # recipient and notifies them that a custom framework is available. Recipients have 120 days to accept
      # or decline the request. If no action is taken, the share request expires. When you create a share
      # request, Audit Manager stores a snapshot of your custom framework in the US East (N. Virginia)
      # Amazon Web Services Region. Audit Manager also stores a backup of the same snapshot in the US West
      # (Oregon) Amazon Web Services Region. Audit Manager deletes the snapshot and the backup snapshot when
      # one of the following events occurs: The sender revokes the share request. The recipient declines the
      # share request. The recipient encounters an error and doesn't successfully accept the share request.
      # The share request expires before the recipient responds to the request. When a sender resends a
      # share request , the snapshot is replaced with an updated version that corresponds with the latest
      # version of the custom framework. When a recipient accepts a share request, the snapshot is
      # replicated into their Amazon Web Services account under the Amazon Web Services Region that was
      # specified in the share request. When you invoke the StartAssessmentFrameworkShare API, you are about
      # to share a custom framework with another Amazon Web Services account. You may not share a custom
      # framework that is derived from a standard framework if the standard framework is designated as not
      # eligible for sharing by Amazon Web Services, unless you have obtained permission to do so from the
      # owner of the standard framework. To learn more about which standard frameworks are eligible for
      # sharing, see Framework sharing eligibility in the Audit Manager User Guide .

      def start_assessment_framework_share(
        destination_account : String,
        destination_region : String,
        framework_id : String,
        comment : String? = nil
      ) : Protocol::Request
        input = Types::StartAssessmentFrameworkShareRequest.new(destination_account: destination_account, destination_region: destination_region, framework_id: framework_id, comment: comment)
        start_assessment_framework_share(input)
      end

      def start_assessment_framework_share(input : Types::StartAssessmentFrameworkShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ASSESSMENT_FRAMEWORK_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags the specified resource in Audit Manager.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a resource in Audit Manager.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Edits an Audit Manager assessment.

      def update_assessment(
        assessment_id : String,
        scope : Types::Scope,
        assessment_description : String? = nil,
        assessment_name : String? = nil,
        assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
        roles : Array(Types::Role)? = nil
      ) : Protocol::Request
        input = Types::UpdateAssessmentRequest.new(assessment_id: assessment_id, scope: scope, assessment_description: assessment_description, assessment_name: assessment_name, assessment_reports_destination: assessment_reports_destination, roles: roles)
        update_assessment(input)
      end

      def update_assessment(input : Types::UpdateAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a control within an assessment in Audit Manager.

      def update_assessment_control(
        assessment_id : String,
        control_id : String,
        control_set_id : String,
        comment_body : String? = nil,
        control_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssessmentControlRequest.new(assessment_id: assessment_id, control_id: control_id, control_set_id: control_set_id, comment_body: comment_body, control_status: control_status)
        update_assessment_control(input)
      end

      def update_assessment_control(input : Types::UpdateAssessmentControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of a control set in an Audit Manager assessment.

      def update_assessment_control_set_status(
        assessment_id : String,
        comment : String,
        control_set_id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateAssessmentControlSetStatusRequest.new(assessment_id: assessment_id, comment: comment, control_set_id: control_set_id, status: status)
        update_assessment_control_set_status(input)
      end

      def update_assessment_control_set_status(input : Types::UpdateAssessmentControlSetStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT_CONTROL_SET_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom framework in Audit Manager.

      def update_assessment_framework(
        control_sets : Array(Types::UpdateAssessmentFrameworkControlSet),
        framework_id : String,
        name : String,
        compliance_type : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssessmentFrameworkRequest.new(control_sets: control_sets, framework_id: framework_id, name: name, compliance_type: compliance_type, description: description)
        update_assessment_framework(input)
      end

      def update_assessment_framework(input : Types::UpdateAssessmentFrameworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT_FRAMEWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a share request for a custom framework in Audit Manager.

      def update_assessment_framework_share(
        action : String,
        request_id : String,
        request_type : String
      ) : Protocol::Request
        input = Types::UpdateAssessmentFrameworkShareRequest.new(action: action, request_id: request_id, request_type: request_type)
        update_assessment_framework_share(input)
      end

      def update_assessment_framework_share(input : Types::UpdateAssessmentFrameworkShareRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT_FRAMEWORK_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of an assessment in Audit Manager.

      def update_assessment_status(
        assessment_id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateAssessmentStatusRequest.new(assessment_id: assessment_id, status: status)
        update_assessment_status(input)
      end

      def update_assessment_status(input : Types::UpdateAssessmentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSESSMENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom control in Audit Manager.

      def update_control(
        control_id : String,
        control_mapping_sources : Array(Types::ControlMappingSource),
        name : String,
        action_plan_instructions : String? = nil,
        action_plan_title : String? = nil,
        description : String? = nil,
        testing_information : String? = nil
      ) : Protocol::Request
        input = Types::UpdateControlRequest.new(control_id: control_id, control_mapping_sources: control_mapping_sources, name: name, action_plan_instructions: action_plan_instructions, action_plan_title: action_plan_title, description: description, testing_information: testing_information)
        update_control(input)
      end

      def update_control(input : Types::UpdateControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates Audit Manager settings for the current account.

      def update_settings(
        default_assessment_reports_destination : Types::AssessmentReportsDestination? = nil,
        default_export_destination : Types::DefaultExportDestination? = nil,
        default_process_owners : Array(Types::Role)? = nil,
        deregistration_policy : Types::DeregistrationPolicy? = nil,
        evidence_finder_enabled : Bool? = nil,
        kms_key : String? = nil,
        sns_topic : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSettingsRequest.new(default_assessment_reports_destination: default_assessment_reports_destination, default_export_destination: default_export_destination, default_process_owners: default_process_owners, deregistration_policy: deregistration_policy, evidence_finder_enabled: evidence_finder_enabled, kms_key: kms_key, sns_topic: sns_topic)
        update_settings(input)
      end

      def update_settings(input : Types::UpdateSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates the integrity of an assessment report in Audit Manager.

      def validate_assessment_report_integrity(
        s3_relative_path : String
      ) : Protocol::Request
        input = Types::ValidateAssessmentReportIntegrityRequest.new(s3_relative_path: s3_relative_path)
        validate_assessment_report_integrity(input)
      end

      def validate_assessment_report_integrity(input : Types::ValidateAssessmentReportIntegrityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_ASSESSMENT_REPORT_INTEGRITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
