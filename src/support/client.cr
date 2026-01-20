module Aws
  module Support
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

      # Adds one or more attachments to an attachment set. An attachment set is a temporary container for
      # attachments that you add to a case or case communication. The set is available for 1 hour after it's
      # created. The expiryTime returned in the response is when the set expires. You must have a Business,
      # Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API. If you
      # call the Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message appears. For
      # information about changing your support plan, see Amazon Web Services Support .

      def add_attachments_to_set(
        attachments : Array(Types::Attachment),
        attachment_set_id : String? = nil
      ) : Types::AddAttachmentsToSetResponse

        input = Types::AddAttachmentsToSetRequest.new(attachments: attachments, attachment_set_id: attachment_set_id)
        add_attachments_to_set(input)
      end

      def add_attachments_to_set(input : Types::AddAttachmentsToSetRequest) : Types::AddAttachmentsToSetResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_ATTACHMENTS_TO_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddAttachmentsToSetResponse, "AddAttachmentsToSet")
      end

      # Adds additional customer communication to an Amazon Web Services Support case. Use the caseId
      # parameter to identify the case to which to add communication. You can list a set of email addresses
      # to copy on the communication by using the ccEmailAddresses parameter. The communicationBody value
      # contains the text of the communication. You must have a Business, Enterprise On-Ramp, or Enterprise
      # Support plan to use the Amazon Web Services Support API. If you call the Amazon Web Services Support
      # API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan,
      # the SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support .

      def add_communication_to_case(
        communication_body : String,
        attachment_set_id : String? = nil,
        case_id : String? = nil,
        cc_email_addresses : Array(String)? = nil
      ) : Types::AddCommunicationToCaseResponse

        input = Types::AddCommunicationToCaseRequest.new(communication_body: communication_body, attachment_set_id: attachment_set_id, case_id: case_id, cc_email_addresses: cc_email_addresses)
        add_communication_to_case(input)
      end

      def add_communication_to_case(input : Types::AddCommunicationToCaseRequest) : Types::AddCommunicationToCaseResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_COMMUNICATION_TO_CASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddCommunicationToCaseResponse, "AddCommunicationToCase")
      end

      # Creates a case in the Amazon Web Services Support Center. This operation is similar to how you
      # create a case in the Amazon Web Services Support Center Create Case page. The Amazon Web Services
      # Support API doesn't support requesting service limit increases. You can submit a service limit
      # increase in the following ways: Submit a request from the Amazon Web Services Support Center Create
      # Case page. Use the Service Quotas RequestServiceQuotaIncrease operation. A successful CreateCase
      # request returns an Amazon Web Services Support case number. You can use the DescribeCases operation
      # and specify the case number to get existing Amazon Web Services Support cases. After you create a
      # case, use the AddCommunicationToCase operation to add additional communication or attachments to an
      # existing case. The caseId is separate from the displayId that appears in the Amazon Web Services
      # Support Center . Use the DescribeCases operation to get the displayId . You must have a Business,
      # Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API. If you
      # call the Amazon Web Services Support API from an account that doesn't have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message appears. For
      # information about changing your support plan, see Amazon Web Services Support .

      def create_case(
        communication_body : String,
        subject : String,
        attachment_set_id : String? = nil,
        category_code : String? = nil,
        cc_email_addresses : Array(String)? = nil,
        issue_type : String? = nil,
        language : String? = nil,
        service_code : String? = nil,
        severity_code : String? = nil
      ) : Types::CreateCaseResponse

        input = Types::CreateCaseRequest.new(communication_body: communication_body, subject: subject, attachment_set_id: attachment_set_id, category_code: category_code, cc_email_addresses: cc_email_addresses, issue_type: issue_type, language: language, service_code: service_code, severity_code: severity_code)
        create_case(input)
      end

      def create_case(input : Types::CreateCaseRequest) : Types::CreateCaseResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCaseResponse, "CreateCase")
      end

      # Returns the attachment that has the specified ID. Attachments can include screenshots, error logs,
      # or other files that describe your issue. Attachment IDs are generated by the case management system
      # when you add an attachment to a case or case communication. Attachment IDs are returned in the
      # AttachmentDetails objects that are returned by the DescribeCommunications operation. You must have a
      # Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API.
      # If you call the Amazon Web Services Support API from an account that doesn't have a Business,
      # Enterprise On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error message
      # appears. For information about changing your support plan, see Amazon Web Services Support .

      def describe_attachment(
        attachment_id : String
      ) : Types::DescribeAttachmentResponse

        input = Types::DescribeAttachmentRequest.new(attachment_id: attachment_id)
        describe_attachment(input)
      end

      def describe_attachment(input : Types::DescribeAttachmentRequest) : Types::DescribeAttachmentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ATTACHMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAttachmentResponse, "DescribeAttachment")
      end

      # Returns a list of cases that you specify by passing one or more case IDs. You can use the afterTime
      # and beforeTime parameters to filter the cases by date. You can set values for the
      # includeResolvedCases and includeCommunications parameters to specify how much information to return.
      # The response returns the following in JSON format: One or more CaseDetails data types. One or more
      # nextToken values, which specify where to paginate the returned records represented by the
      # CaseDetails objects. Case data is available for 12 months after creation. If a case was created more
      # than 12 months ago, a request might return an error. You must have a Business, Enterprise On-Ramp,
      # or Enterprise Support plan to use the Amazon Web Services Support API. If you call the Amazon Web
      # Services Support API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise
      # Support plan, the SubscriptionRequiredException error message appears. For information about
      # changing your support plan, see Amazon Web Services Support .

      def describe_cases(
        after_time : String? = nil,
        before_time : String? = nil,
        case_id_list : Array(String)? = nil,
        display_id : String? = nil,
        include_communications : Bool? = nil,
        include_resolved_cases : Bool? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeCasesResponse

        input = Types::DescribeCasesRequest.new(after_time: after_time, before_time: before_time, case_id_list: case_id_list, display_id: display_id, include_communications: include_communications, include_resolved_cases: include_resolved_cases, language: language, max_results: max_results, next_token: next_token)
        describe_cases(input)
      end

      def describe_cases(input : Types::DescribeCasesRequest) : Types::DescribeCasesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCasesResponse, "DescribeCases")
      end

      # Returns communications and attachments for one or more support cases. Use the afterTime and
      # beforeTime parameters to filter by date. You can use the caseId parameter to restrict the results to
      # a specific case. Case data is available for 12 months after creation. If a case was created more
      # than 12 months ago, a request for data might cause an error. You can use the maxResults and
      # nextToken parameters to control the pagination of the results. Set maxResults to the number of cases
      # that you want to display on each page, and use nextToken to specify the resumption of pagination.
      # You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web
      # Services Support API. If you call the Amazon Web Services Support API from an account that doesn't
      # have a Business, Enterprise On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException
      # error message appears. For information about changing your support plan, see Amazon Web Services
      # Support .

      def describe_communications(
        case_id : String,
        after_time : String? = nil,
        before_time : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeCommunicationsResponse

        input = Types::DescribeCommunicationsRequest.new(case_id: case_id, after_time: after_time, before_time: before_time, max_results: max_results, next_token: next_token)
        describe_communications(input)
      end

      def describe_communications(input : Types::DescribeCommunicationsRequest) : Types::DescribeCommunicationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMMUNICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCommunicationsResponse, "DescribeCommunications")
      end

      # Returns a list of CreateCaseOption types along with the corresponding supported hours and language
      # availability. You can specify the language categoryCode , issueType and serviceCode used to retrieve
      # the CreateCaseOptions. You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to
      # use the Amazon Web Services Support API. If you call the Amazon Web Services Support API from an
      # account that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
      # SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support .

      def describe_create_case_options(
        category_code : String,
        issue_type : String,
        language : String,
        service_code : String
      ) : Types::DescribeCreateCaseOptionsResponse

        input = Types::DescribeCreateCaseOptionsRequest.new(category_code: category_code, issue_type: issue_type, language: language, service_code: service_code)
        describe_create_case_options(input)
      end

      def describe_create_case_options(input : Types::DescribeCreateCaseOptionsRequest) : Types::DescribeCreateCaseOptionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CREATE_CASE_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCreateCaseOptionsResponse, "DescribeCreateCaseOptions")
      end

      # Returns the current list of Amazon Web Services services and a list of service categories for each
      # service. You then use service names and categories in your CreateCase requests. Each Amazon Web
      # Services service has its own set of categories. The service codes and category codes correspond to
      # the values that appear in the Service and Category lists on the Amazon Web Services Support Center
      # Create Case page. The values in those fields don't necessarily match the service codes and
      # categories returned by the DescribeServices operation. Always use the service codes and categories
      # that the DescribeServices operation returns, so that you have the most recent set of service and
      # category codes. You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the
      # Amazon Web Services Support API. If you call the Amazon Web Services Support API from an account
      # that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
      # SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support .

      def describe_services(
        language : String? = nil,
        service_code_list : Array(String)? = nil
      ) : Types::DescribeServicesResponse

        input = Types::DescribeServicesRequest.new(language: language, service_code_list: service_code_list)
        describe_services(input)
      end

      def describe_services(input : Types::DescribeServicesRequest) : Types::DescribeServicesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServicesResponse, "DescribeServices")
      end

      # Returns the list of severity levels that you can assign to a support case. The severity level for a
      # case is also a field in the CaseDetails data type that you include for a CreateCase request. You
      # must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services
      # Support API. If you call the Amazon Web Services Support API from an account that doesn't have a
      # Business, Enterprise On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error
      # message appears. For information about changing your support plan, see Amazon Web Services Support .

      def describe_severity_levels(
        language : String? = nil
      ) : Types::DescribeSeverityLevelsResponse

        input = Types::DescribeSeverityLevelsRequest.new(language: language)
        describe_severity_levels(input)
      end

      def describe_severity_levels(input : Types::DescribeSeverityLevelsRequest) : Types::DescribeSeverityLevelsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SEVERITY_LEVELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSeverityLevelsResponse, "DescribeSeverityLevels")
      end

      # Returns a list of supported languages for a specified categoryCode , issueType and serviceCode . The
      # returned supported languages will include a ISO 639-1 code for the language , and the language
      # display name. You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the
      # Amazon Web Services Support API. If you call the Amazon Web Services Support API from an account
      # that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
      # SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support .

      def describe_supported_languages(
        category_code : String,
        issue_type : String,
        service_code : String
      ) : Types::DescribeSupportedLanguagesResponse

        input = Types::DescribeSupportedLanguagesRequest.new(category_code: category_code, issue_type: issue_type, service_code: service_code)
        describe_supported_languages(input)
      end

      def describe_supported_languages(input : Types::DescribeSupportedLanguagesRequest) : Types::DescribeSupportedLanguagesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUPPORTED_LANGUAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSupportedLanguagesResponse, "DescribeSupportedLanguages")
      end

      # Returns the refresh status of the Trusted Advisor checks that have the specified check IDs. You can
      # get the check IDs by calling the DescribeTrustedAdvisorChecks operation. Some checks are refreshed
      # automatically, and you can't return their refresh statuses by using the
      # DescribeTrustedAdvisorCheckRefreshStatuses operation. If you call this operation for these checks,
      # you might see an InvalidParameterValue error. You must have a Business, Enterprise On-Ramp, or
      # Enterprise Support plan to use the Amazon Web Services Support API. If you call the Amazon Web
      # Services Support API from an account that doesn't have a Business, Enterprise On-Ramp, or Enterprise
      # Support plan, the SubscriptionRequiredException error message appears. For information about
      # changing your support plan, see Amazon Web Services Support . To call the Trusted Advisor operations
      # in the Amazon Web Services Support API, you must use the US East (N. Virginia) endpoint. Currently,
      # the US West (Oregon) and Europe (Ireland) endpoints don't support the Trusted Advisor operations.
      # For more information, see About the Amazon Web Services Support API in the Amazon Web Services
      # Support User Guide .

      def describe_trusted_advisor_check_refresh_statuses(
        check_ids : Array(String)
      ) : Types::DescribeTrustedAdvisorCheckRefreshStatusesResponse

        input = Types::DescribeTrustedAdvisorCheckRefreshStatusesRequest.new(check_ids: check_ids)
        describe_trusted_advisor_check_refresh_statuses(input)
      end

      def describe_trusted_advisor_check_refresh_statuses(input : Types::DescribeTrustedAdvisorCheckRefreshStatusesRequest) : Types::DescribeTrustedAdvisorCheckRefreshStatusesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTED_ADVISOR_CHECK_REFRESH_STATUSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustedAdvisorCheckRefreshStatusesResponse, "DescribeTrustedAdvisorCheckRefreshStatuses")
      end

      # Returns the results of the Trusted Advisor check that has the specified check ID. You can get the
      # check IDs by calling the DescribeTrustedAdvisorChecks operation. The response contains a
      # TrustedAdvisorCheckResult object, which contains these three objects:
      # TrustedAdvisorCategorySpecificSummary TrustedAdvisorResourceDetail TrustedAdvisorResourcesSummary In
      # addition, the response contains these fields: status - The alert status of the check can be ok
      # (green), warning (yellow), error (red), or not_available . timestamp - The time of the last refresh
      # of the check. checkId - The unique identifier for the check. You must have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API. If you call the
      # Amazon Web Services Support API from an account that doesn't have a Business, Enterprise On-Ramp, or
      # Enterprise Support plan, the SubscriptionRequiredException error message appears. For information
      # about changing your support plan, see Amazon Web Services Support . To call the Trusted Advisor
      # operations in the Amazon Web Services Support API, you must use the US East (N. Virginia) endpoint.
      # Currently, the US West (Oregon) and Europe (Ireland) endpoints don't support the Trusted Advisor
      # operations. For more information, see About the Amazon Web Services Support API in the Amazon Web
      # Services Support User Guide .

      def describe_trusted_advisor_check_result(
        check_id : String,
        language : String? = nil
      ) : Types::DescribeTrustedAdvisorCheckResultResponse

        input = Types::DescribeTrustedAdvisorCheckResultRequest.new(check_id: check_id, language: language)
        describe_trusted_advisor_check_result(input)
      end

      def describe_trusted_advisor_check_result(input : Types::DescribeTrustedAdvisorCheckResultRequest) : Types::DescribeTrustedAdvisorCheckResultResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTED_ADVISOR_CHECK_RESULT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustedAdvisorCheckResultResponse, "DescribeTrustedAdvisorCheckResult")
      end

      # Returns the results for the Trusted Advisor check summaries for the check IDs that you specified.
      # You can get the check IDs by calling the DescribeTrustedAdvisorChecks operation. The response
      # contains an array of TrustedAdvisorCheckSummary objects. You must have a Business, Enterprise
      # On-Ramp, or Enterprise Support plan to use the Amazon Web Services Support API. If you call the
      # Amazon Web Services Support API from an account that doesn't have a Business, Enterprise On-Ramp, or
      # Enterprise Support plan, the SubscriptionRequiredException error message appears. For information
      # about changing your support plan, see Amazon Web Services Support . To call the Trusted Advisor
      # operations in the Amazon Web Services Support API, you must use the US East (N. Virginia) endpoint.
      # Currently, the US West (Oregon) and Europe (Ireland) endpoints don't support the Trusted Advisor
      # operations. For more information, see About the Amazon Web Services Support API in the Amazon Web
      # Services Support User Guide .

      def describe_trusted_advisor_check_summaries(
        check_ids : Array(String)
      ) : Types::DescribeTrustedAdvisorCheckSummariesResponse

        input = Types::DescribeTrustedAdvisorCheckSummariesRequest.new(check_ids: check_ids)
        describe_trusted_advisor_check_summaries(input)
      end

      def describe_trusted_advisor_check_summaries(input : Types::DescribeTrustedAdvisorCheckSummariesRequest) : Types::DescribeTrustedAdvisorCheckSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTED_ADVISOR_CHECK_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustedAdvisorCheckSummariesResponse, "DescribeTrustedAdvisorCheckSummaries")
      end

      # Returns information about all available Trusted Advisor checks, including the name, ID, category,
      # description, and metadata. You must specify a language code. The response contains a
      # TrustedAdvisorCheckDescription object for each check. You must set the Amazon Web Services Region to
      # us-east-1. You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the
      # Amazon Web Services Support API. If you call the Amazon Web Services Support API from an account
      # that doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
      # SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support . The names and descriptions for Trusted Advisor checks are
      # subject to change. We recommend that you specify the check ID in your code to uniquely identify a
      # check. To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use
      # the US East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) endpoints
      # don't support the Trusted Advisor operations. For more information, see About the Amazon Web
      # Services Support API in the Amazon Web Services Support User Guide .

      def describe_trusted_advisor_checks(
        language : String
      ) : Types::DescribeTrustedAdvisorChecksResponse

        input = Types::DescribeTrustedAdvisorChecksRequest.new(language: language)
        describe_trusted_advisor_checks(input)
      end

      def describe_trusted_advisor_checks(input : Types::DescribeTrustedAdvisorChecksRequest) : Types::DescribeTrustedAdvisorChecksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRUSTED_ADVISOR_CHECKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrustedAdvisorChecksResponse, "DescribeTrustedAdvisorChecks")
      end

      # Refreshes the Trusted Advisor check that you specify using the check ID. You can get the check IDs
      # by calling the DescribeTrustedAdvisorChecks operation. Some checks are refreshed automatically. If
      # you call the RefreshTrustedAdvisorCheck operation to refresh them, you might see the
      # InvalidParameterValue error. The response contains a TrustedAdvisorCheckRefreshStatus object. You
      # must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon Web Services
      # Support API. If you call the Amazon Web Services Support API from an account that doesn't have a
      # Business, Enterprise On-Ramp, or Enterprise Support plan, the SubscriptionRequiredException error
      # message appears. For information about changing your support plan, see Amazon Web Services Support .
      # To call the Trusted Advisor operations in the Amazon Web Services Support API, you must use the US
      # East (N. Virginia) endpoint. Currently, the US West (Oregon) and Europe (Ireland) endpoints don't
      # support the Trusted Advisor operations. For more information, see About the Amazon Web Services
      # Support API in the Amazon Web Services Support User Guide .

      def refresh_trusted_advisor_check(
        check_id : String
      ) : Types::RefreshTrustedAdvisorCheckResponse

        input = Types::RefreshTrustedAdvisorCheckRequest.new(check_id: check_id)
        refresh_trusted_advisor_check(input)
      end

      def refresh_trusted_advisor_check(input : Types::RefreshTrustedAdvisorCheckRequest) : Types::RefreshTrustedAdvisorCheckResponse
        request = Protocol::JsonRpc.build_request(Model::REFRESH_TRUSTED_ADVISOR_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RefreshTrustedAdvisorCheckResponse, "RefreshTrustedAdvisorCheck")
      end

      # Resolves a support case. This operation takes a caseId and returns the initial and final state of
      # the case. You must have a Business, Enterprise On-Ramp, or Enterprise Support plan to use the Amazon
      # Web Services Support API. If you call the Amazon Web Services Support API from an account that
      # doesn't have a Business, Enterprise On-Ramp, or Enterprise Support plan, the
      # SubscriptionRequiredException error message appears. For information about changing your support
      # plan, see Amazon Web Services Support .

      def resolve_case(
        case_id : String? = nil
      ) : Types::ResolveCaseResponse

        input = Types::ResolveCaseRequest.new(case_id: case_id)
        resolve_case(input)
      end

      def resolve_case(input : Types::ResolveCaseRequest) : Types::ResolveCaseResponse
        request = Protocol::JsonRpc.build_request(Model::RESOLVE_CASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResolveCaseResponse, "ResolveCase")
      end
    end
  end
end
