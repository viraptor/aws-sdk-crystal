module AwsSdk
  module Inspector2
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates an Amazon Web Services account with an Amazon Inspector delegated administrator. An HTTP
      # 200 response indicates the association was successfully started, but doesn’t indicate whether it was
      # completed. You can check if the association completed by using ListMembers for multiple accounts or
      # GetMembers for a single account.
      def associate_member(
        account_id : String
      ) : Protocol::Request
        input = Types::AssociateMemberRequest.new(account_id: account_id)
        associate_member(input)
      end
      def associate_member(input : Types::AssociateMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates multiple code repositories with an Amazon Inspector code security scan configuration.
      def batch_associate_code_security_scan_configuration(
        associate_configuration_requests : Array(Types::AssociateConfigurationRequest)
      ) : Protocol::Request
        input = Types::BatchAssociateCodeSecurityScanConfigurationRequest.new(associate_configuration_requests: associate_configuration_requests)
        batch_associate_code_security_scan_configuration(input)
      end
      def batch_associate_code_security_scan_configuration(input : Types::BatchAssociateCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates multiple code repositories from an Amazon Inspector code security scan configuration.
      def batch_disassociate_code_security_scan_configuration(
        disassociate_configuration_requests : Array(Types::DisassociateConfigurationRequest)
      ) : Protocol::Request
        input = Types::BatchDisassociateCodeSecurityScanConfigurationRequest.new(disassociate_configuration_requests: disassociate_configuration_requests)
        batch_disassociate_code_security_scan_configuration(input)
      end
      def batch_disassociate_code_security_scan_configuration(input : Types::BatchDisassociateCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the Amazon Inspector status of multiple Amazon Web Services accounts within your
      # environment.
      def batch_get_account_status(
        account_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchGetAccountStatusRequest.new(account_ids: account_ids)
        batch_get_account_status(input)
      end
      def batch_get_account_status(input : Types::BatchGetAccountStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ACCOUNT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves code snippets from findings that Amazon Inspector detected code vulnerabilities in.
      def batch_get_code_snippet(
        finding_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetCodeSnippetRequest.new(finding_arns: finding_arns)
        batch_get_code_snippet(input)
      end
      def batch_get_code_snippet(input : Types::BatchGetCodeSnippetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CODE_SNIPPET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets vulnerability details for findings.
      def batch_get_finding_details(
        finding_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetFindingDetailsRequest.new(finding_arns: finding_arns)
        batch_get_finding_details(input)
      end
      def batch_get_finding_details(input : Types::BatchGetFindingDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_FINDING_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets free trial status for multiple Amazon Web Services accounts.
      def batch_get_free_trial_info(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetFreeTrialInfoRequest.new(account_ids: account_ids)
        batch_get_free_trial_info(input)
      end
      def batch_get_free_trial_info(input : Types::BatchGetFreeTrialInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_FREE_TRIAL_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves Amazon Inspector deep inspection activation status of multiple member accounts within your
      # organization. You must be the delegated administrator of an organization in Amazon Inspector to use
      # this API.
      def batch_get_member_ec2_deep_inspection_status(
        account_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchGetMemberEc2DeepInspectionStatusRequest.new(account_ids: account_ids)
        batch_get_member_ec2_deep_inspection_status(input)
      end
      def batch_get_member_ec2_deep_inspection_status(input : Types::BatchGetMemberEc2DeepInspectionStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_MEMBER_EC2_DEEP_INSPECTION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Activates or deactivates Amazon Inspector deep inspection for the provided member accounts in your
      # organization. You must be the delegated administrator of an organization in Amazon Inspector to use
      # this API.
      def batch_update_member_ec2_deep_inspection_status(
        account_ids : Array(Types::MemberAccountEc2DeepInspectionStatus)
      ) : Protocol::Request
        input = Types::BatchUpdateMemberEc2DeepInspectionStatusRequest.new(account_ids: account_ids)
        batch_update_member_ec2_deep_inspection_status(input)
      end
      def batch_update_member_ec2_deep_inspection_status(input : Types::BatchUpdateMemberEc2DeepInspectionStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_MEMBER_EC2_DEEP_INSPECTION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the given findings report.
      def cancel_findings_report(
        report_id : String
      ) : Protocol::Request
        input = Types::CancelFindingsReportRequest.new(report_id: report_id)
        cancel_findings_report(input)
      end
      def cancel_findings_report(input : Types::CancelFindingsReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_FINDINGS_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a software bill of materials (SBOM) report.
      def cancel_sbom_export(
        report_id : String
      ) : Protocol::Request
        input = Types::CancelSbomExportRequest.new(report_id: report_id)
        cancel_sbom_export(input)
      end
      def cancel_sbom_export(input : Types::CancelSbomExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SBOM_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a CIS scan configuration.
      def create_cis_scan_configuration(
        scan_name : String,
        schedule : Types::Schedule,
        security_level : String,
        targets : Types::CreateCisTargets,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCisScanConfigurationRequest.new(scan_name: scan_name, schedule: schedule, security_level: security_level, targets: targets, tags: tags)
        create_cis_scan_configuration(input)
      end
      def create_cis_scan_configuration(input : Types::CreateCisScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CIS_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a code security integration with a source code repository provider. After calling the
      # CreateCodeSecurityIntegration operation, you complete authentication and authorization with your
      # provider. Next you call the UpdateCodeSecurityIntegration operation to provide the details to
      # complete the integration setup
      def create_code_security_integration(
        name : String,
        type : String,
        details : Types::CreateIntegrationDetail? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCodeSecurityIntegrationRequest.new(name: name, type: type, details: details, tags: tags)
        create_code_security_integration(input)
      end
      def create_code_security_integration(input : Types::CreateCodeSecurityIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CODE_SECURITY_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a scan configuration for code security scanning.
      def create_code_security_scan_configuration(
        configuration : Types::CodeSecurityScanConfiguration,
        level : String,
        name : String,
        scope_settings : Types::ScopeSettings? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCodeSecurityScanConfigurationRequest.new(configuration: configuration, level: level, name: name, scope_settings: scope_settings, tags: tags)
        create_code_security_scan_configuration(input)
      end
      def create_code_security_scan_configuration(input : Types::CreateCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a filter resource using specified filter criteria. When the filter action is set to SUPPRESS
      # this action creates a suppression rule.
      def create_filter(
        action : String,
        filter_criteria : Types::FilterCriteria,
        name : String,
        description : String? = nil,
        reason : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFilterRequest.new(action: action, filter_criteria: filter_criteria, name: name, description: description, reason: reason, tags: tags)
        create_filter(input)
      end
      def create_filter(input : Types::CreateFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a finding report. By default only ACTIVE findings are returned in the report. To see
      # SUPRESSED or CLOSED findings you must specify a value for the findingStatus filter criteria.
      def create_findings_report(
        report_format : String,
        s3_destination : Types::Destination,
        filter_criteria : Types::FilterCriteria? = nil
      ) : Protocol::Request
        input = Types::CreateFindingsReportRequest.new(report_format: report_format, s3_destination: s3_destination, filter_criteria: filter_criteria)
        create_findings_report(input)
      end
      def create_findings_report(input : Types::CreateFindingsReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FINDINGS_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a software bill of materials (SBOM) report.
      def create_sbom_export(
        report_format : String,
        s3_destination : Types::Destination,
        resource_filter_criteria : Types::ResourceFilterCriteria? = nil
      ) : Protocol::Request
        input = Types::CreateSbomExportRequest.new(report_format: report_format, s3_destination: s3_destination, resource_filter_criteria: resource_filter_criteria)
        create_sbom_export(input)
      end
      def create_sbom_export(input : Types::CreateSbomExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SBOM_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a CIS scan configuration.
      def delete_cis_scan_configuration(
        scan_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteCisScanConfigurationRequest.new(scan_configuration_arn: scan_configuration_arn)
        delete_cis_scan_configuration(input)
      end
      def delete_cis_scan_configuration(input : Types::DeleteCisScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CIS_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a code security integration.
      def delete_code_security_integration(
        integration_arn : String
      ) : Protocol::Request
        input = Types::DeleteCodeSecurityIntegrationRequest.new(integration_arn: integration_arn)
        delete_code_security_integration(input)
      end
      def delete_code_security_integration(input : Types::DeleteCodeSecurityIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CODE_SECURITY_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a code security scan configuration.
      def delete_code_security_scan_configuration(
        scan_configuration_arn : String
      ) : Protocol::Request
        input = Types::DeleteCodeSecurityScanConfigurationRequest.new(scan_configuration_arn: scan_configuration_arn)
        delete_code_security_scan_configuration(input)
      end
      def delete_code_security_scan_configuration(input : Types::DeleteCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a filter resource.
      def delete_filter(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteFilterRequest.new(arn: arn)
        delete_filter(input)
      end
      def delete_filter(input : Types::DeleteFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe Amazon Inspector configuration settings for an Amazon Web Services organization.
      def describe_organization_configuration : Protocol::Request
        input = Types::DescribeOrganizationConfigurationRequest.new
        describe_organization_configuration(input)
      end
      def describe_organization_configuration(input : Types::DescribeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables Amazon Inspector scans for one or more Amazon Web Services accounts. Disabling all scan
      # types in an account disables the Amazon Inspector service.
      def disable(
        account_ids : Array(String)? = nil,
        resource_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DisableRequest.new(account_ids: account_ids, resource_types: resource_types)
        disable(input)
      end
      def disable(input : Types::DisableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the Amazon Inspector delegated administrator for your organization.
      def disable_delegated_admin_account(
        delegated_admin_account_id : String
      ) : Protocol::Request
        input = Types::DisableDelegatedAdminAccountRequest.new(delegated_admin_account_id: delegated_admin_account_id)
        disable_delegated_admin_account(input)
      end
      def disable_delegated_admin_account(input : Types::DisableDelegatedAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_DELEGATED_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member account from an Amazon Inspector delegated administrator.
      def disassociate_member(
        account_id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberRequest.new(account_id: account_id)
        disassociate_member(input)
      end
      def disassociate_member(input : Types::DisassociateMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables Amazon Inspector scans for one or more Amazon Web Services accounts.
      def enable(
        resource_types : Array(String),
        account_ids : Array(String)? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::EnableRequest.new(resource_types: resource_types, account_ids: account_ids, client_token: client_token)
        enable(input)
      end
      def enable(input : Types::EnableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the Amazon Inspector delegated administrator for your Organizations organization.
      def enable_delegated_admin_account(
        delegated_admin_account_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::EnableDelegatedAdminAccountRequest.new(delegated_admin_account_id: delegated_admin_account_id, client_token: client_token)
        enable_delegated_admin_account(input)
      end
      def enable_delegated_admin_account(input : Types::EnableDelegatedAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_DELEGATED_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a CIS scan report.
      def get_cis_scan_report(
        scan_arn : String,
        report_format : String? = nil,
        target_accounts : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetCisScanReportRequest.new(scan_arn: scan_arn, report_format: report_format, target_accounts: target_accounts)
        get_cis_scan_report(input)
      end
      def get_cis_scan_report(input : Types::GetCisScanReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CIS_SCAN_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves CIS scan result details.
      def get_cis_scan_result_details(
        account_id : String,
        scan_arn : String,
        target_resource_id : String,
        filter_criteria : Types::CisScanResultDetailsFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::GetCisScanResultDetailsRequest.new(account_id: account_id, scan_arn: scan_arn, target_resource_id: target_resource_id, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        get_cis_scan_result_details(input)
      end
      def get_cis_scan_result_details(input : Types::GetCisScanResultDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CIS_SCAN_RESULT_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of clusters and metadata associated with an image.
      def get_clusters_for_image(
        filter : Types::ClusterForImageFilterCriteria,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetClustersForImageRequest.new(filter: filter, max_results: max_results, next_token: next_token)
        get_clusters_for_image(input)
      end
      def get_clusters_for_image(input : Types::GetClustersForImageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTERS_FOR_IMAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a code security integration.
      def get_code_security_integration(
        integration_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::GetCodeSecurityIntegrationRequest.new(integration_arn: integration_arn, tags: tags)
        get_code_security_integration(input)
      end
      def get_code_security_integration(input : Types::GetCodeSecurityIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_SECURITY_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific code security scan.
      def get_code_security_scan(
        resource : Types::CodeSecurityResource,
        scan_id : String
      ) : Protocol::Request
        input = Types::GetCodeSecurityScanRequest.new(resource: resource, scan_id: scan_id)
        get_code_security_scan(input)
      end
      def get_code_security_scan(input : Types::GetCodeSecurityScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_SECURITY_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a code security scan configuration.
      def get_code_security_scan_configuration(
        scan_configuration_arn : String
      ) : Protocol::Request
        input = Types::GetCodeSecurityScanConfigurationRequest.new(scan_configuration_arn: scan_configuration_arn)
        get_code_security_scan_configuration(input)
      end
      def get_code_security_scan_configuration(input : Types::GetCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves setting configurations for Inspector scans.
      def get_configuration : Protocol::Request
        input = Types::GetConfigurationRequest.new
        get_configuration(input)
      end
      def get_configuration(input : Types::GetConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the Amazon Inspector delegated administrator for your organization.
      def get_delegated_admin_account : Protocol::Request
        input = Types::GetDelegatedAdminAccountRequest.new
        get_delegated_admin_account(input)
      end
      def get_delegated_admin_account(input : Types::GetDelegatedAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELEGATED_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the activation status of Amazon Inspector deep inspection and custom paths associated with
      # your account.
      def get_ec2_deep_inspection_configuration : Protocol::Request
        input = Types::GetEc2DeepInspectionConfigurationRequest.new
        get_ec2_deep_inspection_configuration(input)
      end
      def get_ec2_deep_inspection_configuration(input : Types::GetEc2DeepInspectionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EC2_DEEP_INSPECTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an encryption key.
      def get_encryption_key(
        resource_type : String,
        scan_type : String
      ) : Protocol::Request
        input = Types::GetEncryptionKeyRequest.new(resource_type: resource_type, scan_type: scan_type)
        get_encryption_key(input)
      end
      def get_encryption_key(input : Types::GetEncryptionKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENCRYPTION_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the status of a findings report.
      def get_findings_report_status(
        report_id : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingsReportStatusRequest.new(report_id: report_id)
        get_findings_report_status(input)
      end
      def get_findings_report_status(input : Types::GetFindingsReportStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_REPORT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets member information for your organization.
      def get_member(
        account_id : String
      ) : Protocol::Request
        input = Types::GetMemberRequest.new(account_id: account_id)
        get_member(input)
      end
      def get_member(input : Types::GetMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details of a software bill of materials (SBOM) report.
      def get_sbom_export(
        report_id : String
      ) : Protocol::Request
        input = Types::GetSbomExportRequest.new(report_id: report_id)
        get_sbom_export(input)
      end
      def get_sbom_export(input : Types::GetSbomExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SBOM_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the permissions an account has to configure Amazon Inspector. If the account is a member
      # account or standalone account with resources managed by an Organizations policy, the operation
      # returns fewer permissions.
      def list_account_permissions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountPermissionsRequest.new(max_results: max_results, next_token: next_token, service: service)
        list_account_permissions(input)
      end
      def list_account_permissions(input : Types::ListAccountPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists CIS scan configurations.
      def list_cis_scan_configurations(
        filter_criteria : Types::ListCisScanConfigurationsFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCisScanConfigurationsRequest.new(filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_cis_scan_configurations(input)
      end
      def list_cis_scan_configurations(input : Types::ListCisScanConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CIS_SCAN_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists scan results aggregated by checks.
      def list_cis_scan_results_aggregated_by_checks(
        scan_arn : String,
        filter_criteria : Types::CisScanResultsAggregatedByChecksFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCisScanResultsAggregatedByChecksRequest.new(scan_arn: scan_arn, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_cis_scan_results_aggregated_by_checks(input)
      end
      def list_cis_scan_results_aggregated_by_checks(input : Types::ListCisScanResultsAggregatedByChecksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CIS_SCAN_RESULTS_AGGREGATED_BY_CHECKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists scan results aggregated by a target resource.
      def list_cis_scan_results_aggregated_by_target_resource(
        scan_arn : String,
        filter_criteria : Types::CisScanResultsAggregatedByTargetResourceFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCisScanResultsAggregatedByTargetResourceRequest.new(scan_arn: scan_arn, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_cis_scan_results_aggregated_by_target_resource(input)
      end
      def list_cis_scan_results_aggregated_by_target_resource(input : Types::ListCisScanResultsAggregatedByTargetResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CIS_SCAN_RESULTS_AGGREGATED_BY_TARGET_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a CIS scan list.
      def list_cis_scans(
        detail_level : String? = nil,
        filter_criteria : Types::ListCisScansFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListCisScansRequest.new(detail_level: detail_level, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_cis_scans(input)
      end
      def list_cis_scans(input : Types::ListCisScansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CIS_SCANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all code security integrations in your account.
      def list_code_security_integrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCodeSecurityIntegrationsRequest.new(max_results: max_results, next_token: next_token)
        list_code_security_integrations(input)
      end
      def list_code_security_integrations(input : Types::ListCodeSecurityIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_SECURITY_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the associations between code repositories and Amazon Inspector code security scan
      # configurations.
      def list_code_security_scan_configuration_associations(
        scan_configuration_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCodeSecurityScanConfigurationAssociationsRequest.new(scan_configuration_arn: scan_configuration_arn, max_results: max_results, next_token: next_token)
        list_code_security_scan_configuration_associations(input)
      end
      def list_code_security_scan_configuration_associations(input : Types::ListCodeSecurityScanConfigurationAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_SECURITY_SCAN_CONFIGURATION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all code security scan configurations in your account.
      def list_code_security_scan_configurations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCodeSecurityScanConfigurationsRequest.new(max_results: max_results, next_token: next_token)
        list_code_security_scan_configurations(input)
      end
      def list_code_security_scan_configurations(input : Types::ListCodeSecurityScanConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_SECURITY_SCAN_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists coverage details for your environment.
      def list_coverage(
        filter_criteria : Types::CoverageFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoverageRequest.new(filter_criteria: filter_criteria, max_results: max_results, next_token: next_token)
        list_coverage(input)
      end
      def list_coverage(input : Types::ListCoverageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COVERAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Inspector coverage statistics for your environment.
      def list_coverage_statistics(
        filter_criteria : Types::CoverageFilterCriteria? = nil,
        group_by : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCoverageStatisticsRequest.new(filter_criteria: filter_criteria, group_by: group_by, next_token: next_token)
        list_coverage_statistics(input)
      end
      def list_coverage_statistics(input : Types::ListCoverageStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COVERAGE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about the Amazon Inspector delegated administrator of your organization.
      def list_delegated_admin_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDelegatedAdminAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_delegated_admin_accounts(input)
      end
      def list_delegated_admin_accounts(input : Types::ListDelegatedAdminAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DELEGATED_ADMIN_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the filters associated with your account.
      def list_filters(
        action : String? = nil,
        arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFiltersRequest.new(action: action, arns: arns, max_results: max_results, next_token: next_token)
        list_filters(input)
      end
      def list_filters(input : Types::ListFiltersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FILTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists aggregated finding data for your environment based on specific criteria.
      def list_finding_aggregations(
        aggregation_type : String,
        account_ids : Array(Types::StringFilter)? = nil,
        aggregation_request : Types::AggregationRequest? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFindingAggregationsRequest.new(aggregation_type: aggregation_type, account_ids: account_ids, aggregation_request: aggregation_request, max_results: max_results, next_token: next_token)
        list_finding_aggregations(input)
      end
      def list_finding_aggregations(input : Types::ListFindingAggregationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDING_AGGREGATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists findings for your environment.
      def list_findings(
        filter_criteria : Types::FilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListFindingsRequest.new(filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_findings(input)
      end
      def list_findings(input : Types::ListFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List members associated with the Amazon Inspector delegated administrator for your organization.
      def list_members(
        max_results : Int32? = nil,
        next_token : String? = nil,
        only_associated : Bool? = nil
      ) : Protocol::Request
        input = Types::ListMembersRequest.new(max_results: max_results, next_token: next_token, only_associated: only_associated)
        list_members(input)
      end
      def list_members(input : Types::ListMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags attached to a given resource.
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

      # Lists the Amazon Inspector usage totals over the last 30 days.
      def list_usage_totals(
        account_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsageTotalsRequest.new(account_ids: account_ids, max_results: max_results, next_token: next_token)
        list_usage_totals(input)
      end
      def list_usage_totals(input : Types::ListUsageTotalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USAGE_TOTALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets an encryption key. After the key is reset your resources will be encrypted by an Amazon Web
      # Services owned key.
      def reset_encryption_key(
        resource_type : String,
        scan_type : String
      ) : Protocol::Request
        input = Types::ResetEncryptionKeyRequest.new(resource_type: resource_type, scan_type: scan_type)
        reset_encryption_key(input)
      end
      def reset_encryption_key(input : Types::ResetEncryptionKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_ENCRYPTION_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Inspector coverage details for a specific vulnerability.
      def search_vulnerabilities(
        filter_criteria : Types::SearchVulnerabilitiesFilterCriteria,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchVulnerabilitiesRequest.new(filter_criteria: filter_criteria, next_token: next_token)
        search_vulnerabilities(input)
      end
      def search_vulnerabilities(input : Types::SearchVulnerabilitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_VULNERABILITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a CIS session health. This API is used by the Amazon Inspector SSM plugin to communicate with
      # the Amazon Inspector service. The Amazon Inspector SSM plugin calls this API to start a CIS scan
      # session for the scan ID supplied by the service.
      def send_cis_session_health(
        scan_job_id : String,
        session_token : String
      ) : Protocol::Request
        input = Types::SendCisSessionHealthRequest.new(scan_job_id: scan_job_id, session_token: session_token)
        send_cis_session_health(input)
      end
      def send_cis_session_health(input : Types::SendCisSessionHealthRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CIS_SESSION_HEALTH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a CIS session telemetry. This API is used by the Amazon Inspector SSM plugin to communicate
      # with the Amazon Inspector service. The Amazon Inspector SSM plugin calls this API to start a CIS
      # scan session for the scan ID supplied by the service.
      def send_cis_session_telemetry(
        messages : Array(Types::CisSessionMessage),
        scan_job_id : String,
        session_token : String
      ) : Protocol::Request
        input = Types::SendCisSessionTelemetryRequest.new(messages: messages, scan_job_id: scan_job_id, session_token: session_token)
        send_cis_session_telemetry(input)
      end
      def send_cis_session_telemetry(input : Types::SendCisSessionTelemetryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CIS_SESSION_TELEMETRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a CIS session. This API is used by the Amazon Inspector SSM plugin to communicate with the
      # Amazon Inspector service. The Amazon Inspector SSM plugin calls this API to start a CIS scan session
      # for the scan ID supplied by the service.
      def start_cis_session(
        message : Types::StartCisSessionMessage,
        scan_job_id : String
      ) : Protocol::Request
        input = Types::StartCisSessionRequest.new(message: message, scan_job_id: scan_job_id)
        start_cis_session(input)
      end
      def start_cis_session(input : Types::StartCisSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CIS_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a code security scan on a specified repository.
      def start_code_security_scan(
        resource : Types::CodeSecurityResource,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartCodeSecurityScanRequest.new(resource: resource, client_token: client_token)
        start_code_security_scan(input)
      end
      def start_code_security_scan(input : Types::StartCodeSecurityScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CODE_SECURITY_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a CIS session. This API is used by the Amazon Inspector SSM plugin to communicate with the
      # Amazon Inspector service. The Amazon Inspector SSM plugin calls this API to stop a CIS scan session
      # for the scan ID supplied by the service.
      def stop_cis_session(
        message : Types::StopCisSessionMessage,
        scan_job_id : String,
        session_token : String
      ) : Protocol::Request
        input = Types::StopCisSessionRequest.new(message: message, scan_job_id: scan_job_id, session_token: session_token)
        stop_cis_session(input)
      end
      def stop_cis_session(input : Types::StopCisSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CIS_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a resource.
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

      # Removes tags from a resource.
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

      # Updates a CIS scan configuration.
      def update_cis_scan_configuration(
        scan_configuration_arn : String,
        scan_name : String? = nil,
        schedule : Types::Schedule? = nil,
        security_level : String? = nil,
        targets : Types::UpdateCisTargets? = nil
      ) : Protocol::Request
        input = Types::UpdateCisScanConfigurationRequest.new(scan_configuration_arn: scan_configuration_arn, scan_name: scan_name, schedule: schedule, security_level: security_level, targets: targets)
        update_cis_scan_configuration(input)
      end
      def update_cis_scan_configuration(input : Types::UpdateCisScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CIS_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing code security integration. After calling the CreateCodeSecurityIntegration
      # operation, you complete authentication and authorization with your provider. Next you call the
      # UpdateCodeSecurityIntegration operation to provide the details to complete the integration setup
      def update_code_security_integration(
        details : Types::UpdateIntegrationDetails,
        integration_arn : String
      ) : Protocol::Request
        input = Types::UpdateCodeSecurityIntegrationRequest.new(details: details, integration_arn: integration_arn)
        update_code_security_integration(input)
      end
      def update_code_security_integration(input : Types::UpdateCodeSecurityIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CODE_SECURITY_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing code security scan configuration.
      def update_code_security_scan_configuration(
        configuration : Types::CodeSecurityScanConfiguration,
        scan_configuration_arn : String
      ) : Protocol::Request
        input = Types::UpdateCodeSecurityScanConfigurationRequest.new(configuration: configuration, scan_configuration_arn: scan_configuration_arn)
        update_code_security_scan_configuration(input)
      end
      def update_code_security_scan_configuration(input : Types::UpdateCodeSecurityScanConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CODE_SECURITY_SCAN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates setting configurations for your Amazon Inspector account. When you use this API as an Amazon
      # Inspector delegated administrator this updates the setting for all accounts you manage. Member
      # accounts in an organization cannot update this setting.
      def update_configuration(
        ec2_configuration : Types::Ec2Configuration? = nil,
        ecr_configuration : Types::EcrConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationRequest.new(ec2_configuration: ec2_configuration, ecr_configuration: ecr_configuration)
        update_configuration(input)
      end
      def update_configuration(input : Types::UpdateConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Activates, deactivates Amazon Inspector deep inspection, or updates custom paths for your account.
      def update_ec2_deep_inspection_configuration(
        activate_deep_inspection : Bool? = nil,
        package_paths : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateEc2DeepInspectionConfigurationRequest.new(activate_deep_inspection: activate_deep_inspection, package_paths: package_paths)
        update_ec2_deep_inspection_configuration(input)
      end
      def update_ec2_deep_inspection_configuration(input : Types::UpdateEc2DeepInspectionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EC2_DEEP_INSPECTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an encryption key. A ResourceNotFoundException means that an Amazon Web Services owned key
      # is being used for encryption.
      def update_encryption_key(
        kms_key_id : String,
        resource_type : String,
        scan_type : String
      ) : Protocol::Request
        input = Types::UpdateEncryptionKeyRequest.new(kms_key_id: kms_key_id, resource_type: resource_type, scan_type: scan_type)
        update_encryption_key(input)
      end
      def update_encryption_key(input : Types::UpdateEncryptionKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENCRYPTION_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specifies the action that is to be applied to the findings that match the filter.
      def update_filter(
        filter_arn : String,
        action : String? = nil,
        description : String? = nil,
        filter_criteria : Types::FilterCriteria? = nil,
        name : String? = nil,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFilterRequest.new(filter_arn: filter_arn, action: action, description: description, filter_criteria: filter_criteria, name: name, reason: reason)
        update_filter(input)
      end
      def update_filter(input : Types::UpdateFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Amazon Inspector deep inspection custom paths for your organization. You must be an
      # Amazon Inspector delegated administrator to use this API.
      def update_org_ec2_deep_inspection_configuration(
        org_package_paths : Array(String)
      ) : Protocol::Request
        input = Types::UpdateOrgEc2DeepInspectionConfigurationRequest.new(org_package_paths: org_package_paths)
        update_org_ec2_deep_inspection_configuration(input)
      end
      def update_org_ec2_deep_inspection_configuration(input : Types::UpdateOrgEc2DeepInspectionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORG_EC2_DEEP_INSPECTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configurations for your Amazon Inspector organization.
      def update_organization_configuration(
        auto_enable : Types::AutoEnable
      ) : Protocol::Request
        input = Types::UpdateOrganizationConfigurationRequest.new(auto_enable: auto_enable)
        update_organization_configuration(input)
      end
      def update_organization_configuration(input : Types::UpdateOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
