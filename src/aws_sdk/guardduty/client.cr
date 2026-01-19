module AwsSdk
  module GuardDuty
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

      # Accepts the invitation to be a member account and get monitored by a GuardDuty administrator account
      # that sent the invitation.
      def accept_administrator_invitation(
        administrator_id : String,
        detector_id : String,
        invitation_id : String
      ) : Protocol::Request
        input = Types::AcceptAdministratorInvitationRequest.new(administrator_id: administrator_id, detector_id: detector_id, invitation_id: invitation_id)
        accept_administrator_invitation(input)
      end
      def accept_administrator_invitation(input : Types::AcceptAdministratorInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_ADMINISTRATOR_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Accepts the invitation to be monitored by a GuardDuty administrator account.
      def accept_invitation(
        detector_id : String,
        invitation_id : String,
        master_id : String
      ) : Protocol::Request
        input = Types::AcceptInvitationRequest.new(detector_id: detector_id, invitation_id: invitation_id, master_id: master_id)
        accept_invitation(input)
      end
      def accept_invitation(input : Types::AcceptInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Archives GuardDuty findings that are specified by the list of finding IDs. Only the administrator
      # account can archive findings. Member accounts don't have permission to archive findings from their
      # accounts.
      def archive_findings(
        detector_id : String,
        finding_ids : Array(String)
      ) : Protocol::Request
        input = Types::ArchiveFindingsRequest.new(detector_id: detector_id, finding_ids: finding_ids)
        archive_findings(input)
      end
      def archive_findings(input : Types::ArchiveFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ARCHIVE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a single GuardDuty detector. A detector is a resource that represents the GuardDuty service.
      # To start using GuardDuty, you must create a detector in each Region where you enable the service.
      # You can have only one detector per account per Region. All data sources are enabled in a new
      # detector by default. When you don't specify any features , with an exception to RUNTIME_MONITORING ,
      # all the optional features are enabled by default. When you specify some of the features , any
      # feature that is not specified in the API call gets enabled by default, with an exception to
      # RUNTIME_MONITORING . Specifying both EKS Runtime Monitoring ( EKS_RUNTIME_MONITORING ) and Runtime
      # Monitoring ( RUNTIME_MONITORING ) will cause an error. You can add only one of these two features
      # because Runtime Monitoring already includes the threat detection for Amazon EKS resources. For more
      # information, see Runtime Monitoring . There might be regional differences because some data sources
      # might not be available in all the Amazon Web Services Regions where GuardDuty is presently
      # supported. For more information, see Regions and endpoints .
      def create_detector(
        enable : Bool,
        client_token : String? = nil,
        data_sources : Types::DataSourceConfigurations? = nil,
        features : Array(Types::DetectorFeatureConfiguration)? = nil,
        finding_publishing_frequency : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDetectorRequest.new(enable: enable, client_token: client_token, data_sources: data_sources, features: features, finding_publishing_frequency: finding_publishing_frequency, tags: tags)
        create_detector(input)
      end
      def create_detector(input : Types::CreateDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a filter using the specified finding criteria. The maximum number of saved filters per
      # Amazon Web Services account per Region is 100. For more information, see Quotas for GuardDuty .
      def create_filter(
        detector_id : String,
        finding_criteria : Types::FindingCriteria,
        name : String,
        action : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        rank : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFilterRequest.new(detector_id: detector_id, finding_criteria: finding_criteria, name: name, action: action, client_token: client_token, description: description, rank: rank, tags: tags)
        create_filter(input)
      end
      def create_filter(input : Types::CreateFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new IPSet, which is called a trusted IP list in the console user interface. An IPSet is a
      # list of IP addresses that are trusted for secure communication with Amazon Web Services
      # infrastructure and applications. GuardDuty doesn't generate findings for IP addresses that are
      # included in IPSets. Only users from the administrator account can use this operation.
      def create_ip_set(
        activate : Bool,
        detector_id : String,
        format : String,
        location : String,
        name : String,
        client_token : String? = nil,
        expected_bucket_owner : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIPSetRequest.new(activate: activate, detector_id: detector_id, format: format, location: location, name: name, client_token: client_token, expected_bucket_owner: expected_bucket_owner, tags: tags)
        create_ip_set(input)
      end
      def create_ip_set(input : Types::CreateIPSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IP_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Malware Protection plan for the protected resource. When you create a Malware
      # Protection plan, the Amazon Web Services service terms for GuardDuty Malware Protection apply. For
      # more information, see Amazon Web Services service terms for GuardDuty Malware Protection .
      def create_malware_protection_plan(
        protected_resource : Types::CreateProtectedResource,
        role : String,
        actions : Types::MalwareProtectionPlanActions? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMalwareProtectionPlanRequest.new(protected_resource: protected_resource, role: role, actions: actions, client_token: client_token, tags: tags)
        create_malware_protection_plan(input)
      end
      def create_malware_protection_plan(input : Types::CreateMalwareProtectionPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MALWARE_PROTECTION_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates member accounts of the current Amazon Web Services account by specifying a list of Amazon
      # Web Services account IDs. This step is a prerequisite for managing the associated member accounts
      # either by invitation or through an organization. As a delegated administrator, using CreateMembers
      # will enable GuardDuty in the added member accounts, with the exception of the organization delegated
      # administrator account. A delegated administrator must enable GuardDuty prior to being added as a
      # member. When you use CreateMembers as an Organizations delegated administrator, GuardDuty applies
      # your organization's auto-enable settings to the member accounts in this request, irrespective of the
      # accounts being new or existing members. For more information about the existing auto-enable settings
      # for your organization, see DescribeOrganizationConfiguration . If you disassociate a member account
      # that was added by invitation, the member account details obtained from this API, including the
      # associated email addresses, will be retained. This is done so that the delegated administrator can
      # invoke the InviteMembers API without the need to invoke the CreateMembers API again. To remove the
      # details associated with a member account, the delegated administrator must invoke the DeleteMembers
      # API. When the member accounts added through Organizations are later disassociated, you
      # (administrator) can't invite them by calling the InviteMembers API. You can create an association
      # with these member accounts again only by calling the CreateMembers API.
      def create_members(
        account_details : Array(Types::AccountDetail),
        detector_id : String
      ) : Protocol::Request
        input = Types::CreateMembersRequest.new(account_details: account_details, detector_id: detector_id)
        create_members(input)
      end
      def create_members(input : Types::CreateMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a publishing destination where you can export your GuardDuty findings. Before you start
      # exporting the findings, the destination resource must exist.
      def create_publishing_destination(
        destination_properties : Types::DestinationProperties,
        destination_type : String,
        detector_id : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePublishingDestinationRequest.new(destination_properties: destination_properties, destination_type: destination_type, detector_id: detector_id, client_token: client_token, tags: tags)
        create_publishing_destination(input)
      end
      def create_publishing_destination(input : Types::CreatePublishingDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PUBLISHING_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates sample findings of types specified by the list of finding types. If 'NULL' is specified
      # for findingTypes , the API generates sample findings of all supported finding types.
      def create_sample_findings(
        detector_id : String,
        finding_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateSampleFindingsRequest.new(detector_id: detector_id, finding_types: finding_types)
        create_sample_findings(input)
      end
      def create_sample_findings(input : Types::CreateSampleFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SAMPLE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new threat entity set. In a threat entity set, you can provide known malicious IP
      # addresses and domains for your Amazon Web Services environment. GuardDuty generates findings based
      # on the entries in the threat entity sets. Only users of the administrator account can manage entity
      # sets, which automatically apply to member accounts.
      def create_threat_entity_set(
        activate : Bool,
        detector_id : String,
        format : String,
        location : String,
        name : String,
        client_token : String? = nil,
        expected_bucket_owner : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateThreatEntitySetRequest.new(activate: activate, detector_id: detector_id, format: format, location: location, name: name, client_token: client_token, expected_bucket_owner: expected_bucket_owner, tags: tags)
        create_threat_entity_set(input)
      end
      def create_threat_entity_set(input : Types::CreateThreatEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THREAT_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP addresses. GuardDuty
      # generates findings based on ThreatIntelSets. Only users of the administrator account can use this
      # operation.
      def create_threat_intel_set(
        activate : Bool,
        detector_id : String,
        format : String,
        location : String,
        name : String,
        client_token : String? = nil,
        expected_bucket_owner : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateThreatIntelSetRequest.new(activate: activate, detector_id: detector_id, format: format, location: location, name: name, client_token: client_token, expected_bucket_owner: expected_bucket_owner, tags: tags)
        create_threat_intel_set(input)
      end
      def create_threat_intel_set(input : Types::CreateThreatIntelSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THREAT_INTEL_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new trusted entity set. In the trusted entity set, you can provide IP addresses and
      # domains that you believe are secure for communication in your Amazon Web Services environment.
      # GuardDuty will not generate findings for the entries that are specified in a trusted entity set. At
      # any given time, you can have only one trusted entity set. Only users of the administrator account
      # can manage the entity sets, which automatically apply to member accounts.
      def create_trusted_entity_set(
        activate : Bool,
        detector_id : String,
        format : String,
        location : String,
        name : String,
        client_token : String? = nil,
        expected_bucket_owner : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTrustedEntitySetRequest.new(activate: activate, detector_id: detector_id, format: format, location: location, name: name, client_token: client_token, expected_bucket_owner: expected_bucket_owner, tags: tags)
        create_trusted_entity_set(input)
      end
      def create_trusted_entity_set(input : Types::CreateTrustedEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRUSTED_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Declines invitations sent to the current member account by Amazon Web Services accounts specified by
      # their account IDs.
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

      # Deletes an Amazon GuardDuty detector that is specified by the detector ID.
      def delete_detector(
        detector_id : String
      ) : Protocol::Request
        input = Types::DeleteDetectorRequest.new(detector_id: detector_id)
        delete_detector(input)
      end
      def delete_detector(input : Types::DeleteDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the filter specified by the filter name.
      def delete_filter(
        detector_id : String,
        filter_name : String
      ) : Protocol::Request
        input = Types::DeleteFilterRequest.new(detector_id: detector_id, filter_name: filter_name)
        delete_filter(input)
      end
      def delete_filter(input : Types::DeleteFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the IPSet specified by the ipSetId . IPSets are called trusted IP lists in the console user
      # interface.
      def delete_ip_set(
        detector_id : String,
        ip_set_id : String
      ) : Protocol::Request
        input = Types::DeleteIPSetRequest.new(detector_id: detector_id, ip_set_id: ip_set_id)
        delete_ip_set(input)
      end
      def delete_ip_set(input : Types::DeleteIPSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IP_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes invitations sent to the current member account by Amazon Web Services accounts specified by
      # their account IDs.
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

      # Deletes the Malware Protection plan ID associated with the Malware Protection plan resource. Use
      # this API only when you no longer want to protect the resource associated with this Malware
      # Protection plan ID.
      def delete_malware_protection_plan(
        malware_protection_plan_id : String
      ) : Protocol::Request
        input = Types::DeleteMalwareProtectionPlanRequest.new(malware_protection_plan_id: malware_protection_plan_id)
        delete_malware_protection_plan(input)
      end
      def delete_malware_protection_plan(input : Types::DeleteMalwareProtectionPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MALWARE_PROTECTION_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes GuardDuty member accounts (to the current GuardDuty administrator account) specified by the
      # account IDs. With autoEnableOrganizationMembers configuration for your organization set to ALL ,
      # you'll receive an error if you attempt to disable GuardDuty for a member account in your
      # organization.
      def delete_members(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::DeleteMembersRequest.new(account_ids: account_ids, detector_id: detector_id)
        delete_members(input)
      end
      def delete_members(input : Types::DeleteMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the publishing definition with the specified destinationId .
      def delete_publishing_destination(
        destination_id : String,
        detector_id : String
      ) : Protocol::Request
        input = Types::DeletePublishingDestinationRequest.new(destination_id: destination_id, detector_id: detector_id)
        delete_publishing_destination(input)
      end
      def delete_publishing_destination(input : Types::DeletePublishingDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PUBLISHING_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the threat entity set that is associated with the specified threatEntitySetId .
      def delete_threat_entity_set(
        detector_id : String,
        threat_entity_set_id : String
      ) : Protocol::Request
        input = Types::DeleteThreatEntitySetRequest.new(detector_id: detector_id, threat_entity_set_id: threat_entity_set_id)
        delete_threat_entity_set(input)
      end
      def delete_threat_entity_set(input : Types::DeleteThreatEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THREAT_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.
      def delete_threat_intel_set(
        detector_id : String,
        threat_intel_set_id : String
      ) : Protocol::Request
        input = Types::DeleteThreatIntelSetRequest.new(detector_id: detector_id, threat_intel_set_id: threat_intel_set_id)
        delete_threat_intel_set(input)
      end
      def delete_threat_intel_set(input : Types::DeleteThreatIntelSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THREAT_INTEL_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the trusted entity set that is associated with the specified trustedEntitySetId .
      def delete_trusted_entity_set(
        detector_id : String,
        trusted_entity_set_id : String
      ) : Protocol::Request
        input = Types::DeleteTrustedEntitySetRequest.new(detector_id: detector_id, trusted_entity_set_id: trusted_entity_set_id)
        delete_trusted_entity_set(input)
      end
      def delete_trusted_entity_set(input : Types::DeleteTrustedEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRUSTED_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of malware scans. Each member account can view the malware scans for their own
      # accounts. An administrator can view the malware scans for all the member accounts. There might be
      # regional differences because some data sources might not be available in all the Amazon Web Services
      # Regions where GuardDuty is presently supported. For more information, see Regions and endpoints .
      def describe_malware_scans(
        detector_id : String,
        filter_criteria : Types::FilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::DescribeMalwareScansRequest.new(detector_id: detector_id, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        describe_malware_scans(input)
      end
      def describe_malware_scans(input : Types::DescribeMalwareScansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MALWARE_SCANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the account selected as the delegated administrator for GuardDuty. There
      # might be regional differences because some data sources might not be available in all the Amazon Web
      # Services Regions where GuardDuty is presently supported. For more information, see Regions and
      # endpoints .
      def describe_organization_configuration(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeOrganizationConfigurationRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        describe_organization_configuration(input)
      end
      def describe_organization_configuration(input : Types::DescribeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the publishing destination specified by the provided destinationId .
      def describe_publishing_destination(
        destination_id : String,
        detector_id : String
      ) : Protocol::Request
        input = Types::DescribePublishingDestinationRequest.new(destination_id: destination_id, detector_id: detector_id)
        describe_publishing_destination(input)
      end
      def describe_publishing_destination(input : Types::DescribePublishingDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PUBLISHING_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the existing GuardDuty delegated administrator of the organization. Only the organization's
      # management account can run this API operation.
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

      # Disassociates the current GuardDuty member account from its administrator account. When you
      # disassociate an invited member from a GuardDuty delegated administrator, the member account details
      # obtained from the CreateMembers API, including the associated email addresses, are retained. This is
      # done so that the delegated administrator can invoke the InviteMembers API without the need to invoke
      # the CreateMembers API again. To remove the details associated with a member account, the delegated
      # administrator must invoke the DeleteMembers API. With autoEnableOrganizationMembers configuration
      # for your organization set to ALL , you'll receive an error if you attempt to disable GuardDuty in a
      # member account.
      def disassociate_from_administrator_account(
        detector_id : String
      ) : Protocol::Request
        input = Types::DisassociateFromAdministratorAccountRequest.new(detector_id: detector_id)
        disassociate_from_administrator_account(input)
      end
      def disassociate_from_administrator_account(input : Types::DisassociateFromAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the current GuardDuty member account from its administrator account. When you
      # disassociate an invited member from a GuardDuty delegated administrator, the member account details
      # obtained from the CreateMembers API, including the associated email addresses, are retained. This is
      # done so that the delegated administrator can invoke the InviteMembers API without the need to invoke
      # the CreateMembers API again. To remove the details associated with a member account, the delegated
      # administrator must invoke the DeleteMembers API.
      def disassociate_from_master_account(
        detector_id : String
      ) : Protocol::Request
        input = Types::DisassociateFromMasterAccountRequest.new(detector_id: detector_id)
        disassociate_from_master_account(input)
      end
      def disassociate_from_master_account(input : Types::DisassociateFromMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates GuardDuty member accounts (from the current administrator account) specified by the
      # account IDs. When you disassociate an invited member from a GuardDuty delegated administrator, the
      # member account details obtained from the CreateMembers API, including the associated email
      # addresses, are retained. This is done so that the delegated administrator can invoke the
      # InviteMembers API without the need to invoke the CreateMembers API again. To remove the details
      # associated with a member account, the delegated administrator must invoke the DeleteMembers API.
      # With autoEnableOrganizationMembers configuration for your organization set to ALL , you'll receive
      # an error if you attempt to disassociate a member account before removing them from your
      # organization. If you disassociate a member account that was added by invitation, the member account
      # details obtained from this API, including the associated email addresses, will be retained. This is
      # done so that the delegated administrator can invoke the InviteMembers API without the need to invoke
      # the CreateMembers API again. To remove the details associated with a member account, the delegated
      # administrator must invoke the DeleteMembers API. When the member accounts added through
      # Organizations are later disassociated, you (administrator) can't invite them by calling the
      # InviteMembers API. You can create an association with these member accounts again only by calling
      # the CreateMembers API.
      def disassociate_members(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::DisassociateMembersRequest.new(account_ids: account_ids, detector_id: detector_id)
        disassociate_members(input)
      end
      def disassociate_members(input : Types::DisassociateMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates an Amazon Web Services account within the organization as your GuardDuty delegated
      # administrator. Only the organization's management account can run this API operation.
      def enable_organization_admin_account(
        admin_account_id : String
      ) : Protocol::Request
        input = Types::EnableOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id)
        enable_organization_admin_account(input)
      end
      def enable_organization_admin_account(input : Types::EnableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details of the GuardDuty administrator account associated with the current GuardDuty
      # member account. Based on the type of account that runs this API, the following list shows how the
      # API behavior varies: When the GuardDuty administrator account runs this API, it will return success
      # ( HTTP 200 ) but no content. When a member account runs this API, it will return the details of the
      # GuardDuty administrator account that is associated with this calling member account. When an
      # individual account (not associated with an organization) runs this API, it will return success (
      # HTTP 200 ) but no content.
      def get_administrator_account(
        detector_id : String
      ) : Protocol::Request
        input = Types::GetAdministratorAccountRequest.new(detector_id: detector_id)
        get_administrator_account(input)
      end
      def get_administrator_account(input : Types::GetAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves aggregated statistics for your account. If you are a GuardDuty administrator, you can
      # retrieve the statistics for all the resources associated with the active member accounts in your
      # organization who have enabled Runtime Monitoring and have the GuardDuty security agent running on
      # their resources.
      def get_coverage_statistics(
        detector_id : String,
        statistics_type : Array(String),
        filter_criteria : Types::CoverageFilterCriteria? = nil
      ) : Protocol::Request
        input = Types::GetCoverageStatisticsRequest.new(detector_id: detector_id, statistics_type: statistics_type, filter_criteria: filter_criteria)
        get_coverage_statistics(input)
      end
      def get_coverage_statistics(input : Types::GetCoverageStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COVERAGE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a GuardDuty detector specified by the detectorId. There might be regional differences
      # because some data sources might not be available in all the Amazon Web Services Regions where
      # GuardDuty is presently supported. For more information, see Regions and endpoints .
      def get_detector(
        detector_id : String
      ) : Protocol::Request
        input = Types::GetDetectorRequest.new(detector_id: detector_id)
        get_detector(input)
      end
      def get_detector(input : Types::GetDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details of the filter specified by the filter name.
      def get_filter(
        detector_id : String,
        filter_name : String
      ) : Protocol::Request
        input = Types::GetFilterRequest.new(detector_id: detector_id, filter_name: filter_name)
        get_filter(input)
      end
      def get_filter(input : Types::GetFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes Amazon GuardDuty findings specified by finding IDs.
      def get_findings(
        detector_id : String,
        finding_ids : Array(String),
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::GetFindingsRequest.new(detector_id: detector_id, finding_ids: finding_ids, sort_criteria: sort_criteria)
        get_findings(input)
      end
      def get_findings(input : Types::GetFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists GuardDuty findings statistics for the specified detector ID. You must provide either
      # findingStatisticTypes or groupBy parameter, and not both. You can use the maxResults and orderBy
      # parameters only when using groupBy . There might be regional differences because some flags might
      # not be available in all the Regions where GuardDuty is currently supported. For more information,
      # see Regions and endpoints .
      def get_findings_statistics(
        detector_id : String,
        finding_criteria : Types::FindingCriteria? = nil,
        finding_statistic_types : Array(String)? = nil,
        group_by : String? = nil,
        max_results : Int32? = nil,
        order_by : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingsStatisticsRequest.new(detector_id: detector_id, finding_criteria: finding_criteria, finding_statistic_types: finding_statistic_types, group_by: group_by, max_results: max_results, order_by: order_by)
        get_findings_statistics(input)
      end
      def get_findings_statistics(input : Types::GetFindingsStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the IPSet specified by the ipSetId .
      def get_ip_set(
        detector_id : String,
        ip_set_id : String
      ) : Protocol::Request
        input = Types::GetIPSetRequest.new(detector_id: detector_id, ip_set_id: ip_set_id)
        get_ip_set(input)
      end
      def get_ip_set(input : Types::GetIPSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IP_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the count of all GuardDuty membership invitations that were sent to the current member
      # account except the currently accepted invitation.
      def get_invitations_count : Protocol::Request
        input = Types::GetInvitationsCountRequest.new
        get_invitations_count(input)
      end
      def get_invitations_count(input : Types::GetInvitationsCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVITATIONS_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the Malware Protection plan details associated with a Malware Protection plan ID.
      def get_malware_protection_plan(
        malware_protection_plan_id : String
      ) : Protocol::Request
        input = Types::GetMalwareProtectionPlanRequest.new(malware_protection_plan_id: malware_protection_plan_id)
        get_malware_protection_plan(input)
      end
      def get_malware_protection_plan(input : Types::GetMalwareProtectionPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MALWARE_PROTECTION_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the detailed information for a specific malware scan. Each member account can view the
      # malware scan details for their own account. An administrator can view malware scan details for all
      # accounts in the organization. There might be regional differences because some data sources might
      # not be available in all the Amazon Web Services Regions where GuardDuty is presently supported. For
      # more information, see Regions and endpoints .
      def get_malware_scan(
        scan_id : String
      ) : Protocol::Request
        input = Types::GetMalwareScanRequest.new(scan_id: scan_id)
        get_malware_scan(input)
      end
      def get_malware_scan(input : Types::GetMalwareScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MALWARE_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details of the malware scan settings. There might be regional differences because some
      # data sources might not be available in all the Amazon Web Services Regions where GuardDuty is
      # presently supported. For more information, see Regions and endpoints .
      def get_malware_scan_settings(
        detector_id : String
      ) : Protocol::Request
        input = Types::GetMalwareScanSettingsRequest.new(detector_id: detector_id)
        get_malware_scan_settings(input)
      end
      def get_malware_scan_settings(input : Types::GetMalwareScanSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MALWARE_SCAN_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details for the GuardDuty administrator account associated with the current GuardDuty
      # member account.
      def get_master_account(
        detector_id : String
      ) : Protocol::Request
        input = Types::GetMasterAccountRequest.new(detector_id: detector_id)
        get_master_account(input)
      end
      def get_master_account(input : Types::GetMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes which data sources are enabled for the member account's detector. There might be regional
      # differences because some data sources might not be available in all the Amazon Web Services Regions
      # where GuardDuty is presently supported. For more information, see Regions and endpoints .
      def get_member_detectors(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::GetMemberDetectorsRequest.new(account_ids: account_ids, detector_id: detector_id)
        get_member_detectors(input)
      end
      def get_member_detectors(input : Types::GetMemberDetectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBER_DETECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves GuardDuty member accounts (of the current GuardDuty administrator account) specified by
      # the account IDs.
      def get_members(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::GetMembersRequest.new(account_ids: account_ids, detector_id: detector_id)
        get_members(input)
      end
      def get_members(input : Types::GetMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves how many active member accounts have each feature enabled within GuardDuty. Only a
      # delegated GuardDuty administrator of an organization can run this API. When you create a new
      # organization, it might take up to 24 hours to generate the statistics for the entire organization.
      def get_organization_statistics : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORGANIZATION_STATISTICS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the number of days left for each data source used in the free trial period.
      def get_remaining_free_trial_days(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::GetRemainingFreeTrialDaysRequest.new(account_ids: account_ids, detector_id: detector_id)
        get_remaining_free_trial_days(input)
      end
      def get_remaining_free_trial_days(input : Types::GetRemainingFreeTrialDaysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REMAINING_FREE_TRIAL_DAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the threat entity set associated with the specified threatEntitySetId .
      def get_threat_entity_set(
        detector_id : String,
        threat_entity_set_id : String
      ) : Protocol::Request
        input = Types::GetThreatEntitySetRequest.new(detector_id: detector_id, threat_entity_set_id: threat_entity_set_id)
        get_threat_entity_set(input)
      end
      def get_threat_entity_set(input : Types::GetThreatEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THREAT_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.
      def get_threat_intel_set(
        detector_id : String,
        threat_intel_set_id : String
      ) : Protocol::Request
        input = Types::GetThreatIntelSetRequest.new(detector_id: detector_id, threat_intel_set_id: threat_intel_set_id)
        get_threat_intel_set(input)
      end
      def get_threat_intel_set(input : Types::GetThreatIntelSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_THREAT_INTEL_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the trusted entity set associated with the specified trustedEntitySetId .
      def get_trusted_entity_set(
        detector_id : String,
        trusted_entity_set_id : String
      ) : Protocol::Request
        input = Types::GetTrustedEntitySetRequest.new(detector_id: detector_id, trusted_entity_set_id: trusted_entity_set_id)
        get_trusted_entity_set(input)
      end
      def get_trusted_entity_set(input : Types::GetTrustedEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRUSTED_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon GuardDuty usage statistics over the last 30 days for the specified detector ID. For
      # newly enabled detectors or data sources, the cost returned will include only the usage so far under
      # 30 days. This may differ from the cost metrics in the console, which project usage over 30 days to
      # provide a monthly cost estimate. For more information, see Understanding How Usage Costs are
      # Calculated .
      def get_usage_statistics(
        detector_id : String,
        usage_criteria : Types::UsageCriteria,
        usage_statistic_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        unit : String? = nil
      ) : Protocol::Request
        input = Types::GetUsageStatisticsRequest.new(detector_id: detector_id, usage_criteria: usage_criteria, usage_statistic_type: usage_statistic_type, max_results: max_results, next_token: next_token, unit: unit)
        get_usage_statistics(input)
      end
      def get_usage_statistics(input : Types::GetUsageStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invites Amazon Web Services accounts to become members of an organization administered by the Amazon
      # Web Services account that invokes this API. If you are using Amazon Web Services Organizations to
      # manage your GuardDuty environment, this step is not needed. For more information, see Managing
      # accounts with organizations . To invite Amazon Web Services accounts, the first step is to ensure
      # that GuardDuty has been enabled in the potential member accounts. You can now invoke this API to add
      # accounts by invitation. The invited accounts can either accept or decline the invitation from their
      # GuardDuty accounts. Each invited Amazon Web Services account can choose to accept the invitation
      # from only one Amazon Web Services account. For more information, see Managing GuardDuty accounts by
      # invitation . After the invite has been accepted and you choose to disassociate a member account (by
      # using DisassociateMembers ) from your account, the details of the member account obtained by
      # invoking CreateMembers , including the associated email addresses, will be retained. This is done so
      # that you can invoke InviteMembers without the need to invoke CreateMembers again. To remove the
      # details associated with a member account, you must also invoke DeleteMembers . If you disassociate a
      # member account that was added by invitation, the member account details obtained from this API,
      # including the associated email addresses, will be retained. This is done so that the delegated
      # administrator can invoke the InviteMembers API without the need to invoke the CreateMembers API
      # again. To remove the details associated with a member account, the delegated administrator must
      # invoke the DeleteMembers API. When the member accounts added through Organizations are later
      # disassociated, you (administrator) can't invite them by calling the InviteMembers API. You can
      # create an association with these member accounts again only by calling the CreateMembers API.
      def invite_members(
        account_ids : Array(String),
        detector_id : String,
        disable_email_notification : Bool? = nil,
        message : String? = nil
      ) : Protocol::Request
        input = Types::InviteMembersRequest.new(account_ids: account_ids, detector_id: detector_id, disable_email_notification: disable_email_notification, message: message)
        invite_members(input)
      end
      def invite_members(input : Types::InviteMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVITE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists coverage details for your GuardDuty account. If you're a GuardDuty administrator, you can
      # retrieve all resources associated with the active member accounts in your organization. Make sure
      # the accounts have Runtime Monitoring enabled and GuardDuty agent running on their resources.
      def list_coverage(
        detector_id : String,
        filter_criteria : Types::CoverageFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::CoverageSortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListCoverageRequest.new(detector_id: detector_id, filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_coverage(input)
      end
      def list_coverage(input : Types::ListCoverageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COVERAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists detectorIds of all the existing Amazon GuardDuty detector resources.
      def list_detectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDetectorsRequest.new(max_results: max_results, next_token: next_token)
        list_detectors(input)
      end
      def list_detectors(input : Types::ListDetectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DETECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of the current filters.
      def list_filters(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFiltersRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_filters(input)
      end
      def list_filters(input : Types::ListFiltersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FILTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists GuardDuty findings for the specified detector ID. There might be regional differences because
      # some flags might not be available in all the Regions where GuardDuty is currently supported. For
      # more information, see Regions and endpoints .
      def list_findings(
        detector_id : String,
        finding_criteria : Types::FindingCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListFindingsRequest.new(detector_id: detector_id, finding_criteria: finding_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_findings(input)
      end
      def list_findings(input : Types::ListFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the IPSets of the GuardDuty service specified by the detector ID. If you use this operation
      # from a member account, the IPSets returned are the IPSets from the associated administrator account.
      def list_ip_sets(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIPSetsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_ip_sets(input)
      end
      def list_ip_sets(input : Types::ListIPSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IP_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all GuardDuty membership invitations that were sent to the current Amazon Web Services
      # account.
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

      # Lists the Malware Protection plan IDs associated with the protected resources in your Amazon Web
      # Services account.
      def list_malware_protection_plans(
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMalwareProtectionPlansRequest.new(next_token: next_token)
        list_malware_protection_plans(input)
      end
      def list_malware_protection_plans(input : Types::ListMalwareProtectionPlansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MALWARE_PROTECTION_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of malware scans. Each member account can view the malware scans for their own
      # accounts. An administrator can view the malware scans for all of its members' accounts.
      def list_malware_scans(
        filter_criteria : Types::ListMalwareScansFilterCriteria? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListMalwareScansRequest.new(filter_criteria: filter_criteria, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        list_malware_scans(input)
      end
      def list_malware_scans(input : Types::ListMalwareScansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MALWARE_SCANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details about all member accounts for the current GuardDuty administrator account.
      def list_members(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        only_associated : String? = nil
      ) : Protocol::Request
        input = Types::ListMembersRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token, only_associated: only_associated)
        list_members(input)
      end
      def list_members(input : Types::ListMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the accounts designated as GuardDuty delegated administrators. Only the organization's
      # management account can run this API operation.
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

      # Returns a list of publishing destinations associated with the specified detectorId .
      def list_publishing_destinations(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPublishingDestinationsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_publishing_destinations(input)
      end
      def list_publishing_destinations(input : Types::ListPublishingDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PUBLISHING_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for a resource. Tagging is currently supported for detectors, finding filters, IP sets,
      # threat intel sets, and publishing destination, with a limit of 50 tags per resource. When invoked,
      # this operation returns all assigned tags for a given resource.
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

      # Lists the threat entity sets associated with the specified GuardDuty detector ID. If you use this
      # operation from a member account, the threat entity sets that are returned as a response, belong to
      # the administrator account.
      def list_threat_entity_sets(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThreatEntitySetsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_threat_entity_sets(input)
      end
      def list_threat_entity_sets(input : Types::ListThreatEntitySetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THREAT_ENTITY_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the ThreatIntelSets of the GuardDuty service specified by the detector ID. If you use this
      # operation from a member account, the ThreatIntelSets associated with the administrator account are
      # returned.
      def list_threat_intel_sets(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThreatIntelSetsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_threat_intel_sets(input)
      end
      def list_threat_intel_sets(input : Types::ListThreatIntelSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THREAT_INTEL_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the trusted entity sets associated with the specified GuardDuty detector ID. If you use this
      # operation from a member account, the trusted entity sets that are returned as a response, belong to
      # the administrator account.
      def list_trusted_entity_sets(
        detector_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrustedEntitySetsRequest.new(detector_id: detector_id, max_results: max_results, next_token: next_token)
        list_trusted_entity_sets(input)
      end
      def list_trusted_entity_sets(input : Types::ListTrustedEntitySetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRUSTED_ENTITY_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a malware scan for a specific S3 object. This API allows you to perform on-demand malware
      # scanning of individual objects in S3 buckets that have Malware Protection for S3 enabled. When you
      # use this API, the Amazon Web Services service terms for GuardDuty Malware Protection apply. For more
      # information, see Amazon Web Services service terms for GuardDuty Malware Protection .
      def send_object_malware_scan(
        s3_object : Types::S3ObjectForSendObjectMalwareScan? = nil
      ) : Protocol::Request
        input = Types::SendObjectMalwareScanRequest.new(s3_object: s3_object)
        send_object_malware_scan(input)
      end
      def send_object_malware_scan(input : Types::SendObjectMalwareScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_OBJECT_MALWARE_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates the malware scan. Invoking this API will automatically create the Service-linked role in
      # the corresponding account if the resourceArn belongs to an EC2 instance. When the malware scan
      # starts, you can use the associated scan ID to track the status of the scan. For more information,
      # see ListMalwareScans and GetMalwareScan . When you use this API, the Amazon Web Services service
      # terms for GuardDuty Malware Protection apply. For more information, see Amazon Web Services service
      # terms for GuardDuty Malware Protection .
      def start_malware_scan(
        resource_arn : String,
        client_token : String? = nil,
        scan_configuration : Types::StartMalwareScanConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartMalwareScanRequest.new(resource_arn: resource_arn, client_token: client_token, scan_configuration: scan_configuration)
        start_malware_scan(input)
      end
      def start_malware_scan(input : Types::StartMalwareScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MALWARE_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Turns on GuardDuty monitoring of the specified member accounts. Use this operation to restart
      # monitoring of accounts that you stopped monitoring with the StopMonitoringMembers operation.
      def start_monitoring_members(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::StartMonitoringMembersRequest.new(account_ids: account_ids, detector_id: detector_id)
        start_monitoring_members(input)
      end
      def start_monitoring_members(input : Types::StartMonitoringMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MONITORING_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops GuardDuty monitoring for the specified member accounts. Use the StartMonitoringMembers
      # operation to restart monitoring for those accounts. With autoEnableOrganizationMembers configuration
      # for your organization set to ALL , you'll receive an error if you attempt to stop monitoring the
      # member accounts in your organization.
      def stop_monitoring_members(
        account_ids : Array(String),
        detector_id : String
      ) : Protocol::Request
        input = Types::StopMonitoringMembersRequest.new(account_ids: account_ids, detector_id: detector_id)
        stop_monitoring_members(input)
      end
      def stop_monitoring_members(input : Types::StopMonitoringMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_MONITORING_MEMBERS, input, endpoint)
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

      # Unarchives GuardDuty findings specified by the findingIds .
      def unarchive_findings(
        detector_id : String,
        finding_ids : Array(String)
      ) : Protocol::Request
        input = Types::UnarchiveFindingsRequest.new(detector_id: detector_id, finding_ids: finding_ids)
        unarchive_findings(input)
      end
      def unarchive_findings(input : Types::UnarchiveFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNARCHIVE_FINDINGS, input, endpoint)
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

      # Updates the GuardDuty detector specified by the detector ID. Specifying both EKS Runtime Monitoring
      # ( EKS_RUNTIME_MONITORING ) and Runtime Monitoring ( RUNTIME_MONITORING ) will cause an error. You
      # can add only one of these two features because Runtime Monitoring already includes the threat
      # detection for Amazon EKS resources. For more information, see Runtime Monitoring . There might be
      # regional differences because some data sources might not be available in all the Amazon Web Services
      # Regions where GuardDuty is presently supported. For more information, see Regions and endpoints .
      def update_detector(
        detector_id : String,
        data_sources : Types::DataSourceConfigurations? = nil,
        enable : Bool? = nil,
        features : Array(Types::DetectorFeatureConfiguration)? = nil,
        finding_publishing_frequency : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDetectorRequest.new(detector_id: detector_id, data_sources: data_sources, enable: enable, features: features, finding_publishing_frequency: finding_publishing_frequency)
        update_detector(input)
      end
      def update_detector(input : Types::UpdateDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the filter specified by the filter name.
      def update_filter(
        detector_id : String,
        filter_name : String,
        action : String? = nil,
        description : String? = nil,
        finding_criteria : Types::FindingCriteria? = nil,
        rank : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateFilterRequest.new(detector_id: detector_id, filter_name: filter_name, action: action, description: description, finding_criteria: finding_criteria, rank: rank)
        update_filter(input)
      end
      def update_filter(input : Types::UpdateFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Marks the specified GuardDuty findings as useful or not useful.
      def update_findings_feedback(
        detector_id : String,
        feedback : String,
        finding_ids : Array(String),
        comments : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFindingsFeedbackRequest.new(detector_id: detector_id, feedback: feedback, finding_ids: finding_ids, comments: comments)
        update_findings_feedback(input)
      end
      def update_findings_feedback(input : Types::UpdateFindingsFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FINDINGS_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the IPSet specified by the IPSet ID.
      def update_ip_set(
        detector_id : String,
        ip_set_id : String,
        activate : Bool? = nil,
        expected_bucket_owner : String? = nil,
        location : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIPSetRequest.new(detector_id: detector_id, ip_set_id: ip_set_id, activate: activate, expected_bucket_owner: expected_bucket_owner, location: location, name: name)
        update_ip_set(input)
      end
      def update_ip_set(input : Types::UpdateIPSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IP_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Malware Protection plan resource.
      def update_malware_protection_plan(
        malware_protection_plan_id : String,
        actions : Types::MalwareProtectionPlanActions? = nil,
        protected_resource : Types::UpdateProtectedResource? = nil,
        role : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMalwareProtectionPlanRequest.new(malware_protection_plan_id: malware_protection_plan_id, actions: actions, protected_resource: protected_resource, role: role)
        update_malware_protection_plan(input)
      end
      def update_malware_protection_plan(input : Types::UpdateMalwareProtectionPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MALWARE_PROTECTION_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the malware scan settings. There might be regional differences because some data sources
      # might not be available in all the Amazon Web Services Regions where GuardDuty is presently
      # supported. For more information, see Regions and endpoints .
      def update_malware_scan_settings(
        detector_id : String,
        ebs_snapshot_preservation : String? = nil,
        scan_resource_criteria : Types::ScanResourceCriteria? = nil
      ) : Protocol::Request
        input = Types::UpdateMalwareScanSettingsRequest.new(detector_id: detector_id, ebs_snapshot_preservation: ebs_snapshot_preservation, scan_resource_criteria: scan_resource_criteria)
        update_malware_scan_settings(input)
      end
      def update_malware_scan_settings(input : Types::UpdateMalwareScanSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MALWARE_SCAN_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Contains information on member accounts to be updated. Specifying both EKS Runtime Monitoring (
      # EKS_RUNTIME_MONITORING ) and Runtime Monitoring ( RUNTIME_MONITORING ) will cause an error. You can
      # add only one of these two features because Runtime Monitoring already includes the threat detection
      # for Amazon EKS resources. For more information, see Runtime Monitoring . There might be regional
      # differences because some data sources might not be available in all the Amazon Web Services Regions
      # where GuardDuty is presently supported. For more information, see Regions and endpoints .
      def update_member_detectors(
        account_ids : Array(String),
        detector_id : String,
        data_sources : Types::DataSourceConfigurations? = nil,
        features : Array(Types::MemberFeaturesConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateMemberDetectorsRequest.new(account_ids: account_ids, detector_id: detector_id, data_sources: data_sources, features: features)
        update_member_detectors(input)
      end
      def update_member_detectors(input : Types::UpdateMemberDetectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMBER_DETECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Configures the delegated administrator account with the provided values. You must provide a value
      # for either autoEnableOrganizationMembers or autoEnable , but not both. Specifying both EKS Runtime
      # Monitoring ( EKS_RUNTIME_MONITORING ) and Runtime Monitoring ( RUNTIME_MONITORING ) will cause an
      # error. You can add only one of these two features because Runtime Monitoring already includes the
      # threat detection for Amazon EKS resources. For more information, see Runtime Monitoring . There
      # might be regional differences because some data sources might not be available in all the Amazon Web
      # Services Regions where GuardDuty is presently supported. For more information, see Regions and
      # endpoints .
      def update_organization_configuration(
        detector_id : String,
        auto_enable : Bool? = nil,
        auto_enable_organization_members : String? = nil,
        data_sources : Types::OrganizationDataSourceConfigurations? = nil,
        features : Array(Types::OrganizationFeatureConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateOrganizationConfigurationRequest.new(detector_id: detector_id, auto_enable: auto_enable, auto_enable_organization_members: auto_enable_organization_members, data_sources: data_sources, features: features)
        update_organization_configuration(input)
      end
      def update_organization_configuration(input : Types::UpdateOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information about the publishing destination specified by the destinationId .
      def update_publishing_destination(
        destination_id : String,
        detector_id : String,
        destination_properties : Types::DestinationProperties? = nil
      ) : Protocol::Request
        input = Types::UpdatePublishingDestinationRequest.new(destination_id: destination_id, detector_id: detector_id, destination_properties: destination_properties)
        update_publishing_destination(input)
      end
      def update_publishing_destination(input : Types::UpdatePublishingDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PUBLISHING_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the threat entity set associated with the specified threatEntitySetId .
      def update_threat_entity_set(
        detector_id : String,
        threat_entity_set_id : String,
        activate : Bool? = nil,
        expected_bucket_owner : String? = nil,
        location : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThreatEntitySetRequest.new(detector_id: detector_id, threat_entity_set_id: threat_entity_set_id, activate: activate, expected_bucket_owner: expected_bucket_owner, location: location, name: name)
        update_threat_entity_set(input)
      end
      def update_threat_entity_set(input : Types::UpdateThreatEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THREAT_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the ThreatIntelSet specified by the ThreatIntelSet ID.
      def update_threat_intel_set(
        detector_id : String,
        threat_intel_set_id : String,
        activate : Bool? = nil,
        expected_bucket_owner : String? = nil,
        location : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThreatIntelSetRequest.new(detector_id: detector_id, threat_intel_set_id: threat_intel_set_id, activate: activate, expected_bucket_owner: expected_bucket_owner, location: location, name: name)
        update_threat_intel_set(input)
      end
      def update_threat_intel_set(input : Types::UpdateThreatIntelSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THREAT_INTEL_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the trusted entity set associated with the specified trustedEntitySetId .
      def update_trusted_entity_set(
        detector_id : String,
        trusted_entity_set_id : String,
        activate : Bool? = nil,
        expected_bucket_owner : String? = nil,
        location : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTrustedEntitySetRequest.new(detector_id: detector_id, trusted_entity_set_id: trusted_entity_set_id, activate: activate, expected_bucket_owner: expected_bucket_owner, location: location, name: name)
        update_trusted_entity_set(input)
      end
      def update_trusted_entity_set(input : Types::UpdateTrustedEntitySetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRUSTED_ENTITY_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
