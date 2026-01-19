module AwsSdk
  module SecurityIR
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

      # Provides information on whether the supplied account IDs are associated with a membership. AWS
      # account ID's may appear less than 12 characters and need to be zero-prepended. An example would be
      # 123123123 which is nine digits, and with zero-prepend would be 000123123123 . Not zero-prepending to
      # 12 digits could result in errors.
      def batch_get_member_account_details(
        account_ids : Array(String),
        membership_id : String
      ) : Protocol::Request
        input = Types::BatchGetMemberAccountDetailsRequest.new(account_ids: account_ids, membership_id: membership_id)
        batch_get_member_account_details(input)
      end
      def batch_get_member_account_details(input : Types::BatchGetMemberAccountDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_MEMBER_ACCOUNT_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an existing membership.
      def cancel_membership(
        membership_id : String
      ) : Protocol::Request
        input = Types::CancelMembershipRequest.new(membership_id: membership_id)
        cancel_membership(input)
      end
      def cancel_membership(input : Types::CancelMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Closes an existing case.
      def close_case(
        case_id : String
      ) : Protocol::Request
        input = Types::CloseCaseRequest.new(case_id: case_id)
        close_case(input)
      end
      def close_case(input : Types::CloseCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CLOSE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new case.
      def create_case(
        description : String,
        engagement_type : String,
        impacted_accounts : Array(String),
        reported_incident_start_date : Time,
        resolver_type : String,
        title : String,
        watchers : Array(Types::Watcher),
        client_token : String? = nil,
        impacted_aws_regions : Array(Types::ImpactedAwsRegion)? = nil,
        impacted_services : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        threat_actor_ip_addresses : Array(Types::ThreatActorIp)? = nil
      ) : Protocol::Request
        input = Types::CreateCaseRequest.new(description: description, engagement_type: engagement_type, impacted_accounts: impacted_accounts, reported_incident_start_date: reported_incident_start_date, resolver_type: resolver_type, title: title, watchers: watchers, client_token: client_token, impacted_aws_regions: impacted_aws_regions, impacted_services: impacted_services, tags: tags, threat_actor_ip_addresses: threat_actor_ip_addresses)
        create_case(input)
      end
      def create_case(input : Types::CreateCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a comment to an existing case.
      def create_case_comment(
        body : String,
        case_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateCaseCommentRequest.new(body: body, case_id: case_id, client_token: client_token)
        create_case_comment(input)
      end
      def create_case_comment(input : Types::CreateCaseCommentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CASE_COMMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new membership.
      def create_membership(
        incident_response_team : Array(Types::IncidentResponder),
        membership_name : String,
        client_token : String? = nil,
        cover_entire_organization : Bool? = nil,
        opt_in_features : Array(Types::OptInFeature)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMembershipRequest.new(incident_response_team: incident_response_team, membership_name: membership_name, client_token: client_token, cover_entire_organization: cover_entire_organization, opt_in_features: opt_in_features, tags: tags)
        create_membership(input)
      end
      def create_membership(input : Types::CreateMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the attributes of a case.
      def get_case(
        case_id : String
      ) : Protocol::Request
        input = Types::GetCaseRequest.new(case_id: case_id)
        get_case(input)
      end
      def get_case(input : Types::GetCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a Pre-Signed URL for uploading attachments into a case.
      def get_case_attachment_download_url(
        attachment_id : String,
        case_id : String
      ) : Protocol::Request
        input = Types::GetCaseAttachmentDownloadUrlRequest.new(attachment_id: attachment_id, case_id: case_id)
        get_case_attachment_download_url(input)
      end
      def get_case_attachment_download_url(input : Types::GetCaseAttachmentDownloadUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE_ATTACHMENT_DOWNLOAD_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Uploads an attachment to a case.
      def get_case_attachment_upload_url(
        case_id : String,
        content_length : Int64,
        file_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCaseAttachmentUploadUrlRequest.new(case_id: case_id, content_length: content_length, file_name: file_name, client_token: client_token)
        get_case_attachment_upload_url(input)
      end
      def get_case_attachment_upload_url(input : Types::GetCaseAttachmentUploadUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE_ATTACHMENT_UPLOAD_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the attributes of a membership.
      def get_membership(
        membership_id : String
      ) : Protocol::Request
        input = Types::GetMembershipRequest.new(membership_id: membership_id)
        get_membership(input)
      end
      def get_membership(input : Types::GetMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Views the case history for edits made to a designated case.
      def list_case_edits(
        case_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCaseEditsRequest.new(case_id: case_id, max_results: max_results, next_token: next_token)
        list_case_edits(input)
      end
      def list_case_edits(input : Types::ListCaseEditsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CASE_EDITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all cases the requester has access to.
      def list_cases(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCasesRequest.new(max_results: max_results, next_token: next_token)
        list_cases(input)
      end
      def list_cases(input : Types::ListCasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns comments for a designated case.
      def list_comments(
        case_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCommentsRequest.new(case_id: case_id, max_results: max_results, next_token: next_token)
        list_comments(input)
      end
      def list_comments(input : Types::ListCommentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Investigation performed by an agent for a security incident...
      def list_investigations(
        case_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvestigationsRequest.new(case_id: case_id, max_results: max_results, next_token: next_token)
        list_investigations(input)
      end
      def list_investigations(input : Types::ListInvestigationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVESTIGATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the memberships that the calling principal can access.
      def list_memberships(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMembershipsRequest.new(max_results: max_results, next_token: next_token)
        list_memberships(input)
      end
      def list_memberships(input : Types::ListMembershipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns currently configured tags on a resource.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send feedback based on response investigation action
      def send_feedback(
        case_id : String,
        result_id : String,
        usefulness : String,
        comment : String? = nil
      ) : Protocol::Request
        input = Types::SendFeedbackRequest.new(case_id: case_id, result_id: result_id, usefulness: usefulness, comment: comment)
        send_feedback(input)
      end
      def send_feedback(input : Types::SendFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag(s) to a designated resource.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag(s) from a designate resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing case.
      def update_case(
        case_id : String,
        actual_incident_start_date : Time? = nil,
        case_metadata : Array(Types::CaseMetadataEntry)? = nil,
        description : String? = nil,
        engagement_type : String? = nil,
        impacted_accounts_to_add : Array(String)? = nil,
        impacted_accounts_to_delete : Array(String)? = nil,
        impacted_aws_regions_to_add : Array(Types::ImpactedAwsRegion)? = nil,
        impacted_aws_regions_to_delete : Array(Types::ImpactedAwsRegion)? = nil,
        impacted_services_to_add : Array(String)? = nil,
        impacted_services_to_delete : Array(String)? = nil,
        reported_incident_start_date : Time? = nil,
        threat_actor_ip_addresses_to_add : Array(Types::ThreatActorIp)? = nil,
        threat_actor_ip_addresses_to_delete : Array(Types::ThreatActorIp)? = nil,
        title : String? = nil,
        watchers_to_add : Array(Types::Watcher)? = nil,
        watchers_to_delete : Array(Types::Watcher)? = nil
      ) : Protocol::Request
        input = Types::UpdateCaseRequest.new(case_id: case_id, actual_incident_start_date: actual_incident_start_date, case_metadata: case_metadata, description: description, engagement_type: engagement_type, impacted_accounts_to_add: impacted_accounts_to_add, impacted_accounts_to_delete: impacted_accounts_to_delete, impacted_aws_regions_to_add: impacted_aws_regions_to_add, impacted_aws_regions_to_delete: impacted_aws_regions_to_delete, impacted_services_to_add: impacted_services_to_add, impacted_services_to_delete: impacted_services_to_delete, reported_incident_start_date: reported_incident_start_date, threat_actor_ip_addresses_to_add: threat_actor_ip_addresses_to_add, threat_actor_ip_addresses_to_delete: threat_actor_ip_addresses_to_delete, title: title, watchers_to_add: watchers_to_add, watchers_to_delete: watchers_to_delete)
        update_case(input)
      end
      def update_case(input : Types::UpdateCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing case comment.
      def update_case_comment(
        body : String,
        case_id : String,
        comment_id : String
      ) : Protocol::Request
        input = Types::UpdateCaseCommentRequest.new(body: body, case_id: case_id, comment_id: comment_id)
        update_case_comment(input)
      end
      def update_case_comment(input : Types::UpdateCaseCommentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CASE_COMMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the state transitions for a designated cases. Self-managed : the following states are
      # available for self-managed cases. Submitted → Detection and Analysis Detection and Analysis →
      # Containment, Eradication, and Recovery Detection and Analysis → Post-incident Activities
      # Containment, Eradication, and Recovery → Detection and Analysis Containment, Eradication, and
      # Recovery → Post-incident Activities Post-incident Activities → Containment, Eradication, and
      # Recovery Post-incident Activities → Detection and Analysis Any → Closed AWS supported : You must use
      # the CloseCase API to close.
      def update_case_status(
        case_id : String,
        case_status : String
      ) : Protocol::Request
        input = Types::UpdateCaseStatusRequest.new(case_id: case_id, case_status: case_status)
        update_case_status(input)
      end
      def update_case_status(input : Types::UpdateCaseStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CASE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates membership configuration.
      def update_membership(
        membership_id : String,
        incident_response_team : Array(Types::IncidentResponder)? = nil,
        membership_accounts_configurations_update : Types::MembershipAccountsConfigurationsUpdate? = nil,
        membership_name : String? = nil,
        opt_in_features : Array(Types::OptInFeature)? = nil,
        undo_membership_cancellation : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateMembershipRequest.new(membership_id: membership_id, incident_response_team: incident_response_team, membership_accounts_configurations_update: membership_accounts_configurations_update, membership_name: membership_name, opt_in_features: opt_in_features, undo_membership_cancellation: undo_membership_cancellation)
        update_membership(input)
      end
      def update_membership(input : Types::UpdateMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resolver type for a case. This is a one-way action and cannot be reversed.
      def update_resolver_type(
        case_id : String,
        resolver_type : String
      ) : Protocol::Request
        input = Types::UpdateResolverTypeRequest.new(case_id: case_id, resolver_type: resolver_type)
        update_resolver_type(input)
      end
      def update_resolver_type(input : Types::UpdateResolverTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOLVER_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
