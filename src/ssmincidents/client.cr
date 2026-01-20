module Aws
  module SSMIncidents
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Retrieves details about all specified findings for an incident, including descriptive details about
      # each finding. A finding represents a recent application environment change made by an CodeDeploy
      # deployment or an CloudFormation stack creation or update that can be investigated as a potential
      # cause of the incident.

      def batch_get_incident_findings(
        finding_ids : Array(String),
        incident_record_arn : String
      ) : Protocol::Request
        input = Types::BatchGetIncidentFindingsInput.new(finding_ids: finding_ids, incident_record_arn: incident_record_arn)
        batch_get_incident_findings(input)
      end

      def batch_get_incident_findings(input : Types::BatchGetIncidentFindingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_INCIDENT_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A replication set replicates and encrypts your data to the provided Regions with the provided KMS
      # key.

      def create_replication_set(
        regions : Hash(String, Types::RegionMapInputValue),
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReplicationSetInput.new(regions: regions, client_token: client_token, tags: tags)
        create_replication_set(input)
      end

      def create_replication_set(input : Types::CreateReplicationSetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REPLICATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a response plan that automates the initial response to incidents. A response plan engages
      # contacts, starts chat channel collaboration, and initiates runbooks at the beginning of an incident.

      def create_response_plan(
        incident_template : Types::IncidentTemplate,
        name : String,
        actions : Array(Types::Action)? = nil,
        chat_channel : Types::ChatChannel? = nil,
        client_token : String? = nil,
        display_name : String? = nil,
        engagements : Array(String)? = nil,
        integrations : Array(Types::Integration)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateResponsePlanInput.new(incident_template: incident_template, name: name, actions: actions, chat_channel: chat_channel, client_token: client_token, display_name: display_name, engagements: engagements, integrations: integrations, tags: tags)
        create_response_plan(input)
      end

      def create_response_plan(input : Types::CreateResponsePlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESPONSE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom timeline event on the incident details page of an incident record. Incident Manager
      # automatically creates timeline events that mark key moments during an incident. You can create
      # custom timeline events to mark important events that Incident Manager can detect automatically.

      def create_timeline_event(
        event_data : String,
        event_time : Time,
        event_type : String,
        incident_record_arn : String,
        client_token : String? = nil,
        event_references : Array(Types::EventReference)? = nil
      ) : Protocol::Request
        input = Types::CreateTimelineEventInput.new(event_data: event_data, event_time: event_time, event_type: event_type, incident_record_arn: incident_record_arn, client_token: client_token, event_references: event_references)
        create_timeline_event(input)
      end

      def create_timeline_event(input : Types::CreateTimelineEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TIMELINE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an incident record from Incident Manager.

      def delete_incident_record(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteIncidentRecordInput.new(arn: arn)
        delete_incident_record(input)
      end

      def delete_incident_record(input : Types::DeleteIncidentRecordInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INCIDENT_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all Regions in your replication set. Deleting the replication set deletes all Incident
      # Manager data.

      def delete_replication_set(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteReplicationSetInput.new(arn: arn)
        delete_replication_set(input)
      end

      def delete_replication_set(input : Types::DeleteReplicationSetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REPLICATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource policy that Resource Access Manager uses to share your Incident Manager
      # resource.

      def delete_resource_policy(
        policy_id : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyInput.new(policy_id: policy_id, resource_arn: resource_arn)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified response plan. Deleting a response plan stops all linked CloudWatch alarms and
      # EventBridge events from creating an incident with this response plan.

      def delete_response_plan(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteResponsePlanInput.new(arn: arn)
        delete_response_plan(input)
      end

      def delete_response_plan(input : Types::DeleteResponsePlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESPONSE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a timeline event from an incident.

      def delete_timeline_event(
        event_id : String,
        incident_record_arn : String
      ) : Protocol::Request
        input = Types::DeleteTimelineEventInput.new(event_id: event_id, incident_record_arn: incident_record_arn)
        delete_timeline_event(input)
      end

      def delete_timeline_event(input : Types::DeleteTimelineEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TIMELINE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details for the specified incident record.

      def get_incident_record(
        arn : String
      ) : Protocol::Request
        input = Types::GetIncidentRecordInput.new(arn: arn)
        get_incident_record(input)
      end

      def get_incident_record(input : Types::GetIncidentRecordInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INCIDENT_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve your Incident Manager replication set.

      def get_replication_set(
        arn : String
      ) : Protocol::Request
        input = Types::GetReplicationSetInput.new(arn: arn)
        get_replication_set(input)
      end

      def get_replication_set(input : Types::GetReplicationSetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPLICATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource policies attached to the specified response plan.

      def get_resource_policies(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcePoliciesInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        get_resource_policies(input)
      end

      def get_resource_policies(input : Types::GetResourcePoliciesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the specified response plan.

      def get_response_plan(
        arn : String
      ) : Protocol::Request
        input = Types::GetResponsePlanInput.new(arn: arn)
        get_response_plan(input)
      end

      def get_response_plan(input : Types::GetResponsePlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESPONSE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a timeline event based on its ID and incident record.

      def get_timeline_event(
        event_id : String,
        incident_record_arn : String
      ) : Protocol::Request
        input = Types::GetTimelineEventInput.new(event_id: event_id, incident_record_arn: incident_record_arn)
        get_timeline_event(input)
      end

      def get_timeline_event(input : Types::GetTimelineEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TIMELINE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of the IDs of findings, plus their last modified times, that have been identified
      # for a specified incident. A finding represents a recent application environment change made by an
      # CloudFormation stack creation or update or an CodeDeploy deployment that can be investigated as a
      # potential cause of the incident.

      def list_incident_findings(
        incident_record_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIncidentFindingsInput.new(incident_record_arn: incident_record_arn, max_results: max_results, next_token: next_token)
        list_incident_findings(input)
      end

      def list_incident_findings(input : Types::ListIncidentFindingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INCIDENT_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all incident records in your account. Use this command to retrieve the Amazon Resource Name
      # (ARN) of the incident record you want to update.

      def list_incident_records(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIncidentRecordsInput.new(filters: filters, max_results: max_results, next_token: next_token)
        list_incident_records(input)
      end

      def list_incident_records(input : Types::ListIncidentRecordsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INCIDENT_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all related items for an incident record.

      def list_related_items(
        incident_record_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRelatedItemsInput.new(incident_record_arn: incident_record_arn, max_results: max_results, next_token: next_token)
        list_related_items(input)
      end

      def list_related_items(input : Types::ListRelatedItemsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RELATED_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details about the replication set configured in your account.

      def list_replication_sets(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReplicationSetsInput.new(max_results: max_results, next_token: next_token)
        list_replication_sets(input)
      end

      def list_replication_sets(input : Types::ListReplicationSetsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPLICATION_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all response plans in your account.

      def list_response_plans(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResponsePlansInput.new(max_results: max_results, next_token: next_token)
        list_response_plans(input)
      end

      def list_response_plans(input : Types::ListResponsePlansInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESPONSE_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags that are attached to the specified response plan or incident.

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

      # Lists timeline events for the specified incident record.

      def list_timeline_events(
        incident_record_arn : String,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListTimelineEventsInput.new(incident_record_arn: incident_record_arn, filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_timeline_events(input)
      end

      def list_timeline_events(input : Types::ListTimelineEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TIMELINE_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a resource policy to the specified response plan. The resource policy is used to share the
      # response plan using Resource Access Manager (RAM). For more information about cross-account sharing,
      # see Cross-Region and cross-account incident management .

      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyInput.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to start an incident from CloudWatch alarms, EventBridge events, or manually.

      def start_incident(
        response_plan_arn : String,
        client_token : String? = nil,
        impact : Int32? = nil,
        related_items : Array(Types::RelatedItem)? = nil,
        title : String? = nil,
        trigger_details : Types::TriggerDetails? = nil
      ) : Protocol::Request
        input = Types::StartIncidentInput.new(response_plan_arn: response_plan_arn, client_token: client_token, impact: impact, related_items: related_items, title: title, trigger_details: trigger_details)
        start_incident(input)
      end

      def start_incident(input : Types::StartIncidentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INCIDENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to a response plan.

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

      # Update deletion protection to either allow or deny deletion of the final Region in a replication
      # set.

      def update_deletion_protection(
        arn : String,
        deletion_protected : Bool,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeletionProtectionInput.new(arn: arn, deletion_protected: deletion_protected, client_token: client_token)
        update_deletion_protection(input)
      end

      def update_deletion_protection(input : Types::UpdateDeletionProtectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DELETION_PROTECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the details of an incident record. You can use this operation to update an incident record
      # from the defined chat channel. For more information about using actions in chat channels, see
      # Interacting through chat .

      def update_incident_record(
        arn : String,
        chat_channel : Types::ChatChannel? = nil,
        client_token : String? = nil,
        impact : Int32? = nil,
        notification_targets : Array(Types::NotificationTargetItem)? = nil,
        status : String? = nil,
        summary : String? = nil,
        title : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIncidentRecordInput.new(arn: arn, chat_channel: chat_channel, client_token: client_token, impact: impact, notification_targets: notification_targets, status: status, summary: summary, title: title)
        update_incident_record(input)
      end

      def update_incident_record(input : Types::UpdateIncidentRecordInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INCIDENT_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add or remove related items from the related items tab of an incident record.

      def update_related_items(
        incident_record_arn : String,
        related_items_update : Types::RelatedItemsUpdate,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRelatedItemsInput.new(incident_record_arn: incident_record_arn, related_items_update: related_items_update, client_token: client_token)
        update_related_items(input)
      end

      def update_related_items(input : Types::UpdateRelatedItemsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RELATED_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add or delete Regions from your replication set.

      def update_replication_set(
        actions : Array(Types::UpdateReplicationSetAction),
        arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateReplicationSetInput.new(actions: actions, arn: arn, client_token: client_token)
        update_replication_set(input)
      end

      def update_replication_set(input : Types::UpdateReplicationSetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPLICATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified response plan.

      def update_response_plan(
        arn : String,
        actions : Array(Types::Action)? = nil,
        chat_channel : Types::ChatChannel? = nil,
        client_token : String? = nil,
        display_name : String? = nil,
        engagements : Array(String)? = nil,
        incident_template_dedupe_string : String? = nil,
        incident_template_impact : Int32? = nil,
        incident_template_notification_targets : Array(Types::NotificationTargetItem)? = nil,
        incident_template_summary : String? = nil,
        incident_template_tags : Hash(String, String)? = nil,
        incident_template_title : String? = nil,
        integrations : Array(Types::Integration)? = nil
      ) : Protocol::Request
        input = Types::UpdateResponsePlanInput.new(arn: arn, actions: actions, chat_channel: chat_channel, client_token: client_token, display_name: display_name, engagements: engagements, incident_template_dedupe_string: incident_template_dedupe_string, incident_template_impact: incident_template_impact, incident_template_notification_targets: incident_template_notification_targets, incident_template_summary: incident_template_summary, incident_template_tags: incident_template_tags, incident_template_title: incident_template_title, integrations: integrations)
        update_response_plan(input)
      end

      def update_response_plan(input : Types::UpdateResponsePlanInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESPONSE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a timeline event. You can update events of type Custom Event .

      def update_timeline_event(
        event_id : String,
        incident_record_arn : String,
        client_token : String? = nil,
        event_data : String? = nil,
        event_references : Array(Types::EventReference)? = nil,
        event_time : Time? = nil,
        event_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTimelineEventInput.new(event_id: event_id, incident_record_arn: incident_record_arn, client_token: client_token, event_data: event_data, event_references: event_references, event_time: event_time, event_type: event_type)
        update_timeline_event(input)
      end

      def update_timeline_event(input : Types::UpdateTimelineEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TIMELINE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
