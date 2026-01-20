module Aws
  module CloudSearch
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

      # Indexes the search suggestions. For more information, see Configuring Suggesters in the Amazon
      # CloudSearch Developer Guide .

      def build_suggesters(
        domain_name : String
      ) : Types::BuildSuggestersResponse

        input = Types::BuildSuggestersRequest.new(domain_name: domain_name)
        build_suggesters(input)
      end

      def build_suggesters(input : Types::BuildSuggestersRequest) : Types::BuildSuggestersResponse
        request = Protocol::Query.build_request(Model::BUILD_SUGGESTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::BuildSuggestersResponse, "BuildSuggesters")
      end

      # Creates a new search domain. For more information, see Creating a Search Domain in the Amazon
      # CloudSearch Developer Guide .

      def create_domain(
        domain_name : String
      ) : Types::CreateDomainResponse

        input = Types::CreateDomainRequest.new(domain_name: domain_name)
        create_domain(input)
      end

      def create_domain(input : Types::CreateDomainRequest) : Types::CreateDomainResponse
        request = Protocol::Query.build_request(Model::CREATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateDomainResponse, "CreateDomain")
      end

      # Configures an analysis scheme that can be applied to a text or text-array field to define
      # language-specific text processing options. For more information, see Configuring Analysis Schemes in
      # the Amazon CloudSearch Developer Guide .

      def define_analysis_scheme(
        analysis_scheme : Types::AnalysisScheme,
        domain_name : String
      ) : Types::DefineAnalysisSchemeResponse

        input = Types::DefineAnalysisSchemeRequest.new(analysis_scheme: analysis_scheme, domain_name: domain_name)
        define_analysis_scheme(input)
      end

      def define_analysis_scheme(input : Types::DefineAnalysisSchemeRequest) : Types::DefineAnalysisSchemeResponse
        request = Protocol::Query.build_request(Model::DEFINE_ANALYSIS_SCHEME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DefineAnalysisSchemeResponse, "DefineAnalysisScheme")
      end

      # Configures an Expression for the search domain. Used to create new expressions and modify existing
      # ones. If the expression exists, the new configuration replaces the old one. For more information,
      # see Configuring Expressions in the Amazon CloudSearch Developer Guide .

      def define_expression(
        domain_name : String,
        expression : Types::Expression
      ) : Types::DefineExpressionResponse

        input = Types::DefineExpressionRequest.new(domain_name: domain_name, expression: expression)
        define_expression(input)
      end

      def define_expression(input : Types::DefineExpressionRequest) : Types::DefineExpressionResponse
        request = Protocol::Query.build_request(Model::DEFINE_EXPRESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DefineExpressionResponse, "DefineExpression")
      end

      # Configures an IndexField for the search domain. Used to create new fields and modify existing ones.
      # You must specify the name of the domain you are configuring and an index field configuration. The
      # index field configuration specifies a unique name, the index field type, and the options you want to
      # configure for the field. The options you can specify depend on the IndexFieldType . If the field
      # exists, the new configuration replaces the old one. For more information, see Configuring Index
      # Fields in the Amazon CloudSearch Developer Guide .

      def define_index_field(
        domain_name : String,
        index_field : Types::IndexField
      ) : Types::DefineIndexFieldResponse

        input = Types::DefineIndexFieldRequest.new(domain_name: domain_name, index_field: index_field)
        define_index_field(input)
      end

      def define_index_field(input : Types::DefineIndexFieldRequest) : Types::DefineIndexFieldResponse
        request = Protocol::Query.build_request(Model::DEFINE_INDEX_FIELD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DefineIndexFieldResponse, "DefineIndexField")
      end

      # Configures a suggester for a domain. A suggester enables you to display possible matches before
      # users finish typing their queries. When you configure a suggester, you must specify the name of the
      # text field you want to search for possible matches and a unique name for the suggester. For more
      # information, see Getting Search Suggestions in the Amazon CloudSearch Developer Guide .

      def define_suggester(
        domain_name : String,
        suggester : Types::Suggester
      ) : Types::DefineSuggesterResponse

        input = Types::DefineSuggesterRequest.new(domain_name: domain_name, suggester: suggester)
        define_suggester(input)
      end

      def define_suggester(input : Types::DefineSuggesterRequest) : Types::DefineSuggesterResponse
        request = Protocol::Query.build_request(Model::DEFINE_SUGGESTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DefineSuggesterResponse, "DefineSuggester")
      end

      # Deletes an analysis scheme. For more information, see Configuring Analysis Schemes in the Amazon
      # CloudSearch Developer Guide .

      def delete_analysis_scheme(
        analysis_scheme_name : String,
        domain_name : String
      ) : Types::DeleteAnalysisSchemeResponse

        input = Types::DeleteAnalysisSchemeRequest.new(analysis_scheme_name: analysis_scheme_name, domain_name: domain_name)
        delete_analysis_scheme(input)
      end

      def delete_analysis_scheme(input : Types::DeleteAnalysisSchemeRequest) : Types::DeleteAnalysisSchemeResponse
        request = Protocol::Query.build_request(Model::DELETE_ANALYSIS_SCHEME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteAnalysisSchemeResponse, "DeleteAnalysisScheme")
      end

      # Permanently deletes a search domain and all of its data. Once a domain has been deleted, it cannot
      # be recovered. For more information, see Deleting a Search Domain in the Amazon CloudSearch Developer
      # Guide .

      def delete_domain(
        domain_name : String
      ) : Types::DeleteDomainResponse

        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end

      def delete_domain(input : Types::DeleteDomainRequest) : Types::DeleteDomainResponse
        request = Protocol::Query.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteDomainResponse, "DeleteDomain")
      end

      # Removes an Expression from the search domain. For more information, see Configuring Expressions in
      # the Amazon CloudSearch Developer Guide .

      def delete_expression(
        domain_name : String,
        expression_name : String
      ) : Types::DeleteExpressionResponse

        input = Types::DeleteExpressionRequest.new(domain_name: domain_name, expression_name: expression_name)
        delete_expression(input)
      end

      def delete_expression(input : Types::DeleteExpressionRequest) : Types::DeleteExpressionResponse
        request = Protocol::Query.build_request(Model::DELETE_EXPRESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteExpressionResponse, "DeleteExpression")
      end

      # Removes an IndexField from the search domain. For more information, see Configuring Index Fields in
      # the Amazon CloudSearch Developer Guide .

      def delete_index_field(
        domain_name : String,
        index_field_name : String
      ) : Types::DeleteIndexFieldResponse

        input = Types::DeleteIndexFieldRequest.new(domain_name: domain_name, index_field_name: index_field_name)
        delete_index_field(input)
      end

      def delete_index_field(input : Types::DeleteIndexFieldRequest) : Types::DeleteIndexFieldResponse
        request = Protocol::Query.build_request(Model::DELETE_INDEX_FIELD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteIndexFieldResponse, "DeleteIndexField")
      end

      # Deletes a suggester. For more information, see Getting Search Suggestions in the Amazon CloudSearch
      # Developer Guide .

      def delete_suggester(
        domain_name : String,
        suggester_name : String
      ) : Types::DeleteSuggesterResponse

        input = Types::DeleteSuggesterRequest.new(domain_name: domain_name, suggester_name: suggester_name)
        delete_suggester(input)
      end

      def delete_suggester(input : Types::DeleteSuggesterRequest) : Types::DeleteSuggesterResponse
        request = Protocol::Query.build_request(Model::DELETE_SUGGESTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteSuggesterResponse, "DeleteSuggester")
      end

      # Gets the analysis schemes configured for a domain. An analysis scheme defines language-specific text
      # processing options for a text field. Can be limited to specific analysis schemes by name. By
      # default, shows all analysis schemes and includes any pending changes to the configuration. Set the
      # Deployed option to true to show the active configuration and exclude pending changes. For more
      # information, see Configuring Analysis Schemes in the Amazon CloudSearch Developer Guide .

      def describe_analysis_schemes(
        domain_name : String,
        analysis_scheme_names : Array(String)? = nil,
        deployed : Bool? = nil
      ) : Types::DescribeAnalysisSchemesResponse

        input = Types::DescribeAnalysisSchemesRequest.new(domain_name: domain_name, analysis_scheme_names: analysis_scheme_names, deployed: deployed)
        describe_analysis_schemes(input)
      end

      def describe_analysis_schemes(input : Types::DescribeAnalysisSchemesRequest) : Types::DescribeAnalysisSchemesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_ANALYSIS_SCHEMES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAnalysisSchemesResponse, "DescribeAnalysisSchemes")
      end

      # Gets the availability options configured for a domain. By default, shows the configuration with any
      # pending changes. Set the Deployed option to true to show the active configuration and exclude
      # pending changes. For more information, see Configuring Availability Options in the Amazon
      # CloudSearch Developer Guide .

      def describe_availability_options(
        domain_name : String,
        deployed : Bool? = nil
      ) : Types::DescribeAvailabilityOptionsResponse

        input = Types::DescribeAvailabilityOptionsRequest.new(domain_name: domain_name, deployed: deployed)
        describe_availability_options(input)
      end

      def describe_availability_options(input : Types::DescribeAvailabilityOptionsRequest) : Types::DescribeAvailabilityOptionsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_AVAILABILITY_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeAvailabilityOptionsResponse, "DescribeAvailabilityOptions")
      end

      # Returns the domain's endpoint options, specifically whether all requests to the domain must arrive
      # over HTTPS. For more information, see Configuring Domain Endpoint Options in the Amazon CloudSearch
      # Developer Guide .

      def describe_domain_endpoint_options(
        domain_name : String,
        deployed : Bool? = nil
      ) : Types::DescribeDomainEndpointOptionsResponse

        input = Types::DescribeDomainEndpointOptionsRequest.new(domain_name: domain_name, deployed: deployed)
        describe_domain_endpoint_options(input)
      end

      def describe_domain_endpoint_options(input : Types::DescribeDomainEndpointOptionsRequest) : Types::DescribeDomainEndpointOptionsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DOMAIN_ENDPOINT_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDomainEndpointOptionsResponse, "DescribeDomainEndpointOptions")
      end

      # Gets information about the search domains owned by this account. Can be limited to specific domains.
      # Shows all domains by default. To get the number of searchable documents in a domain, use the console
      # or submit a matchall request to your domain's search endpoint:
      # q=matchall&amp;amp;q.parser=structured&amp;amp;size=0 . For more information, see Getting
      # Information about a Search Domain in the Amazon CloudSearch Developer Guide .

      def describe_domains(
        domain_names : Array(String)? = nil
      ) : Types::DescribeDomainsResponse

        input = Types::DescribeDomainsRequest.new(domain_names: domain_names)
        describe_domains(input)
      end

      def describe_domains(input : Types::DescribeDomainsRequest) : Types::DescribeDomainsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeDomainsResponse, "DescribeDomains")
      end

      # Gets the expressions configured for the search domain. Can be limited to specific expressions by
      # name. By default, shows all expressions and includes any pending changes to the configuration. Set
      # the Deployed option to true to show the active configuration and exclude pending changes. For more
      # information, see Configuring Expressions in the Amazon CloudSearch Developer Guide .

      def describe_expressions(
        domain_name : String,
        deployed : Bool? = nil,
        expression_names : Array(String)? = nil
      ) : Types::DescribeExpressionsResponse

        input = Types::DescribeExpressionsRequest.new(domain_name: domain_name, deployed: deployed, expression_names: expression_names)
        describe_expressions(input)
      end

      def describe_expressions(input : Types::DescribeExpressionsRequest) : Types::DescribeExpressionsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_EXPRESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeExpressionsResponse, "DescribeExpressions")
      end

      # Gets information about the index fields configured for the search domain. Can be limited to specific
      # fields by name. By default, shows all fields and includes any pending changes to the configuration.
      # Set the Deployed option to true to show the active configuration and exclude pending changes. For
      # more information, see Getting Domain Information in the Amazon CloudSearch Developer Guide .

      def describe_index_fields(
        domain_name : String,
        deployed : Bool? = nil,
        field_names : Array(String)? = nil
      ) : Types::DescribeIndexFieldsResponse

        input = Types::DescribeIndexFieldsRequest.new(domain_name: domain_name, deployed: deployed, field_names: field_names)
        describe_index_fields(input)
      end

      def describe_index_fields(input : Types::DescribeIndexFieldsRequest) : Types::DescribeIndexFieldsResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_INDEX_FIELDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeIndexFieldsResponse, "DescribeIndexFields")
      end

      # Gets the scaling parameters configured for a domain. A domain's scaling parameters specify the
      # desired search instance type and replication count. For more information, see Configuring Scaling
      # Options in the Amazon CloudSearch Developer Guide .

      def describe_scaling_parameters(
        domain_name : String
      ) : Types::DescribeScalingParametersResponse

        input = Types::DescribeScalingParametersRequest.new(domain_name: domain_name)
        describe_scaling_parameters(input)
      end

      def describe_scaling_parameters(input : Types::DescribeScalingParametersRequest) : Types::DescribeScalingParametersResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_SCALING_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeScalingParametersResponse, "DescribeScalingParameters")
      end

      # Gets information about the access policies that control access to the domain's document and search
      # endpoints. By default, shows the configuration with any pending changes. Set the Deployed option to
      # true to show the active configuration and exclude pending changes. For more information, see
      # Configuring Access for a Search Domain in the Amazon CloudSearch Developer Guide .

      def describe_service_access_policies(
        domain_name : String,
        deployed : Bool? = nil
      ) : Types::DescribeServiceAccessPoliciesResponse

        input = Types::DescribeServiceAccessPoliciesRequest.new(domain_name: domain_name, deployed: deployed)
        describe_service_access_policies(input)
      end

      def describe_service_access_policies(input : Types::DescribeServiceAccessPoliciesRequest) : Types::DescribeServiceAccessPoliciesResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_SERVICE_ACCESS_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeServiceAccessPoliciesResponse, "DescribeServiceAccessPolicies")
      end

      # Gets the suggesters configured for a domain. A suggester enables you to display possible matches
      # before users finish typing their queries. Can be limited to specific suggesters by name. By default,
      # shows all suggesters and includes any pending changes to the configuration. Set the Deployed option
      # to true to show the active configuration and exclude pending changes. For more information, see
      # Getting Search Suggestions in the Amazon CloudSearch Developer Guide .

      def describe_suggesters(
        domain_name : String,
        deployed : Bool? = nil,
        suggester_names : Array(String)? = nil
      ) : Types::DescribeSuggestersResponse

        input = Types::DescribeSuggestersRequest.new(domain_name: domain_name, deployed: deployed, suggester_names: suggester_names)
        describe_suggesters(input)
      end

      def describe_suggesters(input : Types::DescribeSuggestersRequest) : Types::DescribeSuggestersResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_SUGGESTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeSuggestersResponse, "DescribeSuggesters")
      end

      # Tells the search domain to start indexing its documents using the latest indexing options. This
      # operation must be invoked to activate options whose OptionStatus is RequiresIndexDocuments .

      def index_documents(
        domain_name : String
      ) : Types::IndexDocumentsResponse

        input = Types::IndexDocumentsRequest.new(domain_name: domain_name)
        index_documents(input)
      end

      def index_documents(input : Types::IndexDocumentsRequest) : Types::IndexDocumentsResponse
        request = Protocol::Query.build_request(Model::INDEX_DOCUMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::IndexDocumentsResponse, "IndexDocuments")
      end

      # Lists all search domains owned by an account.


      def list_domain_names : Types::ListDomainNamesResponse
        request = Protocol::Query.build_request(Model::LIST_DOMAIN_NAMES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListDomainNamesResponse, "ListDomainNames")
      end

      # Configures the availability options for a domain. Enabling the Multi-AZ option expands an Amazon
      # CloudSearch domain to an additional Availability Zone in the same Region to increase fault tolerance
      # in the event of a service disruption. Changes to the Multi-AZ option can take about half an hour to
      # become active. For more information, see Configuring Availability Options in the Amazon CloudSearch
      # Developer Guide .

      def update_availability_options(
        domain_name : String,
        multi_az : Bool
      ) : Types::UpdateAvailabilityOptionsResponse

        input = Types::UpdateAvailabilityOptionsRequest.new(domain_name: domain_name, multi_az: multi_az)
        update_availability_options(input)
      end

      def update_availability_options(input : Types::UpdateAvailabilityOptionsRequest) : Types::UpdateAvailabilityOptionsResponse
        request = Protocol::Query.build_request(Model::UPDATE_AVAILABILITY_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateAvailabilityOptionsResponse, "UpdateAvailabilityOptions")
      end

      # Updates the domain's endpoint options, specifically whether all requests to the domain must arrive
      # over HTTPS. For more information, see Configuring Domain Endpoint Options in the Amazon CloudSearch
      # Developer Guide .

      def update_domain_endpoint_options(
        domain_endpoint_options : Types::DomainEndpointOptions,
        domain_name : String
      ) : Types::UpdateDomainEndpointOptionsResponse

        input = Types::UpdateDomainEndpointOptionsRequest.new(domain_endpoint_options: domain_endpoint_options, domain_name: domain_name)
        update_domain_endpoint_options(input)
      end

      def update_domain_endpoint_options(input : Types::UpdateDomainEndpointOptionsRequest) : Types::UpdateDomainEndpointOptionsResponse
        request = Protocol::Query.build_request(Model::UPDATE_DOMAIN_ENDPOINT_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateDomainEndpointOptionsResponse, "UpdateDomainEndpointOptions")
      end

      # Configures scaling parameters for a domain. A domain's scaling parameters specify the desired search
      # instance type and replication count. Amazon CloudSearch will still automatically scale your domain
      # based on the volume of data and traffic, but not below the desired instance type and replication
      # count. If the Multi-AZ option is enabled, these values control the resources used per Availability
      # Zone. For more information, see Configuring Scaling Options in the Amazon CloudSearch Developer
      # Guide .

      def update_scaling_parameters(
        domain_name : String,
        scaling_parameters : Types::ScalingParameters
      ) : Types::UpdateScalingParametersResponse

        input = Types::UpdateScalingParametersRequest.new(domain_name: domain_name, scaling_parameters: scaling_parameters)
        update_scaling_parameters(input)
      end

      def update_scaling_parameters(input : Types::UpdateScalingParametersRequest) : Types::UpdateScalingParametersResponse
        request = Protocol::Query.build_request(Model::UPDATE_SCALING_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateScalingParametersResponse, "UpdateScalingParameters")
      end

      # Configures the access rules that control access to the domain's document and search endpoints. For
      # more information, see Configuring Access for an Amazon CloudSearch Domain .

      def update_service_access_policies(
        access_policies : String,
        domain_name : String
      ) : Types::UpdateServiceAccessPoliciesResponse

        input = Types::UpdateServiceAccessPoliciesRequest.new(access_policies: access_policies, domain_name: domain_name)
        update_service_access_policies(input)
      end

      def update_service_access_policies(input : Types::UpdateServiceAccessPoliciesRequest) : Types::UpdateServiceAccessPoliciesResponse
        request = Protocol::Query.build_request(Model::UPDATE_SERVICE_ACCESS_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateServiceAccessPoliciesResponse, "UpdateServiceAccessPolicies")
      end
    end
  end
end
