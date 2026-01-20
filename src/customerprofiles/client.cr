module Aws
  module CustomerProfiles
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

      # Associates a new key value with a specific profile, such as a Contact Record ContactId. A profile
      # object can have a single unique key and any number of additional keys that can be used to identify
      # the profile that it belongs to.

      def add_profile_key(
        domain_name : String,
        key_name : String,
        profile_id : String,
        values : Array(String)
      ) : Protocol::Request
        input = Types::AddProfileKeyRequest.new(domain_name: domain_name, key_name: key_name, profile_id: profile_id, values: values)
        add_profile_key(input)
      end

      def add_profile_key(input : Types::AddProfileKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_PROFILE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetch the possible attribute values given the attribute name.

      def batch_get_calculated_attribute_for_profile(
        calculated_attribute_name : String,
        domain_name : String,
        profile_ids : Array(String),
        condition_overrides : Types::ConditionOverrides? = nil
      ) : Protocol::Request
        input = Types::BatchGetCalculatedAttributeForProfileRequest.new(calculated_attribute_name: calculated_attribute_name, domain_name: domain_name, profile_ids: profile_ids, condition_overrides: condition_overrides)
        batch_get_calculated_attribute_for_profile(input)
      end

      def batch_get_calculated_attribute_for_profile(input : Types::BatchGetCalculatedAttributeForProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CALCULATED_ATTRIBUTE_FOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a batch of profiles.

      def batch_get_profile(
        domain_name : String,
        profile_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetProfileRequest.new(domain_name: domain_name, profile_ids: profile_ids)
        batch_get_profile(input)
      end

      def batch_get_profile(input : Types::BatchGetProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new calculated attribute definition. After creation, new object data ingested into
      # Customer Profiles will be included in the calculated attribute, which can be retrieved for a profile
      # using the GetCalculatedAttributeForProfile API. Defining a calculated attribute makes it available
      # for all profiles within a domain. Each calculated attribute can only reference one ObjectType and at
      # most, two fields from that ObjectType .

      def create_calculated_attribute_definition(
        attribute_details : Types::AttributeDetails,
        calculated_attribute_name : String,
        domain_name : String,
        statistic : String,
        conditions : Types::Conditions? = nil,
        description : String? = nil,
        display_name : String? = nil,
        filter : Types::Filter? = nil,
        tags : Hash(String, String)? = nil,
        use_historical_data : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateCalculatedAttributeDefinitionRequest.new(attribute_details: attribute_details, calculated_attribute_name: calculated_attribute_name, domain_name: domain_name, statistic: statistic, conditions: conditions, description: description, display_name: display_name, filter: filter, tags: tags, use_historical_data: use_historical_data)
        create_calculated_attribute_definition(input)
      end

      def create_calculated_attribute_definition(input : Types::CreateCalculatedAttributeDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CALCULATED_ATTRIBUTE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain, which is a container for all customer data, such as customer profile attributes,
      # object types, profile keys, and encryption keys. You can create multiple domains, and each domain
      # can have multiple third-party integrations. Each Amazon Connect instance can be associated with only
      # one domain. Multiple Amazon Connect instances can be associated with one domain. Use this API or
      # UpdateDomain to enable identity resolution : set Matching to true. To prevent cross-service
      # impersonation when you call this API, see Cross-service confused deputy prevention for sample
      # policies that you should apply. It is not possible to associate a Customer Profiles domain with an
      # Amazon Connect Instance directly from the API. If you would like to create a domain and associate a
      # Customer Profiles domain, use the Amazon Connect admin website. For more information, see Enable
      # Customer Profiles . Each Amazon Connect instance can be associated with only one domain. Multiple
      # Amazon Connect instances can be associated with one domain.

      def create_domain(
        default_expiration_days : Int32,
        domain_name : String,
        data_store : Types::DataStoreRequest? = nil,
        dead_letter_queue_url : String? = nil,
        default_encryption_key : String? = nil,
        matching : Types::MatchingRequest? = nil,
        rule_based_matching : Types::RuleBasedMatchingRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainRequest.new(default_expiration_days: default_expiration_days, domain_name: domain_name, data_store: data_store, dead_letter_queue_url: dead_letter_queue_url, default_encryption_key: default_encryption_key, matching: matching, rule_based_matching: rule_based_matching, tags: tags)
        create_domain(input)
      end

      def create_domain(input : Types::CreateDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the layout to view data for a specific domain. This API can only be invoked from the Amazon
      # Connect admin website.

      def create_domain_layout(
        description : String,
        display_name : String,
        domain_name : String,
        layout : String,
        layout_definition_name : String,
        layout_type : String,
        is_default : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainLayoutRequest.new(description: description, display_name: display_name, domain_name: domain_name, layout: layout, layout_definition_name: layout_definition_name, layout_type: layout_type, is_default: is_default, tags: tags)
        create_domain_layout(input)
      end

      def create_domain_layout(input : Types::CreateDomainLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an event stream, which is a subscription to real-time events, such as when profiles are
      # created and updated through Amazon Connect Customer Profiles. Each event stream can be associated
      # with only one Kinesis Data Stream destination in the same region and Amazon Web Services account as
      # the customer profiles domain

      def create_event_stream(
        domain_name : String,
        event_stream_name : String,
        uri : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventStreamRequest.new(domain_name: domain_name, event_stream_name: event_stream_name, uri: uri, tags: tags)
        create_event_stream(input)
      end

      def create_event_stream(input : Types::CreateEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an event trigger, which specifies the rules when to perform action based on customer's
      # ingested data. Each event stream can be associated with only one integration in the same region and
      # AWS account as the event stream.

      def create_event_trigger(
        domain_name : String,
        event_trigger_conditions : Array(Types::EventTriggerCondition),
        event_trigger_name : String,
        object_type_name : String,
        description : String? = nil,
        event_trigger_limits : Types::EventTriggerLimits? = nil,
        segment_filter : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventTriggerRequest.new(domain_name: domain_name, event_trigger_conditions: event_trigger_conditions, event_trigger_name: event_trigger_name, object_type_name: object_type_name, description: description, event_trigger_limits: event_trigger_limits, segment_filter: segment_filter, tags: tags)
        create_event_trigger(input)
      end

      def create_event_trigger(input : Types::CreateEventTriggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_TRIGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an integration workflow. An integration workflow is an async process which ingests historic
      # data and sets up an integration for ongoing updates. The supported Amazon AppFlow sources are
      # Salesforce, ServiceNow, and Marketo.

      def create_integration_workflow(
        domain_name : String,
        integration_config : Types::IntegrationConfig,
        object_type_name : String,
        role_arn : String,
        workflow_type : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIntegrationWorkflowRequest.new(domain_name: domain_name, integration_config: integration_config, object_type_name: object_type_name, role_arn: role_arn, workflow_type: workflow_type, tags: tags)
        create_integration_workflow(input)
      end

      def create_integration_workflow(input : Types::CreateIntegrationWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTEGRATION_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a standard profile. A standard profile represents the following attributes for a customer
      # profile in a domain.

      def create_profile(
        domain_name : String,
        account_number : String? = nil,
        additional_information : String? = nil,
        address : Types::Address? = nil,
        attributes : Hash(String, String)? = nil,
        billing_address : Types::Address? = nil,
        birth_date : String? = nil,
        business_email_address : String? = nil,
        business_name : String? = nil,
        business_phone_number : String? = nil,
        email_address : String? = nil,
        engagement_preferences : Types::EngagementPreferences? = nil,
        first_name : String? = nil,
        gender : String? = nil,
        gender_string : String? = nil,
        home_phone_number : String? = nil,
        last_name : String? = nil,
        mailing_address : Types::Address? = nil,
        middle_name : String? = nil,
        mobile_phone_number : String? = nil,
        party_type : String? = nil,
        party_type_string : String? = nil,
        personal_email_address : String? = nil,
        phone_number : String? = nil,
        profile_type : String? = nil,
        shipping_address : Types::Address? = nil
      ) : Protocol::Request
        input = Types::CreateProfileRequest.new(domain_name: domain_name, account_number: account_number, additional_information: additional_information, address: address, attributes: attributes, billing_address: billing_address, birth_date: birth_date, business_email_address: business_email_address, business_name: business_name, business_phone_number: business_phone_number, email_address: email_address, engagement_preferences: engagement_preferences, first_name: first_name, gender: gender, gender_string: gender_string, home_phone_number: home_phone_number, last_name: last_name, mailing_address: mailing_address, middle_name: middle_name, mobile_phone_number: mobile_phone_number, party_type: party_type, party_type_string: party_type_string, personal_email_address: personal_email_address, phone_number: phone_number, profile_type: profile_type, shipping_address: shipping_address)
        create_profile(input)
      end

      def create_profile(input : Types::CreateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a recommender

      def create_recommender(
        domain_name : String,
        recommender_name : String,
        recommender_recipe_name : String,
        description : String? = nil,
        recommender_config : Types::RecommenderConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name, recommender_recipe_name: recommender_recipe_name, description: description, recommender_config: recommender_config, tags: tags)
        create_recommender(input)
      end

      def create_recommender(input : Types::CreateRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a segment definition associated to the given domain.

      def create_segment_definition(
        display_name : String,
        domain_name : String,
        segment_definition_name : String,
        description : String? = nil,
        segment_groups : Types::SegmentGroup? = nil,
        segment_sql_query : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSegmentDefinitionRequest.new(display_name: display_name, domain_name: domain_name, segment_definition_name: segment_definition_name, description: description, segment_groups: segment_groups, segment_sql_query: segment_sql_query, tags: tags)
        create_segment_definition(input)
      end

      def create_segment_definition(input : Types::CreateSegmentDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEGMENT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a segment estimate query.

      def create_segment_estimate(
        domain_name : String,
        segment_query : Types::SegmentGroupStructure? = nil,
        segment_sql_query : String? = nil
      ) : Protocol::Request
        input = Types::CreateSegmentEstimateRequest.new(domain_name: domain_name, segment_query: segment_query, segment_sql_query: segment_sql_query)
        create_segment_estimate(input)
      end

      def create_segment_estimate(input : Types::CreateSegmentEstimateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEGMENT_ESTIMATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Triggers a job to export a segment to a specified destination.

      def create_segment_snapshot(
        data_format : String,
        domain_name : String,
        segment_definition_name : String,
        destination_uri : String? = nil,
        encryption_key : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateSegmentSnapshotRequest.new(data_format: data_format, domain_name: domain_name, segment_definition_name: segment_definition_name, destination_uri: destination_uri, encryption_key: encryption_key, role_arn: role_arn)
        create_segment_snapshot(input)
      end

      def create_segment_snapshot(input : Types::CreateSegmentSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEGMENT_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Upload job to ingest data for segment imports. The metadata is created for the job with
      # the provided field mapping and unique key.

      def create_upload_job(
        display_name : String,
        domain_name : String,
        fields : Hash(String, Types::ObjectTypeField),
        unique_key : String,
        data_expiry : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateUploadJobRequest.new(display_name: display_name, domain_name: domain_name, fields: fields, unique_key: unique_key, data_expiry: data_expiry)
        create_upload_job(input)
      end

      def create_upload_job(input : Types::CreateUploadJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_UPLOAD_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing calculated attribute definition. Note that deleting a default calculated
      # attribute is possible, however once deleted, you will be unable to undo that action and will need to
      # recreate it on your own using the CreateCalculatedAttributeDefinition API if you want it back.

      def delete_calculated_attribute_definition(
        calculated_attribute_name : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteCalculatedAttributeDefinitionRequest.new(calculated_attribute_name: calculated_attribute_name, domain_name: domain_name)
        delete_calculated_attribute_definition(input)
      end

      def delete_calculated_attribute_definition(input : Types::DeleteCalculatedAttributeDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CALCULATED_ATTRIBUTE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specific domain and all of its customer data, such as customer profile attributes and
      # their related objects.

      def delete_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end

      def delete_domain(input : Types::DeleteDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the layout used to view data for a specific domain. This API can only be invoked from the
      # Amazon Connect admin website.

      def delete_domain_layout(
        domain_name : String,
        layout_definition_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainLayoutRequest.new(domain_name: domain_name, layout_definition_name: layout_definition_name)
        delete_domain_layout(input)
      end

      def delete_domain_layout(input : Types::DeleteDomainLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a DomainObjectType for the given Domain and ObjectType name.

      def delete_domain_object_type(
        domain_name : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainObjectTypeRequest.new(domain_name: domain_name, object_type_name: object_type_name)
        delete_domain_object_type(input)
      end

      def delete_domain_object_type(input : Types::DeleteDomainObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables and deletes the specified event stream.

      def delete_event_stream(
        domain_name : String,
        event_stream_name : String
      ) : Protocol::Request
        input = Types::DeleteEventStreamRequest.new(domain_name: domain_name, event_stream_name: event_stream_name)
        delete_event_stream(input)
      end

      def delete_event_stream(input : Types::DeleteEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disable and deletes the Event Trigger. You cannot delete an Event Trigger with an active Integration
      # associated.

      def delete_event_trigger(
        domain_name : String,
        event_trigger_name : String
      ) : Protocol::Request
        input = Types::DeleteEventTriggerRequest.new(domain_name: domain_name, event_trigger_name: event_trigger_name)
        delete_event_trigger(input)
      end

      def delete_event_trigger(input : Types::DeleteEventTriggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_TRIGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an integration from a specific domain.

      def delete_integration(
        domain_name : String,
        uri : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationRequest.new(domain_name: domain_name, uri: uri)
        delete_integration(input)
      end

      def delete_integration(input : Types::DeleteIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the standard customer profile and all data pertaining to the profile.

      def delete_profile(
        domain_name : String,
        profile_id : String
      ) : Protocol::Request
        input = Types::DeleteProfileRequest.new(domain_name: domain_name, profile_id: profile_id)
        delete_profile(input)
      end

      def delete_profile(input : Types::DeleteProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a searchable key from a customer profile.

      def delete_profile_key(
        domain_name : String,
        key_name : String,
        profile_id : String,
        values : Array(String)
      ) : Protocol::Request
        input = Types::DeleteProfileKeyRequest.new(domain_name: domain_name, key_name: key_name, profile_id: profile_id, values: values)
        delete_profile_key(input)
      end

      def delete_profile_key(input : Types::DeleteProfileKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an object associated with a profile of a given ProfileObjectType.

      def delete_profile_object(
        domain_name : String,
        object_type_name : String,
        profile_id : String,
        profile_object_unique_key : String
      ) : Protocol::Request
        input = Types::DeleteProfileObjectRequest.new(domain_name: domain_name, object_type_name: object_type_name, profile_id: profile_id, profile_object_unique_key: profile_object_unique_key)
        delete_profile_object(input)
      end

      def delete_profile_object(input : Types::DeleteProfileObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a ProfileObjectType from a specific domain as well as removes all the ProfileObjects of that
      # type. It also disables integrations from this specific ProfileObjectType. In addition, it scrubs all
      # of the fields of the standard profile that were populated from this ProfileObjectType.

      def delete_profile_object_type(
        domain_name : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::DeleteProfileObjectTypeRequest.new(domain_name: domain_name, object_type_name: object_type_name)
        delete_profile_object_type(input)
      end

      def delete_profile_object_type(input : Types::DeleteProfileObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a recommender.

      def delete_recommender(
        domain_name : String,
        recommender_name : String
      ) : Protocol::Request
        input = Types::DeleteRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name)
        delete_recommender(input)
      end

      def delete_recommender(input : Types::DeleteRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a segment definition from the domain.

      def delete_segment_definition(
        domain_name : String,
        segment_definition_name : String
      ) : Protocol::Request
        input = Types::DeleteSegmentDefinitionRequest.new(domain_name: domain_name, segment_definition_name: segment_definition_name)
        delete_segment_definition(input)
      end

      def delete_segment_definition(input : Types::DeleteSegmentDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SEGMENT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified workflow and all its corresponding resources. This is an async process.

      def delete_workflow(
        domain_name : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkflowRequest.new(domain_name: domain_name, workflow_id: workflow_id)
        delete_workflow(input)
      end

      def delete_workflow(input : Types::DeleteWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The process of detecting profile object type mapping by using given objects.

      def detect_profile_object_type(
        domain_name : String,
        objects : Array(String)
      ) : Protocol::Request
        input = Types::DetectProfileObjectTypeRequest.new(domain_name: domain_name, objects: objects)
        detect_profile_object_type(input)
      end

      def detect_profile_object_type(input : Types::DetectProfileObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETECT_PROFILE_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tests the auto-merging settings of your Identity Resolution Job without merging your data. It
      # randomly selects a sample of matching groups from the existing matching results, and applies the
      # automerging settings that you provided. You can then view the number of profiles in the sample, the
      # number of matches, and the number of profiles identified to be merged. This enables you to evaluate
      # the accuracy of the attributes in your matching list. You can't view which profiles are matched and
      # would be merged. We strongly recommend you use this API to do a dry run of the automerging process
      # before running the Identity Resolution Job. Include at least two matching attributes. If your
      # matching list includes too few attributes (such as only FirstName or only LastName ), there may be a
      # large number of matches. This increases the chances of erroneous merges.

      def get_auto_merging_preview(
        conflict_resolution : Types::ConflictResolution,
        consolidation : Types::Consolidation,
        domain_name : String,
        min_allowed_confidence_score_for_merging : Float64? = nil
      ) : Protocol::Request
        input = Types::GetAutoMergingPreviewRequest.new(conflict_resolution: conflict_resolution, consolidation: consolidation, domain_name: domain_name, min_allowed_confidence_score_for_merging: min_allowed_confidence_score_for_merging)
        get_auto_merging_preview(input)
      end

      def get_auto_merging_preview(input : Types::GetAutoMergingPreviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTO_MERGING_PREVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides more information on a calculated attribute definition for Customer Profiles.

      def get_calculated_attribute_definition(
        calculated_attribute_name : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::GetCalculatedAttributeDefinitionRequest.new(calculated_attribute_name: calculated_attribute_name, domain_name: domain_name)
        get_calculated_attribute_definition(input)
      end

      def get_calculated_attribute_definition(input : Types::GetCalculatedAttributeDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CALCULATED_ATTRIBUTE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a calculated attribute for a customer profile.

      def get_calculated_attribute_for_profile(
        calculated_attribute_name : String,
        domain_name : String,
        profile_id : String
      ) : Protocol::Request
        input = Types::GetCalculatedAttributeForProfileRequest.new(calculated_attribute_name: calculated_attribute_name, domain_name: domain_name, profile_id: profile_id)
        get_calculated_attribute_for_profile(input)
      end

      def get_calculated_attribute_for_profile(input : Types::GetCalculatedAttributeForProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CALCULATED_ATTRIBUTE_FOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific domain.

      def get_domain(
        domain_name : String
      ) : Protocol::Request
        input = Types::GetDomainRequest.new(domain_name: domain_name)
        get_domain(input)
      end

      def get_domain(input : Types::GetDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the layout to view data for a specific domain. This API can only be invoked from the Amazon
      # Connect admin website.

      def get_domain_layout(
        domain_name : String,
        layout_definition_name : String
      ) : Protocol::Request
        input = Types::GetDomainLayoutRequest.new(domain_name: domain_name, layout_definition_name: layout_definition_name)
        get_domain_layout(input)
      end

      def get_domain_layout(input : Types::GetDomainLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return a DomainObjectType for the input Domain and ObjectType names.

      def get_domain_object_type(
        domain_name : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::GetDomainObjectTypeRequest.new(domain_name: domain_name, object_type_name: object_type_name)
        get_domain_object_type(input)
      end

      def get_domain_object_type(input : Types::GetDomainObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified event stream in a specific domain.

      def get_event_stream(
        domain_name : String,
        event_stream_name : String
      ) : Protocol::Request
        input = Types::GetEventStreamRequest.new(domain_name: domain_name, event_stream_name: event_stream_name)
        get_event_stream(input)
      end

      def get_event_stream(input : Types::GetEventStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a specific Event Trigger from the domain.

      def get_event_trigger(
        domain_name : String,
        event_trigger_name : String
      ) : Protocol::Request
        input = Types::GetEventTriggerRequest.new(domain_name: domain_name, event_trigger_name: event_trigger_name)
        get_event_trigger(input)
      end

      def get_event_trigger(input : Types::GetEventTriggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_TRIGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an Identity Resolution Job in a specific domain. Identity Resolution Jobs
      # are set up using the Amazon Connect admin console. For more information, see Use Identity Resolution
      # to consolidate similar profiles .

      def get_identity_resolution_job(
        domain_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetIdentityResolutionJobRequest.new(domain_name: domain_name, job_id: job_id)
        get_identity_resolution_job(input)
      end

      def get_identity_resolution_job(input : Types::GetIdentityResolutionJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IDENTITY_RESOLUTION_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an integration for a domain.

      def get_integration(
        domain_name : String,
        uri : String
      ) : Protocol::Request
        input = Types::GetIntegrationRequest.new(domain_name: domain_name, uri: uri)
        get_integration(input)
      end

      def get_integration(input : Types::GetIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Before calling this API, use CreateDomain or UpdateDomain to enable identity resolution: set
      # Matching to true. GetMatches returns potentially matching profiles, based on the results of the
      # latest run of a machine learning process. The process of matching duplicate profiles. If Matching =
      # true , Amazon Connect Customer Profiles starts a weekly batch process called Identity Resolution
      # Job. If you do not specify a date and time for Identity Resolution Job to run, by default it runs
      # every Saturday at 12AM UTC to detect duplicate profiles in your domains. After the Identity
      # Resolution Job completes, use the GetMatches API to return and review the results. Or, if you have
      # configured ExportingConfig in the MatchingRequest , you can download the results from S3. Amazon
      # Connect uses the following profile attributes to identify matches: PhoneNumber HomePhoneNumber
      # BusinessPhoneNumber MobilePhoneNumber EmailAddress PersonalEmailAddress BusinessEmailAddress
      # FullName For example, two or more profiles—with spelling mistakes such as John Doe and Jhn Doe , or
      # different casing email addresses such as JOHN_DOE@ANYCOMPANY.COM and johndoe@anycompany.com , or
      # different phone number formats such as 555-010-0000 and +1-555-010-0000 —can be detected as
      # belonging to the same customer John Doe and merged into a unified profile.

      def get_matches(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetMatchesRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        get_matches(input)
      end

      def get_matches(input : Types::GetMatchesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MATCHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The GetObjectTypeAttributeValues API delivers statistical insights about attributes within a
      # specific object type, but is exclusively available for domains with data store enabled. This API
      # performs daily calculations to provide statistical information about your attribute values, helping
      # you understand patterns and trends in your data. The statistical calculations are performed once per
      # day, providing a consistent snapshot of your attribute data characteristics. You'll receive null
      # values in two scenarios: During the first period after enabling data vault (unless a calculation
      # cycle occurs, which happens once daily). For attributes that don't contain numeric values.

      def get_object_type_attribute_statistics(
        attribute_name : String,
        domain_name : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::GetObjectTypeAttributeStatisticsRequest.new(attribute_name: attribute_name, domain_name: domain_name, object_type_name: object_type_name)
        get_object_type_attribute_statistics(input)
      end

      def get_object_type_attribute_statistics(input : Types::GetObjectTypeAttributeStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OBJECT_TYPE_ATTRIBUTE_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a history record for a specific profile, for a specific domain.

      def get_profile_history_record(
        domain_name : String,
        id : String,
        profile_id : String
      ) : Protocol::Request
        input = Types::GetProfileHistoryRecordRequest.new(domain_name: domain_name, id: id, profile_id: profile_id)
        get_profile_history_record(input)
      end

      def get_profile_history_record(input : Types::GetProfileHistoryRecordRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_HISTORY_RECORD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the object types for a specific domain.

      def get_profile_object_type(
        domain_name : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::GetProfileObjectTypeRequest.new(domain_name: domain_name, object_type_name: object_type_name)
        get_profile_object_type(input)
      end

      def get_profile_object_type(input : Types::GetProfileObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the template information for a specific object type. A template is a predefined
      # ProfileObjectType, such as “Salesforce-Account” or “Salesforce-Contact.” When a user sends a
      # ProfileObject, using the PutProfileObject API, with an ObjectTypeName that matches one of the
      # TemplateIds, it uses the mappings from the template.

      def get_profile_object_type_template(
        template_id : String
      ) : Protocol::Request
        input = Types::GetProfileObjectTypeTemplateRequest.new(template_id: template_id)
        get_profile_object_type_template(input)
      end

      def get_profile_object_type_template(input : Types::GetProfileObjectTypeTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_OBJECT_TYPE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetches the recommendations for a profile in the input Customer Profiles domain. Fetches all the
      # profile recommendations

      def get_profile_recommendations(
        domain_name : String,
        profile_id : String,
        recommender_name : String,
        context : Hash(String, String)? = nil,
        max_results : Int32? = nil
      ) : Protocol::Request
        input = Types::GetProfileRecommendationsRequest.new(domain_name: domain_name, profile_id: profile_id, recommender_name: recommender_name, context: context, max_results: max_results)
        get_profile_recommendations(input)
      end

      def get_profile_recommendations(input : Types::GetProfileRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a recommender.

      def get_recommender(
        domain_name : String,
        recommender_name : String,
        training_metrics_count : Int32? = nil
      ) : Protocol::Request
        input = Types::GetRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name, training_metrics_count: training_metrics_count)
        get_recommender(input)
      end

      def get_recommender(input : Types::GetRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a segment definition from the domain.

      def get_segment_definition(
        domain_name : String,
        segment_definition_name : String
      ) : Protocol::Request
        input = Types::GetSegmentDefinitionRequest.new(domain_name: domain_name, segment_definition_name: segment_definition_name)
        get_segment_definition(input)
      end

      def get_segment_definition(input : Types::GetSegmentDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the result of a segment estimate query.

      def get_segment_estimate(
        domain_name : String,
        estimate_id : String
      ) : Protocol::Request
        input = Types::GetSegmentEstimateRequest.new(domain_name: domain_name, estimate_id: estimate_id)
        get_segment_estimate(input)
      end

      def get_segment_estimate(input : Types::GetSegmentEstimateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_ESTIMATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Determines if the given profiles are within a segment.

      def get_segment_membership(
        domain_name : String,
        profile_ids : Array(String),
        segment_definition_name : String
      ) : Protocol::Request
        input = Types::GetSegmentMembershipRequest.new(domain_name: domain_name, profile_ids: profile_ids, segment_definition_name: segment_definition_name)
        get_segment_membership(input)
      end

      def get_segment_membership(input : Types::GetSegmentMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the latest status of a segment snapshot.

      def get_segment_snapshot(
        domain_name : String,
        segment_definition_name : String,
        snapshot_id : String
      ) : Protocol::Request
        input = Types::GetSegmentSnapshotRequest.new(domain_name: domain_name, segment_definition_name: segment_definition_name, snapshot_id: snapshot_id)
        get_segment_snapshot(input)
      end

      def get_segment_snapshot(input : Types::GetSegmentSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a set of profiles that belong to the same matching group using the matchId or profileId .
      # You can also specify the type of matching that you want for finding similar profiles using either
      # RULE_BASED_MATCHING or ML_BASED_MATCHING .

      def get_similar_profiles(
        domain_name : String,
        match_type : String,
        search_key : String,
        search_value : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSimilarProfilesRequest.new(domain_name: domain_name, match_type: match_type, search_key: search_key, search_value: search_value, max_results: max_results, next_token: next_token)
        get_similar_profiles(input)
      end

      def get_similar_profiles(input : Types::GetSimilarProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIMILAR_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API retrieves the details of a specific upload job.

      def get_upload_job(
        domain_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetUploadJobRequest.new(domain_name: domain_name, job_id: job_id)
        get_upload_job(input)
      end

      def get_upload_job(input : Types::GetUploadJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_UPLOAD_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API retrieves the pre-signed URL and client token for uploading the file associated with the
      # upload job.

      def get_upload_job_path(
        domain_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetUploadJobPathRequest.new(domain_name: domain_name, job_id: job_id)
        get_upload_job_path(input)
      end

      def get_upload_job_path(input : Types::GetUploadJobPathRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_UPLOAD_JOB_PATH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get details of specified workflow.

      def get_workflow(
        domain_name : String,
        workflow_id : String
      ) : Protocol::Request
        input = Types::GetWorkflowRequest.new(domain_name: domain_name, workflow_id: workflow_id)
        get_workflow(input)
      end

      def get_workflow(input : Types::GetWorkflowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get granular list of steps in workflow.

      def get_workflow_steps(
        domain_name : String,
        workflow_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetWorkflowStepsRequest.new(domain_name: domain_name, workflow_id: workflow_id, max_results: max_results, next_token: next_token)
        get_workflow_steps(input)
      end

      def get_workflow_steps(input : Types::GetWorkflowStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKFLOW_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the integrations associated to a specific URI in the AWS account.

      def list_account_integrations(
        uri : String,
        include_hidden : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountIntegrationsRequest.new(uri: uri, include_hidden: include_hidden, max_results: max_results, next_token: next_token)
        list_account_integrations(input)
      end

      def list_account_integrations(input : Types::ListAccountIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists calculated attribute definitions for Customer Profiles

      def list_calculated_attribute_definitions(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCalculatedAttributeDefinitionsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_calculated_attribute_definitions(input)
      end

      def list_calculated_attribute_definitions(input : Types::ListCalculatedAttributeDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CALCULATED_ATTRIBUTE_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of calculated attributes for a customer profile.

      def list_calculated_attributes_for_profile(
        domain_name : String,
        profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCalculatedAttributesForProfileRequest.new(domain_name: domain_name, profile_id: profile_id, max_results: max_results, next_token: next_token)
        list_calculated_attributes_for_profile(input)
      end

      def list_calculated_attributes_for_profile(input : Types::ListCalculatedAttributesForProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CALCULATED_ATTRIBUTES_FOR_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the existing layouts that can be used to view data for a specific domain. This API can only be
      # invoked from the Amazon Connect admin website.

      def list_domain_layouts(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainLayoutsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_domain_layouts(input)
      end

      def list_domain_layouts(input : Types::ListDomainLayoutsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_LAYOUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all DomainObjectType(s) in a Customer Profiles domain.

      def list_domain_object_types(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainObjectTypesRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_domain_object_types(input)
      end

      def list_domain_object_types(input : Types::ListDomainObjectTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_OBJECT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the domains for an AWS account that have been created.

      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_domains(input)
      end

      def list_domains(input : Types::ListDomainsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the event streams in a specific domain.

      def list_event_streams(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventStreamsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_event_streams(input)
      end

      def list_event_streams(input : Types::ListEventStreamsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_STREAMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all Event Triggers under a domain.

      def list_event_triggers(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventTriggersRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_event_triggers(input)
      end

      def list_event_triggers(input : Types::ListEventTriggersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_TRIGGERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the Identity Resolution Jobs in your domain. The response sorts the list by
      # JobStartTime .

      def list_identity_resolution_jobs(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityResolutionJobsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_identity_resolution_jobs(input)
      end

      def list_identity_resolution_jobs(input : Types::ListIdentityResolutionJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_RESOLUTION_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the integrations in your domain.

      def list_integrations(
        domain_name : String,
        include_hidden : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIntegrationsRequest.new(domain_name: domain_name, include_hidden: include_hidden, max_results: max_results, next_token: next_token)
        list_integrations(input)
      end

      def list_integrations(input : Types::ListIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The ListObjectTypeAttributeValues API provides access to the most recent distinct values for any
      # specified attribute, making it valuable for real-time data validation and consistency checks within
      # your object types. This API works across domain, supporting both custom and standard object types.
      # The API accepts the object type name, attribute name, and domain name as input parameters and
      # returns values up to the storage limit of approximately 350KB.

      def list_object_type_attribute_values(
        attribute_name : String,
        domain_name : String,
        object_type_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectTypeAttributeValuesRequest.new(attribute_name: attribute_name, domain_name: domain_name, object_type_name: object_type_name, max_results: max_results, next_token: next_token)
        list_object_type_attribute_values(input)
      end

      def list_object_type_attribute_values(input : Types::ListObjectTypeAttributeValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_TYPE_ATTRIBUTE_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetch the possible attribute values given the attribute name.

      def list_object_type_attributes(
        domain_name : String,
        object_type_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectTypeAttributesRequest.new(domain_name: domain_name, object_type_name: object_type_name, max_results: max_results, next_token: next_token)
        list_object_type_attributes(input)
      end

      def list_object_type_attributes(input : Types::ListObjectTypeAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_TYPE_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Fetch the possible attribute values given the attribute name.

      def list_profile_attribute_values(
        attribute_name : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::ProfileAttributeValuesRequest.new(attribute_name: attribute_name, domain_name: domain_name)
        list_profile_attribute_values(input)
      end

      def list_profile_attribute_values(input : Types::ProfileAttributeValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_ATTRIBUTE_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of history records for a specific profile, for a specific domain.

      def list_profile_history_records(
        domain_name : String,
        profile_id : String,
        action_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        object_type_name : String? = nil,
        performed_by : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileHistoryRecordsRequest.new(domain_name: domain_name, profile_id: profile_id, action_type: action_type, max_results: max_results, next_token: next_token, object_type_name: object_type_name, performed_by: performed_by)
        list_profile_history_records(input)
      end

      def list_profile_history_records(input : Types::ListProfileHistoryRecordsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_HISTORY_RECORDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the template information for object types.

      def list_profile_object_type_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileObjectTypeTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_profile_object_type_templates(input)
      end

      def list_profile_object_type_templates(input : Types::ListProfileObjectTypeTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_OBJECT_TYPE_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the templates available within the service.

      def list_profile_object_types(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileObjectTypesRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_profile_object_types(input)
      end

      def list_profile_object_types(input : Types::ListProfileObjectTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_OBJECT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of objects associated with a profile of a given ProfileObjectType.

      def list_profile_objects(
        domain_name : String,
        object_type_name : String,
        profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        object_filter : Types::ObjectFilter? = nil
      ) : Protocol::Request
        input = Types::ListProfileObjectsRequest.new(domain_name: domain_name, object_type_name: object_type_name, profile_id: profile_id, max_results: max_results, next_token: next_token, object_filter: object_filter)
        list_profile_objects(input)
      end

      def list_profile_objects(input : Types::ListProfileObjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_OBJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of available recommender recipes that can be used to create recommenders.

      def list_recommender_recipes(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommenderRecipesRequest.new(max_results: max_results, next_token: next_token)
        list_recommender_recipes(input)
      end

      def list_recommender_recipes(input : Types::ListRecommenderRecipesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDER_RECIPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of recommenders in the specified domain.

      def list_recommenders(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendersRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_recommenders(input)
      end

      def list_recommenders(input : Types::ListRecommendersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a set of MatchIds that belong to the given domain.

      def list_rule_based_matches(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRuleBasedMatchesRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_rule_based_matches(input)
      end

      def list_rule_based_matches(input : Types::ListRuleBasedMatchesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULE_BASED_MATCHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all segment definitions under a domain.

      def list_segment_definitions(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSegmentDefinitionsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_segment_definitions(input)
      end

      def list_segment_definitions(input : Types::ListSegmentDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEGMENT_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with an Amazon Connect Customer Profiles resource. In Connect Customer
      # Profiles, domains, profile object types, and integrations can be tagged.

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

      # This API retrieves a list of upload jobs for the specified domain.

      def list_upload_jobs(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUploadJobsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        list_upload_jobs(input)
      end

      def list_upload_jobs(input : Types::ListUploadJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_UPLOAD_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Query to list all workflows.

      def list_workflows(
        domain_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        query_end_date : Time? = nil,
        query_start_date : Time? = nil,
        status : String? = nil,
        workflow_type : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkflowsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token, query_end_date: query_end_date, query_start_date: query_start_date, status: status, workflow_type: workflow_type)
        list_workflows(input)
      end

      def list_workflows(input : Types::ListWorkflowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKFLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Runs an AWS Lambda job that does the following: All the profileKeys in the ProfileToBeMerged will be
      # moved to the main profile. All the objects in the ProfileToBeMerged will be moved to the main
      # profile. All the ProfileToBeMerged will be deleted at the end. All the profileKeys in the
      # ProfileIdsToBeMerged will be moved to the main profile. Standard fields are merged as follows:
      # Fields are always "union"-ed if there are no conflicts in standard fields or attributeKeys. When
      # there are conflicting fields: If no SourceProfileIds entry is specified, the main Profile value is
      # always taken. If a SourceProfileIds entry is specified, the specified profileId is always taken,
      # even if it is a NULL value. You can use MergeProfiles together with GetMatches , which returns
      # potentially matching profiles, or use it with the results of another matching system. After profiles
      # have been merged, they cannot be separated (unmerged).

      def merge_profiles(
        domain_name : String,
        main_profile_id : String,
        profile_ids_to_be_merged : Array(String),
        field_source_profile_ids : Types::FieldSourceProfileIds? = nil
      ) : Protocol::Request
        input = Types::MergeProfilesRequest.new(domain_name: domain_name, main_profile_id: main_profile_id, profile_ids_to_be_merged: profile_ids_to_be_merged, field_source_profile_ids: field_source_profile_ids)
        merge_profiles(input)
      end

      def merge_profiles(input : Types::MergeProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MERGE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create/Update a DomainObjectType in a Customer Profiles domain. To create a new DomainObjectType,
      # Data Store needs to be enabled on the Domain.

      def put_domain_object_type(
        domain_name : String,
        fields : Hash(String, Types::DomainObjectTypeField),
        object_type_name : String,
        description : String? = nil,
        encryption_key : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PutDomainObjectTypeRequest.new(domain_name: domain_name, fields: fields, object_type_name: object_type_name, description: description, encryption_key: encryption_key, tags: tags)
        put_domain_object_type(input)
      end

      def put_domain_object_type(input : Types::PutDomainObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DOMAIN_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an integration between the service and a third-party service, which includes Amazon AppFlow and
      # Amazon Connect. An integration can belong to only one domain. To add or remove tags on an existing
      # Integration, see TagResource / UntagResource .

      def put_integration(
        domain_name : String,
        event_trigger_names : Array(String)? = nil,
        flow_definition : Types::FlowDefinition? = nil,
        object_type_name : String? = nil,
        object_type_names : Hash(String, String)? = nil,
        role_arn : String? = nil,
        scope : String? = nil,
        tags : Hash(String, String)? = nil,
        uri : String? = nil
      ) : Protocol::Request
        input = Types::PutIntegrationRequest.new(domain_name: domain_name, event_trigger_names: event_trigger_names, flow_definition: flow_definition, object_type_name: object_type_name, object_type_names: object_type_names, role_arn: role_arn, scope: scope, tags: tags, uri: uri)
        put_integration(input)
      end

      def put_integration(input : Types::PutIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds additional objects to customer profiles of a given ObjectType. When adding a specific profile
      # object, like a Contact Record, an inferred profile can get created if it is not mapped to an
      # existing profile. The resulting profile will only have a phone number populated in the standard
      # ProfileObject. Any additional Contact Records with the same phone number will be mapped to the same
      # inferred profile. When a ProfileObject is created and if a ProfileObjectType already exists for the
      # ProfileObject, it will provide data to a standard profile depending on the ProfileObjectType
      # definition. PutProfileObject needs an ObjectType, which can be created using PutProfileObjectType.

      def put_profile_object(
        domain_name : String,
        object : String,
        object_type_name : String
      ) : Protocol::Request
        input = Types::PutProfileObjectRequest.new(domain_name: domain_name, object: object, object_type_name: object_type_name)
        put_profile_object(input)
      end

      def put_profile_object(input : Types::PutProfileObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PROFILE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines a ProfileObjectType. To add or remove tags on an existing ObjectType, see TagResource /
      # UntagResource .

      def put_profile_object_type(
        description : String,
        domain_name : String,
        object_type_name : String,
        allow_profile_creation : Bool? = nil,
        encryption_key : String? = nil,
        expiration_days : Int32? = nil,
        fields : Hash(String, Types::ObjectTypeField)? = nil,
        keys : Hash(String, Array(Types::ObjectTypeKey))? = nil,
        max_profile_object_count : Int32? = nil,
        source_last_updated_timestamp_format : String? = nil,
        tags : Hash(String, String)? = nil,
        template_id : String? = nil
      ) : Protocol::Request
        input = Types::PutProfileObjectTypeRequest.new(description: description, domain_name: domain_name, object_type_name: object_type_name, allow_profile_creation: allow_profile_creation, encryption_key: encryption_key, expiration_days: expiration_days, fields: fields, keys: keys, max_profile_object_count: max_profile_object_count, source_last_updated_timestamp_format: source_last_updated_timestamp_format, tags: tags, template_id: template_id)
        put_profile_object_type(input)
      end

      def put_profile_object_type(input : Types::PutProfileObjectTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PROFILE_OBJECT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for profiles within a specific domain using one or more predefined search keys (e.g.,
      # _fullName, _phone, _email, _account, etc.) and/or custom-defined search keys. A search key is a data
      # type pair that consists of a KeyName and Values list. This operation supports searching for profiles
      # with a minimum of 1 key-value(s) pair and up to 5 key-value(s) pairs using either AND or OR logic.

      def search_profiles(
        domain_name : String,
        key_name : String,
        values : Array(String),
        additional_search_keys : Array(Types::AdditionalSearchKey)? = nil,
        logical_operator : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchProfilesRequest.new(domain_name: domain_name, key_name: key_name, values: values, additional_search_keys: additional_search_keys, logical_operator: logical_operator, max_results: max_results, next_token: next_token)
        search_profiles(input)
      end

      def search_profiles(input : Types::SearchProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a recommender that was previously stopped. Starting a recommender resumes its ability to
      # generate recommendations.

      def start_recommender(
        domain_name : String,
        recommender_name : String
      ) : Protocol::Request
        input = Types::StartRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name)
        start_recommender(input)
      end

      def start_recommender(input : Types::StartRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API starts the processing of an upload job to ingest profile data.

      def start_upload_job(
        domain_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::StartUploadJobRequest.new(domain_name: domain_name, job_id: job_id)
        start_upload_job(input)
      end

      def start_upload_job(input : Types::StartUploadJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_UPLOAD_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a recommender, suspending its ability to generate recommendations. The recommender can be
      # restarted later using StartRecommender.

      def stop_recommender(
        domain_name : String,
        recommender_name : String
      ) : Protocol::Request
        input = Types::StopRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name)
        stop_recommender(input)
      end

      def stop_recommender(input : Types::StopRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API stops the processing of an upload job.

      def stop_upload_job(
        domain_name : String,
        job_id : String
      ) : Protocol::Request
        input = Types::StopUploadJobRequest.new(domain_name: domain_name, job_id: job_id)
        stop_upload_job(input)
      end

      def stop_upload_job(input : Types::StopUploadJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_UPLOAD_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified Amazon Connect Customer Profiles
      # resource. Tags can help you organize and categorize your resources. You can also use them to scope
      # user permissions by granting a user permission to access or change only resources with certain tag
      # values. In Connect Customer Profiles, domains, profile object types, and integrations can be tagged.
      # Tags don't have any semantic meaning to AWS and are interpreted strictly as strings of characters.
      # You can use the TagResource action with a resource that already has tags. If you specify a new tag
      # key, this tag is appended to the list of tags associated with the resource. If you specify a tag key
      # that is already associated with the resource, the new tag value that you specify replaces the
      # previous value for that tag. You can associate as many as 50 tags with a resource.

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

      # Removes one or more tags from the specified Amazon Connect Customer Profiles resource. In Connect
      # Customer Profiles, domains, profile object types, and integrations can be tagged.

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

      # Updates an existing calculated attribute definition. When updating the Conditions, note that
      # increasing the date range of a calculated attribute will not trigger inclusion of historical data
      # greater than the current date range.

      def update_calculated_attribute_definition(
        calculated_attribute_name : String,
        domain_name : String,
        conditions : Types::Conditions? = nil,
        description : String? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCalculatedAttributeDefinitionRequest.new(calculated_attribute_name: calculated_attribute_name, domain_name: domain_name, conditions: conditions, description: description, display_name: display_name)
        update_calculated_attribute_definition(input)
      end

      def update_calculated_attribute_definition(input : Types::UpdateCalculatedAttributeDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CALCULATED_ATTRIBUTE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of a domain, including creating or selecting a dead letter queue or an
      # encryption key. After a domain is created, the name can’t be changed. Use this API or CreateDomain
      # to enable identity resolution : set Matching to true. To prevent cross-service impersonation when
      # you call this API, see Cross-service confused deputy prevention for sample policies that you should
      # apply. To add or remove tags on an existing Domain, see TagResource / UntagResource .

      def update_domain(
        domain_name : String,
        data_store : Types::DataStoreRequest? = nil,
        dead_letter_queue_url : String? = nil,
        default_encryption_key : String? = nil,
        default_expiration_days : Int32? = nil,
        matching : Types::MatchingRequest? = nil,
        rule_based_matching : Types::RuleBasedMatchingRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainRequest.new(domain_name: domain_name, data_store: data_store, dead_letter_queue_url: dead_letter_queue_url, default_encryption_key: default_encryption_key, default_expiration_days: default_expiration_days, matching: matching, rule_based_matching: rule_based_matching, tags: tags)
        update_domain(input)
      end

      def update_domain(input : Types::UpdateDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the layout used to view data for a specific domain. This API can only be invoked from the
      # Amazon Connect admin website.

      def update_domain_layout(
        domain_name : String,
        layout_definition_name : String,
        description : String? = nil,
        display_name : String? = nil,
        is_default : Bool? = nil,
        layout : String? = nil,
        layout_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainLayoutRequest.new(domain_name: domain_name, layout_definition_name: layout_definition_name, description: description, display_name: display_name, is_default: is_default, layout: layout, layout_type: layout_type)
        update_domain_layout(input)
      end

      def update_domain_layout(input : Types::UpdateDomainLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the properties of an Event Trigger.

      def update_event_trigger(
        domain_name : String,
        event_trigger_name : String,
        description : String? = nil,
        event_trigger_conditions : Array(Types::EventTriggerCondition)? = nil,
        event_trigger_limits : Types::EventTriggerLimits? = nil,
        object_type_name : String? = nil,
        segment_filter : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEventTriggerRequest.new(domain_name: domain_name, event_trigger_name: event_trigger_name, description: description, event_trigger_conditions: event_trigger_conditions, event_trigger_limits: event_trigger_limits, object_type_name: object_type_name, segment_filter: segment_filter)
        update_event_trigger(input)
      end

      def update_event_trigger(input : Types::UpdateEventTriggerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_TRIGGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of a profile. The ProfileId is required for updating a customer profile. When
      # calling the UpdateProfile API, specifying an empty string value means that any existing value will
      # be removed. Not specifying a string value means that any value already there will be kept.

      def update_profile(
        domain_name : String,
        profile_id : String,
        account_number : String? = nil,
        additional_information : String? = nil,
        address : Types::UpdateAddress? = nil,
        attributes : Hash(String, String)? = nil,
        billing_address : Types::UpdateAddress? = nil,
        birth_date : String? = nil,
        business_email_address : String? = nil,
        business_name : String? = nil,
        business_phone_number : String? = nil,
        email_address : String? = nil,
        engagement_preferences : Types::EngagementPreferences? = nil,
        first_name : String? = nil,
        gender : String? = nil,
        gender_string : String? = nil,
        home_phone_number : String? = nil,
        last_name : String? = nil,
        mailing_address : Types::UpdateAddress? = nil,
        middle_name : String? = nil,
        mobile_phone_number : String? = nil,
        party_type : String? = nil,
        party_type_string : String? = nil,
        personal_email_address : String? = nil,
        phone_number : String? = nil,
        profile_type : String? = nil,
        shipping_address : Types::UpdateAddress? = nil
      ) : Protocol::Request
        input = Types::UpdateProfileRequest.new(domain_name: domain_name, profile_id: profile_id, account_number: account_number, additional_information: additional_information, address: address, attributes: attributes, billing_address: billing_address, birth_date: birth_date, business_email_address: business_email_address, business_name: business_name, business_phone_number: business_phone_number, email_address: email_address, engagement_preferences: engagement_preferences, first_name: first_name, gender: gender, gender_string: gender_string, home_phone_number: home_phone_number, last_name: last_name, mailing_address: mailing_address, middle_name: middle_name, mobile_phone_number: mobile_phone_number, party_type: party_type, party_type_string: party_type_string, personal_email_address: personal_email_address, phone_number: phone_number, profile_type: profile_type, shipping_address: shipping_address)
        update_profile(input)
      end

      def update_profile(input : Types::UpdateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing recommender, allowing you to modify its configuration and
      # description.

      def update_recommender(
        domain_name : String,
        recommender_name : String,
        description : String? = nil,
        recommender_config : Types::RecommenderConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateRecommenderRequest.new(domain_name: domain_name, recommender_name: recommender_name, description: description, recommender_config: recommender_config)
        update_recommender(input)
      end

      def update_recommender(input : Types::UpdateRecommenderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RECOMMENDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
