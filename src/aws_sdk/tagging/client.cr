module AwsSdk
  module ResourceGroupsTaggingAPI
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

      # Describes the status of the StartReportCreation operation. You can call this operation only from the
      # organization's management account and from the us-east-1 Region.
      def describe_report_creation : Types::DescribeReportCreationOutput
        input = Types::DescribeReportCreationInput.new
        describe_report_creation(input)
      end
      def describe_report_creation(input : Types::DescribeReportCreationInput) : Types::DescribeReportCreationOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REPORT_CREATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReportCreationOutput, "DescribeReportCreation")
      end

      # Returns a table that shows counts of resources that are noncompliant with their tag policies. For
      # more information on tag policies, see Tag Policies in the Organizations User Guide. You can call
      # this operation only from the organization's management account and from the us-east-1 Region. This
      # operation supports pagination, where the response can be sent in multiple pages. You should check
      # the PaginationToken response parameter to determine if there are additional results available to
      # return. Repeat the query, passing the PaginationToken response parameter value as an input to the
      # next request until you recieve a null value. A null value for PaginationToken indicates that there
      # are no more results waiting to be returned.
      def get_compliance_summary(
        group_by : Array(String)? = nil,
        max_results : Int32? = nil,
        pagination_token : String? = nil,
        region_filters : Array(String)? = nil,
        resource_type_filters : Array(String)? = nil,
        tag_key_filters : Array(String)? = nil,
        target_id_filters : Array(String)? = nil
      ) : Types::GetComplianceSummaryOutput
        input = Types::GetComplianceSummaryInput.new(group_by: group_by, max_results: max_results, pagination_token: pagination_token, region_filters: region_filters, resource_type_filters: resource_type_filters, tag_key_filters: tag_key_filters, target_id_filters: target_id_filters)
        get_compliance_summary(input)
      end
      def get_compliance_summary(input : Types::GetComplianceSummaryInput) : Types::GetComplianceSummaryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceSummaryOutput, "GetComplianceSummary")
      end

      # Returns all the tagged or previously tagged resources that are located in the specified Amazon Web
      # Services Region for the account. Depending on what information you want returned, you can also
      # specify the following: Filters that specify what tags and resource types you want returned. The
      # response includes all tags that are associated with the requested resources. Information about
      # compliance with the account's effective tag policy. For more information on tag policies, see Tag
      # Policies in the Organizations User Guide. This operation supports pagination, where the response can
      # be sent in multiple pages. You should check the PaginationToken response parameter to determine if
      # there are additional results available to return. Repeat the query, passing the PaginationToken
      # response parameter value as an input to the next request until you recieve a null value. A null
      # value for PaginationToken indicates that there are no more results waiting to be returned.
      # GetResources does not return untagged resources. To find untagged resources in your account, use
      # Amazon Web Services Resource Explorer with a query that uses tag:none . For more information, see
      # Search query syntax reference for Resource Explorer .
      def get_resources(
        exclude_compliant_resources : Bool? = nil,
        include_compliance_details : Bool? = nil,
        pagination_token : String? = nil,
        resource_arn_list : Array(String)? = nil,
        resource_type_filters : Array(String)? = nil,
        resources_per_page : Int32? = nil,
        tag_filters : Array(Types::TagFilter)? = nil,
        tags_per_page : Int32? = nil
      ) : Types::GetResourcesOutput
        input = Types::GetResourcesInput.new(exclude_compliant_resources: exclude_compliant_resources, include_compliance_details: include_compliance_details, pagination_token: pagination_token, resource_arn_list: resource_arn_list, resource_type_filters: resource_type_filters, resources_per_page: resources_per_page, tag_filters: tag_filters, tags_per_page: tags_per_page)
        get_resources(input)
      end
      def get_resources(input : Types::GetResourcesInput) : Types::GetResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcesOutput, "GetResources")
      end

      # Returns all tag keys currently in use in the specified Amazon Web Services Region for the calling
      # account. This operation supports pagination, where the response can be sent in multiple pages. You
      # should check the PaginationToken response parameter to determine if there are additional results
      # available to return. Repeat the query, passing the PaginationToken response parameter value as an
      # input to the next request until you recieve a null value. A null value for PaginationToken indicates
      # that there are no more results waiting to be returned.
      def get_tag_keys(
        pagination_token : String? = nil
      ) : Types::GetTagKeysOutput
        input = Types::GetTagKeysInput.new(pagination_token: pagination_token)
        get_tag_keys(input)
      end
      def get_tag_keys(input : Types::GetTagKeysInput) : Types::GetTagKeysOutput
        request = Protocol::JsonRpc.build_request(Model::GET_TAG_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTagKeysOutput, "GetTagKeys")
      end

      # Returns all tag values for the specified key that are used in the specified Amazon Web Services
      # Region for the calling account. This operation supports pagination, where the response can be sent
      # in multiple pages. You should check the PaginationToken response parameter to determine if there are
      # additional results available to return. Repeat the query, passing the PaginationToken response
      # parameter value as an input to the next request until you recieve a null value. A null value for
      # PaginationToken indicates that there are no more results waiting to be returned.
      def get_tag_values(
        key : String,
        pagination_token : String? = nil
      ) : Types::GetTagValuesOutput
        input = Types::GetTagValuesInput.new(key: key, pagination_token: pagination_token)
        get_tag_values(input)
      end
      def get_tag_values(input : Types::GetTagValuesInput) : Types::GetTagValuesOutput
        request = Protocol::JsonRpc.build_request(Model::GET_TAG_VALUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTagValuesOutput, "GetTagValues")
      end

      # Lists the required tags for supported resource types in an Amazon Web Services account.
      def list_required_tags(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRequiredTagsOutput
        input = Types::ListRequiredTagsInput.new(max_results: max_results, next_token: next_token)
        list_required_tags(input)
      end
      def list_required_tags(input : Types::ListRequiredTagsInput) : Types::ListRequiredTagsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REQUIRED_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRequiredTagsOutput, "ListRequiredTags")
      end

      # Generates a report that lists all tagged resources in the accounts across your organization and
      # tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed
      # daily. The report is generated asynchronously. The generated report is saved to the following
      # location: s3://amzn-s3-demo-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv For
      # more information about evaluating resource compliance with tag policies, including the required
      # permissions, review Permissions for evaluating organization-wide compliance in the Tagging Amazon
      # Web Services Resources and Tag Editor user guide. You can call this operation only from the
      # organization's management account and from the us-east-1 Region. If the account associated with the
      # identity used to call StartReportCreation is different from the account that owns the Amazon S3
      # bucket, there must be a bucket policy attached to the bucket to provide access. For more
      # information, review Amazon S3 bucket policy for report storage in the Tagging Amazon Web Services
      # Resources and Tag Editor user guide.
      def start_report_creation(
        s3_bucket : String
      ) : Types::StartReportCreationOutput
        input = Types::StartReportCreationInput.new(s3_bucket: s3_bucket)
        start_report_creation(input)
      end
      def start_report_creation(input : Types::StartReportCreationInput) : Types::StartReportCreationOutput
        request = Protocol::JsonRpc.build_request(Model::START_REPORT_CREATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartReportCreationOutput, "StartReportCreation")
      end

      # Applies one or more tags to the specified resources. Note the following: Not all resources can have
      # tags. For a list of services with resources that support tagging using this operation, see Services
      # that support the Resource Groups Tagging API . If the resource doesn't yet support this operation,
      # the resource's service might support tagging using its own API operations. For more information,
      # refer to the documentation for that service. Each resource can have up to 50 tags. For other limits,
      # see Tag Naming and Usage Conventions in the Amazon Web Services General Reference. You can only tag
      # resources that are located in the specified Amazon Web Services Region for the Amazon Web Services
      # account. To add tags to a resource, you need the necessary permissions for the service that the
      # resource belongs to as well as permissions for adding tags. For more information, see the
      # documentation for each service. When you use the Amazon Web Services Resource Groups Tagging API to
      # update tags for Amazon Web Services CloudFormation stack sets, Amazon Web Services calls the Amazon
      # Web Services CloudFormation UpdateStack operation. This operation may initiate additional resource
      # property updates in addition to the desired tag updates. To avoid unexpected resource updates,
      # Amazon Web Services recommends that you only apply or update tags to your CloudFormation stack sets
      # using Amazon Web Services CloudFormation. Do not store personally identifiable information (PII) or
      # other confidential or sensitive information in tags. We use tags to provide you with billing and
      # administration services. Tags are not intended to be used for private or sensitive data. Minimum
      # permissions In addition to the tag:TagResources permission required by this operation, you must also
      # have the tagging permission defined by the service that created the resource. For example, to tag an
      # Amazon EC2 instance using the TagResources operation, you must have both of the following
      # permissions: tag:TagResources ec2:CreateTags In addition, some services might have specific
      # requirements for tagging some types of resources. For example, to tag an Amazon S3 bucket, you must
      # also have the s3:GetBucketTagging permission. If the expected minimum permissions don't work, check
      # the documentation for that service's tagging APIs for more information.
      def tag_resources(
        resource_arn_list : Array(String),
        tags : Hash(String, String)
      ) : Types::TagResourcesOutput
        input = Types::TagResourcesInput.new(resource_arn_list: resource_arn_list, tags: tags)
        tag_resources(input)
      end
      def tag_resources(input : Types::TagResourcesInput) : Types::TagResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourcesOutput, "TagResources")
      end

      # Removes the specified tags from the specified resources. When you specify a tag key, the action
      # removes both that key and its associated value. The operation succeeds even if you attempt to remove
      # tags from a resource that were already removed. Note the following: To remove tags from a resource,
      # you need the necessary permissions for the service that the resource belongs to as well as
      # permissions for removing tags. For more information, see the documentation for the service whose
      # resource you want to untag. You can only tag resources that are located in the specified Amazon Web
      # Services Region for the calling Amazon Web Services account. Minimum permissions In addition to the
      # tag:UntagResources permission required by this operation, you must also have the remove tags
      # permission defined by the service that created the resource. For example, to remove the tags from an
      # Amazon EC2 instance using the UntagResources operation, you must have both of the following
      # permissions: tag:UntagResources ec2:DeleteTags In addition, some services might have specific
      # requirements for untagging some types of resources. For example, to untag Amazon Web Services Glue
      # Connection, you must also have the glue:GetConnection permission. If the expected minimum
      # permissions don't work, check the documentation for that service's tagging APIs for more
      # information.
      def untag_resources(
        resource_arn_list : Array(String),
        tag_keys : Array(String)
      ) : Types::UntagResourcesOutput
        input = Types::UntagResourcesInput.new(resource_arn_list: resource_arn_list, tag_keys: tag_keys)
        untag_resources(input)
      end
      def untag_resources(input : Types::UntagResourcesInput) : Types::UntagResourcesOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourcesOutput, "UntagResources")
      end
    end
  end
end
