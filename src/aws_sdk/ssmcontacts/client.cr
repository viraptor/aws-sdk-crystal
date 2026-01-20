module AwsSdk
  module SSMContacts
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

      # Used to acknowledge an engagement to a contact channel during an incident.

      def accept_page(
        accept_code : String,
        accept_type : String,
        page_id : String,
        accept_code_validation : String? = nil,
        contact_channel_id : String? = nil,
        note : String? = nil
      ) : Types::AcceptPageResult

        input = Types::AcceptPageRequest.new(accept_code: accept_code, accept_type: accept_type, page_id: page_id, accept_code_validation: accept_code_validation, contact_channel_id: contact_channel_id, note: note)
        accept_page(input)
      end

      def accept_page(input : Types::AcceptPageRequest) : Types::AcceptPageResult
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_PAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptPageResult, "AcceptPage")
      end

      # Activates a contact's contact channel. Incident Manager can't engage a contact until the contact
      # channel has been activated.

      def activate_contact_channel(
        activation_code : String,
        contact_channel_id : String
      ) : Types::ActivateContactChannelResult

        input = Types::ActivateContactChannelRequest.new(activation_code: activation_code, contact_channel_id: contact_channel_id)
        activate_contact_channel(input)
      end

      def activate_contact_channel(input : Types::ActivateContactChannelRequest) : Types::ActivateContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::ACTIVATE_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivateContactChannelResult, "ActivateContactChannel")
      end

      # Contacts are either the contacts that Incident Manager engages during an incident or the escalation
      # plans that Incident Manager uses to engage contacts in phases during an incident.

      def create_contact(
        alias_ : String,
        plan : Types::Plan,
        type : String,
        display_name : String? = nil,
        idempotency_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateContactResult

        input = Types::CreateContactRequest.new(alias_: alias_, plan: plan, type: type, display_name: display_name, idempotency_token: idempotency_token, tags: tags)
        create_contact(input)
      end

      def create_contact(input : Types::CreateContactRequest) : Types::CreateContactResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContactResult, "CreateContact")
      end

      # A contact channel is the method that Incident Manager uses to engage your contact.

      def create_contact_channel(
        contact_id : String,
        delivery_address : Types::ContactChannelAddress,
        name : String,
        type : String,
        defer_activation : Bool? = nil,
        idempotency_token : String? = nil
      ) : Types::CreateContactChannelResult

        input = Types::CreateContactChannelRequest.new(contact_id: contact_id, delivery_address: delivery_address, name: name, type: type, defer_activation: defer_activation, idempotency_token: idempotency_token)
        create_contact_channel(input)
      end

      def create_contact_channel(input : Types::CreateContactChannelRequest) : Types::CreateContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContactChannelResult, "CreateContactChannel")
      end

      # Creates a rotation in an on-call schedule.

      def create_rotation(
        contact_ids : Array(String),
        name : String,
        recurrence : Types::RecurrenceSettings,
        time_zone_id : String,
        idempotency_token : String? = nil,
        start_time : Time? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRotationResult

        input = Types::CreateRotationRequest.new(contact_ids: contact_ids, name: name, recurrence: recurrence, time_zone_id: time_zone_id, idempotency_token: idempotency_token, start_time: start_time, tags: tags)
        create_rotation(input)
      end

      def create_rotation(input : Types::CreateRotationRequest) : Types::CreateRotationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ROTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRotationResult, "CreateRotation")
      end

      # Creates an override for a rotation in an on-call schedule.

      def create_rotation_override(
        end_time : Time,
        new_contact_ids : Array(String),
        rotation_id : String,
        start_time : Time,
        idempotency_token : String? = nil
      ) : Types::CreateRotationOverrideResult

        input = Types::CreateRotationOverrideRequest.new(end_time: end_time, new_contact_ids: new_contact_ids, rotation_id: rotation_id, start_time: start_time, idempotency_token: idempotency_token)
        create_rotation_override(input)
      end

      def create_rotation_override(input : Types::CreateRotationOverrideRequest) : Types::CreateRotationOverrideResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ROTATION_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRotationOverrideResult, "CreateRotationOverride")
      end

      # To no longer receive Incident Manager engagements to a contact channel, you can deactivate the
      # channel.

      def deactivate_contact_channel(
        contact_channel_id : String
      ) : Types::DeactivateContactChannelResult

        input = Types::DeactivateContactChannelRequest.new(contact_channel_id: contact_channel_id)
        deactivate_contact_channel(input)
      end

      def deactivate_contact_channel(input : Types::DeactivateContactChannelRequest) : Types::DeactivateContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::DEACTIVATE_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeactivateContactChannelResult, "DeactivateContactChannel")
      end

      # To remove a contact from Incident Manager, you can delete the contact. However, deleting a contact
      # does not remove it from escalation plans and related response plans. Deleting an escalation plan
      # also does not remove it from all related response plans. To modify an escalation plan, we recommend
      # using the UpdateContact action to specify a different existing contact.

      def delete_contact(
        contact_id : String
      ) : Types::DeleteContactResult

        input = Types::DeleteContactRequest.new(contact_id: contact_id)
        delete_contact(input)
      end

      def delete_contact(input : Types::DeleteContactRequest) : Types::DeleteContactResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContactResult, "DeleteContact")
      end

      # To stop receiving engagements on a contact channel, you can delete the channel from a contact.
      # Deleting the contact channel does not remove it from the contact's engagement plan, but the stage
      # that includes the channel will be ignored. If you delete the only contact channel for a contact,
      # you'll no longer be able to engage that contact during an incident.

      def delete_contact_channel(
        contact_channel_id : String
      ) : Types::DeleteContactChannelResult

        input = Types::DeleteContactChannelRequest.new(contact_channel_id: contact_channel_id)
        delete_contact_channel(input)
      end

      def delete_contact_channel(input : Types::DeleteContactChannelRequest) : Types::DeleteContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContactChannelResult, "DeleteContactChannel")
      end

      # Deletes a rotation from the system. If a rotation belongs to more than one on-call schedule, this
      # operation deletes it from all of them.

      def delete_rotation(
        rotation_id : String
      ) : Types::DeleteRotationResult

        input = Types::DeleteRotationRequest.new(rotation_id: rotation_id)
        delete_rotation(input)
      end

      def delete_rotation(input : Types::DeleteRotationRequest) : Types::DeleteRotationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ROTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRotationResult, "DeleteRotation")
      end

      # Deletes an existing override for an on-call rotation.

      def delete_rotation_override(
        rotation_id : String,
        rotation_override_id : String
      ) : Types::DeleteRotationOverrideResult

        input = Types::DeleteRotationOverrideRequest.new(rotation_id: rotation_id, rotation_override_id: rotation_override_id)
        delete_rotation_override(input)
      end

      def delete_rotation_override(input : Types::DeleteRotationOverrideRequest) : Types::DeleteRotationOverrideResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ROTATION_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRotationOverrideResult, "DeleteRotationOverride")
      end

      # Incident Manager uses engagements to engage contacts and escalation plans during an incident. Use
      # this command to describe the engagement that occurred during an incident.

      def describe_engagement(
        engagement_id : String
      ) : Types::DescribeEngagementResult

        input = Types::DescribeEngagementRequest.new(engagement_id: engagement_id)
        describe_engagement(input)
      end

      def describe_engagement(input : Types::DescribeEngagementRequest) : Types::DescribeEngagementResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEngagementResult, "DescribeEngagement")
      end

      # Lists details of the engagement to a contact channel.

      def describe_page(
        page_id : String
      ) : Types::DescribePageResult

        input = Types::DescribePageRequest.new(page_id: page_id)
        describe_page(input)
      end

      def describe_page(input : Types::DescribePageRequest) : Types::DescribePageResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePageResult, "DescribePage")
      end

      # Retrieves information about the specified contact or escalation plan.

      def get_contact(
        contact_id : String
      ) : Types::GetContactResult

        input = Types::GetContactRequest.new(contact_id: contact_id)
        get_contact(input)
      end

      def get_contact(input : Types::GetContactRequest) : Types::GetContactResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContactResult, "GetContact")
      end

      # List details about a specific contact channel.

      def get_contact_channel(
        contact_channel_id : String
      ) : Types::GetContactChannelResult

        input = Types::GetContactChannelRequest.new(contact_channel_id: contact_channel_id)
        get_contact_channel(input)
      end

      def get_contact_channel(input : Types::GetContactChannelRequest) : Types::GetContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContactChannelResult, "GetContactChannel")
      end

      # Retrieves the resource policies attached to the specified contact or escalation plan.

      def get_contact_policy(
        contact_arn : String
      ) : Types::GetContactPolicyResult

        input = Types::GetContactPolicyRequest.new(contact_arn: contact_arn)
        get_contact_policy(input)
      end

      def get_contact_policy(input : Types::GetContactPolicyRequest) : Types::GetContactPolicyResult
        request = Protocol::JsonRpc.build_request(Model::GET_CONTACT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContactPolicyResult, "GetContactPolicy")
      end

      # Retrieves information about an on-call rotation.

      def get_rotation(
        rotation_id : String
      ) : Types::GetRotationResult

        input = Types::GetRotationRequest.new(rotation_id: rotation_id)
        get_rotation(input)
      end

      def get_rotation(input : Types::GetRotationRequest) : Types::GetRotationResult
        request = Protocol::JsonRpc.build_request(Model::GET_ROTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRotationResult, "GetRotation")
      end

      # Retrieves information about an override to an on-call rotation.

      def get_rotation_override(
        rotation_id : String,
        rotation_override_id : String
      ) : Types::GetRotationOverrideResult

        input = Types::GetRotationOverrideRequest.new(rotation_id: rotation_id, rotation_override_id: rotation_override_id)
        get_rotation_override(input)
      end

      def get_rotation_override(input : Types::GetRotationOverrideRequest) : Types::GetRotationOverrideResult
        request = Protocol::JsonRpc.build_request(Model::GET_ROTATION_OVERRIDE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRotationOverrideResult, "GetRotationOverride")
      end

      # Lists all contact channels for the specified contact.

      def list_contact_channels(
        contact_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListContactChannelsResult

        input = Types::ListContactChannelsRequest.new(contact_id: contact_id, max_results: max_results, next_token: next_token)
        list_contact_channels(input)
      end

      def list_contact_channels(input : Types::ListContactChannelsRequest) : Types::ListContactChannelsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTACT_CHANNELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContactChannelsResult, "ListContactChannels")
      end

      # Lists all contacts and escalation plans in Incident Manager.

      def list_contacts(
        alias_prefix : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Types::ListContactsResult

        input = Types::ListContactsRequest.new(alias_prefix: alias_prefix, max_results: max_results, next_token: next_token, type: type)
        list_contacts(input)
      end

      def list_contacts(input : Types::ListContactsRequest) : Types::ListContactsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContactsResult, "ListContacts")
      end

      # Lists all engagements that have happened in an incident.

      def list_engagements(
        incident_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        time_range_value : Types::TimeRange? = nil
      ) : Types::ListEngagementsResult

        input = Types::ListEngagementsRequest.new(incident_id: incident_id, max_results: max_results, next_token: next_token, time_range_value: time_range_value)
        list_engagements(input)
      end

      def list_engagements(input : Types::ListEngagementsRequest) : Types::ListEngagementsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ENGAGEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEngagementsResult, "ListEngagements")
      end

      # Lists all of the engagements to contact channels that have been acknowledged.

      def list_page_receipts(
        page_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPageReceiptsResult

        input = Types::ListPageReceiptsRequest.new(page_id: page_id, max_results: max_results, next_token: next_token)
        list_page_receipts(input)
      end

      def list_page_receipts(input : Types::ListPageReceiptsRequest) : Types::ListPageReceiptsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PAGE_RECEIPTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPageReceiptsResult, "ListPageReceipts")
      end

      # Returns the resolution path of an engagement. For example, the escalation plan engaged in an
      # incident might target an on-call schedule that includes several contacts in a rotation, but just one
      # contact on-call when the incident starts. The resolution path indicates the hierarchy of escalation
      # plan &gt; on-call schedule &gt; contact .

      def list_page_resolutions(
        page_id : String,
        next_token : String? = nil
      ) : Types::ListPageResolutionsResult

        input = Types::ListPageResolutionsRequest.new(page_id: page_id, next_token: next_token)
        list_page_resolutions(input)
      end

      def list_page_resolutions(input : Types::ListPageResolutionsRequest) : Types::ListPageResolutionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PAGE_RESOLUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPageResolutionsResult, "ListPageResolutions")
      end

      # Lists the engagements to a contact's contact channels.

      def list_pages_by_contact(
        contact_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPagesByContactResult

        input = Types::ListPagesByContactRequest.new(contact_id: contact_id, max_results: max_results, next_token: next_token)
        list_pages_by_contact(input)
      end

      def list_pages_by_contact(input : Types::ListPagesByContactRequest) : Types::ListPagesByContactResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PAGES_BY_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPagesByContactResult, "ListPagesByContact")
      end

      # Lists the engagements to contact channels that occurred by engaging a contact.

      def list_pages_by_engagement(
        engagement_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPagesByEngagementResult

        input = Types::ListPagesByEngagementRequest.new(engagement_id: engagement_id, max_results: max_results, next_token: next_token)
        list_pages_by_engagement(input)
      end

      def list_pages_by_engagement(input : Types::ListPagesByEngagementRequest) : Types::ListPagesByEngagementResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PAGES_BY_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPagesByEngagementResult, "ListPagesByEngagement")
      end

      # Returns a list of shifts based on rotation configuration parameters. The Incident Manager primarily
      # uses this operation to populate the Preview calendar. It is not typically run by end users.

      def list_preview_rotation_shifts(
        end_time : Time,
        members : Array(String),
        recurrence : Types::RecurrenceSettings,
        time_zone_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        overrides : Array(Types::PreviewOverride)? = nil,
        rotation_start_time : Time? = nil,
        start_time : Time? = nil
      ) : Types::ListPreviewRotationShiftsResult

        input = Types::ListPreviewRotationShiftsRequest.new(end_time: end_time, members: members, recurrence: recurrence, time_zone_id: time_zone_id, max_results: max_results, next_token: next_token, overrides: overrides, rotation_start_time: rotation_start_time, start_time: start_time)
        list_preview_rotation_shifts(input)
      end

      def list_preview_rotation_shifts(input : Types::ListPreviewRotationShiftsRequest) : Types::ListPreviewRotationShiftsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PREVIEW_ROTATION_SHIFTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPreviewRotationShiftsResult, "ListPreviewRotationShifts")
      end

      # Retrieves a list of overrides currently specified for an on-call rotation.

      def list_rotation_overrides(
        end_time : Time,
        rotation_id : String,
        start_time : Time,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRotationOverridesResult

        input = Types::ListRotationOverridesRequest.new(end_time: end_time, rotation_id: rotation_id, start_time: start_time, max_results: max_results, next_token: next_token)
        list_rotation_overrides(input)
      end

      def list_rotation_overrides(input : Types::ListRotationOverridesRequest) : Types::ListRotationOverridesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ROTATION_OVERRIDES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRotationOverridesResult, "ListRotationOverrides")
      end

      # Returns a list of shifts generated by an existing rotation in the system.

      def list_rotation_shifts(
        end_time : Time,
        rotation_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::ListRotationShiftsResult

        input = Types::ListRotationShiftsRequest.new(end_time: end_time, rotation_id: rotation_id, max_results: max_results, next_token: next_token, start_time: start_time)
        list_rotation_shifts(input)
      end

      def list_rotation_shifts(input : Types::ListRotationShiftsRequest) : Types::ListRotationShiftsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ROTATION_SHIFTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRotationShiftsResult, "ListRotationShifts")
      end

      # Retrieves a list of on-call rotations.

      def list_rotations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        rotation_name_prefix : String? = nil
      ) : Types::ListRotationsResult

        input = Types::ListRotationsRequest.new(max_results: max_results, next_token: next_token, rotation_name_prefix: rotation_name_prefix)
        list_rotations(input)
      end

      def list_rotations(input : Types::ListRotationsRequest) : Types::ListRotationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ROTATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRotationsResult, "ListRotations")
      end

      # Lists the tags of a contact, escalation plan, rotation, or on-call schedule.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResult

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Adds a resource policy to the specified contact or escalation plan. The resource policy is used to
      # share the contact or escalation plan using Resource Access Manager (RAM). For more information about
      # cross-account sharing, see Setting up cross-account functionality .

      def put_contact_policy(
        contact_arn : String,
        policy : String
      ) : Types::PutContactPolicyResult

        input = Types::PutContactPolicyRequest.new(contact_arn: contact_arn, policy: policy)
        put_contact_policy(input)
      end

      def put_contact_policy(input : Types::PutContactPolicyRequest) : Types::PutContactPolicyResult
        request = Protocol::JsonRpc.build_request(Model::PUT_CONTACT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutContactPolicyResult, "PutContactPolicy")
      end

      # Sends an activation code to a contact channel. The contact can use this code to activate the contact
      # channel in the console or with the ActivateChannel operation. Incident Manager can't engage a
      # contact channel until it has been activated.

      def send_activation_code(
        contact_channel_id : String
      ) : Types::SendActivationCodeResult

        input = Types::SendActivationCodeRequest.new(contact_channel_id: contact_channel_id)
        send_activation_code(input)
      end

      def send_activation_code(input : Types::SendActivationCodeRequest) : Types::SendActivationCodeResult
        request = Protocol::JsonRpc.build_request(Model::SEND_ACTIVATION_CODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendActivationCodeResult, "SendActivationCode")
      end

      # Starts an engagement to a contact or escalation plan. The engagement engages each contact specified
      # in the incident.

      def start_engagement(
        contact_id : String,
        content : String,
        sender : String,
        subject : String,
        idempotency_token : String? = nil,
        incident_id : String? = nil,
        public_content : String? = nil,
        public_subject : String? = nil
      ) : Types::StartEngagementResult

        input = Types::StartEngagementRequest.new(contact_id: contact_id, content: content, sender: sender, subject: subject, idempotency_token: idempotency_token, incident_id: incident_id, public_content: public_content, public_subject: public_subject)
        start_engagement(input)
      end

      def start_engagement(input : Types::StartEngagementRequest) : Types::StartEngagementResult
        request = Protocol::JsonRpc.build_request(Model::START_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartEngagementResult, "StartEngagement")
      end

      # Stops an engagement before it finishes the final stage of the escalation plan or engagement plan.
      # Further contacts aren't engaged.

      def stop_engagement(
        engagement_id : String,
        reason : String? = nil
      ) : Types::StopEngagementResult

        input = Types::StopEngagementRequest.new(engagement_id: engagement_id, reason: reason)
        stop_engagement(input)
      end

      def stop_engagement(input : Types::StopEngagementRequest) : Types::StopEngagementResult
        request = Protocol::JsonRpc.build_request(Model::STOP_ENGAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopEngagementResult, "StopEngagement")
      end

      # Tags a contact or escalation plan. You can tag only contacts and escalation plans in the first
      # region of your replication set.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResult

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResult
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResult, "TagResource")
      end

      # Removes tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResult

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResult
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResult, "UntagResource")
      end

      # Updates the contact or escalation plan specified.

      def update_contact(
        contact_id : String,
        display_name : String? = nil,
        plan : Types::Plan? = nil
      ) : Types::UpdateContactResult

        input = Types::UpdateContactRequest.new(contact_id: contact_id, display_name: display_name, plan: plan)
        update_contact(input)
      end

      def update_contact(input : Types::UpdateContactRequest) : Types::UpdateContactResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContactResult, "UpdateContact")
      end

      # Updates a contact's contact channel.

      def update_contact_channel(
        contact_channel_id : String,
        delivery_address : Types::ContactChannelAddress? = nil,
        name : String? = nil
      ) : Types::UpdateContactChannelResult

        input = Types::UpdateContactChannelRequest.new(contact_channel_id: contact_channel_id, delivery_address: delivery_address, name: name)
        update_contact_channel(input)
      end

      def update_contact_channel(input : Types::UpdateContactChannelRequest) : Types::UpdateContactChannelResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTACT_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContactChannelResult, "UpdateContactChannel")
      end

      # Updates the information specified for an on-call rotation.

      def update_rotation(
        recurrence : Types::RecurrenceSettings,
        rotation_id : String,
        contact_ids : Array(String)? = nil,
        start_time : Time? = nil,
        time_zone_id : String? = nil
      ) : Types::UpdateRotationResult

        input = Types::UpdateRotationRequest.new(recurrence: recurrence, rotation_id: rotation_id, contact_ids: contact_ids, start_time: start_time, time_zone_id: time_zone_id)
        update_rotation(input)
      end

      def update_rotation(input : Types::UpdateRotationRequest) : Types::UpdateRotationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ROTATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRotationResult, "UpdateRotation")
      end
    end
  end
end
