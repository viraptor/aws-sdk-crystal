module AwsSdk
  module Appflow
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

      # Cancels active runs for a flow. You can cancel all of the active runs for a flow, or you can cancel
      # specific runs by providing their IDs. You can cancel a flow run only when the run is in progress.
      # You can't cancel a run that has already completed or failed. You also can't cancel a run that's
      # scheduled to occur but hasn't started yet. To prevent a scheduled run, you can deactivate the flow
      # with the StopFlow action. You cannot resume a run after you cancel it. When you send your request,
      # the status for each run becomes CancelStarted . When the cancellation completes, the status becomes
      # Canceled . When you cancel a run, you still incur charges for any data that the run already
      # processed before the cancellation. If the run had already written some data to the flow destination,
      # then that data remains in the destination. If you configured the flow to use a batch API (such as
      # the Salesforce Bulk API 2.0), then the run will finish reading or writing its entire batch of data
      # after the cancellation. For these operations, the data processing charges for Amazon AppFlow apply.
      # For the pricing information, see Amazon AppFlow pricing .

      def cancel_flow_executions(
        flow_name : String,
        execution_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CancelFlowExecutionsRequest.new(flow_name: flow_name, execution_ids: execution_ids)
        cancel_flow_executions(input)
      end

      def cancel_flow_executions(input : Types::CancelFlowExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_FLOW_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new connector profile associated with your Amazon Web Services account. There is a soft
      # quota of 100 connector profiles per Amazon Web Services account. If you need more connector profiles
      # than this quota allows, you can submit a request to the Amazon AppFlow team through the Amazon
      # AppFlow support channel. In each connector profile that you create, you can provide the credentials
      # and properties for only one connector.

      def create_connector_profile(
        connection_mode : String,
        connector_profile_config : Types::ConnectorProfileConfig,
        connector_profile_name : String,
        connector_type : String,
        client_token : String? = nil,
        connector_label : String? = nil,
        kms_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorProfileRequest.new(connection_mode: connection_mode, connector_profile_config: connector_profile_config, connector_profile_name: connector_profile_name, connector_type: connector_type, client_token: client_token, connector_label: connector_label, kms_arn: kms_arn)
        create_connector_profile(input)
      end

      def create_connector_profile(input : Types::CreateConnectorProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables your application to create a new flow using Amazon AppFlow. You must create a connector
      # profile before calling this API. Please note that the Request Syntax below shows syntax for multiple
      # destinations, however, you can only transfer data to one item in this list at a time. Amazon AppFlow
      # does not currently support flows to multiple destinations at once.

      def create_flow(
        destination_flow_config_list : Array(Types::DestinationFlowConfig),
        flow_name : String,
        source_flow_config : Types::SourceFlowConfig,
        tasks : Array(Types::Task),
        trigger_config : Types::TriggerConfig,
        client_token : String? = nil,
        description : String? = nil,
        kms_arn : String? = nil,
        metadata_catalog_config : Types::MetadataCatalogConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFlowRequest.new(destination_flow_config_list: destination_flow_config_list, flow_name: flow_name, source_flow_config: source_flow_config, tasks: tasks, trigger_config: trigger_config, client_token: client_token, description: description, kms_arn: kms_arn, metadata_catalog_config: metadata_catalog_config, tags: tags)
        create_flow(input)
      end

      def create_flow(input : Types::CreateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to delete an existing connector profile.

      def delete_connector_profile(
        connector_profile_name : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteConnectorProfileRequest.new(connector_profile_name: connector_profile_name, force_delete: force_delete)
        delete_connector_profile(input)
      end

      def delete_connector_profile(input : Types::DeleteConnectorProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables your application to delete an existing flow. Before deleting the flow, Amazon AppFlow
      # validates the request by checking the flow configuration and status. You can delete flows one at a
      # time.

      def delete_flow(
        flow_name : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteFlowRequest.new(flow_name: flow_name, force_delete: force_delete)
        delete_flow(input)
      end

      def delete_flow(input : Types::DeleteFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the given custom connector registered in your Amazon Web Services account. This API can be
      # used for custom connectors that are registered in your account and also for Amazon authored
      # connectors.

      def describe_connector(
        connector_type : String,
        connector_label : String? = nil
      ) : Protocol::Request
        input = Types::DescribeConnectorRequest.new(connector_type: connector_type, connector_label: connector_label)
        describe_connector(input)
      end

      def describe_connector(input : Types::DescribeConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides details regarding the entity used with the connector, with a description of the data model
      # for each field in that entity.

      def describe_connector_entity(
        connector_entity_name : String,
        api_version : String? = nil,
        connector_profile_name : String? = nil,
        connector_type : String? = nil
      ) : Protocol::Request
        input = Types::DescribeConnectorEntityRequest.new(connector_entity_name: connector_entity_name, api_version: api_version, connector_profile_name: connector_profile_name, connector_type: connector_type)
        describe_connector_entity(input)
      end

      def describe_connector_entity(input : Types::DescribeConnectorEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTOR_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of connector-profile details matching the provided connector-profile names and
      # connector-types . Both input lists are optional, and you can use them to filter the result. If no
      # names or connector-types are provided, returns all connector profiles in a paginated form. If there
      # is no match, this operation returns an empty list.

      def describe_connector_profiles(
        connector_label : String? = nil,
        connector_profile_names : Array(String)? = nil,
        connector_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeConnectorProfilesRequest.new(connector_label: connector_label, connector_profile_names: connector_profile_names, connector_type: connector_type, max_results: max_results, next_token: next_token)
        describe_connector_profiles(input)
      end

      def describe_connector_profiles(input : Types::DescribeConnectorProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTOR_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the connectors vended by Amazon AppFlow for specified connector types. If you don't
      # specify a connector type, this operation describes all connectors vended by Amazon AppFlow. If there
      # are more connectors than can be returned in one page, the response contains a nextToken object,
      # which can be be passed in to the next call to the DescribeConnectors API operation to retrieve the
      # next page.

      def describe_connectors(
        connector_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeConnectorsRequest.new(connector_types: connector_types, max_results: max_results, next_token: next_token)
        describe_connectors(input)
      end

      def describe_connectors(input : Types::DescribeConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a description of the specified flow.

      def describe_flow(
        flow_name : String
      ) : Protocol::Request
        input = Types::DescribeFlowRequest.new(flow_name: flow_name)
        describe_flow(input)
      end

      def describe_flow(input : Types::DescribeFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetches the execution history of the flow.

      def describe_flow_execution_records(
        flow_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeFlowExecutionRecordsRequest.new(flow_name: flow_name, max_results: max_results, next_token: next_token)
        describe_flow_execution_records(input)
      end

      def describe_flow_execution_records(input : Types::DescribeFlowExecutionRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FLOW_EXECUTION_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of available connector entities supported by Amazon AppFlow. For example, you can
      # query Salesforce for Account and Opportunity entities, or query ServiceNow for the Incident entity.

      def list_connector_entities(
        api_version : String? = nil,
        connector_profile_name : String? = nil,
        connector_type : String? = nil,
        entities_path : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorEntitiesRequest.new(api_version: api_version, connector_profile_name: connector_profile_name, connector_type: connector_type, entities_path: entities_path, max_results: max_results, next_token: next_token)
        list_connector_entities(input)
      end

      def list_connector_entities(input : Types::ListConnectorEntitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTOR_ENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of all registered custom connectors in your Amazon Web Services account. This API
      # lists only custom connectors registered in this account, not the Amazon Web Services authored
      # connectors.

      def list_connectors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsRequest.new(max_results: max_results, next_token: next_token)
        list_connectors(input)
      end

      def list_connectors(input : Types::ListConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the flows associated with your account.

      def list_flows(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowsRequest.new(max_results: max_results, next_token: next_token)
        list_flows(input)
      end

      def list_flows(input : Types::ListFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tags that are associated with a specified flow.

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

      # Registers a new custom connector with your Amazon Web Services account. Before you can register the
      # connector, you must deploy the associated AWS lambda function in your account.

      def register_connector(
        client_token : String? = nil,
        connector_label : String? = nil,
        connector_provisioning_config : Types::ConnectorProvisioningConfig? = nil,
        connector_provisioning_type : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::RegisterConnectorRequest.new(client_token: client_token, connector_label: connector_label, connector_provisioning_config: connector_provisioning_config, connector_provisioning_type: connector_provisioning_type, description: description)
        register_connector(input)
      end

      def register_connector(input : Types::RegisterConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets metadata about your connector entities that Amazon AppFlow stored in its cache. Use this
      # action when you want Amazon AppFlow to return the latest information about the data that you have in
      # a source application. Amazon AppFlow returns metadata about your entities when you use the
      # ListConnectorEntities or DescribeConnectorEntities actions. Following these actions, Amazon AppFlow
      # caches the metadata to reduce the number of API requests that it must send to the source
      # application. Amazon AppFlow automatically resets the cache once every hour, but you can use this
      # action when you want to get the latest metadata right away.

      def reset_connector_metadata_cache(
        api_version : String? = nil,
        connector_entity_name : String? = nil,
        connector_profile_name : String? = nil,
        connector_type : String? = nil,
        entities_path : String? = nil
      ) : Protocol::Request
        input = Types::ResetConnectorMetadataCacheRequest.new(api_version: api_version, connector_entity_name: connector_entity_name, connector_profile_name: connector_profile_name, connector_type: connector_type, entities_path: entities_path)
        reset_connector_metadata_cache(input)
      end

      def reset_connector_metadata_cache(input : Types::ResetConnectorMetadataCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_CONNECTOR_METADATA_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Activates an existing flow. For on-demand flows, this operation runs the flow immediately. For
      # schedule and event-triggered flows, this operation activates the flow.

      def start_flow(
        flow_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartFlowRequest.new(flow_name: flow_name, client_token: client_token)
        start_flow(input)
      end

      def start_flow(input : Types::StartFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deactivates the existing flow. For on-demand flows, this operation returns an
      # unsupportedOperationException error message. For schedule and event-triggered flows, this operation
      # deactivates the flow.

      def stop_flow(
        flow_name : String
      ) : Protocol::Request
        input = Types::StopFlowRequest.new(flow_name: flow_name)
        stop_flow(input)
      end

      def stop_flow(input : Types::StopFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies a tag to the specified flow.

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

      # Unregisters the custom connector registered in your account that matches the connector label
      # provided in the request.

      def unregister_connector(
        connector_label : String,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::UnregisterConnectorRequest.new(connector_label: connector_label, force_delete: force_delete)
        unregister_connector(input)
      end

      def unregister_connector(input : Types::UnregisterConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNREGISTER_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from the specified flow.

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

      # Updates a given connector profile associated with your account.

      def update_connector_profile(
        connection_mode : String,
        connector_profile_config : Types::ConnectorProfileConfig,
        connector_profile_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorProfileRequest.new(connection_mode: connection_mode, connector_profile_config: connector_profile_config, connector_profile_name: connector_profile_name, client_token: client_token)
        update_connector_profile(input)
      end

      def update_connector_profile(input : Types::UpdateConnectorProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom connector that you've previously registered. This operation updates the connector
      # with one of the following: The latest version of the AWS Lambda function that's assigned to the
      # connector A new AWS Lambda function that you specify

      def update_connector_registration(
        connector_label : String,
        client_token : String? = nil,
        connector_provisioning_config : Types::ConnectorProvisioningConfig? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorRegistrationRequest.new(connector_label: connector_label, client_token: client_token, connector_provisioning_config: connector_provisioning_config, description: description)
        update_connector_registration(input)
      end

      def update_connector_registration(input : Types::UpdateConnectorRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing flow.

      def update_flow(
        destination_flow_config_list : Array(Types::DestinationFlowConfig),
        flow_name : String,
        source_flow_config : Types::SourceFlowConfig,
        tasks : Array(Types::Task),
        trigger_config : Types::TriggerConfig,
        client_token : String? = nil,
        description : String? = nil,
        metadata_catalog_config : Types::MetadataCatalogConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowRequest.new(destination_flow_config_list: destination_flow_config_list, flow_name: flow_name, source_flow_config: source_flow_config, tasks: tasks, trigger_config: trigger_config, client_token: client_token, description: description, metadata_catalog_config: metadata_catalog_config)
        update_flow(input)
      end

      def update_flow(input : Types::UpdateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
