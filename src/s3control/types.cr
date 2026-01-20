require "json"
require "time"

module Aws
  module S3Control
    module Types

      # The container for abort incomplete multipart upload

      struct AbortIncompleteMultipartUpload
        include JSON::Serializable

        # Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload to the
        # Outposts bucket.

        @[JSON::Field(key: "DaysAfterInitiation")]
        getter days_after_initiation : Int32?

        def initialize(
          @days_after_initiation : Int32? = nil
        )
        end
      end

      # A container for information about access control for replicas. This is not supported by Amazon S3 on
      # Outposts buckets.

      struct AccessControlTranslation
        include JSON::Serializable

        # Specifies the replica ownership.

        @[JSON::Field(key: "Owner")]
        getter owner : String

        def initialize(
          @owner : String
        )
        end
      end

      # The configuration options of the S3 Access Grants location. It contains the S3SubPrefix field. The
      # grant scope, the data to which you are granting access, is the result of appending the Subprefix
      # field to the scope of the registered location.

      struct AccessGrantsLocationConfiguration
        include JSON::Serializable

        # The S3SubPrefix is appended to the location scope creating the grant scope. Use this field to narrow
        # the scope of the grant to a subset of the location scope. This field is required if the location
        # scope is the default location s3:// because you cannot create a grant for all of your S3 data in the
        # Region and must narrow the scope. For example, if the location scope is the default location s3:// ,
        # the S3SubPrefx can be a &lt;bucket-name&gt;/*, so the full grant scope path would be
        # s3://&lt;bucket-name&gt;/* . Or the S3SubPrefx can be &lt;bucket-name&gt;/&lt;prefix-name&gt;* , so
        # the full grant scope path would be or s3://&lt;bucket-name&gt;/&lt;prefix-name&gt;* . If the
        # S3SubPrefix includes a prefix, append the wildcard character * after the prefix to indicate that you
        # want to include all object key names in the bucket that start with that prefix.

        @[JSON::Field(key: "S3SubPrefix")]
        getter s3_sub_prefix : String?

        def initialize(
          @s3_sub_prefix : String? = nil
        )
        end
      end

      # An access point used to access a bucket.

      struct AccessPoint
        include JSON::Serializable

        # The name of the bucket associated with this access point.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The name of this access point.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Indicates whether this access point allows access from the public internet. If VpcConfiguration is
        # specified for this access point, then NetworkOrigin is VPC , and the access point doesn't allow
        # access from the public internet. Otherwise, NetworkOrigin is Internet , and the access point allows
        # access from the public internet, subject to the access point and bucket access policies.

        @[JSON::Field(key: "NetworkOrigin")]
        getter network_origin : String

        # The ARN for the access point.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # The name or alias of the access point.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The Amazon Web Services account ID associated with the S3 bucket associated with this access point.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        # A unique identifier for the data source of the access point.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The type of the data source that the access point is attached to.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : String?

        # The virtual private cloud (VPC) configuration for this access point, if one exists. This element is
        # empty if this access point is an Amazon S3 on Outposts access point that is used by other Amazon Web
        # Services services.

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @bucket : String,
          @name : String,
          @network_origin : String,
          @access_point_arn : String? = nil,
          @alias : String? = nil,
          @bucket_account_id : String? = nil,
          @data_source_id : String? = nil,
          @data_source_type : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # A container element for the account-level Amazon S3 Storage Lens configuration. You must enable
      # Storage Lens metrics consistently at both the account level and bucket level, or your request will
      # fail. For more information about S3 Storage Lens, see Assessing your storage activity and usage with
      # S3 Storage Lens in the Amazon S3 User Guide . For a complete list of S3 Storage Lens metrics, see S3
      # Storage Lens metrics glossary in the Amazon S3 User Guide .

      struct AccountLevel
        include JSON::Serializable

        # A container element for the S3 Storage Lens bucket-level configuration.

        @[JSON::Field(key: "BucketLevel")]
        getter bucket_level : Types::BucketLevel

        # A container element for S3 Storage Lens activity metrics.

        @[JSON::Field(key: "ActivityMetrics")]
        getter activity_metrics : Types::ActivityMetrics?

        # A container element for S3 Storage Lens advanced cost-optimization metrics.

        @[JSON::Field(key: "AdvancedCostOptimizationMetrics")]
        getter advanced_cost_optimization_metrics : Types::AdvancedCostOptimizationMetrics?

        # A container element for S3 Storage Lens advanced data-protection metrics.

        @[JSON::Field(key: "AdvancedDataProtectionMetrics")]
        getter advanced_data_protection_metrics : Types::AdvancedDataProtectionMetrics?

        # A container element for S3 Storage Lens advanced performance metrics.

        @[JSON::Field(key: "AdvancedPerformanceMetrics")]
        getter advanced_performance_metrics : Types::AdvancedPerformanceMetrics?

        # A container element for detailed status code metrics.

        @[JSON::Field(key: "DetailedStatusCodesMetrics")]
        getter detailed_status_codes_metrics : Types::DetailedStatusCodesMetrics?

        # A container element for S3 Storage Lens groups metrics.

        @[JSON::Field(key: "StorageLensGroupLevel")]
        getter storage_lens_group_level : Types::StorageLensGroupLevel?

        def initialize(
          @bucket_level : Types::BucketLevel,
          @activity_metrics : Types::ActivityMetrics? = nil,
          @advanced_cost_optimization_metrics : Types::AdvancedCostOptimizationMetrics? = nil,
          @advanced_data_protection_metrics : Types::AdvancedDataProtectionMetrics? = nil,
          @advanced_performance_metrics : Types::AdvancedPerformanceMetrics? = nil,
          @detailed_status_codes_metrics : Types::DetailedStatusCodesMetrics? = nil,
          @storage_lens_group_level : Types::StorageLensGroupLevel? = nil
        )
        end
      end

      # The container element for Amazon S3 Storage Lens activity metrics. Activity metrics show details
      # about how your storage is requested, such as requests (for example, All requests, Get requests, Put
      # requests), bytes uploaded or downloaded, and errors. For more information about S3 Storage Lens, see
      # Assessing your storage activity and usage with S3 Storage Lens in the Amazon S3 User Guide . For a
      # complete list of S3 Storage Lens metrics, see S3 Storage Lens metrics glossary in the Amazon S3 User
      # Guide .

      struct ActivityMetrics
        include JSON::Serializable

        # A container that indicates whether activity metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @is_enabled : Bool? = nil
        )
        end
      end

      # The container element for Amazon S3 Storage Lens advanced cost-optimization metrics. Advanced
      # cost-optimization metrics provide insights that you can use to manage and optimize your storage
      # costs, for example, lifecycle rule counts for transitions, expirations, and incomplete multipart
      # uploads. For more information about S3 Storage Lens, see Assessing your storage activity and usage
      # with S3 Storage Lens in the Amazon S3 User Guide . For a complete list of S3 Storage Lens metrics,
      # see S3 Storage Lens metrics glossary in the Amazon S3 User Guide .

      struct AdvancedCostOptimizationMetrics
        include JSON::Serializable

        # A container that indicates whether advanced cost-optimization metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @is_enabled : Bool? = nil
        )
        end
      end

      # The container element for Amazon S3 Storage Lens advanced data-protection metrics. Advanced
      # data-protection metrics provide insights that you can use to perform audits and protect your data,
      # for example replication rule counts within and across Regions. For more information about S3 Storage
      # Lens, see Assessing your storage activity and usage with S3 Storage Lens in the Amazon S3 User Guide
      # . For a complete list of S3 Storage Lens metrics, see S3 Storage Lens metrics glossary in the Amazon
      # S3 User Guide .

      struct AdvancedDataProtectionMetrics
        include JSON::Serializable

        # A container that indicates whether advanced data-protection metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @is_enabled : Bool? = nil
        )
        end
      end

      # The container element for S3 Storage Lens advanced performance metrics. Advanced performance metrics
      # provide insights into application performance, such as request efficiency and access patterns. These
      # metrics help you optimize your S3 storage for both cost and performance by providing detailed
      # analytics on how your applications interact with S3 resources. For more information about S3 Storage
      # Lens, see Assessing your storage activity and usage with S3 Storage Lens in the Amazon S3 User Guide
      # . For a complete list of S3 Storage Lens metrics, see S3 Storage Lens metrics glossary in the Amazon
      # S3 User Guide .

      struct AdvancedPerformanceMetrics
        include JSON::Serializable

        # A container that indicates whether S3 Storage Lens advanced performance metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @is_enabled : Bool? = nil
        )
        end
      end


      struct AssociateAccessGrantsIdentityCenterRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance that you are
        # associating with your S3 Access Grants instance. An IAM Identity Center instance is your corporate
        # identity directory that you added to the IAM Identity Center. You can use the ListInstances API
        # operation to retrieve a list of your Identity Center instances and their ARNs.

        @[JSON::Field(key: "IdentityCenterArn")]
        getter identity_center_arn : String

        def initialize(
          @account_id : String,
          @identity_center_arn : String
        )
        end
      end

      # Error details for the failed asynchronous operation.

      struct AsyncErrorDetails
        include JSON::Serializable

        # A string that uniquely identifies the error condition.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A generic description of the error condition in English.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the request associated with the error.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The identifier of the resource associated with the error.

        @[JSON::Field(key: "Resource")]
        getter resource : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @resource : String? = nil
        )
        end
      end

      # A container for the information about an asynchronous operation.

      struct AsyncOperation
        include JSON::Serializable

        # The time that the request was sent to the service.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The specific operation for the asynchronous request.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The parameters associated with the request.

        @[JSON::Field(key: "RequestParameters")]
        getter request_parameters : Types::AsyncRequestParameters?

        # The current status of the request.

        @[JSON::Field(key: "RequestStatus")]
        getter request_status : String?

        # The request token associated with the request.

        @[JSON::Field(key: "RequestTokenARN")]
        getter request_token_arn : String?

        # The details of the response.

        @[JSON::Field(key: "ResponseDetails")]
        getter response_details : Types::AsyncResponseDetails?

        def initialize(
          @creation_time : Time? = nil,
          @operation : String? = nil,
          @request_parameters : Types::AsyncRequestParameters? = nil,
          @request_status : String? = nil,
          @request_token_arn : String? = nil,
          @response_details : Types::AsyncResponseDetails? = nil
        )
        end
      end

      # A container for the request parameters associated with an asynchronous request.

      struct AsyncRequestParameters
        include JSON::Serializable

        # A container of the parameters for a CreateMultiRegionAccessPoint request.

        @[JSON::Field(key: "CreateMultiRegionAccessPointRequest")]
        getter create_multi_region_access_point_request : Types::CreateMultiRegionAccessPointInput?

        # A container of the parameters for a DeleteMultiRegionAccessPoint request.

        @[JSON::Field(key: "DeleteMultiRegionAccessPointRequest")]
        getter delete_multi_region_access_point_request : Types::DeleteMultiRegionAccessPointInput?

        # A container of the parameters for a PutMultiRegionAccessPoint request.

        @[JSON::Field(key: "PutMultiRegionAccessPointPolicyRequest")]
        getter put_multi_region_access_point_policy_request : Types::PutMultiRegionAccessPointPolicyInput?

        def initialize(
          @create_multi_region_access_point_request : Types::CreateMultiRegionAccessPointInput? = nil,
          @delete_multi_region_access_point_request : Types::DeleteMultiRegionAccessPointInput? = nil,
          @put_multi_region_access_point_policy_request : Types::PutMultiRegionAccessPointPolicyInput? = nil
        )
        end
      end

      # A container for the response details that are returned when querying about an asynchronous request.

      struct AsyncResponseDetails
        include JSON::Serializable

        # Error details for an asynchronous request.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::AsyncErrorDetails?

        # The details for the Multi-Region Access Point.

        @[JSON::Field(key: "MultiRegionAccessPointDetails")]
        getter multi_region_access_point_details : Types::MultiRegionAccessPointsAsyncResponse?

        def initialize(
          @error_details : Types::AsyncErrorDetails? = nil,
          @multi_region_access_point_details : Types::MultiRegionAccessPointsAsyncResponse? = nil
        )
        end
      end

      # Lambda function used to transform objects through an Object Lambda Access Point.

      struct AwsLambdaTransformation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function.

        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # Additional JSON that provides supplemental data to the Lambda function used to transform objects.

        @[JSON::Field(key: "FunctionPayload")]
        getter function_payload : String?

        def initialize(
          @function_arn : String,
          @function_payload : String? = nil
        )
        end
      end


      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested Outposts bucket name is not available. The bucket namespace is shared by all users of
      # the Outposts in this Region. Select a different name and try again.

      struct BucketAlreadyExists
        include JSON::Serializable

        def initialize
        end
      end

      # The Outposts bucket you tried to create already exists, and you own it.

      struct BucketAlreadyOwnedByYou
        include JSON::Serializable

        def initialize
        end
      end

      # A container for the bucket-level configuration for Amazon S3 Storage Lens. For more information
      # about S3 Storage Lens, see Assessing your storage activity and usage with S3 Storage Lens in the
      # Amazon S3 User Guide .

      struct BucketLevel
        include JSON::Serializable

        # A container for the bucket-level activity metrics for S3 Storage Lens.

        @[JSON::Field(key: "ActivityMetrics")]
        getter activity_metrics : Types::ActivityMetrics?

        # A container for bucket-level advanced cost-optimization metrics for S3 Storage Lens.

        @[JSON::Field(key: "AdvancedCostOptimizationMetrics")]
        getter advanced_cost_optimization_metrics : Types::AdvancedCostOptimizationMetrics?

        # A container for bucket-level advanced data-protection metrics for S3 Storage Lens.

        @[JSON::Field(key: "AdvancedDataProtectionMetrics")]
        getter advanced_data_protection_metrics : Types::AdvancedDataProtectionMetrics?

        # A container for bucket-level advanced performance metrics for S3 Storage Lens.

        @[JSON::Field(key: "AdvancedPerformanceMetrics")]
        getter advanced_performance_metrics : Types::AdvancedPerformanceMetrics?

        # A container for bucket-level detailed status code metrics for S3 Storage Lens.

        @[JSON::Field(key: "DetailedStatusCodesMetrics")]
        getter detailed_status_codes_metrics : Types::DetailedStatusCodesMetrics?

        # A container for the prefix-level metrics for S3 Storage Lens.

        @[JSON::Field(key: "PrefixLevel")]
        getter prefix_level : Types::PrefixLevel?

        def initialize(
          @activity_metrics : Types::ActivityMetrics? = nil,
          @advanced_cost_optimization_metrics : Types::AdvancedCostOptimizationMetrics? = nil,
          @advanced_data_protection_metrics : Types::AdvancedDataProtectionMetrics? = nil,
          @advanced_performance_metrics : Types::AdvancedPerformanceMetrics? = nil,
          @detailed_status_codes_metrics : Types::DetailedStatusCodesMetrics? = nil,
          @prefix_level : Types::PrefixLevel? = nil
        )
        end
      end

      # A container for enabling Amazon CloudWatch publishing for S3 Storage Lens metrics. For more
      # information about publishing S3 Storage Lens metrics to CloudWatch, see Monitor S3 Storage Lens
      # metrics in CloudWatch in the Amazon S3 User Guide .

      struct CloudWatchMetrics
        include JSON::Serializable

        # A container that indicates whether CloudWatch publishing for S3 Storage Lens metrics is enabled. A
        # value of true indicates that CloudWatch publishing for S3 Storage Lens metrics is enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool

        def initialize(
          @is_enabled : Bool
        )
        end
      end


      struct CreateAccessGrantRequest
        include JSON::Serializable

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register. If you are passing the
        # default location, you cannot create an access grant for the entire default location. You must also
        # specify a bucket or a bucket and prefix in the Subprefix field.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The user, group, or role to which you are granting access. You can grant access to an IAM user or
        # role. If you have added your corporate directory to Amazon Web Services IAM Identity Center and
        # associated your Identity Center instance with your S3 Access Grants instance, the grantee can also
        # be a corporate directory user or group.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee

        # The type of access that you are granting to your S3 data, which can be set to one of the following
        # values: READ – Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3
        # data. READWRITE – Grant both read and write access to the S3 data.

        @[JSON::Field(key: "Permission")]
        getter permission : String

        # The configuration options of the grant location. The grant location is the S3 path to the data to
        # which you are granting access. It contains the S3SubPrefix field. The grant scope is the result of
        # appending the subprefix to the location scope of the registered location.

        @[JSON::Field(key: "AccessGrantsLocationConfiguration")]
        getter access_grants_location_configuration : Types::AccessGrantsLocationConfiguration?

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If an application ARN is included in the request to create an
        # access grant, the grantee can only access the S3 data through this application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The type of S3SubPrefix . The only possible value is Object . Pass this value if the access grant
        # scope is an object. Do not pass this value if the access grant scope is a bucket or a bucket and a
        # prefix.

        @[JSON::Field(key: "S3PrefixType")]
        getter s3_prefix_type : String?

        # The Amazon Web Services resource tags that you are adding to the access grant. Each tag is a label
        # consisting of a user-defined key and value. Tags can help you manage, identify, organize, search
        # for, and filter resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_grants_location_id : String,
          @account_id : String,
          @grantee : Types::Grantee,
          @permission : String,
          @access_grants_location_configuration : Types::AccessGrantsLocationConfiguration? = nil,
          @application_arn : String? = nil,
          @s3_prefix_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAccessGrantResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access grant.

        @[JSON::Field(key: "AccessGrantArn")]
        getter access_grant_arn : String?

        # The ID of the access grant. S3 Access Grants auto-generates this ID when you create the access
        # grant.

        @[JSON::Field(key: "AccessGrantId")]
        getter access_grant_id : String?

        # The configuration options of the grant location. The grant location is the S3 path to the data to
        # which you are granting access.

        @[JSON::Field(key: "AccessGrantsLocationConfiguration")]
        getter access_grants_location_configuration : Types::AccessGrantsLocationConfiguration?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If the grant includes an application ARN, the grantee can only
        # access the S3 data through this application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The date and time when you created the access grant.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The S3 path of the data to which you are granting access. It is the result of appending the
        # Subprefix to the location scope.

        @[JSON::Field(key: "GrantScope")]
        getter grant_scope : String?

        # The user, group, or role to which you are granting access. You can grant access to an IAM user or
        # role. If you have added your corporate directory to Amazon Web Services IAM Identity Center and
        # associated your Identity Center instance with your S3 Access Grants instance, the grantee can also
        # be a corporate directory user or group.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # The type of access that you are granting to your S3 data, which can be set to one of the following
        # values: READ – Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3
        # data. READWRITE – Grant both read and write access to the S3 data.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @access_grant_arn : String? = nil,
          @access_grant_id : String? = nil,
          @access_grants_location_configuration : Types::AccessGrantsLocationConfiguration? = nil,
          @access_grants_location_id : String? = nil,
          @application_arn : String? = nil,
          @created_at : Time? = nil,
          @grant_scope : String? = nil,
          @grantee : Types::Grantee? = nil,
          @permission : String? = nil
        )
        end
      end


      struct CreateAccessGrantsInstanceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # If you would like to associate your S3 Access Grants instance with an Amazon Web Services IAM
        # Identity Center instance, use this field to pass the Amazon Resource Name (ARN) of the Amazon Web
        # Services IAM Identity Center instance that you are associating with your S3 Access Grants instance.
        # An IAM Identity Center instance is your corporate identity directory that you added to the IAM
        # Identity Center. You can use the ListInstances API operation to retrieve a list of your Identity
        # Center instances and their ARNs.

        @[JSON::Field(key: "IdentityCenterArn")]
        getter identity_center_arn : String?

        # The Amazon Web Services resource tags that you are adding to the S3 Access Grants instance. Each tag
        # is a label consisting of a user-defined key and value. Tags can help you manage, identify, organize,
        # search for, and filter resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String,
          @identity_center_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAccessGrantsInstanceResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance that you are
        # associating with your S3 Access Grants instance. An IAM Identity Center instance is your corporate
        # identity directory that you added to the IAM Identity Center. You can use the ListInstances API
        # operation to retrieve a list of your Identity Center instances and their ARNs.

        @[JSON::Field(key: "AccessGrantsInstanceArn")]
        getter access_grants_instance_arn : String?

        # The ID of the S3 Access Grants instance. The ID is default . You can have one S3 Access Grants
        # instance per Region per account.

        @[JSON::Field(key: "AccessGrantsInstanceId")]
        getter access_grants_instance_id : String?

        # The date and time when you created the S3 Access Grants instance.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterArn")]
        getter identity_center_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance that you are
        # associating with your S3 Access Grants instance. An IAM Identity Center instance is your corporate
        # identity directory that you added to the IAM Identity Center. You can use the ListInstances API
        # operation to retrieve a list of your Identity Center instances and their ARNs.

        @[JSON::Field(key: "IdentityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        def initialize(
          @access_grants_instance_arn : String? = nil,
          @access_grants_instance_id : String? = nil,
          @created_at : Time? = nil,
          @identity_center_application_arn : String? = nil,
          @identity_center_arn : String? = nil,
          @identity_center_instance_arn : String? = nil
        )
        end
      end


      struct CreateAccessGrantsLocationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the IAM role for the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String

        # The S3 path to the location that you are registering. The location scope can be the default S3
        # location s3:// , the S3 path to a bucket s3://&lt;bucket&gt; , or the S3 path to a bucket and prefix
        # s3://&lt;bucket&gt;/&lt;prefix&gt; . A prefix in S3 is a string of characters at the beginning of an
        # object key name used to organize the objects that you store in your S3 buckets. For example, object
        # key names that start with the engineering/ prefix or object key names that start with the
        # marketing/campaigns/ prefix.

        @[JSON::Field(key: "LocationScope")]
        getter location_scope : String

        # The Amazon Web Services resource tags that you are adding to the S3 Access Grants location. Each tag
        # is a label consisting of a user-defined key and value. Tags can help you manage, identify, organize,
        # search for, and filter resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String,
          @iam_role_arn : String,
          @location_scope : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAccessGrantsLocationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the location you are registering.

        @[JSON::Field(key: "AccessGrantsLocationArn")]
        getter access_grants_location_arn : String?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The date and time when you registered the location.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role for the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String?

        # The S3 URI path to the location that you are registering. The location scope can be the default S3
        # location s3:// , the S3 path to a bucket, or the S3 path to a bucket and prefix. A prefix in S3 is a
        # string of characters at the beginning of an object key name used to organize the objects that you
        # store in your S3 buckets. For example, object key names that start with the engineering/ prefix or
        # object key names that start with the marketing/campaigns/ prefix.

        @[JSON::Field(key: "LocationScope")]
        getter location_scope : String?

        def initialize(
          @access_grants_location_arn : String? = nil,
          @access_grants_location_id : String? = nil,
          @created_at : Time? = nil,
          @iam_role_arn : String? = nil,
          @location_scope : String? = nil
        )
        end
      end


      struct CreateAccessPointForObjectLambdaRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for owner of the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Object Lambda Access Point configuration as a JSON document.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ObjectLambdaConfiguration

        # The name you want to assign to this Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @configuration : Types::ObjectLambdaConfiguration,
          @name : String
        )
        end
      end


      struct CreateAccessPointForObjectLambdaResult
        include JSON::Serializable

        # The alias of the Object Lambda Access Point.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::ObjectLambdaAccessPointAlias?

        # Specifies the ARN for the Object Lambda Access Point.

        @[JSON::Field(key: "ObjectLambdaAccessPointArn")]
        getter object_lambda_access_point_arn : String?

        def initialize(
          @alias : Types::ObjectLambdaAccessPointAlias? = nil,
          @object_lambda_access_point_arn : String? = nil
        )
        end
      end


      struct CreateAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the bucket that you want to associate this access point with. For using this parameter
        # with Amazon S3 on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as
        # well. For using this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you
        # must specify the ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The name you want to assign to this access point. For directory buckets, the access point name must
        # consist of a base name that you provide and suffix that includes the ZoneID (Amazon Web Services
        # Availability Zone or Local Zone) of your bucket location, followed by --xa-s3 . For more
        # information, see Managing access to shared datasets in directory buckets with access points in the
        # Amazon S3 User Guide .

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account ID associated with the S3 bucket associated with this access point.
        # For same account access point when your bucket and access point belong to the same account owner,
        # the BucketAccountId is not required. For cross-account access point when your bucket and access
        # point are not in the same account, the BucketAccountId is required.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        # The PublicAccessBlock configuration that you want to apply to the access point.

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration?

        # For directory buckets, you can filter access control to specific prefixes, API operations, or a
        # combination of both. For more information, see Managing access to shared datasets in directory
        # buckets with access points in the Amazon S3 User Guide . Scope is only supported for access points
        # attached to directory buckets.

        @[JSON::Field(key: "Scope")]
        getter scope : Types::Scope?

        # An array of tags that you can apply to an access point. Tags are key-value pairs of metadata used to
        # control access to your access points. For more information about tags, see Using tags with Amazon S3
        # . For information about tagging access points, see Using tags for attribute-based access control
        # (ABAC) .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # If you include this field, Amazon S3 restricts access to this access point to requests from the
        # specified virtual private cloud (VPC). This is required for creating an access point for Amazon S3
        # on Outposts buckets.

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @account_id : String,
          @bucket : String,
          @name : String,
          @bucket_account_id : String? = nil,
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil,
          @scope : Types::Scope? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end


      struct CreateAccessPointResult
        include JSON::Serializable

        # The ARN of the access point. This is only supported by Amazon S3 on Outposts.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # The name or alias of the access point.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        def initialize(
          @access_point_arn : String? = nil,
          @alias : String? = nil
        )
        end
      end

      # The container for the bucket configuration. This is not supported by Amazon S3 on Outposts buckets.

      struct CreateBucketConfiguration
        include JSON::Serializable

        # Specifies the Region where the bucket will be created. If you are creating a bucket on the US East
        # (N. Virginia) Region (us-east-1), you do not need to specify the location. This is not supported by
        # Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "LocationConstraint")]
        getter location_constraint : String?

        def initialize(
          @location_constraint : String? = nil
        )
        end
      end


      struct CreateBucketRequest
        include JSON::Serializable

        # The name of the bucket.

        @[JSON::Field(key: "name")]
        getter bucket : String

        # The canned ACL to apply to the bucket. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-acl")]
        getter acl : String?

        # The configuration information for the bucket. This is not supported by Amazon S3 on Outposts
        # buckets.

        @[JSON::Field(key: "CreateBucketConfiguration")]
        getter create_bucket_configuration : Types::CreateBucketConfiguration?

        # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket. This is not
        # supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-grant-full-control")]
        getter grant_full_control : String?

        # Allows grantee to list the objects in the bucket. This is not supported by Amazon S3 on Outposts
        # buckets.

        @[JSON::Field(key: "x-amz-grant-read")]
        getter grant_read : String?

        # Allows grantee to read the bucket ACL. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-grant-read-acp")]
        getter grant_read_acp : String?

        # Allows grantee to create, overwrite, and delete any object in the bucket. This is not supported by
        # Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-grant-write")]
        getter grant_write : String?

        # Allows grantee to write the ACL for the applicable bucket. This is not supported by Amazon S3 on
        # Outposts buckets.

        @[JSON::Field(key: "x-amz-grant-write-acp")]
        getter grant_write_acp : String?

        # Specifies whether you want S3 Object Lock to be enabled for the new bucket. This is not supported by
        # Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-bucket-object-lock-enabled")]
        getter object_lock_enabled_for_bucket : Bool?

        # The ID of the Outposts where the bucket is being created. This ID is required by Amazon S3 on
        # Outposts buckets.

        @[JSON::Field(key: "x-amz-outpost-id")]
        getter outpost_id : String?

        def initialize(
          @bucket : String,
          @acl : String? = nil,
          @create_bucket_configuration : Types::CreateBucketConfiguration? = nil,
          @grant_full_control : String? = nil,
          @grant_read : String? = nil,
          @grant_read_acp : String? = nil,
          @grant_write : String? = nil,
          @grant_write_acp : String? = nil,
          @object_lock_enabled_for_bucket : Bool? = nil,
          @outpost_id : String? = nil
        )
        end
      end


      struct CreateBucketResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the bucket. For using this parameter with Amazon S3 on Outposts
        # with the REST API, you must specify the name and the x-amz-outpost-id as well. For using this
        # parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the ARN of
        # the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "BucketArn")]
        getter bucket_arn : String?

        # The location of the bucket.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @bucket_arn : String? = nil,
          @location : String? = nil
        )
        end
      end


      struct CreateJobRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that creates the job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # An idempotency token to ensure that you don't accidentally submit the same request twice. You can
        # use any string up to the maximum length.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The action that you want this job to perform on every object listed in the manifest. For more
        # information about the available actions, see Operations in the Amazon S3 User Guide .

        @[JSON::Field(key: "Operation")]
        getter operation : Types::JobOperation

        # The numerical priority for this job. Higher numbers indicate higher priority.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # Configuration parameters for the optional job-completion report.

        @[JSON::Field(key: "Report")]
        getter report : Types::JobReport

        # The Amazon Resource Name (ARN) for the Identity and Access Management (IAM) role that Batch
        # Operations will use to run this job's action on every object in the manifest.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Indicates whether confirmation is required before Amazon S3 runs the job. Confirmation is only
        # required for jobs created through the Amazon S3 console.

        @[JSON::Field(key: "ConfirmationRequired")]
        getter confirmation_required : Bool?

        # A description for this job. You can use any string within the permitted length. Descriptions don't
        # need to be unique and can be used for multiple jobs.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Configuration parameters for the manifest.

        @[JSON::Field(key: "Manifest")]
        getter manifest : Types::JobManifest?

        # The attribute container for the ManifestGenerator details. Jobs must be created with either a
        # manifest file or a ManifestGenerator, but not both.

        @[JSON::Field(key: "ManifestGenerator")]
        getter manifest_generator : Types::JobManifestGenerator?

        # A set of tags to associate with the S3 Batch Operations job. This is an optional parameter.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)?

        def initialize(
          @account_id : String,
          @client_request_token : String,
          @operation : Types::JobOperation,
          @priority : Int32,
          @report : Types::JobReport,
          @role_arn : String,
          @confirmation_required : Bool? = nil,
          @description : String? = nil,
          @manifest : Types::JobManifest? = nil,
          @manifest_generator : Types::JobManifestGenerator? = nil,
          @tags : Array(Types::S3Tag)? = nil
        )
        end
      end


      struct CreateJobResult
        include JSON::Serializable

        # The ID for this job. Amazon S3 generates this ID automatically and returns it after a successful
        # Create Job request.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # A container for the information associated with a CreateMultiRegionAccessPoint request.

      struct CreateMultiRegionAccessPointInput
        include JSON::Serializable

        # The name of the Multi-Region Access Point associated with this request.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The buckets in different Regions that are associated with the Multi-Region Access Point.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::Region)


        @[JSON::Field(key: "PublicAccessBlock")]
        getter public_access_block : Types::PublicAccessBlockConfiguration?

        def initialize(
          @name : String,
          @regions : Array(Types::Region),
          @public_access_block : Types::PublicAccessBlockConfiguration? = nil
        )
        end
      end


      struct CreateMultiRegionAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point. The owner of the
        # Multi-Region Access Point also must own the underlying buckets.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # An idempotency token used to identify the request and guarantee that requests are unique.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # A container element containing details about the Multi-Region Access Point.

        @[JSON::Field(key: "Details")]
        getter details : Types::CreateMultiRegionAccessPointInput

        def initialize(
          @account_id : String,
          @client_token : String,
          @details : Types::CreateMultiRegionAccessPointInput
        )
        end
      end


      struct CreateMultiRegionAccessPointResult
        include JSON::Serializable

        # The request token associated with the request. You can use this token with
        # DescribeMultiRegionAccessPointOperation to determine the status of asynchronous requests.

        @[JSON::Field(key: "RequestTokenARN")]
        getter request_token_arn : String?

        def initialize(
          @request_token_arn : String? = nil
        )
        end
      end


      struct CreateStorageLensGroupRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that the Storage Lens group is created from and associated with.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Storage Lens group configuration.

        @[JSON::Field(key: "StorageLensGroup")]
        getter storage_lens_group : Types::StorageLensGroup

        # The Amazon Web Services resource tags that you're adding to your Storage Lens group. This parameter
        # is optional.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @account_id : String,
          @storage_lens_group : Types::StorageLensGroup,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The Amazon Web Services Security Token Service temporary credential that S3 Access Grants vends to
      # grantees and client applications.

      struct Credentials
        include JSON::Serializable

        # The unique access key ID of the Amazon Web Services STS temporary credential that S3 Access Grants
        # vends to grantees and client applications.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The expiration date and time of the temporary credential that S3 Access Grants vends to grantees and
        # client applications.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Time?

        # The secret access key of the Amazon Web Services STS temporary credential that S3 Access Grants
        # vends to grantees and client applications.

        @[JSON::Field(key: "SecretAccessKey")]
        getter secret_access_key : String?

        # The Amazon Web Services STS temporary credential that S3 Access Grants vends to grantees and client
        # applications.

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # A filter that returns objects that are encrypted by dual-layer server-side encryption with Amazon
      # Web Services Key Management Service (KMS) keys (DSSE-KMS). You can further refine your filtering by
      # optionally providing a KMS Key ARN to filter objects encrypted by a specific key.

      struct DSSEKMSFilter
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the customer managed KMS key to use for the filter to return
        # objects that are encrypted by the specified key. For best performance, use keys in the same Region
        # as the S3 Batch Operations job.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @kms_key_arn : String? = nil
        )
        end
      end


      struct DeleteAccessGrantRequest
        include JSON::Serializable

        # The ID of the access grant. S3 Access Grants auto-generates this ID when you create the access
        # grant.

        @[JSON::Field(key: "id")]
        getter access_grant_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @access_grant_id : String,
          @account_id : String
        )
        end
      end


      struct DeleteAccessGrantsInstanceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DeleteAccessGrantsInstanceResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DeleteAccessGrantsLocationRequest
        include JSON::Serializable

        # The ID of the registered location that you are deregistering from your S3 Access Grants instance. S3
        # Access Grants assigned this ID when you registered the location. S3 Access Grants assigns the ID
        # default to the default location s3:// and assigns an auto-generated ID to other locations that you
        # register.

        @[JSON::Field(key: "id")]
        getter access_grants_location_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @access_grants_location_id : String,
          @account_id : String
        )
        end
      end


      struct DeleteAccessPointForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point you want to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DeleteAccessPointPolicyForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point you want to delete the policy for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DeleteAccessPointPolicyRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point whose policy you want to delete. For using this parameter with Amazon
        # S3 on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as well. For
        # using this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify
        # the ARN of the access point accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;
        # . For example, to access the access point reports-ap through Outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap . The value
        # must be URL encoded.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DeleteAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point you want to delete. For using this parameter with Amazon S3 on Outposts
        # with the REST API, you must specify the name and the x-amz-outpost-id as well. For using this
        # parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the ARN of
        # the access point accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;
        # . For example, to access the access point reports-ap through Outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap . The value
        # must be URL encoded.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DeleteAccessPointScopeRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the access point with the scope that you want to
        # delete.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point with the scope that you want to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DeleteBucketLifecycleConfigurationRequest
        include JSON::Serializable

        # The account ID of the lifecycle configuration to delete.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct DeleteBucketPolicyRequest
        include JSON::Serializable

        # The account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct DeleteBucketReplicationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket to delete the replication configuration
        # for.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the S3 on Outposts bucket to delete the replication configuration for. For using this
        # parameter with Amazon S3 on Outposts with the REST API, you must specify the name and the
        # x-amz-outpost-id as well. For using this parameter with S3 on Outposts with the Amazon Web Services
        # SDK and CLI, you must specify the ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct DeleteBucketRequest
        include JSON::Serializable

        # The account ID that owns the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket being deleted. For using this parameter with Amazon S3 on Outposts with the
        # REST API, you must specify the name and the x-amz-outpost-id as well. For using this parameter with
        # S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket
        # accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct DeleteBucketTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket tag set to be removed.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The bucket ARN that has the tag set to be removed. For using this parameter with Amazon S3 on
        # Outposts with the REST API, you must specify the name and the x-amz-outpost-id as well. For using
        # this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the
        # ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct DeleteJobTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID for the S3 Batch Operations job whose tags you want to delete.

        @[JSON::Field(key: "id")]
        getter job_id : String

        def initialize(
          @account_id : String,
          @job_id : String
        )
        end
      end


      struct DeleteJobTaggingResult
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies whether S3 on Outposts replicates delete markers. If you specify a Filter element in your
      # replication configuration, you must also include a DeleteMarkerReplication element. If your Filter
      # includes a Tag element, the DeleteMarkerReplication element's Status child element must be set to
      # Disabled , because S3 on Outposts does not support replicating delete markers for tag-based rules.
      # For more information about delete marker replication, see How delete operations affect replication
      # in the Amazon S3 User Guide .

      struct DeleteMarkerReplication
        include JSON::Serializable

        # Indicates whether to replicate delete markers.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # A container for the information associated with a DeleteMultiRegionAccessPoint request.

      struct DeleteMultiRegionAccessPointInput
        include JSON::Serializable

        # The name of the Multi-Region Access Point associated with this request.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteMultiRegionAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # An idempotency token used to identify the request and guarantee that requests are unique.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # A container element containing details about the Multi-Region Access Point.

        @[JSON::Field(key: "Details")]
        getter details : Types::DeleteMultiRegionAccessPointInput

        def initialize(
          @account_id : String,
          @client_token : String,
          @details : Types::DeleteMultiRegionAccessPointInput
        )
        end
      end


      struct DeleteMultiRegionAccessPointResult
        include JSON::Serializable

        # The request token associated with the request. You can use this token with
        # DescribeMultiRegionAccessPointOperation to determine the status of asynchronous requests.

        @[JSON::Field(key: "RequestTokenARN")]
        getter request_token_arn : String?

        def initialize(
          @request_token_arn : String? = nil
        )
        end
      end


      struct DeletePublicAccessBlockRequest
        include JSON::Serializable

        # The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to
        # remove.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DeleteStorageLensConfigurationRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        def initialize(
          @account_id : String,
          @config_id : String
        )
        end
      end


      struct DeleteStorageLensConfigurationTaggingRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        def initialize(
          @account_id : String,
          @config_id : String
        )
        end
      end


      struct DeleteStorageLensConfigurationTaggingResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteStorageLensGroupRequest
        include JSON::Serializable

        # The Amazon Web Services account ID used to create the Storage Lens group that you're trying to
        # delete.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Storage Lens group that you're trying to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct DescribeJobRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID for the job whose information you want to retrieve.

        @[JSON::Field(key: "id")]
        getter job_id : String

        def initialize(
          @account_id : String,
          @job_id : String
        )
        end
      end


      struct DescribeJobResult
        include JSON::Serializable

        # Contains the configuration parameters and status for the job specified in the Describe Job request.

        @[JSON::Field(key: "Job")]
        getter job : Types::JobDescriptor?

        def initialize(
          @job : Types::JobDescriptor? = nil
        )
        end
      end


      struct DescribeMultiRegionAccessPointOperationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The request token associated with the request you want to know about. This request token is returned
        # as part of the response when you make an asynchronous request. You provide this token to query about
        # the status of the asynchronous action.

        @[JSON::Field(key: "request_token")]
        getter request_token_arn : String

        def initialize(
          @account_id : String,
          @request_token_arn : String
        )
        end
      end


      struct DescribeMultiRegionAccessPointOperationResult
        include JSON::Serializable

        # A container element containing the details of the asynchronous operation.

        @[JSON::Field(key: "AsyncOperation")]
        getter async_operation : Types::AsyncOperation?

        def initialize(
          @async_operation : Types::AsyncOperation? = nil
        )
        end
      end

      # Specifies information about the replication destination bucket and its settings for an S3 on
      # Outposts replication configuration.

      struct Destination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access point for the destination bucket where you want S3 on
        # Outposts to store the replication results.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # Specify this property only in a cross-account scenario (where the source and destination bucket
        # owners are not the same), and you want to change replica ownership to the Amazon Web Services
        # account that owns the destination bucket. If this property is not specified in the replication
        # configuration, the replicas are owned by same Amazon Web Services account that owns the source
        # object. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "AccessControlTranslation")]
        getter access_control_translation : Types::AccessControlTranslation?

        # The destination bucket owner's account ID.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # A container that provides information about encryption. If SourceSelectionCriteria is specified, you
        # must specify this element. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A container that specifies replication metrics-related settings.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::Metrics?

        # A container that specifies S3 Replication Time Control (S3 RTC) settings, including whether S3 RTC
        # is enabled and the time when all objects and operations on objects must be replicated. Must be
        # specified together with a Metrics block. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "ReplicationTime")]
        getter replication_time : Types::ReplicationTime?

        # The storage class to use when replicating objects. All objects stored on S3 on Outposts are stored
        # in the OUTPOSTS storage class. S3 on Outposts uses the OUTPOSTS storage class to create the object
        # replicas. Values other than OUTPOSTS aren't supported by Amazon S3 on Outposts.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @bucket : String,
          @access_control_translation : Types::AccessControlTranslation? = nil,
          @account : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @metrics : Types::Metrics? = nil,
          @replication_time : Types::ReplicationTime? = nil,
          @storage_class : String? = nil
        )
        end
      end

      # The container element for Amazon S3 Storage Lens detailed status code metrics. Detailed status code
      # metrics generate metrics for HTTP status codes, such as 200 OK , 403 Forbidden , 503 Service
      # Unavailable and others. For more information about S3 Storage Lens, see Assessing your storage
      # activity and usage with S3 Storage Lens in the Amazon S3 User Guide . For a complete list of S3
      # Storage Lens metrics, see S3 Storage Lens metrics glossary in the Amazon S3 User Guide .

      struct DetailedStatusCodesMetrics
        include JSON::Serializable

        # A container that indicates whether detailed status code metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @is_enabled : Bool? = nil
        )
        end
      end


      struct DissociateAccessGrantsIdentityCenterRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Specifies encryption-related information for an Amazon S3 bucket that is a destination for
      # replicated objects. If you're specifying a customer managed KMS key, we recommend using a fully
      # qualified KMS key ARN. If you use a KMS key alias instead, then KMS resolves the key within the
      # requester’s account. This behavior can result in data that's encrypted with a KMS key that belongs
      # to the requester, and not the bucket owner. This is not supported by Amazon S3 on Outposts buckets.

      struct EncryptionConfiguration
        include JSON::Serializable

        # Specifies the ID of the customer managed KMS key that's stored in Key Management Service (KMS) for
        # the destination bucket. This ID is either the Amazon Resource Name (ARN) for the KMS key or the
        # alias ARN for the KMS key. Amazon S3 uses this KMS key to encrypt replica objects. Amazon S3
        # supports only symmetric encryption KMS keys. For more information, see Symmetric encryption KMS keys
        # in the Amazon Web Services Key Management Service Developer Guide .

        @[JSON::Field(key: "ReplicaKmsKeyID")]
        getter replica_kms_key_id : String?

        def initialize(
          @replica_kms_key_id : String? = nil
        )
        end
      end

      # The last established access control policy for a Multi-Region Access Point. When you update the
      # policy, the update is first listed as the proposed policy. After the update is finished and all
      # Regions have been updated, the proposed policy is listed as the established policy. If both policies
      # have the same version number, the proposed policy is the established policy.

      struct EstablishedMultiRegionAccessPointPolicy
        include JSON::Serializable

        # The details of the last established policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # A container for what Amazon S3 Storage Lens will exclude.

      struct Exclude
        include JSON::Serializable

        # A container for the S3 Storage Lens bucket excludes.

        @[JSON::Field(key: "Buckets")]
        getter buckets : Array(String)?

        # A container for the S3 Storage Lens Region excludes.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @buckets : Array(String)? = nil,
          @regions : Array(String)? = nil
        )
        end
      end

      # An optional configuration to replicate existing source bucket objects. This is not supported by
      # Amazon S3 on Outposts buckets.

      struct ExistingObjectReplication
        include JSON::Serializable

        # Specifies whether Amazon S3 replicates existing source bucket objects.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # The encryption configuration to use when storing the generated manifest.

      struct GeneratedManifestEncryption
        include JSON::Serializable

        # Configuration details on how SSE-KMS is used to encrypt generated manifest objects.

        @[JSON::Field(key: "SSE-KMS")]
        getter ssekms : Types::SSEKMSEncryption?

        # Specifies the use of SSE-S3 to encrypt generated manifest objects.

        @[JSON::Field(key: "SSE-S3")]
        getter sses3 : Types::SSES3Encryption?

        def initialize(
          @ssekms : Types::SSEKMSEncryption? = nil,
          @sses3 : Types::SSES3Encryption? = nil
        )
        end
      end


      struct GetAccessGrantRequest
        include JSON::Serializable

        # The ID of the access grant. S3 Access Grants auto-generates this ID when you create the access
        # grant.

        @[JSON::Field(key: "id")]
        getter access_grant_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @access_grant_id : String,
          @account_id : String
        )
        end
      end


      struct GetAccessGrantResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access grant.

        @[JSON::Field(key: "AccessGrantArn")]
        getter access_grant_arn : String?

        # The ID of the access grant. S3 Access Grants auto-generates this ID when you create the access
        # grant.

        @[JSON::Field(key: "AccessGrantId")]
        getter access_grant_id : String?

        # The configuration options of the grant location. The grant location is the S3 path to the data to
        # which you are granting access.

        @[JSON::Field(key: "AccessGrantsLocationConfiguration")]
        getter access_grants_location_configuration : Types::AccessGrantsLocationConfiguration?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If the grant includes an application ARN, the grantee can only
        # access the S3 data through this application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The date and time when you created the access grant.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The S3 path of the data to which you are granting access. It is the result of appending the
        # Subprefix to the location scope.

        @[JSON::Field(key: "GrantScope")]
        getter grant_scope : String?

        # The user, group, or role to which you are granting access. You can grant access to an IAM user or
        # role. If you have added a corporate directory to Amazon Web Services IAM Identity Center and
        # associated this Identity Center instance with the S3 Access Grants instance, the grantee can also be
        # a corporate directory user or group.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # The type of permission that was granted in the access grant. Can be one of the following values:
        # READ – Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3 data.
        # READWRITE – Grant both read and write access to the S3 data.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @access_grant_arn : String? = nil,
          @access_grant_id : String? = nil,
          @access_grants_location_configuration : Types::AccessGrantsLocationConfiguration? = nil,
          @access_grants_location_id : String? = nil,
          @application_arn : String? = nil,
          @created_at : Time? = nil,
          @grant_scope : String? = nil,
          @grantee : Types::Grantee? = nil,
          @permission : String? = nil
        )
        end
      end


      struct GetAccessGrantsInstanceForPrefixRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services account that is making this request.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The S3 prefix of the access grants that you would like to retrieve.

        @[JSON::Field(key: "s3prefix")]
        getter s3_prefix : String

        def initialize(
          @account_id : String,
          @s3_prefix : String
        )
        end
      end


      struct GetAccessGrantsInstanceForPrefixResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Access Grants instance.

        @[JSON::Field(key: "AccessGrantsInstanceArn")]
        getter access_grants_instance_arn : String?

        # The ID of the S3 Access Grants instance. The ID is default . You can have one S3 Access Grants
        # instance per Region per account.

        @[JSON::Field(key: "AccessGrantsInstanceId")]
        getter access_grants_instance_id : String?

        def initialize(
          @access_grants_instance_arn : String? = nil,
          @access_grants_instance_id : String? = nil
        )
        end
      end


      struct GetAccessGrantsInstanceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetAccessGrantsInstanceResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetAccessGrantsInstanceResourcePolicyResult
        include JSON::Serializable

        # The date and time when you created the S3 Access Grants instance resource policy.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Organization of the resource policy of the S3 Access Grants instance.

        @[JSON::Field(key: "Organization")]
        getter organization : String?

        # The resource policy of the S3 Access Grants instance.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @created_at : Time? = nil,
          @organization : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct GetAccessGrantsInstanceResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Access Grants instance.

        @[JSON::Field(key: "AccessGrantsInstanceArn")]
        getter access_grants_instance_arn : String?

        # The ID of the S3 Access Grants instance. The ID is default . You can have one S3 Access Grants
        # instance per Region per account.

        @[JSON::Field(key: "AccessGrantsInstanceId")]
        getter access_grants_instance_id : String?

        # The date and time when you created the S3 Access Grants instance.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterArn")]
        getter identity_center_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance that you are
        # associating with your S3 Access Grants instance. An IAM Identity Center instance is your corporate
        # identity directory that you added to the IAM Identity Center. You can use the ListInstances API
        # operation to retrieve a list of your Identity Center instances and their ARNs.

        @[JSON::Field(key: "IdentityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        def initialize(
          @access_grants_instance_arn : String? = nil,
          @access_grants_instance_id : String? = nil,
          @created_at : Time? = nil,
          @identity_center_application_arn : String? = nil,
          @identity_center_arn : String? = nil,
          @identity_center_instance_arn : String? = nil
        )
        end
      end


      struct GetAccessGrantsLocationRequest
        include JSON::Serializable

        # The ID of the registered location that you are retrieving. S3 Access Grants assigns this ID when you
        # register the location. S3 Access Grants assigns the ID default to the default location s3:// and
        # assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "id")]
        getter access_grants_location_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @access_grants_location_id : String,
          @account_id : String
        )
        end
      end


      struct GetAccessGrantsLocationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the registered location.

        @[JSON::Field(key: "AccessGrantsLocationArn")]
        getter access_grants_location_arn : String?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The date and time when you registered the location.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role for the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String?

        # The S3 URI path to the registered location. The location scope can be the default S3 location s3://
        # , the S3 path to a bucket, or the S3 path to a bucket and prefix. A prefix in S3 is a string of
        # characters at the beginning of an object key name used to organize the objects that you store in
        # your S3 buckets. For example, object key names that start with the engineering/ prefix or object key
        # names that start with the marketing/campaigns/ prefix.

        @[JSON::Field(key: "LocationScope")]
        getter location_scope : String?

        def initialize(
          @access_grants_location_arn : String? = nil,
          @access_grants_location_id : String? = nil,
          @created_at : Time? = nil,
          @iam_role_arn : String? = nil,
          @location_scope : String? = nil
        )
        end
      end


      struct GetAccessPointConfigurationForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point you want to return the configuration for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointConfigurationForObjectLambdaResult
        include JSON::Serializable

        # Object Lambda Access Point configuration document.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ObjectLambdaConfiguration?

        def initialize(
          @configuration : Types::ObjectLambdaConfiguration? = nil
        )
        end
      end


      struct GetAccessPointForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointForObjectLambdaResult
        include JSON::Serializable

        # The alias of the Object Lambda Access Point.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::ObjectLambdaAccessPointAlias?

        # The date and time when the specified Object Lambda Access Point was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Configuration to block all public access. This setting is turned on and can not be edited.

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration?

        def initialize(
          @alias : Types::ObjectLambdaAccessPointAlias? = nil,
          @creation_date : Time? = nil,
          @name : String? = nil,
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil
        )
        end
      end


      struct GetAccessPointPolicyForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointPolicyForObjectLambdaResult
        include JSON::Serializable

        # Object Lambda Access Point resource policy document.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetAccessPointPolicyRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point whose policy you want to retrieve. For using this parameter with Amazon
        # S3 on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as well. For
        # using this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify
        # the ARN of the access point accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;
        # . For example, to access the access point reports-ap through Outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap . The value
        # must be URL encoded.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointPolicyResult
        include JSON::Serializable

        # The access point policy associated with the specified access point.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetAccessPointPolicyStatusForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointPolicyStatusForObjectLambdaResult
        include JSON::Serializable


        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : Types::PolicyStatus?

        def initialize(
          @policy_status : Types::PolicyStatus? = nil
        )
        end
      end


      struct GetAccessPointPolicyStatusRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point whose policy status you want to retrieve.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointPolicyStatusResult
        include JSON::Serializable

        # Indicates the current policy status of the specified access point.

        @[JSON::Field(key: "PolicyStatus")]
        getter policy_status : Types::PolicyStatus?

        def initialize(
          @policy_status : Types::PolicyStatus? = nil
        )
        end
      end


      struct GetAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the account that owns the specified access point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point whose configuration information you want to retrieve. For using this
        # parameter with Amazon S3 on Outposts with the REST API, you must specify the name and the
        # x-amz-outpost-id as well. For using this parameter with S3 on Outposts with the Amazon Web Services
        # SDK and CLI, you must specify the ARN of the access point accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;
        # . For example, to access the access point reports-ap through Outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap . The value
        # must be URL encoded.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointResult
        include JSON::Serializable

        # The ARN of the access point.

        @[JSON::Field(key: "AccessPointArn")]
        getter access_point_arn : String?

        # The name or alias of the access point.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The name of the bucket associated with the specified access point.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The Amazon Web Services account ID associated with the S3 bucket associated with this access point.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        # The date and time when the specified access point was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The unique identifier for the data source of the access point.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The type of the data source that the access point is attached to.

        @[JSON::Field(key: "DataSourceType")]
        getter data_source_type : String?

        # The VPC endpoint for the access point.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Hash(String, String)?

        # The name of the specified access point.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Indicates whether this access point allows access from the public internet. If VpcConfiguration is
        # specified for this access point, then NetworkOrigin is VPC , and the access point doesn't allow
        # access from the public internet. Otherwise, NetworkOrigin is Internet , and the access point allows
        # access from the public internet, subject to the access point and bucket access policies. This will
        # always be true for an Amazon S3 on Outposts access point

        @[JSON::Field(key: "NetworkOrigin")]
        getter network_origin : String?


        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration?

        # Contains the virtual private cloud (VPC) configuration for the specified access point. This element
        # is empty if this access point is an Amazon S3 on Outposts access point that is used by other Amazon
        # Web Services services.

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @access_point_arn : String? = nil,
          @alias : String? = nil,
          @bucket : String? = nil,
          @bucket_account_id : String? = nil,
          @creation_date : Time? = nil,
          @data_source_id : String? = nil,
          @data_source_type : String? = nil,
          @endpoints : Hash(String, String)? = nil,
          @name : String? = nil,
          @network_origin : String? = nil,
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end


      struct GetAccessPointScopeRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the access point with the scope that you want to
        # retrieve.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point with the scope you want to retrieve.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetAccessPointScopeResult
        include JSON::Serializable

        # The contents of the access point scope.

        @[JSON::Field(key: "Scope")]
        getter scope : Types::Scope?

        def initialize(
          @scope : Types::Scope? = nil
        )
        end
      end


      struct GetBucketLifecycleConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the bucket. For using this parameter with Amazon S3 on Outposts
        # with the REST API, you must specify the name and the x-amz-outpost-id as well. For using this
        # parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the ARN of
        # the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketLifecycleConfigurationResult
        include JSON::Serializable

        # Container for the lifecycle rule of the Outposts bucket.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::LifecycleRule)?

        def initialize(
          @rules : Array(Types::LifecycleRule)? = nil
        )
        end
      end


      struct GetBucketPolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketPolicyResult
        include JSON::Serializable

        # The policy of the Outposts bucket.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetBucketReplicationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket to get the replication information for. For using this parameter with Amazon S3
        # on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as well. For using
        # this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the
        # ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketReplicationResult
        include JSON::Serializable

        # A container for one or more replication rules. A replication configuration must have at least one
        # rule and you can add up to 100 rules. The maximum size of a replication configuration is 128 KB.

        @[JSON::Field(key: "ReplicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration?

        def initialize(
          @replication_configuration : Types::ReplicationConfiguration? = nil
        )
        end
      end


      struct GetBucketRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketResult
        include JSON::Serializable

        # The Outposts bucket requested.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The creation date of the Outposts bucket.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?


        @[JSON::Field(key: "PublicAccessBlockEnabled")]
        getter public_access_block_enabled : Bool?

        def initialize(
          @bucket : String? = nil,
          @creation_date : Time? = nil,
          @public_access_block_enabled : Bool? = nil
        )
        end
      end


      struct GetBucketTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketTaggingResult
        include JSON::Serializable

        # The tags set of the Outposts bucket.

        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::S3Tag)

        def initialize(
          @tag_set : Array(Types::S3Tag)
        )
        end
      end


      struct GetBucketVersioningRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 on Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The S3 on Outposts bucket to return the versioning state for.

        @[JSON::Field(key: "name")]
        getter bucket : String

        def initialize(
          @account_id : String,
          @bucket : String
        )
        end
      end


      struct GetBucketVersioningResult
        include JSON::Serializable

        # Specifies whether MFA delete is enabled in the bucket versioning configuration. This element is
        # returned only if the bucket has been configured with MFA delete. If MFA delete has never been
        # configured for the bucket, this element is not returned.

        @[JSON::Field(key: "MfaDelete")]
        getter mfa_delete : String?

        # The versioning state of the S3 on Outposts bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @mfa_delete : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetDataAccessRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The type of permission granted to your S3 data, which can be set to one of the following values:
        # READ – Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3 data.
        # READWRITE – Grant both read and write access to the S3 data.

        @[JSON::Field(key: "permission")]
        getter permission : String

        # The S3 URI path of the data to which you are requesting temporary access credentials. If the
        # requesting account has an access grant for this data, S3 Access Grants vends temporary access
        # credentials in the response.

        @[JSON::Field(key: "target")]
        getter target : String

        # The session duration, in seconds, of the temporary access credential that S3 Access Grants vends to
        # the grantee or client application. The default value is 1 hour, but the grantee can specify a range
        # from 900 seconds (15 minutes) up to 43200 seconds (12 hours). If the grantee requests a value higher
        # than this maximum, the operation fails.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # The scope of the temporary access credential that S3 Access Grants vends to the grantee or client
        # application. Default – The scope of the returned temporary access token is the scope of the grant
        # that is closest to the target scope. Minimal – The scope of the returned temporary access token is
        # the same as the requested target scope as long as the requested scope is the same as or a subset of
        # the grant scope.

        @[JSON::Field(key: "privilege")]
        getter privilege : String?

        # The type of Target . The only possible value is Object . Pass this value if the target data that you
        # would like to access is a path to an object. Do not pass this value if the target data is a bucket
        # or a bucket and a prefix.

        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @account_id : String,
          @permission : String,
          @target : String,
          @duration_seconds : Int32? = nil,
          @privilege : String? = nil,
          @target_type : String? = nil
        )
        end
      end


      struct GetDataAccessResult
        include JSON::Serializable

        # The temporary credential token that S3 Access Grants vends.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::Credentials?

        # The user, group, or role that was granted access to the S3 location scope. For directory identities,
        # this API also returns the grants of the IAM role used for the identity-aware request. For more
        # information on identity-aware sessions, see Granting permissions to use identity-aware console
        # sessions .

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # The S3 URI path of the data to which you are being granted temporary access credentials.

        @[JSON::Field(key: "MatchedGrantTarget")]
        getter matched_grant_target : String?

        def initialize(
          @credentials : Types::Credentials? = nil,
          @grantee : Types::Grantee? = nil,
          @matched_grant_target : String? = nil
        )
        end
      end


      struct GetJobTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID for the S3 Batch Operations job whose tags you want to retrieve.

        @[JSON::Field(key: "id")]
        getter job_id : String

        def initialize(
          @account_id : String,
          @job_id : String
        )
        end
      end


      struct GetJobTaggingResult
        include JSON::Serializable

        # The set of tags associated with the S3 Batch Operations job.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)?

        def initialize(
          @tags : Array(Types::S3Tag)? = nil
        )
        end
      end


      struct GetMultiRegionAccessPointPolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the Multi-Region Access Point. The name of the Multi-Region Access Point is different from
        # the alias. For more information about the distinction between the name and the alias of an
        # Multi-Region Access Point, see Rules for naming Amazon S3 Multi-Region Access Points in the Amazon
        # S3 User Guide .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetMultiRegionAccessPointPolicyResult
        include JSON::Serializable

        # The policy associated with the specified Multi-Region Access Point.

        @[JSON::Field(key: "Policy")]
        getter policy : Types::MultiRegionAccessPointPolicyDocument?

        def initialize(
          @policy : Types::MultiRegionAccessPointPolicyDocument? = nil
        )
        end
      end


      struct GetMultiRegionAccessPointPolicyStatusRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the Multi-Region Access Point. The name of the Multi-Region Access Point is different from
        # the alias. For more information about the distinction between the name and the alias of an
        # Multi-Region Access Point, see Rules for naming Amazon S3 Multi-Region Access Points in the Amazon
        # S3 User Guide .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetMultiRegionAccessPointPolicyStatusResult
        include JSON::Serializable


        @[JSON::Field(key: "Established")]
        getter established : Types::PolicyStatus?

        def initialize(
          @established : Types::PolicyStatus? = nil
        )
        end
      end


      struct GetMultiRegionAccessPointRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Multi-Region Access Point whose configuration information you want to receive. The
        # name of the Multi-Region Access Point is different from the alias. For more information about the
        # distinction between the name and the alias of an Multi-Region Access Point, see Rules for naming
        # Amazon S3 Multi-Region Access Points in the Amazon S3 User Guide .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetMultiRegionAccessPointResult
        include JSON::Serializable

        # A container element containing the details of the requested Multi-Region Access Point.

        @[JSON::Field(key: "AccessPoint")]
        getter access_point : Types::MultiRegionAccessPointReport?

        def initialize(
          @access_point : Types::MultiRegionAccessPointReport? = nil
        )
        end
      end


      struct GetMultiRegionAccessPointRoutesRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Multi-Region Access Point ARN.

        @[JSON::Field(key: "mrap")]
        getter mrap : String

        def initialize(
          @account_id : String,
          @mrap : String
        )
        end
      end


      struct GetMultiRegionAccessPointRoutesResult
        include JSON::Serializable

        # The Multi-Region Access Point ARN.

        @[JSON::Field(key: "Mrap")]
        getter mrap : String?

        # The different routes that make up the route configuration. Active routes return a value of 100 , and
        # passive routes return a value of 0 .

        @[JSON::Field(key: "Routes")]
        getter routes : Array(Types::MultiRegionAccessPointRoute)?

        def initialize(
          @mrap : String? = nil,
          @routes : Array(Types::MultiRegionAccessPointRoute)? = nil
        )
        end
      end


      struct GetPublicAccessBlockOutput
        include JSON::Serializable

        # The PublicAccessBlock configuration currently in effect for this Amazon Web Services account.

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration?

        def initialize(
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration? = nil
        )
        end
      end


      struct GetPublicAccessBlockRequest
        include JSON::Serializable

        # The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to
        # retrieve.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetStorageLensConfigurationRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the Amazon S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        def initialize(
          @account_id : String,
          @config_id : String
        )
        end
      end


      struct GetStorageLensConfigurationResult
        include JSON::Serializable

        # The S3 Storage Lens configuration requested.

        @[JSON::Field(key: "StorageLensConfiguration")]
        getter storage_lens_configuration : Types::StorageLensConfiguration?

        def initialize(
          @storage_lens_configuration : Types::StorageLensConfiguration? = nil
        )
        end
      end


      struct GetStorageLensConfigurationTaggingRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the Amazon S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        def initialize(
          @account_id : String,
          @config_id : String
        )
        end
      end


      struct GetStorageLensConfigurationTaggingResult
        include JSON::Serializable

        # The tags of S3 Storage Lens configuration requested.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::StorageLensTag)?

        def initialize(
          @tags : Array(Types::StorageLensTag)? = nil
        )
        end
      end


      struct GetStorageLensGroupRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the Storage Lens group that you're trying to
        # retrieve the details for.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Storage Lens group that you're trying to retrieve the configuration details for.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @name : String
        )
        end
      end


      struct GetStorageLensGroupResult
        include JSON::Serializable

        # The name of the Storage Lens group that you're trying to retrieve the configuration details for.

        @[JSON::Field(key: "StorageLensGroup")]
        getter storage_lens_group : Types::StorageLensGroup?

        def initialize(
          @storage_lens_group : Types::StorageLensGroup? = nil
        )
        end
      end

      # The user, group, or role to which you are granting access. You can grant access to an IAM user or
      # role. If you have added your corporate directory to Amazon Web Services IAM Identity Center and
      # associated your Identity Center instance with your S3 Access Grants instance, the grantee can also
      # be a corporate directory user or group.

      struct Grantee
        include JSON::Serializable

        # The unique identifier of the Grantee . If the grantee type is IAM , the identifier is the IAM Amazon
        # Resource Name (ARN) of the user or role. If the grantee type is a directory user or group, the
        # identifier is 128-bit universally unique identifier (UUID) in the format
        # a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 . You can obtain this UUID from your Amazon Web Services IAM
        # Identity Center instance.

        @[JSON::Field(key: "GranteeIdentifier")]
        getter grantee_identifier : String?

        # The type of the grantee to which access has been granted. It can be one of the following values: IAM
        # - An IAM user or role. DIRECTORY_USER - Your corporate directory user. You can use this option if
        # you have added your corporate identity directory to IAM Identity Center and associated the IAM
        # Identity Center instance with your S3 Access Grants instance. DIRECTORY_GROUP - Your corporate
        # directory group. You can use this option if you have added your corporate identity directory to IAM
        # Identity Center and associated the IAM Identity Center instance with your S3 Access Grants instance.

        @[JSON::Field(key: "GranteeType")]
        getter grantee_type : String?

        def initialize(
          @grantee_identifier : String? = nil,
          @grantee_type : String? = nil
        )
        end
      end


      struct IdempotencyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A container for what Amazon S3 Storage Lens configuration includes.

      struct Include
        include JSON::Serializable

        # A container for the S3 Storage Lens bucket includes.

        @[JSON::Field(key: "Buckets")]
        getter buckets : Array(String)?

        # A container for the S3 Storage Lens Region includes.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @buckets : Array(String)? = nil,
          @regions : Array(String)? = nil
        )
        end
      end


      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A container element for the job configuration and status information returned by a Describe Job
      # request.

      struct JobDescriptor
        include JSON::Serializable

        # Indicates whether confirmation is required before Amazon S3 begins running the specified job.
        # Confirmation is required only for jobs created through the Amazon S3 console.

        @[JSON::Field(key: "ConfirmationRequired")]
        getter confirmation_required : Bool?

        # A timestamp indicating when this job was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The description for this job, if one was provided in this job's Create Job request.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the specified job failed, this field contains information describing the failure.

        @[JSON::Field(key: "FailureReasons")]
        getter failure_reasons : Array(Types::JobFailure)?

        # The attribute of the JobDescriptor containing details about the job's generated manifest.

        @[JSON::Field(key: "GeneratedManifestDescriptor")]
        getter generated_manifest_descriptor : Types::S3GeneratedManifestDescriptor?

        # The Amazon Resource Name (ARN) for this job.

        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The ID for the specified job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The configuration information for the specified job's manifest object.

        @[JSON::Field(key: "Manifest")]
        getter manifest : Types::JobManifest?

        # The manifest generator that was used to generate a job manifest for this job.

        @[JSON::Field(key: "ManifestGenerator")]
        getter manifest_generator : Types::JobManifestGenerator?

        # The operation that the specified job is configured to run on the objects listed in the manifest.

        @[JSON::Field(key: "Operation")]
        getter operation : Types::JobOperation?

        # The priority of the specified job.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # Describes the total number of tasks that the specified job has run, the number of tasks that
        # succeeded, and the number of tasks that failed.

        @[JSON::Field(key: "ProgressSummary")]
        getter progress_summary : Types::JobProgressSummary?

        # Contains the configuration information for the job-completion report if you requested one in the
        # Create Job request.

        @[JSON::Field(key: "Report")]
        getter report : Types::JobReport?

        # The Amazon Resource Name (ARN) for the Identity and Access Management (IAM) role assigned to run the
        # tasks for this job.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The current status of the specified job.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for updating the job.

        @[JSON::Field(key: "StatusUpdateReason")]
        getter status_update_reason : String?

        # The reason why the specified job was suspended. A job is only suspended if you create it through the
        # Amazon S3 console. When you create the job, it enters the Suspended state to await confirmation
        # before running. After you confirm the job, it automatically exits the Suspended state.

        @[JSON::Field(key: "SuspendedCause")]
        getter suspended_cause : String?

        # The timestamp when this job was suspended, if it has been suspended.

        @[JSON::Field(key: "SuspendedDate")]
        getter suspended_date : Time?

        # A timestamp indicating when this job terminated. A job's termination date is the date and time when
        # it succeeded, failed, or was canceled.

        @[JSON::Field(key: "TerminationDate")]
        getter termination_date : Time?

        def initialize(
          @confirmation_required : Bool? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @failure_reasons : Array(Types::JobFailure)? = nil,
          @generated_manifest_descriptor : Types::S3GeneratedManifestDescriptor? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @manifest : Types::JobManifest? = nil,
          @manifest_generator : Types::JobManifestGenerator? = nil,
          @operation : Types::JobOperation? = nil,
          @priority : Int32? = nil,
          @progress_summary : Types::JobProgressSummary? = nil,
          @report : Types::JobReport? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @status_update_reason : String? = nil,
          @suspended_cause : String? = nil,
          @suspended_date : Time? = nil,
          @termination_date : Time? = nil
        )
        end
      end

      # If this job failed, this element indicates why the job failed.

      struct JobFailure
        include JSON::Serializable

        # The failure code, if any, for the specified job.

        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # The failure reason, if any, for the specified job.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        def initialize(
          @failure_code : String? = nil,
          @failure_reason : String? = nil
        )
        end
      end

      # Contains the configuration and status information for a single job retrieved as part of a job list.

      struct JobListDescriptor
        include JSON::Serializable

        # A timestamp indicating when the specified job was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The user-specified description that was included in the specified job's Create Job request.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID for the specified job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The operation that the specified job is configured to run on every object listed in the manifest.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The current priority for the specified job.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # Describes the total number of tasks that the specified job has run, the number of tasks that
        # succeeded, and the number of tasks that failed.

        @[JSON::Field(key: "ProgressSummary")]
        getter progress_summary : Types::JobProgressSummary?

        # The specified job's current status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A timestamp indicating when the specified job terminated. A job's termination date is the date and
        # time when it succeeded, failed, or was canceled.

        @[JSON::Field(key: "TerminationDate")]
        getter termination_date : Time?

        def initialize(
          @creation_time : Time? = nil,
          @description : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @priority : Int32? = nil,
          @progress_summary : Types::JobProgressSummary? = nil,
          @status : String? = nil,
          @termination_date : Time? = nil
        )
        end
      end

      # Contains the configuration information for a job's manifest.

      struct JobManifest
        include JSON::Serializable

        # Contains the information required to locate the specified job's manifest. Manifests can't be
        # imported from directory buckets. For more information, see Directory buckets .

        @[JSON::Field(key: "Location")]
        getter location : Types::JobManifestLocation

        # Describes the format of the specified job's manifest. If the manifest is in CSV format, also
        # describes the columns contained within the manifest.

        @[JSON::Field(key: "Spec")]
        getter spec : Types::JobManifestSpec

        def initialize(
          @location : Types::JobManifestLocation,
          @spec : Types::JobManifestSpec
        )
        end
      end

      # Configures the type of the job's ManifestGenerator.

      struct JobManifestGenerator
        include JSON::Serializable

        # The S3 job ManifestGenerator's configuration details.

        @[JSON::Field(key: "S3JobManifestGenerator")]
        getter s3_job_manifest_generator : Types::S3JobManifestGenerator?

        def initialize(
          @s3_job_manifest_generator : Types::S3JobManifestGenerator? = nil
        )
        end
      end

      # The filter used to describe a set of objects for the job's manifest.

      struct JobManifestGeneratorFilter
        include JSON::Serializable

        # If provided, the generated manifest includes only source bucket objects that were created after this
        # time.

        @[JSON::Field(key: "CreatedAfter")]
        getter created_after : Time?

        # If provided, the generated manifest includes only source bucket objects that were created before
        # this time.

        @[JSON::Field(key: "CreatedBefore")]
        getter created_before : Time?

        # Include objects in the generated manifest only if they are eligible for replication according to the
        # Replication configuration on the source bucket.

        @[JSON::Field(key: "EligibleForReplication")]
        getter eligible_for_replication : Bool?

        # If provided, the generated manifest includes only source bucket objects whose object keys match the
        # string constraints specified for MatchAnyPrefix , MatchAnySuffix , and MatchAnySubstring .

        @[JSON::Field(key: "KeyNameConstraint")]
        getter key_name_constraint : Types::KeyNameConstraint?

        # If provided, the generated object list includes only source bucket objects with the indicated
        # server-side encryption type (SSE-S3, SSE-KMS, DSSE-KMS, SSE-C, or NOT-SSE).

        @[JSON::Field(key: "MatchAnyObjectEncryption")]
        getter match_any_object_encryption : Array(Types::ObjectEncryptionFilter)?

        # If provided, the generated manifest includes only source bucket objects that are stored with the
        # specified storage class.

        @[JSON::Field(key: "MatchAnyStorageClass")]
        getter match_any_storage_class : Array(String)?

        # If provided, the generated manifest includes only source bucket objects that have one of the
        # specified Replication statuses.

        @[JSON::Field(key: "ObjectReplicationStatuses")]
        getter object_replication_statuses : Array(String)?

        # If provided, the generated manifest includes only source bucket objects whose file size is greater
        # than the specified number of bytes.

        @[JSON::Field(key: "ObjectSizeGreaterThanBytes")]
        getter object_size_greater_than_bytes : Int64?

        # If provided, the generated manifest includes only source bucket objects whose file size is less than
        # the specified number of bytes.

        @[JSON::Field(key: "ObjectSizeLessThanBytes")]
        getter object_size_less_than_bytes : Int64?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil,
          @eligible_for_replication : Bool? = nil,
          @key_name_constraint : Types::KeyNameConstraint? = nil,
          @match_any_object_encryption : Array(Types::ObjectEncryptionFilter)? = nil,
          @match_any_storage_class : Array(String)? = nil,
          @object_replication_statuses : Array(String)? = nil,
          @object_size_greater_than_bytes : Int64? = nil,
          @object_size_less_than_bytes : Int64? = nil
        )
        end
      end

      # Contains the information required to locate a manifest object. Manifests can't be imported from
      # directory buckets. For more information, see Directory buckets .

      struct JobManifestLocation
        include JSON::Serializable

        # The ETag for the specified manifest object.

        @[JSON::Field(key: "ETag")]
        getter e_tag : String

        # The Amazon Resource Name (ARN) for a manifest object. When you're using XML requests, you must
        # replace special characters (such as carriage returns) in object keys with their equivalent XML
        # entity codes. For more information, see XML-related object key constraints in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "ObjectArn")]
        getter object_arn : String

        # The optional version ID to identify a specific version of the manifest object.

        @[JSON::Field(key: "ObjectVersionId")]
        getter object_version_id : String?

        def initialize(
          @e_tag : String,
          @object_arn : String,
          @object_version_id : String? = nil
        )
        end
      end

      # Describes the format of a manifest. If the manifest is in CSV format, also describes the columns
      # contained within the manifest.

      struct JobManifestSpec
        include JSON::Serializable

        # Indicates which of the available formats the specified manifest uses.

        @[JSON::Field(key: "Format")]
        getter format : String

        # If the specified manifest object is in the S3BatchOperations_CSV_20180820 format, this element
        # describes which columns contain the required data.

        @[JSON::Field(key: "Fields")]
        getter fields : Array(String)?

        def initialize(
          @format : String,
          @fields : Array(String)? = nil
        )
        end
      end

      # The operation that you want this job to perform on every object listed in the manifest. For more
      # information about the available operations, see Operations in the Amazon S3 User Guide .

      struct JobOperation
        include JSON::Serializable

        # Directs the specified job to invoke an Lambda function on every object in the manifest.

        @[JSON::Field(key: "LambdaInvoke")]
        getter lambda_invoke : Types::LambdaInvokeOperation?

        # Directs the specified job to compute checksum values for every object in the manifest.

        @[JSON::Field(key: "S3ComputeObjectChecksum")]
        getter s3_compute_object_checksum : Types::S3ComputeObjectChecksumOperation?

        # Directs the specified job to execute a DELETE Object tagging call on every object in the manifest.
        # This functionality is not supported by directory buckets.

        @[JSON::Field(key: "S3DeleteObjectTagging")]
        getter s3_delete_object_tagging : Types::S3DeleteObjectTaggingOperation?

        # Directs the specified job to initiate restore requests for every archived object in the manifest.
        # This functionality is not supported by directory buckets.

        @[JSON::Field(key: "S3InitiateRestoreObject")]
        getter s3_initiate_restore_object : Types::S3InitiateRestoreObjectOperation?

        # Directs the specified job to run a PutObjectAcl call on every object in the manifest. This
        # functionality is not supported by directory buckets.

        @[JSON::Field(key: "S3PutObjectAcl")]
        getter s3_put_object_acl : Types::S3SetObjectAclOperation?

        # Directs the specified job to run a PUT Copy object call on every object in the manifest.

        @[JSON::Field(key: "S3PutObjectCopy")]
        getter s3_put_object_copy : Types::S3CopyObjectOperation?


        @[JSON::Field(key: "S3PutObjectLegalHold")]
        getter s3_put_object_legal_hold : Types::S3SetObjectLegalHoldOperation?


        @[JSON::Field(key: "S3PutObjectRetention")]
        getter s3_put_object_retention : Types::S3SetObjectRetentionOperation?

        # Directs the specified job to run a PUT Object tagging call on every object in the manifest. This
        # functionality is not supported by directory buckets.

        @[JSON::Field(key: "S3PutObjectTagging")]
        getter s3_put_object_tagging : Types::S3SetObjectTaggingOperation?

        # Directs the specified job to invoke ReplicateObject on every object in the job's manifest. This
        # functionality is not supported by directory buckets.

        @[JSON::Field(key: "S3ReplicateObject")]
        getter s3_replicate_object : Types::S3ReplicateObjectOperation?

        def initialize(
          @lambda_invoke : Types::LambdaInvokeOperation? = nil,
          @s3_compute_object_checksum : Types::S3ComputeObjectChecksumOperation? = nil,
          @s3_delete_object_tagging : Types::S3DeleteObjectTaggingOperation? = nil,
          @s3_initiate_restore_object : Types::S3InitiateRestoreObjectOperation? = nil,
          @s3_put_object_acl : Types::S3SetObjectAclOperation? = nil,
          @s3_put_object_copy : Types::S3CopyObjectOperation? = nil,
          @s3_put_object_legal_hold : Types::S3SetObjectLegalHoldOperation? = nil,
          @s3_put_object_retention : Types::S3SetObjectRetentionOperation? = nil,
          @s3_put_object_tagging : Types::S3SetObjectTaggingOperation? = nil,
          @s3_replicate_object : Types::S3ReplicateObjectOperation? = nil
        )
        end
      end

      # Describes the total number of tasks that the specified job has started, the number of tasks that
      # succeeded, and the number of tasks that failed.

      struct JobProgressSummary
        include JSON::Serializable


        @[JSON::Field(key: "NumberOfTasksFailed")]
        getter number_of_tasks_failed : Int64?


        @[JSON::Field(key: "NumberOfTasksSucceeded")]
        getter number_of_tasks_succeeded : Int64?

        # The JobTimers attribute of a job's progress summary.

        @[JSON::Field(key: "Timers")]
        getter timers : Types::JobTimers?


        @[JSON::Field(key: "TotalNumberOfTasks")]
        getter total_number_of_tasks : Int64?

        def initialize(
          @number_of_tasks_failed : Int64? = nil,
          @number_of_tasks_succeeded : Int64? = nil,
          @timers : Types::JobTimers? = nil,
          @total_number_of_tasks : Int64? = nil
        )
        end
      end

      # Contains the configuration parameters for a job-completion report.

      struct JobReport
        include JSON::Serializable

        # Indicates whether the specified job will generate a job-completion report.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # The Amazon Resource Name (ARN) for the bucket where specified job-completion report will be stored.
        # Directory buckets - Directory buckets aren't supported as a location for Batch Operations to store
        # job completion reports.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # Lists the Amazon Web Services account ID that owns the target bucket, where the completion report is
        # received.

        @[JSON::Field(key: "ExpectedBucketOwner")]
        getter expected_bucket_owner : String?

        # The format of the specified job-completion report.

        @[JSON::Field(key: "Format")]
        getter format : String?

        # An optional prefix to describe where in the specified bucket the job-completion report will be
        # stored. Amazon S3 stores the job-completion report at &lt;prefix&gt;/job-&lt;job-id&gt;/report.json
        # .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # Indicates whether the job-completion report will include details of all tasks or only failed tasks.

        @[JSON::Field(key: "ReportScope")]
        getter report_scope : String?

        def initialize(
          @enabled : Bool,
          @bucket : String? = nil,
          @expected_bucket_owner : String? = nil,
          @format : String? = nil,
          @prefix : String? = nil,
          @report_scope : String? = nil
        )
        end
      end


      struct JobStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides timing details for the job.

      struct JobTimers
        include JSON::Serializable

        # Indicates the elapsed time in seconds the job has been in the Active job state.

        @[JSON::Field(key: "ElapsedTimeInActiveSeconds")]
        getter elapsed_time_in_active_seconds : Int64?

        def initialize(
          @elapsed_time_in_active_seconds : Int64? = nil
        )
        end
      end

      # If provided, the generated manifest includes only source bucket objects whose object keys match the
      # string constraints specified for MatchAnyPrefix , MatchAnySuffix , and MatchAnySubstring .

      struct KeyNameConstraint
        include JSON::Serializable

        # If provided, the generated manifest includes objects where the specified string appears at the start
        # of the object key string. Each KeyNameConstraint filter accepts an array of strings with a length of
        # 1 string.

        @[JSON::Field(key: "MatchAnyPrefix")]
        getter match_any_prefix : Array(String)?

        # If provided, the generated manifest includes objects where the specified string appears anywhere
        # within the object key string. Each KeyNameConstraint filter accepts an array of strings with a
        # length of 1 string.

        @[JSON::Field(key: "MatchAnySubstring")]
        getter match_any_substring : Array(String)?

        # If provided, the generated manifest includes objects where the specified string appears at the end
        # of the object key string. Each KeyNameConstraint filter accepts an array of strings with a length of
        # 1 string.

        @[JSON::Field(key: "MatchAnySuffix")]
        getter match_any_suffix : Array(String)?

        def initialize(
          @match_any_prefix : Array(String)? = nil,
          @match_any_substring : Array(String)? = nil,
          @match_any_suffix : Array(String)? = nil
        )
        end
      end

      # Contains the configuration parameters for a Lambda Invoke operation.

      struct LambdaInvokeOperation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Lambda function that the specified job will invoke on every
        # object in the manifest.

        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # Specifies the schema version for the payload that Batch Operations sends when invoking an Lambda
        # function. Version 1.0 is the default. Version 2.0 is required when you use Batch Operations to
        # invoke Lambda functions that act on directory buckets, or if you need to specify UserArguments . For
        # more information, see Automate object processing in Amazon S3 directory buckets with S3 Batch
        # Operations and Lambda in the Amazon Web Services Storage Blog . Ensure that your Lambda function
        # code expects InvocationSchemaVersion 2.0 and uses bucket name rather than bucket ARN. If the
        # InvocationSchemaVersion does not match what your Lambda function expects, your function might not
        # work as expected. Directory buckets - To initiate Amazon Web Services Lambda function to perform
        # custom actions on objects in directory buckets, you must specify 2.0 .

        @[JSON::Field(key: "InvocationSchemaVersion")]
        getter invocation_schema_version : String?

        # Key-value pairs that are passed in the payload that Batch Operations sends when invoking an Lambda
        # function. You must specify InvocationSchemaVersion 2.0 for LambdaInvoke operations that include
        # UserArguments . For more information, see Automate object processing in Amazon S3 directory buckets
        # with S3 Batch Operations and Lambda in the Amazon Web Services Storage Blog .

        @[JSON::Field(key: "UserArguments")]
        getter user_arguments : Hash(String, String)?

        def initialize(
          @function_arn : String? = nil,
          @invocation_schema_version : String? = nil,
          @user_arguments : Hash(String, String)? = nil
        )
        end
      end

      # The container for the Outposts bucket lifecycle configuration.

      struct LifecycleConfiguration
        include JSON::Serializable

        # A lifecycle rule for individual objects in an Outposts bucket.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::LifecycleRule)?

        def initialize(
          @rules : Array(Types::LifecycleRule)? = nil
        )
        end
      end

      # The container of the Outposts bucket lifecycle expiration.

      struct LifecycleExpiration
        include JSON::Serializable

        # Indicates at what date the object is to be deleted. Should be in GMT ISO 8601 format.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be a
        # non-zero positive integer.

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to true,
        # the delete marker will be expired. If set to false, the policy takes no action. This cannot be
        # specified with Days or Date in a Lifecycle Expiration Policy. To learn more about delete markers,
        # see Working with delete markers .

        @[JSON::Field(key: "ExpiredObjectDeleteMarker")]
        getter expired_object_delete_marker : Bool?

        def initialize(
          @date : Time? = nil,
          @days : Int32? = nil,
          @expired_object_delete_marker : Bool? = nil
        )
        end
      end

      # The container for the Outposts bucket lifecycle rule.

      struct LifecycleRule
        include JSON::Serializable

        # If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently being
        # applied.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 waits
        # before permanently removing all parts of the upload. For more information, see Aborting Incomplete
        # Multipart Uploads Using a Bucket Lifecycle Configuration in the Amazon S3 User Guide .

        @[JSON::Field(key: "AbortIncompleteMultipartUpload")]
        getter abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload?

        # Specifies the expiration for the lifecycle of the object in the form of date, days and, whether the
        # object has a delete marker.

        @[JSON::Field(key: "Expiration")]
        getter expiration : Types::LifecycleExpiration?

        # The container for the filter of lifecycle rule.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::LifecycleRuleFilter?

        # Unique identifier for the rule. The value cannot be longer than 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?

        # The noncurrent version expiration of the lifecycle rule.

        @[JSON::Field(key: "NoncurrentVersionExpiration")]
        getter noncurrent_version_expiration : Types::NoncurrentVersionExpiration?

        # Specifies the transition rule for the lifecycle rule that describes when noncurrent objects
        # transition to a specific storage class. If your bucket is versioning-enabled (or versioning is
        # suspended), you can set this action to request that Amazon S3 transition noncurrent object versions
        # to a specific storage class at a set period in the object's lifetime. This is not supported by
        # Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "NoncurrentVersionTransitions")]
        getter noncurrent_version_transitions : Array(Types::NoncurrentVersionTransition)?

        # Specifies when an Amazon S3 object transitions to a specified storage class. This is not supported
        # by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "Transitions")]
        getter transitions : Array(Types::Transition)?

        def initialize(
          @status : String,
          @abort_incomplete_multipart_upload : Types::AbortIncompleteMultipartUpload? = nil,
          @expiration : Types::LifecycleExpiration? = nil,
          @filter : Types::LifecycleRuleFilter? = nil,
          @id : String? = nil,
          @noncurrent_version_expiration : Types::NoncurrentVersionExpiration? = nil,
          @noncurrent_version_transitions : Array(Types::NoncurrentVersionTransition)? = nil,
          @transitions : Array(Types::Transition)? = nil
        )
        end
      end

      # The container for the Outposts bucket lifecycle rule and operator.

      struct LifecycleRuleAndOperator
        include JSON::Serializable

        # The non-inclusive minimum object size for the lifecycle rule. Setting this property to 7 means the
        # rule applies to objects with a size that is greater than 7.

        @[JSON::Field(key: "ObjectSizeGreaterThan")]
        getter object_size_greater_than : Int64?

        # The non-inclusive maximum object size for the lifecycle rule. Setting this property to 77 means the
        # rule applies to objects with a size that is less than 77.

        @[JSON::Field(key: "ObjectSizeLessThan")]
        getter object_size_less_than : Int64?

        # Prefix identifying one or more objects to which the rule applies.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # All of these tags must exist in the object's tag set in order for the rule to apply.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)?

        def initialize(
          @object_size_greater_than : Int64? = nil,
          @object_size_less_than : Int64? = nil,
          @prefix : String? = nil,
          @tags : Array(Types::S3Tag)? = nil
        )
        end
      end

      # The container for the filter of the lifecycle rule.

      struct LifecycleRuleFilter
        include JSON::Serializable

        # The container for the AND condition for the lifecycle rule.

        @[JSON::Field(key: "And")]
        getter and : Types::LifecycleRuleAndOperator?

        # Minimum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeGreaterThan")]
        getter object_size_greater_than : Int64?

        # Maximum object size to which the rule applies.

        @[JSON::Field(key: "ObjectSizeLessThan")]
        getter object_size_less_than : Int64?

        # Prefix identifying one or more objects to which the rule applies. When you're using XML requests,
        # you must replace special characters (such as carriage returns) in object keys with their equivalent
        # XML entity codes. For more information, see XML-related object key constraints in the Amazon S3 User
        # Guide .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "Tag")]
        getter tag : Types::S3Tag?

        def initialize(
          @and : Types::LifecycleRuleAndOperator? = nil,
          @object_size_greater_than : Int64? = nil,
          @object_size_less_than : Int64? = nil,
          @prefix : String? = nil,
          @tag : Types::S3Tag? = nil
        )
        end
      end

      # Information about the access grant.

      struct ListAccessGrantEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access grant.

        @[JSON::Field(key: "AccessGrantArn")]
        getter access_grant_arn : String?

        # The ID of the access grant. S3 Access Grants auto-generates this ID when you create the access
        # grant.

        @[JSON::Field(key: "AccessGrantId")]
        getter access_grant_id : String?

        # The configuration options of the grant location. The grant location is the S3 path to the data to
        # which you are granting access.

        @[JSON::Field(key: "AccessGrantsLocationConfiguration")]
        getter access_grants_location_configuration : Types::AccessGrantsLocationConfiguration?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If the grant includes an application ARN, the grantee can only
        # access the S3 data through this application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The date and time when you created the S3 Access Grants instance.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The S3 path of the data to which you are granting access. It is the result of appending the
        # Subprefix to the location scope.

        @[JSON::Field(key: "GrantScope")]
        getter grant_scope : String?

        # The user, group, or role to which you are granting access. You can grant access to an IAM user or
        # role. If you have added your corporate directory to Amazon Web Services IAM Identity Center and
        # associated your Identity Center instance with your S3 Access Grants instance, the grantee can also
        # be a corporate directory user or group.

        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::Grantee?

        # The type of access granted to your S3 data, which can be set to one of the following values: READ –
        # Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3 data. READWRITE –
        # Grant both read and write access to the S3 data.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @access_grant_arn : String? = nil,
          @access_grant_id : String? = nil,
          @access_grants_location_configuration : Types::AccessGrantsLocationConfiguration? = nil,
          @access_grants_location_id : String? = nil,
          @application_arn : String? = nil,
          @created_at : Time? = nil,
          @grant_scope : String? = nil,
          @grantee : Types::Grantee? = nil,
          @permission : String? = nil
        )
        end
      end

      # Information about the S3 Access Grants instance.

      struct ListAccessGrantsInstanceEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the S3 Access Grants instance.

        @[JSON::Field(key: "AccessGrantsInstanceArn")]
        getter access_grants_instance_arn : String?

        # The ID of the S3 Access Grants instance. The ID is default . You can have one S3 Access Grants
        # instance per Region per account.

        @[JSON::Field(key: "AccessGrantsInstanceId")]
        getter access_grants_instance_id : String?

        # The date and time when you created the S3 Access Grants instance.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # If you associated your S3 Access Grants instance with an Amazon Web Services IAM Identity Center
        # instance, this field returns the Amazon Resource Name (ARN) of the IAM Identity Center instance
        # application; a subresource of the original Identity Center instance. S3 Access Grants creates this
        # Identity Center application for the specific S3 Access Grants instance.

        @[JSON::Field(key: "IdentityCenterArn")]
        getter identity_center_arn : String?

        # The Amazon Resource Name (ARN) of the Amazon Web Services IAM Identity Center instance that you are
        # associating with your S3 Access Grants instance. An IAM Identity Center instance is your corporate
        # identity directory that you added to the IAM Identity Center. You can use the ListInstances API
        # operation to retrieve a list of your Identity Center instances and their ARNs.

        @[JSON::Field(key: "IdentityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        def initialize(
          @access_grants_instance_arn : String? = nil,
          @access_grants_instance_id : String? = nil,
          @created_at : Time? = nil,
          @identity_center_application_arn : String? = nil,
          @identity_center_arn : String? = nil,
          @identity_center_instance_arn : String? = nil
        )
        end
      end


      struct ListAccessGrantsInstancesRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The maximum number of access grants that you would like returned in the List Access Grants response.
        # If the results include the pagination token NextToken , make another call using the NextToken to
        # determine if there are more results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants Instances request in order to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessGrantsInstancesResult
        include JSON::Serializable

        # A container for a list of S3 Access Grants instances.

        @[JSON::Field(key: "AccessGrantsInstancesList")]
        getter access_grants_instances_list : Array(Types::ListAccessGrantsInstanceEntry)?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants Instances request in order to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_grants_instances_list : Array(Types::ListAccessGrantsInstanceEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A container for information about the registered location.

      struct ListAccessGrantsLocationsEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the registered location.

        @[JSON::Field(key: "AccessGrantsLocationArn")]
        getter access_grants_location_arn : String?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigns this ID
        # when you register the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The date and time when you registered the location.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role for the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String?

        # The S3 path to the location that you are registering. The location scope can be the default S3
        # location s3:// , the S3 path to a bucket s3://&lt;bucket&gt; , or the S3 path to a bucket and prefix
        # s3://&lt;bucket&gt;/&lt;prefix&gt; . A prefix in S3 is a string of characters at the beginning of an
        # object key name used to organize the objects that you store in your S3 buckets. For example, object
        # key names that start with the engineering/ prefix or object key names that start with the
        # marketing/campaigns/ prefix.

        @[JSON::Field(key: "LocationScope")]
        getter location_scope : String?

        def initialize(
          @access_grants_location_arn : String? = nil,
          @access_grants_location_id : String? = nil,
          @created_at : Time? = nil,
          @iam_role_arn : String? = nil,
          @location_scope : String? = nil
        )
        end
      end


      struct ListAccessGrantsLocationsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The S3 path to the location that you are registering. The location scope can be the default S3
        # location s3:// , the S3 path to a bucket s3://&lt;bucket&gt; , or the S3 path to a bucket and prefix
        # s3://&lt;bucket&gt;/&lt;prefix&gt; . A prefix in S3 is a string of characters at the beginning of an
        # object key name used to organize the objects that you store in your S3 buckets. For example, object
        # key names that start with the engineering/ prefix or object key names that start with the
        # marketing/campaigns/ prefix.

        @[JSON::Field(key: "locationscope")]
        getter location_scope : String?

        # The maximum number of access grants that you would like returned in the List Access Grants response.
        # If the results include the pagination token NextToken , make another call using the NextToken to
        # determine if there are more results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants Locations request in order to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @location_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessGrantsLocationsResult
        include JSON::Serializable

        # A container for a list of registered locations in an S3 Access Grants instance.

        @[JSON::Field(key: "AccessGrantsLocationsList")]
        getter access_grants_locations_list : Array(Types::ListAccessGrantsLocationsEntry)?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants Locations request in order to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_grants_locations_list : Array(Types::ListAccessGrantsLocationsEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessGrantsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If the grant includes an application ARN, the grantee can only
        # access the S3 data through this application.

        @[JSON::Field(key: "application_arn")]
        getter application_arn : String?

        # The S3 path of the data to which you are granting access. It is the result of appending the
        # Subprefix to the location scope.

        @[JSON::Field(key: "grantscope")]
        getter grant_scope : String?

        # The unique identifer of the Grantee . If the grantee type is IAM , the identifier is the IAM Amazon
        # Resource Name (ARN) of the user or role. If the grantee type is a directory user or group, the
        # identifier is 128-bit universally unique identifier (UUID) in the format
        # a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 . You can obtain this UUID from your Amazon Web Services IAM
        # Identity Center instance.

        @[JSON::Field(key: "granteeidentifier")]
        getter grantee_identifier : String?

        # The type of the grantee to which access has been granted. It can be one of the following values: IAM
        # - An IAM user or role. DIRECTORY_USER - Your corporate directory user. You can use this option if
        # you have added your corporate identity directory to IAM Identity Center and associated the IAM
        # Identity Center instance with your S3 Access Grants instance. DIRECTORY_GROUP - Your corporate
        # directory group. You can use this option if you have added your corporate identity directory to IAM
        # Identity Center and associated the IAM Identity Center instance with your S3 Access Grants instance.

        @[JSON::Field(key: "granteetype")]
        getter grantee_type : String?

        # The maximum number of access grants that you would like returned in the List Access Grants response.
        # If the results include the pagination token NextToken , make another call using the NextToken to
        # determine if there are more results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants request in order to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of permission granted to your S3 data, which can be set to one of the following values:
        # READ – Grant read-only access to the S3 data. WRITE – Grant write-only access to the S3 data.
        # READWRITE – Grant both read and write access to the S3 data.

        @[JSON::Field(key: "permission")]
        getter permission : String?

        def initialize(
          @account_id : String,
          @application_arn : String? = nil,
          @grant_scope : String? = nil,
          @grantee_identifier : String? = nil,
          @grantee_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @permission : String? = nil
        )
        end
      end


      struct ListAccessGrantsResult
        include JSON::Serializable

        # A container for a list of grants in an S3 Access Grants instance.

        @[JSON::Field(key: "AccessGrantsList")]
        getter access_grants_list : Array(Types::ListAccessGrantEntry)?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Access Grants request in order to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_grants_list : Array(Types::ListAccessGrantEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPointsForDirectoryBucketsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the access points.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the directory bucket associated with the access points you want to list.

        @[JSON::Field(key: "directoryBucket")]
        getter directory_bucket : String?

        # The maximum number of access points that you would like returned in the
        # ListAccessPointsForDirectoryBuckets response. If the directory bucket is associated with more than
        # this number of access points, the results include the pagination token NextToken . Make another call
        # using the NextToken to retrieve more results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If NextToken is returned, there are more access points available than requested in the maxResults
        # value. The value of NextToken is a unique pagination token for each page. Make the call again using
        # the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination
        # token expires after 24 hours.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @directory_bucket : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPointsForDirectoryBucketsResult
        include JSON::Serializable

        # Contains identification and configuration information for one or more access points associated with
        # the directory bucket.

        @[JSON::Field(key: "AccessPointList")]
        getter access_point_list : Array(Types::AccessPoint)?

        # If NextToken is returned, there are more access points available than requested in the maxResults
        # value. The value of NextToken is a unique pagination token for each page. Make the call again using
        # the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination
        # token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_point_list : Array(Types::AccessPoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPointsForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The maximum number of access points that you want to include in the list. The response may contain
        # fewer access points but will never contain more. If there are more than this number of access
        # points, then the response will include a continuation token in the NextToken field that you can use
        # to retrieve the next page of access points.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If the list has more access points than can be returned in one call to this API, this field contains
        # a continuation token that you can provide in subsequent calls to this API to retrieve additional
        # access points.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPointsForObjectLambdaResult
        include JSON::Serializable

        # If the list has more access points than can be returned in one call to this API, this field contains
        # a continuation token that you can provide in subsequent calls to this API to retrieve additional
        # access points.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns list of Object Lambda Access Points.

        @[JSON::Field(key: "ObjectLambdaAccessPointList")]
        getter object_lambda_access_point_list : Array(Types::ObjectLambdaAccessPoint)?

        def initialize(
          @next_token : String? = nil,
          @object_lambda_access_point_list : Array(Types::ObjectLambdaAccessPoint)? = nil
        )
        end
      end


      struct ListAccessPointsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the account that owns the specified access points.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the bucket whose associated access points you want to list. For using this parameter
        # with Amazon S3 on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as
        # well. For using this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you
        # must specify the ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The unique identifier for the data source of the access point.

        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String?

        # The type of the data source that the access point is attached to. Returns only access points
        # attached to S3 buckets by default. To return all access points specify DataSourceType as ALL .

        @[JSON::Field(key: "dataSourceType")]
        getter data_source_type : String?

        # The maximum number of access points that you want to include in the list. If the specified bucket
        # has more than this number of access points, then the response will include a continuation token in
        # the NextToken field that you can use to retrieve the next page of access points.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A continuation token. If a previous call to ListAccessPoints returned a continuation token in the
        # NextToken field, then providing that value here causes Amazon S3 to retrieve the next page of
        # results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @bucket : String? = nil,
          @data_source_id : String? = nil,
          @data_source_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessPointsResult
        include JSON::Serializable

        # Contains identification and configuration information for one or more access points associated with
        # the specified bucket.

        @[JSON::Field(key: "AccessPointList")]
        getter access_point_list : Array(Types::AccessPoint)?

        # If the specified bucket has more access points than can be returned in one call to this API, this
        # field contains a continuation token that you can provide in subsequent calls to this API to retrieve
        # additional access points.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_point_list : Array(Types::AccessPoint)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Part of ListCallerAccessGrantsResult . Each entry includes the permission level (READ, WRITE, or
      # READWRITE) and the grant scope of the access grant. If the grant also includes an application ARN,
      # the grantee can only access the S3 data through this application.

      struct ListCallerAccessGrantsEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Web Services IAM Identity Center application associated
        # with your Identity Center instance. If the grant includes an application ARN, the grantee can only
        # access the S3 data through this application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The S3 path of the data to which you have been granted access.

        @[JSON::Field(key: "GrantScope")]
        getter grant_scope : String?

        # The type of permission granted, which can be one of the following values: READ - Grants read-only
        # access to the S3 data. WRITE - Grants write-only access to the S3 data. READWRITE - Grants both read
        # and write access to the S3 data.

        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @application_arn : String? = nil,
          @grant_scope : String? = nil,
          @permission : String? = nil
        )
        end
      end


      struct ListCallerAccessGrantsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # If this optional parameter is passed in the request, a filter is applied to the results. The results
        # will include only the access grants for the caller's Identity Center application or for any other
        # applications ( ALL ).

        @[JSON::Field(key: "allowedByApplication")]
        getter allowed_by_application : Bool?

        # The S3 path of the data that you would like to access. Must start with s3:// . You can optionally
        # pass only the beginning characters of a path, and S3 Access Grants will search for all applicable
        # grants for the path fragment.

        @[JSON::Field(key: "grantscope")]
        getter grant_scope : String?

        # The maximum number of access grants that you would like returned in the List Caller Access Grants
        # response. If the results include the pagination token NextToken , make another call using the
        # NextToken to determine if there are more results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to request the next page of results. Pass this value into a subsequent List
        # Caller Access Grants request in order to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @allowed_by_application : Bool? = nil,
          @grant_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCallerAccessGrantsResult
        include JSON::Serializable

        # A list of the caller's access grants that were created using S3 Access Grants and that grant the
        # caller access to the S3 data of the Amazon Web Services account ID that was specified in the
        # request.

        @[JSON::Field(key: "CallerAccessGrantsList")]
        getter caller_access_grants_list : Array(Types::ListCallerAccessGrantsEntry)?

        # A pagination token that you can use to request the next page of results. Pass this value into a
        # subsequent List Caller Access Grants request in order to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @caller_access_grants_list : Array(Types::ListCallerAccessGrantsEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The List Jobs request returns jobs that match the statuses listed in this element.

        @[JSON::Field(key: "jobStatuses")]
        getter job_statuses : Array(String)?

        # The maximum number of jobs that Amazon S3 will include in the List Jobs response. If there are more
        # jobs than this number, the response will include a pagination token in the NextToken field to enable
        # you to retrieve the next page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to request the next page of results. Use the token that Amazon S3 returned in the
        # NextToken element of the ListJobsResult from the previous List Jobs request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @job_statuses : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobsResult
        include JSON::Serializable

        # The list of current jobs and jobs that have ended within the last 30 days.

        @[JSON::Field(key: "Jobs")]
        getter jobs : Array(Types::JobListDescriptor)?

        # If the List Jobs request produced more than the maximum number of results, you can pass this value
        # into a subsequent List Jobs request in order to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobListDescriptor)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiRegionAccessPointsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Not currently used. Do not use this parameter.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Not currently used. Do not use this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMultiRegionAccessPointsResult
        include JSON::Serializable

        # The list of Multi-Region Access Points associated with the user.

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::MultiRegionAccessPointReport)?

        # If the specified bucket has more Multi-Region Access Points than can be returned in one call to this
        # action, this field contains a continuation token. You can use this token tin subsequent calls to
        # this action to retrieve additional Multi-Region Access Points.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_points : Array(Types::MultiRegionAccessPointReport)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRegionalBucketsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the Outposts resource. This ID is required by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-outpost-id")]
        getter outpost_id : String?

        def initialize(
          @account_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @outpost_id : String? = nil
        )
        end
      end


      struct ListRegionalBucketsResult
        include JSON::Serializable

        # NextToken is sent when isTruncated is true, which means there are more buckets that can be listed.
        # The next list requests to Amazon S3 can be continued with this NextToken . NextToken is obfuscated
        # and is not a real key.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "RegionalBucketList")]
        getter regional_bucket_list : Array(Types::RegionalBucket)?

        def initialize(
          @next_token : String? = nil,
          @regional_bucket_list : Array(Types::RegionalBucket)? = nil
        )
        end
      end

      # Part of ListStorageLensConfigurationResult . Each entry includes the description of the S3 Storage
      # Lens configuration, its home Region, whether it is enabled, its Amazon Resource Name (ARN), and
      # config ID.

      struct ListStorageLensConfigurationEntry
        include JSON::Serializable

        # A container for the S3 Storage Lens home Region. Your metrics data is stored and retained in your
        # designated S3 Storage Lens home Region.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # A container for the S3 Storage Lens configuration ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The ARN of the S3 Storage Lens configuration. This property is read-only.

        @[JSON::Field(key: "StorageLensArn")]
        getter storage_lens_arn : String

        # A container for whether the S3 Storage Lens configuration is enabled. This property is required.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?

        def initialize(
          @home_region : String,
          @id : String,
          @storage_lens_arn : String,
          @is_enabled : Bool? = nil
        )
        end
      end


      struct ListStorageLensConfigurationsRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # A pagination token to request the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListStorageLensConfigurationsResult
        include JSON::Serializable

        # If the request produced more than the maximum number of S3 Storage Lens configuration results, you
        # can pass this value into a subsequent request to retrieve the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of S3 Storage Lens configurations.

        @[JSON::Field(key: "StorageLensConfiguration")]
        getter storage_lens_configuration_list : Array(Types::ListStorageLensConfigurationEntry)?

        def initialize(
          @next_token : String? = nil,
          @storage_lens_configuration_list : Array(Types::ListStorageLensConfigurationEntry)? = nil
        )
        end
      end

      # Each entry contains a Storage Lens group that exists in the specified home Region.

      struct ListStorageLensGroupEntry
        include JSON::Serializable

        # Contains the Amazon Web Services Region where the Storage Lens group was created.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # Contains the name of the Storage Lens group that exists in the specified home Region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Contains the Amazon Resource Name (ARN) of the Storage Lens group. This property is read-only.

        @[JSON::Field(key: "StorageLensGroupArn")]
        getter storage_lens_group_arn : String

        def initialize(
          @home_region : String,
          @name : String,
          @storage_lens_group_arn : String
        )
        end
      end


      struct ListStorageLensGroupsRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the Storage Lens groups.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The token for the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListStorageLensGroupsResult
        include JSON::Serializable

        # If NextToken is returned, there are more Storage Lens groups results available. The value of
        # NextToken is a unique pagination token for each page. Make the call again using the returned token
        # to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after
        # 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of Storage Lens groups that exist in the specified home Region.

        @[JSON::Field(key: "StorageLensGroup")]
        getter storage_lens_group_list : Array(Types::ListStorageLensGroupEntry)?

        def initialize(
          @next_token : String? = nil,
          @storage_lens_group_list : Array(Types::ListStorageLensGroupEntry)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the resource owner.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the S3 resource that you want to list tags for. The tagged
        # resource can be a directory bucket, S3 Storage Lens group or S3 Access Grants instance, registered
        # location, or grant.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @account_id : String,
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # The Amazon Web Services resource tags that are associated with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A filter condition that specifies the object age range of included objects in days. Only integers
      # are supported.

      struct MatchObjectAge
        include JSON::Serializable

        # Specifies the maximum object age in days. Must be a positive whole number, greater than the minimum
        # object age and less than or equal to 2,147,483,647.

        @[JSON::Field(key: "DaysGreaterThan")]
        getter days_greater_than : Int32?

        # Specifies the minimum object age in days. The value must be a positive whole number, greater than 0
        # and less than or equal to 2,147,483,647.

        @[JSON::Field(key: "DaysLessThan")]
        getter days_less_than : Int32?

        def initialize(
          @days_greater_than : Int32? = nil,
          @days_less_than : Int32? = nil
        )
        end
      end

      # A filter condition that specifies the object size range of included objects in bytes. Only integers
      # are supported.

      struct MatchObjectSize
        include JSON::Serializable

        # Specifies the minimum object size in Bytes. The value must be a positive number, greater than 0 and
        # less than 50 TB.

        @[JSON::Field(key: "BytesGreaterThan")]
        getter bytes_greater_than : Int64?

        # Specifies the maximum object size in Bytes. The value must be a positive number, greater than the
        # minimum object size and less than 50 TB.

        @[JSON::Field(key: "BytesLessThan")]
        getter bytes_less_than : Int64?

        def initialize(
          @bytes_greater_than : Int64? = nil,
          @bytes_less_than : Int64? = nil
        )
        end
      end

      # A container that specifies replication metrics-related settings.

      struct Metrics
        include JSON::Serializable

        # Specifies whether replication metrics are enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A container that specifies the time threshold for emitting the
        # s3:Replication:OperationMissedThreshold event. This is not supported by Amazon S3 on Outposts
        # buckets.

        @[JSON::Field(key: "EventThreshold")]
        getter event_threshold : Types::ReplicationTimeValue?

        def initialize(
          @status : String,
          @event_threshold : Types::ReplicationTimeValue? = nil
        )
        end
      end

      # The Multi-Region Access Point access control policy. When you update the policy, the update is first
      # listed as the proposed policy. After the update is finished and all Regions have been updated, the
      # proposed policy is listed as the established policy. If both policies have the same version number,
      # the proposed policy is the established policy.

      struct MultiRegionAccessPointPolicyDocument
        include JSON::Serializable

        # The last established policy for the Multi-Region Access Point.

        @[JSON::Field(key: "Established")]
        getter established : Types::EstablishedMultiRegionAccessPointPolicy?

        # The proposed policy for the Multi-Region Access Point.

        @[JSON::Field(key: "Proposed")]
        getter proposed : Types::ProposedMultiRegionAccessPointPolicy?

        def initialize(
          @established : Types::EstablishedMultiRegionAccessPointPolicy? = nil,
          @proposed : Types::ProposedMultiRegionAccessPointPolicy? = nil
        )
        end
      end

      # Status information for a single Multi-Region Access Point Region.

      struct MultiRegionAccessPointRegionalResponse
        include JSON::Serializable

        # The name of the Region in the Multi-Region Access Point.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the Multi-Region Access Point in this Region.

        @[JSON::Field(key: "RequestStatus")]
        getter request_status : String?

        def initialize(
          @name : String? = nil,
          @request_status : String? = nil
        )
        end
      end

      # A collection of statuses for a Multi-Region Access Point in the various Regions it supports.

      struct MultiRegionAccessPointReport
        include JSON::Serializable

        # The alias for the Multi-Region Access Point. For more information about the distinction between the
        # name and the alias of an Multi-Region Access Point, see Rules for naming Amazon S3 Multi-Region
        # Access Points .

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # When the Multi-Region Access Point create request was received.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The name of the Multi-Region Access Point.

        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "PublicAccessBlock")]
        getter public_access_block : Types::PublicAccessBlockConfiguration?

        # A collection of the Regions and buckets associated with the Multi-Region Access Point.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::RegionReport)?

        # The current status of the Multi-Region Access Point. CREATING and DELETING are temporary states that
        # exist while the request is propagating and being completed. If a Multi-Region Access Point has a
        # status of PARTIALLY_CREATED , you can retry creation or send a request to delete the Multi-Region
        # Access Point. If a Multi-Region Access Point has a status of PARTIALLY_DELETED , you can retry a
        # delete request to finish the deletion of the Multi-Region Access Point.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @alias : String? = nil,
          @created_at : Time? = nil,
          @name : String? = nil,
          @public_access_block : Types::PublicAccessBlockConfiguration? = nil,
          @regions : Array(Types::RegionReport)? = nil,
          @status : String? = nil
        )
        end
      end

      # A structure for a Multi-Region Access Point that indicates where Amazon S3 traffic can be routed.
      # Routes can be either active or passive. Active routes can process Amazon S3 requests through the
      # Multi-Region Access Point, but passive routes are not eligible to process Amazon S3 requests. Each
      # route contains the Amazon S3 bucket name and the Amazon Web Services Region that the bucket is
      # located in. The route also includes the TrafficDialPercentage value, which shows whether the bucket
      # and Region are active (indicated by a value of 100 ) or passive (indicated by a value of 0 ).

      struct MultiRegionAccessPointRoute
        include JSON::Serializable

        # The traffic state for the specified bucket or Amazon Web Services Region. A value of 0 indicates a
        # passive state, which means that no new traffic will be routed to the Region. A value of 100
        # indicates an active state, which means that traffic will be routed to the specified Region. When the
        # routing configuration for a Region is changed from active to passive, any in-progress operations
        # (uploads, copies, deletes, and so on) to the formerly active Region will continue to run to until a
        # final success or failure status is reached. If all Regions in the routing configuration are
        # designated as passive, you'll receive an InvalidRequest error.

        @[JSON::Field(key: "TrafficDialPercentage")]
        getter traffic_dial_percentage : Int32

        # The name of the Amazon S3 bucket for which you'll submit a routing configuration change. Either the
        # Bucket or the Region value must be provided. If both are provided, the bucket must be in the
        # specified Region.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The Amazon Web Services Region to which you'll be submitting a routing configuration change. Either
        # the Bucket or the Region value must be provided. If both are provided, the bucket must be in the
        # specified Region.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @traffic_dial_percentage : Int32,
          @bucket : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The Multi-Region Access Point details that are returned when querying about an asynchronous request.

      struct MultiRegionAccessPointsAsyncResponse
        include JSON::Serializable

        # A collection of status information for the different Regions that a Multi-Region Access Point
        # supports.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::MultiRegionAccessPointRegionalResponse)?

        def initialize(
          @regions : Array(Types::MultiRegionAccessPointRegionalResponse)? = nil
        )
        end
      end

      # Amazon S3 throws this exception if you make a GetPublicAccessBlock request against an account that
      # doesn't have a PublicAccessBlockConfiguration set.

      struct NoSuchPublicAccessBlockConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The container of the noncurrent version expiration.

      struct NoncurrentVersionExpiration
        include JSON::Serializable

        # Specifies how many noncurrent versions S3 on Outposts will retain. If there are this many more
        # recent noncurrent versions, S3 on Outposts will take the associated action. For more information
        # about noncurrent versions, see Lifecycle configuration elements in the Amazon S3 User Guide .

        @[JSON::Field(key: "NewerNoncurrentVersions")]
        getter newer_noncurrent_versions : Int32?

        # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
        # action. For information about the noncurrent days calculations, see How Amazon S3 Calculates When an
        # Object Became Noncurrent in the Amazon S3 User Guide .

        @[JSON::Field(key: "NoncurrentDays")]
        getter noncurrent_days : Int32?

        def initialize(
          @newer_noncurrent_versions : Int32? = nil,
          @noncurrent_days : Int32? = nil
        )
        end
      end

      # The container for the noncurrent version transition.

      struct NoncurrentVersionTransition
        include JSON::Serializable

        # Specifies the number of days an object is noncurrent before Amazon S3 can perform the associated
        # action. For information about the noncurrent days calculations, see How Amazon S3 Calculates How
        # Long an Object Has Been Noncurrent in the Amazon S3 User Guide .

        @[JSON::Field(key: "NoncurrentDays")]
        getter noncurrent_days : Int32?

        # The class of storage used to store the object.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @noncurrent_days : Int32? = nil,
          @storage_class : String? = nil
        )
        end
      end


      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A filter that returns objects that aren't server-side encrypted.

      struct NotSSEFilter
        include JSON::Serializable

        def initialize
        end
      end

      # An optional filter for the S3JobManifestGenerator that identifies the subset of objects by
      # encryption type.

      struct ObjectEncryptionFilter
        include JSON::Serializable

        # Filters for objects that are encrypted by dual-layer server-side encryption with Amazon Web Services
        # Key Management Service (KMS) keys (DSSE-KMS).

        @[JSON::Field(key: "DSSE-KMS")]
        getter dssekms : Types::DSSEKMSFilter?

        # Filters for objects that are not encrypted by server-side encryption.

        @[JSON::Field(key: "NOT-SSE")]
        getter notsse : Types::NotSSEFilter?

        # Filters for objects that are encrypted by server-side encryption with customer-provided keys
        # (SSE-C).

        @[JSON::Field(key: "SSE-C")]
        getter ssec : Types::SSECFilter?

        # Filters for objects that are encrypted by server-side encryption with Amazon Web Services Key
        # Management Service (KMS) keys (SSE-KMS).

        @[JSON::Field(key: "SSE-KMS")]
        getter ssekms : Types::SSEKMSFilter?

        # Filters for objects that are encrypted by server-side encryption with Amazon S3 managed keys
        # (SSE-S3).

        @[JSON::Field(key: "SSE-S3")]
        getter sses3 : Types::SSES3Filter?

        def initialize(
          @dssekms : Types::DSSEKMSFilter? = nil,
          @notsse : Types::NotSSEFilter? = nil,
          @ssec : Types::SSECFilter? = nil,
          @ssekms : Types::SSEKMSFilter? = nil,
          @sses3 : Types::SSES3Filter? = nil
        )
        end
      end

      # An access point with an attached Lambda function used to access transformed data from an Amazon S3
      # bucket.

      struct ObjectLambdaAccessPoint
        include JSON::Serializable

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The alias of the Object Lambda Access Point.

        @[JSON::Field(key: "Alias")]
        getter alias : Types::ObjectLambdaAccessPointAlias?

        # Specifies the ARN for the Object Lambda Access Point.

        @[JSON::Field(key: "ObjectLambdaAccessPointArn")]
        getter object_lambda_access_point_arn : String?

        def initialize(
          @name : String,
          @alias : Types::ObjectLambdaAccessPointAlias? = nil,
          @object_lambda_access_point_arn : String? = nil
        )
        end
      end

      # The alias of an Object Lambda Access Point. For more information, see How to use a bucket-style
      # alias for your S3 bucket Object Lambda Access Point .

      struct ObjectLambdaAccessPointAlias
        include JSON::Serializable

        # The status of the Object Lambda Access Point alias. If the status is PROVISIONING , the Object
        # Lambda Access Point is provisioning the alias and the alias is not ready for use yet. If the status
        # is READY , the Object Lambda Access Point alias is successfully provisioned and ready for use.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The alias value of the Object Lambda Access Point.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @status : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A configuration used when creating an Object Lambda Access Point.

      struct ObjectLambdaConfiguration
        include JSON::Serializable

        # Standard access point associated with the Object Lambda Access Point.

        @[JSON::Field(key: "SupportingAccessPoint")]
        getter supporting_access_point : String

        # A container for transformation configurations for an Object Lambda Access Point.

        @[JSON::Field(key: "TransformationConfigurations")]
        getter transformation_configurations : Array(Types::ObjectLambdaTransformationConfiguration)

        # A container for allowed features. Valid inputs are GetObject-Range , GetObject-PartNumber ,
        # HeadObject-Range , and HeadObject-PartNumber .

        @[JSON::Field(key: "AllowedFeatures")]
        getter allowed_features : Array(String)?

        # A container for whether the CloudWatch metrics configuration is enabled.

        @[JSON::Field(key: "CloudWatchMetricsEnabled")]
        getter cloud_watch_metrics_enabled : Bool?

        def initialize(
          @supporting_access_point : String,
          @transformation_configurations : Array(Types::ObjectLambdaTransformationConfiguration),
          @allowed_features : Array(String)? = nil,
          @cloud_watch_metrics_enabled : Bool? = nil
        )
        end
      end

      # A container for AwsLambdaTransformation.

      struct ObjectLambdaContentTransformation
        include JSON::Serializable

        # A container for an Lambda function.

        @[JSON::Field(key: "AwsLambda")]
        getter aws_lambda : Types::AwsLambdaTransformation?

        def initialize(
          @aws_lambda : Types::AwsLambdaTransformation? = nil
        )
        end
      end

      # A configuration used when creating an Object Lambda Access Point transformation.

      struct ObjectLambdaTransformationConfiguration
        include JSON::Serializable

        # A container for the action of an Object Lambda Access Point configuration. Valid inputs are
        # GetObject , ListObjects , HeadObject , and ListObjectsV2 .

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # A container for the content transformation of an Object Lambda Access Point configuration.

        @[JSON::Field(key: "ContentTransformation")]
        getter content_transformation : Types::ObjectLambdaContentTransformation

        def initialize(
          @actions : Array(String),
          @content_transformation : Types::ObjectLambdaContentTransformation
        )
        end
      end

      # Indicates whether this access point policy is public. For more information about how Amazon S3
      # evaluates policies to determine whether they are public, see The Meaning of "Public" in the Amazon
      # S3 User Guide .

      struct PolicyStatus
        include JSON::Serializable


        @[JSON::Field(key: "IsPublic")]
        getter is_public : Bool?

        def initialize(
          @is_public : Bool? = nil
        )
        end
      end

      # A container for the prefix-level configuration.

      struct PrefixLevel
        include JSON::Serializable

        # A container for the prefix-level storage metrics for S3 Storage Lens.

        @[JSON::Field(key: "StorageMetrics")]
        getter storage_metrics : Types::PrefixLevelStorageMetrics

        def initialize(
          @storage_metrics : Types::PrefixLevelStorageMetrics
        )
        end
      end

      # A container for the prefix-level storage metrics for S3 Storage Lens.

      struct PrefixLevelStorageMetrics
        include JSON::Serializable

        # A container for whether prefix-level storage metrics are enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool?


        @[JSON::Field(key: "SelectionCriteria")]
        getter selection_criteria : Types::SelectionCriteria?

        def initialize(
          @is_enabled : Bool? = nil,
          @selection_criteria : Types::SelectionCriteria? = nil
        )
        end
      end

      # The proposed access control policy for the Multi-Region Access Point. When you update the policy,
      # the update is first listed as the proposed policy. After the update is finished and all Regions have
      # been updated, the proposed policy is listed as the established policy. If both policies have the
      # same version number, the proposed policy is the established policy.

      struct ProposedMultiRegionAccessPointPolicy
        include JSON::Serializable

        # The details of the proposed policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # The PublicAccessBlock configuration that you want to apply to this Amazon S3 account. You can enable
      # the configuration options in any combination. For more information about when Amazon S3 considers a
      # bucket or object public, see The Meaning of "Public" in the Amazon S3 User Guide . This data type is
      # not supported for Amazon S3 on Outposts.

      struct PublicAccessBlockConfiguration
        include JSON::Serializable

        # Specifies whether Amazon S3 should block public access control lists (ACLs) for buckets in this
        # account. Setting this element to TRUE causes the following behavior: PutBucketAcl and PutObjectAcl
        # calls fail if the specified ACL is public. PUT Object calls fail if the request includes a public
        # ACL. PUT Bucket calls fail if the request includes a public ACL. Enabling this setting doesn't
        # affect existing policies or ACLs. This property is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "BlockPublicAcls")]
        getter block_public_acls : Bool?

        # Specifies whether Amazon S3 should block public bucket policies for buckets in this account. Setting
        # this element to TRUE causes Amazon S3 to reject calls to PUT Bucket policy if the specified bucket
        # policy allows public access. Enabling this setting doesn't affect existing bucket policies. This
        # property is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "BlockPublicPolicy")]
        getter block_public_policy : Bool?

        # Specifies whether Amazon S3 should ignore public ACLs for buckets in this account. Setting this
        # element to TRUE causes Amazon S3 to ignore all public ACLs on buckets in this account and any
        # objects that they contain. Enabling this setting doesn't affect the persistence of any existing ACLs
        # and doesn't prevent new public ACLs from being set. This property is not supported for Amazon S3 on
        # Outposts.

        @[JSON::Field(key: "IgnorePublicAcls")]
        getter ignore_public_acls : Bool?

        # Specifies whether Amazon S3 should restrict public bucket policies for buckets in this account.
        # Setting this element to TRUE restricts access to buckets with public policies to only Amazon Web
        # Services service principals and authorized users within this account. Enabling this setting doesn't
        # affect previously stored bucket policies, except that public and cross-account access within any
        # public bucket policy, including non-public delegation to specific accounts, is blocked. This
        # property is not supported for Amazon S3 on Outposts.

        @[JSON::Field(key: "RestrictPublicBuckets")]
        getter restrict_public_buckets : Bool?

        def initialize(
          @block_public_acls : Bool? = nil,
          @block_public_policy : Bool? = nil,
          @ignore_public_acls : Bool? = nil,
          @restrict_public_buckets : Bool? = nil
        )
        end
      end


      struct PutAccessGrantsInstanceResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The resource policy of the S3 Access Grants instance that you are updating.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Organization of the resource policy of the S3 Access Grants instance.

        @[JSON::Field(key: "Organization")]
        getter organization : String?

        def initialize(
          @account_id : String,
          @policy : String,
          @organization : String? = nil
        )
        end
      end


      struct PutAccessGrantsInstanceResourcePolicyResult
        include JSON::Serializable

        # The date and time when you created the S3 Access Grants instance resource policy.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Organization of the resource policy of the S3 Access Grants instance.

        @[JSON::Field(key: "Organization")]
        getter organization : String?

        # The updated resource policy of the S3 Access Grants instance.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @created_at : Time? = nil,
          @organization : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct PutAccessPointConfigurationForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Object Lambda Access Point configuration document.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ObjectLambdaConfiguration

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @account_id : String,
          @configuration : Types::ObjectLambdaConfiguration,
          @name : String
        )
        end
      end


      struct PutAccessPointPolicyForObjectLambdaRequest
        include JSON::Serializable

        # The account ID for the account that owns the specified Object Lambda Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Object Lambda Access Point.

        @[JSON::Field(key: "name")]
        getter name : String

        # Object Lambda Access Point resource policy document.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @account_id : String,
          @name : String,
          @policy : String
        )
        end
      end


      struct PutAccessPointPolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for owner of the bucket associated with the specified access
        # point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point that you want to associate with the specified policy. For using this
        # parameter with Amazon S3 on Outposts with the REST API, you must specify the name and the
        # x-amz-outpost-id as well. For using this parameter with S3 on Outposts with the Amazon Web Services
        # SDK and CLI, you must specify the ARN of the access point accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/accesspoint/&lt;my-accesspoint-name&gt;
        # . For example, to access the access point reports-ap through Outpost my-outpost owned by account
        # 123456789012 in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/accesspoint/reports-ap . The value
        # must be URL encoded.

        @[JSON::Field(key: "name")]
        getter name : String

        # The policy that you want to apply to the specified access point. For more information about access
        # point policies, see Managing data access with Amazon S3 access points or Managing access to shared
        # datasets in directory buckets with access points in the Amazon S3 User Guide .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @account_id : String,
          @name : String,
          @policy : String
        )
        end
      end


      struct PutAccessPointScopeRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the access point with scope that you want to create or
        # replace.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the access point with the scope that you want to create or replace.

        @[JSON::Field(key: "name")]
        getter name : String

        # Object prefixes, API operations, or a combination of both.

        @[JSON::Field(key: "Scope")]
        getter scope : Types::Scope

        def initialize(
          @account_id : String,
          @name : String,
          @scope : Types::Scope
        )
        end
      end


      struct PutBucketLifecycleConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the bucket for which to set the configuration.

        @[JSON::Field(key: "name")]
        getter bucket : String

        # Container for lifecycle rules. You can add as many as 1,000 rules.

        @[JSON::Field(key: "LifecycleConfiguration")]
        getter lifecycle_configuration : Types::LifecycleConfiguration?

        def initialize(
          @account_id : String,
          @bucket : String,
          @lifecycle_configuration : Types::LifecycleConfiguration? = nil
        )
        end
      end


      struct PutBucketPolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the bucket. For using this parameter with Amazon S3 on Outposts with the REST API, you
        # must specify the name and the x-amz-outpost-id as well. For using this parameter with S3 on Outposts
        # with the Amazon Web Services SDK and CLI, you must specify the ARN of the bucket accessed in the
        # format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String

        # The bucket policy as a JSON document.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # Set this parameter to true to confirm that you want to remove your permissions to change this bucket
        # policy in the future. This is not supported by Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "x-amz-confirm-remove-self-bucket-access")]
        getter confirm_remove_self_bucket_access : Bool?

        def initialize(
          @account_id : String,
          @bucket : String,
          @policy : String,
          @confirm_remove_self_bucket_access : Bool? = nil
        )
        end
      end


      struct PutBucketReplicationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # Specifies the S3 on Outposts bucket to set the configuration for. For using this parameter with
        # Amazon S3 on Outposts with the REST API, you must specify the name and the x-amz-outpost-id as well.
        # For using this parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must
        # specify the ARN of the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String


        @[JSON::Field(key: "ReplicationConfiguration")]
        getter replication_configuration : Types::ReplicationConfiguration

        def initialize(
          @account_id : String,
          @bucket : String,
          @replication_configuration : Types::ReplicationConfiguration
        )
        end
      end


      struct PutBucketTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the bucket. For using this parameter with Amazon S3 on Outposts
        # with the REST API, you must specify the name and the x-amz-outpost-id as well. For using this
        # parameter with S3 on Outposts with the Amazon Web Services SDK and CLI, you must specify the ARN of
        # the bucket accessed in the format
        # arn:aws:s3-outposts:&lt;Region&gt;:&lt;account-id&gt;:outpost/&lt;outpost-id&gt;/bucket/&lt;my-bucket-name&gt;
        # . For example, to access the bucket reports through Outpost my-outpost owned by account 123456789012
        # in Region us-west-2 , use the URL encoding of
        # arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/bucket/reports . The value must be URL
        # encoded.

        @[JSON::Field(key: "name")]
        getter bucket : String


        @[JSON::Field(key: "Tagging")]
        getter tagging : Types::Tagging

        def initialize(
          @account_id : String,
          @bucket : String,
          @tagging : Types::Tagging
        )
        end
      end


      struct PutBucketVersioningRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the S3 on Outposts bucket.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The S3 on Outposts bucket to set the versioning state for.

        @[JSON::Field(key: "name")]
        getter bucket : String

        # The root-level tag for the VersioningConfiguration parameters.

        @[JSON::Field(key: "VersioningConfiguration")]
        getter versioning_configuration : Types::VersioningConfiguration

        # The concatenation of the authentication device's serial number, a space, and the value that is
        # displayed on your authentication device.

        @[JSON::Field(key: "x-amz-mfa")]
        getter mfa : String?

        def initialize(
          @account_id : String,
          @bucket : String,
          @versioning_configuration : Types::VersioningConfiguration,
          @mfa : String? = nil
        )
        end
      end


      struct PutJobTaggingRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID for the S3 Batch Operations job whose tags you want to replace.

        @[JSON::Field(key: "id")]
        getter job_id : String

        # The set of tags to associate with the S3 Batch Operations job.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)

        def initialize(
          @account_id : String,
          @job_id : String,
          @tags : Array(Types::S3Tag)
        )
        end
      end


      struct PutJobTaggingResult
        include JSON::Serializable

        def initialize
        end
      end

      # A container for the information associated with a PutMultiRegionAccessPoint request.

      struct PutMultiRegionAccessPointPolicyInput
        include JSON::Serializable

        # The name of the Multi-Region Access Point associated with the request.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The policy details for the PutMultiRegionAccessPoint request.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @name : String,
          @policy : String
        )
        end
      end


      struct PutMultiRegionAccessPointPolicyRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # An idempotency token used to identify the request and guarantee that requests are unique.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # A container element containing the details of the policy for the Multi-Region Access Point.

        @[JSON::Field(key: "Details")]
        getter details : Types::PutMultiRegionAccessPointPolicyInput

        def initialize(
          @account_id : String,
          @client_token : String,
          @details : Types::PutMultiRegionAccessPointPolicyInput
        )
        end
      end


      struct PutMultiRegionAccessPointPolicyResult
        include JSON::Serializable

        # The request token associated with the request. You can use this token with
        # DescribeMultiRegionAccessPointOperation to determine the status of asynchronous requests.

        @[JSON::Field(key: "RequestTokenARN")]
        getter request_token_arn : String?

        def initialize(
          @request_token_arn : String? = nil
        )
        end
      end


      struct PutPublicAccessBlockRequest
        include JSON::Serializable

        # The account ID for the Amazon Web Services account whose PublicAccessBlock configuration you want to
        # set.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The PublicAccessBlock configuration that you want to apply to the specified Amazon Web Services
        # account.

        @[JSON::Field(key: "PublicAccessBlockConfiguration")]
        getter public_access_block_configuration : Types::PublicAccessBlockConfiguration

        def initialize(
          @account_id : String,
          @public_access_block_configuration : Types::PublicAccessBlockConfiguration
        )
        end
      end


      struct PutStorageLensConfigurationRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        # The S3 Storage Lens configuration.

        @[JSON::Field(key: "StorageLensConfiguration")]
        getter storage_lens_configuration : Types::StorageLensConfiguration

        # The tag set of the S3 Storage Lens configuration. You can set up to a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::StorageLensTag)?

        def initialize(
          @account_id : String,
          @config_id : String,
          @storage_lens_configuration : Types::StorageLensConfiguration,
          @tags : Array(Types::StorageLensTag)? = nil
        )
        end
      end


      struct PutStorageLensConfigurationTaggingRequest
        include JSON::Serializable

        # The account ID of the requester.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the S3 Storage Lens configuration.

        @[JSON::Field(key: "storagelensid")]
        getter config_id : String

        # The tag set of the S3 Storage Lens configuration. You can set up to a maximum of 50 tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::StorageLensTag)

        def initialize(
          @account_id : String,
          @config_id : String,
          @tags : Array(Types::StorageLensTag)
        )
        end
      end


      struct PutStorageLensConfigurationTaggingResult
        include JSON::Serializable

        def initialize
        end
      end

      # A Region that supports a Multi-Region Access Point as well as the associated bucket for the Region.

      struct Region
        include JSON::Serializable

        # The name of the associated bucket for the Region.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The Amazon Web Services account ID that owns the Amazon S3 bucket that's associated with this
        # Multi-Region Access Point.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        def initialize(
          @bucket : String,
          @bucket_account_id : String? = nil
        )
        end
      end

      # A combination of a bucket and Region that's part of a Multi-Region Access Point.

      struct RegionReport
        include JSON::Serializable

        # The name of the bucket.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The Amazon Web Services account ID that owns the Amazon S3 bucket that's associated with this
        # Multi-Region Access Point.

        @[JSON::Field(key: "BucketAccountId")]
        getter bucket_account_id : String?

        # The name of the Region.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @bucket : String? = nil,
          @bucket_account_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The container for the regional bucket.

      struct RegionalBucket
        include JSON::Serializable


        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The creation date of the regional bucket

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time


        @[JSON::Field(key: "PublicAccessBlockEnabled")]
        getter public_access_block_enabled : Bool

        # The Amazon Resource Name (ARN) for the regional bucket.

        @[JSON::Field(key: "BucketArn")]
        getter bucket_arn : String?

        # The Outposts ID of the regional bucket.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        def initialize(
          @bucket : String,
          @creation_date : Time,
          @public_access_block_enabled : Bool,
          @bucket_arn : String? = nil,
          @outpost_id : String? = nil
        )
        end
      end

      # A filter that you can use to specify whether replica modification sync is enabled. S3 on Outposts
      # replica modification sync can help you keep object metadata synchronized between replicas and source
      # objects. By default, S3 on Outposts replicates metadata from the source objects to the replicas
      # only. When replica modification sync is enabled, S3 on Outposts replicates metadata changes made to
      # the replica copies back to the source object, making the replication bidirectional. To replicate
      # object metadata modifications on replicas, you can specify this element and set the Status of this
      # element to Enabled . You must enable replica modification sync on the source and destination buckets
      # to replicate replica metadata changes between the source and the replicas.

      struct ReplicaModifications
        include JSON::Serializable

        # Specifies whether S3 on Outposts replicates modifications to object metadata on replicas.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # A container for one or more replication rules. A replication configuration must have at least one
      # rule and you can add up to 100 rules. The maximum size of a replication configuration is 128 KB.

      struct ReplicationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that S3 on Outposts
        # assumes when replicating objects. For information about S3 replication on Outposts configuration,
        # see Setting up replication in the Amazon S3 User Guide .

        @[JSON::Field(key: "Role")]
        getter role : String

        # A container for one or more replication rules. A replication configuration must have at least one
        # rule and can contain an array of 100 rules at the most.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ReplicationRule)

        def initialize(
          @role : String,
          @rules : Array(Types::ReplicationRule)
        )
        end
      end

      # Specifies which S3 on Outposts objects to replicate and where to store the replicas.

      struct ReplicationRule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the access point for the source Outposts bucket that you want S3
        # on Outposts to replicate the objects from.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # A container for information about the replication destination and its configurations.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::Destination

        # Specifies whether the rule is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        # Specifies whether S3 on Outposts replicates delete markers. If you specify a Filter element in your
        # replication configuration, you must also include a DeleteMarkerReplication element. If your Filter
        # includes a Tag element, the DeleteMarkerReplication element's Status child element must be set to
        # Disabled , because S3 on Outposts doesn't support replicating delete markers for tag-based rules.
        # For more information about delete marker replication, see How delete operations affect replication
        # in the Amazon S3 User Guide .

        @[JSON::Field(key: "DeleteMarkerReplication")]
        getter delete_marker_replication : Types::DeleteMarkerReplication?

        # An optional configuration to replicate existing source bucket objects. This is not supported by
        # Amazon S3 on Outposts buckets.

        @[JSON::Field(key: "ExistingObjectReplication")]
        getter existing_object_replication : Types::ExistingObjectReplication?

        # A filter that identifies the subset of objects to which the replication rule applies. A Filter
        # element must specify exactly one Prefix , Tag , or And child element.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ReplicationRuleFilter?

        # A unique identifier for the rule. The maximum value is 255 characters.

        @[JSON::Field(key: "ID")]
        getter id : String?

        # An object key name prefix that identifies the object or objects to which the rule applies. The
        # maximum prefix length is 1,024 characters. To include all objects in an Outposts bucket, specify an
        # empty string. When you're using XML requests, you must replace special characters (such as carriage
        # returns) in object keys with their equivalent XML entity codes. For more information, see
        # XML-related object key constraints in the Amazon S3 User Guide .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # The priority indicates which rule has precedence whenever two or more replication rules conflict. S3
        # on Outposts attempts to replicate objects according to all replication rules. However, if there are
        # two or more rules with the same destination Outposts bucket, then objects will be replicated
        # according to the rule with the highest priority. The higher the number, the higher the priority. For
        # more information, see Creating replication rules on Outposts in the Amazon S3 User Guide .

        @[JSON::Field(key: "Priority")]
        getter priority : Int32?

        # A container that describes additional filters for identifying the source Outposts objects that you
        # want to replicate. You can choose to enable or disable the replication of these objects.

        @[JSON::Field(key: "SourceSelectionCriteria")]
        getter source_selection_criteria : Types::SourceSelectionCriteria?

        def initialize(
          @bucket : String,
          @destination : Types::Destination,
          @status : String,
          @delete_marker_replication : Types::DeleteMarkerReplication? = nil,
          @existing_object_replication : Types::ExistingObjectReplication? = nil,
          @filter : Types::ReplicationRuleFilter? = nil,
          @id : String? = nil,
          @prefix : String? = nil,
          @priority : Int32? = nil,
          @source_selection_criteria : Types::SourceSelectionCriteria? = nil
        )
        end
      end

      # A container for specifying rule filters. The filters determine the subset of objects to which the
      # rule applies. This element is required only if you specify more than one filter. For example: If you
      # specify both a Prefix and a Tag filter, wrap these filters in an And element. If you specify a
      # filter based on multiple tags, wrap the Tag elements in an And element.

      struct ReplicationRuleAndOperator
        include JSON::Serializable

        # An object key name prefix that identifies the subset of objects that the rule applies to.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # An array of tags that contain key and value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)?

        def initialize(
          @prefix : String? = nil,
          @tags : Array(Types::S3Tag)? = nil
        )
        end
      end

      # A filter that identifies the subset of objects to which the replication rule applies. A Filter
      # element must specify exactly one Prefix , Tag , or And child element.

      struct ReplicationRuleFilter
        include JSON::Serializable

        # A container for specifying rule filters. The filters determine the subset of objects that the rule
        # applies to. This element is required only if you specify more than one filter. For example: If you
        # specify both a Prefix and a Tag filter, wrap these filters in an And element. If you specify a
        # filter based on multiple tags, wrap the Tag elements in an And element.

        @[JSON::Field(key: "And")]
        getter and : Types::ReplicationRuleAndOperator?

        # An object key name prefix that identifies the subset of objects that the rule applies to. When
        # you're using XML requests, you must replace special characters (such as carriage returns) in object
        # keys with their equivalent XML entity codes. For more information, see XML-related object key
        # constraints in the Amazon S3 User Guide .

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?


        @[JSON::Field(key: "Tag")]
        getter tag : Types::S3Tag?

        def initialize(
          @and : Types::ReplicationRuleAndOperator? = nil,
          @prefix : String? = nil,
          @tag : Types::S3Tag? = nil
        )
        end
      end

      # A container that specifies S3 Replication Time Control (S3 RTC) related information, including
      # whether S3 RTC is enabled and the time when all objects and operations on objects must be
      # replicated. This is not supported by Amazon S3 on Outposts buckets.

      struct ReplicationTime
        include JSON::Serializable

        # Specifies whether S3 Replication Time Control (S3 RTC) is enabled.

        @[JSON::Field(key: "Status")]
        getter status : String

        # A container that specifies the time by which replication should be complete for all objects and
        # operations on objects.

        @[JSON::Field(key: "Time")]
        getter time : Types::ReplicationTimeValue

        def initialize(
          @status : String,
          @time : Types::ReplicationTimeValue
        )
        end
      end

      # A container that specifies the time value for S3 Replication Time Control (S3 RTC). This value is
      # also used for the replication metrics EventThreshold element. This is not supported by Amazon S3 on
      # Outposts buckets.

      struct ReplicationTimeValue
        include JSON::Serializable

        # Contains an integer that specifies the time period in minutes. Valid value: 15

        @[JSON::Field(key: "Minutes")]
        getter minutes : Int32?

        def initialize(
          @minutes : Int32? = nil
        )
        end
      end


      struct S3AccessControlList
        include JSON::Serializable


        @[JSON::Field(key: "Owner")]
        getter owner : Types::S3ObjectOwner


        @[JSON::Field(key: "Grants")]
        getter grants : Array(Types::S3Grant)?

        def initialize(
          @owner : Types::S3ObjectOwner,
          @grants : Array(Types::S3Grant)? = nil
        )
        end
      end


      struct S3AccessControlPolicy
        include JSON::Serializable


        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Types::S3AccessControlList?


        @[JSON::Field(key: "CannedAccessControlList")]
        getter canned_access_control_list : String?

        def initialize(
          @access_control_list : Types::S3AccessControlList? = nil,
          @canned_access_control_list : String? = nil
        )
        end
      end

      # A container for the bucket where the Amazon S3 Storage Lens metrics export files are located.

      struct S3BucketDestination
        include JSON::Serializable

        # The account ID of the owner of the S3 Storage Lens metrics export bucket.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the bucket. This property is read-only and follows the following
        # format: arn:aws:s3: us-east-1 : example-account-id :bucket/ your-destination-bucket-name

        @[JSON::Field(key: "Arn")]
        getter arn : String


        @[JSON::Field(key: "Format")]
        getter format : String

        # The schema version of the export file.

        @[JSON::Field(key: "OutputSchemaVersion")]
        getter output_schema_version : String

        # The container for the type encryption of the metrics exports in this bucket.

        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::StorageLensDataExportEncryption?

        # The prefix of the destination bucket where the metrics export will be delivered.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @account_id : String,
          @arn : String,
          @format : String,
          @output_schema_version : String,
          @encryption : Types::StorageLensDataExportEncryption? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Directs the specified job to invoke the ComputeObjectChecksum operation on every object listed in
      # the job's manifest.

      struct S3ComputeObjectChecksumOperation
        include JSON::Serializable

        # Indicates the algorithm that you want Amazon S3 to use to create the checksum. For more information,
        # see Checking object integrity in the Amazon S3 User Guide.

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : String?

        # Indicates the checksum type that you want Amazon S3 to use to calculate the object's checksum value.
        # For more information, see Checking object integrity in the Amazon S3 User Guide.

        @[JSON::Field(key: "ChecksumType")]
        getter checksum_type : String?

        def initialize(
          @checksum_algorithm : String? = nil,
          @checksum_type : String? = nil
        )
        end
      end

      # Contains the configuration parameters for a PUT Copy object operation. S3 Batch Operations passes
      # every object to the underlying CopyObject API operation. For more information about the parameters
      # for this operation, see CopyObject .

      struct S3CopyObjectOperation
        include JSON::Serializable

        # This functionality is not supported by directory buckets.

        @[JSON::Field(key: "AccessControlGrants")]
        getter access_control_grants : Array(Types::S3Grant)?

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using Amazon Web Services KMS (SSE-KMS). Setting this header to true causes Amazon S3 to
        # use an S3 Bucket Key for object encryption with SSE-KMS. Specifying this header with an Copy action
        # doesn’t affect bucket-level settings for S3 Bucket Key. Directory buckets - S3 Bucket Keys aren't
        # supported, when you copy SSE-KMS encrypted objects from general purpose buckets to directory
        # buckets, from directory buckets to general purpose buckets, or between directory buckets, through
        # the Copy operation in Batch Operations . In this case, Amazon S3 makes a call to KMS every time a
        # copy request is made for a KMS-encrypted object.

        @[JSON::Field(key: "BucketKeyEnabled")]
        getter bucket_key_enabled : Bool?

        # This functionality is not supported by directory buckets.

        @[JSON::Field(key: "CannedAccessControlList")]
        getter canned_access_control_list : String?

        # Indicates the algorithm that you want Amazon S3 to use to create the checksum. For more information,
        # see Checking object integrity in the Amazon S3 User Guide .

        @[JSON::Field(key: "ChecksumAlgorithm")]
        getter checksum_algorithm : String?


        @[JSON::Field(key: "MetadataDirective")]
        getter metadata_directive : String?


        @[JSON::Field(key: "ModifiedSinceConstraint")]
        getter modified_since_constraint : Time?

        # If you don't provide this parameter, Amazon S3 copies all the metadata from the original objects. If
        # you specify an empty set, the new objects will have no tags. Otherwise, Amazon S3 assigns the
        # supplied tags to the new objects.

        @[JSON::Field(key: "NewObjectMetadata")]
        getter new_object_metadata : Types::S3ObjectMetadata?

        # Specifies a list of tags to add to the destination objects after they are copied. If
        # NewObjectTagging is not specified, the tags of the source objects are copied to destination objects
        # by default. Directory buckets - Tags aren't supported by directory buckets. If your source objects
        # have tags and your destination bucket is a directory bucket, specify an empty tag set in the
        # NewObjectTagging field to prevent copying the source object tags to the directory bucket.

        @[JSON::Field(key: "NewObjectTagging")]
        getter new_object_tagging : Array(Types::S3Tag)?

        # The legal hold status to be applied to all objects in the Batch Operations job. This functionality
        # is not supported by directory buckets.

        @[JSON::Field(key: "ObjectLockLegalHoldStatus")]
        getter object_lock_legal_hold_status : String?

        # The retention mode to be applied to all objects in the Batch Operations job. This functionality is
        # not supported by directory buckets.

        @[JSON::Field(key: "ObjectLockMode")]
        getter object_lock_mode : String?

        # The date when the applied object retention configuration expires on all objects in the Batch
        # Operations job. This functionality is not supported by directory buckets.

        @[JSON::Field(key: "ObjectLockRetainUntilDate")]
        getter object_lock_retain_until_date : Time?

        # If the destination bucket is configured as a website, specifies an optional metadata property for
        # website redirects, x-amz-website-redirect-location . Allows webpage redirects if the object copy is
        # accessed through a website endpoint. This functionality is not supported by directory buckets.

        @[JSON::Field(key: "RedirectLocation")]
        getter redirect_location : String?

        # This functionality is not supported by directory buckets.

        @[JSON::Field(key: "RequesterPays")]
        getter requester_pays : Bool?

        # Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If the KMS
        # key doesn't exist in the same account that's issuing the command, you must use the full Key ARN not
        # the Key ID. Directory buckets - If you specify SSEAlgorithm with KMS , you must specify the
        # SSEAwsKmsKeyId parameter with the ID (Key ID or Key ARN) of the KMS symmetric encryption customer
        # managed key to use. Otherwise, you get an HTTP 400 Bad Request error. The key alias format of the
        # KMS key isn't supported. To encrypt new object copies in a directory bucket with SSE-KMS, you must
        # specify SSE-KMS as the directory bucket's default encryption configuration with a KMS key
        # (specifically, a customer managed key ). The Amazon Web Services managed key ( aws/s3 ) isn't
        # supported. Your SSE-KMS configuration can only support 1 customer managed key per directory bucket
        # for the lifetime of the bucket. After you specify a customer managed key for SSE-KMS as the bucket
        # default encryption, you can't override the customer managed key for the bucket's SSE-KMS
        # configuration. Then, when you specify server-side encryption settings for new object copies with
        # SSE-KMS, you must make sure the encryption key is the same customer managed key that you specified
        # for the directory bucket's default encryption configuration.

        @[JSON::Field(key: "SSEAwsKmsKeyId")]
        getter sse_aws_kms_key_id : String?

        # Specify the storage class for the destination objects in a Copy operation. Directory buckets - This
        # functionality is not supported by directory buckets.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        # Specifies the folder prefix that you want the objects to be copied into. For example, to copy
        # objects into a folder named Folder1 in the destination bucket, set the TargetKeyPrefix property to
        # Folder1 .

        @[JSON::Field(key: "TargetKeyPrefix")]
        getter target_key_prefix : String?

        # Specifies the destination bucket Amazon Resource Name (ARN) for the batch copy operation. General
        # purpose buckets - For example, to copy objects to a general purpose bucket named destinationBucket ,
        # set the TargetResource property to arn:aws:s3:::destinationBucket . Directory buckets - For example,
        # to copy objects to a directory bucket named destinationBucket in the Availability Zone identified by
        # the AZ ID usw2-az1 , set the TargetResource property to arn:aws:s3express: region : account_id
        # :/bucket/ destination_bucket_base_name -- usw2-az1 --x-s3 . A directory bucket as a destination
        # bucket can be in Availability Zone or Local Zone. Copying objects across different Amazon Web
        # Services Regions isn't supported when the source or destination bucket is in Amazon Web Services
        # Local Zones. The source and destination buckets must have the same parent Amazon Web Services
        # Region. Otherwise, you get an HTTP 400 Bad Request error with the error code InvalidRequest .

        @[JSON::Field(key: "TargetResource")]
        getter target_resource : String?


        @[JSON::Field(key: "UnModifiedSinceConstraint")]
        getter un_modified_since_constraint : Time?

        def initialize(
          @access_control_grants : Array(Types::S3Grant)? = nil,
          @bucket_key_enabled : Bool? = nil,
          @canned_access_control_list : String? = nil,
          @checksum_algorithm : String? = nil,
          @metadata_directive : String? = nil,
          @modified_since_constraint : Time? = nil,
          @new_object_metadata : Types::S3ObjectMetadata? = nil,
          @new_object_tagging : Array(Types::S3Tag)? = nil,
          @object_lock_legal_hold_status : String? = nil,
          @object_lock_mode : String? = nil,
          @object_lock_retain_until_date : Time? = nil,
          @redirect_location : String? = nil,
          @requester_pays : Bool? = nil,
          @sse_aws_kms_key_id : String? = nil,
          @storage_class : String? = nil,
          @target_key_prefix : String? = nil,
          @target_resource : String? = nil,
          @un_modified_since_constraint : Time? = nil
        )
        end
      end

      # Contains no configuration parameters because the DELETE Object tagging ( DeleteObjectTagging ) API
      # operation accepts only the bucket name and key name as parameters, which are defined in the job's
      # manifest.

      struct S3DeleteObjectTaggingOperation
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the specified job's generated manifest. Batch Operations jobs created with a
      # ManifestGenerator populate details of this descriptor after execution of the ManifestGenerator.

      struct S3GeneratedManifestDescriptor
        include JSON::Serializable

        # The format of the generated manifest.

        @[JSON::Field(key: "Format")]
        getter format : String?


        @[JSON::Field(key: "Location")]
        getter location : Types::JobManifestLocation?

        def initialize(
          @format : String? = nil,
          @location : Types::JobManifestLocation? = nil
        )
        end
      end


      struct S3Grant
        include JSON::Serializable


        @[JSON::Field(key: "Grantee")]
        getter grantee : Types::S3Grantee?


        @[JSON::Field(key: "Permission")]
        getter permission : String?

        def initialize(
          @grantee : Types::S3Grantee? = nil,
          @permission : String? = nil
        )
        end
      end


      struct S3Grantee
        include JSON::Serializable


        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?


        @[JSON::Field(key: "Identifier")]
        getter identifier : String?


        @[JSON::Field(key: "TypeIdentifier")]
        getter type_identifier : String?

        def initialize(
          @display_name : String? = nil,
          @identifier : String? = nil,
          @type_identifier : String? = nil
        )
        end
      end

      # Contains the configuration parameters for a POST Object restore job. S3 Batch Operations passes
      # every object to the underlying RestoreObject API operation. For more information about the
      # parameters for this operation, see RestoreObject .

      struct S3InitiateRestoreObjectOperation
        include JSON::Serializable

        # This argument specifies how long the S3 Glacier or S3 Glacier Deep Archive object remains available
        # in Amazon S3. S3 Initiate Restore Object jobs that target S3 Glacier and S3 Glacier Deep Archive
        # objects require ExpirationInDays set to 1 or greater. Conversely, do not set ExpirationInDays when
        # creating S3 Initiate Restore Object jobs that target S3 Intelligent-Tiering Archive Access and Deep
        # Archive Access tier objects. Objects in S3 Intelligent-Tiering archive access tiers are not subject
        # to restore expiry, so specifying ExpirationInDays results in restore request failure. S3 Batch
        # Operations jobs can operate either on S3 Glacier and S3 Glacier Deep Archive storage class objects
        # or on S3 Intelligent-Tiering Archive Access and Deep Archive Access storage tier objects, but not
        # both types in the same job. If you need to restore objects of both types you must create separate
        # Batch Operations jobs.

        @[JSON::Field(key: "ExpirationInDays")]
        getter expiration_in_days : Int32?

        # S3 Batch Operations supports STANDARD and BULK retrieval tiers, but not the EXPEDITED retrieval
        # tier.

        @[JSON::Field(key: "GlacierJobTier")]
        getter glacier_job_tier : String?

        def initialize(
          @expiration_in_days : Int32? = nil,
          @glacier_job_tier : String? = nil
        )
        end
      end

      # The container for the service that will create the S3 manifest.

      struct S3JobManifestGenerator
        include JSON::Serializable

        # Determines whether or not to write the job's generated manifest to a bucket.

        @[JSON::Field(key: "EnableManifestOutput")]
        getter enable_manifest_output : Bool

        # The ARN of the source bucket used by the ManifestGenerator. Directory buckets - Directory buckets
        # aren't supported as the source buckets used by S3JobManifestGenerator to generate the job manifest.

        @[JSON::Field(key: "SourceBucket")]
        getter source_bucket : String

        # The Amazon Web Services account ID that owns the bucket the generated manifest is written to. If
        # provided the generated manifest bucket's owner Amazon Web Services account ID must match this value,
        # else the job fails.

        @[JSON::Field(key: "ExpectedBucketOwner")]
        getter expected_bucket_owner : String?

        # Specifies rules the S3JobManifestGenerator should use to decide whether an object in the source
        # bucket should or should not be included in the generated job manifest.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::JobManifestGeneratorFilter?

        # Specifies the location the generated manifest will be written to. Manifests can't be written to
        # directory buckets. For more information, see Directory buckets .

        @[JSON::Field(key: "ManifestOutputLocation")]
        getter manifest_output_location : Types::S3ManifestOutputLocation?

        def initialize(
          @enable_manifest_output : Bool,
          @source_bucket : String,
          @expected_bucket_owner : String? = nil,
          @filter : Types::JobManifestGeneratorFilter? = nil,
          @manifest_output_location : Types::S3ManifestOutputLocation? = nil
        )
        end
      end

      # Location details for where the generated manifest should be written.

      struct S3ManifestOutputLocation
        include JSON::Serializable

        # The bucket ARN the generated manifest should be written to. Directory buckets - Directory buckets
        # aren't supported as the buckets to store the generated manifest.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The format of the generated manifest.

        @[JSON::Field(key: "ManifestFormat")]
        getter manifest_format : String

        # The Account ID that owns the bucket the generated manifest is written to.

        @[JSON::Field(key: "ExpectedManifestBucketOwner")]
        getter expected_manifest_bucket_owner : String?

        # Specifies what encryption should be used when the generated manifest objects are written.

        @[JSON::Field(key: "ManifestEncryption")]
        getter manifest_encryption : Types::GeneratedManifestEncryption?

        # Prefix identifying one or more objects to which the manifest applies.

        @[JSON::Field(key: "ManifestPrefix")]
        getter manifest_prefix : String?

        def initialize(
          @bucket : String,
          @manifest_format : String,
          @expected_manifest_bucket_owner : String? = nil,
          @manifest_encryption : Types::GeneratedManifestEncryption? = nil,
          @manifest_prefix : String? = nil
        )
        end
      end

      # Whether S3 Object Lock legal hold will be applied to objects in an S3 Batch Operations job.

      struct S3ObjectLockLegalHold
        include JSON::Serializable

        # The Object Lock legal hold status to be applied to all objects in the Batch Operations job.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct S3ObjectMetadata
        include JSON::Serializable


        @[JSON::Field(key: "CacheControl")]
        getter cache_control : String?


        @[JSON::Field(key: "ContentDisposition")]
        getter content_disposition : String?


        @[JSON::Field(key: "ContentEncoding")]
        getter content_encoding : String?


        @[JSON::Field(key: "ContentLanguage")]
        getter content_language : String?

        # This member has been deprecated.

        @[JSON::Field(key: "ContentLength")]
        getter content_length : Int64?

        # This member has been deprecated.

        @[JSON::Field(key: "ContentMD5")]
        getter content_md5 : String?


        @[JSON::Field(key: "ContentType")]
        getter content_type : String?


        @[JSON::Field(key: "HttpExpiresDate")]
        getter http_expires_date : Time?

        # This member has been deprecated.

        @[JSON::Field(key: "RequesterCharged")]
        getter requester_charged : Bool?

        # The server-side encryption algorithm used when storing objects in Amazon S3. Directory buckets - For
        # directory buckets, there are only two supported options for server-side encryption: server-side
        # encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side encryption with KMS keys
        # (SSE-KMS) ( KMS ). For more information, see Protecting data with server-side encryption in the
        # Amazon S3 User Guide . For the Copy operation in Batch Operations , see S3CopyObjectOperation .

        @[JSON::Field(key: "SSEAlgorithm")]
        getter sse_algorithm : String?


        @[JSON::Field(key: "UserMetadata")]
        getter user_metadata : Hash(String, String)?

        def initialize(
          @cache_control : String? = nil,
          @content_disposition : String? = nil,
          @content_encoding : String? = nil,
          @content_language : String? = nil,
          @content_length : Int64? = nil,
          @content_md5 : String? = nil,
          @content_type : String? = nil,
          @http_expires_date : Time? = nil,
          @requester_charged : Bool? = nil,
          @sse_algorithm : String? = nil,
          @user_metadata : Hash(String, String)? = nil
        )
        end
      end


      struct S3ObjectOwner
        include JSON::Serializable


        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?


        @[JSON::Field(key: "ID")]
        getter id : String?

        def initialize(
          @display_name : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Directs the specified job to invoke ReplicateObject on every object in the job's manifest.

      struct S3ReplicateObjectOperation
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the S3 Object Lock retention mode to be applied to all objects in the S3 Batch Operations
      # job. If you don't provide Mode and RetainUntilDate data types in your operation, you will remove the
      # retention from your objects. For more information, see Using S3 Object Lock retention with S3 Batch
      # Operations in the Amazon S3 User Guide .

      struct S3Retention
        include JSON::Serializable

        # The Object Lock retention mode to be applied to all objects in the Batch Operations job.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The date when the applied Object Lock retention will expire on all objects set by the Batch
        # Operations job.

        @[JSON::Field(key: "RetainUntilDate")]
        getter retain_until_date : Time?

        def initialize(
          @mode : String? = nil,
          @retain_until_date : Time? = nil
        )
        end
      end

      # Contains the configuration parameters for a PUT Object ACL operation. S3 Batch Operations passes
      # every object to the underlying PutObjectAcl API operation. For more information about the parameters
      # for this operation, see PutObjectAcl .

      struct S3SetObjectAclOperation
        include JSON::Serializable


        @[JSON::Field(key: "AccessControlPolicy")]
        getter access_control_policy : Types::S3AccessControlPolicy?

        def initialize(
          @access_control_policy : Types::S3AccessControlPolicy? = nil
        )
        end
      end

      # Contains the configuration for an S3 Object Lock legal hold operation that an S3 Batch Operations
      # job passes to every object to the underlying PutObjectLegalHold API operation. For more information,
      # see Using S3 Object Lock legal hold with S3 Batch Operations in the Amazon S3 User Guide . This
      # functionality is not supported by directory buckets.

      struct S3SetObjectLegalHoldOperation
        include JSON::Serializable

        # Contains the Object Lock legal hold status to be applied to all objects in the Batch Operations job.

        @[JSON::Field(key: "LegalHold")]
        getter legal_hold : Types::S3ObjectLockLegalHold

        def initialize(
          @legal_hold : Types::S3ObjectLockLegalHold
        )
        end
      end

      # Contains the configuration parameters for the Object Lock retention action for an S3 Batch
      # Operations job. Batch Operations passes every object to the underlying PutObjectRetention API
      # operation. For more information, see Using S3 Object Lock retention with S3 Batch Operations in the
      # Amazon S3 User Guide . This functionality is not supported by directory buckets.

      struct S3SetObjectRetentionOperation
        include JSON::Serializable

        # Contains the Object Lock retention mode to be applied to all objects in the Batch Operations job.
        # For more information, see Using S3 Object Lock retention with S3 Batch Operations in the Amazon S3
        # User Guide .

        @[JSON::Field(key: "Retention")]
        getter retention : Types::S3Retention

        # Indicates if the action should be applied to objects in the Batch Operations job even if they have
        # Object Lock GOVERNANCE type in place.

        @[JSON::Field(key: "BypassGovernanceRetention")]
        getter bypass_governance_retention : Bool?

        def initialize(
          @retention : Types::S3Retention,
          @bypass_governance_retention : Bool? = nil
        )
        end
      end

      # Contains the configuration parameters for a PUT Object Tagging operation. S3 Batch Operations passes
      # every object to the underlying PutObjectTagging API operation. For more information about the
      # parameters for this operation, see PutObjectTagging .

      struct S3SetObjectTaggingOperation
        include JSON::Serializable


        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::S3Tag)?

        def initialize(
          @tag_set : Array(Types::S3Tag)? = nil
        )
        end
      end

      # A container for a key-value name pair.

      struct S3Tag
        include JSON::Serializable

        # Key of the tag

        @[JSON::Field(key: "Key")]
        getter key : String

        # Value of the tag

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # A filter that returns objects that are encrypted by server-side encryption with customer-provided
      # keys (SSE-C).

      struct SSECFilter
        include JSON::Serializable

        def initialize
        end
      end


      struct SSEKMS
        include JSON::Serializable

        # A container for the ARN of the SSE-KMS encryption. This property is read-only and follows the
        # following format: arn:aws:kms: us-east-1 : example-account-id :key/
        # example-9a73-4afc-8d29-8f5900cef44e

        @[JSON::Field(key: "KeyId")]
        getter key_id : String

        def initialize(
          @key_id : String
        )
        end
      end

      # Configuration for the use of SSE-KMS to encrypt generated manifest objects.

      struct SSEKMSEncryption
        include JSON::Serializable

        # Specifies the ID of the Amazon Web Services Key Management Service (Amazon Web Services KMS)
        # symmetric encryption customer managed key to use for encrypting generated manifest objects.

        @[JSON::Field(key: "KeyId")]
        getter key_id : String

        def initialize(
          @key_id : String
        )
        end
      end

      # A filter that returns objects that are encrypted by server-side encryption with Amazon Web Services
      # KMS (SSE-KMS).

      struct SSEKMSFilter
        include JSON::Serializable

        # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
        # encryption using Amazon Web Services Key Management Service (Amazon Web Services KMS) keys
        # (SSE-KMS). If specified, will filter SSE-KMS encrypted objects by S3 Bucket Key status.

        @[JSON::Field(key: "BucketKeyEnabled")]
        getter bucket_key_enabled : Bool?

        # The Amazon Resource Name (ARN) of the customer managed KMS key to use for the filter to return
        # objects that are encrypted by the specified key. For best performance, use keys in the same Region
        # as the S3 Batch Operations job.

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @bucket_key_enabled : Bool? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct SSES3
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for the use of SSE-S3 to encrypt generated manifest objects.

      struct SSES3Encryption
        include JSON::Serializable

        def initialize
        end
      end

      # A filter that returns objects that are encrypted by server-side encryption with Amazon S3 managed
      # keys (SSE-S3).

      struct SSES3Filter
        include JSON::Serializable

        def initialize
        end
      end

      # You can use the access point scope to restrict access to specific prefixes, API operations, or a
      # combination of both. For more information, see Manage the scope of your access points for directory
      # buckets .

      struct Scope
        include JSON::Serializable

        # You can include one or more API operations as permissions.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(String)?

        # You can specify any amount of prefixes, but the total length of characters of all prefixes must be
        # less than 256 bytes in size.

        @[JSON::Field(key: "Prefixes")]
        getter prefixes : Array(String)?

        def initialize(
          @permissions : Array(String)? = nil,
          @prefixes : Array(String)? = nil
        )
        end
      end


      struct SelectionCriteria
        include JSON::Serializable

        # A container for the delimiter of the selection criteria being used.

        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # The max depth of the selection criteria

        @[JSON::Field(key: "MaxDepth")]
        getter max_depth : Int32?

        # The minimum number of storage bytes percentage whose metrics will be selected. You must choose a
        # value greater than or equal to 1.0 .

        @[JSON::Field(key: "MinStorageBytesPercentage")]
        getter min_storage_bytes_percentage : Float64?

        def initialize(
          @delimiter : String? = nil,
          @max_depth : Int32? = nil,
          @min_storage_bytes_percentage : Float64? = nil
        )
        end
      end

      # A container that describes additional filters for identifying the source objects that you want to
      # replicate. You can choose to enable or disable the replication of these objects.

      struct SourceSelectionCriteria
        include JSON::Serializable

        # A filter that you can use to specify whether replica modification sync is enabled. S3 on Outposts
        # replica modification sync can help you keep object metadata synchronized between replicas and source
        # objects. By default, S3 on Outposts replicates metadata from the source objects to the replicas
        # only. When replica modification sync is enabled, S3 on Outposts replicates metadata changes made to
        # the replica copies back to the source object, making the replication bidirectional. To replicate
        # object metadata modifications on replicas, you can specify this element and set the Status of this
        # element to Enabled . You must enable replica modification sync on the source and destination buckets
        # to replicate replica metadata changes between the source and the replicas.

        @[JSON::Field(key: "ReplicaModifications")]
        getter replica_modifications : Types::ReplicaModifications?

        # A filter that you can use to select Amazon S3 objects that are encrypted with server-side encryption
        # by using Key Management Service (KMS) keys. If you include SourceSelectionCriteria in the
        # replication configuration, this element is required. This is not supported by Amazon S3 on Outposts
        # buckets.

        @[JSON::Field(key: "SseKmsEncryptedObjects")]
        getter sse_kms_encrypted_objects : Types::SseKmsEncryptedObjects?

        def initialize(
          @replica_modifications : Types::ReplicaModifications? = nil,
          @sse_kms_encrypted_objects : Types::SseKmsEncryptedObjects? = nil
        )
        end
      end

      # A container for filter information that you can use to select S3 objects that are encrypted with Key
      # Management Service (KMS). This is not supported by Amazon S3 on Outposts buckets.

      struct SseKmsEncryptedObjects
        include JSON::Serializable

        # Specifies whether Amazon S3 replicates objects that are created with server-side encryption by using
        # an KMS key stored in Key Management Service.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # The Amazon Web Services organization for your S3 Storage Lens.

      struct StorageLensAwsOrg
        include JSON::Serializable

        # A container for the Amazon Resource Name (ARN) of the Amazon Web Services organization. This
        # property is read-only and follows the following format: arn:aws:organizations: us-east-1 :
        # example-account-id :organization/ o-ex2l495dck

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # A container for the Amazon S3 Storage Lens configuration.

      struct StorageLensConfiguration
        include JSON::Serializable

        # A container for all the account-level configurations of your S3 Storage Lens configuration.

        @[JSON::Field(key: "AccountLevel")]
        getter account_level : Types::AccountLevel

        # A container for the Amazon S3 Storage Lens configuration ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A container for whether the S3 Storage Lens configuration is enabled.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool

        # A container for the Amazon Web Services organization for this S3 Storage Lens configuration.

        @[JSON::Field(key: "AwsOrg")]
        getter aws_org : Types::StorageLensAwsOrg?

        # A container to specify the properties of your S3 Storage Lens metrics export including, the
        # destination, schema and format.

        @[JSON::Field(key: "DataExport")]
        getter data_export : Types::StorageLensDataExport?

        # A container for what is excluded in this configuration. This container can only be valid if there is
        # no Include container submitted, and it's not empty.

        @[JSON::Field(key: "Exclude")]
        getter exclude : Types::Exclude?

        # A container that configures your S3 Storage Lens expanded prefixes metrics report.

        @[JSON::Field(key: "ExpandedPrefixesDataExport")]
        getter expanded_prefixes_data_export : Types::StorageLensExpandedPrefixesDataExport?

        # A container for what is included in this configuration. This container can only be valid if there is
        # no Exclude container submitted, and it's not empty.

        @[JSON::Field(key: "Include")]
        getter include : Types::Include?

        # A container for all prefix delimiters that are used for object keys in this S3 Storage Lens
        # configuration. The prefix delimiters determine how S3 Storage Lens counts prefix depth, by
        # separating the hierarchical levels in object keys. If either a prefix delimiter or existing
        # delimiter is undefined, Amazon S3 uses the delimiter that’s defined. If both the prefix delimiter
        # and existing delimiter are undefined, S3 uses / as the default delimiter. When custom delimiters are
        # used, both the prefix delimiter and existing delimiter must specify the same special character.
        # Otherwise, your request results in an error.

        @[JSON::Field(key: "PrefixDelimiter")]
        getter prefix_delimiter : String?

        # The Amazon Resource Name (ARN) of the S3 Storage Lens configuration. This property is read-only and
        # follows the following format: arn:aws:s3: us-east-1 : example-account-id :storage-lens/
        # your-dashboard-name

        @[JSON::Field(key: "StorageLensArn")]
        getter storage_lens_arn : String?

        def initialize(
          @account_level : Types::AccountLevel,
          @id : String,
          @is_enabled : Bool,
          @aws_org : Types::StorageLensAwsOrg? = nil,
          @data_export : Types::StorageLensDataExport? = nil,
          @exclude : Types::Exclude? = nil,
          @expanded_prefixes_data_export : Types::StorageLensExpandedPrefixesDataExport? = nil,
          @include : Types::Include? = nil,
          @prefix_delimiter : String? = nil,
          @storage_lens_arn : String? = nil
        )
        end
      end

      # A container to specify the properties of your S3 Storage Lens metrics export, including the
      # destination, schema, and format.

      struct StorageLensDataExport
        include JSON::Serializable

        # A container for enabling Amazon CloudWatch publishing for S3 Storage Lens metrics.

        @[JSON::Field(key: "CloudWatchMetrics")]
        getter cloud_watch_metrics : Types::CloudWatchMetrics?

        # A container for the bucket where the S3 Storage Lens metrics export will be located. This bucket
        # must be located in the same Region as the storage lens configuration.

        @[JSON::Field(key: "S3BucketDestination")]
        getter s3_bucket_destination : Types::S3BucketDestination?

        # A container for configuring S3 Storage Lens data exports to read-only S3 table buckets.

        @[JSON::Field(key: "StorageLensTableDestination")]
        getter storage_lens_table_destination : Types::StorageLensTableDestination?

        def initialize(
          @cloud_watch_metrics : Types::CloudWatchMetrics? = nil,
          @s3_bucket_destination : Types::S3BucketDestination? = nil,
          @storage_lens_table_destination : Types::StorageLensTableDestination? = nil
        )
        end
      end

      # A container for the encryption of the S3 Storage Lens metrics exports.

      struct StorageLensDataExportEncryption
        include JSON::Serializable


        @[JSON::Field(key: "SSE-KMS")]
        getter ssekms : Types::SSEKMS?


        @[JSON::Field(key: "SSE-S3")]
        getter sses3 : Types::SSES3?

        def initialize(
          @ssekms : Types::SSEKMS? = nil,
          @sses3 : Types::SSES3? = nil
        )
        end
      end

      # A container for your S3 Storage Lens expanded prefix metrics report configuration. Unlike the
      # default Storage Lens metrics report, the enhanced prefix metrics report includes all S3 Storage Lens
      # storage and activity data related to the full list of prefixes in your Storage Lens configuration.

      struct StorageLensExpandedPrefixesDataExport
        include JSON::Serializable


        @[JSON::Field(key: "S3BucketDestination")]
        getter s3_bucket_destination : Types::S3BucketDestination?

        # A container for the bucket where the S3 Storage Lens metric export files are located. At least one
        # export destination must be specified.

        @[JSON::Field(key: "StorageLensTableDestination")]
        getter storage_lens_table_destination : Types::StorageLensTableDestination?

        def initialize(
          @s3_bucket_destination : Types::S3BucketDestination? = nil,
          @storage_lens_table_destination : Types::StorageLensTableDestination? = nil
        )
        end
      end

      # A custom grouping of objects that include filters for prefixes, suffixes, object tags, object size,
      # or object age. You can create an S3 Storage Lens group that includes a single filter or multiple
      # filter conditions. To specify multiple filter conditions, you use AND or OR logical operators.

      struct StorageLensGroup
        include JSON::Serializable

        # Sets the criteria for the Storage Lens group data that is displayed. For multiple filter conditions,
        # the AND or OR logical operator is used.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::StorageLensGroupFilter

        # Contains the name of the Storage Lens group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Contains the Amazon Resource Name (ARN) of the Storage Lens group. This property is read-only.

        @[JSON::Field(key: "StorageLensGroupArn")]
        getter storage_lens_group_arn : String?

        def initialize(
          @filter : Types::StorageLensGroupFilter,
          @name : String,
          @storage_lens_group_arn : String? = nil
        )
        end
      end

      # A logical operator that allows multiple filter conditions to be joined for more complex comparisons
      # of Storage Lens group data.

      struct StorageLensGroupAndOperator
        include JSON::Serializable

        # Contains a list of prefixes. At least one prefix must be specified. Up to 10 prefixes are allowed.

        @[JSON::Field(key: "MatchAnyPrefix")]
        getter match_any_prefix : Array(String)?

        # Contains a list of suffixes. At least one suffix must be specified. Up to 10 suffixes are allowed.

        @[JSON::Field(key: "MatchAnySuffix")]
        getter match_any_suffix : Array(String)?

        # Contains the list of object tags. At least one object tag must be specified. Up to 10 object tags
        # are allowed.

        @[JSON::Field(key: "MatchAnyTag")]
        getter match_any_tag : Array(Types::S3Tag)?

        # Contains DaysGreaterThan and DaysLessThan to define the object age range (minimum and maximum number
        # of days).

        @[JSON::Field(key: "MatchObjectAge")]
        getter match_object_age : Types::MatchObjectAge?

        # Contains BytesGreaterThan and BytesLessThan to define the object size range (minimum and maximum
        # number of Bytes).

        @[JSON::Field(key: "MatchObjectSize")]
        getter match_object_size : Types::MatchObjectSize?

        def initialize(
          @match_any_prefix : Array(String)? = nil,
          @match_any_suffix : Array(String)? = nil,
          @match_any_tag : Array(Types::S3Tag)? = nil,
          @match_object_age : Types::MatchObjectAge? = nil,
          @match_object_size : Types::MatchObjectSize? = nil
        )
        end
      end

      # The filter element sets the criteria for the Storage Lens group data that is displayed. For multiple
      # filter conditions, the AND or OR logical operator is used.

      struct StorageLensGroupFilter
        include JSON::Serializable

        # A logical operator that allows multiple filter conditions to be joined for more complex comparisons
        # of Storage Lens group data. Objects must match all of the listed filter conditions that are joined
        # by the And logical operator. Only one of each filter condition is allowed.

        @[JSON::Field(key: "And")]
        getter and : Types::StorageLensGroupAndOperator?

        # Contains a list of prefixes. At least one prefix must be specified. Up to 10 prefixes are allowed.

        @[JSON::Field(key: "MatchAnyPrefix")]
        getter match_any_prefix : Array(String)?

        # Contains a list of suffixes. At least one suffix must be specified. Up to 10 suffixes are allowed.

        @[JSON::Field(key: "MatchAnySuffix")]
        getter match_any_suffix : Array(String)?

        # Contains the list of S3 object tags. At least one object tag must be specified. Up to 10 object tags
        # are allowed.

        @[JSON::Field(key: "MatchAnyTag")]
        getter match_any_tag : Array(Types::S3Tag)?

        # Contains DaysGreaterThan and DaysLessThan to define the object age range (minimum and maximum number
        # of days).

        @[JSON::Field(key: "MatchObjectAge")]
        getter match_object_age : Types::MatchObjectAge?

        # Contains BytesGreaterThan and BytesLessThan to define the object size range (minimum and maximum
        # number of Bytes).

        @[JSON::Field(key: "MatchObjectSize")]
        getter match_object_size : Types::MatchObjectSize?

        # A single logical operator that allows multiple filter conditions to be joined. Objects can match any
        # of the listed filter conditions, which are joined by the Or logical operator. Only one of each
        # filter condition is allowed.

        @[JSON::Field(key: "Or")]
        getter or : Types::StorageLensGroupOrOperator?

        def initialize(
          @and : Types::StorageLensGroupAndOperator? = nil,
          @match_any_prefix : Array(String)? = nil,
          @match_any_suffix : Array(String)? = nil,
          @match_any_tag : Array(Types::S3Tag)? = nil,
          @match_object_age : Types::MatchObjectAge? = nil,
          @match_object_size : Types::MatchObjectSize? = nil,
          @or : Types::StorageLensGroupOrOperator? = nil
        )
        end
      end

      # Specifies the Storage Lens groups to include in the Storage Lens group aggregation.

      struct StorageLensGroupLevel
        include JSON::Serializable

        # Indicates which Storage Lens group ARNs to include or exclude in the Storage Lens group aggregation.
        # If this value is left null, then all Storage Lens groups are selected.

        @[JSON::Field(key: "SelectionCriteria")]
        getter selection_criteria : Types::StorageLensGroupLevelSelectionCriteria?

        def initialize(
          @selection_criteria : Types::StorageLensGroupLevelSelectionCriteria? = nil
        )
        end
      end

      # Indicates which Storage Lens group ARNs to include or exclude in the Storage Lens group aggregation.
      # You can only attach Storage Lens groups to your Storage Lens dashboard if they're included in your
      # Storage Lens group aggregation. If this value is left null, then all Storage Lens groups are
      # selected.

      struct StorageLensGroupLevelSelectionCriteria
        include JSON::Serializable

        # Indicates which Storage Lens group ARNs to exclude from the Storage Lens group aggregation.

        @[JSON::Field(key: "Exclude")]
        getter exclude : Array(String)?

        # Indicates which Storage Lens group ARNs to include in the Storage Lens group aggregation.

        @[JSON::Field(key: "Include")]
        getter include : Array(String)?

        def initialize(
          @exclude : Array(String)? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      # A container element for specifying Or rule conditions. The rule conditions determine the subset of
      # objects to which the Or rule applies. Objects can match any of the listed filter conditions, which
      # are joined by the Or logical operator. Only one of each filter condition is allowed.

      struct StorageLensGroupOrOperator
        include JSON::Serializable

        # Filters objects that match any of the specified prefixes.

        @[JSON::Field(key: "MatchAnyPrefix")]
        getter match_any_prefix : Array(String)?

        # Filters objects that match any of the specified suffixes.

        @[JSON::Field(key: "MatchAnySuffix")]
        getter match_any_suffix : Array(String)?

        # Filters objects that match any of the specified S3 object tags.

        @[JSON::Field(key: "MatchAnyTag")]
        getter match_any_tag : Array(Types::S3Tag)?

        # Filters objects that match the specified object age range.

        @[JSON::Field(key: "MatchObjectAge")]
        getter match_object_age : Types::MatchObjectAge?

        # Filters objects that match the specified object size range.

        @[JSON::Field(key: "MatchObjectSize")]
        getter match_object_size : Types::MatchObjectSize?

        def initialize(
          @match_any_prefix : Array(String)? = nil,
          @match_any_suffix : Array(String)? = nil,
          @match_any_tag : Array(Types::S3Tag)? = nil,
          @match_object_age : Types::MatchObjectAge? = nil,
          @match_object_size : Types::MatchObjectSize? = nil
        )
        end
      end

      # A container for configuring your S3 Storage Lens reports to export to read-only S3 table buckets.
      # This parameter enables you to store your Storage Lens metrics in a structured, queryable table
      # format in Apache Iceberg. For more information about S3 Storage Lens, see Assessing your storage
      # activity and usage with S3 Storage Lens in the Amazon S3 User Guide .

      struct StorageLensTableDestination
        include JSON::Serializable

        # A container that indicates whether the export to read-only S3 table buckets is enabled for your S3
        # Storage Lens configuration. When set to true, Storage Lens reports are automatically exported to
        # tables in addition to other configured destinations.

        @[JSON::Field(key: "IsEnabled")]
        getter is_enabled : Bool


        @[JSON::Field(key: "Encryption")]
        getter encryption : Types::StorageLensDataExportEncryption?

        def initialize(
          @is_enabled : Bool,
          @encryption : Types::StorageLensDataExportEncryption? = nil
        )
        end
      end


      struct StorageLensTag
        include JSON::Serializable


        @[JSON::Field(key: "Key")]
        getter key : String


        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct SubmitMultiRegionAccessPointRoutesRequest
        include JSON::Serializable

        # The Amazon Web Services account ID for the owner of the Multi-Region Access Point.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Multi-Region Access Point ARN.

        @[JSON::Field(key: "mrap")]
        getter mrap : String

        # The different routes that make up the new route configuration. Active routes return a value of 100 ,
        # and passive routes return a value of 0 .

        @[JSON::Field(key: "RouteUpdates")]
        getter route_updates : Array(Types::MultiRegionAccessPointRoute)

        def initialize(
          @account_id : String,
          @mrap : String,
          @route_updates : Array(Types::MultiRegionAccessPointRoute)
        )
        end
      end


      struct SubmitMultiRegionAccessPointRoutesResult
        include JSON::Serializable

        def initialize
        end
      end

      # A key-value pair that you use to label your resources. You can add tags to new resources when you
      # create them, or you can add tags to existing resources. Tags can help you organize, track costs for,
      # and control access to resources.

      struct Tag
        include JSON::Serializable

        # The key of the key-value pair of a tag added to your Amazon Web Services resource. A tag key can be
        # up to 128 Unicode characters in length and is case-sensitive. System created tags that begin with
        # aws: aren’t supported.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the key-value pair of a tag added to your Amazon Web Services resource. A tag value can
        # be up to 256 Unicode characters in length and is case-sensitive.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that created the S3 resource that you're trying to add tags to or
        # the requester's account ID.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the S3 resource that you're applying tags to. The tagged resource
        # can be a directory bucket, S3 Storage Lens group or S3 Access Grants instance, registered location,
        # or grant.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The Amazon Web Services resource tags that you want to add to the specified S3 resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @account_id : String,
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct Tagging
        include JSON::Serializable

        # A collection for a set of tags.

        @[JSON::Field(key: "TagSet")]
        getter tag_set : Array(Types::S3Tag)

        def initialize(
          @tag_set : Array(Types::S3Tag)
        )
        end
      end


      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon S3 throws this exception if you have too many tags in your tag set.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies when an object transitions to a specified storage class. For more information about Amazon
      # S3 Lifecycle configuration rules, see Transitioning objects using Amazon S3 Lifecycle in the Amazon
      # S3 User Guide .

      struct Transition
        include JSON::Serializable

        # Indicates when objects are transitioned to the specified storage class. The date value must be in
        # ISO 8601 format. The time is always midnight UTC.

        @[JSON::Field(key: "Date")]
        getter date : Time?

        # Indicates the number of days after creation when objects are transitioned to the specified storage
        # class. The value must be a positive integer.

        @[JSON::Field(key: "Days")]
        getter days : Int32?

        # The storage class to which you want the object to transition.

        @[JSON::Field(key: "StorageClass")]
        getter storage_class : String?

        def initialize(
          @date : Time? = nil,
          @days : Int32? = nil,
          @storage_class : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that owns the resource that you're trying to remove the tags
        # from.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the S3 resource that you're removing tags from. The tagged
        # resource can be a directory bucket, S3 Storage Lens group or S3 Access Grants instance, registered
        # location, or grant.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The array of tag key-value pairs that you're trying to remove from of the S3 resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @account_id : String,
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAccessGrantsLocationRequest
        include JSON::Serializable

        # The ID of the registered location that you are updating. S3 Access Grants assigns this ID when you
        # register the location. S3 Access Grants assigns the ID default to the default location s3:// and
        # assigns an auto-generated ID to other locations that you register. The ID of the registered location
        # to which you are granting access. S3 Access Grants assigned this ID when you registered the
        # location. S3 Access Grants assigns the ID default to the default location s3:// and assigns an
        # auto-generated ID to other locations that you register. If you are passing the default location, you
        # cannot create an access grant for the entire default location. You must also specify a bucket or a
        # bucket and prefix in the Subprefix field.

        @[JSON::Field(key: "id")]
        getter access_grants_location_id : String

        # The Amazon Web Services account ID of the S3 Access Grants instance.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The Amazon Resource Name (ARN) of the IAM role for the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String

        def initialize(
          @access_grants_location_id : String,
          @account_id : String,
          @iam_role_arn : String
        )
        end
      end


      struct UpdateAccessGrantsLocationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the registered location that you are updating.

        @[JSON::Field(key: "AccessGrantsLocationArn")]
        getter access_grants_location_arn : String?

        # The ID of the registered location to which you are granting access. S3 Access Grants assigned this
        # ID when you registered the location. S3 Access Grants assigns the ID default to the default location
        # s3:// and assigns an auto-generated ID to other locations that you register.

        @[JSON::Field(key: "AccessGrantsLocationId")]
        getter access_grants_location_id : String?

        # The date and time when you registered the location.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the IAM role of the registered location. S3 Access Grants assumes
        # this role to manage access to the registered location.

        @[JSON::Field(key: "IAMRoleArn")]
        getter iam_role_arn : String?

        # The S3 URI path of the location that you are updating. You cannot update the scope of the registered
        # location. The location scope can be the default S3 location s3:// , the S3 path to a bucket
        # s3://&lt;bucket&gt; , or the S3 path to a bucket and prefix s3://&lt;bucket&gt;/&lt;prefix&gt; .

        @[JSON::Field(key: "LocationScope")]
        getter location_scope : String?

        def initialize(
          @access_grants_location_arn : String? = nil,
          @access_grants_location_id : String? = nil,
          @created_at : Time? = nil,
          @iam_role_arn : String? = nil,
          @location_scope : String? = nil
        )
        end
      end


      struct UpdateJobPriorityRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID for the job whose priority you want to update.

        @[JSON::Field(key: "id")]
        getter job_id : String

        # The priority you want to assign to this job.

        @[JSON::Field(key: "priority")]
        getter priority : Int32

        def initialize(
          @account_id : String,
          @job_id : String,
          @priority : Int32
        )
        end
      end


      struct UpdateJobPriorityResult
        include JSON::Serializable

        # The ID for the job whose priority Amazon S3 updated.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The new priority assigned to the specified job.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        def initialize(
          @job_id : String,
          @priority : Int32
        )
        end
      end


      struct UpdateJobStatusRequest
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the S3 Batch Operations job.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The ID of the job whose status you want to update.

        @[JSON::Field(key: "id")]
        getter job_id : String

        # The status that you want to move the specified job to.

        @[JSON::Field(key: "requestedJobStatus")]
        getter requested_job_status : String

        # A description of the reason why you want to change the specified job's status. This field can be any
        # string up to the maximum length.

        @[JSON::Field(key: "statusUpdateReason")]
        getter status_update_reason : String?

        def initialize(
          @account_id : String,
          @job_id : String,
          @requested_job_status : String,
          @status_update_reason : String? = nil
        )
        end
      end


      struct UpdateJobStatusResult
        include JSON::Serializable

        # The ID for the job whose status was updated.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status for the specified job.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason that the specified job's status was updated.

        @[JSON::Field(key: "StatusUpdateReason")]
        getter status_update_reason : String?

        def initialize(
          @job_id : String? = nil,
          @status : String? = nil,
          @status_update_reason : String? = nil
        )
        end
      end


      struct UpdateStorageLensGroupRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Storage Lens group owner.

        @[JSON::Field(key: "x-amz-account-id")]
        getter account_id : String

        # The name of the Storage Lens group that you want to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # The JSON file that contains the Storage Lens group configuration.

        @[JSON::Field(key: "StorageLensGroup")]
        getter storage_lens_group : Types::StorageLensGroup

        def initialize(
          @account_id : String,
          @name : String,
          @storage_lens_group : Types::StorageLensGroup
        )
        end
      end

      # Describes the versioning state of an Amazon S3 on Outposts bucket. For more information, see
      # PutBucketVersioning .

      struct VersioningConfiguration
        include JSON::Serializable

        # Specifies whether MFA delete is enabled or disabled in the bucket versioning configuration for the
        # S3 on Outposts bucket.

        @[JSON::Field(key: "MfaDelete")]
        getter mfa_delete : String?

        # Sets the versioning state of the S3 on Outposts bucket.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @mfa_delete : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The virtual private cloud (VPC) configuration for an access point.

      struct VpcConfiguration
        include JSON::Serializable

        # If this field is specified, this access point will only allow connections from the specified VPC ID.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        def initialize(
          @vpc_id : String
        )
        end
      end
    end
  end
end
