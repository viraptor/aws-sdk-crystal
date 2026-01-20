require "json"
require "time"

module AwsSdk
  module DSQL
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A summary of the properties of a cluster.

      struct ClusterSummary
        include JSON::Serializable

        # The ARN of the cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the cluster.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @arn : String,
          @identifier : String
        )
        end
      end

      # The submitted action has conflicts.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Resource Id

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # Resource Type

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct CreateClusterInput
        include JSON::Serializable

        # An optional field that controls whether to bypass the lockout prevention check. When set to true,
        # this parameter allows you to apply a policy that might lock you out of the cluster. Use with
        # caution.

        @[JSON::Field(key: "bypassPolicyLockoutSafetyCheck")]
        getter bypass_policy_lockout_safety_check : Bool?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully, the subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the Amazon Web Services SDK automatically generates one.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # If enabled, you can't delete your cluster. You must first disable this property before you can
        # delete your cluster.

        @[JSON::Field(key: "deletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The KMS key that encrypts and protects the data on your cluster. You can specify the ARN, ID, or
        # alias of an existing key or have Amazon Web Services create a default key for you.

        @[JSON::Field(key: "kmsEncryptionKey")]
        getter kms_encryption_key : String?

        # The configuration settings when creating a multi-Region cluster, including the witness region and
        # linked cluster properties.

        @[JSON::Field(key: "multiRegionProperties")]
        getter multi_region_properties : Types::MultiRegionProperties?

        # An optional resource-based policy document in JSON format that defines access permissions for the
        # cluster.

        @[JSON::Field(key: "policy")]
        getter policy : String?

        # A map of key and value pairs to use to tag your cluster.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @bypass_policy_lockout_safety_check : Bool? = nil,
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @kms_encryption_key : String? = nil,
          @multi_region_properties : Types::MultiRegionProperties? = nil,
          @policy : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The output of a created cluster.

      struct CreateClusterOutput
        include JSON::Serializable

        # The ARN of the created cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time of when created the cluster.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Whether deletion protection is enabled on this cluster.

        @[JSON::Field(key: "deletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The ID of the created cluster.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The status of the created cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        # The encryption configuration for the cluster that was specified during the creation process,
        # including the KMS key identifier and encryption state.

        @[JSON::Field(key: "encryptionDetails")]
        getter encryption_details : Types::EncryptionDetails?

        # The connection endpoint for the created cluster.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The multi-Region cluster configuration details that were set during cluster creation

        @[JSON::Field(key: "multiRegionProperties")]
        getter multi_region_properties : Types::MultiRegionProperties?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @deletion_protection_enabled : Bool,
          @identifier : String,
          @status : String,
          @encryption_details : Types::EncryptionDetails? = nil,
          @endpoint : String? = nil,
          @multi_region_properties : Types::MultiRegionProperties? = nil
        )
        end
      end


      struct DeleteClusterInput
        include JSON::Serializable

        # The ID of the cluster to delete.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully. The subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the Amazon Web Services SDK automatically generates one.

        @[JSON::Field(key: "client-token")]
        getter client_token : String?

        def initialize(
          @identifier : String,
          @client_token : String? = nil
        )
        end
      end

      # The output from a deleted cluster.

      struct DeleteClusterOutput
        include JSON::Serializable

        # The ARN of the deleted cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time of when the cluster was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ID of the deleted cluster.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The status of the cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @creation_time : Time,
          @identifier : String,
          @status : String
        )
        end
      end


      struct DeleteClusterPolicyInput
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "client-token")]
        getter client_token : String?

        # The expected version of the policy to delete. This parameter ensures that you're deleting the
        # correct version of the policy and helps prevent accidental deletions.

        @[JSON::Field(key: "expected-policy-version")]
        getter expected_policy_version : String?

        def initialize(
          @identifier : String,
          @client_token : String? = nil,
          @expected_policy_version : String? = nil
        )
        end
      end


      struct DeleteClusterPolicyOutput
        include JSON::Serializable

        # The version of the policy that was deleted.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        def initialize(
          @policy_version : String
        )
        end
      end

      # Configuration details about encryption for the cluster including the KMS key ARN, encryption type,
      # and encryption status.

      struct EncryptionDetails
        include JSON::Serializable

        # The status of encryption for the cluster.

        @[JSON::Field(key: "encryptionStatus")]
        getter encryption_status : String

        # The type of encryption that protects the data on your cluster.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The ARN of the KMS key that encrypts data in the cluster.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_status : String,
          @encryption_type : String,
          @kms_key_arn : String? = nil
        )
        end
      end


      struct GetClusterInput
        include JSON::Serializable

        # The ID of the cluster to retrieve.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # The output of a cluster.

      struct GetClusterOutput
        include JSON::Serializable

        # The ARN of the retrieved cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time of when the cluster was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # Whether deletion protection is enabled in this cluster.

        @[JSON::Field(key: "deletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool

        # The ID of the retrieved cluster.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The status of the retrieved cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        # The current encryption configuration details for the cluster.

        @[JSON::Field(key: "encryptionDetails")]
        getter encryption_details : Types::EncryptionDetails?

        # The connection endpoint for the cluster.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Returns the current multi-Region cluster configuration, including witness region and linked cluster
        # information.

        @[JSON::Field(key: "multiRegionProperties")]
        getter multi_region_properties : Types::MultiRegionProperties?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @deletion_protection_enabled : Bool,
          @identifier : String,
          @status : String,
          @encryption_details : Types::EncryptionDetails? = nil,
          @endpoint : String? = nil,
          @multi_region_properties : Types::MultiRegionProperties? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetClusterPolicyInput
        include JSON::Serializable

        # The ID of the cluster to retrieve the policy from.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetClusterPolicyOutput
        include JSON::Serializable

        # The resource-based policy document attached to the cluster, returned as a JSON string.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # The version of the policy document. This version number is incremented each time the policy is
        # updated.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        def initialize(
          @policy : String,
          @policy_version : String
        )
        end
      end


      struct GetVpcEndpointServiceNameInput
        include JSON::Serializable

        # The ID of the cluster to retrieve.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetVpcEndpointServiceNameOutput
        include JSON::Serializable

        # The VPC endpoint service name.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The VPC connection endpoint for the cluster.

        @[JSON::Field(key: "clusterVpcEndpoint")]
        getter cluster_vpc_endpoint : String?

        def initialize(
          @service_name : String,
          @cluster_vpc_endpoint : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # Retry after seconds.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListClustersInput
        include JSON::Serializable

        # An optional parameter that specifies the maximum number of results to return. You can use nextToken
        # to display the next page of results.

        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # If your initial ListClusters operation returns a nextToken, you can include the returned nextToken
        # in following ListClusters operations, which returns results in the next page.

        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListClustersOutput
        include JSON::Serializable

        # An array of the returned clusters.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::ClusterSummary)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. To retrieve the next page, make the call again using the returned
        # token.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @clusters : Array(Types::ClusterSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the resource for which you want to list the tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A map of key and value pairs that you used to tag your resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines the structure for multi-Region cluster configurations, containing the witness region and
      # linked cluster settings.

      struct MultiRegionProperties
        include JSON::Serializable

        # The set of peered clusters that form the multi-Region cluster configuration. Each peered cluster
        # represents a database instance in a different Region.

        @[JSON::Field(key: "clusters")]
        getter clusters : Array(String)?

        # The Region that serves as the witness region for a multi-Region cluster. The witness Region helps
        # maintain cluster consistency and quorum.

        @[JSON::Field(key: "witnessRegion")]
        getter witness_region : String?

        def initialize(
          @clusters : Array(String)? = nil,
          @witness_region : String? = nil
        )
        end
      end


      struct PutClusterPolicyInput
        include JSON::Serializable


        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The resource-based policy document to attach to the cluster. This should be a valid JSON policy
        # document that defines permissions and conditions.

        @[JSON::Field(key: "policy")]
        getter policy : String

        # A flag that allows you to bypass the policy lockout safety check. When set to true, this parameter
        # allows you to apply a policy that might lock you out of the cluster. Use with caution.

        @[JSON::Field(key: "bypassPolicyLockoutSafetyCheck")]
        getter bypass_policy_lockout_safety_check : Bool?


        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The expected version of the current policy. This parameter ensures that you're updating the correct
        # version of the policy and helps prevent concurrent modification conflicts.

        @[JSON::Field(key: "expectedPolicyVersion")]
        getter expected_policy_version : String?

        def initialize(
          @identifier : String,
          @policy : String,
          @bypass_policy_lockout_safety_check : Bool? = nil,
          @client_token : String? = nil,
          @expected_policy_version : String? = nil
        )
        end
      end


      struct PutClusterPolicyOutput
        include JSON::Serializable

        # The version of the policy after it has been updated or created.

        @[JSON::Field(key: "policyVersion")]
        getter policy_version : String

        def initialize(
          @policy_version : String
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID could not be found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type could not be found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The service limit was exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The service exception for exceeding a quota.

        @[JSON::Field(key: "message")]
        getter message : String

        # The service exceeds a quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The resource ID exceeds a quota.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type exceeds a quota.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The request exceeds a service quota.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the resource that you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of key and value pairs to use to tag your resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable

        # The message that the request was denied due to request throttling.

        @[JSON::Field(key: "message")]
        getter message : String

        # The request exceeds a request rate quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The request exceeds a request rate quota. Retry after seconds.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The request exceeds a service quota.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the resource from which to remove tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The array of keys of the tags that you want to remove.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateClusterInput
        include JSON::Serializable

        # The ID of the cluster you want to update.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        # Idempotency ensures that an API request completes only once. With an idempotent request, if the
        # original request completes successfully. The subsequent retries with the same client token return
        # the result from the original successful request and they have no additional effect. If you don't
        # specify a client token, the Amazon Web Services SDK automatically generates one.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies whether to enable deletion protection in your cluster.

        @[JSON::Field(key: "deletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The KMS key that encrypts and protects the data on your cluster. You can specify the ARN, ID, or
        # alias of an existing key or have Amazon Web Services create a default key for you.

        @[JSON::Field(key: "kmsEncryptionKey")]
        getter kms_encryption_key : String?

        # The new multi-Region cluster configuration settings to be applied during an update operation.

        @[JSON::Field(key: "multiRegionProperties")]
        getter multi_region_properties : Types::MultiRegionProperties?

        def initialize(
          @identifier : String,
          @client_token : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @kms_encryption_key : String? = nil,
          @multi_region_properties : Types::MultiRegionProperties? = nil
        )
        end
      end

      # The details of the cluster after it has been updated.

      struct UpdateClusterOutput
        include JSON::Serializable

        # The ARN of the updated cluster.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time of when the cluster was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The ID of the cluster to update.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The status of the updated cluster.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @arn : String,
          @creation_time : Time,
          @identifier : String,
          @status : String
        )
        end
      end

      # The input failed to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation exception.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # A list of fields that didn't validate.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Stores information about a field passed inside a request that resulted in an validation error.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message describing why this field failed validation.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
