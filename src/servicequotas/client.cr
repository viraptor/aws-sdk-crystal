module Aws
  module ServiceQuotas
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

      # Associates your quota request template with your organization. When a new Amazon Web Services
      # account is created in your organization, the quota increase requests in the template are
      # automatically applied to the account. You can add a quota increase request for any adjustable quota
      # to your template.

      def associate_service_quota_template : Types::AssociateServiceQuotaTemplateResponse
        input = Types::AssociateServiceQuotaTemplateRequest.new
        associate_service_quota_template(input)
      end

      def associate_service_quota_template(input : Types::AssociateServiceQuotaTemplateRequest) : Types::AssociateServiceQuotaTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SERVICE_QUOTA_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateServiceQuotaTemplateResponse, "AssociateServiceQuotaTemplate")
      end

      # Creates a Support case for an existing quota increase request. This call only creates a Support case
      # if the request has a Pending status.

      def create_support_case(
        request_id : String
      ) : Types::CreateSupportCaseResponse

        input = Types::CreateSupportCaseRequest.new(request_id: request_id)
        create_support_case(input)
      end

      def create_support_case(input : Types::CreateSupportCaseRequest) : Types::CreateSupportCaseResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SUPPORT_CASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSupportCaseResponse, "CreateSupportCase")
      end

      # Deletes the quota increase request for the specified quota from your quota request template.

      def delete_service_quota_increase_request_from_template(
        aws_region : String,
        quota_code : String,
        service_code : String
      ) : Types::DeleteServiceQuotaIncreaseRequestFromTemplateResponse

        input = Types::DeleteServiceQuotaIncreaseRequestFromTemplateRequest.new(aws_region: aws_region, quota_code: quota_code, service_code: service_code)
        delete_service_quota_increase_request_from_template(input)
      end

      def delete_service_quota_increase_request_from_template(input : Types::DeleteServiceQuotaIncreaseRequestFromTemplateRequest) : Types::DeleteServiceQuotaIncreaseRequestFromTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_QUOTA_INCREASE_REQUEST_FROM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceQuotaIncreaseRequestFromTemplateResponse, "DeleteServiceQuotaIncreaseRequestFromTemplate")
      end

      # Disables your quota request template. After a template is disabled, the quota increase requests in
      # the template are not applied to new Amazon Web Services accounts in your organization. Disabling a
      # quota request template does not apply its quota increase requests.

      def disassociate_service_quota_template : Types::DisassociateServiceQuotaTemplateResponse
        input = Types::DisassociateServiceQuotaTemplateRequest.new
        disassociate_service_quota_template(input)
      end

      def disassociate_service_quota_template(input : Types::DisassociateServiceQuotaTemplateRequest) : Types::DisassociateServiceQuotaTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SERVICE_QUOTA_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateServiceQuotaTemplateResponse, "DisassociateServiceQuotaTemplate")
      end

      # Retrieves the default value for the specified quota. The default value does not reflect any quota
      # increases.

      def get_aws_default_service_quota(
        quota_code : String,
        service_code : String
      ) : Types::GetAWSDefaultServiceQuotaResponse

        input = Types::GetAWSDefaultServiceQuotaRequest.new(quota_code: quota_code, service_code: service_code)
        get_aws_default_service_quota(input)
      end

      def get_aws_default_service_quota(input : Types::GetAWSDefaultServiceQuotaRequest) : Types::GetAWSDefaultServiceQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AWS_DEFAULT_SERVICE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAWSDefaultServiceQuotaResponse, "GetAWSDefaultServiceQuota")
      end

      # Retrieves the status of the association for the quota request template.

      def get_association_for_service_quota_template : Types::GetAssociationForServiceQuotaTemplateResponse
        input = Types::GetAssociationForServiceQuotaTemplateRequest.new
        get_association_for_service_quota_template(input)
      end

      def get_association_for_service_quota_template(input : Types::GetAssociationForServiceQuotaTemplateRequest) : Types::GetAssociationForServiceQuotaTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ASSOCIATION_FOR_SERVICE_QUOTA_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAssociationForServiceQuotaTemplateResponse, "GetAssociationForServiceQuotaTemplate")
      end

      # Retrieves information about your Service Quotas Automatic Management configuration. Automatic
      # Management monitors your Service Quotas utilization and notifies you before you run out of your
      # allocated quotas.

      def get_auto_management_configuration : Types::GetAutoManagementConfigurationResponse
        input = Types::GetAutoManagementConfigurationRequest.new
        get_auto_management_configuration(input)
      end

      def get_auto_management_configuration(input : Types::GetAutoManagementConfigurationRequest) : Types::GetAutoManagementConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTO_MANAGEMENT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutoManagementConfigurationResponse, "GetAutoManagementConfiguration")
      end

      # Retrieves the quota utilization report for your Amazon Web Services account. This operation returns
      # paginated results showing your quota usage across all Amazon Web Services services, sorted by
      # utilization percentage in descending order (highest utilization first). You must first initiate a
      # report using the StartQuotaUtilizationReport operation. The report generation process is
      # asynchronous and may take several seconds to complete. Poll this operation periodically to check the
      # status and retrieve results when the report is ready. Each report contains up to 1,000 quota records
      # per page. Use the NextToken parameter to retrieve additional pages of results. Reports are
      # automatically deleted after 15 minutes.

      def get_quota_utilization_report(
        report_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetQuotaUtilizationReportResponse

        input = Types::GetQuotaUtilizationReportRequest.new(report_id: report_id, max_results: max_results, next_token: next_token)
        get_quota_utilization_report(input)
      end

      def get_quota_utilization_report(input : Types::GetQuotaUtilizationReportRequest) : Types::GetQuotaUtilizationReportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUOTA_UTILIZATION_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQuotaUtilizationReportResponse, "GetQuotaUtilizationReport")
      end

      # Retrieves information about the specified quota increase request.

      def get_requested_service_quota_change(
        request_id : String
      ) : Types::GetRequestedServiceQuotaChangeResponse

        input = Types::GetRequestedServiceQuotaChangeRequest.new(request_id: request_id)
        get_requested_service_quota_change(input)
      end

      def get_requested_service_quota_change(input : Types::GetRequestedServiceQuotaChangeRequest) : Types::GetRequestedServiceQuotaChangeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REQUESTED_SERVICE_QUOTA_CHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRequestedServiceQuotaChangeResponse, "GetRequestedServiceQuotaChange")
      end

      # Retrieves the applied quota value for the specified account-level or resource-level quota. For some
      # quotas, only the default values are available. If the applied quota value is not available for a
      # quota, the quota is not retrieved.

      def get_service_quota(
        quota_code : String,
        service_code : String,
        context_id : String? = nil
      ) : Types::GetServiceQuotaResponse

        input = Types::GetServiceQuotaRequest.new(quota_code: quota_code, service_code: service_code, context_id: context_id)
        get_service_quota(input)
      end

      def get_service_quota(input : Types::GetServiceQuotaRequest) : Types::GetServiceQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceQuotaResponse, "GetServiceQuota")
      end

      # Retrieves information about the specified quota increase request in your quota request template.

      def get_service_quota_increase_request_from_template(
        aws_region : String,
        quota_code : String,
        service_code : String
      ) : Types::GetServiceQuotaIncreaseRequestFromTemplateResponse

        input = Types::GetServiceQuotaIncreaseRequestFromTemplateRequest.new(aws_region: aws_region, quota_code: quota_code, service_code: service_code)
        get_service_quota_increase_request_from_template(input)
      end

      def get_service_quota_increase_request_from_template(input : Types::GetServiceQuotaIncreaseRequestFromTemplateRequest) : Types::GetServiceQuotaIncreaseRequestFromTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_QUOTA_INCREASE_REQUEST_FROM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceQuotaIncreaseRequestFromTemplateResponse, "GetServiceQuotaIncreaseRequestFromTemplate")
      end

      # Lists the default values for the quotas for the specified Amazon Web Services service. A default
      # value does not reflect any quota increases.

      def list_aws_default_service_quotas(
        service_code : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAWSDefaultServiceQuotasResponse

        input = Types::ListAWSDefaultServiceQuotasRequest.new(service_code: service_code, max_results: max_results, next_token: next_token)
        list_aws_default_service_quotas(input)
      end

      def list_aws_default_service_quotas(input : Types::ListAWSDefaultServiceQuotasRequest) : Types::ListAWSDefaultServiceQuotasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AWS_DEFAULT_SERVICE_QUOTAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAWSDefaultServiceQuotasResponse, "ListAWSDefaultServiceQuotas")
      end

      # Retrieves the quota increase requests for the specified Amazon Web Services service. Filter
      # responses to return quota requests at either the account level, resource level, or all levels.
      # Responses include any open or closed requests within 90 days.

      def list_requested_service_quota_change_history(
        max_results : Int32? = nil,
        next_token : String? = nil,
        quota_requested_at_level : String? = nil,
        service_code : String? = nil,
        status : String? = nil
      ) : Types::ListRequestedServiceQuotaChangeHistoryResponse

        input = Types::ListRequestedServiceQuotaChangeHistoryRequest.new(max_results: max_results, next_token: next_token, quota_requested_at_level: quota_requested_at_level, service_code: service_code, status: status)
        list_requested_service_quota_change_history(input)
      end

      def list_requested_service_quota_change_history(input : Types::ListRequestedServiceQuotaChangeHistoryRequest) : Types::ListRequestedServiceQuotaChangeHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REQUESTED_SERVICE_QUOTA_CHANGE_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRequestedServiceQuotaChangeHistoryResponse, "ListRequestedServiceQuotaChangeHistory")
      end

      # Retrieves the quota increase requests for the specified quota. Filter responses to return quota
      # requests at either the account level, resource level, or all levels.

      def list_requested_service_quota_change_history_by_quota(
        quota_code : String,
        service_code : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        quota_requested_at_level : String? = nil,
        status : String? = nil
      ) : Types::ListRequestedServiceQuotaChangeHistoryByQuotaResponse

        input = Types::ListRequestedServiceQuotaChangeHistoryByQuotaRequest.new(quota_code: quota_code, service_code: service_code, max_results: max_results, next_token: next_token, quota_requested_at_level: quota_requested_at_level, status: status)
        list_requested_service_quota_change_history_by_quota(input)
      end

      def list_requested_service_quota_change_history_by_quota(input : Types::ListRequestedServiceQuotaChangeHistoryByQuotaRequest) : Types::ListRequestedServiceQuotaChangeHistoryByQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REQUESTED_SERVICE_QUOTA_CHANGE_HISTORY_BY_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRequestedServiceQuotaChangeHistoryByQuotaResponse, "ListRequestedServiceQuotaChangeHistoryByQuota")
      end

      # Lists the quota increase requests in the specified quota request template.

      def list_service_quota_increase_requests_in_template(
        aws_region : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_code : String? = nil
      ) : Types::ListServiceQuotaIncreaseRequestsInTemplateResponse

        input = Types::ListServiceQuotaIncreaseRequestsInTemplateRequest.new(aws_region: aws_region, max_results: max_results, next_token: next_token, service_code: service_code)
        list_service_quota_increase_requests_in_template(input)
      end

      def list_service_quota_increase_requests_in_template(input : Types::ListServiceQuotaIncreaseRequestsInTemplateRequest) : Types::ListServiceQuotaIncreaseRequestsInTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_QUOTA_INCREASE_REQUESTS_IN_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceQuotaIncreaseRequestsInTemplateResponse, "ListServiceQuotaIncreaseRequestsInTemplate")
      end

      # Lists the applied quota values for the specified Amazon Web Services service. For some quotas, only
      # the default values are available. If the applied quota value is not available for a quota, the quota
      # is not retrieved. Filter responses to return applied quota values at either the account level,
      # resource level, or all levels.

      def list_service_quotas(
        service_code : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        quota_applied_at_level : String? = nil,
        quota_code : String? = nil
      ) : Types::ListServiceQuotasResponse

        input = Types::ListServiceQuotasRequest.new(service_code: service_code, max_results: max_results, next_token: next_token, quota_applied_at_level: quota_applied_at_level, quota_code: quota_code)
        list_service_quotas(input)
      end

      def list_service_quotas(input : Types::ListServiceQuotasRequest) : Types::ListServiceQuotasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICE_QUOTAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServiceQuotasResponse, "ListServiceQuotas")
      end

      # Lists the names and codes for the Amazon Web Services services integrated with Service Quotas.

      def list_services(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListServicesResponse

        input = Types::ListServicesRequest.new(max_results: max_results, next_token: next_token)
        list_services(input)
      end

      def list_services(input : Types::ListServicesRequest) : Types::ListServicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SERVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListServicesResponse, "ListServices")
      end

      # Returns a list of the tags assigned to the specified applied quota.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Adds a quota increase request to your quota request template.

      def put_service_quota_increase_request_into_template(
        aws_region : String,
        desired_value : Float64,
        quota_code : String,
        service_code : String
      ) : Types::PutServiceQuotaIncreaseRequestIntoTemplateResponse

        input = Types::PutServiceQuotaIncreaseRequestIntoTemplateRequest.new(aws_region: aws_region, desired_value: desired_value, quota_code: quota_code, service_code: service_code)
        put_service_quota_increase_request_into_template(input)
      end

      def put_service_quota_increase_request_into_template(input : Types::PutServiceQuotaIncreaseRequestIntoTemplateRequest) : Types::PutServiceQuotaIncreaseRequestIntoTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SERVICE_QUOTA_INCREASE_REQUEST_INTO_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutServiceQuotaIncreaseRequestIntoTemplateResponse, "PutServiceQuotaIncreaseRequestIntoTemplate")
      end

      # Submits a quota increase request for the specified quota at the account or resource level.

      def request_service_quota_increase(
        desired_value : Float64,
        quota_code : String,
        service_code : String,
        context_id : String? = nil,
        support_case_allowed : Bool? = nil
      ) : Types::RequestServiceQuotaIncreaseResponse

        input = Types::RequestServiceQuotaIncreaseRequest.new(desired_value: desired_value, quota_code: quota_code, service_code: service_code, context_id: context_id, support_case_allowed: support_case_allowed)
        request_service_quota_increase(input)
      end

      def request_service_quota_increase(input : Types::RequestServiceQuotaIncreaseRequest) : Types::RequestServiceQuotaIncreaseResponse
        request = Protocol::JsonRpc.build_request(Model::REQUEST_SERVICE_QUOTA_INCREASE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RequestServiceQuotaIncreaseResponse, "RequestServiceQuotaIncrease")
      end

      # Starts Service Quotas Automatic Management for an Amazon Web Services account, including
      # notification preferences and excluded quotas configurations. Automatic Management monitors your
      # Service Quotas utilization and notifies you before you run out of your allocated quotas.

      def start_auto_management(
        opt_in_level : String,
        opt_in_type : String,
        exclusion_list : Hash(String, Array(String))? = nil,
        notification_arn : String? = nil
      ) : Types::StartAutoManagementResponse

        input = Types::StartAutoManagementRequest.new(opt_in_level: opt_in_level, opt_in_type: opt_in_type, exclusion_list: exclusion_list, notification_arn: notification_arn)
        start_auto_management(input)
      end

      def start_auto_management(input : Types::StartAutoManagementRequest) : Types::StartAutoManagementResponse
        request = Protocol::JsonRpc.build_request(Model::START_AUTO_MANAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAutoManagementResponse, "StartAutoManagement")
      end

      # Initiates the generation of a quota utilization report for your Amazon Web Services account. This
      # asynchronous operation analyzes your quota usage across all Amazon Web Services services and returns
      # a unique report identifier that you can use to retrieve the results. The report generation process
      # may take several seconds to complete, depending on the number of quotas in your account. Use the
      # GetQuotaUtilizationReport operation to check the status and retrieve the results when the report is
      # ready.

      def start_quota_utilization_report : Types::StartQuotaUtilizationReportResponse
        input = Types::StartQuotaUtilizationReportRequest.new
        start_quota_utilization_report(input)
      end

      def start_quota_utilization_report(input : Types::StartQuotaUtilizationReportRequest) : Types::StartQuotaUtilizationReportResponse
        request = Protocol::JsonRpc.build_request(Model::START_QUOTA_UTILIZATION_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartQuotaUtilizationReportResponse, "StartQuotaUtilizationReport")
      end

      # Stops Service Quotas Automatic Management for an Amazon Web Services account and removes all
      # associated configurations. Automatic Management monitors your Service Quotas utilization and
      # notifies you before you run out of your allocated quotas.

      def stop_auto_management : Types::StopAutoManagementResponse
        input = Types::StopAutoManagementRequest.new
        stop_auto_management(input)
      end

      def stop_auto_management(input : Types::StopAutoManagementRequest) : Types::StopAutoManagementResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_AUTO_MANAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopAutoManagementResponse, "StopAutoManagement")
      end

      # Adds tags to the specified applied quota. You can include one or more tags to add to the quota.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes tags from the specified applied quota. You can specify one or more tags to remove.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates your Service Quotas Automatic Management configuration, including notification preferences
      # and excluded quotas. Automatic Management monitors your Service Quotas utilization and notifies you
      # before you run out of your allocated quotas.

      def update_auto_management(
        exclusion_list : Hash(String, Array(String))? = nil,
        notification_arn : String? = nil,
        opt_in_type : String? = nil
      ) : Types::UpdateAutoManagementResponse

        input = Types::UpdateAutoManagementRequest.new(exclusion_list: exclusion_list, notification_arn: notification_arn, opt_in_type: opt_in_type)
        update_auto_management(input)
      end

      def update_auto_management(input : Types::UpdateAutoManagementRequest) : Types::UpdateAutoManagementResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_AUTO_MANAGEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAutoManagementResponse, "UpdateAutoManagement")
      end
    end
  end
end
