module AwsSdk
  module Route53RecoveryReadiness
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

      # Creates a cell in an account.
      def create_cell(
        cell_name : String,
        cells : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCellRequest.new(cell_name: cell_name, cells: cells, tags: tags)
        create_cell(input)
      end
      def create_cell(input : Types::CreateCellRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CELL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a cross-account readiness authorization. This lets you authorize another account to work
      # with Route 53 Application Recovery Controller, for example, to check the readiness status of
      # resources in a separate account.
      def create_cross_account_authorization(
        cross_account_authorization : String
      ) : Protocol::Request
        input = Types::CreateCrossAccountAuthorizationRequest.new(cross_account_authorization: cross_account_authorization)
        create_cross_account_authorization(input)
      end
      def create_cross_account_authorization(input : Types::CreateCrossAccountAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CROSS_ACCOUNT_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a readiness check in an account. A readiness check monitors a resource set in your
      # application, such as a set of Amazon Aurora instances, that Application Recovery Controller is
      # auditing recovery readiness for. The audits run once every minute on every resource that's
      # associated with a readiness check.
      def create_readiness_check(
        readiness_check_name : String,
        resource_set_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReadinessCheckRequest.new(readiness_check_name: readiness_check_name, resource_set_name: resource_set_name, tags: tags)
        create_readiness_check(input)
      end
      def create_readiness_check(input : Types::CreateReadinessCheckRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_READINESS_CHECK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a recovery group in an account. A recovery group corresponds to an application and includes
      # a list of the cells that make up the application.
      def create_recovery_group(
        recovery_group_name : String,
        cells : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRecoveryGroupRequest.new(recovery_group_name: recovery_group_name, cells: cells, tags: tags)
        create_recovery_group(input)
      end
      def create_recovery_group(input : Types::CreateRecoveryGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECOVERY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resource set. A resource set is a set of resources of one type that span multiple cells.
      # You can associate a resource set with a readiness check to monitor the resources for failover
      # readiness.
      def create_resource_set(
        resource_set_name : String,
        resource_set_type : String,
        resources : Array(Types::Resource),
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateResourceSetRequest.new(resource_set_name: resource_set_name, resource_set_type: resource_set_type, resources: resources, tags: tags)
        create_resource_set(input)
      end
      def create_resource_set(input : Types::CreateResourceSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a cell. When successful, the response code is 204, with no response body.
      def delete_cell(
        cell_name : String
      ) : Protocol::Request
        input = Types::DeleteCellRequest.new(cell_name: cell_name)
        delete_cell(input)
      end
      def delete_cell(input : Types::DeleteCellRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CELL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes cross account readiness authorization.
      def delete_cross_account_authorization(
        cross_account_authorization : String
      ) : Protocol::Request
        input = Types::DeleteCrossAccountAuthorizationRequest.new(cross_account_authorization: cross_account_authorization)
        delete_cross_account_authorization(input)
      end
      def delete_cross_account_authorization(input : Types::DeleteCrossAccountAuthorizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CROSS_ACCOUNT_AUTHORIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a readiness check.
      def delete_readiness_check(
        readiness_check_name : String
      ) : Protocol::Request
        input = Types::DeleteReadinessCheckRequest.new(readiness_check_name: readiness_check_name)
        delete_readiness_check(input)
      end
      def delete_readiness_check(input : Types::DeleteReadinessCheckRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_READINESS_CHECK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a recovery group.
      def delete_recovery_group(
        recovery_group_name : String
      ) : Protocol::Request
        input = Types::DeleteRecoveryGroupRequest.new(recovery_group_name: recovery_group_name)
        delete_recovery_group(input)
      end
      def delete_recovery_group(input : Types::DeleteRecoveryGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOVERY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource set.
      def delete_resource_set(
        resource_set_name : String
      ) : Protocol::Request
        input = Types::DeleteResourceSetRequest.new(resource_set_name: resource_set_name)
        delete_resource_set(input)
      end
      def delete_resource_set(input : Types::DeleteResourceSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets recommendations about architecture designs for improving resiliency for an application, based
      # on a recovery group.
      def get_architecture_recommendations(
        recovery_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetArchitectureRecommendationsRequest.new(recovery_group_name: recovery_group_name, max_results: max_results, next_token: next_token)
        get_architecture_recommendations(input)
      end
      def get_architecture_recommendations(input : Types::GetArchitectureRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ARCHITECTURE_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a cell including cell name, cell Amazon Resource Name (ARN), ARNs of nested
      # cells for this cell, and a list of those cell ARNs with their associated recovery group ARNs.
      def get_cell(
        cell_name : String
      ) : Protocol::Request
        input = Types::GetCellRequest.new(cell_name: cell_name)
        get_cell(input)
      end
      def get_cell(input : Types::GetCellRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CELL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets readiness for a cell. Aggregates the readiness of all the resources that are associated with
      # the cell into a single value.
      def get_cell_readiness_summary(
        cell_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCellReadinessSummaryRequest.new(cell_name: cell_name, max_results: max_results, next_token: next_token)
        get_cell_readiness_summary(input)
      end
      def get_cell_readiness_summary(input : Types::GetCellReadinessSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CELL_READINESS_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a readiness check.
      def get_readiness_check(
        readiness_check_name : String
      ) : Protocol::Request
        input = Types::GetReadinessCheckRequest.new(readiness_check_name: readiness_check_name)
        get_readiness_check(input)
      end
      def get_readiness_check(input : Types::GetReadinessCheckRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READINESS_CHECK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets individual readiness status for a readiness check. To see the overall readiness status for a
      # recovery group, that considers the readiness status for all the readiness checks in the recovery
      # group, use GetRecoveryGroupReadinessSummary.
      def get_readiness_check_resource_status(
        readiness_check_name : String,
        resource_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetReadinessCheckResourceStatusRequest.new(readiness_check_name: readiness_check_name, resource_identifier: resource_identifier, max_results: max_results, next_token: next_token)
        get_readiness_check_resource_status(input)
      end
      def get_readiness_check_resource_status(input : Types::GetReadinessCheckResourceStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READINESS_CHECK_RESOURCE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the readiness status for an individual readiness check. To see the overall readiness status for
      # a recovery group, that considers the readiness status for all the readiness checks in a recovery
      # group, use GetRecoveryGroupReadinessSummary.
      def get_readiness_check_status(
        readiness_check_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetReadinessCheckStatusRequest.new(readiness_check_name: readiness_check_name, max_results: max_results, next_token: next_token)
        get_readiness_check_status(input)
      end
      def get_readiness_check_status(input : Types::GetReadinessCheckStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_READINESS_CHECK_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a recovery group, including a list of the cells that are included in it.
      def get_recovery_group(
        recovery_group_name : String
      ) : Protocol::Request
        input = Types::GetRecoveryGroupRequest.new(recovery_group_name: recovery_group_name)
        get_recovery_group(input)
      end
      def get_recovery_group(input : Types::GetRecoveryGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOVERY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays a summary of information about a recovery group's readiness status. Includes the readiness
      # checks for resources in the recovery group and the readiness status of each one.
      def get_recovery_group_readiness_summary(
        recovery_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetRecoveryGroupReadinessSummaryRequest.new(recovery_group_name: recovery_group_name, max_results: max_results, next_token: next_token)
        get_recovery_group_readiness_summary(input)
      end
      def get_recovery_group_readiness_summary(input : Types::GetRecoveryGroupReadinessSummaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOVERY_GROUP_READINESS_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the details about a resource set, including a list of the resources in the set.
      def get_resource_set(
        resource_set_name : String
      ) : Protocol::Request
        input = Types::GetResourceSetRequest.new(resource_set_name: resource_set_name)
        get_resource_set(input)
      end
      def get_resource_set(input : Types::GetResourceSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the cells for an account.
      def list_cells(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCellsRequest.new(max_results: max_results, next_token: next_token)
        list_cells(input)
      end
      def list_cells(input : Types::ListCellsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CELLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the cross-account readiness authorizations that are in place for an account.
      def list_cross_account_authorizations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCrossAccountAuthorizationsRequest.new(max_results: max_results, next_token: next_token)
        list_cross_account_authorizations(input)
      end
      def list_cross_account_authorizations(input : Types::ListCrossAccountAuthorizationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CROSS_ACCOUNT_AUTHORIZATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the readiness checks for an account.
      def list_readiness_checks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReadinessChecksRequest.new(max_results: max_results, next_token: next_token)
        list_readiness_checks(input)
      end
      def list_readiness_checks(input : Types::ListReadinessChecksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_READINESS_CHECKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the recovery groups in an account.
      def list_recovery_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecoveryGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_recovery_groups(input)
      end
      def list_recovery_groups(input : Types::ListRecoveryGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOVERY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resource sets in an account.
      def list_resource_sets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceSetsRequest.new(max_results: max_results, next_token: next_token)
        list_resource_sets(input)
      end
      def list_resource_sets(input : Types::ListResourceSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all readiness rules, or lists the readiness rules for a specific resource type.
      def list_rules(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListRulesRequest.new(max_results: max_results, next_token: next_token, resource_type: resource_type)
        list_rules(input)
      end
      def list_rules(input : Types::ListRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for a resource.
      def list_tags_for_resources(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourcesRequest.new(resource_arn: resource_arn)
        list_tags_for_resources(input)
      end
      def list_tags_for_resources(input : Types::ListTagsForResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a resource.
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

      # Removes a tag from a resource.
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

      # Updates a cell to replace the list of nested cells with a new list of nested cells.
      def update_cell(
        cell_name : String,
        cells : Array(String)
      ) : Protocol::Request
        input = Types::UpdateCellRequest.new(cell_name: cell_name, cells: cells)
        update_cell(input)
      end
      def update_cell(input : Types::UpdateCellRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CELL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a readiness check.
      def update_readiness_check(
        readiness_check_name : String,
        resource_set_name : String
      ) : Protocol::Request
        input = Types::UpdateReadinessCheckRequest.new(readiness_check_name: readiness_check_name, resource_set_name: resource_set_name)
        update_readiness_check(input)
      end
      def update_readiness_check(input : Types::UpdateReadinessCheckRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_READINESS_CHECK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a recovery group.
      def update_recovery_group(
        cells : Array(String),
        recovery_group_name : String
      ) : Protocol::Request
        input = Types::UpdateRecoveryGroupRequest.new(cells: cells, recovery_group_name: recovery_group_name)
        update_recovery_group(input)
      end
      def update_recovery_group(input : Types::UpdateRecoveryGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOVERY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a resource set.
      def update_resource_set(
        resource_set_name : String,
        resource_set_type : String,
        resources : Array(Types::Resource)
      ) : Protocol::Request
        input = Types::UpdateResourceSetRequest.new(resource_set_name: resource_set_name, resource_set_type: resource_set_type, resources: resources)
        update_resource_set(input)
      end
      def update_resource_set(input : Types::UpdateResourceSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
