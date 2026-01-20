module Aws
  module Lambda
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Adds permissions to the resource-based policy of a version of an Lambda layer . Use this action to
      # grant layer usage permission to other accounts. You can grant permission to a single account, all
      # accounts in an organization, or all Amazon Web Services accounts. To revoke permission, call
      # RemoveLayerVersionPermission with the statement ID that you specified when you added it.

      def add_layer_version_permission(
        action : String,
        layer_name : String,
        principal : String,
        statement_id : String,
        version_number : Int64,
        organization_id : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::AddLayerVersionPermissionRequest.new(action: action, layer_name: layer_name, principal: principal, statement_id: statement_id, version_number: version_number, organization_id: organization_id, revision_id: revision_id)
        add_layer_version_permission(input)
      end

      def add_layer_version_permission(input : Types::AddLayerVersionPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_LAYER_VERSION_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants a principal permission to use a function. You can apply the policy at the function level, or
      # specify a qualifier to restrict access to a single version or alias. If you use a qualifier, the
      # invoker must use the full Amazon Resource Name (ARN) of that version or alias to invoke the
      # function. Note: Lambda does not support adding policies to version $LATEST. To grant permission to
      # another account, specify the account ID as the Principal . To grant permission to an organization
      # defined in Organizations, specify the organization ID as the PrincipalOrgID . For Amazon Web
      # Services services, the principal is a domain-style identifier that the service defines, such as
      # s3.amazonaws.com or sns.amazonaws.com . For Amazon Web Services services, you can also specify the
      # ARN of the associated resource as the SourceArn . If you grant permission to a service principal
      # without specifying the source, other accounts could potentially configure resources in their account
      # to invoke your Lambda function. This operation adds a statement to a resource-based permissions
      # policy for the function. For more information about function policies, see Using resource-based
      # policies for Lambda .

      def add_permission(
        action : String,
        function_name : String,
        principal : String,
        statement_id : String,
        event_source_token : String? = nil,
        function_url_auth_type : String? = nil,
        invoked_via_function_url : Bool? = nil,
        principal_org_id : String? = nil,
        qualifier : String? = nil,
        revision_id : String? = nil,
        source_account : String? = nil,
        source_arn : String? = nil
      ) : Protocol::Request
        input = Types::AddPermissionRequest.new(action: action, function_name: function_name, principal: principal, statement_id: statement_id, event_source_token: event_source_token, function_url_auth_type: function_url_auth_type, invoked_via_function_url: invoked_via_function_url, principal_org_id: principal_org_id, qualifier: qualifier, revision_id: revision_id, source_account: source_account, source_arn: source_arn)
        add_permission(input)
      end

      def add_permission(input : Types::AddPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Saves the progress of a durable function execution during runtime. This API is used by the Lambda
      # durable functions SDK to checkpoint completed steps and schedule asynchronous operations. You
      # typically don't need to call this API directly as the SDK handles checkpointing automatically. Each
      # checkpoint operation consumes the current checkpoint token and returns a new one for the next
      # checkpoint. This ensures that checkpoints are applied in the correct order and prevents duplicate or
      # out-of-order state updates.

      def checkpoint_durable_execution(
        checkpoint_token : String,
        durable_execution_arn : String,
        client_token : String? = nil,
        updates : Array(Types::OperationUpdate)? = nil
      ) : Protocol::Request
        input = Types::CheckpointDurableExecutionRequest.new(checkpoint_token: checkpoint_token, durable_execution_arn: durable_execution_arn, client_token: client_token, updates: updates)
        checkpoint_durable_execution(input)
      end

      def checkpoint_durable_execution(input : Types::CheckpointDurableExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHECKPOINT_DURABLE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an alias for a Lambda function version. Use aliases to provide clients with a function
      # identifier that you can update to invoke a different version. You can also map an alias to split
      # invocation requests between two versions. Use the RoutingConfig parameter to specify a second
      # version and the percentage of invocation requests that it receives.

      def create_alias(
        function_name : String,
        function_version : String,
        name : String,
        description : String? = nil,
        routing_config : Types::AliasRoutingConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateAliasRequest.new(function_name: function_name, function_version: function_version, name: name, description: description, routing_config: routing_config)
        create_alias(input)
      end

      def create_alias(input : Types::CreateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a capacity provider that manages compute resources for Lambda functions

      def create_capacity_provider(
        capacity_provider_name : String,
        permissions_config : Types::CapacityProviderPermissionsConfig,
        vpc_config : Types::CapacityProviderVpcConfig,
        capacity_provider_scaling_config : Types::CapacityProviderScalingConfig? = nil,
        instance_requirements : Types::InstanceRequirements? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCapacityProviderRequest.new(capacity_provider_name: capacity_provider_name, permissions_config: permissions_config, vpc_config: vpc_config, capacity_provider_scaling_config: capacity_provider_scaling_config, instance_requirements: instance_requirements, kms_key_arn: kms_key_arn, tags: tags)
        create_capacity_provider(input)
      end

      def create_capacity_provider(input : Types::CreateCapacityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CAPACITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a code signing configuration. A code signing configuration defines a list of allowed signing
      # profiles and defines the code-signing validation policy (action to be taken if deployment validation
      # checks fail).

      def create_code_signing_config(
        allowed_publishers : Types::AllowedPublishers,
        code_signing_policies : Types::CodeSigningPolicies? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCodeSigningConfigRequest.new(allowed_publishers: allowed_publishers, code_signing_policies: code_signing_policies, description: description, tags: tags)
        create_code_signing_config(input)
      end

      def create_code_signing_config(input : Types::CreateCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a mapping between an event source and an Lambda function. Lambda reads items from the event
      # source and invokes the function. For details about how to configure different event sources, see the
      # following topics. Amazon DynamoDB Streams Amazon Kinesis Amazon SQS Amazon MQ and RabbitMQ Amazon
      # MSK Apache Kafka Amazon DocumentDB The following error handling options are available for stream
      # sources (DynamoDB, Kinesis, Amazon MSK, and self-managed Apache Kafka): BisectBatchOnFunctionError –
      # If the function returns an error, split the batch in two and retry. MaximumRecordAgeInSeconds –
      # Discard records older than the specified age. The default value is infinite (-1). When set to
      # infinite (-1), failed records are retried until the record expires MaximumRetryAttempts – Discard
      # records after the specified number of retries. The default value is infinite (-1). When set to
      # infinite (-1), failed records are retried until the record expires. OnFailure – Send discarded
      # records to an Amazon SQS queue, Amazon SNS topic, Kafka topic, or Amazon S3 bucket. For more
      # information, see Adding a destination . The following option is available only for DynamoDB and
      # Kinesis event sources: ParallelizationFactor – Process multiple batches from each shard
      # concurrently. For information about which configuration parameters apply to each event source, see
      # the following topics. Amazon DynamoDB Streams Amazon Kinesis Amazon SQS Amazon MQ and RabbitMQ
      # Amazon MSK Apache Kafka Amazon DocumentDB

      def create_event_source_mapping(
        function_name : String,
        amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig? = nil,
        batch_size : Int32? = nil,
        bisect_batch_on_function_error : Bool? = nil,
        destination_config : Types::DestinationConfig? = nil,
        document_db_event_source_config : Types::DocumentDBEventSourceConfig? = nil,
        enabled : Bool? = nil,
        event_source_arn : String? = nil,
        filter_criteria : Types::FilterCriteria? = nil,
        function_response_types : Array(String)? = nil,
        kms_key_arn : String? = nil,
        maximum_batching_window_in_seconds : Int32? = nil,
        maximum_record_age_in_seconds : Int32? = nil,
        maximum_retry_attempts : Int32? = nil,
        metrics_config : Types::EventSourceMappingMetricsConfig? = nil,
        parallelization_factor : Int32? = nil,
        provisioned_poller_config : Types::ProvisionedPollerConfig? = nil,
        queues : Array(String)? = nil,
        scaling_config : Types::ScalingConfig? = nil,
        self_managed_event_source : Types::SelfManagedEventSource? = nil,
        self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig? = nil,
        source_access_configurations : Array(Types::SourceAccessConfiguration)? = nil,
        starting_position : String? = nil,
        starting_position_timestamp : Time? = nil,
        tags : Hash(String, String)? = nil,
        topics : Array(String)? = nil,
        tumbling_window_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateEventSourceMappingRequest.new(function_name: function_name, amazon_managed_kafka_event_source_config: amazon_managed_kafka_event_source_config, batch_size: batch_size, bisect_batch_on_function_error: bisect_batch_on_function_error, destination_config: destination_config, document_db_event_source_config: document_db_event_source_config, enabled: enabled, event_source_arn: event_source_arn, filter_criteria: filter_criteria, function_response_types: function_response_types, kms_key_arn: kms_key_arn, maximum_batching_window_in_seconds: maximum_batching_window_in_seconds, maximum_record_age_in_seconds: maximum_record_age_in_seconds, maximum_retry_attempts: maximum_retry_attempts, metrics_config: metrics_config, parallelization_factor: parallelization_factor, provisioned_poller_config: provisioned_poller_config, queues: queues, scaling_config: scaling_config, self_managed_event_source: self_managed_event_source, self_managed_kafka_event_source_config: self_managed_kafka_event_source_config, source_access_configurations: source_access_configurations, starting_position: starting_position, starting_position_timestamp: starting_position_timestamp, tags: tags, topics: topics, tumbling_window_in_seconds: tumbling_window_in_seconds)
        create_event_source_mapping(input)
      end

      def create_event_source_mapping(input : Types::CreateEventSourceMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_SOURCE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Lambda function. To create a function, you need a deployment package and an execution role
      # . The deployment package is a .zip file archive or container image that contains your function code.
      # The execution role grants the function permission to use Amazon Web Services services, such as
      # Amazon CloudWatch Logs for log streaming and X-Ray for request tracing. If the deployment package is
      # a container image , then you set the package type to Image . For a container image, the code
      # property must include the URI of a container image in the Amazon ECR registry. You do not need to
      # specify the handler and runtime properties. If the deployment package is a .zip file archive , then
      # you set the package type to Zip . For a .zip file archive, the code property specifies the location
      # of the .zip file. You must also specify the handler and runtime properties. The code in the
      # deployment package must be compatible with the target instruction set architecture of the function (
      # x86-64 or arm64 ). If you do not specify the architecture, then the default value is x86-64 . When
      # you create a function, Lambda provisions an instance of the function and its supporting resources.
      # If your function connects to a VPC, this process can take a minute or so. During this time, you
      # can't invoke or modify the function. The State , StateReason , and StateReasonCode fields in the
      # response from GetFunctionConfiguration indicate when the function is ready to invoke. For more
      # information, see Lambda function states . A function has an unpublished version, and can have
      # published versions and aliases. The unpublished version changes when you update your function's code
      # and configuration. A published version is a snapshot of your function code and configuration that
      # can't be changed. An alias is a named resource that maps to a version, and can be changed to map to
      # a different version. Use the Publish parameter to create version 1 of your function from its initial
      # configuration. The other parameters let you configure version-specific and function-level settings.
      # You can modify version-specific settings later with UpdateFunctionConfiguration . Function-level
      # settings apply to both the unpublished and published versions of the function, and include tags (
      # TagResource ) and per-function concurrency limits ( PutFunctionConcurrency ). You can use code
      # signing if your deployment package is a .zip file archive. To enable code signing for this function,
      # specify the ARN of a code-signing configuration. When a user attempts to deploy a code package with
      # UpdateFunctionCode , Lambda checks that the code package has a valid signature from a trusted
      # publisher. The code-signing configuration includes set of signing profiles, which define the trusted
      # publishers for this function. If another Amazon Web Services account or an Amazon Web Services
      # service invokes your function, use AddPermission to grant permission by creating a resource-based
      # Identity and Access Management (IAM) policy. You can grant permissions at the function level, on a
      # version, or on an alias. To invoke your function directly, use Invoke . To invoke your function in
      # response to events in other Amazon Web Services services, create an event source mapping (
      # CreateEventSourceMapping ), or configure a function trigger in the other service. For more
      # information, see Invoking Lambda functions .

      def create_function(
        code : Types::FunctionCode,
        function_name : String,
        role : String,
        architectures : Array(String)? = nil,
        capacity_provider_config : Types::CapacityProviderConfig? = nil,
        code_signing_config_arn : String? = nil,
        dead_letter_config : Types::DeadLetterConfig? = nil,
        description : String? = nil,
        durable_config : Types::DurableConfig? = nil,
        environment : Types::Environment? = nil,
        ephemeral_storage : Types::EphemeralStorage? = nil,
        file_system_configs : Array(Types::FileSystemConfig)? = nil,
        handler : String? = nil,
        image_config : Types::ImageConfig? = nil,
        kms_key_arn : String? = nil,
        layers : Array(String)? = nil,
        logging_config : Types::LoggingConfig? = nil,
        memory_size : Int32? = nil,
        package_type : String? = nil,
        publish : Bool? = nil,
        publish_to : String? = nil,
        runtime : String? = nil,
        snap_start : Types::SnapStart? = nil,
        tags : Hash(String, String)? = nil,
        tenancy_config : Types::TenancyConfig? = nil,
        timeout : Int32? = nil,
        tracing_config : Types::TracingConfig? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Protocol::Request
        input = Types::CreateFunctionRequest.new(code: code, function_name: function_name, role: role, architectures: architectures, capacity_provider_config: capacity_provider_config, code_signing_config_arn: code_signing_config_arn, dead_letter_config: dead_letter_config, description: description, durable_config: durable_config, environment: environment, ephemeral_storage: ephemeral_storage, file_system_configs: file_system_configs, handler: handler, image_config: image_config, kms_key_arn: kms_key_arn, layers: layers, logging_config: logging_config, memory_size: memory_size, package_type: package_type, publish: publish, publish_to: publish_to, runtime: runtime, snap_start: snap_start, tags: tags, tenancy_config: tenancy_config, timeout: timeout, tracing_config: tracing_config, vpc_config: vpc_config)
        create_function(input)
      end

      def create_function(input : Types::CreateFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Lambda function URL with the specified configuration parameters. A function URL is a
      # dedicated HTTP(S) endpoint that you can use to invoke your function.

      def create_function_url_config(
        auth_type : String,
        function_name : String,
        cors : Types::Cors? = nil,
        invoke_mode : String? = nil,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::CreateFunctionUrlConfigRequest.new(auth_type: auth_type, function_name: function_name, cors: cors, invoke_mode: invoke_mode, qualifier: qualifier)
        create_function_url_config(input)
      end

      def create_function_url_config(input : Types::CreateFunctionUrlConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUNCTION_URL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Lambda function alias .

      def delete_alias(
        function_name : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteAliasRequest.new(function_name: function_name, name: name)
        delete_alias(input)
      end

      def delete_alias(input : Types::DeleteAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a capacity provider. You cannot delete a capacity provider that is currently being used by
      # Lambda functions.

      def delete_capacity_provider(
        capacity_provider_name : String
      ) : Protocol::Request
        input = Types::DeleteCapacityProviderRequest.new(capacity_provider_name: capacity_provider_name)
        delete_capacity_provider(input)
      end

      def delete_capacity_provider(input : Types::DeleteCapacityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAPACITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the code signing configuration. You can delete the code signing configuration only if no
      # function is using it.

      def delete_code_signing_config(
        code_signing_config_arn : String
      ) : Protocol::Request
        input = Types::DeleteCodeSigningConfigRequest.new(code_signing_config_arn: code_signing_config_arn)
        delete_code_signing_config(input)
      end

      def delete_code_signing_config(input : Types::DeleteCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an event source mapping . You can get the identifier of a mapping from the output of
      # ListEventSourceMappings . When you delete an event source mapping, it enters a Deleting state and
      # might not be completely deleted for several seconds.

      def delete_event_source_mapping(
        uuid : String
      ) : Protocol::Request
        input = Types::DeleteEventSourceMappingRequest.new(uuid: uuid)
        delete_event_source_mapping(input)
      end

      def delete_event_source_mapping(input : Types::DeleteEventSourceMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_SOURCE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Lambda function. To delete a specific function version, use the Qualifier parameter.
      # Otherwise, all versions and aliases are deleted. This doesn't require the user to have explicit
      # permissions for DeleteAlias . A deleted Lambda function cannot be recovered. Ensure that you specify
      # the correct function name and version before deleting. To delete Lambda event source mappings that
      # invoke a function, use DeleteEventSourceMapping . For Amazon Web Services services and resources
      # that invoke your function directly, delete the trigger in the service where you originally
      # configured it.

      def delete_function(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFunctionRequest.new(function_name: function_name, qualifier: qualifier)
        delete_function(input)
      end

      def delete_function(input : Types::DeleteFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the code signing configuration from the function.

      def delete_function_code_signing_config(
        function_name : String
      ) : Protocol::Request
        input = Types::DeleteFunctionCodeSigningConfigRequest.new(function_name: function_name)
        delete_function_code_signing_config(input)
      end

      def delete_function_code_signing_config(input : Types::DeleteFunctionCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a concurrent execution limit from a function.

      def delete_function_concurrency(
        function_name : String
      ) : Protocol::Request
        input = Types::DeleteFunctionConcurrencyRequest.new(function_name: function_name)
        delete_function_concurrency(input)
      end

      def delete_function_concurrency(input : Types::DeleteFunctionConcurrencyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION_CONCURRENCY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the configuration for asynchronous invocation for a function, version, or alias. To
      # configure options for asynchronous invocation, use PutFunctionEventInvokeConfig .

      def delete_function_event_invoke_config(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFunctionEventInvokeConfigRequest.new(function_name: function_name, qualifier: qualifier)
        delete_function_event_invoke_config(input)
      end

      def delete_function_event_invoke_config(input : Types::DeleteFunctionEventInvokeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION_EVENT_INVOKE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Lambda function URL. When you delete a function URL, you can't recover it. Creating a new
      # function URL results in a different URL address.

      def delete_function_url_config(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFunctionUrlConfigRequest.new(function_name: function_name, qualifier: qualifier)
        delete_function_url_config(input)
      end

      def delete_function_url_config(input : Types::DeleteFunctionUrlConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION_URL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a version of an Lambda layer . Deleted versions can no longer be viewed or added to
      # functions. To avoid breaking functions, a copy of the version remains in Lambda until no functions
      # refer to it.

      def delete_layer_version(
        layer_name : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::DeleteLayerVersionRequest.new(layer_name: layer_name, version_number: version_number)
        delete_layer_version(input)
      end

      def delete_layer_version(input : Types::DeleteLayerVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAYER_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the provisioned concurrency configuration for a function.

      def delete_provisioned_concurrency_config(
        function_name : String,
        qualifier : String
      ) : Protocol::Request
        input = Types::DeleteProvisionedConcurrencyConfigRequest.new(function_name: function_name, qualifier: qualifier)
        delete_provisioned_concurrency_config(input)
      end

      def delete_provisioned_concurrency_config(input : Types::DeleteProvisionedConcurrencyConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROVISIONED_CONCURRENCY_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about your account's limits and usage in an Amazon Web Services Region.

      def get_account_settings : Protocol::Request
        input = Types::GetAccountSettingsRequest.new
        get_account_settings(input)
      end

      def get_account_settings(input : Types::GetAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a Lambda function alias .

      def get_alias(
        function_name : String,
        name : String
      ) : Protocol::Request
        input = Types::GetAliasRequest.new(function_name: function_name, name: name)
        get_alias(input)
      end

      def get_alias(input : Types::GetAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific capacity provider, including its configuration, state, and
      # associated resources.

      def get_capacity_provider(
        capacity_provider_name : String
      ) : Protocol::Request
        input = Types::GetCapacityProviderRequest.new(capacity_provider_name: capacity_provider_name)
        get_capacity_provider(input)
      end

      def get_capacity_provider(input : Types::GetCapacityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAPACITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified code signing configuration.

      def get_code_signing_config(
        code_signing_config_arn : String
      ) : Protocol::Request
        input = Types::GetCodeSigningConfigRequest.new(code_signing_config_arn: code_signing_config_arn)
        get_code_signing_config(input)
      end

      def get_code_signing_config(input : Types::GetCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific durable execution , including its current status,
      # input payload, result or error information, and execution metadata such as start time and usage
      # statistics.

      def get_durable_execution(
        durable_execution_arn : String
      ) : Protocol::Request
        input = Types::GetDurableExecutionRequest.new(durable_execution_arn: durable_execution_arn)
        get_durable_execution(input)
      end

      def get_durable_execution(input : Types::GetDurableExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DURABLE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the execution history for a durable execution , showing all the steps, callbacks, and
      # events that occurred during the execution. This provides a detailed audit trail of the execution's
      # progress over time. The history is available while the execution is running and for a retention
      # period after it completes (1-90 days, default 30 days). You can control whether to include execution
      # data such as step results and callback payloads.

      def get_durable_execution_history(
        durable_execution_arn : String,
        include_execution_data : Bool? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        reverse_order : Bool? = nil
      ) : Protocol::Request
        input = Types::GetDurableExecutionHistoryRequest.new(durable_execution_arn: durable_execution_arn, include_execution_data: include_execution_data, marker: marker, max_items: max_items, reverse_order: reverse_order)
        get_durable_execution_history(input)
      end

      def get_durable_execution_history(input : Types::GetDurableExecutionHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DURABLE_EXECUTION_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current execution state required for the replay process during durable function
      # execution. This API is used by the Lambda durable functions SDK to get state information needed for
      # replay. You typically don't need to call this API directly as the SDK handles state management
      # automatically. The response contains operations ordered by start sequence number in ascending order.
      # Completed operations with children don't include child operation details since they don't need to be
      # replayed.

      def get_durable_execution_state(
        checkpoint_token : String,
        durable_execution_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::GetDurableExecutionStateRequest.new(checkpoint_token: checkpoint_token, durable_execution_arn: durable_execution_arn, marker: marker, max_items: max_items)
        get_durable_execution_state(input)
      end

      def get_durable_execution_state(input : Types::GetDurableExecutionStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DURABLE_EXECUTION_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about an event source mapping. You can get the identifier of a mapping from the
      # output of ListEventSourceMappings .

      def get_event_source_mapping(
        uuid : String
      ) : Protocol::Request
        input = Types::GetEventSourceMappingRequest.new(uuid: uuid)
        get_event_source_mapping(input)
      end

      def get_event_source_mapping(input : Types::GetEventSourceMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_SOURCE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the function or function version, with a link to download the deployment
      # package that's valid for 10 minutes. If you specify a function version, only details that are
      # specific to that version are returned.

      def get_function(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetFunctionRequest.new(function_name: function_name, qualifier: qualifier)
        get_function(input)
      end

      def get_function(input : Types::GetFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the code signing configuration for the specified function.

      def get_function_code_signing_config(
        function_name : String
      ) : Protocol::Request
        input = Types::GetFunctionCodeSigningConfigRequest.new(function_name: function_name)
        get_function_code_signing_config(input)
      end

      def get_function_code_signing_config(input : Types::GetFunctionCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about the reserved concurrency configuration for a function. To set a concurrency
      # limit for a function, use PutFunctionConcurrency .

      def get_function_concurrency(
        function_name : String
      ) : Protocol::Request
        input = Types::GetFunctionConcurrencyRequest.new(function_name: function_name)
        get_function_concurrency(input)
      end

      def get_function_concurrency(input : Types::GetFunctionConcurrencyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_CONCURRENCY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the version-specific settings of a Lambda function or version. The output includes only
      # options that can vary between versions of a function. To modify these settings, use
      # UpdateFunctionConfiguration . To get all of a function's details, including function-level settings,
      # use GetFunction .

      def get_function_configuration(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetFunctionConfigurationRequest.new(function_name: function_name, qualifier: qualifier)
        get_function_configuration(input)
      end

      def get_function_configuration(input : Types::GetFunctionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration for asynchronous invocation for a function, version, or alias. To
      # configure options for asynchronous invocation, use PutFunctionEventInvokeConfig .

      def get_function_event_invoke_config(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetFunctionEventInvokeConfigRequest.new(function_name: function_name, qualifier: qualifier)
        get_function_event_invoke_config(input)
      end

      def get_function_event_invoke_config(input : Types::GetFunctionEventInvokeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_EVENT_INVOKE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns your function's recursive loop detection configuration.

      def get_function_recursion_config(
        function_name : String
      ) : Protocol::Request
        input = Types::GetFunctionRecursionConfigRequest.new(function_name: function_name)
        get_function_recursion_config(input)
      end

      def get_function_recursion_config(input : Types::GetFunctionRecursionConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_RECURSION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the scaling configuration for a Lambda Managed Instances function.

      def get_function_scaling_config(
        function_name : String,
        qualifier : String
      ) : Protocol::Request
        input = Types::GetFunctionScalingConfigRequest.new(function_name: function_name, qualifier: qualifier)
        get_function_scaling_config(input)
      end

      def get_function_scaling_config(input : Types::GetFunctionScalingConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_SCALING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a Lambda function URL.

      def get_function_url_config(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetFunctionUrlConfigRequest.new(function_name: function_name, qualifier: qualifier)
        get_function_url_config(input)
      end

      def get_function_url_config(input : Types::GetFunctionUrlConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION_URL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a version of an Lambda layer , with a link to download the layer archive
      # that's valid for 10 minutes.

      def get_layer_version(
        layer_name : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::GetLayerVersionRequest.new(layer_name: layer_name, version_number: version_number)
        get_layer_version(input)
      end

      def get_layer_version(input : Types::GetLayerVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAYER_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a version of an Lambda layer , with a link to download the layer archive
      # that's valid for 10 minutes.

      def get_layer_version_by_arn(
        arn : String
      ) : Protocol::Request
        input = Types::GetLayerVersionByArnRequest.new(arn: arn)
        get_layer_version_by_arn(input)
      end

      def get_layer_version_by_arn(input : Types::GetLayerVersionByArnRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAYER_VERSION_BY_ARN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the permission policy for a version of an Lambda layer . For more information, see
      # AddLayerVersionPermission .

      def get_layer_version_policy(
        layer_name : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::GetLayerVersionPolicyRequest.new(layer_name: layer_name, version_number: version_number)
        get_layer_version_policy(input)
      end

      def get_layer_version_policy(input : Types::GetLayerVersionPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAYER_VERSION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the resource-based IAM policy for a function, version, or alias.

      def get_policy(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetPolicyRequest.new(function_name: function_name, qualifier: qualifier)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the provisioned concurrency configuration for a function's alias or version.

      def get_provisioned_concurrency_config(
        function_name : String,
        qualifier : String
      ) : Protocol::Request
        input = Types::GetProvisionedConcurrencyConfigRequest.new(function_name: function_name, qualifier: qualifier)
        get_provisioned_concurrency_config(input)
      end

      def get_provisioned_concurrency_config(input : Types::GetProvisionedConcurrencyConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROVISIONED_CONCURRENCY_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the runtime management configuration for a function's version. If the runtime update mode
      # is Manual , this includes the ARN of the runtime version and the runtime update mode. If the runtime
      # update mode is Auto or Function update , this includes the runtime update mode and null is returned
      # for the ARN. For more information, see Runtime updates .

      def get_runtime_management_config(
        function_name : String,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::GetRuntimeManagementConfigRequest.new(function_name: function_name, qualifier: qualifier)
        get_runtime_management_config(input)
      end

      def get_runtime_management_config(input : Types::GetRuntimeManagementConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RUNTIME_MANAGEMENT_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Invokes a Lambda function. You can invoke a function synchronously (and wait for the response), or
      # asynchronously. By default, Lambda invokes your function synchronously (i.e. the InvocationType is
      # RequestResponse ). To invoke a function asynchronously, set InvocationType to Event . Lambda passes
      # the ClientContext object to your function for synchronous invocations only. For synchronous
      # invocations, the maximum payload size is 6 MB. For asynchronous invocations, the maximum payload
      # size is 1 MB. For synchronous invocation , details about the function response, including errors,
      # are included in the response body and headers. For either invocation type, you can find more
      # information in the execution log and trace . When an error occurs, your function may be invoked
      # multiple times. Retry behavior varies by error type, client, event source, and invocation type. For
      # example, if you invoke a function asynchronously and it returns an error, Lambda executes the
      # function up to two more times. For more information, see Error handling and automatic retries in
      # Lambda . For asynchronous invocation , Lambda adds events to a queue before sending them to your
      # function. If your function does not have enough capacity to keep up with the queue, events may be
      # lost. Occasionally, your function may receive the same event multiple times, even if no error
      # occurs. To retain events that were not processed, configure your function with a dead-letter queue .
      # The status code in the API response doesn't reflect function errors. Error codes are reserved for
      # errors that prevent your function from executing, such as permissions errors, quota errors, or
      # issues with your function's code and configuration. For example, Lambda returns
      # TooManyRequestsException if running the function would cause you to exceed a concurrency limit at
      # either the account level ( ConcurrentInvocationLimitExceeded ) or function level (
      # ReservedFunctionConcurrentInvocationLimitExceeded ). For functions with a long timeout, your client
      # might disconnect during synchronous invocation while it waits for a response. Configure your HTTP
      # client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or
      # keep-alive settings. This operation requires permission for the lambda:InvokeFunction action. For
      # details on how to set up permissions for cross-account invocations, see Granting function access to
      # other accounts .

      def invoke(
        function_name : String,
        client_context : String? = nil,
        durable_execution_name : String? = nil,
        invocation_type : String? = nil,
        log_type : String? = nil,
        payload : Bytes? = nil,
        qualifier : String? = nil,
        tenant_id : String? = nil
      ) : Protocol::Request
        input = Types::InvocationRequest.new(function_name: function_name, client_context: client_context, durable_execution_name: durable_execution_name, invocation_type: invocation_type, log_type: log_type, payload: payload, qualifier: qualifier, tenant_id: tenant_id)
        invoke(input)
      end

      def invoke(input : Types::InvocationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For asynchronous function invocation, use Invoke . Invokes a function asynchronously. The payload
      # limit is 256KB. For larger payloads, for up to 1MB, use Invoke . If you do use the InvokeAsync
      # action, note that it doesn't support the use of X-Ray active tracing. Trace ID is not propagated to
      # the function, even if X-Ray active tracing is turned on.

      def invoke_async(
        function_name : String,
        invoke_args : Bytes
      ) : Protocol::Request
        input = Types::InvokeAsyncRequest.new(function_name: function_name, invoke_args: invoke_args)
        invoke_async(input)
      end

      def invoke_async(input : Types::InvokeAsyncRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_ASYNC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Configure your Lambda functions to stream response payloads back to clients. For more information,
      # see Configuring a Lambda function to stream responses . This operation requires permission for the
      # lambda:InvokeFunction action. For details on how to set up permissions for cross-account
      # invocations, see Granting function access to other accounts .

      def invoke_with_response_stream(
        function_name : String,
        client_context : String? = nil,
        invocation_type : String? = nil,
        log_type : String? = nil,
        payload : Bytes? = nil,
        qualifier : String? = nil,
        tenant_id : String? = nil
      ) : Protocol::Request
        input = Types::InvokeWithResponseStreamRequest.new(function_name: function_name, client_context: client_context, invocation_type: invocation_type, log_type: log_type, payload: payload, qualifier: qualifier, tenant_id: tenant_id)
        invoke_with_response_stream(input)
      end

      def invoke_with_response_stream(input : Types::InvokeWithResponseStreamRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVOKE_WITH_RESPONSE_STREAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of aliases for a Lambda function.

      def list_aliases(
        function_name : String,
        function_version : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListAliasesRequest.new(function_name: function_name, function_version: function_version, marker: marker, max_items: max_items)
        list_aliases(input)
      end

      def list_aliases(input : Types::ListAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of capacity providers in your account.

      def list_capacity_providers(
        marker : String? = nil,
        max_items : Int32? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListCapacityProvidersRequest.new(marker: marker, max_items: max_items, state: state)
        list_capacity_providers(input)
      end

      def list_capacity_providers(input : Types::ListCapacityProvidersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CAPACITY_PROVIDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of code signing configurations . A request returns up to 10,000 configurations per
      # call. You can use the MaxItems parameter to return fewer configurations per call.

      def list_code_signing_configs(
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListCodeSigningConfigsRequest.new(marker: marker, max_items: max_items)
        list_code_signing_configs(input)
      end

      def list_code_signing_configs(input : Types::ListCodeSigningConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_SIGNING_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of durable executions for a specified Lambda function. You can filter the results by
      # execution name, status, and start time range. This API supports pagination for large result sets.

      def list_durable_executions_by_function(
        function_name : String,
        durable_execution_name : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil,
        qualifier : String? = nil,
        reverse_order : Bool? = nil,
        started_after : Time? = nil,
        started_before : Time? = nil,
        statuses : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListDurableExecutionsByFunctionRequest.new(function_name: function_name, durable_execution_name: durable_execution_name, marker: marker, max_items: max_items, qualifier: qualifier, reverse_order: reverse_order, started_after: started_after, started_before: started_before, statuses: statuses)
        list_durable_executions_by_function(input)
      end

      def list_durable_executions_by_function(input : Types::ListDurableExecutionsByFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DURABLE_EXECUTIONS_BY_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists event source mappings. Specify an EventSourceArn to show only event source mappings for a
      # single event source.

      def list_event_source_mappings(
        event_source_arn : String? = nil,
        function_name : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListEventSourceMappingsRequest.new(event_source_arn: event_source_arn, function_name: function_name, marker: marker, max_items: max_items)
        list_event_source_mappings(input)
      end

      def list_event_source_mappings(input : Types::ListEventSourceMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_SOURCE_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of configurations for asynchronous invocation for a function. To configure options
      # for asynchronous invocation, use PutFunctionEventInvokeConfig .

      def list_function_event_invoke_configs(
        function_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListFunctionEventInvokeConfigsRequest.new(function_name: function_name, marker: marker, max_items: max_items)
        list_function_event_invoke_configs(input)
      end

      def list_function_event_invoke_configs(input : Types::ListFunctionEventInvokeConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTION_EVENT_INVOKE_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Lambda function URLs for the specified function.

      def list_function_url_configs(
        function_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListFunctionUrlConfigsRequest.new(function_name: function_name, marker: marker, max_items: max_items)
        list_function_url_configs(input)
      end

      def list_function_url_configs(input : Types::ListFunctionUrlConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTION_URL_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of function versions that are configured to use a specific capacity provider.

      def list_function_versions_by_capacity_provider(
        capacity_provider_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListFunctionVersionsByCapacityProviderRequest.new(capacity_provider_name: capacity_provider_name, marker: marker, max_items: max_items)
        list_function_versions_by_capacity_provider(input)
      end

      def list_function_versions_by_capacity_provider(input : Types::ListFunctionVersionsByCapacityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTION_VERSIONS_BY_CAPACITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Lambda functions, with the version-specific configuration of each. Lambda returns
      # up to 50 functions per call. Set FunctionVersion to ALL to include all published versions of each
      # function in addition to the unpublished version. The ListFunctions operation returns a subset of the
      # FunctionConfiguration fields. To get the additional fields (State, StateReasonCode, StateReason,
      # LastUpdateStatus, LastUpdateStatusReason, LastUpdateStatusReasonCode, RuntimeVersionConfig) for a
      # function or version, use GetFunction .

      def list_functions(
        function_version : String? = nil,
        marker : String? = nil,
        master_region : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListFunctionsRequest.new(function_version: function_version, marker: marker, master_region: master_region, max_items: max_items)
        list_functions(input)
      end

      def list_functions(input : Types::ListFunctionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the functions that use the specified code signing configuration. You can use this method prior
      # to deleting a code signing configuration, to verify that no functions are using it.

      def list_functions_by_code_signing_config(
        code_signing_config_arn : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListFunctionsByCodeSigningConfigRequest.new(code_signing_config_arn: code_signing_config_arn, marker: marker, max_items: max_items)
        list_functions_by_code_signing_config(input)
      end

      def list_functions_by_code_signing_config(input : Types::ListFunctionsByCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTIONS_BY_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the versions of an Lambda layer . Versions that have been deleted aren't listed. Specify a
      # runtime identifier to list only versions that indicate that they're compatible with that runtime.
      # Specify a compatible architecture to include only layer versions that are compatible with that
      # architecture.

      def list_layer_versions(
        layer_name : String,
        compatible_architecture : String? = nil,
        compatible_runtime : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListLayerVersionsRequest.new(layer_name: layer_name, compatible_architecture: compatible_architecture, compatible_runtime: compatible_runtime, marker: marker, max_items: max_items)
        list_layer_versions(input)
      end

      def list_layer_versions(input : Types::ListLayerVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAYER_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Lambda layers and shows information about the latest version of each. Specify a runtime
      # identifier to list only layers that indicate that they're compatible with that runtime. Specify a
      # compatible architecture to include only layers that are compatible with that instruction set
      # architecture .

      def list_layers(
        compatible_architecture : String? = nil,
        compatible_runtime : String? = nil,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListLayersRequest.new(compatible_architecture: compatible_architecture, compatible_runtime: compatible_runtime, marker: marker, max_items: max_items)
        list_layers(input)
      end

      def list_layers(input : Types::ListLayersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAYERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of provisioned concurrency configurations for a function.

      def list_provisioned_concurrency_configs(
        function_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListProvisionedConcurrencyConfigsRequest.new(function_name: function_name, marker: marker, max_items: max_items)
        list_provisioned_concurrency_configs(input)
      end

      def list_provisioned_concurrency_configs(input : Types::ListProvisionedConcurrencyConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONED_CONCURRENCY_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a function, event source mapping, or code signing configuration's tags . You can also view
      # function tags with GetFunction .

      def list_tags(
        resource : String
      ) : Protocol::Request
        input = Types::ListTagsRequest.new(resource: resource)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of versions , with the version-specific configuration of each. Lambda returns up to
      # 50 versions per call.

      def list_versions_by_function(
        function_name : String,
        marker : String? = nil,
        max_items : Int32? = nil
      ) : Protocol::Request
        input = Types::ListVersionsByFunctionRequest.new(function_name: function_name, marker: marker, max_items: max_items)
        list_versions_by_function(input)
      end

      def list_versions_by_function(input : Types::ListVersionsByFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VERSIONS_BY_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Lambda layer from a ZIP archive. Each time you call PublishLayerVersion with the same
      # layer name, a new version is created. Add layers to your function with CreateFunction or
      # UpdateFunctionConfiguration .

      def publish_layer_version(
        content : Types::LayerVersionContentInput,
        layer_name : String,
        compatible_architectures : Array(String)? = nil,
        compatible_runtimes : Array(String)? = nil,
        description : String? = nil,
        license_info : String? = nil
      ) : Protocol::Request
        input = Types::PublishLayerVersionRequest.new(content: content, layer_name: layer_name, compatible_architectures: compatible_architectures, compatible_runtimes: compatible_runtimes, description: description, license_info: license_info)
        publish_layer_version(input)
      end

      def publish_layer_version(input : Types::PublishLayerVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_LAYER_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a version from the current code and configuration of a function. Use versions to create a
      # snapshot of your function code and configuration that doesn't change. Lambda doesn't publish a
      # version if the function's configuration and code haven't changed since the last version. Use
      # UpdateFunctionCode or UpdateFunctionConfiguration to update the function before publishing a
      # version. Clients can invoke versions directly or with an alias. To create an alias, use CreateAlias
      # .

      def publish_version(
        function_name : String,
        code_sha256 : String? = nil,
        description : String? = nil,
        publish_to : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PublishVersionRequest.new(function_name: function_name, code_sha256: code_sha256, description: description, publish_to: publish_to, revision_id: revision_id)
        publish_version(input)
      end

      def publish_version(input : Types::PublishVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the code signing configuration for the function. Changes to the code signing configuration
      # take effect the next time a user tries to deploy a code package to the function.

      def put_function_code_signing_config(
        code_signing_config_arn : String,
        function_name : String
      ) : Protocol::Request
        input = Types::PutFunctionCodeSigningConfigRequest.new(code_signing_config_arn: code_signing_config_arn, function_name: function_name)
        put_function_code_signing_config(input)
      end

      def put_function_code_signing_config(input : Types::PutFunctionCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FUNCTION_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the maximum number of simultaneous executions for a function, and reserves capacity for that
      # concurrency level. Concurrency settings apply to the function as a whole, including all published
      # versions and the unpublished version. Reserving concurrency both ensures that your function has
      # capacity to process the specified number of events simultaneously, and prevents it from scaling
      # beyond that level. Use GetFunction to see the current setting for a function. Use GetAccountSettings
      # to see your Regional concurrency limit. You can reserve concurrency for as many functions as you
      # like, as long as you leave at least 100 simultaneous executions unreserved for functions that aren't
      # configured with a per-function limit. For more information, see Lambda function scaling .

      def put_function_concurrency(
        function_name : String,
        reserved_concurrent_executions : Int32
      ) : Protocol::Request
        input = Types::PutFunctionConcurrencyRequest.new(function_name: function_name, reserved_concurrent_executions: reserved_concurrent_executions)
        put_function_concurrency(input)
      end

      def put_function_concurrency(input : Types::PutFunctionConcurrencyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FUNCTION_CONCURRENCY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Configures options for asynchronous invocation on a function, version, or alias. If a configuration
      # already exists for a function, version, or alias, this operation overwrites it. If you exclude any
      # settings, they are removed. To set one option without affecting existing settings for other options,
      # use UpdateFunctionEventInvokeConfig . By default, Lambda retries an asynchronous invocation twice if
      # the function returns an error. It retains events in a queue for up to six hours. When an event fails
      # all processing attempts or stays in the asynchronous invocation queue for too long, Lambda discards
      # it. To retain discarded events, configure a dead-letter queue with UpdateFunctionConfiguration . To
      # send an invocation record to a queue, topic, S3 bucket, function, or event bus, specify a
      # destination . You can configure separate destinations for successful invocations (on-success) and
      # events that fail all processing attempts (on-failure). You can configure destinations in addition to
      # or instead of a dead-letter queue. S3 buckets are supported only for on-failure destinations. To
      # retain records of successful invocations, use another destination type.

      def put_function_event_invoke_config(
        function_name : String,
        destination_config : Types::DestinationConfig? = nil,
        maximum_event_age_in_seconds : Int32? = nil,
        maximum_retry_attempts : Int32? = nil,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::PutFunctionEventInvokeConfigRequest.new(function_name: function_name, destination_config: destination_config, maximum_event_age_in_seconds: maximum_event_age_in_seconds, maximum_retry_attempts: maximum_retry_attempts, qualifier: qualifier)
        put_function_event_invoke_config(input)
      end

      def put_function_event_invoke_config(input : Types::PutFunctionEventInvokeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FUNCTION_EVENT_INVOKE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets your function's recursive loop detection configuration. When you configure a Lambda function to
      # output to the same service or resource that invokes the function, it's possible to create an
      # infinite recursive loop. For example, a Lambda function might write a message to an Amazon Simple
      # Queue Service (Amazon SQS) queue, which then invokes the same function. This invocation causes the
      # function to write another message to the queue, which in turn invokes the function again. Lambda can
      # detect certain types of recursive loops shortly after they occur. When Lambda detects a recursive
      # loop and your function's recursive loop detection configuration is set to Terminate , it stops your
      # function being invoked and notifies you.

      def put_function_recursion_config(
        function_name : String,
        recursive_loop : String
      ) : Protocol::Request
        input = Types::PutFunctionRecursionConfigRequest.new(function_name: function_name, recursive_loop: recursive_loop)
        put_function_recursion_config(input)
      end

      def put_function_recursion_config(input : Types::PutFunctionRecursionConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FUNCTION_RECURSION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the scaling configuration for a Lambda Managed Instances function. The scaling configuration
      # defines the minimum and maximum number of execution environments that can be provisioned for the
      # function, allowing you to control scaling behavior and resource allocation.

      def put_function_scaling_config(
        function_name : String,
        qualifier : String,
        function_scaling_config : Types::FunctionScalingConfig? = nil
      ) : Protocol::Request
        input = Types::PutFunctionScalingConfigRequest.new(function_name: function_name, qualifier: qualifier, function_scaling_config: function_scaling_config)
        put_function_scaling_config(input)
      end

      def put_function_scaling_config(input : Types::PutFunctionScalingConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_FUNCTION_SCALING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a provisioned concurrency configuration to a function's alias or version.

      def put_provisioned_concurrency_config(
        function_name : String,
        provisioned_concurrent_executions : Int32,
        qualifier : String
      ) : Protocol::Request
        input = Types::PutProvisionedConcurrencyConfigRequest.new(function_name: function_name, provisioned_concurrent_executions: provisioned_concurrent_executions, qualifier: qualifier)
        put_provisioned_concurrency_config(input)
      end

      def put_provisioned_concurrency_config(input : Types::PutProvisionedConcurrencyConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PROVISIONED_CONCURRENCY_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the runtime management configuration for a function's version. For more information, see
      # Runtime updates .

      def put_runtime_management_config(
        function_name : String,
        update_runtime_on : String,
        qualifier : String? = nil,
        runtime_version_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutRuntimeManagementConfigRequest.new(function_name: function_name, update_runtime_on: update_runtime_on, qualifier: qualifier, runtime_version_arn: runtime_version_arn)
        put_runtime_management_config(input)
      end

      def put_runtime_management_config(input : Types::PutRuntimeManagementConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RUNTIME_MANAGEMENT_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a statement from the permissions policy for a version of an Lambda layer . For more
      # information, see AddLayerVersionPermission .

      def remove_layer_version_permission(
        layer_name : String,
        statement_id : String,
        version_number : Int64,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::RemoveLayerVersionPermissionRequest.new(layer_name: layer_name, statement_id: statement_id, version_number: version_number, revision_id: revision_id)
        remove_layer_version_permission(input)
      end

      def remove_layer_version_permission(input : Types::RemoveLayerVersionPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_LAYER_VERSION_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes function-use permission from an Amazon Web Services service or another Amazon Web Services
      # account. You can get the ID of the statement from the output of GetPolicy .

      def remove_permission(
        function_name : String,
        statement_id : String,
        qualifier : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::RemovePermissionRequest.new(function_name: function_name, statement_id: statement_id, qualifier: qualifier, revision_id: revision_id)
        remove_permission(input)
      end

      def remove_permission(input : Types::RemovePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a failure response for a callback operation in a durable execution. Use this API when an
      # external system cannot complete a callback operation successfully.

      def send_durable_execution_callback_failure(
        callback_id : String,
        error : Types::ErrorObject? = nil
      ) : Protocol::Request
        input = Types::SendDurableExecutionCallbackFailureRequest.new(callback_id: callback_id, error: error)
        send_durable_execution_callback_failure(input)
      end

      def send_durable_execution_callback_failure(input : Types::SendDurableExecutionCallbackFailureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DURABLE_EXECUTION_CALLBACK_FAILURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a heartbeat signal for a long-running callback operation to prevent timeout. Use this API to
      # extend the callback timeout period while the external operation is still in progress.

      def send_durable_execution_callback_heartbeat(
        callback_id : String
      ) : Protocol::Request
        input = Types::SendDurableExecutionCallbackHeartbeatRequest.new(callback_id: callback_id)
        send_durable_execution_callback_heartbeat(input)
      end

      def send_durable_execution_callback_heartbeat(input : Types::SendDurableExecutionCallbackHeartbeatRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DURABLE_EXECUTION_CALLBACK_HEARTBEAT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a successful completion response for a callback operation in a durable execution. Use this API
      # when an external system has successfully completed a callback operation.

      def send_durable_execution_callback_success(
        callback_id : String,
        result : Bytes? = nil
      ) : Protocol::Request
        input = Types::SendDurableExecutionCallbackSuccessRequest.new(callback_id: callback_id, result: result)
        send_durable_execution_callback_success(input)
      end

      def send_durable_execution_callback_success(input : Types::SendDurableExecutionCallbackSuccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DURABLE_EXECUTION_CALLBACK_SUCCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a running durable execution . The execution transitions to STOPPED status and cannot be
      # resumed. Any in-progress operations are terminated.

      def stop_durable_execution(
        durable_execution_arn : String,
        error : Types::ErrorObject? = nil
      ) : Protocol::Request
        input = Types::StopDurableExecutionRequest.new(durable_execution_arn: durable_execution_arn, error: error)
        stop_durable_execution(input)
      end

      def stop_durable_execution(input : Types::StopDurableExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DURABLE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a function, event source mapping, or code signing configuration.

      def tag_resource(
        resource : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource: resource, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a function, event source mapping, or code signing configuration.

      def untag_resource(
        resource : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource: resource, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a Lambda function alias .

      def update_alias(
        function_name : String,
        name : String,
        description : String? = nil,
        function_version : String? = nil,
        revision_id : String? = nil,
        routing_config : Types::AliasRoutingConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAliasRequest.new(function_name: function_name, name: name, description: description, function_version: function_version, revision_id: revision_id, routing_config: routing_config)
        update_alias(input)
      end

      def update_alias(input : Types::UpdateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing capacity provider.

      def update_capacity_provider(
        capacity_provider_name : String,
        capacity_provider_scaling_config : Types::CapacityProviderScalingConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateCapacityProviderRequest.new(capacity_provider_name: capacity_provider_name, capacity_provider_scaling_config: capacity_provider_scaling_config)
        update_capacity_provider(input)
      end

      def update_capacity_provider(input : Types::UpdateCapacityProviderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAPACITY_PROVIDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the code signing configuration. Changes to the code signing configuration take effect the
      # next time a user tries to deploy a code package to the function.

      def update_code_signing_config(
        code_signing_config_arn : String,
        allowed_publishers : Types::AllowedPublishers? = nil,
        code_signing_policies : Types::CodeSigningPolicies? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCodeSigningConfigRequest.new(code_signing_config_arn: code_signing_config_arn, allowed_publishers: allowed_publishers, code_signing_policies: code_signing_policies, description: description)
        update_code_signing_config(input)
      end

      def update_code_signing_config(input : Types::UpdateCodeSigningConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CODE_SIGNING_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an event source mapping. You can change the function that Lambda invokes, or pause
      # invocation and resume later from the same location. For details about how to configure different
      # event sources, see the following topics. Amazon DynamoDB Streams Amazon Kinesis Amazon SQS Amazon MQ
      # and RabbitMQ Amazon MSK Apache Kafka Amazon DocumentDB The following error handling options are
      # available for stream sources (DynamoDB, Kinesis, Amazon MSK, and self-managed Apache Kafka):
      # BisectBatchOnFunctionError – If the function returns an error, split the batch in two and retry.
      # MaximumRecordAgeInSeconds – Discard records older than the specified age. The default value is
      # infinite (-1). When set to infinite (-1), failed records are retried until the record expires
      # MaximumRetryAttempts – Discard records after the specified number of retries. The default value is
      # infinite (-1). When set to infinite (-1), failed records are retried until the record expires.
      # OnFailure – Send discarded records to an Amazon SQS queue, Amazon SNS topic, Kafka topic, or Amazon
      # S3 bucket. For more information, see Adding a destination . The following option is available only
      # for DynamoDB and Kinesis event sources: ParallelizationFactor – Process multiple batches from each
      # shard concurrently. For information about which configuration parameters apply to each event source,
      # see the following topics. Amazon DynamoDB Streams Amazon Kinesis Amazon SQS Amazon MQ and RabbitMQ
      # Amazon MSK Apache Kafka Amazon DocumentDB

      def update_event_source_mapping(
        uuid : String,
        amazon_managed_kafka_event_source_config : Types::AmazonManagedKafkaEventSourceConfig? = nil,
        batch_size : Int32? = nil,
        bisect_batch_on_function_error : Bool? = nil,
        destination_config : Types::DestinationConfig? = nil,
        document_db_event_source_config : Types::DocumentDBEventSourceConfig? = nil,
        enabled : Bool? = nil,
        filter_criteria : Types::FilterCriteria? = nil,
        function_name : String? = nil,
        function_response_types : Array(String)? = nil,
        kms_key_arn : String? = nil,
        maximum_batching_window_in_seconds : Int32? = nil,
        maximum_record_age_in_seconds : Int32? = nil,
        maximum_retry_attempts : Int32? = nil,
        metrics_config : Types::EventSourceMappingMetricsConfig? = nil,
        parallelization_factor : Int32? = nil,
        provisioned_poller_config : Types::ProvisionedPollerConfig? = nil,
        scaling_config : Types::ScalingConfig? = nil,
        self_managed_kafka_event_source_config : Types::SelfManagedKafkaEventSourceConfig? = nil,
        source_access_configurations : Array(Types::SourceAccessConfiguration)? = nil,
        tumbling_window_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateEventSourceMappingRequest.new(uuid: uuid, amazon_managed_kafka_event_source_config: amazon_managed_kafka_event_source_config, batch_size: batch_size, bisect_batch_on_function_error: bisect_batch_on_function_error, destination_config: destination_config, document_db_event_source_config: document_db_event_source_config, enabled: enabled, filter_criteria: filter_criteria, function_name: function_name, function_response_types: function_response_types, kms_key_arn: kms_key_arn, maximum_batching_window_in_seconds: maximum_batching_window_in_seconds, maximum_record_age_in_seconds: maximum_record_age_in_seconds, maximum_retry_attempts: maximum_retry_attempts, metrics_config: metrics_config, parallelization_factor: parallelization_factor, provisioned_poller_config: provisioned_poller_config, scaling_config: scaling_config, self_managed_kafka_event_source_config: self_managed_kafka_event_source_config, source_access_configurations: source_access_configurations, tumbling_window_in_seconds: tumbling_window_in_seconds)
        update_event_source_mapping(input)
      end

      def update_event_source_mapping(input : Types::UpdateEventSourceMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_SOURCE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Lambda function's code. If code signing is enabled for the function, the code package must
      # be signed by a trusted publisher. For more information, see Configuring code signing for Lambda . If
      # the function's package type is Image , then you must specify the code package in ImageUri as the URI
      # of a container image in the Amazon ECR registry. If the function's package type is Zip , then you
      # must specify the deployment package as a .zip file archive . Enter the Amazon S3 bucket and key of
      # the code .zip file location. You can also provide the function code inline using the ZipFile field.
      # The code in the deployment package must be compatible with the target instruction set architecture
      # of the function ( x86-64 or arm64 ). The function's code is locked when you publish a version. You
      # can't modify the code of a published version, only the unpublished version. For a function defined
      # as a container image, Lambda resolves the image tag to an image digest. In Amazon ECR, if you update
      # the image tag to a new image, Lambda does not automatically update the function.

      def update_function_code(
        function_name : String,
        architectures : Array(String)? = nil,
        dry_run : Bool? = nil,
        image_uri : String? = nil,
        publish : Bool? = nil,
        publish_to : String? = nil,
        revision_id : String? = nil,
        s3_bucket : String? = nil,
        s3_key : String? = nil,
        s3_object_version : String? = nil,
        source_kms_key_arn : String? = nil,
        zip_file : Bytes? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionCodeRequest.new(function_name: function_name, architectures: architectures, dry_run: dry_run, image_uri: image_uri, publish: publish, publish_to: publish_to, revision_id: revision_id, s3_bucket: s3_bucket, s3_key: s3_key, s3_object_version: s3_object_version, source_kms_key_arn: source_kms_key_arn, zip_file: zip_file)
        update_function_code(input)
      end

      def update_function_code(input : Types::UpdateFunctionCodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION_CODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modify the version-specific settings of a Lambda function. When you update a function, Lambda
      # provisions an instance of the function and its supporting resources. If your function connects to a
      # VPC, this process can take a minute. During this time, you can't modify the function, but you can
      # still invoke it. The LastUpdateStatus , LastUpdateStatusReason , and LastUpdateStatusReasonCode
      # fields in the response from GetFunctionConfiguration indicate when the update is complete and the
      # function is processing events with the new configuration. For more information, see Lambda function
      # states . These settings can vary between versions of a function and are locked when you publish a
      # version. You can't modify the configuration of a published version, only the unpublished version. To
      # configure function concurrency, use PutFunctionConcurrency . To grant invoke permissions to an
      # Amazon Web Services account or Amazon Web Services service, use AddPermission .

      def update_function_configuration(
        function_name : String,
        capacity_provider_config : Types::CapacityProviderConfig? = nil,
        dead_letter_config : Types::DeadLetterConfig? = nil,
        description : String? = nil,
        durable_config : Types::DurableConfig? = nil,
        environment : Types::Environment? = nil,
        ephemeral_storage : Types::EphemeralStorage? = nil,
        file_system_configs : Array(Types::FileSystemConfig)? = nil,
        handler : String? = nil,
        image_config : Types::ImageConfig? = nil,
        kms_key_arn : String? = nil,
        layers : Array(String)? = nil,
        logging_config : Types::LoggingConfig? = nil,
        memory_size : Int32? = nil,
        revision_id : String? = nil,
        role : String? = nil,
        runtime : String? = nil,
        snap_start : Types::SnapStart? = nil,
        timeout : Int32? = nil,
        tracing_config : Types::TracingConfig? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionConfigurationRequest.new(function_name: function_name, capacity_provider_config: capacity_provider_config, dead_letter_config: dead_letter_config, description: description, durable_config: durable_config, environment: environment, ephemeral_storage: ephemeral_storage, file_system_configs: file_system_configs, handler: handler, image_config: image_config, kms_key_arn: kms_key_arn, layers: layers, logging_config: logging_config, memory_size: memory_size, revision_id: revision_id, role: role, runtime: runtime, snap_start: snap_start, timeout: timeout, tracing_config: tracing_config, vpc_config: vpc_config)
        update_function_configuration(input)
      end

      def update_function_configuration(input : Types::UpdateFunctionConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for asynchronous invocation for a function, version, or alias. To
      # configure options for asynchronous invocation, use PutFunctionEventInvokeConfig .

      def update_function_event_invoke_config(
        function_name : String,
        destination_config : Types::DestinationConfig? = nil,
        maximum_event_age_in_seconds : Int32? = nil,
        maximum_retry_attempts : Int32? = nil,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionEventInvokeConfigRequest.new(function_name: function_name, destination_config: destination_config, maximum_event_age_in_seconds: maximum_event_age_in_seconds, maximum_retry_attempts: maximum_retry_attempts, qualifier: qualifier)
        update_function_event_invoke_config(input)
      end

      def update_function_event_invoke_config(input : Types::UpdateFunctionEventInvokeConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION_EVENT_INVOKE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration for a Lambda function URL.

      def update_function_url_config(
        function_name : String,
        auth_type : String? = nil,
        cors : Types::Cors? = nil,
        invoke_mode : String? = nil,
        qualifier : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionUrlConfigRequest.new(function_name: function_name, auth_type: auth_type, cors: cors, invoke_mode: invoke_mode, qualifier: qualifier)
        update_function_url_config(input)
      end

      def update_function_url_config(input : Types::UpdateFunctionUrlConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION_URL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
