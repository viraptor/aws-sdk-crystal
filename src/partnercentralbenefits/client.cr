module Aws
  module PartnerCentralBenefits
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Modifies an existing benefit application by applying amendments to specific fields while maintaining
      # revision control.

      def amend_benefit_application(
        amendment_reason : String,
        amendments : Array(Types::Amendment),
        catalog : String,
        client_token : String,
        identifier : String,
        revision : String
      ) : Types::AmendBenefitApplicationOutput

        input = Types::AmendBenefitApplicationInput.new(amendment_reason: amendment_reason, amendments: amendments, catalog: catalog, client_token: client_token, identifier: identifier, revision: revision)
        amend_benefit_application(input)
      end

      def amend_benefit_application(input : Types::AmendBenefitApplicationInput) : Types::AmendBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::AMEND_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AmendBenefitApplicationOutput, "AmendBenefitApplication")
      end

      # Links an AWS resource to an existing benefit application for tracking and management purposes.

      def associate_benefit_application_resource(
        benefit_application_identifier : String,
        catalog : String,
        resource_arn : String
      ) : Types::AssociateBenefitApplicationResourceOutput

        input = Types::AssociateBenefitApplicationResourceInput.new(benefit_application_identifier: benefit_application_identifier, catalog: catalog, resource_arn: resource_arn)
        associate_benefit_application_resource(input)
      end

      def associate_benefit_application_resource(input : Types::AssociateBenefitApplicationResourceInput) : Types::AssociateBenefitApplicationResourceOutput
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_BENEFIT_APPLICATION_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateBenefitApplicationResourceOutput, "AssociateBenefitApplicationResource")
      end

      # Cancels a benefit application that is currently in progress, preventing further processing.

      def cancel_benefit_application(
        catalog : String,
        client_token : String,
        identifier : String,
        reason : String? = nil
      ) : Types::CancelBenefitApplicationOutput

        input = Types::CancelBenefitApplicationInput.new(catalog: catalog, client_token: client_token, identifier: identifier, reason: reason)
        cancel_benefit_application(input)
      end

      def cancel_benefit_application(input : Types::CancelBenefitApplicationInput) : Types::CancelBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::CANCEL_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelBenefitApplicationOutput, "CancelBenefitApplication")
      end

      # Creates a new benefit application for a partner to request access to AWS benefits and programs.

      def create_benefit_application(
        benefit_identifier : String,
        catalog : String,
        client_token : String,
        associated_resources : Array(String)? = nil,
        benefit_application_details : Types::Document? = nil,
        description : String? = nil,
        file_details : Array(Types::FileInput)? = nil,
        fulfillment_types : Array(String)? = nil,
        name : String? = nil,
        partner_contacts : Array(Types::Contact)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateBenefitApplicationOutput

        input = Types::CreateBenefitApplicationInput.new(benefit_identifier: benefit_identifier, catalog: catalog, client_token: client_token, associated_resources: associated_resources, benefit_application_details: benefit_application_details, description: description, file_details: file_details, fulfillment_types: fulfillment_types, name: name, partner_contacts: partner_contacts, tags: tags)
        create_benefit_application(input)
      end

      def create_benefit_application(input : Types::CreateBenefitApplicationInput) : Types::CreateBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBenefitApplicationOutput, "CreateBenefitApplication")
      end

      # Removes the association between an AWS resource and a benefit application.

      def disassociate_benefit_application_resource(
        benefit_application_identifier : String,
        catalog : String,
        resource_arn : String
      ) : Types::DisassociateBenefitApplicationResourceOutput

        input = Types::DisassociateBenefitApplicationResourceInput.new(benefit_application_identifier: benefit_application_identifier, catalog: catalog, resource_arn: resource_arn)
        disassociate_benefit_application_resource(input)
      end

      def disassociate_benefit_application_resource(input : Types::DisassociateBenefitApplicationResourceInput) : Types::DisassociateBenefitApplicationResourceOutput
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_BENEFIT_APPLICATION_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateBenefitApplicationResourceOutput, "DisassociateBenefitApplicationResource")
      end

      # Retrieves detailed information about a specific benefit available in the partner catalog.

      def get_benefit(
        catalog : String,
        identifier : String
      ) : Types::GetBenefitOutput

        input = Types::GetBenefitInput.new(catalog: catalog, identifier: identifier)
        get_benefit(input)
      end

      def get_benefit(input : Types::GetBenefitInput) : Types::GetBenefitOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BENEFIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBenefitOutput, "GetBenefit")
      end

      # Retrieves detailed information about a specific benefit allocation that has been granted to a
      # partner.

      def get_benefit_allocation(
        catalog : String,
        identifier : String
      ) : Types::GetBenefitAllocationOutput

        input = Types::GetBenefitAllocationInput.new(catalog: catalog, identifier: identifier)
        get_benefit_allocation(input)
      end

      def get_benefit_allocation(input : Types::GetBenefitAllocationInput) : Types::GetBenefitAllocationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BENEFIT_ALLOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBenefitAllocationOutput, "GetBenefitAllocation")
      end

      # Retrieves detailed information about a specific benefit application.

      def get_benefit_application(
        catalog : String,
        identifier : String
      ) : Types::GetBenefitApplicationOutput

        input = Types::GetBenefitApplicationInput.new(catalog: catalog, identifier: identifier)
        get_benefit_application(input)
      end

      def get_benefit_application(input : Types::GetBenefitApplicationInput) : Types::GetBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBenefitApplicationOutput, "GetBenefitApplication")
      end

      # Retrieves a paginated list of benefit allocations based on specified filter criteria.

      def list_benefit_allocations(
        catalog : String,
        benefit_application_identifiers : Array(String)? = nil,
        benefit_identifiers : Array(String)? = nil,
        fulfillment_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : Array(String)? = nil
      ) : Types::ListBenefitAllocationsOutput

        input = Types::ListBenefitAllocationsInput.new(catalog: catalog, benefit_application_identifiers: benefit_application_identifiers, benefit_identifiers: benefit_identifiers, fulfillment_types: fulfillment_types, max_results: max_results, next_token: next_token, status: status)
        list_benefit_allocations(input)
      end

      def list_benefit_allocations(input : Types::ListBenefitAllocationsInput) : Types::ListBenefitAllocationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BENEFIT_ALLOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBenefitAllocationsOutput, "ListBenefitAllocations")
      end

      # Retrieves a paginated list of benefit applications based on specified filter criteria.

      def list_benefit_applications(
        catalog : String,
        associated_resource_arns : Array(String)? = nil,
        associated_resources : Array(Types::AssociatedResource)? = nil,
        benefit_identifiers : Array(String)? = nil,
        fulfillment_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        programs : Array(String)? = nil,
        stages : Array(String)? = nil,
        status : Array(String)? = nil
      ) : Types::ListBenefitApplicationsOutput

        input = Types::ListBenefitApplicationsInput.new(catalog: catalog, associated_resource_arns: associated_resource_arns, associated_resources: associated_resources, benefit_identifiers: benefit_identifiers, fulfillment_types: fulfillment_types, max_results: max_results, next_token: next_token, programs: programs, stages: stages, status: status)
        list_benefit_applications(input)
      end

      def list_benefit_applications(input : Types::ListBenefitApplicationsInput) : Types::ListBenefitApplicationsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BENEFIT_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBenefitApplicationsOutput, "ListBenefitApplications")
      end

      # Retrieves a paginated list of available benefits based on specified filter criteria.

      def list_benefits(
        catalog : String,
        fulfillment_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        programs : Array(String)? = nil,
        status : Array(String)? = nil
      ) : Types::ListBenefitsOutput

        input = Types::ListBenefitsInput.new(catalog: catalog, fulfillment_types: fulfillment_types, max_results: max_results, next_token: next_token, programs: programs, status: status)
        list_benefits(input)
      end

      def list_benefits(input : Types::ListBenefitsInput) : Types::ListBenefitsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BENEFITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBenefitsOutput, "ListBenefits")
      end

      # Retrieves all tags associated with a specific resource.

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

      # Recalls a submitted benefit application, returning it to draft status for further modifications.

      def recall_benefit_application(
        catalog : String,
        identifier : String,
        reason : String,
        client_token : String? = nil
      ) : Types::RecallBenefitApplicationOutput

        input = Types::RecallBenefitApplicationInput.new(catalog: catalog, identifier: identifier, reason: reason, client_token: client_token)
        recall_benefit_application(input)
      end

      def recall_benefit_application(input : Types::RecallBenefitApplicationInput) : Types::RecallBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::RECALL_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RecallBenefitApplicationOutput, "RecallBenefitApplication")
      end

      # Submits a benefit application for review and processing by AWS.

      def submit_benefit_application(
        catalog : String,
        identifier : String
      ) : Types::SubmitBenefitApplicationOutput

        input = Types::SubmitBenefitApplicationInput.new(catalog: catalog, identifier: identifier)
        submit_benefit_application(input)
      end

      def submit_benefit_application(input : Types::SubmitBenefitApplicationInput) : Types::SubmitBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::SUBMIT_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SubmitBenefitApplicationOutput, "SubmitBenefitApplication")
      end

      # Adds or updates tags for a specified resource.

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

      # Removes specified tags from a resource.

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

      # Updates an existing benefit application with new information while maintaining revision control.

      def update_benefit_application(
        catalog : String,
        client_token : String,
        identifier : String,
        revision : String,
        benefit_application_details : Types::Document? = nil,
        description : String? = nil,
        file_details : Array(Types::FileInput)? = nil,
        name : String? = nil,
        partner_contacts : Array(Types::Contact)? = nil
      ) : Types::UpdateBenefitApplicationOutput

        input = Types::UpdateBenefitApplicationInput.new(catalog: catalog, client_token: client_token, identifier: identifier, revision: revision, benefit_application_details: benefit_application_details, description: description, file_details: file_details, name: name, partner_contacts: partner_contacts)
        update_benefit_application(input)
      end

      def update_benefit_application(input : Types::UpdateBenefitApplicationInput) : Types::UpdateBenefitApplicationOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BENEFIT_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBenefitApplicationOutput, "UpdateBenefitApplication")
      end
    end
  end
end
