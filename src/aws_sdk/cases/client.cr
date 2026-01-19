module AwsSdk
  module ConnectCases
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

      # Gets a batch of case rules. In the Amazon Connect admin website, case rules are known as case field
      # conditions . For more information about case field conditions, see Add case field conditions to a
      # case template .
      def batch_get_case_rule(
        case_rules : Array(Types::CaseRuleIdentifier),
        domain_id : String
      ) : Protocol::Request
        input = Types::BatchGetCaseRuleRequest.new(case_rules: case_rules, domain_id: domain_id)
        batch_get_case_rule(input)
      end
      def batch_get_case_rule(input : Types::BatchGetCaseRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CASE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the description for the list of fields in the request parameters.
      def batch_get_field(
        domain_id : String,
        fields : Array(Types::FieldIdentifier)
      ) : Protocol::Request
        input = Types::BatchGetFieldRequest.new(domain_id: domain_id, fields: fields)
        batch_get_field(input)
      end
      def batch_get_field(input : Types::BatchGetFieldRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_FIELD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and updates a set of field options for a single select field in a Cases domain.
      def batch_put_field_options(
        domain_id : String,
        field_id : String,
        options : Array(Types::FieldOption)
      ) : Protocol::Request
        input = Types::BatchPutFieldOptionsRequest.new(domain_id: domain_id, field_id: field_id, options: options)
        batch_put_field_options(input)
      end
      def batch_put_field_options(input : Types::BatchPutFieldOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_FIELD_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # If you provide a value for PerformedBy.UserArn you must also have connect:DescribeUser permission on
      # the User ARN resource that you provide Creates a case in the specified Cases domain. Case system and
      # custom fields are taken as an array id/value pairs with a declared data types. The following fields
      # are required when creating a case: customer_id - You must provide the full customer profile ARN in
      # this format: arn:aws:profile:your_AWS_Region:your_AWS_account
      # ID:domains/your_profiles_domain_name/profiles/profile_ID title
      def create_case(
        domain_id : String,
        fields : Array(Types::FieldValue),
        template_id : String,
        client_token : String? = nil,
        performed_by : Types::UserUnion? = nil
      ) : Protocol::Request
        input = Types::CreateCaseRequest.new(domain_id: domain_id, fields: fields, template_id: template_id, client_token: client_token, performed_by: performed_by)
        create_case(input)
      end
      def create_case(input : Types::CreateCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new case rule. In the Amazon Connect admin website, case rules are known as case field
      # conditions . For more information about case field conditions, see Add case field conditions to a
      # case template .
      def create_case_rule(
        domain_id : String,
        name : String,
        rule : Types::CaseRuleDetails,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateCaseRuleRequest.new(domain_id: domain_id, name: name, rule: rule, description: description)
        create_case_rule(input)
      end
      def create_case_rule(input : Types::CreateCaseRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CASE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain, which is a container for all case data, such as cases, fields, templates and
      # layouts. Each Amazon Connect instance can be associated with only one Cases domain. This will not
      # associate your connect instance to Cases domain. Instead, use the Amazon Connect
      # CreateIntegrationAssociation API. You need specific IAM permissions to successfully associate the
      # Cases domain. For more information, see Onboard to Cases .
      def create_domain(
        name : String
      ) : Protocol::Request
        input = Types::CreateDomainRequest.new(name: name)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a field in the Cases domain. This field is used to define the case object model (that is,
      # defines what data can be captured on cases) in a Cases domain.
      def create_field(
        domain_id : String,
        name : String,
        type : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateFieldRequest.new(domain_id: domain_id, name: name, type: type, description: description)
        create_field(input)
      end
      def create_field(input : Types::CreateFieldRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FIELD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a layout in the Cases domain. Layouts define the following configuration in the top section
      # and More Info tab of the Cases user interface: Fields to display to the users Field ordering Title
      # and Status fields cannot be part of layouts since they are not configurable.
      def create_layout(
        content : Types::LayoutContent,
        domain_id : String,
        name : String
      ) : Protocol::Request
        input = Types::CreateLayoutRequest.new(content: content, domain_id: domain_id, name: name)
        create_layout(input)
      end
      def create_layout(input : Types::CreateLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a related item (comments, tasks, and contacts) and associates it with a case. There's a
      # quota for the number of fields allowed in a Custom type related item. See Amazon Connect Cases
      # quotas . Use cases Following are examples of related items that you may want to associate with a
      # case: Related contacts, such as calls, chats, emails tasks Comments, for agent notes SLAs, to
      # capture target resolution goals Cases, to capture related Amazon Connect Cases Files, such as policy
      # documentation or customer-provided attachments Custom related items, which provide flexibility for
      # you to define related items that such as bookings, orders, products, notices, and more Important
      # things to know If you are associating a contact to a case by passing in Contact for a type , you
      # must have DescribeContact permission on the ARN of the contact that you provide in
      # content.contact.contactArn . A Related Item is a resource that is associated with a case. It may or
      # may not have an external identifier linking it to an external resource (for example, a contactArn ).
      # All Related Items have their own internal identifier, the relatedItemArn . Examples of related items
      # include comments and contacts . If you provide a value for performedBy.userArn you must also have
      # DescribeUser permission on the ARN of the user that you provide. The type field is reserved for
      # internal use only. Endpoints : See Amazon Connect endpoints and quotas .
      def create_related_item(
        case_id : String,
        content : Types::RelatedItemInputContent,
        domain_id : String,
        type : String,
        performed_by : Types::UserUnion? = nil
      ) : Protocol::Request
        input = Types::CreateRelatedItemRequest.new(case_id: case_id, content: content, domain_id: domain_id, type: type, performed_by: performed_by)
        create_related_item(input)
      end
      def create_related_item(input : Types::CreateRelatedItemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RELATED_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a template in the Cases domain. This template is used to define the case object model (that
      # is, to define what data can be captured on cases) in a Cases domain. A template must have a unique
      # name within a domain, and it must reference existing field IDs and layout IDs. Additionally,
      # multiple fields with same IDs are not allowed within the same Template. A template can be either
      # Active or Inactive, as indicated by its status. Inactive templates cannot be used to create cases.
      # Other template APIs are: DeleteTemplate GetTemplate ListTemplates UpdateTemplate
      def create_template(
        domain_id : String,
        name : String,
        description : String? = nil,
        layout_configuration : Types::LayoutConfiguration? = nil,
        required_fields : Array(Types::RequiredField)? = nil,
        rules : Array(Types::TemplateRule)? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::CreateTemplateRequest.new(domain_id: domain_id, name: name, description: description, layout_configuration: layout_configuration, required_fields: required_fields, rules: rules, status: status)
        create_template(input)
      end
      def create_template(input : Types::CreateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The DeleteCase API permanently deletes a case and all its associated resources from the cases data
      # store. After a successful deletion, you cannot: Retrieve related items Access audit history Perform
      # any operations that require the CaseID This action is irreversible. After you delete a case, you
      # cannot recover its data.
      def delete_case(
        case_id : String,
        domain_id : String
      ) : Protocol::Request
        input = Types::DeleteCaseRequest.new(case_id: case_id, domain_id: domain_id)
        delete_case(input)
      end
      def delete_case(input : Types::DeleteCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a case rule. In the Amazon Connect admin website, case rules are known as case field
      # conditions . For more information about case field conditions, see Add case field conditions to a
      # case template .
      def delete_case_rule(
        case_rule_id : String,
        domain_id : String
      ) : Protocol::Request
        input = Types::DeleteCaseRuleRequest.new(case_rule_id: case_rule_id, domain_id: domain_id)
        delete_case_rule(input)
      end
      def delete_case_rule(input : Types::DeleteCaseRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CASE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Cases domain. After deleting your domain you must disassociate the deleted domain from
      # your Amazon Connect instance with another API call before being able to use Cases again with this
      # Amazon Connect instance. See DeleteIntegrationAssociation .
      def delete_domain(
        domain_id : String
      ) : Protocol::Request
        input = Types::DeleteDomainRequest.new(domain_id: domain_id)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a field from a cases template. You can delete up to 100 fields per domain. After a field is
      # deleted: You can still retrieve the field by calling BatchGetField . You cannot update a deleted
      # field by calling UpdateField ; it throws a ValidationException . Deleted fields are not included in
      # the ListFields response. Calling CreateCase with a deleted field throws a ValidationException
      # denoting which field identifiers in the request have been deleted. Calling GetCase with a deleted
      # field identifier returns the deleted field's value if one exists. Calling UpdateCase with a deleted
      # field ID throws a ValidationException if the case does not already contain a value for the deleted
      # field. Otherwise it succeeds, allowing you to update or remove (using emptyValue: {} ) the field's
      # value from the case. GetTemplate does not return field IDs for deleted fields. GetLayout does not
      # return field IDs for deleted fields. Calling SearchCases with the deleted field ID as a filter
      # returns any cases that have a value for the deleted field that matches the filter criteria. Calling
      # SearchCases with a searchTerm value that matches a deleted field's value on a case returns the case
      # in the response. Calling BatchPutFieldOptions with a deleted field ID throw a ValidationException .
      # Calling GetCaseEventConfiguration does not return field IDs for deleted fields.
      def delete_field(
        domain_id : String,
        field_id : String
      ) : Protocol::Request
        input = Types::DeleteFieldRequest.new(domain_id: domain_id, field_id: field_id)
        delete_field(input)
      end
      def delete_field(input : Types::DeleteFieldRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FIELD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a layout from a cases template. You can delete up to 100 layouts per domain. After a layout
      # is deleted: You can still retrieve the layout by calling GetLayout . You cannot update a deleted
      # layout by calling UpdateLayout ; it throws a ValidationException . Deleted layouts are not included
      # in the ListLayouts response.
      def delete_layout(
        domain_id : String,
        layout_id : String
      ) : Protocol::Request
        input = Types::DeleteLayoutRequest.new(domain_id: domain_id, layout_id: layout_id)
        delete_layout(input)
      end
      def delete_layout(input : Types::DeleteLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the related item resource under a case. This API cannot be used on a FILE type related
      # attachment. To delete this type of file, use the DeleteAttachedFile API
      def delete_related_item(
        case_id : String,
        domain_id : String,
        related_item_id : String
      ) : Protocol::Request
        input = Types::DeleteRelatedItemRequest.new(case_id: case_id, domain_id: domain_id, related_item_id: related_item_id)
        delete_related_item(input)
      end
      def delete_related_item(input : Types::DeleteRelatedItemRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RELATED_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a cases template. You can delete up to 100 templates per domain. After a cases template is
      # deleted: You can still retrieve the template by calling GetTemplate . You cannot update the
      # template. You cannot create a case by using the deleted template. Deleted templates are not included
      # in the ListTemplates response.
      def delete_template(
        domain_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::DeleteTemplateRequest.new(domain_id: domain_id, template_id: template_id)
        delete_template(input)
      end
      def delete_template(input : Types::DeleteTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific case if it exists.
      def get_case(
        case_id : String,
        domain_id : String,
        fields : Array(Types::FieldIdentifier),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCaseRequest.new(case_id: case_id, domain_id: domain_id, fields: fields, next_token: next_token)
        get_case(input)
      end
      def get_case(input : Types::GetCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the audit history about a specific case if it exists.
      def get_case_audit_events(
        case_id : String,
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCaseAuditEventsRequest.new(case_id: case_id, domain_id: domain_id, max_results: max_results, next_token: next_token)
        get_case_audit_events(input)
      end
      def get_case_audit_events(input : Types::GetCaseAuditEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE_AUDIT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the case event publishing configuration.
      def get_case_event_configuration(
        domain_id : String
      ) : Protocol::Request
        input = Types::GetCaseEventConfigurationRequest.new(domain_id: domain_id)
        get_case_event_configuration(input)
      end
      def get_case_event_configuration(input : Types::GetCaseEventConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CASE_EVENT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific domain if it exists.
      def get_domain(
        domain_id : String
      ) : Protocol::Request
        input = Types::GetDomainRequest.new(domain_id: domain_id)
        get_domain(input)
      end
      def get_domain(input : Types::GetDomainRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details for the requested layout.
      def get_layout(
        domain_id : String,
        layout_id : String
      ) : Protocol::Request
        input = Types::GetLayoutRequest.new(domain_id: domain_id, layout_id: layout_id)
        get_layout(input)
      end
      def get_layout(input : Types::GetLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details for the requested template. Other template APIs are: CreateTemplate
      # DeleteTemplate ListTemplates UpdateTemplate
      def get_template(
        domain_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::GetTemplateRequest.new(domain_id: domain_id, template_id: template_id)
        get_template(input)
      end
      def get_template(input : Types::GetTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all case rules in a Cases domain. In the Amazon Connect admin website, case rules are known as
      # case field conditions . For more information about case field conditions, see Add case field
      # conditions to a case template .
      def list_case_rules(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCaseRulesRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_case_rules(input)
      end
      def list_case_rules(input : Types::ListCaseRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CASE_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists cases for a given contact.
      def list_cases_for_contact(
        contact_arn : String,
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCasesForContactRequest.new(contact_arn: contact_arn, domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_cases_for_contact(input)
      end
      def list_cases_for_contact(input : Types::ListCasesForContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CASES_FOR_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all cases domains in the Amazon Web Services account. Each list item is a condensed summary
      # object of the domain.
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

      # Lists all of the field options for a field identifier in the domain.
      def list_field_options(
        domain_id : String,
        field_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        values : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListFieldOptionsRequest.new(domain_id: domain_id, field_id: field_id, max_results: max_results, next_token: next_token, values: values)
        list_field_options(input)
      end
      def list_field_options(input : Types::ListFieldOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FIELD_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all fields in a Cases domain.
      def list_fields(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFieldsRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_fields(input)
      end
      def list_fields(input : Types::ListFieldsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FIELDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all layouts in the given cases domain. Each list item is a condensed summary object of the
      # layout.
      def list_layouts(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLayoutsRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token)
        list_layouts(input)
      end
      def list_layouts(input : Types::ListLayoutsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAYOUTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for a resource.
      def list_tags_for_resource(
        arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(arn: arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the templates in a Cases domain. Each list item is a condensed summary object of the
      # template. Other template APIs are: CreateTemplate DeleteTemplate GetTemplate UpdateTemplate
      def list_templates(
        domain_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListTemplatesRequest.new(domain_id: domain_id, max_results: max_results, next_token: next_token, status: status)
        list_templates(input)
      end
      def list_templates(input : Types::ListTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds case event publishing configuration. For a complete list of fields you can add to the event
      # message, see Create case fields in the Amazon Connect Administrator Guide
      def put_case_event_configuration(
        domain_id : String,
        event_bridge : Types::EventBridgeConfiguration
      ) : Protocol::Request
        input = Types::PutCaseEventConfigurationRequest.new(domain_id: domain_id, event_bridge: event_bridge)
        put_case_event_configuration(input)
      end
      def put_case_event_configuration(input : Types::PutCaseEventConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CASE_EVENT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for related items across all cases within a domain. This is a global search operation that
      # returns related items from multiple cases, unlike the case-specific SearchRelatedItems API. Use
      # cases Following are common uses cases for this API: Find cases with similar issues across the
      # domain. For example, search for all cases containing comments about "product defect" to identify
      # patterns and existing solutions. Locate all cases associated with specific contacts or orders. For
      # example, find all cases linked to a contactArn to understand the complete customer journey. Monitor
      # SLA compliance across cases. For example, search for all cases with "Active" SLA status to
      # prioritize remediation efforts. Important things to know This API returns case identifiers, not
      # complete case objects. To retrieve full case details, you must make additional calls to the GetCase
      # API for each returned case ID. This API searches across related items content, not case fields. Use
      # the SearchCases API to search within case field values. Endpoints : See Amazon Connect endpoints and
      # quotas .
      def search_all_related_items(
        domain_id : String,
        filters : Array(Types::RelatedItemTypeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sorts : Array(Types::SearchAllRelatedItemsSort)? = nil
      ) : Protocol::Request
        input = Types::SearchAllRelatedItemsRequest.new(domain_id: domain_id, filters: filters, max_results: max_results, next_token: next_token, sorts: sorts)
        search_all_related_items(input)
      end
      def search_all_related_items(input : Types::SearchAllRelatedItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ALL_RELATED_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for cases within their associated Cases domain. Search results are returned as a paginated
      # list of abridged case documents. For customer_id you must provide the full customer profile ARN in
      # this format: arn:aws:profile:your AWS Region:your AWS account ID:domains/profiles domain
      # name/profiles/profile ID .
      def search_cases(
        domain_id : String,
        fields : Array(Types::FieldIdentifier)? = nil,
        filter : Types::CaseFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_term : String? = nil,
        sorts : Array(Types::Sort)? = nil
      ) : Protocol::Request
        input = Types::SearchCasesRequest.new(domain_id: domain_id, fields: fields, filter: filter, max_results: max_results, next_token: next_token, search_term: search_term, sorts: sorts)
        search_cases(input)
      end
      def search_cases(input : Types::SearchCasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for related items that are associated with a case. If no filters are provided, this returns
      # all related items associated with a case.
      def search_related_items(
        case_id : String,
        domain_id : String,
        filters : Array(Types::RelatedItemTypeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchRelatedItemsRequest.new(case_id: case_id, domain_id: domain_id, filters: filters, max_results: max_results, next_token: next_token)
        search_related_items(input)
      end
      def search_related_items(input : Types::SearchRelatedItemsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RELATED_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a resource.
      def tag_resource(
        arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Untags a resource.
      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # If you provide a value for PerformedBy.UserArn you must also have connect:DescribeUser permission on
      # the User ARN resource that you provide Updates the values of fields on a case. Fields to be updated
      # are received as an array of id/value pairs identical to the CreateCase input . If the action is
      # successful, the service sends back an HTTP 200 response with an empty HTTP body.
      def update_case(
        case_id : String,
        domain_id : String,
        fields : Array(Types::FieldValue),
        performed_by : Types::UserUnion? = nil
      ) : Protocol::Request
        input = Types::UpdateCaseRequest.new(case_id: case_id, domain_id: domain_id, fields: fields, performed_by: performed_by)
        update_case(input)
      end
      def update_case(input : Types::UpdateCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a case rule. In the Amazon Connect admin website, case rules are known as case field
      # conditions . For more information about case field conditions, see Add case field conditions to a
      # case template .
      def update_case_rule(
        case_rule_id : String,
        domain_id : String,
        description : String? = nil,
        name : String? = nil,
        rule : Types::CaseRuleDetails? = nil
      ) : Protocol::Request
        input = Types::UpdateCaseRuleRequest.new(case_rule_id: case_rule_id, domain_id: domain_id, description: description, name: name, rule: rule)
        update_case_rule(input)
      end
      def update_case_rule(input : Types::UpdateCaseRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CASE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of an existing field.
      def update_field(
        domain_id : String,
        field_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFieldRequest.new(domain_id: domain_id, field_id: field_id, description: description, name: name)
        update_field(input)
      end
      def update_field(input : Types::UpdateFieldRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FIELD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the attributes of an existing layout. If the action is successful, the service sends back an
      # HTTP 200 response with an empty HTTP body. A ValidationException is returned when you add
      # non-existent fieldIds to a layout. Title and Status fields cannot be part of layouts because they
      # are not configurable.
      def update_layout(
        domain_id : String,
        layout_id : String,
        content : Types::LayoutContent? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLayoutRequest.new(domain_id: domain_id, layout_id: layout_id, content: content, name: name)
        update_layout(input)
      end
      def update_layout(input : Types::UpdateLayoutRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAYOUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the attributes of an existing template. The template attributes that can be modified include
      # name , description , layoutConfiguration , requiredFields , and status . At least one of these
      # attributes must not be null. If a null value is provided for a given attribute, that attribute is
      # ignored and its current value is preserved. Other template APIs are: CreateTemplate DeleteTemplate
      # GetTemplate ListTemplates
      def update_template(
        domain_id : String,
        template_id : String,
        description : String? = nil,
        layout_configuration : Types::LayoutConfiguration? = nil,
        name : String? = nil,
        required_fields : Array(Types::RequiredField)? = nil,
        rules : Array(Types::TemplateRule)? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplateRequest.new(domain_id: domain_id, template_id: template_id, description: description, layout_configuration: layout_configuration, name: name, required_fields: required_fields, rules: rules, status: status)
        update_template(input)
      end
      def update_template(input : Types::UpdateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
