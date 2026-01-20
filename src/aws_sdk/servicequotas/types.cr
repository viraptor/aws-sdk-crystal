require "json"
require "time"

module AwsSdk
  module ServiceQuotas
    module Types

      # The action you attempted is not allowed unless Service Access with Service Quotas is enabled in your
      # organization.

      struct AWSServiceAccessNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You do not have sufficient permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateServiceQuotaTemplateRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateServiceQuotaTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateSupportCaseRequest
        include JSON::Serializable

        # The ID of the pending quota increase request for which you want to open a Support case.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String

        def initialize(
          @request_id : String
        )
        end
      end


      struct CreateSupportCaseResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteServiceQuotaIncreaseRequestFromTemplateRequest
        include JSON::Serializable

        # Specifies the Amazon Web Services Region for which the request was made.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @aws_region : String,
          @quota_code : String,
          @service_code : String
        )
        end
      end


      struct DeleteServiceQuotaIncreaseRequestFromTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # You can't perform this action because a dependency does not have access.

      struct DependencyAccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DisassociateServiceQuotaTemplateRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateServiceQuotaTemplateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An error that explains why an action did not succeed.

      struct ErrorReason
        include JSON::Serializable

        # Service Quotas returns the following error values: DEPENDENCY_ACCESS_DENIED_ERROR - The caller does
        # not have the required permissions to complete the action. To resolve the error, you must have
        # permission to access the Amazon Web Services service or quota. DEPENDENCY_THROTTLING_ERROR - The
        # Amazon Web Services service is throttling Service Quotas. DEPENDENCY_SERVICE_ERROR - The Amazon Web
        # Services service is not available. SERVICE_QUOTA_NOT_AVAILABLE_ERROR - There was an error in Service
        # Quotas.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct GetAWSDefaultServiceQuotaRequest
        include JSON::Serializable

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @quota_code : String,
          @service_code : String
        )
        end
      end


      struct GetAWSDefaultServiceQuotaResponse
        include JSON::Serializable

        # Information about the quota.

        @[JSON::Field(key: "Quota")]
        getter quota : Types::ServiceQuota?

        def initialize(
          @quota : Types::ServiceQuota? = nil
        )
        end
      end


      struct GetAssociationForServiceQuotaTemplateRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAssociationForServiceQuotaTemplateResponse
        include JSON::Serializable

        # The association status. If the status is ASSOCIATED , the quota increase requests in the template
        # are automatically applied to new Amazon Web Services accounts in your organization.

        @[JSON::Field(key: "ServiceQuotaTemplateAssociationStatus")]
        getter service_quota_template_association_status : String?

        def initialize(
          @service_quota_template_association_status : String? = nil
        )
        end
      end


      struct GetAutoManagementConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAutoManagementConfigurationResponse
        include JSON::Serializable

        # List of Amazon Web Services services excluded from Automatic Management. You won't be notified of
        # Service Quotas utilization for Amazon Web Services services added to the Automatic Management
        # exclusion list.

        @[JSON::Field(key: "ExclusionList")]
        getter exclusion_list : Hash(String, Array(Types::QuotaInfo))?

        # The User Notifications Amazon Resource Name (ARN) for Automatic Management notifications.

        @[JSON::Field(key: "NotificationArn")]
        getter notification_arn : String?

        # Information on the opt-in level for Automatic Management. Only Amazon Web Services account level is
        # supported.

        @[JSON::Field(key: "OptInLevel")]
        getter opt_in_level : String?

        # Status on whether Automatic Management is started or stopped.

        @[JSON::Field(key: "OptInStatus")]
        getter opt_in_status : String?

        # Information on the opt-in type for Automatic Management. There are two modes: Notify only and Notify
        # and Auto-Adjust. Currently, only NotifyOnly is available.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String?

        def initialize(
          @exclusion_list : Hash(String, Array(Types::QuotaInfo))? = nil,
          @notification_arn : String? = nil,
          @opt_in_level : String? = nil,
          @opt_in_status : String? = nil,
          @opt_in_type : String? = nil
        )
        end
      end


      struct GetQuotaUtilizationReportRequest
        include JSON::Serializable

        # The unique identifier for the quota utilization report. This identifier is returned by the
        # StartQuotaUtilizationReport operation.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String

        # The maximum number of results to return per page. The default value is 1,000 and the maximum allowed
        # value is 1,000.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates the next page of results to retrieve. This token is returned in the response
        # when there are more results available. Omit this parameter for the first request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @report_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQuotaUtilizationReportResponse
        include JSON::Serializable

        # An error code indicating the reason for failure when the report status is FAILED . This field is
        # only present when the status is FAILED .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A detailed error message describing the failure when the report status is FAILED . This field is
        # only present when the status is FAILED .

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp when the report was generated, in ISO 8601 format.

        @[JSON::Field(key: "GeneratedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter generated_at : Time?

        # A token that indicates more results are available. Include this token in the next request to
        # retrieve the next page of results. If this field is not present, you have retrieved all available
        # results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of quota utilization records, sorted by utilization percentage in descending order. Each
        # record includes the quota code, service code, service name, quota name, namespace, utilization
        # percentage, default value, applied value, and whether the quota is adjustable. Up to 1,000 records
        # are returned per page.

        @[JSON::Field(key: "Quotas")]
        getter quotas : Array(Types::QuotaUtilizationInfo)?

        # The unique identifier for the quota utilization report.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String?

        # The current status of the report generation. Possible values are: PENDING - The report generation is
        # in progress. Retry this operation after a few seconds. IN_PROGRESS - The report is being processed.
        # Continue polling until the status changes to COMPLETED . COMPLETED - The report is ready and quota
        # utilization data is available in the response. FAILED - The report generation failed. Check the
        # ErrorCode and ErrorMessage fields for details.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The total number of quotas included in the report across all pages.

        @[JSON::Field(key: "TotalCount")]
        getter total_count : Int32?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @generated_at : Time? = nil,
          @next_token : String? = nil,
          @quotas : Array(Types::QuotaUtilizationInfo)? = nil,
          @report_id : String? = nil,
          @status : String? = nil,
          @total_count : Int32? = nil
        )
        end
      end


      struct GetRequestedServiceQuotaChangeRequest
        include JSON::Serializable

        # Specifies the ID of the quota increase request.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String

        def initialize(
          @request_id : String
        )
        end
      end


      struct GetRequestedServiceQuotaChangeResponse
        include JSON::Serializable

        # Information about the quota increase request.

        @[JSON::Field(key: "RequestedQuota")]
        getter requested_quota : Types::RequestedServiceQuotaChange?

        def initialize(
          @requested_quota : Types::RequestedServiceQuotaChange? = nil
        )
        end
      end


      struct GetServiceQuotaIncreaseRequestFromTemplateRequest
        include JSON::Serializable

        # Specifies the Amazon Web Services Region for which you made the request.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @aws_region : String,
          @quota_code : String,
          @service_code : String
        )
        end
      end


      struct GetServiceQuotaIncreaseRequestFromTemplateResponse
        include JSON::Serializable

        # Information about the quota increase request.

        @[JSON::Field(key: "ServiceQuotaIncreaseRequestInTemplate")]
        getter service_quota_increase_request_in_template : Types::ServiceQuotaIncreaseRequestInTemplate?

        def initialize(
          @service_quota_increase_request_in_template : Types::ServiceQuotaIncreaseRequestInTemplate? = nil
        )
        end
      end


      struct GetServiceQuotaRequest
        include JSON::Serializable

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Specifies the resource with an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        def initialize(
          @quota_code : String,
          @service_code : String,
          @context_id : String? = nil
        )
        end
      end


      struct GetServiceQuotaResponse
        include JSON::Serializable

        # Information about the quota.

        @[JSON::Field(key: "Quota")]
        getter quota : Types::ServiceQuota?

        def initialize(
          @quota : Types::ServiceQuota? = nil
        )
        end
      end

      # Invalid input was provided.

      struct IllegalArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Invalid input was provided.

      struct InvalidPaginationTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource is in an invalid state.

      struct InvalidResourceStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAWSDefaultServiceQuotasRequest
        include JSON::Serializable

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_code : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAWSDefaultServiceQuotasResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the quotas.

        @[JSON::Field(key: "Quotas")]
        getter quotas : Array(Types::ServiceQuota)?

        def initialize(
          @next_token : String? = nil,
          @quotas : Array(Types::ServiceQuota)? = nil
        )
        end
      end


      struct ListRequestedServiceQuotaChangeHistoryByQuotaRequest
        include JSON::Serializable

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the response to return quota requests for the ACCOUNT , RESOURCE , or ALL levels. ACCOUNT is
        # the default.

        @[JSON::Field(key: "QuotaRequestedAtLevel")]
        getter quota_requested_at_level : String?

        # Specifies that you want to filter the results to only the requests with the matching status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @quota_code : String,
          @service_code : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @quota_requested_at_level : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListRequestedServiceQuotaChangeHistoryByQuotaResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the quota increase requests.

        @[JSON::Field(key: "RequestedQuotas")]
        getter requested_quotas : Array(Types::RequestedServiceQuotaChange)?

        def initialize(
          @next_token : String? = nil,
          @requested_quotas : Array(Types::RequestedServiceQuotaChange)? = nil
        )
        end
      end


      struct ListRequestedServiceQuotaChangeHistoryRequest
        include JSON::Serializable

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the response to return quota requests for the ACCOUNT , RESOURCE , or ALL levels. ACCOUNT is
        # the default.

        @[JSON::Field(key: "QuotaRequestedAtLevel")]
        getter quota_requested_at_level : String?

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # Specifies that you want to filter the results to only the requests with the matching status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @quota_requested_at_level : String? = nil,
          @service_code : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListRequestedServiceQuotaChangeHistoryResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the quota increase requests.

        @[JSON::Field(key: "RequestedQuotas")]
        getter requested_quotas : Array(Types::RequestedServiceQuotaChange)?

        def initialize(
          @next_token : String? = nil,
          @requested_quotas : Array(Types::RequestedServiceQuotaChange)? = nil
        )
        end
      end


      struct ListServiceQuotaIncreaseRequestsInTemplateRequest
        include JSON::Serializable

        # Specifies the Amazon Web Services Region for which you made the request.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @aws_region : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct ListServiceQuotaIncreaseRequestsInTemplateResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the quota increase requests.

        @[JSON::Field(key: "ServiceQuotaIncreaseRequestInTemplateList")]
        getter service_quota_increase_request_in_template_list : Array(Types::ServiceQuotaIncreaseRequestInTemplate)?

        def initialize(
          @next_token : String? = nil,
          @service_quota_increase_request_in_template_list : Array(Types::ServiceQuotaIncreaseRequestInTemplate)? = nil
        )
        end
      end


      struct ListServiceQuotasRequest
        include JSON::Serializable

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the response to return applied quota values for the ACCOUNT , RESOURCE , or ALL levels.
        # ACCOUNT is the default.

        @[JSON::Field(key: "QuotaAppliedAtLevel")]
        getter quota_applied_at_level : String?

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        def initialize(
          @service_code : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @quota_applied_at_level : String? = nil,
          @quota_code : String? = nil
        )
        end
      end


      struct ListServiceQuotasResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the quotas.

        @[JSON::Field(key: "Quotas")]
        getter quotas : Array(Types::ServiceQuota)?

        def initialize(
          @next_token : String? = nil,
          @quotas : Array(Types::ServiceQuota)? = nil
        )
        end
      end


      struct ListServicesRequest
        include JSON::Serializable

        # Specifies the maximum number of results that you want included on each page of the response. If you
        # do not include this parameter, it defaults to a value appropriate to the operation. If additional
        # items exist beyond those included in the current response, the NextToken response element is present
        # and has a value (is not null). Include that value as the NextToken request parameter in the next
        # call to the operation to get the next part of the results. An API operation can return fewer results
        # than the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a value for receiving additional results after you receive a NextToken response in a
        # previous request. A NextToken response indicates that more output is available. Set this parameter
        # to the value of the previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicesResponse
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of the Amazon Web Services service names and service codes.

        @[JSON::Field(key: "Services")]
        getter services : Array(Types::ServiceInfo)?

        def initialize(
          @next_token : String? = nil,
          @services : Array(Types::ServiceInfo)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the applied quota for which you want to list tags. You can get
        # this information by using the Service Quotas console, or by listing the quotas using the
        # list-service-quotas CLI command or the ListServiceQuotas Amazon Web Services API operation.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A complex data type that contains zero or more tag elements.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about the CloudWatch metric that reflects quota usage.

      struct MetricInfo
        include JSON::Serializable

        # The metric dimension. This is a name/value pair that is part of the identity of a metric.

        @[JSON::Field(key: "MetricDimensions")]
        getter metric_dimensions : Hash(String, String)?

        # The name of the metric.

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the metric.

        @[JSON::Field(key: "MetricNamespace")]
        getter metric_namespace : String?

        # The metric statistic that we recommend you use when determining quota usage.

        @[JSON::Field(key: "MetricStatisticRecommendation")]
        getter metric_statistic_recommendation : String?

        def initialize(
          @metric_dimensions : Hash(String, String)? = nil,
          @metric_name : String? = nil,
          @metric_namespace : String? = nil,
          @metric_statistic_recommendation : String? = nil
        )
        end
      end

      # The Amazon Web Services account making this call is not a member of an organization.

      struct NoAvailableOrganizationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct NoSuchResourceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The organization that your Amazon Web Services account belongs to is not in All Features mode.

      struct OrganizationNotInAllFeaturesModeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutServiceQuotaIncreaseRequestIntoTemplateRequest
        include JSON::Serializable

        # Specifies the Amazon Web Services Region to which the template applies.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String

        # Specifies the new, increased value for the quota.

        @[JSON::Field(key: "DesiredValue")]
        getter desired_value : Float64

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @aws_region : String,
          @desired_value : Float64,
          @quota_code : String,
          @service_code : String
        )
        end
      end


      struct PutServiceQuotaIncreaseRequestIntoTemplateResponse
        include JSON::Serializable

        # Information about the quota increase request.

        @[JSON::Field(key: "ServiceQuotaIncreaseRequestInTemplate")]
        getter service_quota_increase_request_in_template : Types::ServiceQuotaIncreaseRequestInTemplate?

        def initialize(
          @service_quota_increase_request_in_template : Types::ServiceQuotaIncreaseRequestInTemplate? = nil
        )
        end
      end

      # A structure that describes the context for a resource-level quota. For resource-level quotas, such
      # as Instances per OpenSearch Service Domain , you can apply the quota value at the resource-level for
      # each OpenSearch Service Domain in your Amazon Web Services account. Together the attributes of this
      # structure help you understand how the quota is implemented by Amazon Web Services and how you can
      # manage it. For quotas such as Amazon OpenSearch Service Domains which can be managed at the
      # account-level for each Amazon Web Services Region, the QuotaContext field is absent. See the
      # attribute descriptions below to further understand how to use them.

      struct QuotaContextInfo
        include JSON::Serializable

        # Specifies the resource, or resources, to which the quota applies. The value for this field is either
        # an Amazon Resource Name (ARN) or *. If the value is an ARN, the quota value applies to that
        # resource. If the value is *, then the quota value applies to all resources listed in the
        # ContextScopeType field. The quota value applies to all resources for which you haven’t previously
        # applied a quota value, and any new resources you create in your Amazon Web Services account.

        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        # Specifies the scope to which the quota value is applied. If the scope is RESOURCE , the quota value
        # is applied to each resource in the Amazon Web Services account. If the scope is ACCOUNT , the quota
        # value is applied to the Amazon Web Services account.

        @[JSON::Field(key: "ContextScope")]
        getter context_scope : String?

        # Specifies the resource type to which the quota can be applied.

        @[JSON::Field(key: "ContextScopeType")]
        getter context_scope_type : String?

        def initialize(
          @context_id : String? = nil,
          @context_scope : String? = nil,
          @context_scope_type : String? = nil
        )
        end
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.

      struct QuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information on your Service Quotas for Service Quotas Automatic Management . Automatic Management
      # monitors your Service Quotas utilization and notifies you before you run out of your allocated
      # quotas.

      struct QuotaInfo
        include JSON::Serializable

        # The Service Quotas code for the Amazon Web Services service monitored with Automatic Management.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The Service Quotas name for the Amazon Web Services service monitored with Automatic Management.

        @[JSON::Field(key: "QuotaName")]
        getter quota_name : String?

        def initialize(
          @quota_code : String? = nil,
          @quota_name : String? = nil
        )
        end
      end

      # Information about the quota period.

      struct QuotaPeriod
        include JSON::Serializable

        # The time unit.

        @[JSON::Field(key: "PeriodUnit")]
        getter period_unit : String?

        # The value associated with the reported PeriodUnit .

        @[JSON::Field(key: "PeriodValue")]
        getter period_value : Int32?

        def initialize(
          @period_unit : String? = nil,
          @period_value : Int32? = nil
        )
        end
      end

      # Information about a quota's utilization, including the quota code, service information, current
      # usage, and applied limits.

      struct QuotaUtilizationInfo
        include JSON::Serializable

        # Indicates whether the quota value can be increased.

        @[JSON::Field(key: "Adjustable")]
        getter adjustable : Bool?

        # The applied value of the quota, which may be higher than the default value if a quota increase has
        # been requested and approved.

        @[JSON::Field(key: "AppliedValue")]
        getter applied_value : Float64?

        # The default value of the quota.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Float64?

        # The namespace of the metric used to track quota usage.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The quota identifier.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The quota name.

        @[JSON::Field(key: "QuotaName")]
        getter quota_name : String?

        # The service identifier.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # The service name.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The utilization percentage of the quota, calculated as (current usage / applied value) × 100. Values
        # range from 0.0 to 100.0 or higher if usage exceeds the quota limit.

        @[JSON::Field(key: "Utilization")]
        getter utilization : Float64?

        def initialize(
          @adjustable : Bool? = nil,
          @applied_value : Float64? = nil,
          @default_value : Float64? = nil,
          @namespace : String? = nil,
          @quota_code : String? = nil,
          @quota_name : String? = nil,
          @service_code : String? = nil,
          @service_name : String? = nil,
          @utilization : Float64? = nil
        )
        end
      end


      struct RequestServiceQuotaIncreaseRequest
        include JSON::Serializable

        # Specifies the new, increased value for the quota.

        @[JSON::Field(key: "DesiredValue")]
        getter desired_value : Float64

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Specifies the resource with an Amazon Resource Name (ARN).

        @[JSON::Field(key: "ContextId")]
        getter context_id : String?

        # Specifies if an Amazon Web Services Support case can be opened for the quota increase request. This
        # parameter is optional. By default, this flag is set to True and Amazon Web Services may create a
        # support case for some quota increase requests. You can set this flag to False if you do not want a
        # support case created when you request a quota increase. If you set the flag to False , Amazon Web
        # Services does not open a support case and updates the request status to Not approved .

        @[JSON::Field(key: "SupportCaseAllowed")]
        getter support_case_allowed : Bool?

        def initialize(
          @desired_value : Float64,
          @quota_code : String,
          @service_code : String,
          @context_id : String? = nil,
          @support_case_allowed : Bool? = nil
        )
        end
      end


      struct RequestServiceQuotaIncreaseResponse
        include JSON::Serializable

        # Information about the quota increase request.

        @[JSON::Field(key: "RequestedQuota")]
        getter requested_quota : Types::RequestedServiceQuotaChange?

        def initialize(
          @requested_quota : Types::RequestedServiceQuotaChange? = nil
        )
        end
      end

      # Information about a quota increase request.

      struct RequestedServiceQuotaChange
        include JSON::Serializable

        # The case ID.

        @[JSON::Field(key: "CaseId")]
        getter case_id : String?

        # The date and time when the quota increase request was received and the case ID was created.

        @[JSON::Field(key: "Created", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The new, increased value for the quota.

        @[JSON::Field(key: "DesiredValue")]
        getter desired_value : Float64?

        # Indicates whether the quota is global.

        @[JSON::Field(key: "GlobalQuota")]
        getter global_quota : Bool?

        # The unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time of the most recent change.

        @[JSON::Field(key: "LastUpdated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated : Time?

        # The Amazon Resource Name (ARN) of the quota.

        @[JSON::Field(key: "QuotaArn")]
        getter quota_arn : String?

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The context for this service quota.

        @[JSON::Field(key: "QuotaContext")]
        getter quota_context : Types::QuotaContextInfo?

        # Specifies the quota name.

        @[JSON::Field(key: "QuotaName")]
        getter quota_name : String?

        # Filters the response to return quota requests for the ACCOUNT , RESOURCE , or ALL levels. ACCOUNT is
        # the default.

        @[JSON::Field(key: "QuotaRequestedAtLevel")]
        getter quota_requested_at_level : String?

        # The type of quota increase request. Possible values include: AutomaticManagement - The request was
        # automatically created by Service Quotas Automatic Management when quota utilization approached the
        # limit. If this field is not present, the request was manually created by a user.

        @[JSON::Field(key: "RequestType")]
        getter request_type : String?

        # The IAM identity of the requester.

        @[JSON::Field(key: "Requester")]
        getter requester : String?

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # Specifies the service name.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The state of the quota increase request. PENDING : The quota increase request is under review by
        # Amazon Web Services. CASE_OPENED : Service Quotas opened a support case to process the quota
        # increase request. Follow-up on the support case for more information. APPROVED : The quota increase
        # request is approved. DENIED : The quota increase request can't be approved by Service Quotas.
        # Contact Amazon Web Services Support for more details. NOT APPROVED : The quota increase request
        # can't be approved by Service Quotas. Contact Amazon Web Services Support for more details.
        # CASE_CLOSED : The support case associated with this quota increase request was closed. Check the
        # support case correspondence for the outcome of your quota request. INVALID_REQUEST : Service Quotas
        # couldn't process your resource-level quota increase request because the Amazon Resource Name (ARN)
        # specified as part of the ContextId is invalid.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unit of measurement.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @case_id : String? = nil,
          @created : Time? = nil,
          @desired_value : Float64? = nil,
          @global_quota : Bool? = nil,
          @id : String? = nil,
          @last_updated : Time? = nil,
          @quota_arn : String? = nil,
          @quota_code : String? = nil,
          @quota_context : Types::QuotaContextInfo? = nil,
          @quota_name : String? = nil,
          @quota_requested_at_level : String? = nil,
          @request_type : String? = nil,
          @requester : String? = nil,
          @service_code : String? = nil,
          @service_name : String? = nil,
          @status : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # The specified resource already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Something went wrong.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about an Amazon Web Services service.

      struct ServiceInfo
        include JSON::Serializable

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # Specifies the service name.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        def initialize(
          @service_code : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Information about a quota.

      struct ServiceQuota
        include JSON::Serializable

        # Indicates whether the quota value can be increased.

        @[JSON::Field(key: "Adjustable")]
        getter adjustable : Bool?

        # The quota description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error code and error reason.

        @[JSON::Field(key: "ErrorReason")]
        getter error_reason : Types::ErrorReason?

        # Indicates whether the quota is global.

        @[JSON::Field(key: "GlobalQuota")]
        getter global_quota : Bool?

        # The period of time.

        @[JSON::Field(key: "Period")]
        getter period : Types::QuotaPeriod?

        # Filters the response to return applied quota values for the ACCOUNT , RESOURCE , or ALL levels.
        # ACCOUNT is the default.

        @[JSON::Field(key: "QuotaAppliedAtLevel")]
        getter quota_applied_at_level : String?

        # The Amazon Resource Name (ARN) of the quota.

        @[JSON::Field(key: "QuotaArn")]
        getter quota_arn : String?

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The context for this service quota.

        @[JSON::Field(key: "QuotaContext")]
        getter quota_context : Types::QuotaContextInfo?

        # Specifies the quota name.

        @[JSON::Field(key: "QuotaName")]
        getter quota_name : String?

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # Specifies the service name.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The unit of measurement.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        # Information about the measurement.

        @[JSON::Field(key: "UsageMetric")]
        getter usage_metric : Types::MetricInfo?

        # The quota value.

        @[JSON::Field(key: "Value")]
        getter value : Float64?

        def initialize(
          @adjustable : Bool? = nil,
          @description : String? = nil,
          @error_reason : Types::ErrorReason? = nil,
          @global_quota : Bool? = nil,
          @period : Types::QuotaPeriod? = nil,
          @quota_applied_at_level : String? = nil,
          @quota_arn : String? = nil,
          @quota_code : String? = nil,
          @quota_context : Types::QuotaContextInfo? = nil,
          @quota_name : String? = nil,
          @service_code : String? = nil,
          @service_name : String? = nil,
          @unit : String? = nil,
          @usage_metric : Types::MetricInfo? = nil,
          @value : Float64? = nil
        )
        end
      end

      # Information about a quota increase request.

      struct ServiceQuotaIncreaseRequestInTemplate
        include JSON::Serializable

        # The Amazon Web Services Region.

        @[JSON::Field(key: "AwsRegion")]
        getter aws_region : String?

        # The new, increased value of the quota.

        @[JSON::Field(key: "DesiredValue")]
        getter desired_value : Float64?

        # Indicates whether the quota is global.

        @[JSON::Field(key: "GlobalQuota")]
        getter global_quota : Bool?

        # Specifies the quota identifier. To find the quota code for a specific quota, use the
        # ListServiceQuotas operation, and look for the QuotaCode response in the output for the quota you
        # want.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # Specifies the quota name.

        @[JSON::Field(key: "QuotaName")]
        getter quota_name : String?

        # Specifies the service identifier. To find the service code value for an Amazon Web Services service,
        # use the ListServices operation.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        # Specifies the service name.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The unit of measurement.

        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @aws_region : String? = nil,
          @desired_value : Float64? = nil,
          @global_quota : Bool? = nil,
          @quota_code : String? = nil,
          @quota_name : String? = nil,
          @service_code : String? = nil,
          @service_name : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # The quota request template is not associated with your organization.

      struct ServiceQuotaTemplateNotInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartAutoManagementRequest
        include JSON::Serializable

        # Sets the opt-in level for Automatic Management. Only Amazon Web Services account level is supported.

        @[JSON::Field(key: "OptInLevel")]
        getter opt_in_level : String

        # Sets the opt-in type for Automatic Management. There are two modes: Notify only and Notify and
        # Auto-Adjust. Currently, only NotifyOnly is available.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String

        # List of Amazon Web Services services excluded from Automatic Management. You won't be notified of
        # Service Quotas utilization for Amazon Web Services services added to the Automatic Management
        # exclusion list.

        @[JSON::Field(key: "ExclusionList")]
        getter exclusion_list : Hash(String, Array(String))?

        # The User Notifications Amazon Resource Name (ARN) for Automatic Management notifications.

        @[JSON::Field(key: "NotificationArn")]
        getter notification_arn : String?

        def initialize(
          @opt_in_level : String,
          @opt_in_type : String,
          @exclusion_list : Hash(String, Array(String))? = nil,
          @notification_arn : String? = nil
        )
        end
      end


      struct StartAutoManagementResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartQuotaUtilizationReportRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct StartQuotaUtilizationReportResponse
        include JSON::Serializable

        # An optional message providing additional information about the report generation status. This field
        # may contain details about the report initiation or indicate if an existing recent report is being
        # reused.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A unique identifier for the quota utilization report. Use this identifier with the
        # GetQuotaUtilizationReport operation to retrieve the report results.

        @[JSON::Field(key: "ReportId")]
        getter report_id : String?

        # The current status of the report generation. The status will be PENDING when the report is first
        # initiated.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @message : String? = nil,
          @report_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct StopAutoManagementRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct StopAutoManagementResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A complex data type that contains a tag key and tag value.

      struct Tag
        include JSON::Serializable

        # A string that contains a tag key. The string length should be between 1 and 128 characters. Valid
        # characters include a-z, A-Z, 0-9, space, and the special characters _ - . : / = + @.

        @[JSON::Field(key: "Key")]
        getter key : String

        # A string that contains an optional tag value. The string length should be between 0 and 256
        # characters. Valid characters include a-z, A-Z, 0-9, space, and the special characters _ - . : / = +
        # @.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The specified tag is a reserved word and cannot be used.

      struct TagPolicyViolationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the applied quota. You can get this information by using the
        # Service Quotas console, or by listing the quotas using the list-service-quotas CLI command or the
        # ListServiceQuotas Amazon Web Services API operation.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags that you want to add to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The Service Quotas template is not available in this Amazon Web Services Region.

      struct TemplatesNotAvailableInRegionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Due to throttling, the request was denied. Slow down the rate of request calls, or request an
      # increase for this quota.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You've exceeded the number of tags allowed for a resource. For more information, see Tag
      # restrictions in the Service Quotas User Guide .

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the applied quota that you want to untag. You can get this
        # information by using the Service Quotas console, or by listing the quotas using the
        # list-service-quotas CLI command or the ListServiceQuotas Amazon Web Services API operation.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The keys of the tags that you want to remove from the resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAutoManagementRequest
        include JSON::Serializable

        # List of Amazon Web Services services you want to exclude from Automatic Management. You won't be
        # notified of Service Quotas utilization for Amazon Web Services services added to the Automatic
        # Management exclusion list.

        @[JSON::Field(key: "ExclusionList")]
        getter exclusion_list : Hash(String, Array(String))?

        # The User Notifications Amazon Resource Name (ARN) for Automatic Management notifications you want to
        # update.

        @[JSON::Field(key: "NotificationArn")]
        getter notification_arn : String?

        # Information on the opt-in type for your Automatic Management configuration. There are two modes:
        # Notify only and Notify and Auto-Adjust. Currently, only NotifyOnly is available.

        @[JSON::Field(key: "OptInType")]
        getter opt_in_type : String?

        def initialize(
          @exclusion_list : Hash(String, Array(String))? = nil,
          @notification_arn : String? = nil,
          @opt_in_type : String? = nil
        )
        end
      end


      struct UpdateAutoManagementResponse
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
