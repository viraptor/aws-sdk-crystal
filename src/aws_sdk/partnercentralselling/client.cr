module AwsSdk
  module PartnerCentralSelling
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

      # Use the AcceptEngagementInvitation action to accept an engagement invitation shared by AWS.
      # Accepting the invitation indicates your willingness to participate in the engagement, granting you
      # access to all engagement-related data.

      def accept_engagement_invitation(
        catalog : String,
        identifier : String
      ) : Nil

        input = Types::AcceptEngagementInvitationRequest.new(catalog: catalog, identifier: identifier)
        accept_engagement_invitation(input)
      end

      def accept_engagement_invitation(input : Types::AcceptEngagementInvitationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_ENGAGEMENT_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables you to reassign an existing Opportunity to another user within your Partner Central account.
      # The specified user receives the opportunity, and it appears on their Partner Central dashboard,
      # allowing them to take necessary actions or proceed with the opportunity. This is useful for
      # distributing opportunities to the appropriate team members or departments within your organization,
      # ensuring that each opportunity is handled by the right person. By default, the opportunity owner is
      # the one who creates it. Currently, there's no API to enumerate the list of available users.

      def assign_opportunity(
        assignee : Types::AssigneeContact,
        catalog : String,
        identifier : String
      ) : Nil

        input = Types::AssignOpportunityRequest.new(assignee: assignee, catalog: catalog, identifier: identifier)
        assign_opportunity(input)
      end

      def assign_opportunity(input : Types::AssignOpportunityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ASSIGN_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Enables you to create a formal association between an Opportunity and various related entities,
      # enriching the context and details of the opportunity for better collaboration and decision making.
      # You can associate an opportunity with the following entity types: Partner Solution: A software
      # product or consulting practice created and delivered by Partners. Partner Solutions help customers
      # address business challenges using Amazon Web Services services. Amazon Web Services Products: Amazon
      # Web Services offers many products and services that provide scalable, reliable, and cost-effective
      # infrastructure solutions. For the latest list of Amazon Web Services products, see Amazon Web
      # Services products . Amazon Web Services Marketplace private offer: Allows Amazon Web Services
      # Marketplace sellers to extend custom pricing and terms to individual Amazon Web Services customers.
      # Sellers can negotiate custom prices, payment schedules, and end user license terms through private
      # offers, enabling Amazon Web Services customers to acquire software solutions tailored to their
      # specific needs. For more information, see Private offers in Amazon Web Services Marketplace . To
      # obtain identifiers for these entities, use the following methods: Solution: Use the ListSolutions
      # operation. AWS Products: For the latest list of Amazon Web Services products, see Amazon Web
      # Services products . Amazon Web Services Marketplace private offer: Use the Using the Amazon Web
      # Services Marketplace Catalog API to list entities. Specifically, use the ListEntities operation to
      # retrieve a list of private offers. The request returns the details of available private offers. For
      # more information, see ListEntities .

      def associate_opportunity(
        catalog : String,
        opportunity_identifier : String,
        related_entity_identifier : String,
        related_entity_type : String
      ) : Nil

        input = Types::AssociateOpportunityRequest.new(catalog: catalog, opportunity_identifier: opportunity_identifier, related_entity_identifier: related_entity_identifier, related_entity_type: related_entity_type)
        associate_opportunity(input)
      end

      def associate_opportunity(input : Types::AssociateOpportunityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # The CreateEngagement action allows you to create an Engagement , which serves as a collaborative
      # space between different parties such as AWS Partners and AWS Sellers. This action automatically adds
      # the caller's AWS account as an active member of the newly created Engagement .

      def create_engagement(
        catalog : String,
        client_token : String,
        description : String,
        title : String,
        contexts : Array(Types::EngagementContextDetails)? = nil
      ) : Types::CreateEngagementResponse

        input = Types::CreateEngagementRequest.new(catalog: catalog, client_token: client_token, description: description, title: title, contexts: contexts)
        create_engagement(input)
      end

      def create_engagement(input : Types::CreateEngagementRequest) : Types::CreateEngagementResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEngagementResponse, "CreateEngagement")
      end

      # Creates a new context within an existing engagement. This action allows you to add contextual
      # information such as customer projects or documents to an engagement, providing additional details
      # that help facilitate collaboration between engagement members.

      def create_engagement_context(
        catalog : String,
        client_token : String,
        engagement_identifier : String,
        payload : Types::EngagementContextPayload,
        type : String
      ) : Types::CreateEngagementContextResponse

        input = Types::CreateEngagementContextRequest.new(catalog: catalog, client_token: client_token, engagement_identifier: engagement_identifier, payload: payload, type: type)
        create_engagement_context(input)
      end

      def create_engagement_context(input : Types::CreateEngagementContextRequest) : Types::CreateEngagementContextResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENGAGEMENT_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEngagementContextResponse, "CreateEngagementContext")
      end

      # This action creates an invitation from a sender to a single receiver to join an engagement.

      def create_engagement_invitation(
        catalog : String,
        client_token : String,
        engagement_identifier : String,
        invitation : Types::Invitation
      ) : Types::CreateEngagementInvitationResponse

        input = Types::CreateEngagementInvitationRequest.new(catalog: catalog, client_token: client_token, engagement_identifier: engagement_identifier, invitation: invitation)
        create_engagement_invitation(input)
      end

      def create_engagement_invitation(input : Types::CreateEngagementInvitationRequest) : Types::CreateEngagementInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENGAGEMENT_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEngagementInvitationResponse, "CreateEngagementInvitation")
      end

      # Creates an Opportunity record in Partner Central. Use this operation to create a potential business
      # opportunity for submission to Amazon Web Services. Creating an opportunity sets
      # Lifecycle.ReviewStatus to Pending Submission . To submit an opportunity, follow these steps: To
      # create the opportunity, use CreateOpportunity . To associate a solution with the opportunity, use
      # AssociateOpportunity . To start the engagement with AWS, use StartEngagementFromOpportunity . After
      # submission, you can't edit the opportunity until the review is complete. But opportunities in the
      # Pending Submission state must have complete details. You can update the opportunity while it's in
      # the Pending Submission state. There's a set of mandatory fields to create opportunities, but
      # consider providing optional fields to enrich the opportunity record.

      def create_opportunity(
        catalog : String,
        client_token : String,
        customer : Types::Customer? = nil,
        life_cycle : Types::LifeCycle? = nil,
        marketing : Types::Marketing? = nil,
        national_security : String? = nil,
        opportunity_team : Array(Types::Contact)? = nil,
        opportunity_type : String? = nil,
        origin : String? = nil,
        partner_opportunity_identifier : String? = nil,
        primary_needs_from_aws : Array(String)? = nil,
        project : Types::Project? = nil,
        software_revenue : Types::SoftwareRevenue? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOpportunityResponse

        input = Types::CreateOpportunityRequest.new(catalog: catalog, client_token: client_token, customer: customer, life_cycle: life_cycle, marketing: marketing, national_security: national_security, opportunity_team: opportunity_team, opportunity_type: opportunity_type, origin: origin, partner_opportunity_identifier: partner_opportunity_identifier, primary_needs_from_aws: primary_needs_from_aws, project: project, software_revenue: software_revenue, tags: tags)
        create_opportunity(input)
      end

      def create_opportunity(input : Types::CreateOpportunityRequest) : Types::CreateOpportunityResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOpportunityResponse, "CreateOpportunity")
      end

      # This action allows you to create an immutable snapshot of a specific resource, such as an
      # opportunity, within the context of an engagement. The snapshot captures a subset of the resource's
      # data based on the schema defined by the provided template.

      def create_resource_snapshot(
        catalog : String,
        client_token : String,
        engagement_identifier : String,
        resource_identifier : String,
        resource_snapshot_template_identifier : String,
        resource_type : String
      ) : Types::CreateResourceSnapshotResponse

        input = Types::CreateResourceSnapshotRequest.new(catalog: catalog, client_token: client_token, engagement_identifier: engagement_identifier, resource_identifier: resource_identifier, resource_snapshot_template_identifier: resource_snapshot_template_identifier, resource_type: resource_type)
        create_resource_snapshot(input)
      end

      def create_resource_snapshot(input : Types::CreateResourceSnapshotRequest) : Types::CreateResourceSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceSnapshotResponse, "CreateResourceSnapshot")
      end

      # Use this action to create a job to generate a snapshot of the specified resource within an
      # engagement. It initiates an asynchronous process to create a resource snapshot. The job creates a
      # new snapshot only if the resource state has changed, adhering to the same access control and
      # immutability rules as direct snapshot creation.

      def create_resource_snapshot_job(
        catalog : String,
        client_token : String,
        engagement_identifier : String,
        resource_identifier : String,
        resource_snapshot_template_identifier : String,
        resource_type : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateResourceSnapshotJobResponse

        input = Types::CreateResourceSnapshotJobRequest.new(catalog: catalog, client_token: client_token, engagement_identifier: engagement_identifier, resource_identifier: resource_identifier, resource_snapshot_template_identifier: resource_snapshot_template_identifier, resource_type: resource_type, tags: tags)
        create_resource_snapshot_job(input)
      end

      def create_resource_snapshot_job(input : Types::CreateResourceSnapshotJobRequest) : Types::CreateResourceSnapshotJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE_SNAPSHOT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceSnapshotJobResponse, "CreateResourceSnapshotJob")
      end

      # Use this action to deletes a previously created resource snapshot job. The job must be in a stopped
      # state before it can be deleted.

      def delete_resource_snapshot_job(
        catalog : String,
        resource_snapshot_job_identifier : String
      ) : Nil

        input = Types::DeleteResourceSnapshotJobRequest.new(catalog: catalog, resource_snapshot_job_identifier: resource_snapshot_job_identifier)
        delete_resource_snapshot_job(input)
      end

      def delete_resource_snapshot_job(input : Types::DeleteResourceSnapshotJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_SNAPSHOT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Allows you to remove an existing association between an Opportunity and related entities, such as a
      # Partner Solution, Amazon Web Services product, or an Amazon Web Services Marketplace offer. This
      # operation is the counterpart to AssociateOpportunity , and it provides flexibility to manage
      # associations as business needs change. Use this operation to update the associations of an
      # Opportunity due to changes in the related entities, or if an association was made in error. Ensuring
      # accurate associations helps maintain clarity and accuracy to track and manage business
      # opportunities. When you replace an entity, first attach the new entity and then disassociate the one
      # to be removed, especially if it's the last remaining entity that's required.

      def disassociate_opportunity(
        catalog : String,
        opportunity_identifier : String,
        related_entity_identifier : String,
        related_entity_type : String
      ) : Nil

        input = Types::DisassociateOpportunityRequest.new(catalog: catalog, opportunity_identifier: opportunity_identifier, related_entity_identifier: related_entity_identifier, related_entity_type: related_entity_type)
        disassociate_opportunity(input)
      end

      def disassociate_opportunity(input : Types::DisassociateOpportunityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves a summary of an AWS Opportunity. This summary includes high-level details about the
      # opportunity sourced from AWS, such as lifecycle information, customer details, and involvement type.
      # It is useful for tracking updates on the AWS opportunity corresponding to an opportunity in the
      # partner's account.

      def get_aws_opportunity_summary(
        catalog : String,
        related_opportunity_identifier : String
      ) : Types::GetAwsOpportunitySummaryResponse

        input = Types::GetAwsOpportunitySummaryRequest.new(catalog: catalog, related_opportunity_identifier: related_opportunity_identifier)
        get_aws_opportunity_summary(input)
      end

      def get_aws_opportunity_summary(input : Types::GetAwsOpportunitySummaryRequest) : Types::GetAwsOpportunitySummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AWS_OPPORTUNITY_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAwsOpportunitySummaryResponse, "GetAwsOpportunitySummary")
      end

      # Use this action to retrieve the engagement record for a given EngagementIdentifier .

      def get_engagement(
        catalog : String,
        identifier : String
      ) : Types::GetEngagementResponse

        input = Types::GetEngagementRequest.new(catalog: catalog, identifier: identifier)
        get_engagement(input)
      end

      def get_engagement(input : Types::GetEngagementRequest) : Types::GetEngagementResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEngagementResponse, "GetEngagement")
      end

      # Retrieves the details of an engagement invitation shared by AWS with a partner. The information
      # includes aspects such as customer, project details, and lifecycle information. To connect an
      # engagement invitation with an opportunity, match the invitation’s Payload.Project.Title with
      # opportunity Project.Title .

      def get_engagement_invitation(
        catalog : String,
        identifier : String
      ) : Types::GetEngagementInvitationResponse

        input = Types::GetEngagementInvitationRequest.new(catalog: catalog, identifier: identifier)
        get_engagement_invitation(input)
      end

      def get_engagement_invitation(input : Types::GetEngagementInvitationRequest) : Types::GetEngagementInvitationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENGAGEMENT_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEngagementInvitationResponse, "GetEngagementInvitation")
      end

      # Fetches the Opportunity record from Partner Central by a given Identifier . Use the
      # ListOpportunities action or the event notification (from Amazon EventBridge) to obtain this
      # identifier.

      def get_opportunity(
        catalog : String,
        identifier : String
      ) : Types::GetOpportunityResponse

        input = Types::GetOpportunityRequest.new(catalog: catalog, identifier: identifier)
        get_opportunity(input)
      end

      def get_opportunity(input : Types::GetOpportunityRequest) : Types::GetOpportunityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpportunityResponse, "GetOpportunity")
      end

      # Use this action to retrieve a specific snapshot record.

      def get_resource_snapshot(
        catalog : String,
        engagement_identifier : String,
        resource_identifier : String,
        resource_snapshot_template_identifier : String,
        resource_type : String,
        revision : Int32? = nil
      ) : Types::GetResourceSnapshotResponse

        input = Types::GetResourceSnapshotRequest.new(catalog: catalog, engagement_identifier: engagement_identifier, resource_identifier: resource_identifier, resource_snapshot_template_identifier: resource_snapshot_template_identifier, resource_type: resource_type, revision: revision)
        get_resource_snapshot(input)
      end

      def get_resource_snapshot(input : Types::GetResourceSnapshotRequest) : Types::GetResourceSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceSnapshotResponse, "GetResourceSnapshot")
      end

      # Use this action to retrieves information about a specific resource snapshot job.

      def get_resource_snapshot_job(
        catalog : String,
        resource_snapshot_job_identifier : String
      ) : Types::GetResourceSnapshotJobResponse

        input = Types::GetResourceSnapshotJobRequest.new(catalog: catalog, resource_snapshot_job_identifier: resource_snapshot_job_identifier)
        get_resource_snapshot_job(input)
      end

      def get_resource_snapshot_job(input : Types::GetResourceSnapshotJobRequest) : Types::GetResourceSnapshotJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_SNAPSHOT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceSnapshotJobResponse, "GetResourceSnapshotJob")
      end

      # Retrieves the currently set system settings, which include the IAM Role used for resource snapshot
      # jobs.

      def get_selling_system_settings(
        catalog : String
      ) : Types::GetSellingSystemSettingsResponse

        input = Types::GetSellingSystemSettingsRequest.new(catalog: catalog)
        get_selling_system_settings(input)
      end

      def get_selling_system_settings(input : Types::GetSellingSystemSettingsRequest) : Types::GetSellingSystemSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SELLING_SYSTEM_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSellingSystemSettingsResponse, "GetSellingSystemSettings")
      end

      # Lists all in-progress, completed, or failed StartEngagementByAcceptingInvitationTask tasks that were
      # initiated by the caller's account.

      def list_engagement_by_accepting_invitation_tasks(
        catalog : String,
        engagement_invitation_identifier : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        opportunity_identifier : Array(String)? = nil,
        sort : Types::ListTasksSortBase? = nil,
        task_identifier : Array(String)? = nil,
        task_status : Array(String)? = nil
      ) : Types::ListEngagementByAcceptingInvitationTasksResponse

        input = Types::ListEngagementByAcceptingInvitationTasksRequest.new(catalog: catalog, engagement_invitation_identifier: engagement_invitation_identifier, max_results: max_results, next_token: next_token, opportunity_identifier: opportunity_identifier, sort: sort, task_identifier: task_identifier, task_status: task_status)
        list_engagement_by_accepting_invitation_tasks(input)
      end

      def list_engagement_by_accepting_invitation_tasks(input : Types::ListEngagementByAcceptingInvitationTasksRequest) : Types::ListEngagementByAcceptingInvitationTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENT_BY_ACCEPTING_INVITATION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementByAcceptingInvitationTasksResponse, "ListEngagementByAcceptingInvitationTasks")
      end

      # Lists all in-progress, completed, or failed EngagementFromOpportunity tasks that were initiated by
      # the caller's account.

      def list_engagement_from_opportunity_tasks(
        catalog : String,
        engagement_identifier : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        opportunity_identifier : Array(String)? = nil,
        sort : Types::ListTasksSortBase? = nil,
        task_identifier : Array(String)? = nil,
        task_status : Array(String)? = nil
      ) : Types::ListEngagementFromOpportunityTasksResponse

        input = Types::ListEngagementFromOpportunityTasksRequest.new(catalog: catalog, engagement_identifier: engagement_identifier, max_results: max_results, next_token: next_token, opportunity_identifier: opportunity_identifier, sort: sort, task_identifier: task_identifier, task_status: task_status)
        list_engagement_from_opportunity_tasks(input)
      end

      def list_engagement_from_opportunity_tasks(input : Types::ListEngagementFromOpportunityTasksRequest) : Types::ListEngagementFromOpportunityTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENT_FROM_OPPORTUNITY_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementFromOpportunityTasksResponse, "ListEngagementFromOpportunityTasks")
      end

      # Retrieves a list of engagement invitations sent to the partner. This allows partners to view all
      # pending or past engagement invitations, helping them track opportunities shared by AWS.

      def list_engagement_invitations(
        catalog : String,
        participant_type : String,
        engagement_identifier : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        payload_type : Array(String)? = nil,
        sender_aws_account_id : Array(String)? = nil,
        sort : Types::OpportunityEngagementInvitationSort? = nil,
        status : Array(String)? = nil
      ) : Types::ListEngagementInvitationsResponse

        input = Types::ListEngagementInvitationsRequest.new(catalog: catalog, participant_type: participant_type, engagement_identifier: engagement_identifier, max_results: max_results, next_token: next_token, payload_type: payload_type, sender_aws_account_id: sender_aws_account_id, sort: sort, status: status)
        list_engagement_invitations(input)
      end

      def list_engagement_invitations(input : Types::ListEngagementInvitationsRequest) : Types::ListEngagementInvitationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENT_INVITATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementInvitationsResponse, "ListEngagementInvitations")
      end

      # Retrieves the details of member partners in an Engagement. This operation can only be invoked by
      # members of the Engagement. The ListEngagementMembers operation allows you to fetch information about
      # the members of a specific Engagement. This action is restricted to members of the Engagement being
      # queried.

      def list_engagement_members(
        catalog : String,
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListEngagementMembersResponse

        input = Types::ListEngagementMembersRequest.new(catalog: catalog, identifier: identifier, max_results: max_results, next_token: next_token)
        list_engagement_members(input)
      end

      def list_engagement_members(input : Types::ListEngagementMembersRequest) : Types::ListEngagementMembersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENT_MEMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementMembersResponse, "ListEngagementMembers")
      end

      # Lists the associations between resources and engagements where the caller is a member and has at
      # least one snapshot in the engagement.

      def list_engagement_resource_associations(
        catalog : String,
        created_by : String? = nil,
        engagement_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : String? = nil,
        resource_type : String? = nil
      ) : Types::ListEngagementResourceAssociationsResponse

        input = Types::ListEngagementResourceAssociationsRequest.new(catalog: catalog, created_by: created_by, engagement_identifier: engagement_identifier, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier, resource_type: resource_type)
        list_engagement_resource_associations(input)
      end

      def list_engagement_resource_associations(input : Types::ListEngagementResourceAssociationsRequest) : Types::ListEngagementResourceAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENT_RESOURCE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementResourceAssociationsResponse, "ListEngagementResourceAssociations")
      end

      # This action allows users to retrieve a list of Engagement records from Partner Central. This action
      # can be used to manage and track various engagements across different stages of the partner selling
      # process.

      def list_engagements(
        catalog : String,
        context_types : Array(String)? = nil,
        created_by : Array(String)? = nil,
        engagement_identifier : Array(String)? = nil,
        exclude_context_types : Array(String)? = nil,
        exclude_created_by : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::EngagementSort? = nil
      ) : Types::ListEngagementsResponse

        input = Types::ListEngagementsRequest.new(catalog: catalog, context_types: context_types, created_by: created_by, engagement_identifier: engagement_identifier, exclude_context_types: exclude_context_types, exclude_created_by: exclude_created_by, max_results: max_results, next_token: next_token, sort: sort)
        list_engagements(input)
      end

      def list_engagements(input : Types::ListEngagementsRequest) : Types::ListEngagementsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementsResponse, "ListEngagements")
      end

      # This request accepts a list of filters that retrieve opportunity subsets as well as sort options.
      # This feature is available to partners from Partner Central using the ListOpportunities API action.
      # To synchronize your system with Amazon Web Services, list only the opportunities that were newly
      # created or updated. We recommend you rely on events emitted by the service into your Amazon Web
      # Services account’s Amazon EventBridge default event bus. You can also use the ListOpportunities
      # action. We recommend the following approach: Find the latest LastModifiedDate that you stored, and
      # only use the values that came from Amazon Web Services. Don’t use values generated by your system.
      # When you send a ListOpportunities request, submit the date in ISO 8601 format in the
      # AfterLastModifiedDate filter. Amazon Web Services only returns opportunities created or updated on
      # or after that date and time. Use NextToken to iterate over all pages.

      def list_opportunities(
        catalog : String,
        customer_company_name : Array(String)? = nil,
        identifier : Array(String)? = nil,
        last_modified_date : Types::LastModifiedDate? = nil,
        life_cycle_review_status : Array(String)? = nil,
        life_cycle_stage : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::OpportunitySort? = nil
      ) : Types::ListOpportunitiesResponse

        input = Types::ListOpportunitiesRequest.new(catalog: catalog, customer_company_name: customer_company_name, identifier: identifier, last_modified_date: last_modified_date, life_cycle_review_status: life_cycle_review_status, life_cycle_stage: life_cycle_stage, max_results: max_results, next_token: next_token, sort: sort)
        list_opportunities(input)
      end

      def list_opportunities(input : Types::ListOpportunitiesRequest) : Types::ListOpportunitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPPORTUNITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOpportunitiesResponse, "ListOpportunities")
      end

      # Lists all in-progress, completed, or failed opportunity creation tasks from engagements that were
      # initiated by the caller's account.

      def list_opportunity_from_engagement_tasks(
        catalog : String,
        context_identifier : Array(String)? = nil,
        engagement_identifier : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        opportunity_identifier : Array(String)? = nil,
        sort : Types::ListTasksSortBase? = nil,
        task_identifier : Array(String)? = nil,
        task_status : Array(String)? = nil
      ) : Types::ListOpportunityFromEngagementTasksResponse

        input = Types::ListOpportunityFromEngagementTasksRequest.new(catalog: catalog, context_identifier: context_identifier, engagement_identifier: engagement_identifier, max_results: max_results, next_token: next_token, opportunity_identifier: opportunity_identifier, sort: sort, task_identifier: task_identifier, task_status: task_status)
        list_opportunity_from_engagement_tasks(input)
      end

      def list_opportunity_from_engagement_tasks(input : Types::ListOpportunityFromEngagementTasksRequest) : Types::ListOpportunityFromEngagementTasksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPPORTUNITY_FROM_ENGAGEMENT_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOpportunityFromEngagementTasksResponse, "ListOpportunityFromEngagementTasks")
      end

      # Lists resource snapshot jobs owned by the customer. This operation supports various filtering
      # scenarios, including listing all jobs owned by the caller, jobs for a specific engagement, jobs with
      # a specific status, or any combination of these filters.

      def list_resource_snapshot_jobs(
        catalog : String,
        engagement_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::SortObject? = nil,
        status : String? = nil
      ) : Types::ListResourceSnapshotJobsResponse

        input = Types::ListResourceSnapshotJobsRequest.new(catalog: catalog, engagement_identifier: engagement_identifier, max_results: max_results, next_token: next_token, sort: sort, status: status)
        list_resource_snapshot_jobs(input)
      end

      def list_resource_snapshot_jobs(input : Types::ListResourceSnapshotJobsRequest) : Types::ListResourceSnapshotJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_SNAPSHOT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceSnapshotJobsResponse, "ListResourceSnapshotJobs")
      end

      # Retrieves a list of resource view snapshots based on specified criteria. This operation supports
      # various use cases, including: Fetching all snapshots associated with an engagement. Retrieving
      # snapshots of a specific resource type within an engagement. Obtaining snapshots for a particular
      # resource using a specified template. Accessing the latest snapshot of a resource within an
      # engagement. Filtering snapshots by resource owner.

      def list_resource_snapshots(
        catalog : String,
        engagement_identifier : String,
        created_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : String? = nil,
        resource_snapshot_template_identifier : String? = nil,
        resource_type : String? = nil
      ) : Types::ListResourceSnapshotsResponse

        input = Types::ListResourceSnapshotsRequest.new(catalog: catalog, engagement_identifier: engagement_identifier, created_by: created_by, max_results: max_results, next_token: next_token, resource_identifier: resource_identifier, resource_snapshot_template_identifier: resource_snapshot_template_identifier, resource_type: resource_type)
        list_resource_snapshots(input)
      end

      def list_resource_snapshots(input : Types::ListResourceSnapshotsRequest) : Types::ListResourceSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceSnapshotsResponse, "ListResourceSnapshots")
      end

      # Retrieves a list of Partner Solutions that the partner registered on Partner Central. This API is
      # used to generate a list of solutions that an end user selects from for association with an
      # opportunity.

      def list_solutions(
        catalog : String,
        category : Array(String)? = nil,
        identifier : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::SolutionSort? = nil,
        status : Array(String)? = nil
      ) : Types::ListSolutionsResponse

        input = Types::ListSolutionsRequest.new(catalog: catalog, category: category, identifier: identifier, max_results: max_results, next_token: next_token, sort: sort, status: status)
        list_solutions(input)
      end

      def list_solutions(input : Types::ListSolutionsRequest) : Types::ListSolutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SOLUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSolutionsResponse, "ListSolutions")
      end

      # Returns a list of tags for a resource.

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

      # Updates the currently set system settings, which include the IAM Role used for resource snapshot
      # jobs.

      def put_selling_system_settings(
        catalog : String,
        resource_snapshot_job_role_identifier : String? = nil
      ) : Types::PutSellingSystemSettingsResponse

        input = Types::PutSellingSystemSettingsRequest.new(catalog: catalog, resource_snapshot_job_role_identifier: resource_snapshot_job_role_identifier)
        put_selling_system_settings(input)
      end

      def put_selling_system_settings(input : Types::PutSellingSystemSettingsRequest) : Types::PutSellingSystemSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SELLING_SYSTEM_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutSellingSystemSettingsResponse, "PutSellingSystemSettings")
      end

      # This action rejects an EngagementInvitation that AWS shared. Rejecting an invitation indicates that
      # the partner doesn't want to pursue the opportunity, and all related data will become inaccessible
      # thereafter.

      def reject_engagement_invitation(
        catalog : String,
        identifier : String,
        rejection_reason : String? = nil
      ) : Nil

        input = Types::RejectEngagementInvitationRequest.new(catalog: catalog, identifier: identifier, rejection_reason: rejection_reason)
        reject_engagement_invitation(input)
      end

      def reject_engagement_invitation(input : Types::RejectEngagementInvitationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REJECT_ENGAGEMENT_INVITATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This action starts the engagement by accepting an EngagementInvitation . The task is asynchronous
      # and involves the following steps: accepting the invitation, creating an opportunity in the partner’s
      # account from the AWS opportunity, and copying details for tracking. When completed, an Opportunity
      # Created event is generated, indicating that the opportunity has been successfully created in the
      # partner's account.

      def start_engagement_by_accepting_invitation_task(
        catalog : String,
        client_token : String,
        identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartEngagementByAcceptingInvitationTaskResponse

        input = Types::StartEngagementByAcceptingInvitationTaskRequest.new(catalog: catalog, client_token: client_token, identifier: identifier, tags: tags)
        start_engagement_by_accepting_invitation_task(input)
      end

      def start_engagement_by_accepting_invitation_task(input : Types::StartEngagementByAcceptingInvitationTaskRequest) : Types::StartEngagementByAcceptingInvitationTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_ENGAGEMENT_BY_ACCEPTING_INVITATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEngagementByAcceptingInvitationTaskResponse, "StartEngagementByAcceptingInvitationTask")
      end

      # Similar to StartEngagementByAcceptingInvitationTask , this action is asynchronous and performs
      # multiple steps before completion. This action orchestrates a comprehensive workflow that combines
      # multiple API operations into a single task to create and initiate an engagement from an existing
      # opportunity. It automatically executes a sequence of operations including GetOpportunity ,
      # CreateEngagement (if it doesn't exist), CreateResourceSnapshot , CreateResourceSnapshotJob ,
      # CreateEngagementInvitation (if not already invited/accepted), and SubmitOpportunity .

      def start_engagement_from_opportunity_task(
        aws_submission : Types::AwsSubmission,
        catalog : String,
        client_token : String,
        identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartEngagementFromOpportunityTaskResponse

        input = Types::StartEngagementFromOpportunityTaskRequest.new(aws_submission: aws_submission, catalog: catalog, client_token: client_token, identifier: identifier, tags: tags)
        start_engagement_from_opportunity_task(input)
      end

      def start_engagement_from_opportunity_task(input : Types::StartEngagementFromOpportunityTaskRequest) : Types::StartEngagementFromOpportunityTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_ENGAGEMENT_FROM_OPPORTUNITY_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEngagementFromOpportunityTaskResponse, "StartEngagementFromOpportunityTask")
      end

      # This action creates an opportunity from an existing engagement context. The task is asynchronous and
      # orchestrates the process of converting engagement contextual information into a structured
      # opportunity record within the partner's account.

      def start_opportunity_from_engagement_task(
        catalog : String,
        client_token : String,
        context_identifier : String,
        identifier : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartOpportunityFromEngagementTaskResponse

        input = Types::StartOpportunityFromEngagementTaskRequest.new(catalog: catalog, client_token: client_token, context_identifier: context_identifier, identifier: identifier, tags: tags)
        start_opportunity_from_engagement_task(input)
      end

      def start_opportunity_from_engagement_task(input : Types::StartOpportunityFromEngagementTaskRequest) : Types::StartOpportunityFromEngagementTaskResponse
        request = Protocol::JsonRpc.build_request(Model::START_OPPORTUNITY_FROM_ENGAGEMENT_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartOpportunityFromEngagementTaskResponse, "StartOpportunityFromEngagementTask")
      end

      # Starts a resource snapshot job that has been previously created.

      def start_resource_snapshot_job(
        catalog : String,
        resource_snapshot_job_identifier : String
      ) : Nil

        input = Types::StartResourceSnapshotJobRequest.new(catalog: catalog, resource_snapshot_job_identifier: resource_snapshot_job_identifier)
        start_resource_snapshot_job(input)
      end

      def start_resource_snapshot_job(input : Types::StartResourceSnapshotJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_RESOURCE_SNAPSHOT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a resource snapshot job. The job must be started prior to being stopped.

      def stop_resource_snapshot_job(
        catalog : String,
        resource_snapshot_job_identifier : String
      ) : Nil

        input = Types::StopResourceSnapshotJobRequest.new(catalog: catalog, resource_snapshot_job_identifier: resource_snapshot_job_identifier)
        stop_resource_snapshot_job(input)
      end

      def stop_resource_snapshot_job(input : Types::StopResourceSnapshotJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_RESOURCE_SNAPSHOT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Use this action to submit an Opportunity that was previously created by partner for AWS review.
      # After you perform this action, the Opportunity becomes non-editable until it is reviewed by AWS and
      # has LifeCycle.ReviewStatus as either Approved or Action Required .

      def submit_opportunity(
        catalog : String,
        identifier : String,
        involvement_type : String,
        visibility : String? = nil
      ) : Nil

        input = Types::SubmitOpportunityRequest.new(catalog: catalog, identifier: identifier, involvement_type: involvement_type, visibility: visibility)
        submit_opportunity(input)
      end

      def submit_opportunity(input : Types::SubmitOpportunityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Assigns one or more tags (key-value pairs) to the specified resource.

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

      # Removes a tag or tags from a resource.

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

      # Updates the context information for an existing engagement with new or modified data.

      def update_engagement_context(
        catalog : String,
        context_identifier : String,
        engagement_identifier : String,
        engagement_last_modified_at : Time,
        payload : Types::UpdateEngagementContextPayload,
        type : String
      ) : Types::UpdateEngagementContextResponse

        input = Types::UpdateEngagementContextRequest.new(catalog: catalog, context_identifier: context_identifier, engagement_identifier: engagement_identifier, engagement_last_modified_at: engagement_last_modified_at, payload: payload, type: type)
        update_engagement_context(input)
      end

      def update_engagement_context(input : Types::UpdateEngagementContextRequest) : Types::UpdateEngagementContextResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENGAGEMENT_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEngagementContextResponse, "UpdateEngagementContext")
      end

      # Updates the Opportunity record identified by a given Identifier . This operation allows you to
      # modify the details of an existing opportunity to reflect the latest information and progress. Use
      # this action to keep the opportunity record up-to-date and accurate. When you perform updates,
      # include the entire payload with each request. If any field is omitted, the API assumes that the
      # field is set to null . The best practice is to always perform a GetOpportunity to retrieve the
      # latest values, then send the complete payload with the updated values to be changed.

      def update_opportunity(
        catalog : String,
        identifier : String,
        last_modified_date : Time,
        customer : Types::Customer? = nil,
        life_cycle : Types::LifeCycle? = nil,
        marketing : Types::Marketing? = nil,
        national_security : String? = nil,
        opportunity_type : String? = nil,
        partner_opportunity_identifier : String? = nil,
        primary_needs_from_aws : Array(String)? = nil,
        project : Types::Project? = nil,
        software_revenue : Types::SoftwareRevenue? = nil
      ) : Types::UpdateOpportunityResponse

        input = Types::UpdateOpportunityRequest.new(catalog: catalog, identifier: identifier, last_modified_date: last_modified_date, customer: customer, life_cycle: life_cycle, marketing: marketing, national_security: national_security, opportunity_type: opportunity_type, partner_opportunity_identifier: partner_opportunity_identifier, primary_needs_from_aws: primary_needs_from_aws, project: project, software_revenue: software_revenue)
        update_opportunity(input)
      end

      def update_opportunity(input : Types::UpdateOpportunityRequest) : Types::UpdateOpportunityResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_OPPORTUNITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOpportunityResponse, "UpdateOpportunity")
      end
    end
  end
end
