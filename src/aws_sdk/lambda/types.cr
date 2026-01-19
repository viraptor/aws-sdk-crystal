require "json"
require "time"

module AwsSdk
  module Lambda
    module Types

      # Limits that are related to concurrency and storage. All file and storage sizes are in bytes.
      struct AccountLimit
        include JSON::Serializable

        # The maximum size of a function's deployment package and layers when they're extracted.
        @[JSON::Field(key: "CodeSizeUnzipped")]
        getter code_size_unzipped : Int64?

        # The maximum size of a deployment package when it's uploaded directly to Lambda. Use Amazon S3 for
        # larger files.
        @[JSON::Field(key: "CodeSizeZipped")]
        getter code_size_zipped : Int64?

        # The maximum number of simultaneous function executions.
        @[JSON::Field(key: "ConcurrentExecutions")]
        getter concurrent_executions : Int32?

        # The amount of storage space that you can use for all deployment packages and layer archives.
        @[JSON::Field(key: "TotalCodeSize")]
        getter total_code_size : Int64?

        # The maximum number of simultaneous function executions, minus the capacity that's reserved for
        # individual functions with PutFunctionConcurrency .
        @[JSON::Field(key: "UnreservedConcurrentExecutions")]
        getter unreserved_concurrent_executions : Int32?

        def initialize(
          @code_size_unzipped : Int64? = nil,
          @code_size_zipped : Int64? = nil,
          @concurrent_executions : Int32? = nil,
          @total_code_size : Int64? = nil,
          @unreserved_concurrent_executions : Int32? = nil
        )
        end
      end

      # The number of functions and amount of storage in use.
      struct AccountUsage
        include JSON::Serializable

        # The number of Lambda functions.
        @[JSON::Field(key: "FunctionCount")]
        getter function_count : Int64?

        # The amount of storage space, in bytes, that's being used by deployment packages and layer archives.
        @[JSON::Field(key: "TotalCodeSize")]
        getter total_code_size : Int64?

        def initialize(
          @function_count : Int64? = nil,
          @total_code_size : Int64? = nil
        )
        end
      end

      struct AddLayerVersionPermissionRequest
        include JSON::Serializable

        # The API action that grants access to the layer. For example, lambda:GetLayerVersion .
        @[JSON::Field(key: "Action")]
        getter action : String

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # An account ID, or * to grant layer usage permission to all accounts in an organization, or all
        # Amazon Web Services accounts (if organizationId is not specified). For the last case, make sure that
        # you really do want all Amazon Web Services accounts to have usage permission to this layer.
        @[JSON::Field(key: "Principal")]
        getter principal : String

        # An identifier that distinguishes the policy from others on the same layer version.
        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        # The version number.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # With the principal set to * , grant permission to all accounts in the specified organization.
        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String?

        # Only update the policy if the revision ID matches the ID specified. Use this option to avoid
        # modifying a policy that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @action : String,
          @layer_name : String,
          @principal : String,
          @statement_id : String,
          @version_number : Int64,
          @organization_id : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct AddLayerVersionPermissionResponse
        include JSON::Serializable

        # A unique identifier for the current revision of the policy.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The permission statement.
        @[JSON::Field(key: "Statement")]
        getter statement : String?

        def initialize(
          @revision_id : String? = nil,
          @statement : String? = nil
        )
        end
      end

      struct AddPermissionRequest
        include JSON::Serializable

        # The action that the principal can use on the function. For example, lambda:InvokeFunction or
        # lambda:GetFunction .
        @[JSON::Field(key: "Action")]
        getter action : String

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The Amazon Web Services service, Amazon Web Services account, IAM user, or IAM role that invokes the
        # function. If you specify a service, use SourceArn or SourceAccount to limit who can invoke the
        # function through that service.
        @[JSON::Field(key: "Principal")]
        getter principal : String

        # A statement identifier that differentiates the statement from others in the same policy.
        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        # For Alexa Smart Home functions, a token that the invoker must supply.
        @[JSON::Field(key: "EventSourceToken")]
        getter event_source_token : String?

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "FunctionUrlAuthType")]
        getter function_url_auth_type : String?

        # Indicates whether the permission applies when the function is invoked through a function URL.
        @[JSON::Field(key: "InvokedViaFunctionUrl")]
        getter invoked_via_function_url : Bool?

        # The identifier for your organization in Organizations. Use this to grant permissions to all the
        # Amazon Web Services accounts under this organization.
        @[JSON::Field(key: "PrincipalOrgID")]
        getter principal_org_id : String?

        # Specify a version or alias to add permissions to a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # Update the policy only if the revision ID matches the ID that's specified. Use this option to avoid
        # modifying a policy that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # For Amazon Web Services service, the ID of the Amazon Web Services account that owns the resource.
        # Use this together with SourceArn to ensure that the specified account owns the resource. It is
        # possible for an Amazon S3 bucket to be deleted by its owner and recreated by another account.
        @[JSON::Field(key: "SourceAccount")]
        getter source_account : String?

        # For Amazon Web Services services, the ARN of the Amazon Web Services resource that invokes the
        # function. For example, an Amazon S3 bucket or Amazon SNS topic. Note that Lambda configures the
        # comparison using the StringLike operator.
        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        def initialize(
          @action : String,
          @function_name : String,
          @principal : String,
          @statement_id : String,
          @event_source_token : String? = nil,
          @function_url_auth_type : String? = nil,
          @invoked_via_function_url : Bool? = nil,
          @principal_org_id : String? = nil,
          @qualifier : String? = nil,
          @revision_id : String? = nil,
          @source_account : String? = nil,
          @source_arn : String? = nil
        )
        end
      end

      struct AddPermissionResponse
        include JSON::Serializable

        # The permission statement that's added to the function policy.
        @[JSON::Field(key: "Statement")]
        getter statement : String?

        def initialize(
          @statement : String? = nil
        )
        end
      end

      # Provides configuration information about a Lambda function alias .
      struct AliasConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alias.
        @[JSON::Field(key: "AliasArn")]
        getter alias_arn : String?

        # A description of the alias.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The function version that the alias invokes.
        @[JSON::Field(key: "FunctionVersion")]
        getter function_version : String?

        # The name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A unique identifier that changes when you update the alias.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The routing configuration of the alias.
        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::AliasRoutingConfiguration?

        def initialize(
          @alias_arn : String? = nil,
          @description : String? = nil,
          @function_version : String? = nil,
          @name : String? = nil,
          @revision_id : String? = nil,
          @routing_config : Types::AliasRoutingConfiguration? = nil
        )
        end
      end

      # The traffic-shifting configuration of a Lambda function alias.
      struct AliasRoutingConfiguration
        include JSON::Serializable

        # The second version, and the percentage of traffic that's routed to it.
        @[JSON::Field(key: "AdditionalVersionWeights")]
        getter additional_version_weights : Hash(String, Float64)?

        def initialize(
          @additional_version_weights : Hash(String, Float64)? = nil
        )
        end
      end

      # List of signing profiles that can sign a code package.
      struct AllowedPublishers
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for each of the signing profiles. A signing profile defines a trusted
        # user who can sign a code package.
        @[JSON::Field(key: "SigningProfileVersionArns")]
        getter signing_profile_version_arns : Array(String)

        def initialize(
          @signing_profile_version_arns : Array(String)
        )
        end
      end

      # Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event
      # source.
      struct AmazonManagedKafkaEventSourceConfig
        include JSON::Serializable

        # The identifier for the Kafka consumer group to join. The consumer group ID must be unique among all
        # your Kafka event sources. After creating a Kafka event source mapping with the consumer group ID
        # specified, you cannot update this value. For more information, see Customizable consumer group ID .
        @[JSON::Field(key: "ConsumerGroupId")]
        getter consumer_group_id : String?

        # Specific configuration settings for a Kafka schema registry.
        @[JSON::Field(key: "SchemaRegistryConfig")]
        getter schema_registry_config : Types::KafkaSchemaRegistryConfig?

        def initialize(
          @consumer_group_id : String? = nil,
          @schema_registry_config : Types::KafkaSchemaRegistryConfig? = nil
        )
        end
      end

      # Contains details about a callback operation in a durable execution, including the callback token and
      # timeout configuration.
      struct CallbackDetails
        include JSON::Serializable

        # The callback ID. Callback IDs are generated by the DurableContext when a durable function calls
        # ctx.waitForCallback .
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String?

        # An error object that contains details about the failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # The response payload from the callback operation as a string.
        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @callback_id : String? = nil,
          @error : Types::ErrorObject? = nil,
          @result : String? = nil
        )
        end
      end

      # Contains details about a failed callback operation, including error information and the reason for
      # failure.
      struct CallbackFailedDetails
        include JSON::Serializable

        # An error object that contains details about the failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Configuration options for callback operations in durable executions, including timeout settings and
      # retry behavior.
      struct CallbackOptions
        include JSON::Serializable

        # The heartbeat timeout for the callback operation, in seconds. If not specified or set to 0,
        # heartbeat timeout is disabled.
        @[JSON::Field(key: "HeartbeatTimeoutSeconds")]
        getter heartbeat_timeout_seconds : Int32?

        # The timeout for the callback operation in seconds. If not specified or set to 0, the callback has no
        # timeout.
        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @heartbeat_timeout_seconds : Int32? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # Contains details about a callback operation that has started, including timing information and
      # callback metadata.
      struct CallbackStartedDetails
        include JSON::Serializable

        # The callback ID. Callback IDs are generated by the DurableContext when a durable function calls
        # ctx.waitForCallback .
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String

        # The heartbeat timeout value, in seconds.
        @[JSON::Field(key: "HeartbeatTimeout")]
        getter heartbeat_timeout : Int32?

        # The timeout value, in seconds.
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        def initialize(
          @callback_id : String,
          @heartbeat_timeout : Int32? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      # Contains details about a successfully completed callback operation, including the result data and
      # completion timestamp.
      struct CallbackSucceededDetails
        include JSON::Serializable

        # The response payload from the successful operation.
        @[JSON::Field(key: "Result")]
        getter result : Types::EventResult

        def initialize(
          @result : Types::EventResult
        )
        end
      end

      # Contains details about a callback operation that timed out, including timeout duration and any
      # partial results.
      struct CallbackTimedOutDetails
        include JSON::Serializable

        # Details about the callback timeout.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # The callback ID token has either expired or the callback associated with the token has already been
      # closed.
      struct CallbackTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A capacity provider manages compute resources for Lambda functions.
      struct CapacityProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the capacity provider.
        @[JSON::Field(key: "CapacityProviderArn")]
        getter capacity_provider_arn : String

        # The permissions configuration for the capacity provider.
        @[JSON::Field(key: "PermissionsConfig")]
        getter permissions_config : Types::CapacityProviderPermissionsConfig

        # The current state of the capacity provider.
        @[JSON::Field(key: "State")]
        getter state : String

        # The VPC configuration for the capacity provider.
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::CapacityProviderVpcConfig

        # The scaling configuration for the capacity provider.
        @[JSON::Field(key: "CapacityProviderScalingConfig")]
        getter capacity_provider_scaling_config : Types::CapacityProviderScalingConfig?

        # The instance requirements for compute resources managed by the capacity provider.
        @[JSON::Field(key: "InstanceRequirements")]
        getter instance_requirements : Types::InstanceRequirements?

        # The ARN of the KMS key used to encrypt the capacity provider's resources.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The date and time when the capacity provider was last modified.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        def initialize(
          @capacity_provider_arn : String,
          @permissions_config : Types::CapacityProviderPermissionsConfig,
          @state : String,
          @vpc_config : Types::CapacityProviderVpcConfig,
          @capacity_provider_scaling_config : Types::CapacityProviderScalingConfig? = nil,
          @instance_requirements : Types::InstanceRequirements? = nil,
          @kms_key_arn : String? = nil,
          @last_modified : String? = nil
        )
        end
      end

      # Configuration for the capacity provider that manages compute resources for Lambda functions.
      struct CapacityProviderConfig
        include JSON::Serializable

        # Configuration for Lambda-managed instances used by the capacity provider.
        @[JSON::Field(key: "LambdaManagedInstancesCapacityProviderConfig")]
        getter lambda_managed_instances_capacity_provider_config : Types::LambdaManagedInstancesCapacityProviderConfig

        def initialize(
          @lambda_managed_instances_capacity_provider_config : Types::LambdaManagedInstancesCapacityProviderConfig
        )
        end
      end

      # The maximum number of capacity providers for your account has been exceeded. For more information,
      # see Lambda quotas
      struct CapacityProviderLimitExceededException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Configuration that specifies the permissions required for the capacity provider to manage compute
      # resources.
      struct CapacityProviderPermissionsConfig
        include JSON::Serializable

        # The ARN of the IAM role that the capacity provider uses to manage compute instances and other Amazon
        # Web Services resources.
        @[JSON::Field(key: "CapacityProviderOperatorRoleArn")]
        getter capacity_provider_operator_role_arn : String

        def initialize(
          @capacity_provider_operator_role_arn : String
        )
        end
      end

      # Configuration that defines how the capacity provider scales compute instances based on demand and
      # policies.
      struct CapacityProviderScalingConfig
        include JSON::Serializable

        # The maximum number of vCPUs that the capacity provider can provision across all compute instances.
        @[JSON::Field(key: "MaxVCpuCount")]
        getter max_v_cpu_count : Int32?

        # The scaling mode that determines how the capacity provider responds to changes in demand.
        @[JSON::Field(key: "ScalingMode")]
        getter scaling_mode : String?

        # A list of scaling policies that define how the capacity provider scales compute instances based on
        # metrics and thresholds.
        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::TargetTrackingScalingPolicy)?

        def initialize(
          @max_v_cpu_count : Int32? = nil,
          @scaling_mode : String? = nil,
          @scaling_policies : Array(Types::TargetTrackingScalingPolicy)? = nil
        )
        end
      end

      # VPC configuration that specifies the network settings for compute instances managed by the capacity
      # provider.
      struct CapacityProviderVpcConfig
        include JSON::Serializable

        # A list of security group IDs that control network access for compute instances managed by the
        # capacity provider.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # A list of subnet IDs where the capacity provider launches compute instances.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # Contains details about a chained function invocation in a durable execution, including the target
      # function and invocation parameters.
      struct ChainedInvokeDetails
        include JSON::Serializable

        # Details about the chained invocation failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # The response payload from the chained invocation.
        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @error : Types::ErrorObject? = nil,
          @result : String? = nil
        )
        end
      end

      # Contains details about a failed chained function invocation, including error information and failure
      # reason.
      struct ChainedInvokeFailedDetails
        include JSON::Serializable

        # Details about the chained invocation failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Configuration options for chained function invocations in durable executions, including retry
      # settings and timeout configuration.
      struct ChainedInvokeOptions
        include JSON::Serializable

        # The name or ARN of the Lambda function to invoke.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The tenant identifier for the chained invocation.
        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        def initialize(
          @function_name : String,
          @tenant_id : String? = nil
        )
        end
      end

      # Contains details about a chained function invocation that has started execution, including start
      # time and execution context.
      struct ChainedInvokeStartedDetails
        include JSON::Serializable

        # The name or ARN of the Lambda function being invoked.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The Amazon Resource Name (ARN) that identifies the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String?

        # The version of the function that was executed.
        @[JSON::Field(key: "ExecutedVersion")]
        getter executed_version : String?

        # The JSON input payload provided to the chained invocation.
        @[JSON::Field(key: "Input")]
        getter input : Types::EventInput?

        # The tenant identifier for the chained invocation.
        @[JSON::Field(key: "TenantId")]
        getter tenant_id : String?

        def initialize(
          @function_name : String,
          @durable_execution_arn : String? = nil,
          @executed_version : String? = nil,
          @input : Types::EventInput? = nil,
          @tenant_id : String? = nil
        )
        end
      end

      # Details about a chained invocation that was stopped.
      struct ChainedInvokeStoppedDetails
        include JSON::Serializable

        # Details about why the chained invocation stopped.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Details about a chained invocation that succeeded.
      struct ChainedInvokeSucceededDetails
        include JSON::Serializable

        # The response payload from the successful operation.
        @[JSON::Field(key: "Result")]
        getter result : Types::EventResult

        def initialize(
          @result : Types::EventResult
        )
        end
      end

      # Details about a chained invocation that timed out.
      struct ChainedInvokeTimedOutDetails
        include JSON::Serializable

        # Details about the chained invocation timeout.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      struct CheckpointDurableExecutionRequest
        include JSON::Serializable

        # A unique token that identifies the current checkpoint state. This token is provided by the Lambda
        # runtime and must be used to ensure checkpoints are applied in the correct order. Each checkpoint
        # operation consumes this token and returns a new one.
        @[JSON::Field(key: "CheckpointToken")]
        getter checkpoint_token : String

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # An optional idempotency token to ensure that duplicate checkpoint requests are handled correctly. If
        # provided, Lambda uses this token to detect and handle duplicate requests within a 15-minute window.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of state updates to apply during this checkpoint. Each update represents a change to the
        # execution state, such as completing a step, starting a callback, or scheduling a timer. Updates are
        # applied atomically as part of the checkpoint operation.
        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::OperationUpdate)?

        def initialize(
          @checkpoint_token : String,
          @durable_execution_arn : String,
          @client_token : String? = nil,
          @updates : Array(Types::OperationUpdate)? = nil
        )
        end
      end

      # The response from the CheckpointDurableExecution operation.
      struct CheckpointDurableExecutionResponse
        include JSON::Serializable

        # Updated execution state information that includes any changes that occurred since the last
        # checkpoint, such as completed callbacks or expired timers. This allows the SDK to update its
        # internal state during replay.
        @[JSON::Field(key: "NewExecutionState")]
        getter new_execution_state : Types::CheckpointUpdatedExecutionState

        # A new checkpoint token to use for the next checkpoint operation. This token replaces the one
        # provided in the request and must be used for subsequent checkpoints to maintain proper ordering.
        @[JSON::Field(key: "CheckpointToken")]
        getter checkpoint_token : String?

        def initialize(
          @new_execution_state : Types::CheckpointUpdatedExecutionState,
          @checkpoint_token : String? = nil
        )
        end
      end

      # Contains operations that have been updated since the last checkpoint, such as completed asynchronous
      # work like timers or callbacks.
      struct CheckpointUpdatedExecutionState
        include JSON::Serializable

        # Indicates that more results are available. Use this value in a subsequent call to retrieve the next
        # page of results.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # A list of operations that have been updated since the last checkpoint.
        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @next_marker : String? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Details about a Code signing configuration .
      struct CodeSigningConfig
        include JSON::Serializable

        # List of allowed publishers.
        @[JSON::Field(key: "AllowedPublishers")]
        getter allowed_publishers : Types::AllowedPublishers

        # The Amazon Resource Name (ARN) of the Code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # Unique identifer for the Code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigId")]
        getter code_signing_config_id : String

        # The code signing policy controls the validation failure action for signature mismatch or expiry.
        @[JSON::Field(key: "CodeSigningPolicies")]
        getter code_signing_policies : Types::CodeSigningPolicies

        # The date and time that the Code signing configuration was last modified, in ISO-8601 format
        # (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String

        # Code signing configuration description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @allowed_publishers : Types::AllowedPublishers,
          @code_signing_config_arn : String,
          @code_signing_config_id : String,
          @code_signing_policies : Types::CodeSigningPolicies,
          @last_modified : String,
          @description : String? = nil
        )
        end
      end

      # The specified code signing configuration does not exist.
      struct CodeSigningConfigNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Code signing configuration policies specify the validation failure action for signature mismatch or
      # expiry.
      struct CodeSigningPolicies
        include JSON::Serializable

        # Code signing configuration policy for deployment validation failure. If you set the policy to
        # Enforce , Lambda blocks the deployment request if signature validation checks fail. If you set the
        # policy to Warn , Lambda allows the deployment and issues a new Amazon CloudWatch metric (
        # SignatureValidationErrors ) and also stores the warning in the CloudTrail log. Default value: Warn
        @[JSON::Field(key: "UntrustedArtifactOnDeployment")]
        getter untrusted_artifact_on_deployment : String?

        def initialize(
          @untrusted_artifact_on_deployment : String? = nil
        )
        end
      end

      # Your Amazon Web Services account has exceeded its maximum total code size. For more information, see
      # Lambda quotas .
      struct CodeStorageExceededException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The code signature failed one or more of the validation checks for signature mismatch or expiry, and
      # the code signing policy is set to ENFORCE. Lambda blocks the deployment.
      struct CodeVerificationFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct Concurrency
        include JSON::Serializable

        # The number of concurrent executions that are reserved for this function. For more information, see
        # Managing Lambda reserved concurrency .
        @[JSON::Field(key: "ReservedConcurrentExecutions")]
        getter reserved_concurrent_executions : Int32?

        def initialize(
          @reserved_concurrent_executions : Int32? = nil
        )
        end
      end

      # Details about a durable execution context.
      struct ContextDetails
        include JSON::Serializable

        # Details about the context failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # Whether the state data of child operations of this completed context should be included in the
        # invoke payload and GetDurableExecutionState response.
        @[JSON::Field(key: "ReplayChildren")]
        getter replay_children : Bool?

        # The response payload from the context.
        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @error : Types::ErrorObject? = nil,
          @replay_children : Bool? = nil,
          @result : String? = nil
        )
        end
      end

      # Details about a context that failed.
      struct ContextFailedDetails
        include JSON::Serializable

        # Details about the context failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Configuration options for a durable execution context.
      struct ContextOptions
        include JSON::Serializable

        # Whether the state data of children of the completed context should be included in the invoke payload
        # and GetDurableExecutionState response.
        @[JSON::Field(key: "ReplayChildren")]
        getter replay_children : Bool?

        def initialize(
          @replay_children : Bool? = nil
        )
        end
      end

      # Details about a context that has started.
      struct ContextStartedDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a context that succeeded.
      struct ContextSucceededDetails
        include JSON::Serializable

        # The JSON response payload from the successful context.
        @[JSON::Field(key: "Result")]
        getter result : Types::EventResult

        def initialize(
          @result : Types::EventResult
        )
        end
      end

      # The cross-origin resource sharing (CORS) settings for your Lambda function URL. Use CORS to grant
      # access to your function URL from any origin. You can also use CORS to control access for specific
      # HTTP headers and methods in requests to your function URL.
      struct Cors
        include JSON::Serializable

        # Whether to allow cookies or other credentials in requests to your function URL. The default is false
        # .
        @[JSON::Field(key: "AllowCredentials")]
        getter allow_credentials : Bool?

        # The HTTP headers that origins can include in requests to your function URL. For example: Date ,
        # Keep-Alive , X-Custom-Header .
        @[JSON::Field(key: "AllowHeaders")]
        getter allow_headers : Array(String)?

        # The HTTP methods that are allowed when calling your function URL. For example: GET , POST , DELETE ,
        # or the wildcard character ( * ).
        @[JSON::Field(key: "AllowMethods")]
        getter allow_methods : Array(String)?

        # The origins that can access your function URL. You can list any number of specific origins,
        # separated by a comma. For example: https://www.example.com , http://localhost:60905 . Alternatively,
        # you can grant access to all origins using the wildcard character ( * ).
        @[JSON::Field(key: "AllowOrigins")]
        getter allow_origins : Array(String)?

        # The HTTP headers in your function response that you want to expose to origins that call your
        # function URL. For example: Date , Keep-Alive , X-Custom-Header .
        @[JSON::Field(key: "ExposeHeaders")]
        getter expose_headers : Array(String)?

        # The maximum amount of time, in seconds, that web browsers can cache results of a preflight request.
        # By default, this is set to 0 , which means that the browser doesn't cache results.
        @[JSON::Field(key: "MaxAge")]
        getter max_age : Int32?

        def initialize(
          @allow_credentials : Bool? = nil,
          @allow_headers : Array(String)? = nil,
          @allow_methods : Array(String)? = nil,
          @allow_origins : Array(String)? = nil,
          @expose_headers : Array(String)? = nil,
          @max_age : Int32? = nil
        )
        end
      end

      struct CreateAliasRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The function version that the alias invokes.
        @[JSON::Field(key: "FunctionVersion")]
        getter function_version : String

        # The name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the alias.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The routing configuration of the alias.
        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::AliasRoutingConfiguration?

        def initialize(
          @function_name : String,
          @function_version : String,
          @name : String,
          @description : String? = nil,
          @routing_config : Types::AliasRoutingConfiguration? = nil
        )
        end
      end

      struct CreateCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider.
        @[JSON::Field(key: "CapacityProviderName")]
        getter capacity_provider_name : String

        # The permissions configuration that specifies the IAM role ARN used by the capacity provider to
        # manage compute resources.
        @[JSON::Field(key: "PermissionsConfig")]
        getter permissions_config : Types::CapacityProviderPermissionsConfig

        # The VPC configuration for the capacity provider, including subnet IDs and security group IDs where
        # compute instances will be launched.
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::CapacityProviderVpcConfig

        # The scaling configuration that defines how the capacity provider scales compute instances, including
        # maximum vCPU count and scaling policies.
        @[JSON::Field(key: "CapacityProviderScalingConfig")]
        getter capacity_provider_scaling_config : Types::CapacityProviderScalingConfig?

        # The instance requirements that specify the compute instance characteristics, including architectures
        # and allowed or excluded instance types.
        @[JSON::Field(key: "InstanceRequirements")]
        getter instance_requirements : Types::InstanceRequirements?

        # The ARN of the KMS key used to encrypt data associated with the capacity provider.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # A list of tags to associate with the capacity provider.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @capacity_provider_name : String,
          @permissions_config : Types::CapacityProviderPermissionsConfig,
          @vpc_config : Types::CapacityProviderVpcConfig,
          @capacity_provider_scaling_config : Types::CapacityProviderScalingConfig? = nil,
          @instance_requirements : Types::InstanceRequirements? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateCapacityProviderResponse
        include JSON::Serializable

        # Information about the capacity provider that was created.
        @[JSON::Field(key: "CapacityProvider")]
        getter capacity_provider : Types::CapacityProvider

        def initialize(
          @capacity_provider : Types::CapacityProvider
        )
        end
      end

      struct CreateCodeSigningConfigRequest
        include JSON::Serializable

        # Signing profiles for this code signing configuration.
        @[JSON::Field(key: "AllowedPublishers")]
        getter allowed_publishers : Types::AllowedPublishers

        # The code signing policies define the actions to take if the validation checks fail.
        @[JSON::Field(key: "CodeSigningPolicies")]
        getter code_signing_policies : Types::CodeSigningPolicies?

        # Descriptive name for this code signing configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of tags to add to the code signing configuration.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @allowed_publishers : Types::AllowedPublishers,
          @code_signing_policies : Types::CodeSigningPolicies? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateCodeSigningConfigResponse
        include JSON::Serializable

        # The code signing configuration.
        @[JSON::Field(key: "CodeSigningConfig")]
        getter code_signing_config : Types::CodeSigningConfig

        def initialize(
          @code_signing_config : Types::CodeSigningConfig
        )
        end
      end

      struct CreateEventSourceMappingRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – MyFunction . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Version or Alias ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD . Partial ARN –
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it's limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event
        # source.
        @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
        getter amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig?

        # The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to
        # your function. Lambda passes all of the records in the batch to the function in a single call, up to
        # the payload limit for synchronous invocation (6 MB). Amazon Kinesis – Default 100. Max 10,000.
        # Amazon DynamoDB Streams – Default 100. Max 10,000. Amazon Simple Queue Service – Default 10. For
        # standard queues the max is 10,000. For FIFO queues the max is 10. Amazon Managed Streaming for
        # Apache Kafka – Default 100. Max 10,000. Self-managed Apache Kafka – Default 100. Max 10,000. Amazon
        # MQ (ActiveMQ and RabbitMQ) – Default 100. Max 10,000. DocumentDB – Default 100. Max 10,000.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If the function returns an
        # error, split the batch in two and retry.
        @[JSON::Field(key: "BisectBatchOnFunctionError")]
        getter bisect_batch_on_function_error : Bool?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A configuration object that
        # specifies the destination of an event after Lambda processes it.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # Specific configuration settings for a DocumentDB event source.
        @[JSON::Field(key: "DocumentDBEventSourceConfig")]
        getter document_db_event_source_config : Types::DocumentDBEventSourceConfig?

        # When true, the event source mapping is active. When false, Lambda pauses polling and invocation.
        # Default: True
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The Amazon Resource Name (ARN) of the event source. Amazon Kinesis – The ARN of the data stream or a
        # stream consumer. Amazon DynamoDB Streams – The ARN of the stream. Amazon Simple Queue Service – The
        # ARN of the queue. Amazon Managed Streaming for Apache Kafka – The ARN of the cluster or the ARN of
        # the VPC connection (for cross-account event source mappings ). Amazon MQ – The ARN of the broker.
        # Amazon DocumentDB – The ARN of the DocumentDB change stream.
        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # An object that defines the filter criteria that determine whether Lambda should process an event.
        # For more information, see Lambda event filtering .
        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and Amazon SQS) A list of current
        # response type enums applied to the event source mapping.
        @[JSON::Field(key: "FunctionResponseTypes")]
        getter function_response_types : Array(String)?

        # The ARN of the Key Management Service (KMS) customer managed key that Lambda uses to encrypt your
        # function's filter criteria . By default, Lambda does not encrypt your filter criteria object.
        # Specify this property to encrypt data using your own customer managed key.
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the
        # function. You can configure MaximumBatchingWindowInSeconds to any value from 0 seconds to 300
        # seconds in increments of seconds. For Kinesis, DynamoDB, and Amazon SQS event sources, the default
        # batching window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB
        # event sources, the default batching window is 500 ms. Note that because you can only change
        # MaximumBatchingWindowInSeconds in increments of seconds, you cannot revert back to the 500 ms
        # default batching window after you have changed it. To restore the default batching window, you must
        # create a new event source mapping. Related setting: For Kinesis, DynamoDB, and Amazon SQS event
        # sources, when you set BatchSize to a value greater than 10, you must set
        # MaximumBatchingWindowInSeconds to at least 1.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records older than
        # the specified age. The default value is infinite (-1).
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records after the
        # specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed
        # records are retried until the record expires.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # The metrics configuration for your event source. For more information, see Event source mapping
        # metrics .
        @[JSON::Field(key: "MetricsConfig")]
        getter metrics_config : Types::EventSourceMappingMetricsConfig?

        # (Kinesis and DynamoDB Streams only) The number of batches to process from each shard concurrently.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        # (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned mode configuration for
        # the event source. For more information, see provisioned mode .
        @[JSON::Field(key: "ProvisionedPollerConfig")]
        getter provisioned_poller_config : Types::ProvisionedPollerConfig?

        # (MQ) The name of the Amazon MQ broker destination queue to consume.
        @[JSON::Field(key: "Queues")]
        getter queues : Array(String)?

        # (Amazon SQS only) The scaling configuration for the event source. For more information, see
        # Configuring maximum concurrency for Amazon SQS event sources .
        @[JSON::Field(key: "ScalingConfig")]
        getter scaling_config : Types::ScalingConfig?

        # The self-managed Apache Kafka cluster to receive records from.
        @[JSON::Field(key: "SelfManagedEventSource")]
        getter self_managed_event_source : Types::SelfManagedEventSource?

        # Specific configuration settings for a self-managed Apache Kafka event source.
        @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
        getter self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig?

        # An array of authentication protocols or VPC components required to secure your event source.
        @[JSON::Field(key: "SourceAccessConfigurations")]
        getter source_access_configurations : Array(Types::SourceAccessConfiguration)?

        # The position in a stream from which to start reading. Required for Amazon Kinesis and Amazon
        # DynamoDB Stream event sources. AT_TIMESTAMP is supported only for Amazon Kinesis streams, Amazon
        # DocumentDB, Amazon MSK, and self-managed Apache Kafka.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String?

        # With StartingPosition set to AT_TIMESTAMP , the time from which to start reading.
        # StartingPositionTimestamp cannot be in the future.
        @[JSON::Field(key: "StartingPositionTimestamp")]
        getter starting_position_timestamp : Time?

        # A list of tags to apply to the event source mapping.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The name of the Kafka topic.
        @[JSON::Field(key: "Topics")]
        getter topics : Array(String)?

        # (Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and
        # Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.
        @[JSON::Field(key: "TumblingWindowInSeconds")]
        getter tumbling_window_in_seconds : Int32?

        def initialize(
          @function_name : String,
          @amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig? = nil,
          @batch_size : Int32? = nil,
          @bisect_batch_on_function_error : Bool? = nil,
          @destination_config : Types::DestinationConfig? = nil,
          @document_db_event_source_config : Types::DocumentDBEventSourceConfig? = nil,
          @enabled : Bool? = nil,
          @event_source_arn : String? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @function_response_types : Array(String)? = nil,
          @kms_key_arn : String? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @metrics_config : Types::EventSourceMappingMetricsConfig? = nil,
          @parallelization_factor : Int32? = nil,
          @provisioned_poller_config : Types::ProvisionedPollerConfig? = nil,
          @queues : Array(String)? = nil,
          @scaling_config : Types::ScalingConfig? = nil,
          @self_managed_event_source : Types::SelfManagedEventSource? = nil,
          @self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig? = nil,
          @source_access_configurations : Array(Types::SourceAccessConfiguration)? = nil,
          @starting_position : String? = nil,
          @starting_position_timestamp : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @topics : Array(String)? = nil,
          @tumbling_window_in_seconds : Int32? = nil
        )
        end
      end

      struct CreateFunctionRequest
        include JSON::Serializable

        # The code for the function.
        @[JSON::Field(key: "Code")]
        getter code : Types::FunctionCode

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The Amazon Resource Name (ARN) of the function's execution role.
        @[JSON::Field(key: "Role")]
        getter role : String

        # The instruction set architecture that the function supports. Enter a string array with one of the
        # valid values (arm64 or x86_64). The default value is x86_64 .
        @[JSON::Field(key: "Architectures")]
        getter architectures : Array(String)?

        # Configuration for the capacity provider that manages compute resources for Lambda functions.
        @[JSON::Field(key: "CapacityProviderConfig")]
        getter capacity_provider_config : Types::CapacityProviderConfig?

        # To enable code signing for this function, specify the ARN of a code-signing configuration. A
        # code-signing configuration includes a set of signing profiles, which define the trusted publishers
        # for this function.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String?

        # A dead-letter queue configuration that specifies the queue or topic where Lambda sends asynchronous
        # events when they fail processing. For more information, see Dead-letter queues .
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # A description of the function.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Configuration settings for durable functions. Enables creating functions with durability that can
        # remember their state and continue execution even after interruptions.
        @[JSON::Field(key: "DurableConfig")]
        getter durable_config : Types::DurableConfig?

        # Environment variables that are accessible from function code during execution.
        @[JSON::Field(key: "Environment")]
        getter environment : Types::Environment?

        # The size of the function's /tmp directory in MB. The default value is 512, but can be any whole
        # number between 512 and 10,240 MB. For more information, see Configuring ephemeral storage (console)
        # .
        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # Connection settings for an Amazon EFS file system.
        @[JSON::Field(key: "FileSystemConfigs")]
        getter file_system_configs : Array(Types::FileSystemConfig)?

        # The name of the method within your code that Lambda calls to run your function. Handler is required
        # if the deployment package is a .zip file archive. The format includes the file name. It can also
        # include namespaces and other qualifiers, depending on the runtime. For more information, see Lambda
        # programming model .
        @[JSON::Field(key: "Handler")]
        getter handler : String?

        # Container image configuration values that override the values in the container image Dockerfile.
        @[JSON::Field(key: "ImageConfig")]
        getter image_config : Types::ImageConfig?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt the
        # following resources: The function's environment variables . The function's Lambda SnapStart
        # snapshots. When used with SourceKMSKeyArn , the unzipped version of the .zip deployment package
        # that's used for function invocations. For more information, see Specifying a customer managed key
        # for Lambda . The optimized version of the container image that's used for function invocations. Note
        # that this is not the same key that's used to protect your container image in the Amazon Elastic
        # Container Registry (Amazon ECR). For more information, see Function lifecycle . If you don't provide
        # a customer managed key, Lambda uses an Amazon Web Services owned key or an Amazon Web Services
        # managed key .
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # A list of function layers to add to the function's execution environment. Specify each layer by its
        # ARN, including the version.
        @[JSON::Field(key: "Layers")]
        getter layers : Array(String)?

        # The function's Amazon CloudWatch Logs configuration settings.
        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # The amount of memory available to the function at runtime. Increasing the function memory also
        # increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.
        @[JSON::Field(key: "MemorySize")]
        getter memory_size : Int32?

        # The type of deployment package. Set to Image for container image and set to Zip for .zip file
        # archive.
        @[JSON::Field(key: "PackageType")]
        getter package_type : String?

        # Set to true to publish the first version of the function during creation.
        @[JSON::Field(key: "Publish")]
        getter publish : Bool?

        # Specifies where to publish the function version or configuration.
        @[JSON::Field(key: "PublishTo")]
        getter publish_to : String?

        # The identifier of the function's runtime . Runtime is required if the deployment package is a .zip
        # file archive. Specifying a runtime results in an error if you're deploying a function using a
        # container image. The following list includes deprecated runtimes. Lambda blocks creating new
        # functions and updating existing functions shortly after each runtime is deprecated. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "Runtime")]
        getter runtime : String?

        # The function's SnapStart setting.
        @[JSON::Field(key: "SnapStart")]
        getter snap_start : Types::SnapStart?

        # A list of tags to apply to the function.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Configuration for multi-tenant applications that use Lambda functions. Defines tenant isolation
        # settings and resource allocations. Required for functions supporting multiple tenants.
        @[JSON::Field(key: "TenancyConfig")]
        getter tenancy_config : Types::TenancyConfig?

        # The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default
        # is 3 seconds. The maximum allowed value is 900 seconds. For more information, see Lambda execution
        # environment .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # Set Mode to Active to sample and trace a subset of incoming requests with X-Ray .
        @[JSON::Field(key: "TracingConfig")]
        getter tracing_config : Types::TracingConfig?

        # For network connectivity to Amazon Web Services resources in a VPC, specify a list of security
        # groups and subnets in the VPC. When you connect a function to a VPC, it can access resources and the
        # internet only through that VPC. For more information, see Configuring a Lambda function to access
        # resources in a VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @code : Types::FunctionCode,
          @function_name : String,
          @role : String,
          @architectures : Array(String)? = nil,
          @capacity_provider_config : Types::CapacityProviderConfig? = nil,
          @code_signing_config_arn : String? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @durable_config : Types::DurableConfig? = nil,
          @environment : Types::Environment? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @file_system_configs : Array(Types::FileSystemConfig)? = nil,
          @handler : String? = nil,
          @image_config : Types::ImageConfig? = nil,
          @kms_key_arn : String? = nil,
          @layers : Array(String)? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @memory_size : Int32? = nil,
          @package_type : String? = nil,
          @publish : Bool? = nil,
          @publish_to : String? = nil,
          @runtime : String? = nil,
          @snap_start : Types::SnapStart? = nil,
          @tags : Hash(String, String)? = nil,
          @tenancy_config : Types::TenancyConfig? = nil,
          @timeout : Int32? = nil,
          @tracing_config : Types::TracingConfig? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct CreateFunctionUrlConfigRequest
        include JSON::Serializable

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        # The alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @auth_type : String,
          @function_name : String,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil,
          @qualifier : String? = nil
        )
        end
      end

      struct CreateFunctionUrlConfigResponse
        include JSON::Serializable

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # When the function URL was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String

        # The Amazon Resource Name (ARN) of your function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The HTTP URL endpoint for your function.
        @[JSON::Field(key: "FunctionUrl")]
        getter function_url : String

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        def initialize(
          @auth_type : String,
          @creation_time : String,
          @function_arn : String,
          @function_url : String,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil
        )
        end
      end

      # The dead-letter queue for failed asynchronous invocations.
      struct DeadLetterConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String?

        def initialize(
          @target_arn : String? = nil
        )
        end
      end

      struct DeleteAliasRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @function_name : String,
          @name : String
        )
        end
      end

      struct DeleteCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider to delete.
        @[JSON::Field(key: "CapacityProviderName")]
        getter capacity_provider_name : String

        def initialize(
          @capacity_provider_name : String
        )
        end
      end

      struct DeleteCapacityProviderResponse
        include JSON::Serializable

        # Information about the deleted capacity provider.
        @[JSON::Field(key: "CapacityProvider")]
        getter capacity_provider : Types::CapacityProvider

        def initialize(
          @capacity_provider : Types::CapacityProvider
        )
        end
      end

      struct DeleteCodeSigningConfigRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        def initialize(
          @code_signing_config_arn : String
        )
        end
      end

      struct DeleteCodeSigningConfigResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEventSourceMappingRequest
        include JSON::Serializable

        # The identifier of the event source mapping.
        @[JSON::Field(key: "UUID")]
        getter uuid : String

        def initialize(
          @uuid : String
        )
        end
      end

      struct DeleteFunctionCodeSigningConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @function_name : String
        )
        end
      end

      struct DeleteFunctionConcurrencyRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @function_name : String
        )
        end
      end

      struct DeleteFunctionEventInvokeConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name - my-function
        # (name-only), my-function:v1 (with alias). Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN -
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # A version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct DeleteFunctionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function or version. Name formats Function name – my-function
        # (name-only), my-function:1 (with version). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version to delete. You can't delete a version that an alias references.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct DeleteFunctionResponse
        include JSON::Serializable

        # The HTTP status code returned by the operation.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      struct DeleteFunctionUrlConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct DeleteLayerVersionRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # The version number.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @layer_name : String,
          @version_number : Int64
        )
        end
      end

      struct DeleteProvisionedConcurrencyConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String

        def initialize(
          @function_name : String,
          @qualifier : String
        )
        end
      end

      # A configuration object that specifies the destination of an event after Lambda processes it. For
      # more information, see Adding a destination .
      struct DestinationConfig
        include JSON::Serializable

        # The destination configuration for failed invocations.
        @[JSON::Field(key: "OnFailure")]
        getter on_failure : Types::OnFailure?

        # The destination configuration for successful invocations. Not supported in CreateEventSourceMapping
        # or UpdateEventSourceMapping .
        @[JSON::Field(key: "OnSuccess")]
        getter on_success : Types::OnSuccess?

        def initialize(
          @on_failure : Types::OnFailure? = nil,
          @on_success : Types::OnSuccess? = nil
        )
        end
      end

      # Specific configuration settings for a DocumentDB event source.
      struct DocumentDBEventSourceConfig
        include JSON::Serializable

        # The name of the collection to consume within the database. If you do not specify a collection,
        # Lambda consumes all collections.
        @[JSON::Field(key: "CollectionName")]
        getter collection_name : String?

        # The name of the database to consume within the DocumentDB cluster.
        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String?

        # Determines what DocumentDB sends to your event stream during document update operations. If set to
        # UpdateLookup, DocumentDB sends a delta describing the changes, along with a copy of the entire
        # document. Otherwise, DocumentDB sends only a partial document that contains the changes.
        @[JSON::Field(key: "FullDocument")]
        getter full_document : String?

        def initialize(
          @collection_name : String? = nil,
          @database_name : String? = nil,
          @full_document : String? = nil
        )
        end
      end

      # Configuration settings for durable functions , including execution timeout and retention period for
      # execution history.
      struct DurableConfig
        include JSON::Serializable

        # The maximum time (in seconds) that a durable execution can run before timing out. This timeout
        # applies to the entire durable execution, not individual function invocations.
        @[JSON::Field(key: "ExecutionTimeout")]
        getter execution_timeout : Int32?

        # The number of days to retain execution history after a durable execution completes. After this
        # period, execution history is no longer available through the GetDurableExecutionHistory API.
        @[JSON::Field(key: "RetentionPeriodInDays")]
        getter retention_period_in_days : Int32?

        def initialize(
          @execution_timeout : Int32? = nil,
          @retention_period_in_days : Int32? = nil
        )
        end
      end

      # The durable execution with the specified name has already been started. Each durable execution name
      # must be unique within the function. Use a different name or check the status of the existing
      # execution.
      struct DurableExecutionAlreadyStartedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Need additional permissions to configure VPC settings.
      struct EC2AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Amazon EC2 throttled Lambda during Lambda function initialization using the execution role provided
      # for the function.
      struct EC2ThrottledException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda received an unexpected Amazon EC2 client exception while setting up for the Lambda function.
      struct EC2UnexpectedException
        include JSON::Serializable

        @[JSON::Field(key: "EC2ErrorCode")]
        getter ec2_error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @ec2_error_code : String? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An error occurred when reading from or writing to a connected file system.
      struct EFSIOException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Lambda function couldn't make a network connection to the configured file system.
      struct EFSMountConnectivityException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Lambda function couldn't mount the configured file system due to a permission or configuration
      # issue.
      struct EFSMountFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Lambda function made a network connection to the configured file system, but the mount operation
      # timed out.
      struct EFSMountTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda couldn't create an elastic network interface in the VPC, specified as part of Lambda function
      # configuration, because the limit for network interfaces has been reached. For more information, see
      # Lambda quotas .
      struct ENILimitReachedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A function's environment variable settings. You can use environment variables to adjust your
      # function's behavior without updating code. An environment variable is a pair of strings that are
      # stored in a function's version-specific configuration.
      struct Environment
        include JSON::Serializable

        # Environment variable key-value pairs. For more information, see Using Lambda environment variables .
        @[JSON::Field(key: "Variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # Error messages for environment variables that couldn't be applied.
      struct EnvironmentError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The results of an operation to update or read environment variables. If the operation succeeds, the
      # response contains the environment variables. If it fails, the response contains details about the
      # error.
      struct EnvironmentResponse
        include JSON::Serializable

        # Error messages for environment variables that couldn't be applied.
        @[JSON::Field(key: "Error")]
        getter error : Types::EnvironmentError?

        # Environment variable key-value pairs. Omitted from CloudTrail logs.
        @[JSON::Field(key: "Variables")]
        getter variables : Hash(String, String)?

        def initialize(
          @error : Types::EnvironmentError? = nil,
          @variables : Hash(String, String)? = nil
        )
        end
      end

      # The size of the function's /tmp directory in MB. The default value is 512, but can be any whole
      # number between 512 and 10,240 MB. For more information, see Configuring ephemeral storage (console)
      # .
      struct EphemeralStorage
        include JSON::Serializable

        # The size of the function's /tmp directory.
        @[JSON::Field(key: "Size")]
        getter size : Int32

        def initialize(
          @size : Int32
        )
        end
      end

      # An object that contains error information.
      struct ErrorObject
        include JSON::Serializable

        # Machine-readable error data.
        @[JSON::Field(key: "ErrorData")]
        getter error_data : String?

        # A human-readable error message.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The error type.
        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        # Stack trace information for the error.
        @[JSON::Field(key: "StackTrace")]
        getter stack_trace : Array(String)?

        def initialize(
          @error_data : String? = nil,
          @error_message : String? = nil,
          @error_type : String? = nil,
          @stack_trace : Array(String)? = nil
        )
        end
      end

      # An event that occurred during the execution of a durable function.
      struct Event
        include JSON::Serializable

        @[JSON::Field(key: "CallbackFailedDetails")]
        getter callback_failed_details : Types::CallbackFailedDetails?

        @[JSON::Field(key: "CallbackStartedDetails")]
        getter callback_started_details : Types::CallbackStartedDetails?

        @[JSON::Field(key: "CallbackSucceededDetails")]
        getter callback_succeeded_details : Types::CallbackSucceededDetails?

        @[JSON::Field(key: "CallbackTimedOutDetails")]
        getter callback_timed_out_details : Types::CallbackTimedOutDetails?

        @[JSON::Field(key: "ChainedInvokeFailedDetails")]
        getter chained_invoke_failed_details : Types::ChainedInvokeFailedDetails?

        @[JSON::Field(key: "ChainedInvokeStartedDetails")]
        getter chained_invoke_started_details : Types::ChainedInvokeStartedDetails?

        # Details about a chained invocation that was stopped.
        @[JSON::Field(key: "ChainedInvokeStoppedDetails")]
        getter chained_invoke_stopped_details : Types::ChainedInvokeStoppedDetails?

        # Details about a chained invocation that succeeded.
        @[JSON::Field(key: "ChainedInvokeSucceededDetails")]
        getter chained_invoke_succeeded_details : Types::ChainedInvokeSucceededDetails?

        # Details about a chained invocation that timed out.
        @[JSON::Field(key: "ChainedInvokeTimedOutDetails")]
        getter chained_invoke_timed_out_details : Types::ChainedInvokeTimedOutDetails?

        # Details about a context that failed.
        @[JSON::Field(key: "ContextFailedDetails")]
        getter context_failed_details : Types::ContextFailedDetails?

        # Details about a context that started.
        @[JSON::Field(key: "ContextStartedDetails")]
        getter context_started_details : Types::ContextStartedDetails?

        # Details about a context that succeeded.
        @[JSON::Field(key: "ContextSucceededDetails")]
        getter context_succeeded_details : Types::ContextSucceededDetails?

        # The unique identifier for this event. Event IDs increment sequentially.
        @[JSON::Field(key: "EventId")]
        getter event_id : Int32?

        # The date and time when this event occurred, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "EventTimestamp")]
        getter event_timestamp : Time?

        # The type of event that occurred.
        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        # Details about an execution that failed.
        @[JSON::Field(key: "ExecutionFailedDetails")]
        getter execution_failed_details : Types::ExecutionFailedDetails?

        # Details about an execution that started.
        @[JSON::Field(key: "ExecutionStartedDetails")]
        getter execution_started_details : Types::ExecutionStartedDetails?

        # Details about an execution that was stopped.
        @[JSON::Field(key: "ExecutionStoppedDetails")]
        getter execution_stopped_details : Types::ExecutionStoppedDetails?

        # Details about an execution that succeeded.
        @[JSON::Field(key: "ExecutionSucceededDetails")]
        getter execution_succeeded_details : Types::ExecutionSucceededDetails?

        # Details about an execution that timed out.
        @[JSON::Field(key: "ExecutionTimedOutDetails")]
        getter execution_timed_out_details : Types::ExecutionTimedOutDetails?

        # The unique identifier for this operation.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Details about a function invocation that completed.
        @[JSON::Field(key: "InvocationCompletedDetails")]
        getter invocation_completed_details : Types::InvocationCompletedDetails?

        # The customer-provided name for this operation.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the parent operation, if this operation is running within a child context.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # Details about a step that failed.
        @[JSON::Field(key: "StepFailedDetails")]
        getter step_failed_details : Types::StepFailedDetails?

        # Details about a step that started.
        @[JSON::Field(key: "StepStartedDetails")]
        getter step_started_details : Types::StepStartedDetails?

        # Details about a step that succeeded.
        @[JSON::Field(key: "StepSucceededDetails")]
        getter step_succeeded_details : Types::StepSucceededDetails?

        # The subtype of the event, providing additional categorization.
        @[JSON::Field(key: "SubType")]
        getter sub_type : String?

        # Details about a wait operation that was cancelled.
        @[JSON::Field(key: "WaitCancelledDetails")]
        getter wait_cancelled_details : Types::WaitCancelledDetails?

        # Details about a wait operation that started.
        @[JSON::Field(key: "WaitStartedDetails")]
        getter wait_started_details : Types::WaitStartedDetails?

        # Details about a wait operation that succeeded.
        @[JSON::Field(key: "WaitSucceededDetails")]
        getter wait_succeeded_details : Types::WaitSucceededDetails?

        def initialize(
          @callback_failed_details : Types::CallbackFailedDetails? = nil,
          @callback_started_details : Types::CallbackStartedDetails? = nil,
          @callback_succeeded_details : Types::CallbackSucceededDetails? = nil,
          @callback_timed_out_details : Types::CallbackTimedOutDetails? = nil,
          @chained_invoke_failed_details : Types::ChainedInvokeFailedDetails? = nil,
          @chained_invoke_started_details : Types::ChainedInvokeStartedDetails? = nil,
          @chained_invoke_stopped_details : Types::ChainedInvokeStoppedDetails? = nil,
          @chained_invoke_succeeded_details : Types::ChainedInvokeSucceededDetails? = nil,
          @chained_invoke_timed_out_details : Types::ChainedInvokeTimedOutDetails? = nil,
          @context_failed_details : Types::ContextFailedDetails? = nil,
          @context_started_details : Types::ContextStartedDetails? = nil,
          @context_succeeded_details : Types::ContextSucceededDetails? = nil,
          @event_id : Int32? = nil,
          @event_timestamp : Time? = nil,
          @event_type : String? = nil,
          @execution_failed_details : Types::ExecutionFailedDetails? = nil,
          @execution_started_details : Types::ExecutionStartedDetails? = nil,
          @execution_stopped_details : Types::ExecutionStoppedDetails? = nil,
          @execution_succeeded_details : Types::ExecutionSucceededDetails? = nil,
          @execution_timed_out_details : Types::ExecutionTimedOutDetails? = nil,
          @id : String? = nil,
          @invocation_completed_details : Types::InvocationCompletedDetails? = nil,
          @name : String? = nil,
          @parent_id : String? = nil,
          @step_failed_details : Types::StepFailedDetails? = nil,
          @step_started_details : Types::StepStartedDetails? = nil,
          @step_succeeded_details : Types::StepSucceededDetails? = nil,
          @sub_type : String? = nil,
          @wait_cancelled_details : Types::WaitCancelledDetails? = nil,
          @wait_started_details : Types::WaitStartedDetails? = nil,
          @wait_succeeded_details : Types::WaitSucceededDetails? = nil
        )
        end
      end

      # Error information for an event.
      struct EventError
        include JSON::Serializable

        # The error payload.
        @[JSON::Field(key: "Payload")]
        getter payload : Types::ErrorObject?

        # Indicates if the error payload was truncated due to size limits.
        @[JSON::Field(key: "Truncated")]
        getter truncated : Bool?

        def initialize(
          @payload : Types::ErrorObject? = nil,
          @truncated : Bool? = nil
        )
        end
      end

      # Input information for an event.
      struct EventInput
        include JSON::Serializable

        # The input payload.
        @[JSON::Field(key: "Payload")]
        getter payload : String?

        # Indicates if the error payload was truncated due to size limits.
        @[JSON::Field(key: "Truncated")]
        getter truncated : Bool?

        def initialize(
          @payload : String? = nil,
          @truncated : Bool? = nil
        )
        end
      end

      # Result information for an event.
      struct EventResult
        include JSON::Serializable

        # The result payload.
        @[JSON::Field(key: "Payload")]
        getter payload : String?

        # Indicates if the error payload was truncated due to size limits.
        @[JSON::Field(key: "Truncated")]
        getter truncated : Bool?

        def initialize(
          @payload : String? = nil,
          @truncated : Bool? = nil
        )
        end
      end

      # A mapping between an Amazon Web Services resource and a Lambda function. For details, see
      # CreateEventSourceMapping .
      struct EventSourceMappingConfiguration
        include JSON::Serializable

        # Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK) event
        # source.
        @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
        getter amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig?

        # The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to
        # your function. Lambda passes all of the records in the batch to the function in a single call, up to
        # the payload limit for synchronous invocation (6 MB). Default value: Varies by service. For Amazon
        # SQS, the default is 10. For all other services, the default is 100. Related setting: When you set
        # BatchSize to a value greater than 10, you must set MaximumBatchingWindowInSeconds to at least 1.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If the function returns an
        # error, split the batch in two and retry. The default value is false.
        @[JSON::Field(key: "BisectBatchOnFunctionError")]
        getter bisect_batch_on_function_error : Bool?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A configuration object that
        # specifies the destination of an event after Lambda processes it.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # Specific configuration settings for a DocumentDB event source.
        @[JSON::Field(key: "DocumentDBEventSourceConfig")]
        getter document_db_event_source_config : Types::DocumentDBEventSourceConfig?

        # The Amazon Resource Name (ARN) of the event source.
        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The Amazon Resource Name (ARN) of the event source mapping.
        @[JSON::Field(key: "EventSourceMappingArn")]
        getter event_source_mapping_arn : String?

        # An object that defines the filter criteria that determine whether Lambda should process an event.
        # For more information, see Lambda event filtering . If filter criteria is encrypted, this field shows
        # up as null in the response of ListEventSourceMapping API calls. You can view this field in plaintext
        # in the response of GetEventSourceMapping and DeleteEventSourceMapping calls if you have kms:Decrypt
        # permissions for the correct KMS key.
        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # An object that contains details about an error related to filter criteria encryption.
        @[JSON::Field(key: "FilterCriteriaError")]
        getter filter_criteria_error : Types::FilterCriteriaError?

        # The ARN of the Lambda function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and Amazon SQS) A list of current
        # response type enums applied to the event source mapping.
        @[JSON::Field(key: "FunctionResponseTypes")]
        getter function_response_types : Array(String)?

        # The ARN of the Key Management Service (KMS) customer managed key that Lambda uses to encrypt your
        # function's filter criteria .
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # The date that the event source mapping was last updated or that its state changed.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The result of the event source mapping's last processing attempt.
        @[JSON::Field(key: "LastProcessingResult")]
        getter last_processing_result : String?

        # The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the
        # function. You can configure MaximumBatchingWindowInSeconds to any value from 0 seconds to 300
        # seconds in increments of seconds. For streams and Amazon SQS event sources, the default batching
        # window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event
        # sources, the default batching window is 500 ms. Note that because you can only change
        # MaximumBatchingWindowInSeconds in increments of seconds, you cannot revert back to the 500 ms
        # default batching window after you have changed it. To restore the default batching window, you must
        # create a new event source mapping. Related setting: For streams and Amazon SQS event sources, when
        # you set BatchSize to a value greater than 10, you must set MaximumBatchingWindowInSeconds to at
        # least 1.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records older than
        # the specified age. The default value is -1, which sets the maximum age to infinite. When the value
        # is set to infinite, Lambda never discards old records. The minimum valid value for maximum record
        # age is 60s. Although values less than 60 and greater than -1 fall within the parameter's absolute
        # range, they are not allowed
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records after the
        # specified number of retries. The default value is -1, which sets the maximum number of retries to
        # infinite. When MaximumRetryAttempts is infinite, Lambda retries failed records until the record
        # expires in the event source.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # The metrics configuration for your event source. For more information, see Event source mapping
        # metrics .
        @[JSON::Field(key: "MetricsConfig")]
        getter metrics_config : Types::EventSourceMappingMetricsConfig?

        # (Kinesis and DynamoDB Streams only) The number of batches to process concurrently from each shard.
        # The default value is 1.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        # (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned mode configuration for
        # the event source. For more information, see provisioned mode .
        @[JSON::Field(key: "ProvisionedPollerConfig")]
        getter provisioned_poller_config : Types::ProvisionedPollerConfig?

        # (Amazon MQ) The name of the Amazon MQ broker destination queue to consume.
        @[JSON::Field(key: "Queues")]
        getter queues : Array(String)?

        # (Amazon SQS only) The scaling configuration for the event source. For more information, see
        # Configuring maximum concurrency for Amazon SQS event sources .
        @[JSON::Field(key: "ScalingConfig")]
        getter scaling_config : Types::ScalingConfig?

        # The self-managed Apache Kafka cluster for your event source.
        @[JSON::Field(key: "SelfManagedEventSource")]
        getter self_managed_event_source : Types::SelfManagedEventSource?

        # Specific configuration settings for a self-managed Apache Kafka event source.
        @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
        getter self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig?

        # An array of the authentication protocol, VPC components, or virtual host to secure and define your
        # event source.
        @[JSON::Field(key: "SourceAccessConfigurations")]
        getter source_access_configurations : Array(Types::SourceAccessConfiguration)?

        # The position in a stream from which to start reading. Required for Amazon Kinesis and Amazon
        # DynamoDB Stream event sources. AT_TIMESTAMP is supported only for Amazon Kinesis streams, Amazon
        # DocumentDB, Amazon MSK, and self-managed Apache Kafka.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String?

        # With StartingPosition set to AT_TIMESTAMP , the time from which to start reading.
        # StartingPositionTimestamp cannot be in the future.
        @[JSON::Field(key: "StartingPositionTimestamp")]
        getter starting_position_timestamp : Time?

        # The state of the event source mapping. It can be one of the following: Creating , Enabling , Enabled
        # , Disabling , Disabled , Updating , or Deleting .
        @[JSON::Field(key: "State")]
        getter state : String?

        # Indicates whether a user or Lambda made the last change to the event source mapping.
        @[JSON::Field(key: "StateTransitionReason")]
        getter state_transition_reason : String?

        # The name of the Kafka topic.
        @[JSON::Field(key: "Topics")]
        getter topics : Array(String)?

        # (Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and
        # Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.
        @[JSON::Field(key: "TumblingWindowInSeconds")]
        getter tumbling_window_in_seconds : Int32?

        # The identifier of the event source mapping.
        @[JSON::Field(key: "UUID")]
        getter uuid : String?

        def initialize(
          @amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig? = nil,
          @batch_size : Int32? = nil,
          @bisect_batch_on_function_error : Bool? = nil,
          @destination_config : Types::DestinationConfig? = nil,
          @document_db_event_source_config : Types::DocumentDBEventSourceConfig? = nil,
          @event_source_arn : String? = nil,
          @event_source_mapping_arn : String? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @filter_criteria_error : Types::FilterCriteriaError? = nil,
          @function_arn : String? = nil,
          @function_response_types : Array(String)? = nil,
          @kms_key_arn : String? = nil,
          @last_modified : Time? = nil,
          @last_processing_result : String? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @metrics_config : Types::EventSourceMappingMetricsConfig? = nil,
          @parallelization_factor : Int32? = nil,
          @provisioned_poller_config : Types::ProvisionedPollerConfig? = nil,
          @queues : Array(String)? = nil,
          @scaling_config : Types::ScalingConfig? = nil,
          @self_managed_event_source : Types::SelfManagedEventSource? = nil,
          @self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig? = nil,
          @source_access_configurations : Array(Types::SourceAccessConfiguration)? = nil,
          @starting_position : String? = nil,
          @starting_position_timestamp : Time? = nil,
          @state : String? = nil,
          @state_transition_reason : String? = nil,
          @topics : Array(String)? = nil,
          @tumbling_window_in_seconds : Int32? = nil,
          @uuid : String? = nil
        )
        end
      end

      # The metrics configuration for your event source. Use this configuration object to define which
      # metrics you want your event source mapping to produce.
      struct EventSourceMappingMetricsConfig
        include JSON::Serializable

        # The metrics you want your event source mapping to produce. Include EventCount to receive event
        # source mapping metrics related to the number of events processed by your event source mapping. For
        # more information about these metrics, see Event source mapping metrics .
        @[JSON::Field(key: "Metrics")]
        getter metrics : Array(String)?

        def initialize(
          @metrics : Array(String)? = nil
        )
        end
      end

      # Information about a durable execution .
      struct Execution
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the durable execution, if this execution is a durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # The unique name of the durable execution, if one was provided when the execution was started.
        @[JSON::Field(key: "DurableExecutionName")]
        getter durable_execution_name : String

        # The Amazon Resource Name (ARN) of the Lambda function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The date and time when the durable execution started, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time

        # The current status of the durable execution.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The date and time when the durable execution ended, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        def initialize(
          @durable_execution_arn : String,
          @durable_execution_name : String,
          @function_arn : String,
          @start_timestamp : Time,
          @status : String,
          @end_timestamp : Time? = nil
        )
        end
      end

      # Details about a durable execution .
      struct ExecutionDetails
        include JSON::Serializable

        # The original input payload provided for the durable execution.
        @[JSON::Field(key: "InputPayload")]
        getter input_payload : String?

        def initialize(
          @input_payload : String? = nil
        )
        end
      end

      # Details about a failed durable execution .
      struct ExecutionFailedDetails
        include JSON::Serializable

        # Details about the execution failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Details about a durable execution that started.
      struct ExecutionStartedDetails
        include JSON::Serializable

        # The maximum amount of time that the durable execution is allowed to run, in seconds.
        @[JSON::Field(key: "ExecutionTimeout")]
        getter execution_timeout : Int32

        # The input payload provided for the durable execution.
        @[JSON::Field(key: "Input")]
        getter input : Types::EventInput

        def initialize(
          @execution_timeout : Int32,
          @input : Types::EventInput
        )
        end
      end

      # Details about a durable execution that stopped.
      struct ExecutionStoppedDetails
        include JSON::Serializable

        # Details about why the execution stopped.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        def initialize(
          @error : Types::EventError
        )
        end
      end

      # Details about a durable execution that succeeded.
      struct ExecutionSucceededDetails
        include JSON::Serializable

        # The response payload from the successful operation.
        @[JSON::Field(key: "Result")]
        getter result : Types::EventResult

        def initialize(
          @result : Types::EventResult
        )
        end
      end

      # Details about a durable execution that timed out.
      struct ExecutionTimedOutDetails
        include JSON::Serializable

        # Details about the execution timeout.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError?

        def initialize(
          @error : Types::EventError? = nil
        )
        end
      end

      # Details about the connection between a Lambda function and an Amazon EFS file system .
      struct FileSystemConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon EFS access point that provides access to the file
        # system.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The path where the function can access the file system, starting with /mnt/ .
        @[JSON::Field(key: "LocalMountPath")]
        getter local_mount_path : String

        def initialize(
          @arn : String,
          @local_mount_path : String
        )
        end
      end

      # A structure within a FilterCriteria object that defines an event filtering pattern.
      struct Filter
        include JSON::Serializable

        # A filter pattern. For more information on the syntax of a filter pattern, see Filter rule syntax .
        @[JSON::Field(key: "Pattern")]
        getter pattern : String?

        def initialize(
          @pattern : String? = nil
        )
        end
      end

      # An object that contains the filters for an event source.
      struct FilterCriteria
        include JSON::Serializable

        # A list of filters.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        def initialize(
          @filters : Array(Types::Filter)? = nil
        )
        end
      end

      # An object that contains details about an error related to filter criteria encryption.
      struct FilterCriteriaError
        include JSON::Serializable

        # The KMS exception that resulted from filter criteria encryption or decryption.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The code for the Lambda function. You can either specify an object in Amazon S3, upload a .zip file
      # archive deployment package directly, or specify the URI of a container image.
      struct FunctionCode
        include JSON::Serializable

        # URI of a container image in the Amazon ECR registry.
        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String?

        # An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a
        # different Amazon Web Services account.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key of the deployment package.
        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        # For versioned objects, the version of the deployment package object to use.
        @[JSON::Field(key: "S3ObjectVersion")]
        getter s3_object_version : String?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
        # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
        # Amazon Web Services owned key .
        @[JSON::Field(key: "SourceKMSKeyArn")]
        getter source_kms_key_arn : String?

        # The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients
        # handle the encoding for you.
        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @image_uri : String? = nil,
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_object_version : String? = nil,
          @source_kms_key_arn : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end

      # Details about a function's deployment package.
      struct FunctionCodeLocation
        include JSON::Serializable

        # URI of a container image in the Amazon ECR registry.
        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String?

        # A presigned URL that you can use to download the deployment package.
        @[JSON::Field(key: "Location")]
        getter location : String?

        # The service that's hosting the file.
        @[JSON::Field(key: "RepositoryType")]
        getter repository_type : String?

        # The resolved URI for the image.
        @[JSON::Field(key: "ResolvedImageUri")]
        getter resolved_image_uri : String?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
        # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
        # Amazon Web Services owned key .
        @[JSON::Field(key: "SourceKMSKeyArn")]
        getter source_kms_key_arn : String?

        def initialize(
          @image_uri : String? = nil,
          @location : String? = nil,
          @repository_type : String? = nil,
          @resolved_image_uri : String? = nil,
          @source_kms_key_arn : String? = nil
        )
        end
      end

      # Details about a function's configuration.
      struct FunctionConfiguration
        include JSON::Serializable

        # The instruction set architecture that the function supports. Architecture is a string array with one
        # of the valid values. The default architecture value is x86_64 .
        @[JSON::Field(key: "Architectures")]
        getter architectures : Array(String)?

        # Configuration for the capacity provider that manages compute resources for Lambda functions.
        @[JSON::Field(key: "CapacityProviderConfig")]
        getter capacity_provider_config : Types::CapacityProviderConfig?

        # The SHA256 hash of the function's deployment package.
        @[JSON::Field(key: "CodeSha256")]
        getter code_sha256 : String?

        # The size of the function's deployment package, in bytes.
        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # The SHA256 hash of the function configuration.
        @[JSON::Field(key: "ConfigSha256")]
        getter config_sha256 : String?

        # The function's dead letter queue.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The function's description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The function's durable execution configuration settings, if the function is configured for
        # durability.
        @[JSON::Field(key: "DurableConfig")]
        getter durable_config : Types::DurableConfig?

        # The function's environment variables . Omitted from CloudTrail logs.
        @[JSON::Field(key: "Environment")]
        getter environment : Types::EnvironmentResponse?

        # The size of the function's /tmp directory in MB. The default value is 512, but can be any whole
        # number between 512 and 10,240 MB. For more information, see Configuring ephemeral storage (console)
        # .
        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # Connection settings for an Amazon EFS file system .
        @[JSON::Field(key: "FileSystemConfigs")]
        getter file_system_configs : Array(Types::FileSystemConfig)?

        # The function's Amazon Resource Name (ARN).
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The name of the function.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String?

        # The function that Lambda calls to begin running your function.
        @[JSON::Field(key: "Handler")]
        getter handler : String?

        # The function's image configuration values.
        @[JSON::Field(key: "ImageConfigResponse")]
        getter image_config_response : Types::ImageConfigResponse?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt the
        # following resources: The function's environment variables . The function's Lambda SnapStart
        # snapshots. When used with SourceKMSKeyArn , the unzipped version of the .zip deployment package
        # that's used for function invocations. For more information, see Specifying a customer managed key
        # for Lambda . The optimized version of the container image that's used for function invocations. Note
        # that this is not the same key that's used to protect your container image in the Amazon Elastic
        # Container Registry (Amazon ECR). For more information, see Function lifecycle . If you don't provide
        # a customer managed key, Lambda uses an Amazon Web Services owned key or an Amazon Web Services
        # managed key .
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # The date and time that the function was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The status of the last update that was performed on the function. This is first set to Successful
        # after function creation completes.
        @[JSON::Field(key: "LastUpdateStatus")]
        getter last_update_status : String?

        # The reason for the last update that was performed on the function.
        @[JSON::Field(key: "LastUpdateStatusReason")]
        getter last_update_status_reason : String?

        # The reason code for the last update that was performed on the function.
        @[JSON::Field(key: "LastUpdateStatusReasonCode")]
        getter last_update_status_reason_code : String?

        # The function's layers .
        @[JSON::Field(key: "Layers")]
        getter layers : Array(Types::Layer)?

        # The function's Amazon CloudWatch Logs configuration settings.
        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # For Lambda@Edge functions, the ARN of the main function.
        @[JSON::Field(key: "MasterArn")]
        getter master_arn : String?

        # The amount of memory available to the function at runtime.
        @[JSON::Field(key: "MemorySize")]
        getter memory_size : Int32?

        # The type of deployment package. Set to Image for container image and set Zip for .zip file archive.
        @[JSON::Field(key: "PackageType")]
        getter package_type : String?

        # The latest updated revision of the function or alias.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The function's execution role.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # The identifier of the function's runtime . Runtime is required if the deployment package is a .zip
        # file archive. Specifying a runtime results in an error if you're deploying a function using a
        # container image. The following list includes deprecated runtimes. Lambda blocks creating new
        # functions and updating existing functions shortly after each runtime is deprecated. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "Runtime")]
        getter runtime : String?

        # The ARN of the runtime and any errors that occured.
        @[JSON::Field(key: "RuntimeVersionConfig")]
        getter runtime_version_config : Types::RuntimeVersionConfig?

        # The ARN of the signing job.
        @[JSON::Field(key: "SigningJobArn")]
        getter signing_job_arn : String?

        # The ARN of the signing profile version.
        @[JSON::Field(key: "SigningProfileVersionArn")]
        getter signing_profile_version_arn : String?

        # Set ApplyOn to PublishedVersions to create a snapshot of the initialized execution environment when
        # you publish a function version. For more information, see Improving startup performance with Lambda
        # SnapStart .
        @[JSON::Field(key: "SnapStart")]
        getter snap_start : Types::SnapStartResponse?

        # The current state of the function. When the state is Inactive , you can reactivate the function by
        # invoking it.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the function's current state.
        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The reason code for the function's current state. When the code is Creating , you can't invoke or
        # modify the function.
        @[JSON::Field(key: "StateReasonCode")]
        getter state_reason_code : String?

        # The function's tenant isolation configuration settings. Determines whether the Lambda function runs
        # on a shared or dedicated infrastructure per unique tenant.
        @[JSON::Field(key: "TenancyConfig")]
        getter tenancy_config : Types::TenancyConfig?

        # The amount of time in seconds that Lambda allows a function to run before stopping it.
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # The function's X-Ray tracing configuration.
        @[JSON::Field(key: "TracingConfig")]
        getter tracing_config : Types::TracingConfigResponse?

        # The version of the Lambda function.
        @[JSON::Field(key: "Version")]
        getter version : String?

        # The function's networking configuration.
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfigResponse?

        def initialize(
          @architectures : Array(String)? = nil,
          @capacity_provider_config : Types::CapacityProviderConfig? = nil,
          @code_sha256 : String? = nil,
          @code_size : Int64? = nil,
          @config_sha256 : String? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @durable_config : Types::DurableConfig? = nil,
          @environment : Types::EnvironmentResponse? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @file_system_configs : Array(Types::FileSystemConfig)? = nil,
          @function_arn : String? = nil,
          @function_name : String? = nil,
          @handler : String? = nil,
          @image_config_response : Types::ImageConfigResponse? = nil,
          @kms_key_arn : String? = nil,
          @last_modified : String? = nil,
          @last_update_status : String? = nil,
          @last_update_status_reason : String? = nil,
          @last_update_status_reason_code : String? = nil,
          @layers : Array(Types::Layer)? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @master_arn : String? = nil,
          @memory_size : Int32? = nil,
          @package_type : String? = nil,
          @revision_id : String? = nil,
          @role : String? = nil,
          @runtime : String? = nil,
          @runtime_version_config : Types::RuntimeVersionConfig? = nil,
          @signing_job_arn : String? = nil,
          @signing_profile_version_arn : String? = nil,
          @snap_start : Types::SnapStartResponse? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @state_reason_code : String? = nil,
          @tenancy_config : Types::TenancyConfig? = nil,
          @timeout : Int32? = nil,
          @tracing_config : Types::TracingConfigResponse? = nil,
          @version : String? = nil,
          @vpc_config : Types::VpcConfigResponse? = nil
        )
        end
      end

      struct FunctionEventInvokeConfig
        include JSON::Serializable

        # A destination for events after they have been sent to a function for processing. Destinations
        # Function - The Amazon Resource Name (ARN) of a Lambda function. Queue - The ARN of a standard SQS
        # queue. Bucket - The ARN of an Amazon S3 bucket. Topic - The ARN of a standard SNS topic. Event Bus -
        # The ARN of an Amazon EventBridge event bus. S3 buckets are supported only for on-failure
        # destinations. To retain records of successful invocations, use another destination type.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # The Amazon Resource Name (ARN) of the function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The date and time that the configuration was last updated.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The maximum age of a request that Lambda sends to a function for processing.
        @[JSON::Field(key: "MaximumEventAgeInSeconds")]
        getter maximum_event_age_in_seconds : Int32?

        # The maximum number of times to retry when the function returns an error.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        def initialize(
          @destination_config : Types::DestinationConfig? = nil,
          @function_arn : String? = nil,
          @last_modified : Time? = nil,
          @maximum_event_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil
        )
        end
      end

      # Configuration that defines the scaling behavior for a Lambda Managed Instances function, including
      # the minimum and maximum number of execution environments that can be provisioned.
      struct FunctionScalingConfig
        include JSON::Serializable

        # The maximum number of execution environments that can be provisioned for the function.
        @[JSON::Field(key: "MaxExecutionEnvironments")]
        getter max_execution_environments : Int32?

        # The minimum number of execution environments to maintain for the function.
        @[JSON::Field(key: "MinExecutionEnvironments")]
        getter min_execution_environments : Int32?

        def initialize(
          @max_execution_environments : Int32? = nil,
          @min_execution_environments : Int32? = nil
        )
        end
      end

      # Details about a Lambda function URL.
      struct FunctionUrlConfig
        include JSON::Serializable

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Security and auth model for Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # When the function URL was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String

        # The Amazon Resource Name (ARN) of your function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The HTTP URL endpoint for your function.
        @[JSON::Field(key: "FunctionUrl")]
        getter function_url : String

        # When the function URL configuration was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : String

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        def initialize(
          @auth_type : String,
          @creation_time : String,
          @function_arn : String,
          @function_url : String,
          @last_modified_time : String,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil
        )
        end
      end

      # Information about a function version that uses a specific capacity provider, including its ARN and
      # current state.
      struct FunctionVersionsByCapacityProviderListItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function version.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The current state of the function version.
        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @function_arn : String,
          @state : String
        )
        end
      end

      # The maximum number of function versions that can be associated with a single capacity provider has
      # been exceeded. For more information, see Lambda quotas .
      struct FunctionVersionsPerCapacityProviderLimitExceededException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
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

        # Limits that are related to concurrency and code storage.
        @[JSON::Field(key: "AccountLimit")]
        getter account_limit : Types::AccountLimit?

        # The number of functions and amount of storage in use.
        @[JSON::Field(key: "AccountUsage")]
        getter account_usage : Types::AccountUsage?

        def initialize(
          @account_limit : Types::AccountLimit? = nil,
          @account_usage : Types::AccountUsage? = nil
        )
        end
      end

      struct GetAliasRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @function_name : String,
          @name : String
        )
        end
      end

      struct GetCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider to retrieve.
        @[JSON::Field(key: "CapacityProviderName")]
        getter capacity_provider_name : String

        def initialize(
          @capacity_provider_name : String
        )
        end
      end

      struct GetCapacityProviderResponse
        include JSON::Serializable

        # Information about the capacity provider, including its configuration and current state.
        @[JSON::Field(key: "CapacityProvider")]
        getter capacity_provider : Types::CapacityProvider

        def initialize(
          @capacity_provider : Types::CapacityProvider
        )
        end
      end

      struct GetCodeSigningConfigRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        def initialize(
          @code_signing_config_arn : String
        )
        end
      end

      struct GetCodeSigningConfigResponse
        include JSON::Serializable

        # The code signing configuration
        @[JSON::Field(key: "CodeSigningConfig")]
        getter code_signing_config : Types::CodeSigningConfig

        def initialize(
          @code_signing_config : Types::CodeSigningConfig
        )
        end
      end

      struct GetDurableExecutionHistoryRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # Specifies whether to include execution data such as step results and callback payloads in the
        # history events. Set to true to include data, or false to exclude it for a more compact response. The
        # default is true .
        @[JSON::Field(key: "IncludeExecutionData")]
        getter include_execution_data : Bool?

        # If NextMarker was returned from a previous request, use this value to retrieve the next page of
        # results. Each pagination token expires after 24 hours.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of history events to return per call. You can use Marker to retrieve additional
        # pages of results. The default is 100 and the maximum allowed is 1000. A value of 0 uses the default.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # When set to true , returns the history events in reverse chronological order (newest first). By
        # default, events are returned in chronological order (oldest first).
        @[JSON::Field(key: "ReverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @durable_execution_arn : String,
          @include_execution_data : Bool? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      # The response from the GetDurableExecutionHistory operation, containing the execution history and
      # events.
      struct GetDurableExecutionHistoryResponse
        include JSON::Serializable

        # An array of execution history events, ordered chronologically unless ReverseOrder is set to true .
        # Each event represents a significant occurrence during the execution, such as step completion or
        # callback resolution.
        @[JSON::Field(key: "Events")]
        getter events : Array(Types::Event)

        # If present, indicates that more history events are available. Use this value as the Marker parameter
        # in a subsequent request to retrieve the next page of results.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @events : Array(Types::Event),
          @next_marker : String? = nil
        )
        end
      end

      struct GetDurableExecutionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        def initialize(
          @durable_execution_arn : String
        )
        end
      end

      # The response from the GetDurableExecution operation, containing detailed information about the
      # durable execution.
      struct GetDurableExecutionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # The name of the durable execution. This is either the name you provided when invoking the function,
        # or a system-generated unique identifier if no name was provided.
        @[JSON::Field(key: "DurableExecutionName")]
        getter durable_execution_name : String

        # The Amazon Resource Name (ARN) of the Lambda function that was invoked to start this durable
        # execution.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The date and time when the durable execution started, in Unix timestamp format.
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time

        # The current status of the durable execution. Valid values are RUNNING , SUCCEEDED , FAILED ,
        # TIMED_OUT , and STOPPED .
        @[JSON::Field(key: "Status")]
        getter status : String

        # The date and time when the durable execution ended, in Unix timestamp format. This field is only
        # present if the execution has completed (status is SUCCEEDED , FAILED , TIMED_OUT , or STOPPED ).
        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # Error information if the durable execution failed. This field is only present when the execution
        # status is FAILED , TIMED_OUT , or STOPPED . The combined size of all error fields is limited to 256
        # KB.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # The JSON input payload that was provided when the durable execution was started. For asynchronous
        # invocations, this is limited to 256 KB. For synchronous invocations, this can be up to 6 MB.
        @[JSON::Field(key: "InputPayload")]
        getter input_payload : String?

        # The JSON result returned by the durable execution if it completed successfully. This field is only
        # present when the execution status is SUCCEEDED . The result is limited to 256 KB.
        @[JSON::Field(key: "Result")]
        getter result : String?

        # The trace headers associated with the durable execution.
        @[JSON::Field(key: "TraceHeader")]
        getter trace_header : Types::TraceHeader?

        # The version of the Lambda function that was invoked for this durable execution. This ensures that
        # all replays during the execution use the same function version.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @durable_execution_arn : String,
          @durable_execution_name : String,
          @function_arn : String,
          @start_timestamp : Time,
          @status : String,
          @end_timestamp : Time? = nil,
          @error : Types::ErrorObject? = nil,
          @input_payload : String? = nil,
          @result : String? = nil,
          @trace_header : Types::TraceHeader? = nil,
          @version : String? = nil
        )
        end
      end

      struct GetDurableExecutionStateRequest
        include JSON::Serializable

        # A checkpoint token that identifies the current state of the execution. This token is provided by the
        # Lambda runtime and ensures that state retrieval is consistent with the current execution context.
        @[JSON::Field(key: "CheckpointToken")]
        getter checkpoint_token : String

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # If NextMarker was returned from a previous request, use this value to retrieve the next page of
        # operations. Each pagination token expires after 24 hours.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of operations to return per call. You can use Marker to retrieve additional pages
        # of results. The default is 100 and the maximum allowed is 1000. A value of 0 uses the default.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @checkpoint_token : String,
          @durable_execution_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # The response from the GetDurableExecutionState operation, containing the current execution state for
      # replay.
      struct GetDurableExecutionStateResponse
        include JSON::Serializable

        # An array of operations that represent the current state of the durable execution. Operations are
        # ordered by their start sequence number in ascending order and include information needed for replay
        # processing.
        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::Operation)

        # If present, indicates that more operations are available. Use this value as the Marker parameter in
        # a subsequent request to retrieve the next page of results.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @operations : Array(Types::Operation),
          @next_marker : String? = nil
        )
        end
      end

      struct GetEventSourceMappingRequest
        include JSON::Serializable

        # The identifier of the event source mapping.
        @[JSON::Field(key: "UUID")]
        getter uuid : String

        def initialize(
          @uuid : String
        )
        end
      end

      struct GetFunctionCodeSigningConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @function_name : String
        )
        end
      end

      struct GetFunctionCodeSigningConfigResponse
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @code_signing_config_arn : String,
          @function_name : String
        )
        end
      end

      struct GetFunctionConcurrencyRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @function_name : String
        )
        end
      end

      struct GetFunctionConcurrencyResponse
        include JSON::Serializable

        # The number of simultaneous executions that are reserved for the function.
        @[JSON::Field(key: "ReservedConcurrentExecutions")]
        getter reserved_concurrent_executions : Int32?

        def initialize(
          @reserved_concurrent_executions : Int32? = nil
        )
        end
      end

      struct GetFunctionConfigurationRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version or alias to get details about a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetFunctionEventInvokeConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name - my-function
        # (name-only), my-function:v1 (with alias). Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN -
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # A version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetFunctionRecursionConfigRequest
        include JSON::Serializable

        # The name of the function.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @function_name : String
        )
        end
      end

      struct GetFunctionRecursionConfigResponse
        include JSON::Serializable

        # If your function's recursive loop detection configuration is Allow , Lambda doesn't take any action
        # when it detects your function being invoked as part of a recursive loop. If your function's
        # recursive loop detection configuration is Terminate , Lambda stops your function being invoked and
        # notifies you when it detects your function being invoked as part of a recursive loop. By default,
        # Lambda sets your function's configuration to Terminate . You can update this configuration using the
        # PutFunctionRecursionConfig action.
        @[JSON::Field(key: "RecursiveLoop")]
        getter recursive_loop : String?

        def initialize(
          @recursive_loop : String? = nil
        )
        end
      end

      struct GetFunctionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version or alias to get details about a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetFunctionResponse
        include JSON::Serializable

        # The deployment package of the function or version.
        @[JSON::Field(key: "Code")]
        getter code : Types::FunctionCodeLocation?

        # The function's reserved concurrency .
        @[JSON::Field(key: "Concurrency")]
        getter concurrency : Types::Concurrency?

        # The configuration of the function or version.
        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::FunctionConfiguration?

        # The function's tags . Lambda returns tag data only if you have explicit allow permissions for
        # lambda:ListTags .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # An object that contains details about an error related to retrieving tags.
        @[JSON::Field(key: "TagsError")]
        getter tags_error : Types::TagsError?

        def initialize(
          @code : Types::FunctionCodeLocation? = nil,
          @concurrency : Types::Concurrency? = nil,
          @configuration : Types::FunctionConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @tags_error : Types::TagsError? = nil
        )
        end
      end

      struct GetFunctionScalingConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version or alias to get the scaling configuration for a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String

        def initialize(
          @function_name : String,
          @qualifier : String
        )
        end
      end

      struct GetFunctionScalingConfigResponse
        include JSON::Serializable

        # The scaling configuration that is currently applied to the function. This represents the actual
        # scaling settings in effect.
        @[JSON::Field(key: "AppliedFunctionScalingConfig")]
        getter applied_function_scaling_config : Types::FunctionScalingConfig?

        # The Amazon Resource Name (ARN) of the function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The scaling configuration that was requested for the function.
        @[JSON::Field(key: "RequestedFunctionScalingConfig")]
        getter requested_function_scaling_config : Types::FunctionScalingConfig?

        def initialize(
          @applied_function_scaling_config : Types::FunctionScalingConfig? = nil,
          @function_arn : String? = nil,
          @requested_function_scaling_config : Types::FunctionScalingConfig? = nil
        )
        end
      end

      struct GetFunctionUrlConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetFunctionUrlConfigResponse
        include JSON::Serializable

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # When the function URL was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String

        # The Amazon Resource Name (ARN) of your function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The HTTP URL endpoint for your function.
        @[JSON::Field(key: "FunctionUrl")]
        getter function_url : String

        # When the function URL configuration was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : String

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        def initialize(
          @auth_type : String,
          @creation_time : String,
          @function_arn : String,
          @function_url : String,
          @last_modified_time : String,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil
        )
        end
      end

      struct GetLayerVersionByArnRequest
        include JSON::Serializable

        # The ARN of the layer version.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetLayerVersionPolicyRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # The version number.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @layer_name : String,
          @version_number : Int64
        )
        end
      end

      struct GetLayerVersionPolicyResponse
        include JSON::Serializable

        # The policy document.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # A unique identifier for the current revision of the policy.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct GetLayerVersionRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # The version number.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        def initialize(
          @layer_name : String,
          @version_number : Int64
        )
        end
      end

      struct GetLayerVersionResponse
        include JSON::Serializable

        # A list of compatible instruction set architectures .
        @[JSON::Field(key: "CompatibleArchitectures")]
        getter compatible_architectures : Array(String)?

        # The layer's compatible runtimes. The following list includes deprecated runtimes. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "CompatibleRuntimes")]
        getter compatible_runtimes : Array(String)?

        # Details about the layer version.
        @[JSON::Field(key: "Content")]
        getter content : Types::LayerVersionContentOutput?

        # The date that the layer version was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # The description of the version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the layer.
        @[JSON::Field(key: "LayerArn")]
        getter layer_arn : String?

        # The ARN of the layer version.
        @[JSON::Field(key: "LayerVersionArn")]
        getter layer_version_arn : String?

        # The layer's software license.
        @[JSON::Field(key: "LicenseInfo")]
        getter license_info : String?

        # The version number.
        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @compatible_architectures : Array(String)? = nil,
          @compatible_runtimes : Array(String)? = nil,
          @content : Types::LayerVersionContentOutput? = nil,
          @created_date : String? = nil,
          @description : String? = nil,
          @layer_arn : String? = nil,
          @layer_version_arn : String? = nil,
          @license_info : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct GetPolicyRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version or alias to get the policy for that resource.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetPolicyResponse
        include JSON::Serializable

        # The resource-based policy.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # A unique identifier for the current revision of the policy.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct GetProvisionedConcurrencyConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String

        def initialize(
          @function_name : String,
          @qualifier : String
        )
        end
      end

      struct GetProvisionedConcurrencyConfigResponse
        include JSON::Serializable

        # The amount of provisioned concurrency allocated. When a weighted alias is used during linear and
        # canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned
        # for the function versions.
        @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
        getter allocated_provisioned_concurrent_executions : Int32?

        # The amount of provisioned concurrency available.
        @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
        getter available_provisioned_concurrent_executions : Int32?

        # The date and time that a user last updated the configuration, in ISO 8601 format .
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The amount of provisioned concurrency requested.
        @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
        getter requested_provisioned_concurrent_executions : Int32?

        # The status of the allocation process.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # For failed allocations, the reason that provisioned concurrency could not be allocated.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @allocated_provisioned_concurrent_executions : Int32? = nil,
          @available_provisioned_concurrent_executions : Int32? = nil,
          @last_modified : String? = nil,
          @requested_provisioned_concurrent_executions : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      struct GetRuntimeManagementConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version of the function. This can be $LATEST or a published version number. If no value is
        # specified, the configuration for the $LATEST version is returned.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @qualifier : String? = nil
        )
        end
      end

      struct GetRuntimeManagementConfigResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of your function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The ARN of the runtime the function is configured to use. If the runtime update mode is Manual , the
        # ARN is returned, otherwise null is returned.
        @[JSON::Field(key: "RuntimeVersionArn")]
        getter runtime_version_arn : String?

        # The current runtime update mode of the function.
        @[JSON::Field(key: "UpdateRuntimeOn")]
        getter update_runtime_on : String?

        def initialize(
          @function_arn : String? = nil,
          @runtime_version_arn : String? = nil,
          @update_runtime_on : String? = nil
        )
        end
      end

      # Configuration values that override the container image Dockerfile settings. For more information,
      # see Container image settings .
      struct ImageConfig
        include JSON::Serializable

        # Specifies parameters that you want to pass in with ENTRYPOINT.
        @[JSON::Field(key: "Command")]
        getter command : Array(String)?

        # Specifies the entry point to their application, which is typically the location of the runtime
        # executable.
        @[JSON::Field(key: "EntryPoint")]
        getter entry_point : Array(String)?

        # Specifies the working directory.
        @[JSON::Field(key: "WorkingDirectory")]
        getter working_directory : String?

        def initialize(
          @command : Array(String)? = nil,
          @entry_point : Array(String)? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # Error response to GetFunctionConfiguration .
      struct ImageConfigError
        include JSON::Serializable

        # Error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Response to a GetFunctionConfiguration request.
      struct ImageConfigResponse
        include JSON::Serializable

        # Error response to GetFunctionConfiguration .
        @[JSON::Field(key: "Error")]
        getter error : Types::ImageConfigError?

        # Configuration values that override the container image Dockerfile.
        @[JSON::Field(key: "ImageConfig")]
        getter image_config : Types::ImageConfig?

        def initialize(
          @error : Types::ImageConfigError? = nil,
          @image_config : Types::ImageConfig? = nil
        )
        end
      end

      # Specifications that define the characteristics and constraints for compute instances used by the
      # capacity provider.
      struct InstanceRequirements
        include JSON::Serializable

        # A list of EC2 instance types that the capacity provider is allowed to use. If not specified, all
        # compatible instance types are allowed.
        @[JSON::Field(key: "AllowedInstanceTypes")]
        getter allowed_instance_types : Array(String)?

        # A list of supported CPU architectures for compute instances. Valid values include x86_64 and arm64 .
        @[JSON::Field(key: "Architectures")]
        getter architectures : Array(String)?

        # A list of EC2 instance types that the capacity provider should not use, even if they meet other
        # requirements.
        @[JSON::Field(key: "ExcludedInstanceTypes")]
        getter excluded_instance_types : Array(String)?

        def initialize(
          @allowed_instance_types : Array(String)? = nil,
          @architectures : Array(String)? = nil,
          @excluded_instance_types : Array(String)? = nil
        )
        end
      end

      # The code signature failed the integrity check. If the integrity check fails, then Lambda blocks
      # deployment, even if the code signing policy is set to WARN.
      struct InvalidCodeSignatureException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # One of the parameters in the request is not valid.
      struct InvalidParameterValueException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The request body could not be parsed as JSON, or a request header is invalid. For example, the
      # 'x-amzn-RequestId' header is not a valid UUID string.
      struct InvalidRequestContentException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The runtime or runtime version specified is not supported.
      struct InvalidRuntimeException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The security group ID provided in the Lambda function VPC configuration is not valid.
      struct InvalidSecurityGroupIDException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The subnet ID provided in the Lambda function VPC configuration is not valid.
      struct InvalidSubnetIDException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda could not unzip the deployment package.
      struct InvalidZipFileException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details about a function invocation that completed.
      struct InvocationCompletedDetails
        include JSON::Serializable

        # The date and time when the invocation ended, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time

        # The request ID for the invocation.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String

        # The date and time when the invocation started, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time

        # Details about the invocation failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError?

        def initialize(
          @end_timestamp : Time,
          @request_id : String,
          @start_timestamp : Time,
          @error : Types::EventError? = nil
        )
        end
      end

      struct InvocationRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in the
        # context object. Lambda passes the ClientContext object to your function for synchronous invocations
        # only.
        @[JSON::Field(key: "X-Amz-Client-Context")]
        getter client_context : String?

        # Optional unique name for the durable execution. When you start your special function, you can give
        # it a unique name to identify this specific execution. It's like giving a nickname to a task.
        @[JSON::Field(key: "X-Amz-Durable-Execution-Name")]
        getter durable_execution_name : String?

        # Choose from the following options. RequestResponse (default) – Invoke the function synchronously.
        # Keep the connection open until the function returns a response or times out. The API response
        # includes the function response and additional data. Event – Invoke the function asynchronously. Send
        # events that fail multiple times to the function's dead-letter queue (if one is configured). The API
        # response only includes a status code. DryRun – Validate parameter values and verify that the user or
        # role has permission to invoke the function.
        @[JSON::Field(key: "X-Amz-Invocation-Type")]
        getter invocation_type : String?

        # Set to Tail to include the execution log in the response. Applies to synchronously invoked functions
        # only.
        @[JSON::Field(key: "X-Amz-Log-Type")]
        getter log_type : String?

        # The JSON that you want to provide to your Lambda function as input. The maximum payload size is 6 MB
        # for synchronous invocations and 1 MB for asynchronous invocations. You can enter the JSON directly.
        # For example, --payload '{ "key": "value" }' . You can also specify a file path. For example,
        # --payload file://payload.json .
        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        # Specify a version or alias to invoke a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # The identifier of the tenant in a multi-tenant Lambda function.
        @[JSON::Field(key: "X-Amz-Tenant-Id")]
        getter tenant_id : String?

        def initialize(
          @function_name : String,
          @client_context : String? = nil,
          @durable_execution_name : String? = nil,
          @invocation_type : String? = nil,
          @log_type : String? = nil,
          @payload : Bytes? = nil,
          @qualifier : String? = nil,
          @tenant_id : String? = nil
        )
        end
      end

      struct InvocationResponse
        include JSON::Serializable

        # The ARN of the durable execution that was started. This is returned when invoking a durable function
        # and provides a unique identifier for tracking the execution.
        @[JSON::Field(key: "X-Amz-Durable-Execution-Arn")]
        getter durable_execution_arn : String?

        # The version of the function that executed. When you invoke a function with an alias, this indicates
        # which version the alias resolved to.
        @[JSON::Field(key: "X-Amz-Executed-Version")]
        getter executed_version : String?

        # If present, indicates that an error occurred during function execution. Details about the error are
        # included in the response payload.
        @[JSON::Field(key: "X-Amz-Function-Error")]
        getter function_error : String?

        # The last 4 KB of the execution log, which is base64-encoded.
        @[JSON::Field(key: "X-Amz-Log-Result")]
        getter log_result : String?

        # The response from the function, or an error object.
        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        # The HTTP status code is in the 200 range for a successful request. For the RequestResponse
        # invocation type, this status code is 200. For the Event invocation type, this status code is 202.
        # For the DryRun invocation type, the status code is 204.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @durable_execution_arn : String? = nil,
          @executed_version : String? = nil,
          @function_error : String? = nil,
          @log_result : String? = nil,
          @payload : Bytes? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      struct InvokeAsyncRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The JSON that you want to provide to your Lambda function as input.
        @[JSON::Field(key: "InvokeArgs")]
        getter invoke_args : Bytes

        def initialize(
          @function_name : String,
          @invoke_args : Bytes
        )
        end
      end

      # A success response ( 202 Accepted ) indicates that the request is queued for invocation.
      struct InvokeAsyncResponse
        include JSON::Serializable

        # The status code.
        @[JSON::Field(key: "Status")]
        getter status : Int32?

        def initialize(
          @status : Int32? = nil
        )
        end
      end

      # A chunk of the streamed response payload.
      struct InvokeResponseStreamUpdate
        include JSON::Serializable

        # Data returned by your Lambda function.
        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end

      # A response confirming that the event stream is complete.
      struct InvokeWithResponseStreamCompleteEvent
        include JSON::Serializable

        # An error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The details of any returned error.
        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : String?

        # The last 4 KB of the execution log, which is base64-encoded.
        @[JSON::Field(key: "LogResult")]
        getter log_result : String?

        def initialize(
          @error_code : String? = nil,
          @error_details : String? = nil,
          @log_result : String? = nil
        )
        end
      end

      struct InvokeWithResponseStreamRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in the
        # context object.
        @[JSON::Field(key: "X-Amz-Client-Context")]
        getter client_context : String?

        # Use one of the following options: RequestResponse (default) – Invoke the function synchronously.
        # Keep the connection open until the function returns a response or times out. The API operation
        # response includes the function response and additional data. DryRun – Validate parameter values and
        # verify that the IAM user or role has permission to invoke the function.
        @[JSON::Field(key: "X-Amz-Invocation-Type")]
        getter invocation_type : String?

        # Set to Tail to include the execution log in the response. Applies to synchronously invoked functions
        # only.
        @[JSON::Field(key: "X-Amz-Log-Type")]
        getter log_type : String?

        # The JSON that you want to provide to your Lambda function as input. You can enter the JSON directly.
        # For example, --payload '{ "key": "value" }' . You can also specify a file path. For example,
        # --payload file://payload.json .
        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        # The alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # The identifier of the tenant in a multi-tenant Lambda function.
        @[JSON::Field(key: "X-Amz-Tenant-Id")]
        getter tenant_id : String?

        def initialize(
          @function_name : String,
          @client_context : String? = nil,
          @invocation_type : String? = nil,
          @log_type : String? = nil,
          @payload : Bytes? = nil,
          @qualifier : String? = nil,
          @tenant_id : String? = nil
        )
        end
      end

      struct InvokeWithResponseStreamResponse
        include JSON::Serializable

        # The stream of response payloads.
        @[JSON::Field(key: "EventStream")]
        getter event_stream : Types::InvokeWithResponseStreamResponseEvent?

        # The version of the function that executed. When you invoke a function with an alias, this indicates
        # which version the alias resolved to.
        @[JSON::Field(key: "X-Amz-Executed-Version")]
        getter executed_version : String?

        # The type of data the stream is returning.
        @[JSON::Field(key: "Content-Type")]
        getter response_stream_content_type : String?

        # For a successful request, the HTTP status code is in the 200 range. For the RequestResponse
        # invocation type, this status code is 200. For the DryRun invocation type, this status code is 204.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @event_stream : Types::InvokeWithResponseStreamResponseEvent? = nil,
          @executed_version : String? = nil,
          @response_stream_content_type : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      # An object that includes a chunk of the response payload. When the stream has ended, Lambda includes
      # a InvokeComplete object.
      struct InvokeWithResponseStreamResponseEvent
        include JSON::Serializable

        # An object that's returned when the stream has ended and all the payload chunks have been returned.
        @[JSON::Field(key: "InvokeComplete")]
        getter invoke_complete : Types::InvokeWithResponseStreamCompleteEvent?

        # A chunk of the streamed response payload.
        @[JSON::Field(key: "PayloadChunk")]
        getter payload_chunk : Types::InvokeResponseStreamUpdate?

        def initialize(
          @invoke_complete : Types::InvokeWithResponseStreamCompleteEvent? = nil,
          @payload_chunk : Types::InvokeResponseStreamUpdate? = nil
        )
        end
      end

      # Lambda couldn't decrypt the environment variables because KMS access was denied. Check the Lambda
      # function's KMS permissions.
      struct KMSAccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda couldn't decrypt the environment variables because the KMS key used is disabled. Check the
      # Lambda function's KMS key settings.
      struct KMSDisabledException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda couldn't decrypt the environment variables because the state of the KMS key used is not valid
      # for Decrypt. Check the function's KMS key settings.
      struct KMSInvalidStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda couldn't decrypt the environment variables because the KMS key was not found. Check the
      # function's KMS key settings.
      struct KMSNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specific access configuration settings that tell Lambda how to authenticate with your schema
      # registry. If you're working with an Glue schema registry, don't provide authentication details in
      # this object. Instead, ensure that your execution role has the required permissions for Lambda to
      # access your cluster. If you're working with a Confluent schema registry, choose the authentication
      # method in the Type field, and provide the Secrets Manager secret ARN in the URI field.
      struct KafkaSchemaRegistryAccessConfig
        include JSON::Serializable

        # The type of authentication Lambda uses to access your schema registry.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The URI of the secret (Secrets Manager secret ARN) to authenticate with your schema registry.
        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @type : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # Specific configuration settings for a Kafka schema registry.
      struct KafkaSchemaRegistryConfig
        include JSON::Serializable

        # An array of access configuration objects that tell Lambda how to authenticate with your schema
        # registry.
        @[JSON::Field(key: "AccessConfigs")]
        getter access_configs : Array(Types::KafkaSchemaRegistryAccessConfig)?

        # The record format that Lambda delivers to your function after schema validation. Choose JSON to have
        # Lambda deliver the record to your function as a standard JSON object. Choose SOURCE to have Lambda
        # deliver the record to your function in its original source format. Lambda removes all schema
        # metadata, such as the schema ID, before sending the record to your function.
        @[JSON::Field(key: "EventRecordFormat")]
        getter event_record_format : String?

        # The URI for your schema registry. The correct URI format depends on the type of schema registry
        # you're using. For Glue schema registries, use the ARN of the registry. For Confluent schema
        # registries, use the URL of the registry.
        @[JSON::Field(key: "SchemaRegistryURI")]
        getter schema_registry_uri : String?

        # An array of schema validation configuration objects, which tell Lambda the message attributes you
        # want to validate and filter using your schema registry.
        @[JSON::Field(key: "SchemaValidationConfigs")]
        getter schema_validation_configs : Array(Types::KafkaSchemaValidationConfig)?

        def initialize(
          @access_configs : Array(Types::KafkaSchemaRegistryAccessConfig)? = nil,
          @event_record_format : String? = nil,
          @schema_registry_uri : String? = nil,
          @schema_validation_configs : Array(Types::KafkaSchemaValidationConfig)? = nil
        )
        end
      end

      # Specific schema validation configuration settings that tell Lambda the message attributes you want
      # to validate and filter using your schema registry.
      struct KafkaSchemaValidationConfig
        include JSON::Serializable

        # The attributes you want your schema registry to validate and filter for. If you selected JSON as the
        # EventRecordFormat , Lambda also deserializes the selected message attributes.
        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        def initialize(
          @attribute : String? = nil
        )
        end
      end

      # Configuration for Lambda-managed instances used by the capacity provider.
      struct LambdaManagedInstancesCapacityProviderConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the capacity provider.
        @[JSON::Field(key: "CapacityProviderArn")]
        getter capacity_provider_arn : String

        # The amount of memory in GiB allocated per vCPU for execution environments.
        @[JSON::Field(key: "ExecutionEnvironmentMemoryGiBPerVCpu")]
        getter execution_environment_memory_gi_b_per_v_cpu : Float64?

        # The maximum number of concurrent execution environments that can run on each compute instance.
        @[JSON::Field(key: "PerExecutionEnvironmentMaxConcurrency")]
        getter per_execution_environment_max_concurrency : Int32?

        def initialize(
          @capacity_provider_arn : String,
          @execution_environment_memory_gi_b_per_v_cpu : Float64? = nil,
          @per_execution_environment_max_concurrency : Int32? = nil
        )
        end
      end

      # An Lambda layer .
      struct Layer
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the function layer.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The size of the layer archive in bytes.
        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # The Amazon Resource Name (ARN) of a signing job.
        @[JSON::Field(key: "SigningJobArn")]
        getter signing_job_arn : String?

        # The Amazon Resource Name (ARN) for a signing profile version.
        @[JSON::Field(key: "SigningProfileVersionArn")]
        getter signing_profile_version_arn : String?

        def initialize(
          @arn : String? = nil,
          @code_size : Int64? = nil,
          @signing_job_arn : String? = nil,
          @signing_profile_version_arn : String? = nil
        )
        end
      end

      # A ZIP archive that contains the contents of an Lambda layer . You can specify either an Amazon S3
      # location, or upload a layer archive directly.
      struct LayerVersionContentInput
        include JSON::Serializable

        # The Amazon S3 bucket of the layer archive.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key of the layer archive.
        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        # For versioned objects, the version of the layer archive object to use.
        @[JSON::Field(key: "S3ObjectVersion")]
        getter s3_object_version : String?

        # The base64-encoded contents of the layer archive. Amazon Web Services SDK and Amazon Web Services
        # CLI clients handle the encoding for you.
        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_object_version : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end

      # Details about a version of an Lambda layer .
      struct LayerVersionContentOutput
        include JSON::Serializable

        # The SHA-256 hash of the layer archive.
        @[JSON::Field(key: "CodeSha256")]
        getter code_sha256 : String?

        # The size of the layer archive in bytes.
        @[JSON::Field(key: "CodeSize")]
        getter code_size : Int64?

        # A link to the layer archive in Amazon S3 that is valid for 10 minutes.
        @[JSON::Field(key: "Location")]
        getter location : String?

        # The Amazon Resource Name (ARN) of a signing job.
        @[JSON::Field(key: "SigningJobArn")]
        getter signing_job_arn : String?

        # The Amazon Resource Name (ARN) for a signing profile version.
        @[JSON::Field(key: "SigningProfileVersionArn")]
        getter signing_profile_version_arn : String?

        def initialize(
          @code_sha256 : String? = nil,
          @code_size : Int64? = nil,
          @location : String? = nil,
          @signing_job_arn : String? = nil,
          @signing_profile_version_arn : String? = nil
        )
        end
      end

      # Details about a version of an Lambda layer .
      struct LayerVersionsListItem
        include JSON::Serializable

        # A list of compatible instruction set architectures .
        @[JSON::Field(key: "CompatibleArchitectures")]
        getter compatible_architectures : Array(String)?

        # The layer's compatible runtimes. The following list includes deprecated runtimes. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "CompatibleRuntimes")]
        getter compatible_runtimes : Array(String)?

        # The date that the version was created, in ISO 8601 format. For example, 2018-11-27T15:10:45.123+0000
        # .
        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # The description of the version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the layer version.
        @[JSON::Field(key: "LayerVersionArn")]
        getter layer_version_arn : String?

        # The layer's open-source license.
        @[JSON::Field(key: "LicenseInfo")]
        getter license_info : String?

        # The version number.
        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @compatible_architectures : Array(String)? = nil,
          @compatible_runtimes : Array(String)? = nil,
          @created_date : String? = nil,
          @description : String? = nil,
          @layer_version_arn : String? = nil,
          @license_info : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # Details about an Lambda layer .
      struct LayersListItem
        include JSON::Serializable

        # The newest version of the layer.
        @[JSON::Field(key: "LatestMatchingVersion")]
        getter latest_matching_version : Types::LayerVersionsListItem?

        # The Amazon Resource Name (ARN) of the function layer.
        @[JSON::Field(key: "LayerArn")]
        getter layer_arn : String?

        # The name of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String?

        def initialize(
          @latest_matching_version : Types::LayerVersionsListItem? = nil,
          @layer_arn : String? = nil,
          @layer_name : String? = nil
        )
        end
      end

      struct ListAliasesRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a function version to only list aliases that invoke that version.
        @[JSON::Field(key: "FunctionVersion")]
        getter function_version : String?

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Limit the number of aliases returned.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_name : String,
          @function_version : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListAliasesResponse
        include JSON::Serializable

        # A list of aliases.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::AliasConfiguration)?

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @aliases : Array(Types::AliasConfiguration)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListCapacityProvidersRequest
        include JSON::Serializable

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of capacity providers to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # Filter capacity providers by their current state.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListCapacityProvidersResponse
        include JSON::Serializable

        # A list of capacity providers in your account.
        @[JSON::Field(key: "CapacityProviders")]
        getter capacity_providers : Array(Types::CapacityProvider)

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @capacity_providers : Array(Types::CapacityProvider),
          @next_marker : String? = nil
        )
        end
      end

      struct ListCodeSigningConfigsRequest
        include JSON::Serializable

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Maximum number of items to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListCodeSigningConfigsResponse
        include JSON::Serializable

        # The code signing configurations
        @[JSON::Field(key: "CodeSigningConfigs")]
        getter code_signing_configs : Array(Types::CodeSigningConfig)?

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @code_signing_configs : Array(Types::CodeSigningConfig)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListDurableExecutionsByFunctionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. You can specify a function name, a partial ARN, or a full
        # ARN.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Filter executions by name. Only executions with names that contain this string are returned.
        @[JSON::Field(key: "DurableExecutionName")]
        getter durable_execution_name : String?

        # Pagination token from a previous request to continue retrieving results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Maximum number of executions to return (1-1000). Default is 100.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The function version or alias. If not specified, lists executions for the $LATEST version.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # Set to true to return results in reverse chronological order (newest first). Default is false.
        @[JSON::Field(key: "ReverseOrder")]
        getter reverse_order : Bool?

        # Filter executions that started after this timestamp (ISO 8601 format).
        @[JSON::Field(key: "StartedAfter")]
        getter started_after : Time?

        # Filter executions that started before this timestamp (ISO 8601 format).
        @[JSON::Field(key: "StartedBefore")]
        getter started_before : Time?

        # Filter executions by status. Valid values: RUNNING, SUCCEEDED, FAILED, TIMED_OUT, STOPPED.
        @[JSON::Field(key: "Statuses")]
        getter statuses : Array(String)?

        def initialize(
          @function_name : String,
          @durable_execution_name : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @qualifier : String? = nil,
          @reverse_order : Bool? = nil,
          @started_after : Time? = nil,
          @started_before : Time? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end

      # The response from the ListDurableExecutionsByFunction operation, containing a list of durable
      # executions and pagination information.
      struct ListDurableExecutionsByFunctionResponse
        include JSON::Serializable

        # List of durable execution summaries matching the filter criteria.
        @[JSON::Field(key: "DurableExecutions")]
        getter durable_executions : Array(Types::Execution)?

        # Pagination token for retrieving additional results. Present only if there are more results
        # available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @durable_executions : Array(Types::Execution)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListEventSourceMappingsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event source. Amazon Kinesis – The ARN of the data stream or a
        # stream consumer. Amazon DynamoDB Streams – The ARN of the stream. Amazon Simple Queue Service – The
        # ARN of the queue. Amazon Managed Streaming for Apache Kafka – The ARN of the cluster or the ARN of
        # the VPC connection (for cross-account event source mappings ). Amazon MQ – The ARN of the broker.
        # Amazon DocumentDB – The ARN of the DocumentDB change stream.
        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The name or ARN of the Lambda function. Name formats Function name – MyFunction . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Version or Alias ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD . Partial ARN –
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it's limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String?

        # A pagination token returned by a previous call.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of event source mappings to return. Note that ListEventSourceMappings returns a
        # maximum of 100 items in each response, even if you set the number higher.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @event_source_arn : String? = nil,
          @function_name : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListEventSourceMappingsResponse
        include JSON::Serializable

        # A list of event source mappings.
        @[JSON::Field(key: "EventSourceMappings")]
        getter event_source_mappings : Array(Types::EventSourceMappingConfiguration)?

        # A pagination token that's returned when the response doesn't contain all event source mappings.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @event_source_mappings : Array(Types::EventSourceMappingConfiguration)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListFunctionEventInvokeConfigsRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - my-function . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN -
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of configurations to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListFunctionEventInvokeConfigsResponse
        include JSON::Serializable

        # A list of configurations.
        @[JSON::Field(key: "FunctionEventInvokeConfigs")]
        getter function_event_invoke_configs : Array(Types::FunctionEventInvokeConfig)?

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @function_event_invoke_configs : Array(Types::FunctionEventInvokeConfig)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListFunctionUrlConfigsRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of function URLs to return in the response. Note that ListFunctionUrlConfigs
        # returns a maximum of 50 items in each response, even if you set the number higher.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListFunctionUrlConfigsResponse
        include JSON::Serializable

        # A list of function URL configurations.
        @[JSON::Field(key: "FunctionUrlConfigs")]
        getter function_url_configs : Array(Types::FunctionUrlConfig)

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @function_url_configs : Array(Types::FunctionUrlConfig),
          @next_marker : String? = nil
        )
        end
      end

      struct ListFunctionVersionsByCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider to list function versions for.
        @[JSON::Field(key: "CapacityProviderName")]
        getter capacity_provider_name : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of function versions to return in the response.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @capacity_provider_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListFunctionVersionsByCapacityProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the capacity provider.
        @[JSON::Field(key: "CapacityProviderArn")]
        getter capacity_provider_arn : String

        # A list of function versions that use the specified capacity provider.
        @[JSON::Field(key: "FunctionVersions")]
        getter function_versions : Array(Types::FunctionVersionsByCapacityProviderListItem)

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @capacity_provider_arn : String,
          @function_versions : Array(Types::FunctionVersionsByCapacityProviderListItem),
          @next_marker : String? = nil
        )
        end
      end

      struct ListFunctionsByCodeSigningConfigRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Maximum number of items to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @code_signing_config_arn : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListFunctionsByCodeSigningConfigResponse
        include JSON::Serializable

        # The function ARNs.
        @[JSON::Field(key: "FunctionArns")]
        getter function_arns : Array(String)?

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @function_arns : Array(String)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListFunctionsRequest
        include JSON::Serializable

        # Set to ALL to include entries for all published versions of each function.
        @[JSON::Field(key: "FunctionVersion")]
        getter function_version : String?

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # For Lambda@Edge functions, the Amazon Web Services Region of the master function. For example,
        # us-east-1 filters the list of functions to include only Lambda@Edge functions replicated from a
        # master function in US East (N. Virginia). If specified, you must set FunctionVersion to ALL .
        @[JSON::Field(key: "MasterRegion")]
        getter master_region : String?

        # The maximum number of functions to return in the response. Note that ListFunctions returns a maximum
        # of 50 items in each response, even if you set the number higher.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_version : String? = nil,
          @marker : String? = nil,
          @master_region : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      # A list of Lambda functions.
      struct ListFunctionsResponse
        include JSON::Serializable

        # A list of Lambda functions.
        @[JSON::Field(key: "Functions")]
        getter functions : Array(Types::FunctionConfiguration)?

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @functions : Array(Types::FunctionConfiguration)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListLayerVersionsRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # The compatible instruction set architecture .
        @[JSON::Field(key: "CompatibleArchitecture")]
        getter compatible_architecture : String?

        # A runtime identifier. The following list includes deprecated runtimes. For more information, see
        # Runtime use after deprecation . For a list of all currently supported runtimes, see Supported
        # runtimes .
        @[JSON::Field(key: "CompatibleRuntime")]
        getter compatible_runtime : String?

        # A pagination token returned by a previous call.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of versions to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @layer_name : String,
          @compatible_architecture : String? = nil,
          @compatible_runtime : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListLayerVersionsResponse
        include JSON::Serializable

        # A list of versions.
        @[JSON::Field(key: "LayerVersions")]
        getter layer_versions : Array(Types::LayerVersionsListItem)?

        # A pagination token returned when the response doesn't contain all versions.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @layer_versions : Array(Types::LayerVersionsListItem)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListLayersRequest
        include JSON::Serializable

        # The compatible instruction set architecture .
        @[JSON::Field(key: "CompatibleArchitecture")]
        getter compatible_architecture : String?

        # A runtime identifier. The following list includes deprecated runtimes. For more information, see
        # Runtime use after deprecation . For a list of all currently supported runtimes, see Supported
        # runtimes .
        @[JSON::Field(key: "CompatibleRuntime")]
        getter compatible_runtime : String?

        # A pagination token returned by a previous call.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of layers to return.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @compatible_architecture : String? = nil,
          @compatible_runtime : String? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListLayersResponse
        include JSON::Serializable

        # A list of function layers.
        @[JSON::Field(key: "Layers")]
        getter layers : Array(Types::LayersListItem)?

        # A pagination token returned when the response doesn't contain all layers.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @layers : Array(Types::LayersListItem)? = nil,
          @next_marker : String? = nil
        )
        end
      end

      struct ListProvisionedConcurrencyConfigsRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Specify a number to limit the number of configurations returned.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListProvisionedConcurrencyConfigsResponse
        include JSON::Serializable

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # A list of provisioned concurrency configurations.
        @[JSON::Field(key: "ProvisionedConcurrencyConfigs")]
        getter provisioned_concurrency_configs : Array(Types::ProvisionedConcurrencyConfigListItem)?

        def initialize(
          @next_marker : String? = nil,
          @provisioned_concurrency_configs : Array(Types::ProvisionedConcurrencyConfigListItem)? = nil
        )
        end
      end

      struct ListTagsRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN). Note: Lambda does not support adding tags to function
        # aliases or versions.
        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @resource : String
        )
        end
      end

      struct ListTagsResponse
        include JSON::Serializable

        # The function's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListVersionsByFunctionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify the pagination token that's returned by a previous request to retrieve the next page of
        # results.
        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The maximum number of versions to return. Note that ListVersionsByFunction returns a maximum of 50
        # items in each response, even if you set the number higher.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @function_name : String,
          @marker : String? = nil,
          @max_items : Int32? = nil
        )
        end
      end

      struct ListVersionsByFunctionResponse
        include JSON::Serializable

        # The pagination token that's included if more results are available.
        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # A list of Lambda function versions.
        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::FunctionConfiguration)?

        def initialize(
          @next_marker : String? = nil,
          @versions : Array(Types::FunctionConfiguration)? = nil
        )
        end
      end

      # The function's Amazon CloudWatch Logs configuration settings.
      struct LoggingConfig
        include JSON::Serializable

        # Set this property to filter the application logs for your function that Lambda sends to CloudWatch.
        # Lambda only sends application logs at the selected level of detail and lower, where TRACE is the
        # highest level and FATAL is the lowest.
        @[JSON::Field(key: "ApplicationLogLevel")]
        getter application_log_level : String?

        # The format in which Lambda sends your function's application and system logs to CloudWatch. Select
        # between plain text and structured JSON.
        @[JSON::Field(key: "LogFormat")]
        getter log_format : String?

        # The name of the Amazon CloudWatch log group the function sends logs to. By default, Lambda functions
        # send logs to a default log group named /aws/lambda/&lt;function name&gt; . To use a different log
        # group, enter an existing log group or enter a new log group name.
        @[JSON::Field(key: "LogGroup")]
        getter log_group : String?

        # Set this property to filter the system logs for your function that Lambda sends to CloudWatch.
        # Lambda only sends system logs at the selected level of detail and lower, where DEBUG is the highest
        # level and WARN is the lowest.
        @[JSON::Field(key: "SystemLogLevel")]
        getter system_log_level : String?

        def initialize(
          @application_log_level : String? = nil,
          @log_format : String? = nil,
          @log_group : String? = nil,
          @system_log_level : String? = nil
        )
        end
      end

      # The function has no published versions available.
      struct NoPublishedVersionException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A destination for events that failed processing. For more information, see Adding a destination .
      struct OnFailure
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination resource. To retain records of failed invocations
        # from Kinesis , DynamoDB , self-managed Apache Kafka , or Amazon MSK , you can configure an Amazon
        # SNS topic, Amazon SQS queue, Amazon S3 bucket, or Kafka topic as the destination. Amazon SNS
        # destinations have a message size limit of 256 KB. If the combined size of the function request and
        # response payload exceeds the limit, Lambda will drop the payload when sending OnFailure event to the
        # destination. For details on this behavior, refer to Retaining records of asynchronous invocations .
        # To retain records of failed invocations from Kinesis , DynamoDB , self-managed Kafka or Amazon MSK ,
        # you can configure an Amazon SNS topic, Amazon SQS queue, or Amazon S3 bucket as the destination.
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @destination : String? = nil
        )
        end
      end

      # A destination for events that were processed successfully. To retain records of successful
      # asynchronous invocations , you can configure an Amazon SNS topic, Amazon SQS queue, Lambda function,
      # or Amazon EventBridge event bus as the destination. OnSuccess is not supported in
      # CreateEventSourceMapping or UpdateEventSourceMapping requests.
      struct OnSuccess
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination resource. Amazon SNS destinations have a message
        # size limit of 256 KB. If the combined size of the function request and response payload exceeds the
        # limit, Lambda will drop the payload when sending OnFailure event to the destination. For details on
        # this behavior, refer to Retaining records of asynchronous invocations .
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        def initialize(
          @destination : String? = nil
        )
        end
      end

      # Information about an operation within a durable execution.
      struct Operation
        include JSON::Serializable

        # The unique identifier for this operation.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The date and time when the operation started, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time

        # The current status of the operation.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The type of operation.
        @[JSON::Field(key: "Type")]
        getter type : String

        @[JSON::Field(key: "CallbackDetails")]
        getter callback_details : Types::CallbackDetails?

        @[JSON::Field(key: "ChainedInvokeDetails")]
        getter chained_invoke_details : Types::ChainedInvokeDetails?

        # Details about the context, if this operation represents a context.
        @[JSON::Field(key: "ContextDetails")]
        getter context_details : Types::ContextDetails?

        # The date and time when the operation ended, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "EndTimestamp")]
        getter end_timestamp : Time?

        # Details about the execution, if this operation represents an execution.
        @[JSON::Field(key: "ExecutionDetails")]
        getter execution_details : Types::ExecutionDetails?

        # The customer-provided name for this operation.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the parent operation, if this operation is running within a child context.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # Details about the step, if this operation represents a step.
        @[JSON::Field(key: "StepDetails")]
        getter step_details : Types::StepDetails?

        # The subtype of the operation, providing additional categorization.
        @[JSON::Field(key: "SubType")]
        getter sub_type : String?

        # Details about the wait operation, if this operation represents a wait.
        @[JSON::Field(key: "WaitDetails")]
        getter wait_details : Types::WaitDetails?

        def initialize(
          @id : String,
          @start_timestamp : Time,
          @status : String,
          @type : String,
          @callback_details : Types::CallbackDetails? = nil,
          @chained_invoke_details : Types::ChainedInvokeDetails? = nil,
          @context_details : Types::ContextDetails? = nil,
          @end_timestamp : Time? = nil,
          @execution_details : Types::ExecutionDetails? = nil,
          @name : String? = nil,
          @parent_id : String? = nil,
          @step_details : Types::StepDetails? = nil,
          @sub_type : String? = nil,
          @wait_details : Types::WaitDetails? = nil
        )
        end
      end

      # An update to be applied to an operation during checkpointing.
      struct OperationUpdate
        include JSON::Serializable

        # The action to take on the operation.
        @[JSON::Field(key: "Action")]
        getter action : String

        # The unique identifier for this operation.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The type of operation to update.
        @[JSON::Field(key: "Type")]
        getter type : String

        @[JSON::Field(key: "CallbackOptions")]
        getter callback_options : Types::CallbackOptions?

        @[JSON::Field(key: "ChainedInvokeOptions")]
        getter chained_invoke_options : Types::ChainedInvokeOptions?

        # Options for context operations.
        @[JSON::Field(key: "ContextOptions")]
        getter context_options : Types::ContextOptions?

        # The error information for failed operations.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # The customer-provided name for this operation.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the parent operation, if this operation is running within a child context.
        @[JSON::Field(key: "ParentId")]
        getter parent_id : String?

        # The payload for successful operations.
        @[JSON::Field(key: "Payload")]
        getter payload : String?

        # Options for step operations.
        @[JSON::Field(key: "StepOptions")]
        getter step_options : Types::StepOptions?

        # The subtype of the operation, providing additional categorization.
        @[JSON::Field(key: "SubType")]
        getter sub_type : String?

        # Options for wait operations.
        @[JSON::Field(key: "WaitOptions")]
        getter wait_options : Types::WaitOptions?

        def initialize(
          @action : String,
          @id : String,
          @type : String,
          @callback_options : Types::CallbackOptions? = nil,
          @chained_invoke_options : Types::ChainedInvokeOptions? = nil,
          @context_options : Types::ContextOptions? = nil,
          @error : Types::ErrorObject? = nil,
          @name : String? = nil,
          @parent_id : String? = nil,
          @payload : String? = nil,
          @step_options : Types::StepOptions? = nil,
          @sub_type : String? = nil,
          @wait_options : Types::WaitOptions? = nil
        )
        end
      end

      # The permissions policy for the resource is too large. For more information, see Lambda quotas .
      struct PolicyLengthExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The RevisionId provided does not match the latest RevisionId for the Lambda function or alias. For
      # AddPermission and RemovePermission API operations: Call GetPolicy to retrieve the latest RevisionId
      # for your resource. For all other API operations: Call GetFunction or GetAlias to retrieve the latest
      # RevisionId for your resource.
      struct PreconditionFailedException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Details about the provisioned concurrency configuration for a function alias or version.
      struct ProvisionedConcurrencyConfigListItem
        include JSON::Serializable

        # The amount of provisioned concurrency allocated. When a weighted alias is used during linear and
        # canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned
        # for the function versions.
        @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
        getter allocated_provisioned_concurrent_executions : Int32?

        # The amount of provisioned concurrency available.
        @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
        getter available_provisioned_concurrent_executions : Int32?

        # The Amazon Resource Name (ARN) of the alias or version.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String?

        # The date and time that a user last updated the configuration, in ISO 8601 format .
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The amount of provisioned concurrency requested.
        @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
        getter requested_provisioned_concurrent_executions : Int32?

        # The status of the allocation process.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # For failed allocations, the reason that provisioned concurrency could not be allocated.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @allocated_provisioned_concurrent_executions : Int32? = nil,
          @available_provisioned_concurrent_executions : Int32? = nil,
          @function_arn : String? = nil,
          @last_modified : String? = nil,
          @requested_provisioned_concurrent_executions : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The specified configuration does not exist.
      struct ProvisionedConcurrencyConfigNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The provisioned mode configuration for the event source. Use Provisioned Mode to customize the
      # minimum and maximum number of event pollers for your event source.
      struct ProvisionedPollerConfig
        include JSON::Serializable

        # The maximum number of event pollers this event source can scale up to. For Amazon SQS events source
        # mappings, default is 200, and minimum value allowed is 2. For Amazon MSK and self-managed Apache
        # Kafka event source mappings, default is 200, and minimum value allowed is 1.
        @[JSON::Field(key: "MaximumPollers")]
        getter maximum_pollers : Int32?

        # The minimum number of event pollers this event source can scale down to. For Amazon SQS events
        # source mappings, default is 2, and minimum 2 required. For Amazon MSK and self-managed Apache Kafka
        # event source mappings, default is 1.
        @[JSON::Field(key: "MinimumPollers")]
        getter minimum_pollers : Int32?

        # (Amazon MSK and self-managed Apache Kafka) The name of the provisioned poller group. Use this option
        # to group multiple ESMs within the event source's VPC to share Event Poller Unit (EPU) capacity. You
        # can use this option to optimize Provisioned mode costs for your ESMs. You can group up to 100 ESMs
        # per poller group and aggregate maximum pollers across all ESMs in a group cannot exceed 2000.
        @[JSON::Field(key: "PollerGroupName")]
        getter poller_group_name : String?

        def initialize(
          @maximum_pollers : Int32? = nil,
          @minimum_pollers : Int32? = nil,
          @poller_group_name : String? = nil
        )
        end
      end

      struct PublishLayerVersionRequest
        include JSON::Serializable

        # The function layer archive.
        @[JSON::Field(key: "Content")]
        getter content : Types::LayerVersionContentInput

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # A list of compatible instruction set architectures .
        @[JSON::Field(key: "CompatibleArchitectures")]
        getter compatible_architectures : Array(String)?

        # A list of compatible function runtimes . Used for filtering with ListLayers and ListLayerVersions .
        # The following list includes deprecated runtimes. For more information, see Runtime deprecation
        # policy .
        @[JSON::Field(key: "CompatibleRuntimes")]
        getter compatible_runtimes : Array(String)?

        # The description of the version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The layer's software license. It can be any of the following: An SPDX license identifier . For
        # example, MIT . The URL of a license hosted on the internet. For example,
        # https://opensource.org/licenses/MIT . The full text of the license.
        @[JSON::Field(key: "LicenseInfo")]
        getter license_info : String?

        def initialize(
          @content : Types::LayerVersionContentInput,
          @layer_name : String,
          @compatible_architectures : Array(String)? = nil,
          @compatible_runtimes : Array(String)? = nil,
          @description : String? = nil,
          @license_info : String? = nil
        )
        end
      end

      struct PublishLayerVersionResponse
        include JSON::Serializable

        # A list of compatible instruction set architectures .
        @[JSON::Field(key: "CompatibleArchitectures")]
        getter compatible_architectures : Array(String)?

        # The layer's compatible runtimes. The following list includes deprecated runtimes. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "CompatibleRuntimes")]
        getter compatible_runtimes : Array(String)?

        # Details about the layer version.
        @[JSON::Field(key: "Content")]
        getter content : Types::LayerVersionContentOutput?

        # The date that the layer version was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # The description of the version.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the layer.
        @[JSON::Field(key: "LayerArn")]
        getter layer_arn : String?

        # The ARN of the layer version.
        @[JSON::Field(key: "LayerVersionArn")]
        getter layer_version_arn : String?

        # The layer's software license.
        @[JSON::Field(key: "LicenseInfo")]
        getter license_info : String?

        # The version number.
        @[JSON::Field(key: "Version")]
        getter version : Int64?

        def initialize(
          @compatible_architectures : Array(String)? = nil,
          @compatible_runtimes : Array(String)? = nil,
          @content : Types::LayerVersionContentOutput? = nil,
          @created_date : String? = nil,
          @description : String? = nil,
          @layer_arn : String? = nil,
          @layer_version_arn : String? = nil,
          @license_info : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      struct PublishVersionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Only publish a version if the hash value matches the value that's specified. Use this option to
        # avoid publishing a version if the function code has changed since you last updated it. You can get
        # the hash for the version that you uploaded from the output of UpdateFunctionCode .
        @[JSON::Field(key: "CodeSha256")]
        getter code_sha256 : String?

        # A description for the version to override the description in the function configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies where to publish the function version or configuration.
        @[JSON::Field(key: "PublishTo")]
        getter publish_to : String?

        # Only update the function if the revision ID matches the ID that's specified. Use this option to
        # avoid publishing a version if the function configuration has changed since you last updated it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @function_name : String,
          @code_sha256 : String? = nil,
          @description : String? = nil,
          @publish_to : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      struct PutFunctionCodeSigningConfigRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @code_signing_config_arn : String,
          @function_name : String
        )
        end
      end

      struct PutFunctionCodeSigningConfigResponse
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        def initialize(
          @code_signing_config_arn : String,
          @function_name : String
        )
        end
      end

      struct PutFunctionConcurrencyRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The number of simultaneous executions to reserve for the function.
        @[JSON::Field(key: "ReservedConcurrentExecutions")]
        getter reserved_concurrent_executions : Int32

        def initialize(
          @function_name : String,
          @reserved_concurrent_executions : Int32
        )
        end
      end

      struct PutFunctionEventInvokeConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name - my-function
        # (name-only), my-function:v1 (with alias). Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN -
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # A destination for events after they have been sent to a function for processing. Destinations
        # Function - The Amazon Resource Name (ARN) of a Lambda function. Queue - The ARN of a standard SQS
        # queue. Bucket - The ARN of an Amazon S3 bucket. Topic - The ARN of a standard SNS topic. Event Bus -
        # The ARN of an Amazon EventBridge event bus. S3 buckets are supported only for on-failure
        # destinations. To retain records of successful invocations, use another destination type.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # The maximum age of a request that Lambda sends to a function for processing.
        @[JSON::Field(key: "MaximumEventAgeInSeconds")]
        getter maximum_event_age_in_seconds : Int32?

        # The maximum number of times to retry when the function returns an error.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # A version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @destination_config : Types::DestinationConfig? = nil,
          @maximum_event_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @qualifier : String? = nil
        )
        end
      end

      struct PutFunctionRecursionConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # If you set your function's recursive loop detection configuration to Allow , Lambda doesn't take any
        # action when it detects your function being invoked as part of a recursive loop. We recommend that
        # you only use this setting if your design intentionally uses a Lambda function to write data back to
        # the same Amazon Web Services resource that invokes it. If you set your function's recursive loop
        # detection configuration to Terminate , Lambda stops your function being invoked and notifies you
        # when it detects your function being invoked as part of a recursive loop. By default, Lambda sets
        # your function's configuration to Terminate . If your design intentionally uses a Lambda function to
        # write data back to the same Amazon Web Services resource that invokes the function, then use caution
        # and implement suitable guard rails to prevent unexpected charges being billed to your Amazon Web
        # Services account. To learn more about best practices for using recursive invocation patterns, see
        # Recursive patterns that cause run-away Lambda functions in Serverless Land.
        @[JSON::Field(key: "RecursiveLoop")]
        getter recursive_loop : String

        def initialize(
          @function_name : String,
          @recursive_loop : String
        )
        end
      end

      struct PutFunctionRecursionConfigResponse
        include JSON::Serializable

        # The status of your function's recursive loop detection configuration. When this value is set to
        # Allow and Lambda detects your function being invoked as part of a recursive loop, it doesn't take
        # any action. When this value is set to Terminate and Lambda detects your function being invoked as
        # part of a recursive loop, it stops your function being invoked and notifies you.
        @[JSON::Field(key: "RecursiveLoop")]
        getter recursive_loop : String?

        def initialize(
          @recursive_loop : String? = nil
        )
        end
      end

      struct PutFunctionScalingConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify a version or alias to set the scaling configuration for a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String

        # The scaling configuration to apply to the function, including minimum and maximum execution
        # environment limits.
        @[JSON::Field(key: "FunctionScalingConfig")]
        getter function_scaling_config : Types::FunctionScalingConfig?

        def initialize(
          @function_name : String,
          @qualifier : String,
          @function_scaling_config : Types::FunctionScalingConfig? = nil
        )
        end
      end

      struct PutFunctionScalingConfigResponse
        include JSON::Serializable

        # The current state of the function after applying the scaling configuration.
        @[JSON::Field(key: "FunctionState")]
        getter function_state : String?

        def initialize(
          @function_state : String? = nil
        )
        end
      end

      struct PutProvisionedConcurrencyConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The amount of provisioned concurrency to allocate for the version or alias.
        @[JSON::Field(key: "ProvisionedConcurrentExecutions")]
        getter provisioned_concurrent_executions : Int32

        # The version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String

        def initialize(
          @function_name : String,
          @provisioned_concurrent_executions : Int32,
          @qualifier : String
        )
        end
      end

      struct PutProvisionedConcurrencyConfigResponse
        include JSON::Serializable

        # The amount of provisioned concurrency allocated. When a weighted alias is used during linear and
        # canary deployments, this value fluctuates depending on the amount of concurrency that is provisioned
        # for the function versions.
        @[JSON::Field(key: "AllocatedProvisionedConcurrentExecutions")]
        getter allocated_provisioned_concurrent_executions : Int32?

        # The amount of provisioned concurrency available.
        @[JSON::Field(key: "AvailableProvisionedConcurrentExecutions")]
        getter available_provisioned_concurrent_executions : Int32?

        # The date and time that a user last updated the configuration, in ISO 8601 format .
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The amount of provisioned concurrency requested.
        @[JSON::Field(key: "RequestedProvisionedConcurrentExecutions")]
        getter requested_provisioned_concurrent_executions : Int32?

        # The status of the allocation process.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # For failed allocations, the reason that provisioned concurrency could not be allocated.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @allocated_provisioned_concurrent_executions : Int32? = nil,
          @available_provisioned_concurrent_executions : Int32? = nil,
          @last_modified : String? = nil,
          @requested_provisioned_concurrent_executions : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      struct PutRuntimeManagementConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Specify the runtime update mode. Auto (default) - Automatically update to the most recent and secure
        # runtime version using a Two-phase runtime version rollout . This is the best choice for most
        # customers to ensure they always benefit from runtime updates. Function update - Lambda updates the
        # runtime of your function to the most recent and secure runtime version when you update your
        # function. This approach synchronizes runtime updates with function deployments, giving you control
        # over when runtime updates are applied and allowing you to detect and mitigate rare runtime update
        # incompatibilities early. When using this setting, you need to regularly update your functions to
        # keep their runtime up-to-date. Manual - You specify a runtime version in your function
        # configuration. The function will use this runtime version indefinitely. In the rare case where a new
        # runtime version is incompatible with an existing function, this allows you to roll back your
        # function to an earlier runtime version. For more information, see Roll back a runtime version .
        @[JSON::Field(key: "UpdateRuntimeOn")]
        getter update_runtime_on : String

        # Specify a version of the function. This can be $LATEST or a published version number. If no value is
        # specified, the configuration for the $LATEST version is returned.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # The ARN of the runtime version you want the function to use. This is only required if you're using
        # the Manual runtime update mode.
        @[JSON::Field(key: "RuntimeVersionArn")]
        getter runtime_version_arn : String?

        def initialize(
          @function_name : String,
          @update_runtime_on : String,
          @qualifier : String? = nil,
          @runtime_version_arn : String? = nil
        )
        end
      end

      struct PutRuntimeManagementConfigResponse
        include JSON::Serializable

        # The ARN of the function
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The runtime update mode.
        @[JSON::Field(key: "UpdateRuntimeOn")]
        getter update_runtime_on : String

        # The ARN of the runtime the function is configured to use. If the runtime update mode is manual , the
        # ARN is returned, otherwise null is returned.
        @[JSON::Field(key: "RuntimeVersionArn")]
        getter runtime_version_arn : String?

        def initialize(
          @function_arn : String,
          @update_runtime_on : String,
          @runtime_version_arn : String? = nil
        )
        end
      end

      # Lambda has detected your function being invoked in a recursive loop with other Amazon Web Services
      # resources and stopped your function's invocation.
      struct RecursiveInvocationException
        include JSON::Serializable

        # The exception message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct RemoveLayerVersionPermissionRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the layer.
        @[JSON::Field(key: "LayerName")]
        getter layer_name : String

        # The identifier that was specified when the statement was added.
        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        # The version number.
        @[JSON::Field(key: "VersionNumber")]
        getter version_number : Int64

        # Only update the policy if the revision ID matches the ID specified. Use this option to avoid
        # modifying a policy that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @layer_name : String,
          @statement_id : String,
          @version_number : Int64,
          @revision_id : String? = nil
        )
        end
      end

      struct RemovePermissionRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name – my-function
        # (name-only), my-function:v1 (with alias). Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Statement ID of the permission to remove.
        @[JSON::Field(key: "StatementId")]
        getter statement_id : String

        # Specify a version or alias to remove permissions from a published version of the function.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        # Update the policy only if the revision ID matches the ID that's specified. Use this option to avoid
        # modifying a policy that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @function_name : String,
          @statement_id : String,
          @qualifier : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      # The request payload exceeded the Invoke request body JSON input quota. For more information, see
      # Lambda quotas .
      struct RequestTooLargeException
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The resource already exists, or another operation is in progress.
      struct ResourceConflictException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The operation conflicts with the resource's availability. For example, you tried to update an event
      # source mapping in the CREATING state, or you tried to delete an event source mapping currently
      # UPDATING.
      struct ResourceInUseException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The resource specified in the request does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The function is inactive and its VPC connection is no longer available. Wait for the VPC connection
      # to reestablish and try again.
      struct ResourceNotReadyException
        include JSON::Serializable

        # The exception type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The exception message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about retry attempts for an operation.
      struct RetryDetails
        include JSON::Serializable

        # The current attempt number for this operation.
        @[JSON::Field(key: "CurrentAttempt")]
        getter current_attempt : Int32?

        # The delay before the next retry attempt, in seconds.
        @[JSON::Field(key: "NextAttemptDelaySeconds")]
        getter next_attempt_delay_seconds : Int32?

        def initialize(
          @current_attempt : Int32? = nil,
          @next_attempt_delay_seconds : Int32? = nil
        )
        end
      end

      # The ARN of the runtime and any errors that occured.
      struct RuntimeVersionConfig
        include JSON::Serializable

        # Error response when Lambda is unable to retrieve the runtime version for a function.
        @[JSON::Field(key: "Error")]
        getter error : Types::RuntimeVersionError?

        # The ARN of the runtime version you want the function to use.
        @[JSON::Field(key: "RuntimeVersionArn")]
        getter runtime_version_arn : String?

        def initialize(
          @error : Types::RuntimeVersionError? = nil,
          @runtime_version_arn : String? = nil
        )
        end
      end

      # Any error returned when the runtime version information for the function could not be retrieved.
      struct RuntimeVersionError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # (Amazon SQS only) The scaling configuration for the event source. To remove the configuration, pass
      # an empty value.
      struct ScalingConfig
        include JSON::Serializable

        # Limits the number of concurrent instances that the Amazon SQS event source can invoke.
        @[JSON::Field(key: "MaximumConcurrency")]
        getter maximum_concurrency : Int32?

        def initialize(
          @maximum_concurrency : Int32? = nil
        )
        end
      end

      # The self-managed Apache Kafka cluster for your event source.
      struct SelfManagedEventSource
        include JSON::Serializable

        # The list of bootstrap servers for your Kafka brokers in the following format:
        # "KAFKA_BOOTSTRAP_SERVERS": ["abc.xyz.com:xxxx","abc2.xyz.com:xxxx"] .
        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Hash(String, Array(String))?

        def initialize(
          @endpoints : Hash(String, Array(String))? = nil
        )
        end
      end

      # Specific configuration settings for a self-managed Apache Kafka event source.
      struct SelfManagedKafkaEventSourceConfig
        include JSON::Serializable

        # The identifier for the Kafka consumer group to join. The consumer group ID must be unique among all
        # your Kafka event sources. After creating a Kafka event source mapping with the consumer group ID
        # specified, you cannot update this value. For more information, see Customizable consumer group ID .
        @[JSON::Field(key: "ConsumerGroupId")]
        getter consumer_group_id : String?

        # Specific configuration settings for a Kafka schema registry.
        @[JSON::Field(key: "SchemaRegistryConfig")]
        getter schema_registry_config : Types::KafkaSchemaRegistryConfig?

        def initialize(
          @consumer_group_id : String? = nil,
          @schema_registry_config : Types::KafkaSchemaRegistryConfig? = nil
        )
        end
      end

      struct SendDurableExecutionCallbackFailureRequest
        include JSON::Serializable

        # The unique identifier for the callback operation.
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String

        # Error details describing why the callback operation failed.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        def initialize(
          @callback_id : String,
          @error : Types::ErrorObject? = nil
        )
        end
      end

      struct SendDurableExecutionCallbackFailureResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct SendDurableExecutionCallbackHeartbeatRequest
        include JSON::Serializable

        # The unique identifier for the callback operation.
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String

        def initialize(
          @callback_id : String
        )
        end
      end

      struct SendDurableExecutionCallbackHeartbeatResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct SendDurableExecutionCallbackSuccessRequest
        include JSON::Serializable

        # The unique identifier for the callback operation.
        @[JSON::Field(key: "CallbackId")]
        getter callback_id : String

        # The result data from the successful callback operation. Maximum size is 256 KB.
        @[JSON::Field(key: "Result")]
        getter result : Bytes?

        def initialize(
          @callback_id : String,
          @result : Bytes? = nil
        )
        end
      end

      struct SendDurableExecutionCallbackSuccessResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request payload exceeded the maximum allowed size for serialized request entities.
      struct SerializedRequestEntityTooLargeException
        include JSON::Serializable

        # The error type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The Lambda service encountered an internal error.
      struct ServiceException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The function's Lambda SnapStart setting. Set ApplyOn to PublishedVersions to create a snapshot of
      # the initialized execution environment when you publish a function version.
      struct SnapStart
        include JSON::Serializable

        # Set to PublishedVersions to create a snapshot of the initialized execution environment when you
        # publish a function version.
        @[JSON::Field(key: "ApplyOn")]
        getter apply_on : String?

        def initialize(
          @apply_on : String? = nil
        )
        end
      end

      # The afterRestore() runtime hook encountered an error. For more information, check the Amazon
      # CloudWatch logs.
      struct SnapStartException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Lambda is initializing your function. You can invoke the function when the function state becomes
      # Active .
      struct SnapStartNotReadyException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The function's SnapStart setting.
      struct SnapStartResponse
        include JSON::Serializable

        # When set to PublishedVersions , Lambda creates a snapshot of the execution environment when you
        # publish a function version.
        @[JSON::Field(key: "ApplyOn")]
        getter apply_on : String?

        # When you provide a qualified Amazon Resource Name (ARN) , this response element indicates whether
        # SnapStart is activated for the specified function version.
        @[JSON::Field(key: "OptimizationStatus")]
        getter optimization_status : String?

        def initialize(
          @apply_on : String? = nil,
          @optimization_status : String? = nil
        )
        end
      end

      # Lambda couldn't restore the snapshot within the timeout limit.
      struct SnapStartTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # To secure and define access to your event source, you can specify the authentication protocol, VPC
      # components, or virtual host.
      struct SourceAccessConfiguration
        include JSON::Serializable

        # The type of authentication protocol, VPC components, or virtual host for your event source. For
        # example: "Type":"SASL_SCRAM_512_AUTH" . BASIC_AUTH – (Amazon MQ) The Secrets Manager secret that
        # stores your broker credentials. BASIC_AUTH – (Self-managed Apache Kafka) The Secrets Manager ARN of
        # your secret key used for SASL/PLAIN authentication of your Apache Kafka brokers. VPC_SUBNET –
        # (Self-managed Apache Kafka) The subnets associated with your VPC. Lambda connects to these subnets
        # to fetch data from your self-managed Apache Kafka cluster. VPC_SECURITY_GROUP – (Self-managed Apache
        # Kafka) The VPC security group used to manage access to your self-managed Apache Kafka brokers.
        # SASL_SCRAM_256_AUTH – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used
        # for SASL SCRAM-256 authentication of your self-managed Apache Kafka brokers. SASL_SCRAM_512_AUTH –
        # (Amazon MSK, Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for SASL
        # SCRAM-512 authentication of your self-managed Apache Kafka brokers. VIRTUAL_HOST –- (RabbitMQ) The
        # name of the virtual host in your RabbitMQ broker. Lambda uses this RabbitMQ host as the event
        # source. This property cannot be specified in an UpdateEventSourceMapping API call.
        # CLIENT_CERTIFICATE_TLS_AUTH – (Amazon MSK, self-managed Apache Kafka) The Secrets Manager ARN of
        # your secret key containing the certificate chain (X.509 PEM), private key (PKCS#8 PEM), and private
        # key password (optional) used for mutual TLS authentication of your MSK/Apache Kafka brokers.
        # SERVER_ROOT_CA_CERTIFICATE – (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key
        # containing the root CA certificate (X.509 PEM) used for TLS encryption of your Apache Kafka brokers.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The value for your chosen configuration in Type . For example: "URI":
        # "arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName" .
        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @type : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # Details about a step operation.
      struct StepDetails
        include JSON::Serializable

        # The current attempt number for this step.
        @[JSON::Field(key: "Attempt")]
        getter attempt : Int32?

        # Details about the step failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        # The date and time when the next attempt is scheduled, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        # Only populated when the step is in a pending state.
        @[JSON::Field(key: "NextAttemptTimestamp")]
        getter next_attempt_timestamp : Time?

        # The JSON response payload from the step operation.
        @[JSON::Field(key: "Result")]
        getter result : String?

        def initialize(
          @attempt : Int32? = nil,
          @error : Types::ErrorObject? = nil,
          @next_attempt_timestamp : Time? = nil,
          @result : String? = nil
        )
        end
      end

      # Details about a step that failed.
      struct StepFailedDetails
        include JSON::Serializable

        # Details about the step failure.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError

        # Information about retry attempts for this step operation.
        @[JSON::Field(key: "RetryDetails")]
        getter retry_details : Types::RetryDetails

        def initialize(
          @error : Types::EventError,
          @retry_details : Types::RetryDetails
        )
        end
      end

      # Configuration options for a step operation.
      struct StepOptions
        include JSON::Serializable

        # The delay in seconds before the next retry attempt.
        @[JSON::Field(key: "NextAttemptDelaySeconds")]
        getter next_attempt_delay_seconds : Int32?

        def initialize(
          @next_attempt_delay_seconds : Int32? = nil
        )
        end
      end

      # Details about a step that has started.
      struct StepStartedDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Details about a step that succeeded.
      struct StepSucceededDetails
        include JSON::Serializable

        # The response payload from the successful operation.
        @[JSON::Field(key: "Result")]
        getter result : Types::EventResult

        # Information about retry attempts for this step operation.
        @[JSON::Field(key: "RetryDetails")]
        getter retry_details : Types::RetryDetails

        def initialize(
          @result : Types::EventResult,
          @retry_details : Types::RetryDetails
        )
        end
      end

      struct StopDurableExecutionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the durable execution.
        @[JSON::Field(key: "DurableExecutionArn")]
        getter durable_execution_arn : String

        # Optional error details explaining why the execution is being stopped.
        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorObject?

        def initialize(
          @durable_execution_arn : String,
          @error : Types::ErrorObject? = nil
        )
        end
      end

      struct StopDurableExecutionResponse
        include JSON::Serializable

        # The timestamp when the execution was stopped (ISO 8601 format).
        @[JSON::Field(key: "StopTimestamp")]
        getter stop_timestamp : Time

        def initialize(
          @stop_timestamp : Time
        )
        end
      end

      # Lambda couldn't set up VPC access for the Lambda function because one or more configured subnets has
      # no available IP addresses.
      struct SubnetIPAddressLimitReachedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN).
        @[JSON::Field(key: "Resource")]
        getter resource : String

        # A list of tags to apply to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource : String,
          @tags : Hash(String, String)
        )
        end
      end

      # An object that contains details about an error related to retrieving tags.
      struct TagsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message.
        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @error_code : String,
          @message : String
        )
        end
      end

      # A scaling policy for the capacity provider that automatically adjusts capacity to maintain a target
      # value for a specific metric.
      struct TargetTrackingScalingPolicy
        include JSON::Serializable

        # The predefined metric type to track for scaling decisions.
        @[JSON::Field(key: "PredefinedMetricType")]
        getter predefined_metric_type : String

        # The target value for the metric that the scaling policy attempts to maintain through scaling
        # actions.
        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        def initialize(
          @predefined_metric_type : String,
          @target_value : Float64
        )
        end
      end

      # Specifies the tenant isolation mode configuration for a Lambda function. This allows you to
      # configure specific tenant isolation strategies for your function invocations. Tenant isolation
      # configuration cannot be modified after function creation.
      struct TenancyConfig
        include JSON::Serializable

        # Tenant isolation mode allows for invocation to be sent to a corresponding execution environment
        # dedicated to a specific tenant ID.
        @[JSON::Field(key: "TenantIsolationMode")]
        getter tenant_isolation_mode : String

        def initialize(
          @tenant_isolation_mode : String
        )
        end
      end

      # The request throughput limit was exceeded. For more information, see Lambda quotas .
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        # The number of seconds the caller should wait before retrying.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @reason : String? = nil,
          @type : String? = nil,
          @message : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end

      # Contains trace headers for the Lambda durable execution.
      struct TraceHeader
        include JSON::Serializable

        # The X-Ray trace header associated with the durable execution.
        @[JSON::Field(key: "XAmznTraceId")]
        getter x_amzn_trace_id : String?

        def initialize(
          @x_amzn_trace_id : String? = nil
        )
        end
      end

      # The function's X-Ray tracing configuration. To sample and record incoming requests, set Mode to
      # Active .
      struct TracingConfig
        include JSON::Serializable

        # The tracing mode.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end

      # The function's X-Ray tracing configuration.
      struct TracingConfigResponse
        include JSON::Serializable

        # The tracing mode.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @mode : String? = nil
        )
        end
      end

      # The content type of the Invoke request body is not JSON.
      struct UnsupportedMediaTypeException
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @type : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The resource's Amazon Resource Name (ARN).
        @[JSON::Field(key: "Resource")]
        getter resource : String

        # A list of tag keys to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateAliasRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name - MyFunction . Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Partial ARN -
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The name of the alias.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the alias.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The function version that the alias invokes.
        @[JSON::Field(key: "FunctionVersion")]
        getter function_version : String?

        # Only update the alias if the revision ID matches the ID that's specified. Use this option to avoid
        # modifying an alias that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The routing configuration of the alias.
        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::AliasRoutingConfiguration?

        def initialize(
          @function_name : String,
          @name : String,
          @description : String? = nil,
          @function_version : String? = nil,
          @revision_id : String? = nil,
          @routing_config : Types::AliasRoutingConfiguration? = nil
        )
        end
      end

      struct UpdateCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider to update.
        @[JSON::Field(key: "CapacityProviderName")]
        getter capacity_provider_name : String

        # The updated scaling configuration for the capacity provider.
        @[JSON::Field(key: "CapacityProviderScalingConfig")]
        getter capacity_provider_scaling_config : Types::CapacityProviderScalingConfig?

        def initialize(
          @capacity_provider_name : String,
          @capacity_provider_scaling_config : Types::CapacityProviderScalingConfig? = nil
        )
        end
      end

      struct UpdateCapacityProviderResponse
        include JSON::Serializable

        # Information about the updated capacity provider.
        @[JSON::Field(key: "CapacityProvider")]
        getter capacity_provider : Types::CapacityProvider

        def initialize(
          @capacity_provider : Types::CapacityProvider
        )
        end
      end

      struct UpdateCodeSigningConfigRequest
        include JSON::Serializable

        # The The Amazon Resource Name (ARN) of the code signing configuration.
        @[JSON::Field(key: "CodeSigningConfigArn")]
        getter code_signing_config_arn : String

        # Signing profiles for this code signing configuration.
        @[JSON::Field(key: "AllowedPublishers")]
        getter allowed_publishers : Types::AllowedPublishers?

        # The code signing policy.
        @[JSON::Field(key: "CodeSigningPolicies")]
        getter code_signing_policies : Types::CodeSigningPolicies?

        # Descriptive name for this code signing configuration.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @code_signing_config_arn : String,
          @allowed_publishers : Types::AllowedPublishers? = nil,
          @code_signing_policies : Types::CodeSigningPolicies? = nil,
          @description : String? = nil
        )
        end
      end

      struct UpdateCodeSigningConfigResponse
        include JSON::Serializable

        # The code signing configuration
        @[JSON::Field(key: "CodeSigningConfig")]
        getter code_signing_config : Types::CodeSigningConfig

        def initialize(
          @code_signing_config : Types::CodeSigningConfig
        )
        end
      end

      struct UpdateEventSourceMappingRequest
        include JSON::Serializable

        # The identifier of the event source mapping.
        @[JSON::Field(key: "UUID")]
        getter uuid : String

        @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
        getter amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig?

        # The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to
        # your function. Lambda passes all of the records in the batch to the function in a single call, up to
        # the payload limit for synchronous invocation (6 MB). Amazon Kinesis – Default 100. Max 10,000.
        # Amazon DynamoDB Streams – Default 100. Max 10,000. Amazon Simple Queue Service – Default 10. For
        # standard queues the max is 10,000. For FIFO queues the max is 10. Amazon Managed Streaming for
        # Apache Kafka – Default 100. Max 10,000. Self-managed Apache Kafka – Default 100. Max 10,000. Amazon
        # MQ (ActiveMQ and RabbitMQ) – Default 100. Max 10,000. DocumentDB – Default 100. Max 10,000.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If the function returns an
        # error, split the batch in two and retry.
        @[JSON::Field(key: "BisectBatchOnFunctionError")]
        getter bisect_batch_on_function_error : Bool?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A configuration object that
        # specifies the destination of an event after Lambda processes it.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # Specific configuration settings for a DocumentDB event source.
        @[JSON::Field(key: "DocumentDBEventSourceConfig")]
        getter document_db_event_source_config : Types::DocumentDBEventSourceConfig?

        # When true, the event source mapping is active. When false, Lambda pauses polling and invocation.
        # Default: True
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # An object that defines the filter criteria that determine whether Lambda should process an event.
        # For more information, see Lambda event filtering .
        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The name or ARN of the Lambda function. Name formats Function name – MyFunction . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction . Version or Alias ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD . Partial ARN –
        # 123456789012:function:MyFunction . The length constraint applies only to the full ARN. If you
        # specify only the function name, it's limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String?

        # (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and Amazon SQS) A list of current
        # response type enums applied to the event source mapping.
        @[JSON::Field(key: "FunctionResponseTypes")]
        getter function_response_types : Array(String)?

        # The ARN of the Key Management Service (KMS) customer managed key that Lambda uses to encrypt your
        # function's filter criteria . By default, Lambda does not encrypt your filter criteria object.
        # Specify this property to encrypt data using your own customer managed key.
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the
        # function. You can configure MaximumBatchingWindowInSeconds to any value from 0 seconds to 300
        # seconds in increments of seconds. For Kinesis, DynamoDB, and Amazon SQS event sources, the default
        # batching window is 0 seconds. For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB
        # event sources, the default batching window is 500 ms. Note that because you can only change
        # MaximumBatchingWindowInSeconds in increments of seconds, you cannot revert back to the 500 ms
        # default batching window after you have changed it. To restore the default batching window, you must
        # create a new event source mapping. Related setting: For Kinesis, DynamoDB, and Amazon SQS event
        # sources, when you set BatchSize to a value greater than 10, you must set
        # MaximumBatchingWindowInSeconds to at least 1.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records older than
        # the specified age. The default value is infinite (-1).
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records after the
        # specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed
        # records are retried until the record expires.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # The metrics configuration for your event source. For more information, see Event source mapping
        # metrics .
        @[JSON::Field(key: "MetricsConfig")]
        getter metrics_config : Types::EventSourceMappingMetricsConfig?

        # (Kinesis and DynamoDB Streams only) The number of batches to process from each shard concurrently.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        # (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned mode configuration for
        # the event source. For more information, see provisioned mode .
        @[JSON::Field(key: "ProvisionedPollerConfig")]
        getter provisioned_poller_config : Types::ProvisionedPollerConfig?

        # (Amazon SQS only) The scaling configuration for the event source. For more information, see
        # Configuring maximum concurrency for Amazon SQS event sources .
        @[JSON::Field(key: "ScalingConfig")]
        getter scaling_config : Types::ScalingConfig?

        @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
        getter self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig?

        # An array of authentication protocols or VPC components required to secure your event source.
        @[JSON::Field(key: "SourceAccessConfigurations")]
        getter source_access_configurations : Array(Types::SourceAccessConfiguration)?

        # (Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB and
        # Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.
        @[JSON::Field(key: "TumblingWindowInSeconds")]
        getter tumbling_window_in_seconds : Int32?

        def initialize(
          @uuid : String,
          @amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig? = nil,
          @batch_size : Int32? = nil,
          @bisect_batch_on_function_error : Bool? = nil,
          @destination_config : Types::DestinationConfig? = nil,
          @document_db_event_source_config : Types::DocumentDBEventSourceConfig? = nil,
          @enabled : Bool? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @function_name : String? = nil,
          @function_response_types : Array(String)? = nil,
          @kms_key_arn : String? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @metrics_config : Types::EventSourceMappingMetricsConfig? = nil,
          @parallelization_factor : Int32? = nil,
          @provisioned_poller_config : Types::ProvisionedPollerConfig? = nil,
          @scaling_config : Types::ScalingConfig? = nil,
          @self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig? = nil,
          @source_access_configurations : Array(Types::SourceAccessConfiguration)? = nil,
          @tumbling_window_in_seconds : Int32? = nil
        )
        end
      end

      struct UpdateFunctionCodeRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The instruction set architecture that the function supports. Enter a string array with one of the
        # valid values (arm64 or x86_64). The default value is x86_64 .
        @[JSON::Field(key: "Architectures")]
        getter architectures : Array(String)?

        # Set to true to validate the request parameters and access permissions without modifying the function
        # code.
        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # URI of a container image in the Amazon ECR registry. Do not use for a function defined with a .zip
        # file archive.
        @[JSON::Field(key: "ImageUri")]
        getter image_uri : String?

        # Set to true to publish a new version of the function after updating the code. This has the same
        # effect as calling PublishVersion separately.
        @[JSON::Field(key: "Publish")]
        getter publish : Bool?

        # Specifies where to publish the function version or configuration.
        @[JSON::Field(key: "PublishTo")]
        getter publish_to : String?

        # Update the function only if the revision ID matches the ID that's specified. Use this option to
        # avoid modifying a function that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a
        # different Amazon Web Services account. Use only with a function defined with a .zip file archive
        # deployment package.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key of the deployment package. Use only with a function defined with a .zip file
        # archive deployment package.
        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        # For versioned objects, the version of the deployment package object to use.
        @[JSON::Field(key: "S3ObjectVersion")]
        getter s3_object_version : String?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt your
        # function's .zip deployment package. If you don't provide a customer managed key, Lambda uses an
        # Amazon Web Services managed key.
        @[JSON::Field(key: "SourceKMSKeyArn")]
        getter source_kms_key_arn : String?

        # The base64-encoded contents of the deployment package. Amazon Web Services SDK and CLI clients
        # handle the encoding for you. Use only with a function defined with a .zip file archive deployment
        # package.
        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @function_name : String,
          @architectures : Array(String)? = nil,
          @dry_run : Bool? = nil,
          @image_uri : String? = nil,
          @publish : Bool? = nil,
          @publish_to : String? = nil,
          @revision_id : String? = nil,
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_object_version : String? = nil,
          @source_kms_key_arn : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end

      struct UpdateFunctionConfigurationRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # Configuration for the capacity provider that manages compute resources for Lambda functions.
        @[JSON::Field(key: "CapacityProviderConfig")]
        getter capacity_provider_config : Types::CapacityProviderConfig?

        # A dead-letter queue configuration that specifies the queue or topic where Lambda sends asynchronous
        # events when they fail processing. For more information, see Dead-letter queues .
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # A description of the function.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Configuration settings for durable functions. Allows updating execution timeout and retention period
        # for functions with durability enabled.
        @[JSON::Field(key: "DurableConfig")]
        getter durable_config : Types::DurableConfig?

        # Environment variables that are accessible from function code during execution.
        @[JSON::Field(key: "Environment")]
        getter environment : Types::Environment?

        # The size of the function's /tmp directory in MB. The default value is 512, but can be any whole
        # number between 512 and 10,240 MB. For more information, see Configuring ephemeral storage (console)
        # .
        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # Connection settings for an Amazon EFS file system.
        @[JSON::Field(key: "FileSystemConfigs")]
        getter file_system_configs : Array(Types::FileSystemConfig)?

        # The name of the method within your code that Lambda calls to run your function. Handler is required
        # if the deployment package is a .zip file archive. The format includes the file name. It can also
        # include namespaces and other qualifiers, depending on the runtime. For more information, see Lambda
        # programming model .
        @[JSON::Field(key: "Handler")]
        getter handler : String?

        # Container image configuration values that override the values in the container image Docker file.
        @[JSON::Field(key: "ImageConfig")]
        getter image_config : Types::ImageConfig?

        # The ARN of the Key Management Service (KMS) customer managed key that's used to encrypt the
        # following resources: The function's environment variables . The function's Lambda SnapStart
        # snapshots. When used with SourceKMSKeyArn , the unzipped version of the .zip deployment package
        # that's used for function invocations. For more information, see Specifying a customer managed key
        # for Lambda . The optimized version of the container image that's used for function invocations. Note
        # that this is not the same key that's used to protect your container image in the Amazon Elastic
        # Container Registry (Amazon ECR). For more information, see Function lifecycle . If you don't provide
        # a customer managed key, Lambda uses an Amazon Web Services owned key or an Amazon Web Services
        # managed key .
        @[JSON::Field(key: "KMSKeyArn")]
        getter kms_key_arn : String?

        # A list of function layers to add to the function's execution environment. Specify each layer by its
        # ARN, including the version.
        @[JSON::Field(key: "Layers")]
        getter layers : Array(String)?

        # The function's Amazon CloudWatch Logs configuration settings.
        @[JSON::Field(key: "LoggingConfig")]
        getter logging_config : Types::LoggingConfig?

        # The amount of memory available to the function at runtime. Increasing the function memory also
        # increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.
        @[JSON::Field(key: "MemorySize")]
        getter memory_size : Int32?

        # Update the function only if the revision ID matches the ID that's specified. Use this option to
        # avoid modifying a function that has changed since you last read it.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # The Amazon Resource Name (ARN) of the function's execution role.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # The identifier of the function's runtime . Runtime is required if the deployment package is a .zip
        # file archive. Specifying a runtime results in an error if you're deploying a function using a
        # container image. The following list includes deprecated runtimes. Lambda blocks creating new
        # functions and updating existing functions shortly after each runtime is deprecated. For more
        # information, see Runtime use after deprecation . For a list of all currently supported runtimes, see
        # Supported runtimes .
        @[JSON::Field(key: "Runtime")]
        getter runtime : String?

        # The function's SnapStart setting.
        @[JSON::Field(key: "SnapStart")]
        getter snap_start : Types::SnapStart?

        # The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default
        # is 3 seconds. The maximum allowed value is 900 seconds. For more information, see Lambda execution
        # environment .
        @[JSON::Field(key: "Timeout")]
        getter timeout : Int32?

        # Set Mode to Active to sample and trace a subset of incoming requests with X-Ray .
        @[JSON::Field(key: "TracingConfig")]
        getter tracing_config : Types::TracingConfig?

        # For network connectivity to Amazon Web Services resources in a VPC, specify a list of security
        # groups and subnets in the VPC. When you connect a function to a VPC, it can access resources and the
        # internet only through that VPC. For more information, see Configuring a Lambda function to access
        # resources in a VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @function_name : String,
          @capacity_provider_config : Types::CapacityProviderConfig? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @durable_config : Types::DurableConfig? = nil,
          @environment : Types::Environment? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @file_system_configs : Array(Types::FileSystemConfig)? = nil,
          @handler : String? = nil,
          @image_config : Types::ImageConfig? = nil,
          @kms_key_arn : String? = nil,
          @layers : Array(String)? = nil,
          @logging_config : Types::LoggingConfig? = nil,
          @memory_size : Int32? = nil,
          @revision_id : String? = nil,
          @role : String? = nil,
          @runtime : String? = nil,
          @snap_start : Types::SnapStart? = nil,
          @timeout : Int32? = nil,
          @tracing_config : Types::TracingConfig? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct UpdateFunctionEventInvokeConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function, version, or alias. Name formats Function name - my-function
        # (name-only), my-function:v1 (with alias). Function ARN -
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN -
        # 123456789012:function:my-function . You can append a version number or alias to any of the formats.
        # The length constraint applies only to the full ARN. If you specify only the function name, it is
        # limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # A destination for events after they have been sent to a function for processing. Destinations
        # Function - The Amazon Resource Name (ARN) of a Lambda function. Queue - The ARN of a standard SQS
        # queue. Bucket - The ARN of an Amazon S3 bucket. Topic - The ARN of a standard SNS topic. Event Bus -
        # The ARN of an Amazon EventBridge event bus. S3 buckets are supported only for on-failure
        # destinations. To retain records of successful invocations, use another destination type.
        @[JSON::Field(key: "DestinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # The maximum age of a request that Lambda sends to a function for processing.
        @[JSON::Field(key: "MaximumEventAgeInSeconds")]
        getter maximum_event_age_in_seconds : Int32?

        # The maximum number of times to retry when the function returns an error.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # A version number or alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @destination_config : Types::DestinationConfig? = nil,
          @maximum_event_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @qualifier : String? = nil
        )
        end
      end

      struct UpdateFunctionUrlConfigRequest
        include JSON::Serializable

        # The name or ARN of the Lambda function. Name formats Function name – my-function . Function ARN –
        # arn:aws:lambda:us-west-2:123456789012:function:my-function . Partial ARN –
        # 123456789012:function:my-function . The length constraint applies only to the full ARN. If you
        # specify only the function name, it is limited to 64 characters in length.
        @[JSON::Field(key: "FunctionName")]
        getter function_name : String

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String?

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        # The alias name.
        @[JSON::Field(key: "Qualifier")]
        getter qualifier : String?

        def initialize(
          @function_name : String,
          @auth_type : String? = nil,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil,
          @qualifier : String? = nil
        )
        end
      end

      struct UpdateFunctionUrlConfigResponse
        include JSON::Serializable

        # The type of authentication that your function URL uses. Set to AWS_IAM if you want to restrict
        # access to authenticated users only. Set to NONE if you want to bypass IAM authentication to create a
        # public endpoint. For more information, see Control access to Lambda function URLs .
        @[JSON::Field(key: "AuthType")]
        getter auth_type : String

        # When the function URL was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : String

        # The Amazon Resource Name (ARN) of your function.
        @[JSON::Field(key: "FunctionArn")]
        getter function_arn : String

        # The HTTP URL endpoint for your function.
        @[JSON::Field(key: "FunctionUrl")]
        getter function_url : String

        # When the function URL configuration was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : String

        # The cross-origin resource sharing (CORS) settings for your function URL.
        @[JSON::Field(key: "Cors")]
        getter cors : Types::Cors?

        # Use one of the following options: BUFFERED – This is the default option. Lambda invokes your
        # function using the Invoke API operation. Invocation results are available when the payload is
        # complete. The maximum payload size is 6 MB. RESPONSE_STREAM – Your function streams payload results
        # as they become available. Lambda invokes your function using the InvokeWithResponseStream API
        # operation. The maximum response payload size is 200 MB.
        @[JSON::Field(key: "InvokeMode")]
        getter invoke_mode : String?

        def initialize(
          @auth_type : String,
          @creation_time : String,
          @function_arn : String,
          @function_url : String,
          @last_modified_time : String,
          @cors : Types::Cors? = nil,
          @invoke_mode : String? = nil
        )
        end
      end

      # The VPC security groups and subnets that are attached to a Lambda function. For more information,
      # see Configuring a Lambda function to access resources in a VPC .
      struct VpcConfig
        include JSON::Serializable

        # Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets.
        @[JSON::Field(key: "Ipv6AllowedForDualStack")]
        getter ipv6_allowed_for_dual_stack : Bool?

        # A list of VPC security group IDs.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of VPC subnet IDs.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @ipv6_allowed_for_dual_stack : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # The VPC security groups and subnets that are attached to a Lambda function.
      struct VpcConfigResponse
        include JSON::Serializable

        # Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets.
        @[JSON::Field(key: "Ipv6AllowedForDualStack")]
        getter ipv6_allowed_for_dual_stack : Bool?

        # A list of VPC security group IDs.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of VPC subnet IDs.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @ipv6_allowed_for_dual_stack : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Details about a wait operation that was cancelled.
      struct WaitCancelledDetails
        include JSON::Serializable

        # Details about why the wait operation was cancelled.
        @[JSON::Field(key: "Error")]
        getter error : Types::EventError?

        def initialize(
          @error : Types::EventError? = nil
        )
        end
      end

      # Details about a wait operation.
      struct WaitDetails
        include JSON::Serializable

        # The date and time when the wait operation is scheduled to complete, in ISO-8601 format
        # (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "ScheduledEndTimestamp")]
        getter scheduled_end_timestamp : Time?

        def initialize(
          @scheduled_end_timestamp : Time? = nil
        )
        end
      end

      # Specifies how long to pause the durable execution.
      struct WaitOptions
        include JSON::Serializable

        # The duration to wait, in seconds.
        @[JSON::Field(key: "WaitSeconds")]
        getter wait_seconds : Int32?

        def initialize(
          @wait_seconds : Int32? = nil
        )
        end
      end

      # Details about a wait operation that has started.
      struct WaitStartedDetails
        include JSON::Serializable

        # The duration to wait, in seconds.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32

        # The date and time when the wait operation is scheduled to complete, in ISO-8601 format
        # (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "ScheduledEndTimestamp")]
        getter scheduled_end_timestamp : Time

        def initialize(
          @duration : Int32,
          @scheduled_end_timestamp : Time
        )
        end
      end

      # Details about a wait operation that succeeded.
      struct WaitSucceededDetails
        include JSON::Serializable

        # The wait duration, in seconds.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        def initialize(
          @duration : Int32? = nil
        )
        end
      end
    end
  end
end
