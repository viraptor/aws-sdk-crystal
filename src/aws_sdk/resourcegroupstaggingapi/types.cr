require "json"

module AwsSdk
  module ResourceGroupsTaggingAPI
    module Types

      # Information that shows whether a resource is compliant with the effective tag policy, including
      # details on any noncompliant tag keys.

      struct ComplianceDetails
        include JSON::Serializable

        # Whether a resource is compliant with the effective tag policy.

        @[JSON::Field(key: "ComplianceStatus")]
        getter compliance_status : Bool?

        # These are keys defined in the effective policy that are on the resource with either incorrect case
        # treatment or noncompliant values.

        @[JSON::Field(key: "KeysWithNoncompliantValues")]
        getter keys_with_noncompliant_values : Array(String)?

        # These tag keys on the resource are noncompliant with the effective tag policy.

        @[JSON::Field(key: "NoncompliantKeys")]
        getter noncompliant_keys : Array(String)?

        def initialize(
          @compliance_status : Bool? = nil,
          @keys_with_noncompliant_values : Array(String)? = nil,
          @noncompliant_keys : Array(String)? = nil
        )
        end
      end

      # The request failed because the target of the operation is currently being modified by a different
      # request. Try again later.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because performing the operation would violate a constraint. Some of the reasons
      # in the following list might not apply to this specific operation. You must meet the prerequisites
      # for using tag policies. For information, see Prerequisites and permissions in the Tagging Amazon Web
      # Services resources and Tag Editor user guide. You must enable the tag policies service principal (
      # tagpolicies.tag.amazonaws.com ) to integrate with Organizations For information, see
      # EnableAWSServiceAccess . You must have a tag policy attached to the organization root, an OU, or an
      # account.

      struct ConstraintViolationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeReportCreationInput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeReportCreationOutput
        include JSON::Serializable

        # Details of the common errors that all operations return.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The path to the Amazon S3 bucket where the report was stored on creation.

        @[JSON::Field(key: "S3Location")]
        getter s3_location : String?

        # Reports the status of the operation. The operation status can be one of the following: RUNNING -
        # Report creation is in progress. SUCCEEDED - Report creation is complete. You can open the report
        # from the Amazon S3 bucket that you specified when you ran StartReportCreation . FAILED - Report
        # creation timed out or the Amazon S3 bucket is not accessible. NO REPORT - No report was generated in
        # the last 90 days.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @s3_location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about the errors that are returned for each failed resource. This information can
      # include InternalServiceException and InvalidParameterException errors. It can also include any valid
      # error code returned by the Amazon Web Services service that hosts the resource that the ARN key
      # represents. The following are common error codes that you might receive from other Amazon Web
      # Services services: InternalServiceException – This can mean that the Resource Groups Tagging API
      # didn't receive a response from another Amazon Web Services service. It can also mean that the
      # resource type in the request is not supported by the Resource Groups Tagging API. In these cases,
      # it's safe to retry the request and then call GetResources to verify the changes.
      # AccessDeniedException – This can mean that you need permission to call the tagging operations in the
      # Amazon Web Services service that contains the resource. For example, to use the Resource Groups
      # Tagging API to tag a Amazon CloudWatch alarm resource, you need permission to call both TagResources
      # and TagResource in the CloudWatch API. For more information on errors that are generated from other
      # Amazon Web Services services, see the documentation for that service.

      struct FailureInfo
        include JSON::Serializable

        # The code of the common error. Valid values include InternalServiceException ,
        # InvalidParameterException , and any valid error code returned by the Amazon Web Services service
        # that hosts the resource that you want to tag.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The message of the common error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The HTTP status code of the common error.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end


      struct GetComplianceSummaryInput
        include JSON::Serializable

        # Specifies a list of attributes to group the counts of noncompliant resources by. If supplied, the
        # counts are sorted by those attributes.

        @[JSON::Field(key: "GroupBy")]
        getter group_by : Array(String)?

        # Specifies the maximum number of results to be returned in each page. A query can return fewer than
        # this maximum, even if there are more results still to return. You should always check the
        # PaginationToken response value to see if there are more results. You can specify a minimum of 1 and
        # a maximum value of 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies a PaginationToken response value from a previous request to indicate that you want the
        # next page of results. Leave this parameter empty in your initial request.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # Specifies a list of Amazon Web Services Regions to limit the output to. If you use this parameter,
        # the count of returned noncompliant resources includes only resources in the specified Regions.

        @[JSON::Field(key: "RegionFilters")]
        getter region_filters : Array(String)?

        # Specifies that you want the response to include information for only resources of the specified
        # types. The format of each resource type is service[:resourceType] . For example, specifying a
        # resource type of ec2 returns all Amazon EC2 resources (which includes EC2 instances). Specifying a
        # resource type of ec2:instance returns only EC2 instances. The string for each service name and
        # resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the
        # Amazon Web Services General Reference for the following: For a list of service name strings, see
        # Amazon Web Services Service Namespaces . For resource type strings, see Example ARNs . For more
        # information about ARNs, see Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces
        # . For the list of services whose resources you can tag using the Resource Groups Tagging API, see
        # Services that support the Resource Groups Tagging API . If an Amazon Web Services service isn't
        # listed on that page, you might still be able to tag that service's resources by using that service's
        # native tagging operations instead of using Resource Groups Tagging API operations. All tagged
        # resources, whether the tagging used the Resource Groups Tagging API or not, are returned by the Get*
        # operation. You can specify multiple resource types by using a comma separated array. The array can
        # include up to 100 items. Note that the length constraint requirement applies to each resource type
        # filter.

        @[JSON::Field(key: "ResourceTypeFilters")]
        getter resource_type_filters : Array(String)?

        # Specifies that you want the response to include information for only resources that have tags with
        # the specified tag keys. If you use this parameter, the count of returned noncompliant resources
        # includes only resources that have the specified tag keys.

        @[JSON::Field(key: "TagKeyFilters")]
        getter tag_key_filters : Array(String)?

        # Specifies target identifiers (usually, specific account IDs) to limit the output by. If you use this
        # parameter, the count of returned noncompliant resources includes only resources with the specified
        # target IDs.

        @[JSON::Field(key: "TargetIdFilters")]
        getter target_id_filters : Array(String)?

        def initialize(
          @group_by : Array(String)? = nil,
          @max_results : Int32? = nil,
          @pagination_token : String? = nil,
          @region_filters : Array(String)? = nil,
          @resource_type_filters : Array(String)? = nil,
          @tag_key_filters : Array(String)? = nil,
          @target_id_filters : Array(String)? = nil
        )
        end
      end


      struct GetComplianceSummaryOutput
        include JSON::Serializable

        # A string that indicates that there is more data available than this response contains. To receive
        # the next part of the response, specify this response value as the PaginationToken value in the
        # request for the next page.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # A table that shows counts of noncompliant resources.

        @[JSON::Field(key: "SummaryList")]
        getter summary_list : Array(Types::Summary)?

        def initialize(
          @pagination_token : String? = nil,
          @summary_list : Array(Types::Summary)? = nil
        )
        end
      end


      struct GetResourcesInput
        include JSON::Serializable

        # Specifies whether to exclude resources that are compliant with the tag policy. Set this to true if
        # you are interested in retrieving information on noncompliant resources only. You can use this
        # parameter only if the IncludeComplianceDetails parameter is also set to true .

        @[JSON::Field(key: "ExcludeCompliantResources")]
        getter exclude_compliant_resources : Bool?

        # Specifies whether to include details regarding the compliance with the effective tag policy. Set
        # this to true to determine whether resources are compliant with the tag policy and to get details.

        @[JSON::Field(key: "IncludeComplianceDetails")]
        getter include_compliance_details : Bool?

        # Specifies a PaginationToken response value from a previous request to indicate that you want the
        # next page of results. Leave this parameter empty in your initial request.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # Specifies a list of ARNs of resources for which you want to retrieve tag data. You can't specify
        # both this parameter and the ResourceTypeFilters parameter in the same request. If you do, you get an
        # Invalid Parameter exception. You can't specify both this parameter and the TagFilters parameter in
        # the same request. If you do, you get an Invalid Parameter exception. You can't specify both this
        # parameter and any of the pagination parameters ( ResourcesPerPage , TagsPerPage , PaginationToken )
        # in the same request. If you do, you get an Invalid Parameter exception. If a resource specified by
        # this parameter doesn't exist, it doesn't generate an error; it simply isn't included in the
        # response. An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see
        # Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces in the Amazon Web Services
        # General Reference .

        @[JSON::Field(key: "ResourceARNList")]
        getter resource_arn_list : Array(String)?

        # Specifies the resource types that you want included in the response. The format of each resource
        # type is service[:resourceType] . For example, specifying a service of ec2 returns all Amazon EC2
        # resources (which includes EC2 instances). Specifying a resource type of ec2:instance returns only
        # EC2 instances. You can't specify both this parameter and the ResourceArnList parameter in the same
        # request. If you do, you get an Invalid Parameter exception. The string for each service name and
        # resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). For the list
        # of services whose resources you can tag using the Resource Groups Tagging API, see Services that
        # support the Resource Groups Tagging API . If an Amazon Web Services service isn't listed on that
        # page, you might still be able to tag that service's resources by using that service's native tagging
        # operations instead of using Resource Groups Tagging API operations. All tagged resources, whether
        # the tagging used the Resource Groups Tagging API or not, are returned by the Get* operation. You can
        # specify multiple resource types by using an array. The array can include up to 100 items. Note that
        # the length constraint requirement applies to each resource type filter. For example, the following
        # string would limit the response to only Amazon EC2 instances, Amazon S3 buckets, or any Audit
        # Manager resource: ec2:instance,s3:bucket,auditmanager

        @[JSON::Field(key: "ResourceTypeFilters")]
        getter resource_type_filters : Array(String)?

        # Specifies the maximum number of results to be returned in each page. A query can return fewer than
        # this maximum, even if there are more results still to return. You should always check the
        # PaginationToken response value to see if there are more results. You can specify a minimum of 1 and
        # a maximum value of 100.

        @[JSON::Field(key: "ResourcesPerPage")]
        getter resources_per_page : Int32?

        # Specifies a list of TagFilters (keys and values) to restrict the output to only those resources that
        # have tags with the specified keys and, if included, the specified values. Each TagFilter must
        # contain a key with values optional. A request can include up to 50 keys, and each key can include up
        # to 20 values. You can't specify both this parameter and the ResourceArnList parameter in the same
        # request. If you do, you get an Invalid Parameter exception. Note the following when deciding how to
        # use TagFilters: If you don't specify a TagFilter , the response includes all resources that are
        # currently tagged or ever had a tag. Resources that were previously tagged, but do not currently have
        # tags, are shown with an empty tag set, like this: "Tags": [] . If you specify more than one filter
        # in a single request, the response returns only those resources that satisfy all filters. If you
        # specify a filter that contains more than one value for a key, the response returns resources that
        # match any of the specified values for that key. If you don't specify a value for a key, the response
        # returns all resources that are tagged with that key, with any or no value. For example, for the
        # following filters: filter1= {key1,{value1}} , filter2={key2,{value2,value3,value4}} , filter3=
        # {key3} : GetResources({filter1}) returns resources tagged with key1=value1 GetResources({filter2})
        # returns resources tagged with key2=value2 or key2=value3 or key2=value4 GetResources({filter3})
        # returns resources tagged with any tag with the key key3 , and with any or no value
        # GetResources({filter1,filter2,filter3}) returns resources tagged with (key1=value1) and (key2=value2
        # or key2=value3 or key2=value4) and (key3, any or no value)

        @[JSON::Field(key: "TagFilters")]
        getter tag_filters : Array(Types::TagFilter)?

        # Amazon Web Services recommends using ResourcesPerPage instead of this parameter. A limit that
        # restricts the number of tags (key and value pairs) returned by GetResources in paginated output. A
        # resource with no tags is counted as having one tag (one key and value pair). GetResources does not
        # split a resource and its associated tags across pages. If the specified TagsPerPage would cause such
        # a break, a PaginationToken is returned in place of the affected resource and its tags. Use that
        # token in another request to get the remaining data. For example, if you specify a TagsPerPage of 100
        # and the account has 22 resources with 10 tags each (meaning that each resource has 10 key and value
        # pairs), the output will consist of three pages. The first page displays the first 10 resources, each
        # with its 10 tags. The second page displays the next 10 resources, each with its 10 tags. The third
        # page displays the remaining 2 resources, each with its 10 tags. You can set TagsPerPage to a minimum
        # of 100 items up to a maximum of 500 items.

        @[JSON::Field(key: "TagsPerPage")]
        getter tags_per_page : Int32?

        def initialize(
          @exclude_compliant_resources : Bool? = nil,
          @include_compliance_details : Bool? = nil,
          @pagination_token : String? = nil,
          @resource_arn_list : Array(String)? = nil,
          @resource_type_filters : Array(String)? = nil,
          @resources_per_page : Int32? = nil,
          @tag_filters : Array(Types::TagFilter)? = nil,
          @tags_per_page : Int32? = nil
        )
        end
      end


      struct GetResourcesOutput
        include JSON::Serializable

        # A string that indicates that there is more data available than this response contains. To receive
        # the next part of the response, specify this response value as the PaginationToken value in the
        # request for the next page.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # A list of resource ARNs and the tags (keys and values) associated with each.

        @[JSON::Field(key: "ResourceTagMappingList")]
        getter resource_tag_mapping_list : Array(Types::ResourceTagMapping)?

        def initialize(
          @pagination_token : String? = nil,
          @resource_tag_mapping_list : Array(Types::ResourceTagMapping)? = nil
        )
        end
      end


      struct GetTagKeysInput
        include JSON::Serializable

        # Specifies a PaginationToken response value from a previous request to indicate that you want the
        # next page of results. Leave this parameter empty in your initial request.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @pagination_token : String? = nil
        )
        end
      end


      struct GetTagKeysOutput
        include JSON::Serializable

        # A string that indicates that there is more data available than this response contains. To receive
        # the next part of the response, specify this response value as the PaginationToken value in the
        # request for the next page.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # A list of all tag keys in the Amazon Web Services account.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)?

        def initialize(
          @pagination_token : String? = nil,
          @tag_keys : Array(String)? = nil
        )
        end
      end


      struct GetTagValuesInput
        include JSON::Serializable

        # Specifies the tag key for which you want to list all existing values that are currently used in the
        # specified Amazon Web Services Region for the calling account.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specifies a PaginationToken response value from a previous request to indicate that you want the
        # next page of results. Leave this parameter empty in your initial request.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @key : String,
          @pagination_token : String? = nil
        )
        end
      end


      struct GetTagValuesOutput
        include JSON::Serializable

        # A string that indicates that there is more data available than this response contains. To receive
        # the next part of the response, specify this response value as the PaginationToken value in the
        # request for the next page.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # A list of all tag values for the specified key currently used in the specified Amazon Web Services
        # Region for the calling account.

        @[JSON::Field(key: "TagValues")]
        getter tag_values : Array(String)?

        def initialize(
          @pagination_token : String? = nil,
          @tag_values : Array(String)? = nil
        )
        end
      end

      # The request processing failed because of an unknown error, exception, or failure. You can retry the
      # request.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because of one of the following reasons: A required parameter is missing. A
      # provided string parameter is malformed. An provided parameter value is out of range. The target ID
      # is invalid, unsupported, or doesn't exist. You can't access the Amazon S3 bucket for report storage.
      # For more information, see Amazon S3 bucket policy for report storage in the Tagging Amazon Web
      # Services resources and Tag Editor user guide. The partition specified in an ARN parameter in the
      # request doesn't match the partition where you invoked the operation. The partition is specified by
      # the second field of the ARN.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListRequiredTagsInput
        include JSON::Serializable

        # The maximum number of required tags.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token for requesting another page of required tags if the NextToken response element indicates
        # that more required tags are available. Use the value of the returned NextToken element in your
        # request until the token comes back as null. Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRequiredTagsOutput
        include JSON::Serializable

        # A token for requesting another page of required tags if the NextToken response element indicates
        # that more required tags are available. Use the value of the returned NextToken element in your
        # request until the token comes back as null. Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The required tags.

        @[JSON::Field(key: "RequiredTags")]
        getter required_tags : Array(Types::RequiredTag)?

        def initialize(
          @next_token : String? = nil,
          @required_tags : Array(Types::RequiredTag)? = nil
        )
        end
      end

      # The request failed because the specified PaginationToken has expired. A PaginationToken is valid for
      # a maximum of 15 minutes.

      struct PaginationTokenExpiredException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information that describes the required tags for a given resource type.

      struct RequiredTag
        include JSON::Serializable

        # Describes the CloudFormation resource type assigned the required tag keys.

        @[JSON::Field(key: "CloudFormationResourceTypes")]
        getter cloud_formation_resource_types : Array(String)?

        # These tag keys are marked as required in the report_required_tag_for block of the effective tag
        # policy.

        @[JSON::Field(key: "ReportingTagKeys")]
        getter reporting_tag_keys : Array(String)?

        # Describes the resource type for the required tag keys.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @cloud_formation_resource_types : Array(String)? = nil,
          @reporting_tag_keys : Array(String)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A list of resource ARNs and the tags (keys and values) that are associated with each.

      struct ResourceTagMapping
        include JSON::Serializable

        # Information that shows whether a resource is compliant with the effective tag policy, including
        # details on any noncompliant tag keys.

        @[JSON::Field(key: "ComplianceDetails")]
        getter compliance_details : Types::ComplianceDetails?

        # The ARN of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The tags that have been applied to one or more Amazon Web Services resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @compliance_details : Types::ComplianceDetails? = nil,
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct StartReportCreationInput
        include JSON::Serializable

        # The name of the Amazon S3 bucket where the report will be stored; for example: amzn-s3-demo-bucket
        # For more information on S3 bucket requirements, including an example bucket policy, see the example
        # Amazon S3 bucket policy on this page.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        def initialize(
          @s3_bucket : String
        )
        end
      end


      struct StartReportCreationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A count of noncompliant resources.

      struct Summary
        include JSON::Serializable

        # The timestamp that shows when this summary was generated in this Region.

        @[JSON::Field(key: "LastUpdated")]
        getter last_updated : String?

        # The count of noncompliant resources.

        @[JSON::Field(key: "NonCompliantResources")]
        getter non_compliant_resources : Int64?

        # The Amazon Web Services Region that the summary applies to.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The Amazon Web Services resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The account identifier or the root identifier of the organization. If you don't know the root ID,
        # you can call the Organizations ListRoots API.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # Whether the target is an account, an OU, or the organization root.

        @[JSON::Field(key: "TargetIdType")]
        getter target_id_type : String?

        def initialize(
          @last_updated : String? = nil,
          @non_compliant_resources : Int64? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @target_id : String? = nil,
          @target_id_type : String? = nil
        )
        end
      end

      # The metadata that you apply to Amazon Web Services resources to help you categorize and organize
      # them. Each tag consists of a key and a value, both of which you define. For more information, see
      # Tagging Amazon Web Services Resources in the Amazon Web Services General Reference .

      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag. A key is a general label that acts like a category
        # for more specific tag values.

        @[JSON::Field(key: "Key")]
        getter key : String

        # One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category
        # (key). The value can be empty or null.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # A list of tags (keys and values) that are used to specify the associated resources.

      struct TagFilter
        include JSON::Serializable

        # One part of a key-value pair that makes up a tag. A key is a general label that acts like a category
        # for more specific tag values.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category
        # (key). The value can be empty or null.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct TagResourcesInput
        include JSON::Serializable

        # Specifies the list of ARNs of the resources that you want to apply tags to. An ARN (Amazon Resource
        # Name) uniquely identifies a resource. For more information, see Amazon Resource Names (ARNs) and
        # Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ResourceARNList")]
        getter resource_arn_list : Array(String)

        # Specifies a list of tags that you want to add to the specified resources. A tag consists of a key
        # and a value that you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn_list : Array(String),
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourcesOutput
        include JSON::Serializable

        # A map containing a key-value pair for each failed item that couldn't be tagged. The key is the ARN
        # of the failed resource. The value is a FailureInfo object that contains an error code, a status
        # code, and an error message. If there are no errors, the FailedResourcesMap is empty.

        @[JSON::Field(key: "FailedResourcesMap")]
        getter failed_resources_map : Hash(String, Types::FailureInfo)?

        def initialize(
          @failed_resources_map : Hash(String, Types::FailureInfo)? = nil
        )
        end
      end

      # The request failed because it exceeded the allowed frequency of submitted requests.

      struct ThrottledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourcesInput
        include JSON::Serializable

        # Specifies a list of ARNs of the resources that you want to remove tags from. An ARN (Amazon Resource
        # Name) uniquely identifies a resource. For more information, see Amazon Resource Names (ARNs) and
        # Amazon Web Services Service Namespaces in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ResourceARNList")]
        getter resource_arn_list : Array(String)

        # Specifies a list of tag keys that you want to remove from the specified resources.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn_list : Array(String),
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourcesOutput
        include JSON::Serializable

        # A map containing a key-value pair for each failed item that couldn't be untagged. The key is the ARN
        # of the failed resource. The value is a FailureInfo object that contains an error code, a status
        # code, and an error message. If there are no errors, the FailedResourcesMap is empty.

        @[JSON::Field(key: "FailedResourcesMap")]
        getter failed_resources_map : Hash(String, Types::FailureInfo)?

        def initialize(
          @failed_resources_map : Hash(String, Types::FailureInfo)? = nil
        )
        end
      end
    end
  end
end
