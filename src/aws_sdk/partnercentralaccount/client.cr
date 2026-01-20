module AwsSdk
  module PartnerCentralAccount
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Accepts a connection invitation from another partner, establishing a formal partnership connection
      # between the two parties.

      def accept_connection_invitation(
        catalog : String,
        client_token : String,
        identifier : String
      ) : Types::AcceptConnectionInvitationResponse

        input = Types::AcceptConnectionInvitationRequest.new(catalog: catalog, client_token: client_token, identifier: identifier)
        accept_connection_invitation(input)
      end

      def accept_connection_invitation(input : Types::AcceptConnectionInvitationRequest) : Types::AcceptConnectionInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_CONNECTION_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptConnectionInvitationResponse, "AcceptConnectionInvitation")
      end

      # Associates an email domain with AWS training and certification for the partner account, enabling
      # automatic verification of employee certifications.

      def associate_aws_training_certification_email_domain(
        catalog : String,
        email : String,
        email_verification_code : String,
        identifier : String,
        client_token : String? = nil
      ) : Types::AssociateAwsTrainingCertificationEmailDomainResponse

        input = Types::AssociateAwsTrainingCertificationEmailDomainRequest.new(catalog: catalog, email: email, email_verification_code: email_verification_code, identifier: identifier, client_token: client_token)
        associate_aws_training_certification_email_domain(input)
      end

      def associate_aws_training_certification_email_domain(input : Types::AssociateAwsTrainingCertificationEmailDomainRequest) : Types::AssociateAwsTrainingCertificationEmailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_AWS_TRAINING_CERTIFICATION_EMAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateAwsTrainingCertificationEmailDomainResponse, "AssociateAwsTrainingCertificationEmailDomain")
      end

      # Cancels an existing connection between partners, terminating the partnership relationship.

      def cancel_connection(
        catalog : String,
        client_token : String,
        connection_type : String,
        identifier : String,
        reason : String
      ) : Types::CancelConnectionResponse

        input = Types::CancelConnectionRequest.new(catalog: catalog, client_token: client_token, connection_type: connection_type, identifier: identifier, reason: reason)
        cancel_connection(input)
      end

      def cancel_connection(input : Types::CancelConnectionRequest) : Types::CancelConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelConnectionResponse, "CancelConnection")
      end

      # Cancels a pending connection invitation before it has been accepted or rejected.

      def cancel_connection_invitation(
        catalog : String,
        client_token : String,
        identifier : String
      ) : Types::CancelConnectionInvitationResponse

        input = Types::CancelConnectionInvitationRequest.new(catalog: catalog, client_token: client_token, identifier: identifier)
        cancel_connection_invitation(input)
      end

      def cancel_connection_invitation(input : Types::CancelConnectionInvitationRequest) : Types::CancelConnectionInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_CONNECTION_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelConnectionInvitationResponse, "CancelConnectionInvitation")
      end

      # Cancels an in-progress profile update task, stopping any pending changes to the partner profile.

      def cancel_profile_update_task(
        catalog : String,
        identifier : String,
        task_id : String,
        client_token : String? = nil
      ) : Types::CancelProfileUpdateTaskResponse

        input = Types::CancelProfileUpdateTaskRequest.new(catalog: catalog, identifier: identifier, task_id: task_id, client_token: client_token)
        cancel_profile_update_task(input)
      end

      def cancel_profile_update_task(input : Types::CancelProfileUpdateTaskRequest) : Types::CancelProfileUpdateTaskResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_PROFILE_UPDATE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelProfileUpdateTaskResponse, "CancelProfileUpdateTask")
      end

      # Creates a new connection invitation to establish a partnership with another organization.

      def create_connection_invitation(
        catalog : String,
        client_token : String,
        connection_type : String,
        email : String,
        message : String,
        name : String,
        receiver_identifier : String
      ) : Types::CreateConnectionInvitationResponse

        input = Types::CreateConnectionInvitationRequest.new(catalog: catalog, client_token: client_token, connection_type: connection_type, email: email, message: message, name: name, receiver_identifier: receiver_identifier)
        create_connection_invitation(input)
      end

      def create_connection_invitation(input : Types::CreateConnectionInvitationRequest) : Types::CreateConnectionInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONNECTION_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateConnectionInvitationResponse, "CreateConnectionInvitation")
      end

      # Creates a new partner account in the AWS Partner Network with the specified details and
      # configuration.

      def create_partner(
        alliance_lead_contact : Types::AllianceLeadContact,
        catalog : String,
        email_verification_code : String,
        legal_name : String,
        primary_solution_type : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePartnerResponse

        input = Types::CreatePartnerRequest.new(alliance_lead_contact: alliance_lead_contact, catalog: catalog, email_verification_code: email_verification_code, legal_name: legal_name, primary_solution_type: primary_solution_type, client_token: client_token, tags: tags)
        create_partner(input)
      end

      def create_partner(input : Types::CreatePartnerRequest) : Types::CreatePartnerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTNER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartnerResponse, "CreatePartner")
      end

      # Removes the association between an email domain and AWS training and certification for the partner
      # account.

      def disassociate_aws_training_certification_email_domain(
        catalog : String,
        domain_name : String,
        identifier : String,
        client_token : String? = nil
      ) : Types::DisassociateAwsTrainingCertificationEmailDomainResponse

        input = Types::DisassociateAwsTrainingCertificationEmailDomainRequest.new(catalog: catalog, domain_name: domain_name, identifier: identifier, client_token: client_token)
        disassociate_aws_training_certification_email_domain(input)
      end

      def disassociate_aws_training_certification_email_domain(input : Types::DisassociateAwsTrainingCertificationEmailDomainRequest) : Types::DisassociateAwsTrainingCertificationEmailDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_AWS_TRAINING_CERTIFICATION_EMAIL_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateAwsTrainingCertificationEmailDomainResponse, "DisassociateAwsTrainingCertificationEmailDomain")
      end

      # Retrieves the alliance lead contact information for a partner account.

      def get_alliance_lead_contact(
        catalog : String,
        identifier : String
      ) : Types::GetAllianceLeadContactResponse

        input = Types::GetAllianceLeadContactRequest.new(catalog: catalog, identifier: identifier)
        get_alliance_lead_contact(input)
      end

      def get_alliance_lead_contact(input : Types::GetAllianceLeadContactRequest) : Types::GetAllianceLeadContactResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ALLIANCE_LEAD_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAllianceLeadContactResponse, "GetAllianceLeadContact")
      end

      # Retrieves detailed information about a specific connection between partners.

      def get_connection(
        catalog : String,
        identifier : String
      ) : Types::GetConnectionResponse

        input = Types::GetConnectionRequest.new(catalog: catalog, identifier: identifier)
        get_connection(input)
      end

      def get_connection(input : Types::GetConnectionRequest) : Types::GetConnectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionResponse, "GetConnection")
      end

      # Retrieves detailed information about a specific connection invitation.

      def get_connection_invitation(
        catalog : String,
        identifier : String
      ) : Types::GetConnectionInvitationResponse

        input = Types::GetConnectionInvitationRequest.new(catalog: catalog, identifier: identifier)
        get_connection_invitation(input)
      end

      def get_connection_invitation(input : Types::GetConnectionInvitationRequest) : Types::GetConnectionInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionInvitationResponse, "GetConnectionInvitation")
      end

      # Retrieves the connection preferences for a partner account, including access settings and
      # exclusions.

      def get_connection_preferences(
        catalog : String
      ) : Types::GetConnectionPreferencesResponse

        input = Types::GetConnectionPreferencesRequest.new(catalog: catalog)
        get_connection_preferences(input)
      end

      def get_connection_preferences(input : Types::GetConnectionPreferencesRequest) : Types::GetConnectionPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionPreferencesResponse, "GetConnectionPreferences")
      end

      # Retrieves detailed information about a specific partner account.

      def get_partner(
        catalog : String,
        identifier : String
      ) : Types::GetPartnerResponse

        input = Types::GetPartnerRequest.new(catalog: catalog, identifier: identifier)
        get_partner(input)
      end

      def get_partner(input : Types::GetPartnerRequest) : Types::GetPartnerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARTNER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPartnerResponse, "GetPartner")
      end

      # Retrieves information about a specific profile update task.

      def get_profile_update_task(
        catalog : String,
        identifier : String
      ) : Types::GetProfileUpdateTaskResponse

        input = Types::GetProfileUpdateTaskRequest.new(catalog: catalog, identifier: identifier)
        get_profile_update_task(input)
      end

      def get_profile_update_task(input : Types::GetProfileUpdateTaskRequest) : Types::GetProfileUpdateTaskResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROFILE_UPDATE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProfileUpdateTaskResponse, "GetProfileUpdateTask")
      end

      # Retrieves the visibility settings for a partner profile, determining who can see the profile
      # information.

      def get_profile_visibility(
        catalog : String,
        identifier : String
      ) : Types::GetProfileVisibilityResponse

        input = Types::GetProfileVisibilityRequest.new(catalog: catalog, identifier: identifier)
        get_profile_visibility(input)
      end

      def get_profile_visibility(input : Types::GetProfileVisibilityRequest) : Types::GetProfileVisibilityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROFILE_VISIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProfileVisibilityResponse, "GetProfileVisibility")
      end

      # Retrieves the current status and details of a verification process for a partner account. This
      # operation allows partners to check the progress and results of business or registrant verification
      # processes.

      def get_verification(
        verification_type : String
      ) : Types::GetVerificationResponse

        input = Types::GetVerificationRequest.new(verification_type: verification_type)
        get_verification(input)
      end

      def get_verification(input : Types::GetVerificationRequest) : Types::GetVerificationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_VERIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetVerificationResponse, "GetVerification")
      end

      # Lists connection invitations for the partner account, with optional filtering by status, type, and
      # other criteria.

      def list_connection_invitations(
        catalog : String,
        connection_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        other_participant_identifiers : Array(String)? = nil,
        participant_type : String? = nil,
        status : String? = nil
      ) : Types::ListConnectionInvitationsResponse

        input = Types::ListConnectionInvitationsRequest.new(catalog: catalog, connection_type: connection_type, max_results: max_results, next_token: next_token, other_participant_identifiers: other_participant_identifiers, participant_type: participant_type, status: status)
        list_connection_invitations(input)
      end

      def list_connection_invitations(input : Types::ListConnectionInvitationsRequest) : Types::ListConnectionInvitationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTION_INVITATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionInvitationsResponse, "ListConnectionInvitations")
      end

      # Lists active connections for the partner account, with optional filtering by connection type and
      # participant.

      def list_connections(
        catalog : String,
        connection_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        other_participant_identifiers : Array(String)? = nil
      ) : Types::ListConnectionsResponse

        input = Types::ListConnectionsRequest.new(catalog: catalog, connection_type: connection_type, max_results: max_results, next_token: next_token, other_participant_identifiers: other_participant_identifiers)
        list_connections(input)
      end

      def list_connections(input : Types::ListConnectionsRequest) : Types::ListConnectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONNECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConnectionsResponse, "ListConnections")
      end

      # Lists partner accounts in the catalog, providing a summary view of all partners.

      def list_partners(
        catalog : String,
        next_token : String? = nil
      ) : Types::ListPartnersResponse

        input = Types::ListPartnersRequest.new(catalog: catalog, next_token: next_token)
        list_partners(input)
      end

      def list_partners(input : Types::ListPartnersRequest) : Types::ListPartnersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARTNERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPartnersResponse, "ListPartners")
      end

      # Lists all tags associated with a specific AWS Partner Central Account resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Creates or updates the alliance lead contact information for a partner account.

      def put_alliance_lead_contact(
        alliance_lead_contact : Types::AllianceLeadContact,
        catalog : String,
        identifier : String,
        email_verification_code : String? = nil
      ) : Types::PutAllianceLeadContactResponse

        input = Types::PutAllianceLeadContactRequest.new(alliance_lead_contact: alliance_lead_contact, catalog: catalog, identifier: identifier, email_verification_code: email_verification_code)
        put_alliance_lead_contact(input)
      end

      def put_alliance_lead_contact(input : Types::PutAllianceLeadContactRequest) : Types::PutAllianceLeadContactResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ALLIANCE_LEAD_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAllianceLeadContactResponse, "PutAllianceLeadContact")
      end

      # Sets the visibility level for a partner profile, controlling who can view the profile information.

      def put_profile_visibility(
        catalog : String,
        identifier : String,
        visibility : String
      ) : Types::PutProfileVisibilityResponse

        input = Types::PutProfileVisibilityRequest.new(catalog: catalog, identifier: identifier, visibility: visibility)
        put_profile_visibility(input)
      end

      def put_profile_visibility(input : Types::PutProfileVisibilityRequest) : Types::PutProfileVisibilityResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PROFILE_VISIBILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutProfileVisibilityResponse, "PutProfileVisibility")
      end

      # Rejects a connection invitation from another partner, declining the partnership request.

      def reject_connection_invitation(
        catalog : String,
        client_token : String,
        identifier : String,
        reason : String? = nil
      ) : Types::RejectConnectionInvitationResponse

        input = Types::RejectConnectionInvitationRequest.new(catalog: catalog, client_token: client_token, identifier: identifier, reason: reason)
        reject_connection_invitation(input)
      end

      def reject_connection_invitation(input : Types::RejectConnectionInvitationRequest) : Types::RejectConnectionInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_CONNECTION_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectConnectionInvitationResponse, "RejectConnectionInvitation")
      end

      # Sends an email verification code to the specified email address for account verification purposes.

      def send_email_verification_code(
        catalog : String,
        email : String
      ) : Types::SendEmailVerificationCodeResponse

        input = Types::SendEmailVerificationCodeRequest.new(catalog: catalog, email: email)
        send_email_verification_code(input)
      end

      def send_email_verification_code(input : Types::SendEmailVerificationCodeRequest) : Types::SendEmailVerificationCodeResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_EMAIL_VERIFICATION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendEmailVerificationCodeResponse, "SendEmailVerificationCode")
      end

      # Initiates a profile update task to modify partner profile information asynchronously.

      def start_profile_update_task(
        catalog : String,
        identifier : String,
        task_details : Types::TaskDetails,
        client_token : String? = nil
      ) : Types::StartProfileUpdateTaskResponse

        input = Types::StartProfileUpdateTaskRequest.new(catalog: catalog, identifier: identifier, task_details: task_details, client_token: client_token)
        start_profile_update_task(input)
      end

      def start_profile_update_task(input : Types::StartProfileUpdateTaskRequest) : Types::StartProfileUpdateTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_PROFILE_UPDATE_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartProfileUpdateTaskResponse, "StartProfileUpdateTask")
      end

      # Initiates a new verification process for a partner account. This operation begins the verification
      # workflow for either business registration or individual registrant identity verification as required
      # by AWS Partner Central.

      def start_verification(
        client_token : String? = nil,
        verification_details : Types::VerificationDetails? = nil
      ) : Types::StartVerificationResponse

        input = Types::StartVerificationRequest.new(client_token: client_token, verification_details: verification_details)
        start_verification(input)
      end

      def start_verification(input : Types::StartVerificationRequest) : Types::StartVerificationResponse
        request = Protocol::JsonRpc.build_request(Model::START_VERIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartVerificationResponse, "StartVerification")
      end

      # Adds or updates tags for a specified AWS Partner Central Account resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes specified tags from an AWS Partner Central Account resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the connection preferences for a partner account, modifying access settings and exclusions.

      def update_connection_preferences(
        access_type : String,
        catalog : String,
        revision : Int64,
        excluded_participant_identifiers : Array(String)? = nil
      ) : Types::UpdateConnectionPreferencesResponse

        input = Types::UpdateConnectionPreferencesRequest.new(access_type: access_type, catalog: catalog, revision: revision, excluded_participant_identifiers: excluded_participant_identifiers)
        update_connection_preferences(input)
      end

      def update_connection_preferences(input : Types::UpdateConnectionPreferencesRequest) : Types::UpdateConnectionPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONNECTION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateConnectionPreferencesResponse, "UpdateConnectionPreferences")
      end
    end
  end
end
