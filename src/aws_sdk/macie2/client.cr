module AwsSdk
  module Macie2
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

      # Accepts an Amazon Macie membership invitation that was received from a specific account.
      def accept_invitation(
        invitation_id : String,
        administrator_account_id : String? = nil,
        master_account : String? = nil
      ) : Protocol::Request
        input = Types::AcceptInvitationRequest.new(invitation_id: invitation_id, administrator_account_id: administrator_account_id, master_account: master_account)
        accept_invitation(input)
      end
      def accept_invitation(input : Types::AcceptInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about one or more custom data identifiers.
      def batch_get_custom_data_identifiers(
        ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchGetCustomDataIdentifiersRequest.new(ids: ids)
        batch_get_custom_data_identifiers(input)
      end
      def batch_get_custom_data_identifiers(input : Types::BatchGetCustomDataIdentifiersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CUSTOM_DATA_IDENTIFIERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the status of automated sensitive data discovery for one or more accounts.
      def batch_update_automated_discovery_accounts(
        accounts : Array(Types::AutomatedDiscoveryAccountUpdate)? = nil
      ) : Protocol::Request
        input = Types::BatchUpdateAutomatedDiscoveryAccountsRequest.new(accounts: accounts)
        batch_update_automated_discovery_accounts(input)
      end
      def batch_update_automated_discovery_accounts(input : Types::BatchUpdateAutomatedDiscoveryAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_AUTOMATED_DISCOVERY_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and defines the settings for an allow list.
      def create_allow_list(
        client_token : String,
        criteria : Types::AllowListCriteria,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAllowListRequest.new(client_token: client_token, criteria: criteria, name: name, description: description, tags: tags)
        create_allow_list(input)
      end
      def create_allow_list(input : Types::CreateAllowListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ALLOW_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and defines the settings for a classification job.
      def create_classification_job(
        client_token : String,
        job_type : String,
        name : String,
        s3_job_definition : Types::S3JobDefinition,
        allow_list_ids : Array(String)? = nil,
        custom_data_identifier_ids : Array(String)? = nil,
        description : String? = nil,
        initial_run : Bool? = nil,
        managed_data_identifier_ids : Array(String)? = nil,
        managed_data_identifier_selector : String? = nil,
        sampling_percentage : Int32? = nil,
        schedule_frequency : Types::JobScheduleFrequency? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClassificationJobRequest.new(client_token: client_token, job_type: job_type, name: name, s3_job_definition: s3_job_definition, allow_list_ids: allow_list_ids, custom_data_identifier_ids: custom_data_identifier_ids, description: description, initial_run: initial_run, managed_data_identifier_ids: managed_data_identifier_ids, managed_data_identifier_selector: managed_data_identifier_selector, sampling_percentage: sampling_percentage, schedule_frequency: schedule_frequency, tags: tags)
        create_classification_job(input)
      end
      def create_classification_job(input : Types::CreateClassificationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLASSIFICATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and defines the criteria and other settings for a custom data identifier.
      def create_custom_data_identifier(
        name : String,
        regex : String,
        client_token : String? = nil,
        description : String? = nil,
        ignore_words : Array(String)? = nil,
        keywords : Array(String)? = nil,
        maximum_match_distance : Int32? = nil,
        severity_levels : Array(Types::SeverityLevel)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomDataIdentifierRequest.new(name: name, regex: regex, client_token: client_token, description: description, ignore_words: ignore_words, keywords: keywords, maximum_match_distance: maximum_match_distance, severity_levels: severity_levels, tags: tags)
        create_custom_data_identifier(input)
      end
      def create_custom_data_identifier(input : Types::CreateCustomDataIdentifierRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_DATA_IDENTIFIER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and defines the criteria and other settings for a findings filter.
      def create_findings_filter(
        action : String,
        finding_criteria : Types::FindingCriteria,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        position : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFindingsFilterRequest.new(action: action, finding_criteria: finding_criteria, name: name, client_token: client_token, description: description, position: position, tags: tags)
        create_findings_filter(input)
      end
      def create_findings_filter(input : Types::CreateFindingsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FINDINGS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an Amazon Macie membership invitation to one or more accounts.
      def create_invitations(
        account_ids : Array(String),
        disable_email_notification : Bool? = nil,
        message : String? = nil
      ) : Protocol::Request
        input = Types::CreateInvitationsRequest.new(account_ids: account_ids, disable_email_notification: disable_email_notification, message: message)
        create_invitations(input)
      end
      def create_invitations(input : Types::CreateInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an account with an Amazon Macie administrator account.
      def create_member(
        account : Types::AccountDetail,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMemberRequest.new(account: account, tags: tags)
        create_member(input)
      end
      def create_member(input : Types::CreateMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates sample findings.
      def create_sample_findings(
        finding_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateSampleFindingsRequest.new(finding_types: finding_types)
        create_sample_findings(input)
      end
      def create_sample_findings(input : Types::CreateSampleFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SAMPLE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Declines Amazon Macie membership invitations that were received from specific accounts.
      def decline_invitations(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DeclineInvitationsRequest.new(account_ids: account_ids)
        decline_invitations(input)
      end
      def decline_invitations(input : Types::DeclineInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DECLINE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an allow list.
      def delete_allow_list(
        id : String,
        ignore_job_checks : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAllowListRequest.new(id: id, ignore_job_checks: ignore_job_checks)
        delete_allow_list(input)
      end
      def delete_allow_list(input : Types::DeleteAllowListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ALLOW_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Soft deletes a custom data identifier.
      def delete_custom_data_identifier(
        id : String
      ) : Protocol::Request
        input = Types::DeleteCustomDataIdentifierRequest.new(id: id)
        delete_custom_data_identifier(input)
      end
      def delete_custom_data_identifier(input : Types::DeleteCustomDataIdentifierRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_DATA_IDENTIFIER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a findings filter.
      def delete_findings_filter(
        id : String
      ) : Protocol::Request
        input = Types::DeleteFindingsFilterRequest.new(id: id)
        delete_findings_filter(input)
      end
      def delete_findings_filter(input : Types::DeleteFindingsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FINDINGS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes Amazon Macie membership invitations that were received from specific accounts.
      def delete_invitations(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DeleteInvitationsRequest.new(account_ids: account_ids)
        delete_invitations(input)
      end
      def delete_invitations(input : Types::DeleteInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the association between an Amazon Macie administrator account and an account.
      def delete_member(
        id : String
      ) : Protocol::Request
        input = Types::DeleteMemberRequest.new(id: id)
        delete_member(input)
      end
      def delete_member(input : Types::DeleteMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) statistical data and other information about one or more S3 buckets that Amazon
      # Macie monitors and analyzes for an account.
      def describe_buckets(
        criteria : Hash(String, Types::BucketCriteriaAdditionalProperties)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::BucketSortCriteria? = nil
      ) : Protocol::Request
        input = Types::DescribeBucketsRequest.new(criteria: criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        describe_buckets(input)
      end
      def describe_buckets(input : Types::DescribeBucketsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BUCKETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status and settings for a classification job.
      def describe_classification_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeClassificationJobRequest.new(job_id: job_id)
        describe_classification_job(input)
      end
      def describe_classification_job(input : Types::DescribeClassificationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLASSIFICATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the Amazon Macie configuration settings for an organization in Organizations.
      def describe_organization_configuration : Protocol::Request
        input = Types::DescribeOrganizationConfigurationRequest.new
        describe_organization_configuration(input)
      end
      def describe_organization_configuration(input : Types::DescribeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables Amazon Macie and deletes all settings and resources for a Macie account.
      def disable_macie : Protocol::Request
        input = Types::DisableMacieRequest.new
        disable_macie(input)
      end
      def disable_macie(input : Types::DisableMacieRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_MACIE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables an account as the delegated Amazon Macie administrator account for an organization in
      # Organizations.
      def disable_organization_admin_account(
        admin_account_id : String
      ) : Protocol::Request
        input = Types::DisableOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id)
        disable_organization_admin_account(input)
      end
      def disable_organization_admin_account(input : Types::DisableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member account from its Amazon Macie administrator account.
      def disassociate_from_administrator_account : Protocol::Request
        input = Types::DisassociateFromAdministratorAccountRequest.new
        disassociate_from_administrator_account(input)
      end
      def disassociate_from_administrator_account(input : Types::DisassociateFromAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # (Deprecated) Disassociates a member account from its Amazon Macie administrator account. This
      # operation has been replaced by the DisassociateFromAdministratorAccount operation.
      def disassociate_from_master_account : Protocol::Request
        input = Types::DisassociateFromMasterAccountRequest.new
        disassociate_from_master_account(input)
      end
      def disassociate_from_master_account(input : Types::DisassociateFromMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an Amazon Macie administrator account from a member account.
      def disassociate_member(
        id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberRequest.new(id: id)
        disassociate_member(input)
      end
      def disassociate_member(input : Types::DisassociateMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables Amazon Macie and specifies the configuration settings for a Macie account.
      def enable_macie(
        client_token : String? = nil,
        finding_publishing_frequency : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::EnableMacieRequest.new(client_token: client_token, finding_publishing_frequency: finding_publishing_frequency, status: status)
        enable_macie(input)
      end
      def enable_macie(input : Types::EnableMacieRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_MACIE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates an account as the delegated Amazon Macie administrator account for an organization in
      # Organizations.
      def enable_organization_admin_account(
        admin_account_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::EnableOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id, client_token: client_token)
        enable_organization_admin_account(input)
      end
      def enable_organization_admin_account(input : Types::EnableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the Amazon Macie administrator account for an account.
      def get_administrator_account : Protocol::Request
        input = Types::GetAdministratorAccountRequest.new
        get_administrator_account(input)
      end
      def get_administrator_account(input : Types::GetAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the settings and status of an allow list.
      def get_allow_list(
        id : String
      ) : Protocol::Request
        input = Types::GetAllowListRequest.new(id: id)
        get_allow_list(input)
      end
      def get_allow_list(input : Types::GetAllowListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ALLOW_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration settings and status of automated sensitive data discovery for an
      # organization or standalone account.
      def get_automated_discovery_configuration : Protocol::Request
        input = Types::GetAutomatedDiscoveryConfigurationRequest.new
        get_automated_discovery_configuration(input)
      end
      def get_automated_discovery_configuration(input : Types::GetAutomatedDiscoveryConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATED_DISCOVERY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) aggregated statistical data about all the S3 buckets that Amazon Macie monitors
      # and analyzes for an account.
      def get_bucket_statistics(
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetBucketStatisticsRequest.new(account_id: account_id)
        get_bucket_statistics(input)
      end
      def get_bucket_statistics(input : Types::GetBucketStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUCKET_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration settings for storing data classification results.
      def get_classification_export_configuration : Protocol::Request
        input = Types::GetClassificationExportConfigurationRequest.new
        get_classification_export_configuration(input)
      end
      def get_classification_export_configuration(input : Types::GetClassificationExportConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLASSIFICATION_EXPORT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the classification scope settings for an account.
      def get_classification_scope(
        id : String
      ) : Protocol::Request
        input = Types::GetClassificationScopeRequest.new(id: id)
        get_classification_scope(input)
      end
      def get_classification_scope(input : Types::GetClassificationScopeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLASSIFICATION_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the criteria and other settings for a custom data identifier.
      def get_custom_data_identifier(
        id : String
      ) : Protocol::Request
        input = Types::GetCustomDataIdentifierRequest.new(id: id)
        get_custom_data_identifier(input)
      end
      def get_custom_data_identifier(input : Types::GetCustomDataIdentifierRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_DATA_IDENTIFIER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) aggregated statistical data about findings.
      def get_finding_statistics(
        group_by : String,
        finding_criteria : Types::FindingCriteria? = nil,
        size : Int32? = nil,
        sort_criteria : Types::FindingStatisticsSortCriteria? = nil
      ) : Protocol::Request
        input = Types::GetFindingStatisticsRequest.new(group_by: group_by, finding_criteria: finding_criteria, size: size, sort_criteria: sort_criteria)
        get_finding_statistics(input)
      end
      def get_finding_statistics(input : Types::GetFindingStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of one or more findings.
      def get_findings(
        finding_ids : Array(String),
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::GetFindingsRequest.new(finding_ids: finding_ids, sort_criteria: sort_criteria)
        get_findings(input)
      end
      def get_findings(input : Types::GetFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the criteria and other settings for a findings filter.
      def get_findings_filter(
        id : String
      ) : Protocol::Request
        input = Types::GetFindingsFilterRequest.new(id: id)
        get_findings_filter(input)
      end
      def get_findings_filter(input : Types::GetFindingsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration settings for publishing findings to Security Hub.
      def get_findings_publication_configuration : Protocol::Request
        input = Types::GetFindingsPublicationConfigurationRequest.new
        get_findings_publication_configuration(input)
      end
      def get_findings_publication_configuration(input : Types::GetFindingsPublicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_PUBLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the count of Amazon Macie membership invitations that were received by an account.
      def get_invitations_count : Protocol::Request
        input = Types::GetInvitationsCountRequest.new
        get_invitations_count(input)
      end
      def get_invitations_count(input : Types::GetInvitationsCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVITATIONS_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status and configuration settings for an Amazon Macie account.
      def get_macie_session : Protocol::Request
        input = Types::GetMacieSessionRequest.new
        get_macie_session(input)
      end
      def get_macie_session(input : Types::GetMacieSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MACIE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # (Deprecated) Retrieves information about the Amazon Macie administrator account for an account. This
      # operation has been replaced by the GetAdministratorAccount operation.
      def get_master_account : Protocol::Request
        input = Types::GetMasterAccountRequest.new
        get_master_account(input)
      end
      def get_master_account(input : Types::GetMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an account that's associated with an Amazon Macie administrator account.
      def get_member(
        id : String
      ) : Protocol::Request
        input = Types::GetMemberRequest.new(id: id)
        get_member(input)
      end
      def get_member(input : Types::GetMemberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) sensitive data discovery statistics and the sensitivity score for an S3 bucket.
      def get_resource_profile(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetResourceProfileRequest.new(resource_arn: resource_arn)
        get_resource_profile(input)
      end
      def get_resource_profile(input : Types::GetResourceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status and configuration settings for retrieving occurrences of sensitive data
      # reported by findings.
      def get_reveal_configuration : Protocol::Request
        input = Types::GetRevealConfigurationRequest.new
        get_reveal_configuration(input)
      end
      def get_reveal_configuration(input : Types::GetRevealConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVEAL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves occurrences of sensitive data reported by a finding.
      def get_sensitive_data_occurrences(
        finding_id : String
      ) : Protocol::Request
        input = Types::GetSensitiveDataOccurrencesRequest.new(finding_id: finding_id)
        get_sensitive_data_occurrences(input)
      end
      def get_sensitive_data_occurrences(input : Types::GetSensitiveDataOccurrencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SENSITIVE_DATA_OCCURRENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks whether occurrences of sensitive data can be retrieved for a finding.
      def get_sensitive_data_occurrences_availability(
        finding_id : String
      ) : Protocol::Request
        input = Types::GetSensitiveDataOccurrencesAvailabilityRequest.new(finding_id: finding_id)
        get_sensitive_data_occurrences_availability(input)
      end
      def get_sensitive_data_occurrences_availability(input : Types::GetSensitiveDataOccurrencesAvailabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SENSITIVE_DATA_OCCURRENCES_AVAILABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the settings for the sensitivity inspection template for an account.
      def get_sensitivity_inspection_template(
        id : String
      ) : Protocol::Request
        input = Types::GetSensitivityInspectionTemplateRequest.new(id: id)
        get_sensitivity_inspection_template(input)
      end
      def get_sensitivity_inspection_template(input : Types::GetSensitivityInspectionTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SENSITIVITY_INSPECTION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) quotas and aggregated usage data for one or more accounts.
      def get_usage_statistics(
        filter_by : Array(Types::UsageStatisticsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : Types::UsageStatisticsSortBy? = nil,
        time_range : String? = nil
      ) : Protocol::Request
        input = Types::GetUsageStatisticsRequest.new(filter_by: filter_by, max_results: max_results, next_token: next_token, sort_by: sort_by, time_range: time_range)
        get_usage_statistics(input)
      end
      def get_usage_statistics(input : Types::GetUsageStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) aggregated usage data for an account.
      def get_usage_totals(
        time_range : String? = nil
      ) : Protocol::Request
        input = Types::GetUsageTotalsRequest.new(time_range: time_range)
        get_usage_totals(input)
      end
      def get_usage_totals(input : Types::GetUsageTotalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_TOTALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about all the allow lists for an account.
      def list_allow_lists(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAllowListsRequest.new(max_results: max_results, next_token: next_token)
        list_allow_lists(input)
      end
      def list_allow_lists(input : Types::ListAllowListsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALLOW_LISTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of automated sensitive data discovery for one or more accounts.
      def list_automated_discovery_accounts(
        account_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomatedDiscoveryAccountsRequest.new(account_ids: account_ids, max_results: max_results, next_token: next_token)
        list_automated_discovery_accounts(input)
      end
      def list_automated_discovery_accounts(input : Types::ListAutomatedDiscoveryAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATED_DISCOVERY_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about one or more classification jobs.
      def list_classification_jobs(
        filter_criteria : Types::ListJobsFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::ListJobsSortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListClassificationJobsRequest.new(filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_classification_jobs(input)
      end
      def list_classification_jobs(input : Types::ListClassificationJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLASSIFICATION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about the classification scope for an account.
      def list_classification_scopes(
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClassificationScopesRequest.new(name: name, next_token: next_token)
        list_classification_scopes(input)
      end
      def list_classification_scopes(input : Types::ListClassificationScopesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLASSIFICATION_SCOPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about the custom data identifiers for an account.
      def list_custom_data_identifiers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomDataIdentifiersRequest.new(max_results: max_results, next_token: next_token)
        list_custom_data_identifiers(input)
      end
      def list_custom_data_identifiers(input : Types::ListCustomDataIdentifiersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_DATA_IDENTIFIERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about one or more findings.
      def list_findings(
        finding_criteria : Types::FindingCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListFindingsRequest.new(finding_criteria: finding_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_findings(input)
      end
      def list_findings(input : Types::ListFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about all the findings filters for an account.
      def list_findings_filters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFindingsFiltersRequest.new(max_results: max_results, next_token: next_token)
        list_findings_filters(input)
      end
      def list_findings_filters(input : Types::ListFindingsFiltersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS_FILTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about Amazon Macie membership invitations that were received by an account.
      def list_invitations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvitationsRequest.new(max_results: max_results, next_token: next_token)
        list_invitations(input)
      end
      def list_invitations(input : Types::ListInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about all the managed data identifiers that Amazon Macie currently provides.
      def list_managed_data_identifiers(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedDataIdentifiersRequest.new(next_token: next_token)
        list_managed_data_identifiers(input)
      end
      def list_managed_data_identifiers(input : Types::ListManagedDataIdentifiersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_DATA_IDENTIFIERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the accounts that are associated with an Amazon Macie administrator
      # account.
      def list_members(
        max_results : Int32? = nil,
        next_token : String? = nil,
        only_associated : String? = nil
      ) : Protocol::Request
        input = Types::ListMembersRequest.new(max_results: max_results, next_token: next_token, only_associated: only_associated)
        list_members(input)
      end
      def list_members(input : Types::ListMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the delegated Amazon Macie administrator account for an organization in
      # Organizations.
      def list_organization_admin_accounts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationAdminAccountsRequest.new(max_results: max_results, next_token: next_token)
        list_organization_admin_accounts(input)
      end
      def list_organization_admin_accounts(input : Types::ListOrganizationAdminAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_ADMIN_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about objects that Amazon Macie selected from an S3 bucket for automated
      # sensitive data discovery.
      def list_resource_profile_artifacts(
        resource_arn : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceProfileArtifactsRequest.new(resource_arn: resource_arn, next_token: next_token)
        list_resource_profile_artifacts(input)
      end
      def list_resource_profile_artifacts(input : Types::ListResourceProfileArtifactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_PROFILE_ARTIFACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the types and amount of sensitive data that Amazon Macie found in an S3
      # bucket.
      def list_resource_profile_detections(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceProfileDetectionsRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_resource_profile_detections(input)
      end
      def list_resource_profile_detections(input : Types::ListResourceProfileDetectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_PROFILE_DETECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a subset of information about the sensitivity inspection template for an account.
      def list_sensitivity_inspection_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSensitivityInspectionTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_sensitivity_inspection_templates(input)
      end
      def list_sensitivity_inspection_templates(input : Types::ListSensitivityInspectionTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SENSITIVITY_INSPECTION_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tags (keys and values) that are associated with an Amazon Macie resource.
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

      # Adds or updates the configuration settings for storing data classification results.
      def put_classification_export_configuration(
        configuration : Types::ClassificationExportConfiguration
      ) : Protocol::Request
        input = Types::PutClassificationExportConfigurationRequest.new(configuration: configuration)
        put_classification_export_configuration(input)
      end
      def put_classification_export_configuration(input : Types::PutClassificationExportConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CLASSIFICATION_EXPORT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration settings for publishing findings to Security Hub.
      def put_findings_publication_configuration(
        client_token : String? = nil,
        security_hub_configuration : Types::SecurityHubConfiguration? = nil
      ) : Protocol::Request
        input = Types::PutFindingsPublicationConfigurationRequest.new(client_token: client_token, security_hub_configuration: security_hub_configuration)
        put_findings_publication_configuration(input)
      end
      def put_findings_publication_configuration(input : Types::PutFindingsPublicationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FINDINGS_PUBLICATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves (queries) statistical data and other information about Amazon Web Services resources that
      # Amazon Macie monitors and analyzes for an account.
      def search_resources(
        bucket_criteria : Types::SearchResourcesBucketCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SearchResourcesSortCriteria? = nil
      ) : Protocol::Request
        input = Types::SearchResourcesRequest.new(bucket_criteria: bucket_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        search_resources(input)
      end
      def search_resources(input : Types::SearchResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates one or more tags (keys and values) that are associated with an Amazon Macie
      # resource.
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

      # Tests criteria for a custom data identifier.
      def test_custom_data_identifier(
        regex : String,
        sample_text : String,
        ignore_words : Array(String)? = nil,
        keywords : Array(String)? = nil,
        maximum_match_distance : Int32? = nil
      ) : Protocol::Request
        input = Types::TestCustomDataIdentifierRequest.new(regex: regex, sample_text: sample_text, ignore_words: ignore_words, keywords: keywords, maximum_match_distance: maximum_match_distance)
        test_custom_data_identifier(input)
      end
      def test_custom_data_identifier(input : Types::TestCustomDataIdentifierRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_CUSTOM_DATA_IDENTIFIER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags (keys and values) from an Amazon Macie resource.
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

      # Updates the settings for an allow list.
      def update_allow_list(
        criteria : Types::AllowListCriteria,
        id : String,
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAllowListRequest.new(criteria: criteria, id: id, name: name, description: description)
        update_allow_list(input)
      end
      def update_allow_list(input : Types::UpdateAllowListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ALLOW_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the configuration settings and status of automated sensitive data discovery for an
      # organization or standalone account.
      def update_automated_discovery_configuration(
        status : String,
        auto_enable_organization_members : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAutomatedDiscoveryConfigurationRequest.new(status: status, auto_enable_organization_members: auto_enable_organization_members)
        update_automated_discovery_configuration(input)
      end
      def update_automated_discovery_configuration(input : Types::UpdateAutomatedDiscoveryConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOMATED_DISCOVERY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the status of a classification job.
      def update_classification_job(
        job_id : String,
        job_status : String
      ) : Protocol::Request
        input = Types::UpdateClassificationJobRequest.new(job_id: job_id, job_status: job_status)
        update_classification_job(input)
      end
      def update_classification_job(input : Types::UpdateClassificationJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLASSIFICATION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the classification scope settings for an account.
      def update_classification_scope(
        id : String,
        s3 : Types::S3ClassificationScopeUpdate? = nil
      ) : Protocol::Request
        input = Types::UpdateClassificationScopeRequest.new(id: id, s3: s3)
        update_classification_scope(input)
      end
      def update_classification_scope(input : Types::UpdateClassificationScopeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLASSIFICATION_SCOPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the criteria and other settings for a findings filter.
      def update_findings_filter(
        id : String,
        action : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        finding_criteria : Types::FindingCriteria? = nil,
        name : String? = nil,
        position : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateFindingsFilterRequest.new(id: id, action: action, client_token: client_token, description: description, finding_criteria: finding_criteria, name: name, position: position)
        update_findings_filter(input)
      end
      def update_findings_filter(input : Types::UpdateFindingsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FINDINGS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Suspends or re-enables Amazon Macie, or updates the configuration settings for a Macie account.
      def update_macie_session(
        finding_publishing_frequency : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMacieSessionRequest.new(finding_publishing_frequency: finding_publishing_frequency, status: status)
        update_macie_session(input)
      end
      def update_macie_session(input : Types::UpdateMacieSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MACIE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables an Amazon Macie administrator to suspend or re-enable Macie for a member account.
      def update_member_session(
        id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateMemberSessionRequest.new(id: id, status: status)
        update_member_session(input)
      end
      def update_member_session(input : Types::UpdateMemberSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMBER_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Amazon Macie configuration settings for an organization in Organizations.
      def update_organization_configuration(
        auto_enable : Bool
      ) : Protocol::Request
        input = Types::UpdateOrganizationConfigurationRequest.new(auto_enable: auto_enable)
        update_organization_configuration(input)
      end
      def update_organization_configuration(input : Types::UpdateOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the sensitivity score for an S3 bucket.
      def update_resource_profile(
        resource_arn : String,
        sensitivity_score_override : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceProfileRequest.new(resource_arn: resource_arn, sensitivity_score_override: sensitivity_score_override)
        update_resource_profile(input)
      end
      def update_resource_profile(input : Types::UpdateResourceProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the sensitivity scoring settings for an S3 bucket.
      def update_resource_profile_detections(
        resource_arn : String,
        suppress_data_identifiers : Array(Types::SuppressDataIdentifier)? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceProfileDetectionsRequest.new(resource_arn: resource_arn, suppress_data_identifiers: suppress_data_identifiers)
        update_resource_profile_detections(input)
      end
      def update_resource_profile_detections(input : Types::UpdateResourceProfileDetectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_PROFILE_DETECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status and configuration settings for retrieving occurrences of sensitive data reported
      # by findings.
      def update_reveal_configuration(
        configuration : Types::RevealConfiguration,
        retrieval_configuration : Types::UpdateRetrievalConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateRevealConfigurationRequest.new(configuration: configuration, retrieval_configuration: retrieval_configuration)
        update_reveal_configuration(input)
      end
      def update_reveal_configuration(input : Types::UpdateRevealConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REVEAL_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the settings for the sensitivity inspection template for an account.
      def update_sensitivity_inspection_template(
        id : String,
        description : String? = nil,
        excludes : Types::SensitivityInspectionTemplateExcludes? = nil,
        includes : Types::SensitivityInspectionTemplateIncludes? = nil
      ) : Protocol::Request
        input = Types::UpdateSensitivityInspectionTemplateRequest.new(id: id, description: description, excludes: excludes, includes: includes)
        update_sensitivity_inspection_template(input)
      end
      def update_sensitivity_inspection_template(input : Types::UpdateSensitivityInspectionTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SENSITIVITY_INSPECTION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
