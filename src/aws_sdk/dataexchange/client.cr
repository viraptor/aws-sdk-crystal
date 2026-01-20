module AwsSdk
  module DataExchange
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

      # This operation accepts a data grant.

      def accept_data_grant(
        data_grant_arn : String
      ) : Protocol::Request
        input = Types::AcceptDataGrantRequest.new(data_grant_arn: data_grant_arn)
        accept_data_grant(input)
      end

      def accept_data_grant(input : Types::AcceptDataGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_DATA_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation cancels a job. Jobs can be cancelled only when they are in the WAITING state.

      def cancel_job(
        job_id : String
      ) : Protocol::Request
        input = Types::CancelJobRequest.new(job_id: job_id)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a data grant.

      def create_data_grant(
        grant_distribution_scope : String,
        name : String,
        receiver_principal : String,
        source_data_set_id : String,
        description : String? = nil,
        ends_at : Time? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataGrantRequest.new(grant_distribution_scope: grant_distribution_scope, name: name, receiver_principal: receiver_principal, source_data_set_id: source_data_set_id, description: description, ends_at: ends_at, tags: tags)
        create_data_grant(input)
      end

      def create_data_grant(input : Types::CreateDataGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a data set.

      def create_data_set(
        asset_type : String,
        description : String,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataSetRequest.new(asset_type: asset_type, description: description, name: name, tags: tags)
        create_data_set(input)
      end

      def create_data_set(input : Types::CreateDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates an event action.

      def create_event_action(
        action : Types::Action,
        event : Types::Event,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventActionRequest.new(action: action, event: event, tags: tags)
        create_event_action(input)
      end

      def create_event_action(input : Types::CreateEventActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a job.

      def create_job(
        details : Types::RequestDetails,
        type : String
      ) : Protocol::Request
        input = Types::CreateJobRequest.new(details: details, type: type)
        create_job(input)
      end

      def create_job(input : Types::CreateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a revision for a data set.

      def create_revision(
        data_set_id : String,
        comment : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRevisionRequest.new(data_set_id: data_set_id, comment: comment, tags: tags)
        create_revision(input)
      end

      def create_revision(input : Types::CreateRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes an asset.

      def delete_asset(
        asset_id : String,
        data_set_id : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::DeleteAssetRequest.new(asset_id: asset_id, data_set_id: data_set_id, revision_id: revision_id)
        delete_asset(input)
      end

      def delete_asset(input : Types::DeleteAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes a data grant.

      def delete_data_grant(
        data_grant_id : String
      ) : Protocol::Request
        input = Types::DeleteDataGrantRequest.new(data_grant_id: data_grant_id)
        delete_data_grant(input)
      end

      def delete_data_grant(input : Types::DeleteDataGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes a data set.

      def delete_data_set(
        data_set_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSetRequest.new(data_set_id: data_set_id)
        delete_data_set(input)
      end

      def delete_data_set(input : Types::DeleteDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes the event action.

      def delete_event_action(
        event_action_id : String
      ) : Protocol::Request
        input = Types::DeleteEventActionRequest.new(event_action_id: event_action_id)
        delete_event_action(input)
      end

      def delete_event_action(input : Types::DeleteEventActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes a revision.

      def delete_revision(
        data_set_id : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::DeleteRevisionRequest.new(data_set_id: data_set_id, revision_id: revision_id)
        delete_revision(input)
      end

      def delete_revision(input : Types::DeleteRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about an asset.

      def get_asset(
        asset_id : String,
        data_set_id : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::GetAssetRequest.new(asset_id: asset_id, data_set_id: data_set_id, revision_id: revision_id)
        get_asset(input)
      end

      def get_asset(input : Types::GetAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a data grant.

      def get_data_grant(
        data_grant_id : String
      ) : Protocol::Request
        input = Types::GetDataGrantRequest.new(data_grant_id: data_grant_id)
        get_data_grant(input)
      end

      def get_data_grant(input : Types::GetDataGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a data set.

      def get_data_set(
        data_set_id : String
      ) : Protocol::Request
        input = Types::GetDataSetRequest.new(data_set_id: data_set_id)
        get_data_set(input)
      end

      def get_data_set(input : Types::GetDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation retrieves information about an event action.

      def get_event_action(
        event_action_id : String
      ) : Protocol::Request
        input = Types::GetEventActionRequest.new(event_action_id: event_action_id)
        get_event_action(input)
      end

      def get_event_action(input : Types::GetEventActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a job.

      def get_job(
        job_id : String
      ) : Protocol::Request
        input = Types::GetJobRequest.new(job_id: job_id)
        get_job(input)
      end

      def get_job(input : Types::GetJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a received data grant.

      def get_received_data_grant(
        data_grant_arn : String
      ) : Protocol::Request
        input = Types::GetReceivedDataGrantRequest.new(data_grant_arn: data_grant_arn)
        get_received_data_grant(input)
      end

      def get_received_data_grant(input : Types::GetReceivedDataGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECEIVED_DATA_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a revision.

      def get_revision(
        data_set_id : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::GetRevisionRequest.new(data_set_id: data_set_id, revision_id: revision_id)
        get_revision(input)
      end

      def get_revision(input : Types::GetRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about all data grants.

      def list_data_grants(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataGrantsRequest.new(max_results: max_results, next_token: next_token)
        list_data_grants(input)
      end

      def list_data_grants(input : Types::ListDataGrantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_GRANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists a data set's revisions sorted by CreatedAt in descending order.

      def list_data_set_revisions(
        data_set_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetRevisionsRequest.new(data_set_id: data_set_id, max_results: max_results, next_token: next_token)
        list_data_set_revisions(input)
      end

      def list_data_set_revisions(input : Types::ListDataSetRevisionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SET_REVISIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists your data sets. When listing by origin OWNED, results are sorted by CreatedAt
      # in descending order. When listing by origin ENTITLED, there is no order.

      def list_data_sets(
        max_results : Int32? = nil,
        next_token : String? = nil,
        origin : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetsRequest.new(max_results: max_results, next_token: next_token, origin: origin)
        list_data_sets(input)
      end

      def list_data_sets(input : Types::ListDataSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists your event actions.

      def list_event_actions(
        event_source_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventActionsRequest.new(event_source_id: event_source_id, max_results: max_results, next_token: next_token)
        list_event_actions(input)
      end

      def list_event_actions(input : Types::ListEventActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists your jobs sorted by CreatedAt in descending order.

      def list_jobs(
        data_set_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(data_set_id: data_set_id, max_results: max_results, next_token: next_token, revision_id: revision_id)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about all received data grants.

      def list_received_data_grants(
        acceptance_state : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReceivedDataGrantsRequest.new(acceptance_state: acceptance_state, max_results: max_results, next_token: next_token)
        list_received_data_grants(input)
      end

      def list_received_data_grants(input : Types::ListReceivedDataGrantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECEIVED_DATA_GRANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists a revision's assets sorted alphabetically in descending order.

      def list_revision_assets(
        data_set_id : String,
        revision_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRevisionAssetsRequest.new(data_set_id: data_set_id, revision_id: revision_id, max_results: max_results, next_token: next_token)
        list_revision_assets(input)
      end

      def list_revision_assets(input : Types::ListRevisionAssetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REVISION_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists the tags on the resource.

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

      # This operation revokes subscribers' access to a revision.

      def revoke_revision(
        data_set_id : String,
        revision_id : String,
        revocation_comment : String
      ) : Protocol::Request
        input = Types::RevokeRevisionRequest.new(data_set_id: data_set_id, revision_id: revision_id, revocation_comment: revocation_comment)
        revoke_revision(input)
      end

      def revoke_revision(input : Types::RevokeRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation invokes an API Gateway API asset. The request is proxied to the provider’s API
      # Gateway API.

      def send_api_asset(
        asset_id : String,
        data_set_id : String,
        revision_id : String,
        body : String? = nil,
        method : String? = nil,
        path : String? = nil,
        query_string_parameters : Hash(String, String)? = nil,
        request_headers : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::SendApiAssetRequest.new(asset_id: asset_id, data_set_id: data_set_id, revision_id: revision_id, body: body, method: method, path: path, query_string_parameters: query_string_parameters, request_headers: request_headers)
        send_api_asset(input)
      end

      def send_api_asset(input : Types::SendApiAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_API_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The type of event associated with the data set.

      def send_data_set_notification(
        data_set_id : String,
        type : String,
        client_token : String? = nil,
        comment : String? = nil,
        details : Types::NotificationDetails? = nil,
        scope : Types::ScopeDetails? = nil
      ) : Protocol::Request
        input = Types::SendDataSetNotificationRequest.new(data_set_id: data_set_id, type: type, client_token: client_token, comment: comment, details: details, scope: scope)
        send_data_set_notification(input)
      end

      def send_data_set_notification(input : Types::SendDataSetNotificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DATA_SET_NOTIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation starts a job.

      def start_job(
        job_id : String
      ) : Protocol::Request
        input = Types::StartJobRequest.new(job_id: job_id)
        start_job(input)
      end

      def start_job(input : Types::StartJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation tags a resource.

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

      # This operation removes one or more tags from a resource.

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

      # This operation updates an asset.

      def update_asset(
        asset_id : String,
        data_set_id : String,
        name : String,
        revision_id : String
      ) : Protocol::Request
        input = Types::UpdateAssetRequest.new(asset_id: asset_id, data_set_id: data_set_id, name: name, revision_id: revision_id)
        update_asset(input)
      end

      def update_asset(input : Types::UpdateAssetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation updates a data set.

      def update_data_set(
        data_set_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSetRequest.new(data_set_id: data_set_id, description: description, name: name)
        update_data_set(input)
      end

      def update_data_set(input : Types::UpdateDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation updates the event action.

      def update_event_action(
        event_action_id : String,
        action : Types::Action? = nil
      ) : Protocol::Request
        input = Types::UpdateEventActionRequest.new(event_action_id: event_action_id, action: action)
        update_event_action(input)
      end

      def update_event_action(input : Types::UpdateEventActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation updates a revision.

      def update_revision(
        data_set_id : String,
        revision_id : String,
        comment : String? = nil,
        finalized : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateRevisionRequest.new(data_set_id: data_set_id, revision_id: revision_id, comment: comment, finalized: finalized)
        update_revision(input)
      end

      def update_revision(input : Types::UpdateRevisionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
