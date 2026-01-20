require "json"

module Aws
  module OpenSearchServerless
    module Types

      # Details about an OpenSearch Serverless access policy.

      struct AccessPolicyDetail
        include JSON::Serializable

        # The date the policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the policy was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The JSON policy document without any whitespaces.

        @[JSON::Field(key: "policy")]
        getter policy : Types::Document?

        # The version of the policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of access policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy : Types::Document? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Statistics for an OpenSearch Serverless access policy.

      struct AccessPolicyStats
        include JSON::Serializable

        # The number of data access policies in the current account.

        @[JSON::Field(key: "DataPolicyCount")]
        getter data_policy_count : Int64?

        def initialize(
          @data_policy_count : Int64? = nil
        )
        end
      end

      # A summary of the data access policy.

      struct AccessPolicySummary
        include JSON::Serializable

        # The Epoch time when the access policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the access policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time when the collection was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the access policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of access policy. Currently, the only available type is data .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # OpenSearch Serverless-related information for the current account.

      struct AccountSettingsDetail
        include JSON::Serializable


        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CapacityLimits?

        def initialize(
          @capacity_limits : Types::CapacityLimits? = nil
        )
        end
      end


      struct BatchGetCollectionGroupRequest
        include JSON::Serializable

        # A list of collection group IDs. You can't provide names and IDs in the same request.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # A list of collection group names. You can't provide names and IDs in the same request.

        @[JSON::Field(key: "names")]
        getter names : Array(String)?

        def initialize(
          @ids : Array(String)? = nil,
          @names : Array(String)? = nil
        )
        end
      end


      struct BatchGetCollectionGroupResponse
        include JSON::Serializable

        # Details about each collection group.

        @[JSON::Field(key: "collectionGroupDetails")]
        getter collection_group_details : Array(Types::CollectionGroupDetail)?

        # Error information for the request.

        @[JSON::Field(key: "collectionGroupErrorDetails")]
        getter collection_group_error_details : Array(Types::CollectionGroupErrorDetail)?

        def initialize(
          @collection_group_details : Array(Types::CollectionGroupDetail)? = nil,
          @collection_group_error_details : Array(Types::CollectionGroupErrorDetail)? = nil
        )
        end
      end


      struct BatchGetCollectionRequest
        include JSON::Serializable

        # A list of collection IDs. You can't provide names and IDs in the same request. The ID is part of the
        # collection endpoint. You can also retrieve it using the ListCollections API.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)?

        # A list of collection names. You can't provide names and IDs in the same request.

        @[JSON::Field(key: "names")]
        getter names : Array(String)?

        def initialize(
          @ids : Array(String)? = nil,
          @names : Array(String)? = nil
        )
        end
      end


      struct BatchGetCollectionResponse
        include JSON::Serializable

        # Details about each collection.

        @[JSON::Field(key: "collectionDetails")]
        getter collection_details : Array(Types::CollectionDetail)?

        # Error information for the request.

        @[JSON::Field(key: "collectionErrorDetails")]
        getter collection_error_details : Array(Types::CollectionErrorDetail)?

        def initialize(
          @collection_details : Array(Types::CollectionDetail)? = nil,
          @collection_error_details : Array(Types::CollectionErrorDetail)? = nil
        )
        end
      end


      struct BatchGetEffectiveLifecyclePolicyRequest
        include JSON::Serializable

        # The unique identifiers of policy types and resource names.

        @[JSON::Field(key: "resourceIdentifiers")]
        getter resource_identifiers : Array(Types::LifecyclePolicyResourceIdentifier)

        def initialize(
          @resource_identifiers : Array(Types::LifecyclePolicyResourceIdentifier)
        )
        end
      end


      struct BatchGetEffectiveLifecyclePolicyResponse
        include JSON::Serializable

        # A list of lifecycle policies applied to the OpenSearch Serverless indexes.

        @[JSON::Field(key: "effectiveLifecyclePolicyDetails")]
        getter effective_lifecycle_policy_details : Array(Types::EffectiveLifecyclePolicyDetail)?

        # A list of resources for which retrieval failed.

        @[JSON::Field(key: "effectiveLifecyclePolicyErrorDetails")]
        getter effective_lifecycle_policy_error_details : Array(Types::EffectiveLifecyclePolicyErrorDetail)?

        def initialize(
          @effective_lifecycle_policy_details : Array(Types::EffectiveLifecyclePolicyDetail)? = nil,
          @effective_lifecycle_policy_error_details : Array(Types::EffectiveLifecyclePolicyErrorDetail)? = nil
        )
        end
      end


      struct BatchGetLifecyclePolicyRequest
        include JSON::Serializable

        # The unique identifiers of policy types and policy names.

        @[JSON::Field(key: "identifiers")]
        getter identifiers : Array(Types::LifecyclePolicyIdentifier)

        def initialize(
          @identifiers : Array(Types::LifecyclePolicyIdentifier)
        )
        end
      end


      struct BatchGetLifecyclePolicyResponse
        include JSON::Serializable

        # A list of lifecycle policies matched to the input policy name and policy type.

        @[JSON::Field(key: "lifecyclePolicyDetails")]
        getter lifecycle_policy_details : Array(Types::LifecyclePolicyDetail)?

        # A list of lifecycle policy names and policy types for which retrieval failed.

        @[JSON::Field(key: "lifecyclePolicyErrorDetails")]
        getter lifecycle_policy_error_details : Array(Types::LifecyclePolicyErrorDetail)?

        def initialize(
          @lifecycle_policy_details : Array(Types::LifecyclePolicyDetail)? = nil,
          @lifecycle_policy_error_details : Array(Types::LifecyclePolicyErrorDetail)? = nil
        )
        end
      end


      struct BatchGetVpcEndpointRequest
        include JSON::Serializable

        # A list of VPC endpoint identifiers.

        @[JSON::Field(key: "ids")]
        getter ids : Array(String)

        def initialize(
          @ids : Array(String)
        )
        end
      end


      struct BatchGetVpcEndpointResponse
        include JSON::Serializable

        # Details about the specified VPC endpoint.

        @[JSON::Field(key: "vpcEndpointDetails")]
        getter vpc_endpoint_details : Array(Types::VpcEndpointDetail)?

        # Error information for a failed request.

        @[JSON::Field(key: "vpcEndpointErrorDetails")]
        getter vpc_endpoint_error_details : Array(Types::VpcEndpointErrorDetail)?

        def initialize(
          @vpc_endpoint_details : Array(Types::VpcEndpointDetail)? = nil,
          @vpc_endpoint_error_details : Array(Types::VpcEndpointErrorDetail)? = nil
        )
        end
      end

      # The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute Units
      # (OCUs). These limits are used to scale your collections based on the current workload. For more
      # information, see Managing capacity limits for Amazon OpenSearch Serverless .

      struct CapacityLimits
        include JSON::Serializable

        # The maximum indexing capacity for collections.

        @[JSON::Field(key: "maxIndexingCapacityInOCU")]
        getter max_indexing_capacity_in_ocu : Int32?

        # The maximum search capacity for collections.

        @[JSON::Field(key: "maxSearchCapacityInOCU")]
        getter max_search_capacity_in_ocu : Int32?

        def initialize(
          @max_indexing_capacity_in_ocu : Int32? = nil,
          @max_search_capacity_in_ocu : Int32? = nil
        )
        end
      end

      # Details about each OpenSearch Serverless collection, including the collection endpoint, the
      # OpenSearch Dashboards endpoint, and FIPS-compliant endpoints for federal government workloads.

      struct CollectionDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch
        # Serverless collection.

        @[JSON::Field(key: "collectionEndpoint")]
        getter collection_endpoint : String?

        # The name of the collection group that contains this collection.

        @[JSON::Field(key: "collectionGroupName")]
        getter collection_group_name : String?

        # The Epoch time when the collection was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # Collection-specific endpoint used to access OpenSearch Dashboards.

        @[JSON::Field(key: "dashboardEndpoint")]
        getter dashboard_endpoint : String?

        # A description of the collection.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A failure code associated with the request.

        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # A message associated with the failure code.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # FIPS-compliant endpoints for the collection. These endpoints use FIPS 140-3 validated cryptographic
        # modules and are required for federal government workloads that must comply with FedRAMP security
        # standards.

        @[JSON::Field(key: "fipsEndpoints")]
        getter fips_endpoints : Types::FipsEndpoints?

        # A unique identifier for the collection.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the Amazon Web Services KMS key used to encrypt the collection.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The date and time when the collection was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Details about an OpenSearch Serverless collection.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of collection.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Configuration options for vector search capabilities in the collection.

        @[JSON::Field(key: "vectorOptions")]
        getter vector_options : Types::VectorOptions?

        def initialize(
          @arn : String? = nil,
          @collection_endpoint : String? = nil,
          @collection_group_name : String? = nil,
          @created_date : Int64? = nil,
          @dashboard_endpoint : String? = nil,
          @description : String? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @fips_endpoints : Types::FipsEndpoints? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @standby_replicas : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @vector_options : Types::VectorOptions? = nil
        )
        end
      end

      # Error information for an OpenSearch Serverless request.

      struct CollectionErrorDetail
        include JSON::Serializable

        # The error code for the request. For example, NOT_FOUND .

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A description of the error. For example, The specified Collection is not found.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # If the request contains collection IDs, the response includes the IDs provided in the request.

        @[JSON::Field(key: "id")]
        getter id : String?

        # If the request contains collection names, the response includes the names provided in the request.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch
      # Serverless collections.

      struct CollectionFilters
        include JSON::Serializable

        # The name of the collection group to filter by.

        @[JSON::Field(key: "collectionGroupName")]
        getter collection_group_name : String?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @collection_group_name : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Capacity limits for a collection group. These limits define the minimum and maximum OpenSearch
      # Compute Units (OCUs) for indexing and search operations that can be used by collections in the
      # group.

      struct CollectionGroupCapacityLimits
        include JSON::Serializable

        # The maximum indexing capacity for collections in the group.

        @[JSON::Field(key: "maxIndexingCapacityInOCU")]
        getter max_indexing_capacity_in_ocu : Float64?

        # The maximum search capacity for collections in the group.

        @[JSON::Field(key: "maxSearchCapacityInOCU")]
        getter max_search_capacity_in_ocu : Float64?

        # The minimum indexing capacity for collections in the group.

        @[JSON::Field(key: "minIndexingCapacityInOCU")]
        getter min_indexing_capacity_in_ocu : Float64?

        # The minimum search capacity for collections in the group.

        @[JSON::Field(key: "minSearchCapacityInOCU")]
        getter min_search_capacity_in_ocu : Float64?

        def initialize(
          @max_indexing_capacity_in_ocu : Float64? = nil,
          @max_search_capacity_in_ocu : Float64? = nil,
          @min_indexing_capacity_in_ocu : Float64? = nil,
          @min_search_capacity_in_ocu : Float64? = nil
        )
        end
      end

      # Details about a collection group.

      struct CollectionGroupDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # The Epoch time when the collection group was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the collection group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the collection group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the collection group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of collections associated with the collection group.

        @[JSON::Field(key: "numberOfCollections")]
        getter number_of_collections : Int32?

        # Indicates whether standby replicas are used for the collection group.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String?

        # A map of key-value pairs associated with the collection group.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @number_of_collections : Int32? = nil,
          @standby_replicas : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Error details for a collection group operation.

      struct CollectionGroupErrorDetail
        include JSON::Serializable

        # The error code for the request. For example, NOT_FOUND .

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A description of the error. For example, The specified Collection Group is not found.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # If the request contains collection group IDs, the response includes the IDs provided in the request.

        @[JSON::Field(key: "id")]
        getter id : String?

        # If the request contains collection group names, the response includes the names provided in the
        # request.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Summary information about a collection group.

      struct CollectionGroupSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection group.

        @[JSON::Field(key: "arn")]
        getter arn : String?


        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # The Epoch time when the collection group was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The unique identifier of the collection group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the collection group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The number of collections within the collection group.

        @[JSON::Field(key: "numberOfCollections")]
        getter number_of_collections : Int32?

        def initialize(
          @arn : String? = nil,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @created_date : Int64? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @number_of_collections : Int32? = nil
        )
        end
      end

      # Details about each OpenSearch Serverless collection.

      struct CollectionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the collection group that contains this collection.

        @[JSON::Field(key: "collectionGroupName")]
        getter collection_group_name : String?

        # The unique identifier of the collection.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the Amazon Web Services Key Management Service key used to encrypt the collection.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @collection_group_name : String? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # When creating a resource, thrown when a resource with the same name already exists or is being
      # created.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateAccessPolicyRequest
        include JSON::Serializable

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The JSON policy document to use as the content for the policy.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The type of policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the policy. Typically used to store information about the permissions defined in
        # the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @policy : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateAccessPolicyResponse
        include JSON::Serializable

        # Details about the created access policy.

        @[JSON::Field(key: "accessPolicyDetail")]
        getter access_policy_detail : Types::AccessPolicyDetail?

        def initialize(
          @access_policy_detail : Types::AccessPolicyDetail? = nil
        )
        end
      end

      # Details about the created OpenSearch Serverless collection.

      struct CreateCollectionDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the collection group that contains this collection.

        @[JSON::Field(key: "collectionGroupName")]
        getter collection_group_name : String?

        # The Epoch time when the collection was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # A description of the collection.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the collection.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The Amazon Resource Name (ARN) of the KMS key with which to encrypt the collection.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The date and time when the collection was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Creates details about an OpenSearch Serverless collection.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of collection.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Configuration options for vector search capabilities in the collection.

        @[JSON::Field(key: "vectorOptions")]
        getter vector_options : Types::VectorOptions?

        def initialize(
          @arn : String? = nil,
          @collection_group_name : String? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @kms_key_arn : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @standby_replicas : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @vector_options : Types::VectorOptions? = nil
        )
        end
      end

      # Details about the created collection group.

      struct CreateCollectionGroupDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # The Epoch time when the collection group was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the collection group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the collection group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the collection group.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates whether standby replicas are used for the collection group.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String?

        # A map of key-value pairs associated with the collection group.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @standby_replicas : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCollectionGroupRequest
        include JSON::Serializable

        # The name of the collection group.

        @[JSON::Field(key: "name")]
        getter name : String

        # Indicates whether standby replicas should be used for a collection group.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String

        # The capacity limits for the collection group, in OpenSearch Compute Units (OCUs). These limits
        # control the maximum and minimum capacity for collections within the group.

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the collection group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An arbitrary set of tags (key–value pairs) to associate with the OpenSearch Serverless collection
        # group.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @standby_replicas : String,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCollectionGroupResponse
        include JSON::Serializable

        # Details about the created collection group.

        @[JSON::Field(key: "createCollectionGroupDetail")]
        getter create_collection_group_detail : Types::CreateCollectionGroupDetail?

        def initialize(
          @create_collection_group_detail : Types::CreateCollectionGroupDetail? = nil
        )
        end
      end


      struct CreateCollectionRequest
        include JSON::Serializable

        # Name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the collection group to associate with the collection.

        @[JSON::Field(key: "collectionGroupName")]
        getter collection_group_name : String?

        # Description of the collection.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Encryption settings for the collection.

        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig?

        # Indicates whether standby replicas should be used for a collection.

        @[JSON::Field(key: "standbyReplicas")]
        getter standby_replicas : String?

        # An arbitrary set of tags (key–value pairs) to associate with the OpenSearch Serverless collection.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The type of collection.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Configuration options for vector search capabilities in the collection.

        @[JSON::Field(key: "vectorOptions")]
        getter vector_options : Types::VectorOptions?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @collection_group_name : String? = nil,
          @description : String? = nil,
          @encryption_config : Types::EncryptionConfig? = nil,
          @standby_replicas : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @vector_options : Types::VectorOptions? = nil
        )
        end
      end


      struct CreateCollectionResponse
        include JSON::Serializable

        # Details about the collection.

        @[JSON::Field(key: "createCollectionDetail")]
        getter create_collection_detail : Types::CreateCollectionDetail?

        def initialize(
          @create_collection_detail : Types::CreateCollectionDetail? = nil
        )
        end
      end

      # Describes IAM Identity Center options for creating an OpenSearch Serverless security configuration
      # in the form of a key-value map.

      struct CreateIamIdentityCenterConfigOptions
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String

        # The group attribute for this IAM Identity Center integration. Defaults to GroupId .

        @[JSON::Field(key: "groupAttribute")]
        getter group_attribute : String?

        # The user attribute for this IAM Identity Center integration. Defaults to UserId .

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @instance_arn : String,
          @group_attribute : String? = nil,
          @user_attribute : String? = nil
        )
        end
      end


      struct CreateIndexRequest
        include JSON::Serializable

        # The unique identifier of the collection in which to create the index.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the index to create. Index names must be lowercase and can't begin with underscores (_)
        # or hyphens (-).

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The JSON schema definition for the index, including field mappings and settings.

        @[JSON::Field(key: "indexSchema")]
        getter index_schema : Types::IndexSchema?

        def initialize(
          @id : String,
          @index_name : String,
          @index_schema : Types::IndexSchema? = nil
        )
        end
      end


      struct CreateIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateLifecyclePolicyRequest
        include JSON::Serializable

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The JSON policy document to use as the content for the lifecycle policy.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @policy : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateLifecyclePolicyResponse
        include JSON::Serializable

        # Details about the created lifecycle policy.

        @[JSON::Field(key: "lifecyclePolicyDetail")]
        getter lifecycle_policy_detail : Types::LifecyclePolicyDetail?

        def initialize(
          @lifecycle_policy_detail : Types::LifecyclePolicyDetail? = nil
        )
        end
      end


      struct CreateSecurityConfigRequest
        include JSON::Serializable

        # The name of the security configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of security configuration.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the security configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes IAM federation options in the form of a key-value map. This field is required if you
        # specify iamFederation for the type parameter.

        @[JSON::Field(key: "iamFederationOptions")]
        getter iam_federation_options : Types::IamFederationConfigOptions?

        # Describes IAM Identity Center options in the form of a key-value map. This field is required if you
        # specify iamidentitycenter for the type parameter.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::CreateIamIdentityCenterConfigOptions?

        # Describes SAML options in the form of a key-value map. This field is required if you specify SAML
        # for the type parameter.

        @[JSON::Field(key: "samlOptions")]
        getter saml_options : Types::SamlConfigOptions?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @iam_federation_options : Types::IamFederationConfigOptions? = nil,
          @iam_identity_center_options : Types::CreateIamIdentityCenterConfigOptions? = nil,
          @saml_options : Types::SamlConfigOptions? = nil
        )
        end
      end


      struct CreateSecurityConfigResponse
        include JSON::Serializable

        # Details about the created security configuration.

        @[JSON::Field(key: "securityConfigDetail")]
        getter security_config_detail : Types::SecurityConfigDetail?

        def initialize(
          @security_config_detail : Types::SecurityConfigDetail? = nil
        )
        end
      end


      struct CreateSecurityPolicyRequest
        include JSON::Serializable

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The JSON policy document to use as the content for the new policy.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The type of security policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the policy. Typically used to store information about the permissions defined in
        # the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @policy : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateSecurityPolicyResponse
        include JSON::Serializable

        # Details about the created security policy.

        @[JSON::Field(key: "securityPolicyDetail")]
        getter security_policy_detail : Types::SecurityPolicyDetail?

        def initialize(
          @security_policy_detail : Types::SecurityPolicyDetail? = nil
        )
        end
      end

      # Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, see
      # Access Amazon OpenSearch Serverless using an interface endpoint .

      struct CreateVpcEndpointDetail
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status in the endpoint creation process.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct CreateVpcEndpointRequest
        include JSON::Serializable

        # The name of the interface endpoint.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of one or more subnets from which you'll access OpenSearch Serverless.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC from which you'll access OpenSearch Serverless.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The unique identifiers of the security groups that define the ports, protocols, and sources for
        # inbound traffic that you are authorizing into your endpoint.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @name : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @client_token : String? = nil,
          @security_group_ids : Array(String)? = nil
        )
        end
      end


      struct CreateVpcEndpointResponse
        include JSON::Serializable

        # Details about the created interface VPC endpoint.

        @[JSON::Field(key: "createVpcEndpointDetail")]
        getter create_vpc_endpoint_detail : Types::CreateVpcEndpointDetail?

        def initialize(
          @create_vpc_endpoint_detail : Types::CreateVpcEndpointDetail? = nil
        )
        end
      end


      struct DeleteAccessPolicyRequest
        include JSON::Serializable

        # The name of the policy to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteAccessPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a deleted OpenSearch Serverless collection.

      struct DeleteCollectionDetail
        include JSON::Serializable

        # The unique identifier of the collection.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteCollectionGroupRequest
        include JSON::Serializable

        # The unique identifier of the collection group to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteCollectionGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCollectionRequest
        include JSON::Serializable

        # The unique identifier of the collection. For example, 1iu5usc406kd . The ID is part of the
        # collection endpoint. You can also retrieve it using the ListCollections API.

        @[JSON::Field(key: "id")]
        getter id : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteCollectionResponse
        include JSON::Serializable

        # Details of the deleted collection.

        @[JSON::Field(key: "deleteCollectionDetail")]
        getter delete_collection_detail : Types::DeleteCollectionDetail?

        def initialize(
          @delete_collection_detail : Types::DeleteCollectionDetail? = nil
        )
        end
      end


      struct DeleteIndexRequest
        include JSON::Serializable

        # The unique identifier of the collection containing the index to delete.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the index to delete.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        def initialize(
          @id : String,
          @index_name : String
        )
        end
      end


      struct DeleteIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLifecyclePolicyRequest
        include JSON::Serializable

        # The name of the policy to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteLifecyclePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSecurityConfigRequest
        include JSON::Serializable

        # The security configuration identifier. For SAML the ID will be
        # saml/&lt;accountId&gt;/&lt;idpProviderName&gt; . For example, saml/123456789123/OKTADev .

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteSecurityConfigResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSecurityPolicyRequest
        include JSON::Serializable

        # The name of the policy to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteSecurityPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Deletion details for an OpenSearch Serverless-managed interface endpoint.

      struct DeleteVpcEndpointDetail
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the endpoint deletion process.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteVpcEndpointRequest
        include JSON::Serializable

        # The VPC endpoint identifier.

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @id : String,
          @client_token : String? = nil
        )
        end
      end


      struct DeleteVpcEndpointResponse
        include JSON::Serializable

        # Details about the deleted endpoint.

        @[JSON::Field(key: "deleteVpcEndpointDetail")]
        getter delete_vpc_endpoint_detail : Types::DeleteVpcEndpointDetail?

        def initialize(
          @delete_vpc_endpoint_detail : Types::DeleteVpcEndpointDetail? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Error information for an OpenSearch Serverless request.

      struct EffectiveLifecyclePolicyDetail
        include JSON::Serializable

        # The minimum number of index retention days set. That is an optional param that will return as true
        # if the minimum number of days or hours is not set to a index resource.

        @[JSON::Field(key: "noMinRetentionPeriod")]
        getter no_min_retention_period : Bool?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "policyName")]
        getter policy_name : String?

        # The name of the OpenSearch Serverless index resource.

        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The type of OpenSearch Serverless resource. Currently, the only supported resource is index .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The minimum number of index retention in days or hours. This is an optional parameter that will
        # return only if it’s set.

        @[JSON::Field(key: "retentionPeriod")]
        getter retention_period : String?

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @no_min_retention_period : Bool? = nil,
          @policy_name : String? = nil,
          @resource : String? = nil,
          @resource_type : String? = nil,
          @retention_period : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Error information for an OpenSearch Serverless request.

      struct EffectiveLifecyclePolicyErrorDetail
        include JSON::Serializable

        # The error code for the request.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A description of the error. For example, The specified Index resource is not found .

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of OpenSearch Serverless index resource.

        @[JSON::Field(key: "resource")]
        getter resource : String?

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @resource : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Encryption settings for a collection.

      struct EncryptionConfig
        include JSON::Serializable

        # Indicates whether to use an Amazon Web Services-owned key for encryption.

        @[JSON::Field(key: "aWSOwnedKey")]
        getter a_ws_owned_key : Bool?

        # The ARN of the Amazon Web Services Key Management Service key used to encrypt the collection.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @a_ws_owned_key : Bool? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # FIPS-compliant endpoint URLs for an OpenSearch Serverless collection. These endpoints ensure all
      # data transmission uses FIPS 140-3 validated cryptographic implementations, meeting federal security
      # requirements for government workloads.

      struct FipsEndpoints
        include JSON::Serializable

        # FIPS-compliant collection endpoint used to submit index, search, and data upload requests to an
        # OpenSearch Serverless collection. This endpoint uses FIPS 140-3 validated cryptography and is
        # required for federal government workloads.

        @[JSON::Field(key: "collectionEndpoint")]
        getter collection_endpoint : String?

        # FIPS-compliant endpoint used to access OpenSearch Dashboards. This endpoint uses FIPS 140-3
        # validated cryptography and is required for federal government workloads that need dashboard
        # visualization capabilities.

        @[JSON::Field(key: "dashboardEndpoint")]
        getter dashboard_endpoint : String?

        def initialize(
          @collection_endpoint : String? = nil,
          @dashboard_endpoint : String? = nil
        )
        end
      end


      struct GetAccessPolicyRequest
        include JSON::Serializable

        # The name of the access policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # Tye type of policy. Currently, the only supported value is data .

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end


      struct GetAccessPolicyResponse
        include JSON::Serializable

        # Details about the requested access policy.

        @[JSON::Field(key: "accessPolicyDetail")]
        getter access_policy_detail : Types::AccessPolicyDetail?

        def initialize(
          @access_policy_detail : Types::AccessPolicyDetail? = nil
        )
        end
      end


      struct GetAccountSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountSettingsResponse
        include JSON::Serializable

        # OpenSearch Serverless-related details for the current account.

        @[JSON::Field(key: "accountSettingsDetail")]
        getter account_settings_detail : Types::AccountSettingsDetail?

        def initialize(
          @account_settings_detail : Types::AccountSettingsDetail? = nil
        )
        end
      end


      struct GetIndexRequest
        include JSON::Serializable

        # The unique identifier of the collection containing the index.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the index to retrieve information about.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        def initialize(
          @id : String,
          @index_name : String
        )
        end
      end


      struct GetIndexResponse
        include JSON::Serializable

        # The JSON schema definition for the index, including field mappings and settings.

        @[JSON::Field(key: "indexSchema")]
        getter index_schema : Types::IndexSchema?

        def initialize(
          @index_schema : Types::IndexSchema? = nil
        )
        end
      end


      struct GetPoliciesStatsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetPoliciesStatsResponse
        include JSON::Serializable

        # Information about the data access policies in your account.

        @[JSON::Field(key: "AccessPolicyStats")]
        getter access_policy_stats : Types::AccessPolicyStats?

        # Information about the lifecycle policies in your account.

        @[JSON::Field(key: "LifecyclePolicyStats")]
        getter lifecycle_policy_stats : Types::LifecyclePolicyStats?

        # Information about the security configurations in your account.

        @[JSON::Field(key: "SecurityConfigStats")]
        getter security_config_stats : Types::SecurityConfigStats?

        # Information about the security policies in your account.

        @[JSON::Field(key: "SecurityPolicyStats")]
        getter security_policy_stats : Types::SecurityPolicyStats?

        # The total number of OpenSearch Serverless security policies and configurations in your account.

        @[JSON::Field(key: "TotalPolicyCount")]
        getter total_policy_count : Int64?

        def initialize(
          @access_policy_stats : Types::AccessPolicyStats? = nil,
          @lifecycle_policy_stats : Types::LifecyclePolicyStats? = nil,
          @security_config_stats : Types::SecurityConfigStats? = nil,
          @security_policy_stats : Types::SecurityPolicyStats? = nil,
          @total_policy_count : Int64? = nil
        )
        end
      end


      struct GetSecurityConfigRequest
        include JSON::Serializable

        # The unique identifier of the security configuration.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetSecurityConfigResponse
        include JSON::Serializable

        # Details of the requested security configuration.

        @[JSON::Field(key: "securityConfigDetail")]
        getter security_config_detail : Types::SecurityConfigDetail?

        def initialize(
          @security_config_detail : Types::SecurityConfigDetail? = nil
        )
        end
      end


      struct GetSecurityPolicyRequest
        include JSON::Serializable

        # The name of the security policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of security policy.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end


      struct GetSecurityPolicyResponse
        include JSON::Serializable

        # Details about the requested security policy.

        @[JSON::Field(key: "securityPolicyDetail")]
        getter security_policy_detail : Types::SecurityPolicyDetail?

        def initialize(
          @security_policy_detail : Types::SecurityPolicyDetail? = nil
        )
        end
      end

      # Describes IAM federation options for an OpenSearch Serverless security configuration in the form of
      # a key-value map. These options define how OpenSearch Serverless integrates with external identity
      # providers using federation.

      struct IamFederationConfigOptions
        include JSON::Serializable

        # The group attribute for this IAM federation integration. This attribute is used to map identity
        # provider groups to OpenSearch Serverless permissions.

        @[JSON::Field(key: "groupAttribute")]
        getter group_attribute : String?

        # The user attribute for this IAM federation integration. This attribute is used to identify users in
        # the federated authentication process.

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @group_attribute : String? = nil,
          @user_attribute : String? = nil
        )
        end
      end

      # Describes IAM Identity Center options for an OpenSearch Serverless security configuration in the
      # form of a key-value map.

      struct IamIdentityCenterConfigOptions
        include JSON::Serializable

        # The ARN of the IAM Identity Center application used to integrate with OpenSearch Serverless.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String?

        # The description of the IAM Identity Center application used to integrate with OpenSearch Serverless.

        @[JSON::Field(key: "applicationDescription")]
        getter application_description : String?

        # The name of the IAM Identity Center application used to integrate with OpenSearch Serverless.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # The group attribute for this IAM Identity Center integration. Defaults to GroupId .

        @[JSON::Field(key: "groupAttribute")]
        getter group_attribute : String?

        # The ARN of the IAM Identity Center instance used to integrate with OpenSearch Serverless.

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # The user attribute for this IAM Identity Center integration. Defaults to UserId

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @application_arn : String? = nil,
          @application_description : String? = nil,
          @application_name : String? = nil,
          @group_attribute : String? = nil,
          @instance_arn : String? = nil,
          @user_attribute : String? = nil
        )
        end
      end


      struct IndexSchema
        include JSON::Serializable

        def initialize
        end
      end

      # Thrown when an error internal to the service occurs while processing a request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about an OpenSearch Serverless lifecycle policy.

      struct LifecyclePolicyDetail
        include JSON::Serializable

        # The date the lifecycle policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the lifecycle policy was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The JSON policy document without any whitespaces.

        @[JSON::Field(key: "policy")]
        getter policy : Types::Document?

        # The version of the lifecycle policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy : Types::Document? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Error information for an OpenSearch Serverless request.

      struct LifecyclePolicyErrorDetail
        include JSON::Serializable

        # The error code for the request. For example, NOT_FOUND .

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # A description of the error. For example, The specified Lifecycle Policy is not found .

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The unique identifiers of policy types and policy names.

      struct LifecyclePolicyIdentifier
        include JSON::Serializable

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # The unique identifiers of policy types and resource names.

      struct LifecyclePolicyResourceIdentifier
        include JSON::Serializable

        # The name of the OpenSearch Serverless ilndex resource.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @resource : String,
          @type : String
        )
        end
      end

      # Statistics for an OpenSearch Serverless lifecycle policy.

      struct LifecyclePolicyStats
        include JSON::Serializable

        # The number of retention lifecycle policies in the current account.

        @[JSON::Field(key: "RetentionPolicyCount")]
        getter retention_policy_count : Int64?

        def initialize(
          @retention_policy_count : Int64? = nil
        )
        end
      end

      # A summary of the lifecycle policy.

      struct LifecyclePolicySummary
        include JSON::Serializable

        # The Epoch time when the lifecycle policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time when the lifecycle policy was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the lifecycle policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the lifecycle policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListAccessPoliciesRequest
        include JSON::Serializable

        # The type of access policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results. The default is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListAccessPolicies operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListAccessPolicies operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Resource filters (can be collections or indexes) that policies can apply to.

        @[JSON::Field(key: "resource")]
        getter resource : Array(String)?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource : Array(String)? = nil
        )
        end
      end


      struct ListAccessPoliciesResponse
        include JSON::Serializable

        # Details about the requested access policies.

        @[JSON::Field(key: "accessPolicySummaries")]
        getter access_policy_summaries : Array(Types::AccessPolicySummary)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @access_policy_summaries : Array(Types::AccessPolicySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollectionGroupsRequest
        include JSON::Serializable

        # The maximum number of results to return. Default is 20. You can use nextToken to get the next page
        # of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListCollectionGroups operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListCollectionGroups operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollectionGroupsResponse
        include JSON::Serializable

        # Details about each collection group.

        @[JSON::Field(key: "collectionGroupSummaries")]
        getter collection_group_summaries : Array(Types::CollectionGroupSummary)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collection_group_summaries : Array(Types::CollectionGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollectionsRequest
        include JSON::Serializable

        # A list of filter names and values that you can use for requests.

        @[JSON::Field(key: "collectionFilters")]
        getter collection_filters : Types::CollectionFilters?

        # The maximum number of results to return. Default is 20. You can use nextToken to get the next page
        # of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListCollections operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListCollections operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collection_filters : Types::CollectionFilters? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollectionsResponse
        include JSON::Serializable

        # Details about each collection.

        @[JSON::Field(key: "collectionSummaries")]
        getter collection_summaries : Array(Types::CollectionSummary)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collection_summaries : Array(Types::CollectionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLifecyclePoliciesRequest
        include JSON::Serializable

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # An optional parameter that specifies the maximum number of results to return. You can use use
        # nextToken to get the next page of results. The default is 10.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListLifecyclePolicies operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListLifecyclePolicies operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Resource filters that policies can apply to. Currently, the only supported resource type is index .

        @[JSON::Field(key: "resources")]
        getter resources : Array(String)?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resources : Array(String)? = nil
        )
        end
      end


      struct ListLifecyclePoliciesResponse
        include JSON::Serializable

        # Details about the requested lifecycle policies.

        @[JSON::Field(key: "lifecyclePolicySummaries")]
        getter lifecycle_policy_summaries : Array(Types::LifecyclePolicySummary)?

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @lifecycle_policy_summaries : Array(Types::LifecyclePolicySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityConfigsRequest
        include JSON::Serializable

        # The type of security configuration.

        @[JSON::Field(key: "type")]
        getter type : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results. The default is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListSecurityConfigs operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListSecurityConfigs operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSecurityConfigsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Details about the security configurations in your account.

        @[JSON::Field(key: "securityConfigSummaries")]
        getter security_config_summaries : Array(Types::SecurityConfigSummary)?

        def initialize(
          @next_token : String? = nil,
          @security_config_summaries : Array(Types::SecurityConfigSummary)? = nil
        )
        end
      end


      struct ListSecurityPoliciesRequest
        include JSON::Serializable

        # The type of policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results. The default is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListSecurityPolicies operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListSecurityPolicies operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Resource filters (can be collection or indexes) that policies can apply to.

        @[JSON::Field(key: "resource")]
        getter resource : Array(String)?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource : Array(String)? = nil
        )
        end
      end


      struct ListSecurityPoliciesResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Details about the security policies in your account.

        @[JSON::Field(key: "securityPolicySummaries")]
        getter security_policy_summaries : Array(Types::SecurityPolicySummary)?

        def initialize(
          @next_token : String? = nil,
          @security_policy_summaries : Array(Types::SecurityPolicySummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the DELETING
        # state), and must be owned by the account ID included in the request.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListVpcEndpointsRequest
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to get the next page of results. The default is 20.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If your initial ListVpcEndpoints operation returns a nextToken , you can include the returned
        # nextToken in subsequent ListVpcEndpoints operations, which returns results in the next page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filter the results according to the current status of the VPC endpoint. Possible statuses are
        # CREATING , DELETING , UPDATING , ACTIVE , and FAILED .

        @[JSON::Field(key: "vpcEndpointFilters")]
        getter vpc_endpoint_filters : Types::VpcEndpointFilters?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @vpc_endpoint_filters : Types::VpcEndpointFilters? = nil
        )
        end
      end


      struct ListVpcEndpointsResponse
        include JSON::Serializable

        # When nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Details about each VPC endpoint, including the name and current status.

        @[JSON::Field(key: "vpcEndpointSummaries")]
        getter vpc_endpoint_summaries : Array(Types::VpcEndpointSummary)?

        def initialize(
          @next_token : String? = nil,
          @vpc_endpoint_summaries : Array(Types::VpcEndpointSummary)? = nil
        )
        end
      end

      # Thrown when the collection you're attempting to create results in a number of search or indexing
      # OCUs that exceeds the account limit.

      struct OcuLimitExceededException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Thrown when accessing or deleting a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes SAML options for an OpenSearch Serverless security configuration in the form of a
      # key-value map.

      struct SamlConfigOptions
        include JSON::Serializable

        # The XML IdP metadata file generated from your identity provider.

        @[JSON::Field(key: "metadata")]
        getter metadata : String

        # The group attribute for this SAML integration.

        @[JSON::Field(key: "groupAttribute")]
        getter group_attribute : String?

        # Custom entity ID attribute to override the default entity ID for this SAML integration.

        @[JSON::Field(key: "openSearchServerlessEntityId")]
        getter open_search_serverless_entity_id : String?

        # The session timeout, in minutes. Default is 60 minutes (12 hours).

        @[JSON::Field(key: "sessionTimeout")]
        getter session_timeout : Int32?

        # A user attribute for this SAML integration.

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @metadata : String,
          @group_attribute : String? = nil,
          @open_search_serverless_entity_id : String? = nil,
          @session_timeout : Int32? = nil,
          @user_attribute : String? = nil
        )
        end
      end

      # Details about a security configuration for OpenSearch Serverless.

      struct SecurityConfigDetail
        include JSON::Serializable

        # The version of the security configuration.

        @[JSON::Field(key: "configVersion")]
        getter config_version : String?

        # The date the configuration was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the security configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes IAM federation options in the form of a key-value map. Contains configuration details
        # about how OpenSearch Serverless integrates with external identity providers through federation.

        @[JSON::Field(key: "iamFederationOptions")]
        getter iam_federation_options : Types::IamFederationConfigOptions?

        # Describes IAM Identity Center options in the form of a key-value map.

        @[JSON::Field(key: "iamIdentityCenterOptions")]
        getter iam_identity_center_options : Types::IamIdentityCenterConfigOptions?

        # The unique identifier of the security configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the configuration was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # SAML options for the security configuration in the form of a key-value map.

        @[JSON::Field(key: "samlOptions")]
        getter saml_options : Types::SamlConfigOptions?

        # The type of security configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @config_version : String? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @iam_federation_options : Types::IamFederationConfigOptions? = nil,
          @iam_identity_center_options : Types::IamIdentityCenterConfigOptions? = nil,
          @id : String? = nil,
          @last_modified_date : Int64? = nil,
          @saml_options : Types::SamlConfigOptions? = nil,
          @type : String? = nil
        )
        end
      end

      # Statistics for an OpenSearch Serverless security configuration.

      struct SecurityConfigStats
        include JSON::Serializable

        # The number of security configurations in the current account.

        @[JSON::Field(key: "SamlConfigCount")]
        getter saml_config_count : Int64?

        def initialize(
          @saml_config_count : Int64? = nil
        )
        end
      end

      # A summary of a security configuration for OpenSearch Serverless.

      struct SecurityConfigSummary
        include JSON::Serializable

        # The version of the security configuration.

        @[JSON::Field(key: "configVersion")]
        getter config_version : String?

        # The Epoch time when the security configuration was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the security configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the security configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the configuration was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The type of security configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @config_version : String? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_date : Int64? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about an OpenSearch Serverless security policy.

      struct SecurityPolicyDetail
        include JSON::Serializable

        # The date the policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the security policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the policy was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The JSON policy document without any whitespaces.

        @[JSON::Field(key: "policy")]
        getter policy : Types::Document?

        # The version of the policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of security policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy : Types::Document? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Statistics for an OpenSearch Serverless security policy.

      struct SecurityPolicyStats
        include JSON::Serializable

        # The number of encryption policies in the current account.

        @[JSON::Field(key: "EncryptionPolicyCount")]
        getter encryption_policy_count : Int64?

        # The number of network policies in the current account.

        @[JSON::Field(key: "NetworkPolicyCount")]
        getter network_policy_count : Int64?

        def initialize(
          @encryption_policy_count : Int64? = nil,
          @network_policy_count : Int64? = nil
        )
        end
      end

      # A summary of a security policy for OpenSearch Serverless.

      struct SecurityPolicySummary
        include JSON::Serializable

        # The date the policy was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the security policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the policy was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the policy.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String?

        # The type of security policy.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @created_date : Int64? = nil,
          @description : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @policy_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Thrown when you attempt to create more resources than the service allows based on service quotas.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "message")]
        getter message : String

        # Service Quotas requirement to identify originating service.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # Service Quotas requirement to identify originating quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Identifier of the resource affected.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Type of the resource affected.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @service_code : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A map of key-value pairs associated to an OpenSearch Serverless resource.

      struct Tag
        include JSON::Serializable

        # The key to use in the tag.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the DELETING
        # state), and must be owned by the account ID included in the request.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tags (key-value pairs) to add to the resource. All tag keys in the request must be unique.

        @[JSON::Field(key: "tags")]
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


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from. The resource must be active (not
        # in the DELETING state), and must be owned by the account ID included in the request.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag or set of tags to remove from the resource. All tag keys in the request must be unique.

        @[JSON::Field(key: "tagKeys")]
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


      struct UpdateAccessPolicyRequest
        include JSON::Serializable

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the policy being updated.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        # The type of policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the policy. Typically used to store information about the permissions defined in
        # the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The JSON policy document to use as the content for the policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @name : String,
          @policy_version : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct UpdateAccessPolicyResponse
        include JSON::Serializable

        # Details about the updated access policy.

        @[JSON::Field(key: "accessPolicyDetail")]
        getter access_policy_detail : Types::AccessPolicyDetail?

        def initialize(
          @access_policy_detail : Types::AccessPolicyDetail? = nil
        )
        end
      end


      struct UpdateAccountSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CapacityLimits?

        def initialize(
          @capacity_limits : Types::CapacityLimits? = nil
        )
        end
      end


      struct UpdateAccountSettingsResponse
        include JSON::Serializable

        # OpenSearch Serverless-related settings for the current Amazon Web Services account.

        @[JSON::Field(key: "accountSettingsDetail")]
        getter account_settings_detail : Types::AccountSettingsDetail?

        def initialize(
          @account_settings_detail : Types::AccountSettingsDetail? = nil
        )
        end
      end

      # Details about an updated OpenSearch Serverless collection.

      struct UpdateCollectionDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date and time when the collection was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the collection.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the collection.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time when the collection was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the collection.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the collection.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The collection type.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about the updated collection group.

      struct UpdateCollectionGroupDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection group.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The capacity limits for the collection group, in OpenSearch Compute Units (OCUs).

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # The Epoch time when the collection group was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # The description of the collection group.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the collection group.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The date and time when the collection group was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the collection group.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @created_date : Int64? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateCollectionGroupRequest
        include JSON::Serializable

        # The unique identifier of the collection group to update.

        @[JSON::Field(key: "id")]
        getter id : String

        # Updated capacity limits for the collection group, in OpenSearch Compute Units (OCUs).

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Types::CollectionGroupCapacityLimits?

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A new description for the collection group.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @id : String,
          @capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateCollectionGroupResponse
        include JSON::Serializable

        # Details about the updated collection group.

        @[JSON::Field(key: "updateCollectionGroupDetail")]
        getter update_collection_group_detail : Types::UpdateCollectionGroupDetail?

        def initialize(
          @update_collection_group_detail : Types::UpdateCollectionGroupDetail? = nil
        )
        end
      end


      struct UpdateCollectionRequest
        include JSON::Serializable

        # The unique identifier of the collection.

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the collection.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @id : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateCollectionResponse
        include JSON::Serializable

        # Details about the updated collection.

        @[JSON::Field(key: "updateCollectionDetail")]
        getter update_collection_detail : Types::UpdateCollectionDetail?

        def initialize(
          @update_collection_detail : Types::UpdateCollectionDetail? = nil
        )
        end
      end

      # Describes IAM Identity Center options for updating an OpenSearch Serverless security configuration
      # in the form of a key-value map.

      struct UpdateIamIdentityCenterConfigOptions
        include JSON::Serializable

        # The group attribute for this IAM Identity Center integration. Defaults to GroupId .

        @[JSON::Field(key: "groupAttribute")]
        getter group_attribute : String?

        # The user attribute for this IAM Identity Center integration. Defaults to UserId .

        @[JSON::Field(key: "userAttribute")]
        getter user_attribute : String?

        def initialize(
          @group_attribute : String? = nil,
          @user_attribute : String? = nil
        )
        end
      end


      struct UpdateIndexRequest
        include JSON::Serializable

        # The unique identifier of the collection containing the index to update.

        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the index to update.

        @[JSON::Field(key: "indexName")]
        getter index_name : String

        # The updated JSON schema definition for the index, including field mappings and settings.

        @[JSON::Field(key: "indexSchema")]
        getter index_schema : Types::IndexSchema?

        def initialize(
          @id : String,
          @index_name : String,
          @index_schema : Types::IndexSchema? = nil
        )
        end
      end


      struct UpdateIndexResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLifecyclePolicyRequest
        include JSON::Serializable

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the policy being updated.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        # The type of lifecycle policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the lifecycle policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The JSON policy document to use as the content for the lifecycle policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @name : String,
          @policy_version : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct UpdateLifecyclePolicyResponse
        include JSON::Serializable

        # Details about the updated lifecycle policy.

        @[JSON::Field(key: "lifecyclePolicyDetail")]
        getter lifecycle_policy_detail : Types::LifecyclePolicyDetail?

        def initialize(
          @lifecycle_policy_detail : Types::LifecyclePolicyDetail? = nil
        )
        end
      end


      struct UpdateSecurityConfigRequest
        include JSON::Serializable

        # The version of the security configuration to be updated. You can find the most recent version of a
        # security configuration using the GetSecurityPolicy command.

        @[JSON::Field(key: "configVersion")]
        getter config_version : String

        # The security configuration identifier. For SAML the ID will be
        # saml/&lt;accountId&gt;/&lt;idpProviderName&gt; . For example, saml/123456789123/OKTADev .

        @[JSON::Field(key: "id")]
        getter id : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the security configuration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes IAM federation options in the form of a key-value map for updating an existing security
        # configuration. Use this field to modify IAM federation settings for the security configuration.

        @[JSON::Field(key: "iamFederationOptions")]
        getter iam_federation_options : Types::IamFederationConfigOptions?

        # Describes IAM Identity Center options in the form of a key-value map.

        @[JSON::Field(key: "iamIdentityCenterOptionsUpdates")]
        getter iam_identity_center_options_updates : Types::UpdateIamIdentityCenterConfigOptions?

        # SAML options in in the form of a key-value map.

        @[JSON::Field(key: "samlOptions")]
        getter saml_options : Types::SamlConfigOptions?

        def initialize(
          @config_version : String,
          @id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @iam_federation_options : Types::IamFederationConfigOptions? = nil,
          @iam_identity_center_options_updates : Types::UpdateIamIdentityCenterConfigOptions? = nil,
          @saml_options : Types::SamlConfigOptions? = nil
        )
        end
      end


      struct UpdateSecurityConfigResponse
        include JSON::Serializable

        # Details about the updated security configuration.

        @[JSON::Field(key: "securityConfigDetail")]
        getter security_config_detail : Types::SecurityConfigDetail?

        def initialize(
          @security_config_detail : Types::SecurityConfigDetail? = nil
        )
        end
      end


      struct UpdateSecurityPolicyRequest
        include JSON::Serializable

        # The name of the policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the policy being updated.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        # The type of access policy.

        @[JSON::Field(key: "type")]
        getter type : String

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A description of the policy. Typically used to store information about the permissions defined in
        # the policy.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The JSON policy document to use as the content for the new policy.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        def initialize(
          @name : String,
          @policy_version : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct UpdateSecurityPolicyResponse
        include JSON::Serializable

        # Details about the updated security policy.

        @[JSON::Field(key: "securityPolicyDetail")]
        getter security_policy_detail : Types::SecurityPolicyDetail?

        def initialize(
          @security_policy_detail : Types::SecurityPolicyDetail? = nil
        )
        end
      end

      # Update details for an OpenSearch Serverless-managed interface endpoint.

      struct UpdateVpcEndpointDetail
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp of when the endpoint was last modified.

        @[JSON::Field(key: "lastModifiedDate")]
        getter last_modified_date : Int64?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The unique identifiers of the security groups that define the ports, protocols, and sources for
        # inbound traffic that you are authorizing into your endpoint.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The current status of the endpoint update process.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the subnets from which you access OpenSearch Serverless.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @id : String? = nil,
          @last_modified_date : Int64? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateVpcEndpointRequest
        include JSON::Serializable

        # The unique identifier of the interface endpoint to update.

        @[JSON::Field(key: "id")]
        getter id : String

        # The unique identifiers of the security groups to add to the endpoint. Security groups define the
        # ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.

        @[JSON::Field(key: "addSecurityGroupIds")]
        getter add_security_group_ids : Array(String)?

        # The ID of one or more subnets to add to the endpoint.

        @[JSON::Field(key: "addSubnetIds")]
        getter add_subnet_ids : Array(String)?

        # Unique, case-sensitive identifier to ensure idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The unique identifiers of the security groups to remove from the endpoint.

        @[JSON::Field(key: "removeSecurityGroupIds")]
        getter remove_security_group_ids : Array(String)?

        # The unique identifiers of the subnets to remove from the endpoint.

        @[JSON::Field(key: "removeSubnetIds")]
        getter remove_subnet_ids : Array(String)?

        def initialize(
          @id : String,
          @add_security_group_ids : Array(String)? = nil,
          @add_subnet_ids : Array(String)? = nil,
          @client_token : String? = nil,
          @remove_security_group_ids : Array(String)? = nil,
          @remove_subnet_ids : Array(String)? = nil
        )
        end
      end


      struct UpdateVpcEndpointResponse
        include JSON::Serializable

        # Details about the updated VPC endpoint.

        @[JSON::Field(key: "UpdateVpcEndpointDetail")]
        getter update_vpc_endpoint_detail : Types::UpdateVpcEndpointDetail?

        def initialize(
          @update_vpc_endpoint_detail : Types::UpdateVpcEndpointDetail? = nil
        )
        end
      end

      # Thrown when the HTTP request contains invalid input or is missing required input.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration options for vector search capabilities in an OpenSearch Serverless collection.

      struct VectorOptions
        include JSON::Serializable

        # Specifies whether serverless vector acceleration is enabled for the collection.

        @[JSON::Field(key: "ServerlessVectorAcceleration")]
        getter serverless_vector_acceleration : String

        def initialize(
          @serverless_vector_acceleration : String
        )
        end
      end

      # Details about an OpenSearch Serverless-managed interface endpoint.

      struct VpcEndpointDetail
        include JSON::Serializable

        # The date the endpoint was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Int64?

        # A failure code associated with the request.

        @[JSON::Field(key: "failureCode")]
        getter failure_code : String?

        # A message associated with the failure code.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The unique identifiers of the security groups that define the ports, protocols, and sources for
        # inbound traffic that you are authorizing into your endpoint.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The current status of the endpoint.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the subnets from which you access OpenSearch Serverless.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC from which you access OpenSearch Serverless.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @created_date : Int64? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Error information for a failed BatchGetVpcEndpoint request.

      struct VpcEndpointErrorDetail
        include JSON::Serializable

        # The error code for the failed request.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message describing the reason for the failure.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The unique identifier of the VPC endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Filter the results of a ListVpcEndpoints request.

      struct VpcEndpointFilters
        include JSON::Serializable

        # The current status of the endpoint.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The VPC endpoint object.

      struct VpcEndpointSummary
        include JSON::Serializable

        # The unique identifier of the endpoint.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the endpoint.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the endpoint.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end
    end
  end
end
