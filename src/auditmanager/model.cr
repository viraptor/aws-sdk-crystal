module Aws
  module AuditManager
    module Model
      API_VERSION = "2017-07-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "auditmanager"
      ENDPOINT_PREFIX = "auditmanager"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://auditmanager-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://auditmanager-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://auditmanager.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://auditmanager.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ASSESSMENT_REPORT_EVIDENCE_FOLDER = OperationModel.new(
        name: "AssociateAssessmentReportEvidenceFolder",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/associateToAssessmentReport"
      )

      BATCH_ASSOCIATE_ASSESSMENT_REPORT_EVIDENCE = OperationModel.new(
        name: "BatchAssociateAssessmentReportEvidence",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/batchAssociateToAssessmentReport"
      )

      BATCH_CREATE_DELEGATION_BY_ASSESSMENT = OperationModel.new(
        name: "BatchCreateDelegationByAssessment",
        http_method: "POST",
        request_uri: "/assessments/{assessmentId}/delegations"
      )

      BATCH_DELETE_DELEGATION_BY_ASSESSMENT = OperationModel.new(
        name: "BatchDeleteDelegationByAssessment",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/delegations"
      )

      BATCH_DISASSOCIATE_ASSESSMENT_REPORT_EVIDENCE = OperationModel.new(
        name: "BatchDisassociateAssessmentReportEvidence",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/batchDisassociateFromAssessmentReport"
      )

      BATCH_IMPORT_EVIDENCE_TO_ASSESSMENT_CONTROL = OperationModel.new(
        name: "BatchImportEvidenceToAssessmentControl",
        http_method: "POST",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/controls/{controlId}/evidence"
      )

      CREATE_ASSESSMENT = OperationModel.new(
        name: "CreateAssessment",
        http_method: "POST",
        request_uri: "/assessments"
      )

      CREATE_ASSESSMENT_FRAMEWORK = OperationModel.new(
        name: "CreateAssessmentFramework",
        http_method: "POST",
        request_uri: "/assessmentFrameworks"
      )

      CREATE_ASSESSMENT_REPORT = OperationModel.new(
        name: "CreateAssessmentReport",
        http_method: "POST",
        request_uri: "/assessments/{assessmentId}/reports"
      )

      CREATE_CONTROL = OperationModel.new(
        name: "CreateControl",
        http_method: "POST",
        request_uri: "/controls"
      )

      DELETE_ASSESSMENT = OperationModel.new(
        name: "DeleteAssessment",
        http_method: "DELETE",
        request_uri: "/assessments/{assessmentId}"
      )

      DELETE_ASSESSMENT_FRAMEWORK = OperationModel.new(
        name: "DeleteAssessmentFramework",
        http_method: "DELETE",
        request_uri: "/assessmentFrameworks/{frameworkId}"
      )

      DELETE_ASSESSMENT_FRAMEWORK_SHARE = OperationModel.new(
        name: "DeleteAssessmentFrameworkShare",
        http_method: "DELETE",
        request_uri: "/assessmentFrameworkShareRequests/{requestId}"
      )

      DELETE_ASSESSMENT_REPORT = OperationModel.new(
        name: "DeleteAssessmentReport",
        http_method: "DELETE",
        request_uri: "/assessments/{assessmentId}/reports/{assessmentReportId}"
      )

      DELETE_CONTROL = OperationModel.new(
        name: "DeleteControl",
        http_method: "DELETE",
        request_uri: "/controls/{controlId}"
      )

      DEREGISTER_ACCOUNT = OperationModel.new(
        name: "DeregisterAccount",
        http_method: "POST",
        request_uri: "/account/deregisterAccount"
      )

      DEREGISTER_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DeregisterOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/account/deregisterOrganizationAdminAccount"
      )

      DISASSOCIATE_ASSESSMENT_REPORT_EVIDENCE_FOLDER = OperationModel.new(
        name: "DisassociateAssessmentReportEvidenceFolder",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/disassociateFromAssessmentReport"
      )

      GET_ACCOUNT_STATUS = OperationModel.new(
        name: "GetAccountStatus",
        http_method: "GET",
        request_uri: "/account/status"
      )

      GET_ASSESSMENT = OperationModel.new(
        name: "GetAssessment",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}"
      )

      GET_ASSESSMENT_FRAMEWORK = OperationModel.new(
        name: "GetAssessmentFramework",
        http_method: "GET",
        request_uri: "/assessmentFrameworks/{frameworkId}"
      )

      GET_ASSESSMENT_REPORT_URL = OperationModel.new(
        name: "GetAssessmentReportUrl",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/reports/{assessmentReportId}/url"
      )

      GET_CHANGE_LOGS = OperationModel.new(
        name: "GetChangeLogs",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/changelogs"
      )

      GET_CONTROL = OperationModel.new(
        name: "GetControl",
        http_method: "GET",
        request_uri: "/controls/{controlId}"
      )

      GET_DELEGATIONS = OperationModel.new(
        name: "GetDelegations",
        http_method: "GET",
        request_uri: "/delegations"
      )

      GET_EVIDENCE = OperationModel.new(
        name: "GetEvidence",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/evidenceFolders/{evidenceFolderId}/evidence/{evidenceId}"
      )

      GET_EVIDENCE_BY_EVIDENCE_FOLDER = OperationModel.new(
        name: "GetEvidenceByEvidenceFolder",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/evidenceFolders/{evidenceFolderId}/evidence"
      )

      GET_EVIDENCE_FILE_UPLOAD_URL = OperationModel.new(
        name: "GetEvidenceFileUploadUrl",
        http_method: "GET",
        request_uri: "/evidenceFileUploadUrl"
      )

      GET_EVIDENCE_FOLDER = OperationModel.new(
        name: "GetEvidenceFolder",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/evidenceFolders/{evidenceFolderId}"
      )

      GET_EVIDENCE_FOLDERS_BY_ASSESSMENT = OperationModel.new(
        name: "GetEvidenceFoldersByAssessment",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/evidenceFolders"
      )

      GET_EVIDENCE_FOLDERS_BY_ASSESSMENT_CONTROL = OperationModel.new(
        name: "GetEvidenceFoldersByAssessmentControl",
        http_method: "GET",
        request_uri: "/assessments/{assessmentId}/evidenceFolders-by-assessment-control/{controlSetId}/{controlId}"
      )

      GET_INSIGHTS = OperationModel.new(
        name: "GetInsights",
        http_method: "GET",
        request_uri: "/insights"
      )

      GET_INSIGHTS_BY_ASSESSMENT = OperationModel.new(
        name: "GetInsightsByAssessment",
        http_method: "GET",
        request_uri: "/insights/assessments/{assessmentId}"
      )

      GET_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "GetOrganizationAdminAccount",
        http_method: "GET",
        request_uri: "/account/organizationAdminAccount"
      )

      GET_SERVICES_IN_SCOPE = OperationModel.new(
        name: "GetServicesInScope",
        http_method: "GET",
        request_uri: "/services"
      )

      GET_SETTINGS = OperationModel.new(
        name: "GetSettings",
        http_method: "GET",
        request_uri: "/settings/{attribute}"
      )

      LIST_ASSESSMENT_CONTROL_INSIGHTS_BY_CONTROL_DOMAIN = OperationModel.new(
        name: "ListAssessmentControlInsightsByControlDomain",
        http_method: "GET",
        request_uri: "/insights/controls-by-assessment"
      )

      LIST_ASSESSMENT_FRAMEWORK_SHARE_REQUESTS = OperationModel.new(
        name: "ListAssessmentFrameworkShareRequests",
        http_method: "GET",
        request_uri: "/assessmentFrameworkShareRequests"
      )

      LIST_ASSESSMENT_FRAMEWORKS = OperationModel.new(
        name: "ListAssessmentFrameworks",
        http_method: "GET",
        request_uri: "/assessmentFrameworks"
      )

      LIST_ASSESSMENT_REPORTS = OperationModel.new(
        name: "ListAssessmentReports",
        http_method: "GET",
        request_uri: "/assessmentReports"
      )

      LIST_ASSESSMENTS = OperationModel.new(
        name: "ListAssessments",
        http_method: "GET",
        request_uri: "/assessments"
      )

      LIST_CONTROL_DOMAIN_INSIGHTS = OperationModel.new(
        name: "ListControlDomainInsights",
        http_method: "GET",
        request_uri: "/insights/control-domains"
      )

      LIST_CONTROL_DOMAIN_INSIGHTS_BY_ASSESSMENT = OperationModel.new(
        name: "ListControlDomainInsightsByAssessment",
        http_method: "GET",
        request_uri: "/insights/control-domains-by-assessment"
      )

      LIST_CONTROL_INSIGHTS_BY_CONTROL_DOMAIN = OperationModel.new(
        name: "ListControlInsightsByControlDomain",
        http_method: "GET",
        request_uri: "/insights/controls"
      )

      LIST_CONTROLS = OperationModel.new(
        name: "ListControls",
        http_method: "GET",
        request_uri: "/controls"
      )

      LIST_KEYWORDS_FOR_DATA_SOURCE = OperationModel.new(
        name: "ListKeywordsForDataSource",
        http_method: "GET",
        request_uri: "/dataSourceKeywords"
      )

      LIST_NOTIFICATIONS = OperationModel.new(
        name: "ListNotifications",
        http_method: "GET",
        request_uri: "/notifications"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      REGISTER_ACCOUNT = OperationModel.new(
        name: "RegisterAccount",
        http_method: "POST",
        request_uri: "/account/registerAccount"
      )

      REGISTER_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "RegisterOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/account/registerOrganizationAdminAccount"
      )

      START_ASSESSMENT_FRAMEWORK_SHARE = OperationModel.new(
        name: "StartAssessmentFrameworkShare",
        http_method: "POST",
        request_uri: "/assessmentFrameworks/{frameworkId}/shareRequests"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_ASSESSMENT = OperationModel.new(
        name: "UpdateAssessment",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}"
      )

      UPDATE_ASSESSMENT_CONTROL = OperationModel.new(
        name: "UpdateAssessmentControl",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/controls/{controlId}"
      )

      UPDATE_ASSESSMENT_CONTROL_SET_STATUS = OperationModel.new(
        name: "UpdateAssessmentControlSetStatus",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/controlSets/{controlSetId}/status"
      )

      UPDATE_ASSESSMENT_FRAMEWORK = OperationModel.new(
        name: "UpdateAssessmentFramework",
        http_method: "PUT",
        request_uri: "/assessmentFrameworks/{frameworkId}"
      )

      UPDATE_ASSESSMENT_FRAMEWORK_SHARE = OperationModel.new(
        name: "UpdateAssessmentFrameworkShare",
        http_method: "PUT",
        request_uri: "/assessmentFrameworkShareRequests/{requestId}"
      )

      UPDATE_ASSESSMENT_STATUS = OperationModel.new(
        name: "UpdateAssessmentStatus",
        http_method: "PUT",
        request_uri: "/assessments/{assessmentId}/status"
      )

      UPDATE_CONTROL = OperationModel.new(
        name: "UpdateControl",
        http_method: "PUT",
        request_uri: "/controls/{controlId}"
      )

      UPDATE_SETTINGS = OperationModel.new(
        name: "UpdateSettings",
        http_method: "PUT",
        request_uri: "/settings"
      )

      VALIDATE_ASSESSMENT_REPORT_INTEGRITY = OperationModel.new(
        name: "ValidateAssessmentReportIntegrity",
        http_method: "POST",
        request_uri: "/assessmentReports/integrity"
      )
    end
  end
end
