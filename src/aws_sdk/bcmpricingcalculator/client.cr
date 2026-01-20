module AwsSdk
  module BCMPricingCalculator
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

      # Create Compute Savings Plans, EC2 Instance Savings Plans, or EC2 Reserved Instances commitments that
      # you want to model in a Bill Scenario. The BatchCreateBillScenarioCommitmentModification operation
      # doesn't have its own IAM permission. To authorize this operation for Amazon Web Services principals,
      # include the permission bcm-pricing-calculator:CreateBillScenarioCommitmentModification in your
      # policies.

      def batch_create_bill_scenario_commitment_modification(
        bill_scenario_id : String,
        commitment_modifications : Array(Types::BatchCreateBillScenarioCommitmentModificationEntry),
        client_token : String? = nil
      ) : Types::BatchCreateBillScenarioCommitmentModificationResponse

        input = Types::BatchCreateBillScenarioCommitmentModificationRequest.new(bill_scenario_id: bill_scenario_id, commitment_modifications: commitment_modifications, client_token: client_token)
        batch_create_bill_scenario_commitment_modification(input)
      end

      def batch_create_bill_scenario_commitment_modification(input : Types::BatchCreateBillScenarioCommitmentModificationRequest) : Types::BatchCreateBillScenarioCommitmentModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_BILL_SCENARIO_COMMITMENT_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreateBillScenarioCommitmentModificationResponse, "BatchCreateBillScenarioCommitmentModification")
      end

      # Create Amazon Web Services service usage that you want to model in a Bill Scenario. The
      # BatchCreateBillScenarioUsageModification operation doesn't have its own IAM permission. To authorize
      # this operation for Amazon Web Services principals, include the permission
      # bcm-pricing-calculator:CreateBillScenarioUsageModification in your policies.

      def batch_create_bill_scenario_usage_modification(
        bill_scenario_id : String,
        usage_modifications : Array(Types::BatchCreateBillScenarioUsageModificationEntry),
        client_token : String? = nil
      ) : Types::BatchCreateBillScenarioUsageModificationResponse

        input = Types::BatchCreateBillScenarioUsageModificationRequest.new(bill_scenario_id: bill_scenario_id, usage_modifications: usage_modifications, client_token: client_token)
        batch_create_bill_scenario_usage_modification(input)
      end

      def batch_create_bill_scenario_usage_modification(input : Types::BatchCreateBillScenarioUsageModificationRequest) : Types::BatchCreateBillScenarioUsageModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_BILL_SCENARIO_USAGE_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreateBillScenarioUsageModificationResponse, "BatchCreateBillScenarioUsageModification")
      end

      # Create Amazon Web Services service usage that you want to model in a Workload Estimate. The
      # BatchCreateWorkloadEstimateUsage operation doesn't have its own IAM permission. To authorize this
      # operation for Amazon Web Services principals, include the permission
      # bcm-pricing-calculator:CreateWorkloadEstimateUsage in your policies.

      def batch_create_workload_estimate_usage(
        usage : Array(Types::BatchCreateWorkloadEstimateUsageEntry),
        workload_estimate_id : String,
        client_token : String? = nil
      ) : Types::BatchCreateWorkloadEstimateUsageResponse

        input = Types::BatchCreateWorkloadEstimateUsageRequest.new(usage: usage, workload_estimate_id: workload_estimate_id, client_token: client_token)
        batch_create_workload_estimate_usage(input)
      end

      def batch_create_workload_estimate_usage(input : Types::BatchCreateWorkloadEstimateUsageRequest) : Types::BatchCreateWorkloadEstimateUsageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_CREATE_WORKLOAD_ESTIMATE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchCreateWorkloadEstimateUsageResponse, "BatchCreateWorkloadEstimateUsage")
      end

      # Delete commitment that you have created in a Bill Scenario. You can only delete a commitment that
      # you had added and cannot model deletion (or removal) of a existing commitment. If you want model
      # deletion of an existing commitment, see the negate BillScenarioCommitmentModificationAction of
      # BatchCreateBillScenarioCommitmentModification operation. The
      # BatchDeleteBillScenarioCommitmentModification operation doesn't have its own IAM permission. To
      # authorize this operation for Amazon Web Services principals, include the permission
      # bcm-pricing-calculator:DeleteBillScenarioCommitmentModification in your policies.

      def batch_delete_bill_scenario_commitment_modification(
        bill_scenario_id : String,
        ids : Array(String)
      ) : Types::BatchDeleteBillScenarioCommitmentModificationResponse

        input = Types::BatchDeleteBillScenarioCommitmentModificationRequest.new(bill_scenario_id: bill_scenario_id, ids: ids)
        batch_delete_bill_scenario_commitment_modification(input)
      end

      def batch_delete_bill_scenario_commitment_modification(input : Types::BatchDeleteBillScenarioCommitmentModificationRequest) : Types::BatchDeleteBillScenarioCommitmentModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_BILL_SCENARIO_COMMITMENT_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteBillScenarioCommitmentModificationResponse, "BatchDeleteBillScenarioCommitmentModification")
      end

      # Delete usage that you have created in a Bill Scenario. You can only delete usage that you had added
      # and cannot model deletion (or removal) of a existing usage. If you want model removal of an existing
      # usage, see BatchUpdateBillScenarioUsageModification . The BatchDeleteBillScenarioUsageModification
      # operation doesn't have its own IAM permission. To authorize this operation for Amazon Web Services
      # principals, include the permission bcm-pricing-calculator:DeleteBillScenarioUsageModification in
      # your policies.

      def batch_delete_bill_scenario_usage_modification(
        bill_scenario_id : String,
        ids : Array(String)
      ) : Types::BatchDeleteBillScenarioUsageModificationResponse

        input = Types::BatchDeleteBillScenarioUsageModificationRequest.new(bill_scenario_id: bill_scenario_id, ids: ids)
        batch_delete_bill_scenario_usage_modification(input)
      end

      def batch_delete_bill_scenario_usage_modification(input : Types::BatchDeleteBillScenarioUsageModificationRequest) : Types::BatchDeleteBillScenarioUsageModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_BILL_SCENARIO_USAGE_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteBillScenarioUsageModificationResponse, "BatchDeleteBillScenarioUsageModification")
      end

      # Delete usage that you have created in a Workload estimate. You can only delete usage that you had
      # added and cannot model deletion (or removal) of a existing usage. If you want model removal of an
      # existing usage, see BatchUpdateWorkloadEstimateUsage . The BatchDeleteWorkloadEstimateUsage
      # operation doesn't have its own IAM permission. To authorize this operation for Amazon Web Services
      # principals, include the permission bcm-pricing-calculator:DeleteWorkloadEstimateUsage in your
      # policies.

      def batch_delete_workload_estimate_usage(
        ids : Array(String),
        workload_estimate_id : String
      ) : Types::BatchDeleteWorkloadEstimateUsageResponse

        input = Types::BatchDeleteWorkloadEstimateUsageRequest.new(ids: ids, workload_estimate_id: workload_estimate_id)
        batch_delete_workload_estimate_usage(input)
      end

      def batch_delete_workload_estimate_usage(input : Types::BatchDeleteWorkloadEstimateUsageRequest) : Types::BatchDeleteWorkloadEstimateUsageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_WORKLOAD_ESTIMATE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteWorkloadEstimateUsageResponse, "BatchDeleteWorkloadEstimateUsage")
      end

      # Update a newly added or existing commitment. You can update the commitment group based on a
      # commitment ID and a Bill scenario ID. The BatchUpdateBillScenarioCommitmentModification operation
      # doesn't have its own IAM permission. To authorize this operation for Amazon Web Services principals,
      # include the permission bcm-pricing-calculator:UpdateBillScenarioCommitmentModification in your
      # policies.

      def batch_update_bill_scenario_commitment_modification(
        bill_scenario_id : String,
        commitment_modifications : Array(Types::BatchUpdateBillScenarioCommitmentModificationEntry)
      ) : Types::BatchUpdateBillScenarioCommitmentModificationResponse

        input = Types::BatchUpdateBillScenarioCommitmentModificationRequest.new(bill_scenario_id: bill_scenario_id, commitment_modifications: commitment_modifications)
        batch_update_bill_scenario_commitment_modification(input)
      end

      def batch_update_bill_scenario_commitment_modification(input : Types::BatchUpdateBillScenarioCommitmentModificationRequest) : Types::BatchUpdateBillScenarioCommitmentModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_BILL_SCENARIO_COMMITMENT_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdateBillScenarioCommitmentModificationResponse, "BatchUpdateBillScenarioCommitmentModification")
      end

      # Update a newly added or existing usage lines. You can update the usage amounts, usage hour, and
      # usage group based on a usage ID and a Bill scenario ID. The BatchUpdateBillScenarioUsageModification
      # operation doesn't have its own IAM permission. To authorize this operation for Amazon Web Services
      # principals, include the permission bcm-pricing-calculator:UpdateBillScenarioUsageModification in
      # your policies.

      def batch_update_bill_scenario_usage_modification(
        bill_scenario_id : String,
        usage_modifications : Array(Types::BatchUpdateBillScenarioUsageModificationEntry)
      ) : Types::BatchUpdateBillScenarioUsageModificationResponse

        input = Types::BatchUpdateBillScenarioUsageModificationRequest.new(bill_scenario_id: bill_scenario_id, usage_modifications: usage_modifications)
        batch_update_bill_scenario_usage_modification(input)
      end

      def batch_update_bill_scenario_usage_modification(input : Types::BatchUpdateBillScenarioUsageModificationRequest) : Types::BatchUpdateBillScenarioUsageModificationResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_BILL_SCENARIO_USAGE_MODIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdateBillScenarioUsageModificationResponse, "BatchUpdateBillScenarioUsageModification")
      end

      # Update a newly added or existing usage lines. You can update the usage amounts and usage group based
      # on a usage ID and a Workload estimate ID. The BatchUpdateWorkloadEstimateUsage operation doesn't
      # have its own IAM permission. To authorize this operation for Amazon Web Services principals, include
      # the permission bcm-pricing-calculator:UpdateWorkloadEstimateUsage in your policies.

      def batch_update_workload_estimate_usage(
        usage : Array(Types::BatchUpdateWorkloadEstimateUsageEntry),
        workload_estimate_id : String
      ) : Types::BatchUpdateWorkloadEstimateUsageResponse

        input = Types::BatchUpdateWorkloadEstimateUsageRequest.new(usage: usage, workload_estimate_id: workload_estimate_id)
        batch_update_workload_estimate_usage(input)
      end

      def batch_update_workload_estimate_usage(input : Types::BatchUpdateWorkloadEstimateUsageRequest) : Types::BatchUpdateWorkloadEstimateUsageResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_WORKLOAD_ESTIMATE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdateWorkloadEstimateUsageResponse, "BatchUpdateWorkloadEstimateUsage")
      end

      # Create a Bill estimate from a Bill scenario. In the Bill scenario you can model usage addition,
      # usage changes, and usage removal. You can also model commitment addition and commitment removal.
      # After all changes in a Bill scenario is made satisfactorily, you can call this API with a Bill
      # scenario ID to generate the Bill estimate. Bill estimate calculates the pre-tax cost for your
      # consolidated billing family, incorporating all modeled usage and commitments alongside existing
      # usage and commitments from your most recent completed anniversary bill, with any applicable
      # discounts applied.

      def create_bill_estimate(
        bill_scenario_id : String,
        name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateBillEstimateResponse

        input = Types::CreateBillEstimateRequest.new(bill_scenario_id: bill_scenario_id, name: name, client_token: client_token, tags: tags)
        create_bill_estimate(input)
      end

      def create_bill_estimate(input : Types::CreateBillEstimateRequest) : Types::CreateBillEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BILL_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBillEstimateResponse, "CreateBillEstimate")
      end

      # Creates a new bill scenario to model potential changes to Amazon Web Services usage and costs.

      def create_bill_scenario(
        name : String,
        client_token : String? = nil,
        cost_category_group_sharing_preference_arn : String? = nil,
        group_sharing_preference : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateBillScenarioResponse

        input = Types::CreateBillScenarioRequest.new(name: name, client_token: client_token, cost_category_group_sharing_preference_arn: cost_category_group_sharing_preference_arn, group_sharing_preference: group_sharing_preference, tags: tags)
        create_bill_scenario(input)
      end

      def create_bill_scenario(input : Types::CreateBillScenarioRequest) : Types::CreateBillScenarioResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BILL_SCENARIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateBillScenarioResponse, "CreateBillScenario")
      end

      # Creates a new workload estimate to model costs for a specific workload.

      def create_workload_estimate(
        name : String,
        client_token : String? = nil,
        rate_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateWorkloadEstimateResponse

        input = Types::CreateWorkloadEstimateRequest.new(name: name, client_token: client_token, rate_type: rate_type, tags: tags)
        create_workload_estimate(input)
      end

      def create_workload_estimate(input : Types::CreateWorkloadEstimateRequest) : Types::CreateWorkloadEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKLOAD_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkloadEstimateResponse, "CreateWorkloadEstimate")
      end

      # Deletes an existing bill estimate.

      def delete_bill_estimate(
        identifier : String
      ) : Types::DeleteBillEstimateResponse

        input = Types::DeleteBillEstimateRequest.new(identifier: identifier)
        delete_bill_estimate(input)
      end

      def delete_bill_estimate(input : Types::DeleteBillEstimateRequest) : Types::DeleteBillEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BILL_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBillEstimateResponse, "DeleteBillEstimate")
      end

      # Deletes an existing bill scenario.

      def delete_bill_scenario(
        identifier : String
      ) : Types::DeleteBillScenarioResponse

        input = Types::DeleteBillScenarioRequest.new(identifier: identifier)
        delete_bill_scenario(input)
      end

      def delete_bill_scenario(input : Types::DeleteBillScenarioRequest) : Types::DeleteBillScenarioResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BILL_SCENARIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBillScenarioResponse, "DeleteBillScenario")
      end

      # Deletes an existing workload estimate.

      def delete_workload_estimate(
        identifier : String
      ) : Types::DeleteWorkloadEstimateResponse

        input = Types::DeleteWorkloadEstimateRequest.new(identifier: identifier)
        delete_workload_estimate(input)
      end

      def delete_workload_estimate(input : Types::DeleteWorkloadEstimateRequest) : Types::DeleteWorkloadEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKLOAD_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkloadEstimateResponse, "DeleteWorkloadEstimate")
      end

      # Retrieves details of a specific bill estimate.

      def get_bill_estimate(
        identifier : String
      ) : Types::GetBillEstimateResponse

        input = Types::GetBillEstimateRequest.new(identifier: identifier)
        get_bill_estimate(input)
      end

      def get_bill_estimate(input : Types::GetBillEstimateRequest) : Types::GetBillEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BILL_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBillEstimateResponse, "GetBillEstimate")
      end

      # Retrieves details of a specific bill scenario.

      def get_bill_scenario(
        identifier : String
      ) : Types::GetBillScenarioResponse

        input = Types::GetBillScenarioRequest.new(identifier: identifier)
        get_bill_scenario(input)
      end

      def get_bill_scenario(input : Types::GetBillScenarioRequest) : Types::GetBillScenarioResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BILL_SCENARIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBillScenarioResponse, "GetBillScenario")
      end

      # Retrieves the current preferences for Pricing Calculator.

      def get_preferences : Types::GetPreferencesResponse
        input = Types::GetPreferencesRequest.new
        get_preferences(input)
      end

      def get_preferences(input : Types::GetPreferencesRequest) : Types::GetPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPreferencesResponse, "GetPreferences")
      end

      # Retrieves details of a specific workload estimate.

      def get_workload_estimate(
        identifier : String
      ) : Types::GetWorkloadEstimateResponse

        input = Types::GetWorkloadEstimateRequest.new(identifier: identifier)
        get_workload_estimate(input)
      end

      def get_workload_estimate(input : Types::GetWorkloadEstimateRequest) : Types::GetWorkloadEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WORKLOAD_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWorkloadEstimateResponse, "GetWorkloadEstimate")
      end

      # Lists the commitments associated with a bill estimate.

      def list_bill_estimate_commitments(
        bill_estimate_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillEstimateCommitmentsResponse

        input = Types::ListBillEstimateCommitmentsRequest.new(bill_estimate_id: bill_estimate_id, max_results: max_results, next_token: next_token)
        list_bill_estimate_commitments(input)
      end

      def list_bill_estimate_commitments(input : Types::ListBillEstimateCommitmentsRequest) : Types::ListBillEstimateCommitmentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_ESTIMATE_COMMITMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillEstimateCommitmentsResponse, "ListBillEstimateCommitments")
      end

      # Lists the input commitment modifications associated with a bill estimate.

      def list_bill_estimate_input_commitment_modifications(
        bill_estimate_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillEstimateInputCommitmentModificationsResponse

        input = Types::ListBillEstimateInputCommitmentModificationsRequest.new(bill_estimate_id: bill_estimate_id, max_results: max_results, next_token: next_token)
        list_bill_estimate_input_commitment_modifications(input)
      end

      def list_bill_estimate_input_commitment_modifications(input : Types::ListBillEstimateInputCommitmentModificationsRequest) : Types::ListBillEstimateInputCommitmentModificationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_ESTIMATE_INPUT_COMMITMENT_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillEstimateInputCommitmentModificationsResponse, "ListBillEstimateInputCommitmentModifications")
      end

      # Lists the input usage modifications associated with a bill estimate.

      def list_bill_estimate_input_usage_modifications(
        bill_estimate_id : String,
        filters : Array(Types::ListUsageFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillEstimateInputUsageModificationsResponse

        input = Types::ListBillEstimateInputUsageModificationsRequest.new(bill_estimate_id: bill_estimate_id, filters: filters, max_results: max_results, next_token: next_token)
        list_bill_estimate_input_usage_modifications(input)
      end

      def list_bill_estimate_input_usage_modifications(input : Types::ListBillEstimateInputUsageModificationsRequest) : Types::ListBillEstimateInputUsageModificationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_ESTIMATE_INPUT_USAGE_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillEstimateInputUsageModificationsResponse, "ListBillEstimateInputUsageModifications")
      end

      # Lists the line items associated with a bill estimate.

      def list_bill_estimate_line_items(
        bill_estimate_id : String,
        filters : Array(Types::ListBillEstimateLineItemsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillEstimateLineItemsResponse

        input = Types::ListBillEstimateLineItemsRequest.new(bill_estimate_id: bill_estimate_id, filters: filters, max_results: max_results, next_token: next_token)
        list_bill_estimate_line_items(input)
      end

      def list_bill_estimate_line_items(input : Types::ListBillEstimateLineItemsRequest) : Types::ListBillEstimateLineItemsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_ESTIMATE_LINE_ITEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillEstimateLineItemsResponse, "ListBillEstimateLineItems")
      end

      # Lists all bill estimates for the account.

      def list_bill_estimates(
        created_at_filter : Types::FilterTimestamp? = nil,
        expires_at_filter : Types::FilterTimestamp? = nil,
        filters : Array(Types::ListBillEstimatesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillEstimatesResponse

        input = Types::ListBillEstimatesRequest.new(created_at_filter: created_at_filter, expires_at_filter: expires_at_filter, filters: filters, max_results: max_results, next_token: next_token)
        list_bill_estimates(input)
      end

      def list_bill_estimates(input : Types::ListBillEstimatesRequest) : Types::ListBillEstimatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_ESTIMATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillEstimatesResponse, "ListBillEstimates")
      end

      # Lists the commitment modifications associated with a bill scenario.

      def list_bill_scenario_commitment_modifications(
        bill_scenario_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillScenarioCommitmentModificationsResponse

        input = Types::ListBillScenarioCommitmentModificationsRequest.new(bill_scenario_id: bill_scenario_id, max_results: max_results, next_token: next_token)
        list_bill_scenario_commitment_modifications(input)
      end

      def list_bill_scenario_commitment_modifications(input : Types::ListBillScenarioCommitmentModificationsRequest) : Types::ListBillScenarioCommitmentModificationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_SCENARIO_COMMITMENT_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillScenarioCommitmentModificationsResponse, "ListBillScenarioCommitmentModifications")
      end

      # Lists the usage modifications associated with a bill scenario.

      def list_bill_scenario_usage_modifications(
        bill_scenario_id : String,
        filters : Array(Types::ListUsageFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillScenarioUsageModificationsResponse

        input = Types::ListBillScenarioUsageModificationsRequest.new(bill_scenario_id: bill_scenario_id, filters: filters, max_results: max_results, next_token: next_token)
        list_bill_scenario_usage_modifications(input)
      end

      def list_bill_scenario_usage_modifications(input : Types::ListBillScenarioUsageModificationsRequest) : Types::ListBillScenarioUsageModificationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_SCENARIO_USAGE_MODIFICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillScenarioUsageModificationsResponse, "ListBillScenarioUsageModifications")
      end

      # Lists all bill scenarios for the account.

      def list_bill_scenarios(
        created_at_filter : Types::FilterTimestamp? = nil,
        expires_at_filter : Types::FilterTimestamp? = nil,
        filters : Array(Types::ListBillScenariosFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBillScenariosResponse

        input = Types::ListBillScenariosRequest.new(created_at_filter: created_at_filter, expires_at_filter: expires_at_filter, filters: filters, max_results: max_results, next_token: next_token)
        list_bill_scenarios(input)
      end

      def list_bill_scenarios(input : Types::ListBillScenariosRequest) : Types::ListBillScenariosResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BILL_SCENARIOS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBillScenariosResponse, "ListBillScenarios")
      end

      # Lists all tags associated with a specified resource.

      def list_tags_for_resource(
        arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(arn: arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists the usage associated with a workload estimate.

      def list_workload_estimate_usage(
        workload_estimate_id : String,
        filters : Array(Types::ListUsageFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkloadEstimateUsageResponse

        input = Types::ListWorkloadEstimateUsageRequest.new(workload_estimate_id: workload_estimate_id, filters: filters, max_results: max_results, next_token: next_token)
        list_workload_estimate_usage(input)
      end

      def list_workload_estimate_usage(input : Types::ListWorkloadEstimateUsageRequest) : Types::ListWorkloadEstimateUsageResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKLOAD_ESTIMATE_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkloadEstimateUsageResponse, "ListWorkloadEstimateUsage")
      end

      # Lists all workload estimates for the account.

      def list_workload_estimates(
        created_at_filter : Types::FilterTimestamp? = nil,
        expires_at_filter : Types::FilterTimestamp? = nil,
        filters : Array(Types::ListWorkloadEstimatesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkloadEstimatesResponse

        input = Types::ListWorkloadEstimatesRequest.new(created_at_filter: created_at_filter, expires_at_filter: expires_at_filter, filters: filters, max_results: max_results, next_token: next_token)
        list_workload_estimates(input)
      end

      def list_workload_estimates(input : Types::ListWorkloadEstimatesRequest) : Types::ListWorkloadEstimatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKLOAD_ESTIMATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkloadEstimatesResponse, "ListWorkloadEstimates")
      end

      # Adds one or more tags to a specified resource.

      def tag_resource(
        arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from a specified resource.

      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an existing bill estimate.

      def update_bill_estimate(
        identifier : String,
        expires_at : Time? = nil,
        name : String? = nil
      ) : Types::UpdateBillEstimateResponse

        input = Types::UpdateBillEstimateRequest.new(identifier: identifier, expires_at: expires_at, name: name)
        update_bill_estimate(input)
      end

      def update_bill_estimate(input : Types::UpdateBillEstimateRequest) : Types::UpdateBillEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BILL_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBillEstimateResponse, "UpdateBillEstimate")
      end

      # Updates an existing bill scenario.

      def update_bill_scenario(
        identifier : String,
        cost_category_group_sharing_preference_arn : String? = nil,
        expires_at : Time? = nil,
        group_sharing_preference : String? = nil,
        name : String? = nil
      ) : Types::UpdateBillScenarioResponse

        input = Types::UpdateBillScenarioRequest.new(identifier: identifier, cost_category_group_sharing_preference_arn: cost_category_group_sharing_preference_arn, expires_at: expires_at, group_sharing_preference: group_sharing_preference, name: name)
        update_bill_scenario(input)
      end

      def update_bill_scenario(input : Types::UpdateBillScenarioRequest) : Types::UpdateBillScenarioResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BILL_SCENARIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateBillScenarioResponse, "UpdateBillScenario")
      end

      # Updates the preferences for Pricing Calculator.

      def update_preferences(
        management_account_rate_type_selections : Array(String)? = nil,
        member_account_rate_type_selections : Array(String)? = nil,
        standalone_account_rate_type_selections : Array(String)? = nil
      ) : Types::UpdatePreferencesResponse

        input = Types::UpdatePreferencesRequest.new(management_account_rate_type_selections: management_account_rate_type_selections, member_account_rate_type_selections: member_account_rate_type_selections, standalone_account_rate_type_selections: standalone_account_rate_type_selections)
        update_preferences(input)
      end

      def update_preferences(input : Types::UpdatePreferencesRequest) : Types::UpdatePreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePreferencesResponse, "UpdatePreferences")
      end

      # Updates an existing workload estimate.

      def update_workload_estimate(
        identifier : String,
        expires_at : Time? = nil,
        name : String? = nil
      ) : Types::UpdateWorkloadEstimateResponse

        input = Types::UpdateWorkloadEstimateRequest.new(identifier: identifier, expires_at: expires_at, name: name)
        update_workload_estimate(input)
      end

      def update_workload_estimate(input : Types::UpdateWorkloadEstimateRequest) : Types::UpdateWorkloadEstimateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKLOAD_ESTIMATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkloadEstimateResponse, "UpdateWorkloadEstimate")
      end
    end
  end
end
