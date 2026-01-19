module AwsSdk
  module SFN
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

      # Creates an activity. An activity is a task that you write in any programming language and host on
      # any machine that has access to Step Functions. Activities must poll Step Functions using the
      # GetActivityTask API action and respond using SendTask* API actions. This function lets Step
      # Functions know the existence of your activity and returns an identifier for use in a state machine
      # and when polling from the activity. This operation is eventually consistent. The results are best
      # effort and may not reflect very recent updates and changes. CreateActivity is an idempotent API.
      # Subsequent requests won’t create a duplicate resource if it was already created. CreateActivity 's
      # idempotency check is based on the activity name . If a following request has different tags values,
      # Step Functions will ignore these differences and treat it as an idempotent request of the previous.
      # In this case, tags will not be updated, even if they are different.
      def create_activity(
        name : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateActivityOutput
        input = Types::CreateActivityInput.new(name: name, encryption_configuration: encryption_configuration, tags: tags)
        create_activity(input)
      end
      def create_activity(input : Types::CreateActivityInput) : Types::CreateActivityOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACTIVITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateActivityOutput, "CreateActivity")
      end

      # Creates a state machine. A state machine consists of a collection of states that can do work ( Task
      # states), determine to which states to transition next ( Choice states), stop an execution with an
      # error ( Fail states), and so on. State machines are specified using a JSON-based, structured
      # language. For more information, see Amazon States Language in the Step Functions User Guide. If you
      # set the publish parameter of this API action to true , it publishes version 1 as the first revision
      # of the state machine. For additional control over security, you can encrypt your data using a
      # customer-managed key for Step Functions state machines. You can configure a symmetric KMS key and
      # data key reuse period when creating or updating a State Machine . The execution history and state
      # machine definition will be encrypted with the key applied to the State Machine. This operation is
      # eventually consistent. The results are best effort and may not reflect very recent updates and
      # changes. CreateStateMachine is an idempotent API. Subsequent requests won’t create a duplicate
      # resource if it was already created. CreateStateMachine 's idempotency check is based on the state
      # machine name , definition , type , LoggingConfiguration , TracingConfiguration , and
      # EncryptionConfiguration The check is also based on the publish and versionDescription parameters. If
      # a following request has a different roleArn or tags , Step Functions will ignore these differences
      # and treat it as an idempotent request of the previous. In this case, roleArn and tags will not be
      # updated, even if they are different.
      def create_state_machine(
        definition : String,
        name : String,
        role_arn : String,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        logging_configuration : Types::LoggingConfiguration? = nil,
        publish : Bool? = nil,
        tags : Array(Types::Tag)? = nil,
        tracing_configuration : Types::TracingConfiguration? = nil,
        type : String? = nil,
        version_description : String? = nil
      ) : Types::CreateStateMachineOutput
        input = Types::CreateStateMachineInput.new(definition: definition, name: name, role_arn: role_arn, encryption_configuration: encryption_configuration, logging_configuration: logging_configuration, publish: publish, tags: tags, tracing_configuration: tracing_configuration, type: type, version_description: version_description)
        create_state_machine(input)
      end
      def create_state_machine(input : Types::CreateStateMachineInput) : Types::CreateStateMachineOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_STATE_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStateMachineOutput, "CreateStateMachine")
      end

      # Creates an alias for a state machine that points to one or two versions of the same state machine.
      # You can set your application to call StartExecution with an alias and update the version the alias
      # uses without changing the client's code. You can also map an alias to split StartExecution requests
      # between two versions of a state machine. To do this, add a second RoutingConfig object in the
      # routingConfiguration parameter. You must also specify the percentage of execution run requests each
      # version should receive in both RoutingConfig objects. Step Functions randomly chooses which version
      # runs a given execution based on the percentage you specify. To create an alias that points to a
      # single version, specify a single RoutingConfig object with a weight set to 100. You can create up to
      # 100 aliases for each state machine. You must delete unused aliases using the DeleteStateMachineAlias
      # API action. CreateStateMachineAlias is an idempotent API. Step Functions bases the idempotency check
      # on the stateMachineArn , description , name , and routingConfiguration parameters. Requests that
      # contain the same values for these parameters return a successful idempotent response without
      # creating a duplicate resource. Related operations: DescribeStateMachineAlias ListStateMachineAliases
      # UpdateStateMachineAlias DeleteStateMachineAlias
      def create_state_machine_alias(
        name : String,
        routing_configuration : Array(Types::RoutingConfigurationListItem),
        description : String? = nil
      ) : Types::CreateStateMachineAliasOutput
        input = Types::CreateStateMachineAliasInput.new(name: name, routing_configuration: routing_configuration, description: description)
        create_state_machine_alias(input)
      end
      def create_state_machine_alias(input : Types::CreateStateMachineAliasInput) : Types::CreateStateMachineAliasOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_STATE_MACHINE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStateMachineAliasOutput, "CreateStateMachineAlias")
      end

      # Deletes an activity.
      def delete_activity(
        activity_arn : String
      ) : Types::DeleteActivityOutput
        input = Types::DeleteActivityInput.new(activity_arn: activity_arn)
        delete_activity(input)
      end
      def delete_activity(input : Types::DeleteActivityInput) : Types::DeleteActivityOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACTIVITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteActivityOutput, "DeleteActivity")
      end

      # Deletes a state machine. This is an asynchronous operation. It sets the state machine's status to
      # DELETING and begins the deletion process. A state machine is deleted only when all its executions
      # are completed. On the next state transition, the state machine's executions are terminated. A
      # qualified state machine ARN can either refer to a Distributed Map state defined within a state
      # machine, a version ARN, or an alias ARN. The following are some examples of qualified and
      # unqualified state machine ARNs: The following qualified state machine ARN refers to a Distributed
      # Map state with a label mapStateLabel in a state machine named myStateMachine .
      # arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel If you provide a
      # qualified state machine ARN that refers to a Distributed Map state , the request fails with
      # ValidationException . The following unqualified state machine ARN refers to a state machine named
      # myStateMachine . arn:partition:states:region:account-id:stateMachine:myStateMachine This API action
      # also deletes all versions and aliases associated with a state machine. For EXPRESS state machines,
      # the deletion happens eventually (usually in less than a minute). Running executions may emit logs
      # after DeleteStateMachine API is called.
      def delete_state_machine(
        state_machine_arn : String
      ) : Types::DeleteStateMachineOutput
        input = Types::DeleteStateMachineInput.new(state_machine_arn: state_machine_arn)
        delete_state_machine(input)
      end
      def delete_state_machine(input : Types::DeleteStateMachineInput) : Types::DeleteStateMachineOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_STATE_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStateMachineOutput, "DeleteStateMachine")
      end

      # Deletes a state machine alias . After you delete a state machine alias, you can't use it to start
      # executions. When you delete a state machine alias, Step Functions doesn't delete the state machine
      # versions that alias references. Related operations: CreateStateMachineAlias
      # DescribeStateMachineAlias ListStateMachineAliases UpdateStateMachineAlias
      def delete_state_machine_alias(
        state_machine_alias_arn : String
      ) : Types::DeleteStateMachineAliasOutput
        input = Types::DeleteStateMachineAliasInput.new(state_machine_alias_arn: state_machine_alias_arn)
        delete_state_machine_alias(input)
      end
      def delete_state_machine_alias(input : Types::DeleteStateMachineAliasInput) : Types::DeleteStateMachineAliasOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_STATE_MACHINE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStateMachineAliasOutput, "DeleteStateMachineAlias")
      end

      # Deletes a state machine version . After you delete a version, you can't call StartExecution using
      # that version's ARN or use the version with a state machine alias . Deleting a state machine version
      # won't terminate its in-progress executions. You can't delete a state machine version currently
      # referenced by one or more aliases. Before you delete a version, you must either delete the aliases
      # or update them to point to another state machine version. Related operations:
      # PublishStateMachineVersion ListStateMachineVersions
      def delete_state_machine_version(
        state_machine_version_arn : String
      ) : Types::DeleteStateMachineVersionOutput
        input = Types::DeleteStateMachineVersionInput.new(state_machine_version_arn: state_machine_version_arn)
        delete_state_machine_version(input)
      end
      def delete_state_machine_version(input : Types::DeleteStateMachineVersionInput) : Types::DeleteStateMachineVersionOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_STATE_MACHINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStateMachineVersionOutput, "DeleteStateMachineVersion")
      end

      # Describes an activity. This operation is eventually consistent. The results are best effort and may
      # not reflect very recent updates and changes.
      def describe_activity(
        activity_arn : String
      ) : Types::DescribeActivityOutput
        input = Types::DescribeActivityInput.new(activity_arn: activity_arn)
        describe_activity(input)
      end
      def describe_activity(input : Types::DescribeActivityInput) : Types::DescribeActivityOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACTIVITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeActivityOutput, "DescribeActivity")
      end

      # Provides information about a state machine execution, such as the state machine associated with the
      # execution, the execution input and output, and relevant execution metadata. If you've redriven an
      # execution, you can use this API action to return information about the redrives of that execution.
      # In addition, you can use this API action to return the Map Run Amazon Resource Name (ARN) if the
      # execution was dispatched by a Map Run. If you specify a version or alias ARN when you call the
      # StartExecution API action, DescribeExecution returns that ARN. This operation is eventually
      # consistent. The results are best effort and may not reflect very recent updates and changes.
      # Executions of an EXPRESS state machine aren't supported by DescribeExecution unless a Map Run
      # dispatched them.
      def describe_execution(
        execution_arn : String,
        included_data : String? = nil
      ) : Types::DescribeExecutionOutput
        input = Types::DescribeExecutionInput.new(execution_arn: execution_arn, included_data: included_data)
        describe_execution(input)
      end
      def describe_execution(input : Types::DescribeExecutionInput) : Types::DescribeExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExecutionOutput, "DescribeExecution")
      end

      # Provides information about a Map Run's configuration, progress, and results. If you've redriven a
      # Map Run, this API action also returns information about the redrives of that Map Run. For more
      # information, see Examining Map Run in the Step Functions Developer Guide .
      def describe_map_run(
        map_run_arn : String
      ) : Types::DescribeMapRunOutput
        input = Types::DescribeMapRunInput.new(map_run_arn: map_run_arn)
        describe_map_run(input)
      end
      def describe_map_run(input : Types::DescribeMapRunInput) : Types::DescribeMapRunOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAP_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMapRunOutput, "DescribeMapRun")
      end

      # Provides information about a state machine's definition, its IAM role Amazon Resource Name (ARN),
      # and configuration. A qualified state machine ARN can either refer to a Distributed Map state defined
      # within a state machine, a version ARN, or an alias ARN. The following are some examples of qualified
      # and unqualified state machine ARNs: The following qualified state machine ARN refers to a
      # Distributed Map state with a label mapStateLabel in a state machine named myStateMachine .
      # arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel If you provide a
      # qualified state machine ARN that refers to a Distributed Map state , the request fails with
      # ValidationException . The following qualified state machine ARN refers to an alias named PROD .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine:PROD&gt;
      # If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the
      # request starts execution for that version or alias. The following unqualified state machine ARN
      # refers to a state machine named myStateMachine .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine&gt;
      # This API action returns the details for a state machine version if the stateMachineArn you specify
      # is a state machine version ARN. This operation is eventually consistent. The results are best effort
      # and may not reflect very recent updates and changes.
      def describe_state_machine(
        state_machine_arn : String,
        included_data : String? = nil
      ) : Types::DescribeStateMachineOutput
        input = Types::DescribeStateMachineInput.new(state_machine_arn: state_machine_arn, included_data: included_data)
        describe_state_machine(input)
      end
      def describe_state_machine(input : Types::DescribeStateMachineInput) : Types::DescribeStateMachineOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STATE_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStateMachineOutput, "DescribeStateMachine")
      end

      # Returns details about a state machine alias . Related operations: CreateStateMachineAlias
      # ListStateMachineAliases UpdateStateMachineAlias DeleteStateMachineAlias
      def describe_state_machine_alias(
        state_machine_alias_arn : String
      ) : Types::DescribeStateMachineAliasOutput
        input = Types::DescribeStateMachineAliasInput.new(state_machine_alias_arn: state_machine_alias_arn)
        describe_state_machine_alias(input)
      end
      def describe_state_machine_alias(input : Types::DescribeStateMachineAliasInput) : Types::DescribeStateMachineAliasOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STATE_MACHINE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStateMachineAliasOutput, "DescribeStateMachineAlias")
      end

      # Provides information about a state machine's definition, its execution role ARN, and configuration.
      # If a Map Run dispatched the execution, this action returns the Map Run Amazon Resource Name (ARN) in
      # the response. The state machine returned is the state machine associated with the Map Run. This
      # operation is eventually consistent. The results are best effort and may not reflect very recent
      # updates and changes. This API action is not supported by EXPRESS state machines.
      def describe_state_machine_for_execution(
        execution_arn : String,
        included_data : String? = nil
      ) : Types::DescribeStateMachineForExecutionOutput
        input = Types::DescribeStateMachineForExecutionInput.new(execution_arn: execution_arn, included_data: included_data)
        describe_state_machine_for_execution(input)
      end
      def describe_state_machine_for_execution(input : Types::DescribeStateMachineForExecutionInput) : Types::DescribeStateMachineForExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STATE_MACHINE_FOR_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStateMachineForExecutionOutput, "DescribeStateMachineForExecution")
      end

      # Used by workers to retrieve a task (with the specified activity ARN) which has been scheduled for
      # execution by a running state machine. This initiates a long poll, where the service holds the HTTP
      # connection open and responds as soon as a task becomes available (i.e. an execution of a task of
      # this type is needed.) The maximum time the service holds on to the request before responding is 60
      # seconds. If no task is available within 60 seconds, the poll returns a taskToken with a null string.
      # This API action isn't logged in CloudTrail. Workers should set their client side socket timeout to
      # at least 65 seconds (5 seconds higher than the maximum time the service may hold the poll request).
      # Polling with GetActivityTask can cause latency in some implementations. See Avoid Latency When
      # Polling for Activity Tasks in the Step Functions Developer Guide.
      def get_activity_task(
        activity_arn : String,
        worker_name : String? = nil
      ) : Types::GetActivityTaskOutput
        input = Types::GetActivityTaskInput.new(activity_arn: activity_arn, worker_name: worker_name)
        get_activity_task(input)
      end
      def get_activity_task(input : Types::GetActivityTaskInput) : Types::GetActivityTaskOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ACTIVITY_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetActivityTaskOutput, "GetActivityTask")
      end

      # Returns the history of the specified execution as a list of events. By default, the results are
      # returned in ascending order of the timeStamp of the events. Use the reverseOrder parameter to get
      # the latest events first. If nextToken is returned, there are more results available. The value of
      # nextToken is a unique pagination token for each page. Make the call again using the returned token
      # to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after
      # 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This API
      # action is not supported by EXPRESS state machines.
      def get_execution_history(
        execution_arn : String,
        include_execution_data : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::GetExecutionHistoryOutput
        input = Types::GetExecutionHistoryInput.new(execution_arn: execution_arn, include_execution_data: include_execution_data, max_results: max_results, next_token: next_token, reverse_order: reverse_order)
        get_execution_history(input)
      end
      def get_execution_history(input : Types::GetExecutionHistoryInput) : Types::GetExecutionHistoryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_EXECUTION_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExecutionHistoryOutput, "GetExecutionHistory")
      end

      # Lists the existing activities. If nextToken is returned, there are more results available. The value
      # of nextToken is a unique pagination token for each page. Make the call again using the returned
      # token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires
      # after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error. This
      # operation is eventually consistent. The results are best effort and may not reflect very recent
      # updates and changes.
      def list_activities(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListActivitiesOutput
        input = Types::ListActivitiesInput.new(max_results: max_results, next_token: next_token)
        list_activities(input)
      end
      def list_activities(input : Types::ListActivitiesInput) : Types::ListActivitiesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTIVITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListActivitiesOutput, "ListActivities")
      end

      # Lists all executions of a state machine or a Map Run. You can list all executions related to a state
      # machine by specifying a state machine Amazon Resource Name (ARN), or those related to a Map Run by
      # specifying a Map Run ARN. Using this API action, you can also list all redriven executions. You can
      # also provide a state machine alias ARN or version ARN to list the executions associated with a
      # specific alias or version. Results are sorted by time, with the most recent execution first. If
      # nextToken is returned, there are more results available. The value of nextToken is a unique
      # pagination token for each page. Make the call again using the returned token to retrieve the next
      # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
      # expired pagination token will return an HTTP 400 InvalidToken error. This operation is eventually
      # consistent. The results are best effort and may not reflect very recent updates and changes. This
      # API action is not supported by EXPRESS state machines.
      def list_executions(
        map_run_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        redrive_filter : String? = nil,
        state_machine_arn : String? = nil,
        status_filter : String? = nil
      ) : Types::ListExecutionsOutput
        input = Types::ListExecutionsInput.new(map_run_arn: map_run_arn, max_results: max_results, next_token: next_token, redrive_filter: redrive_filter, state_machine_arn: state_machine_arn, status_filter: status_filter)
        list_executions(input)
      end
      def list_executions(input : Types::ListExecutionsInput) : Types::ListExecutionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExecutionsOutput, "ListExecutions")
      end

      # Lists all Map Runs that were started by a given state machine execution. Use this API action to
      # obtain Map Run ARNs, and then call DescribeMapRun to obtain more information, if needed.
      def list_map_runs(
        execution_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMapRunsOutput
        input = Types::ListMapRunsInput.new(execution_arn: execution_arn, max_results: max_results, next_token: next_token)
        list_map_runs(input)
      end
      def list_map_runs(input : Types::ListMapRunsInput) : Types::ListMapRunsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_MAP_RUNS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMapRunsOutput, "ListMapRuns")
      end

      # Lists aliases for a specified state machine ARN. Results are sorted by time, with the most recently
      # created aliases listed first. To list aliases that reference a state machine version , you can
      # specify the version ARN in the stateMachineArn parameter. If nextToken is returned, there are more
      # results available. The value of nextToken is a unique pagination token for each page. Make the call
      # again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each
      # pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400
      # InvalidToken error. Related operations: CreateStateMachineAlias DescribeStateMachineAlias
      # UpdateStateMachineAlias DeleteStateMachineAlias
      def list_state_machine_aliases(
        state_machine_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStateMachineAliasesOutput
        input = Types::ListStateMachineAliasesInput.new(state_machine_arn: state_machine_arn, max_results: max_results, next_token: next_token)
        list_state_machine_aliases(input)
      end
      def list_state_machine_aliases(input : Types::ListStateMachineAliasesInput) : Types::ListStateMachineAliasesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STATE_MACHINE_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStateMachineAliasesOutput, "ListStateMachineAliases")
      end

      # Lists versions for the specified state machine Amazon Resource Name (ARN). The results are sorted in
      # descending order of the version creation time. If nextToken is returned, there are more results
      # available. The value of nextToken is a unique pagination token for each page. Make the call again
      # using the returned token to retrieve the next page. Keep all other arguments unchanged. Each
      # pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400
      # InvalidToken error. Related operations: PublishStateMachineVersion DeleteStateMachineVersion
      def list_state_machine_versions(
        state_machine_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStateMachineVersionsOutput
        input = Types::ListStateMachineVersionsInput.new(state_machine_arn: state_machine_arn, max_results: max_results, next_token: next_token)
        list_state_machine_versions(input)
      end
      def list_state_machine_versions(input : Types::ListStateMachineVersionsInput) : Types::ListStateMachineVersionsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STATE_MACHINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStateMachineVersionsOutput, "ListStateMachineVersions")
      end

      # Lists the existing state machines. If nextToken is returned, there are more results available. The
      # value of nextToken is a unique pagination token for each page. Make the call again using the
      # returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token
      # expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken
      # error. This operation is eventually consistent. The results are best effort and may not reflect very
      # recent updates and changes.
      def list_state_machines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStateMachinesOutput
        input = Types::ListStateMachinesInput.new(max_results: max_results, next_token: next_token)
        list_state_machines(input)
      end
      def list_state_machines(input : Types::ListStateMachinesInput) : Types::ListStateMachinesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_STATE_MACHINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStateMachinesOutput, "ListStateMachines")
      end

      # List tags for a given resource. Tags may only contain Unicode letters, digits, white space, or these
      # symbols: _ . : / = + - @ .
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Creates a version from the current revision of a state machine. Use versions to create immutable
      # snapshots of your state machine. You can start executions from versions either directly or with an
      # alias. To create an alias, use CreateStateMachineAlias . You can publish up to 1000 versions for
      # each state machine. You must manually delete unused versions using the DeleteStateMachineVersion API
      # action. PublishStateMachineVersion is an idempotent API. It doesn't create a duplicate state machine
      # version if it already exists for the current revision. Step Functions bases
      # PublishStateMachineVersion 's idempotency check on the stateMachineArn , name , and revisionId
      # parameters. Requests with the same parameters return a successful idempotent response. If you don't
      # specify a revisionId , Step Functions checks for a previously published version of the state
      # machine's current revision. Related operations: DeleteStateMachineVersion ListStateMachineVersions
      def publish_state_machine_version(
        state_machine_arn : String,
        description : String? = nil,
        revision_id : String? = nil
      ) : Types::PublishStateMachineVersionOutput
        input = Types::PublishStateMachineVersionInput.new(state_machine_arn: state_machine_arn, description: description, revision_id: revision_id)
        publish_state_machine_version(input)
      end
      def publish_state_machine_version(input : Types::PublishStateMachineVersionInput) : Types::PublishStateMachineVersionOutput
        request = Protocol::JsonRpc.build_request(Model::PUBLISH_STATE_MACHINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PublishStateMachineVersionOutput, "PublishStateMachineVersion")
      end

      # Restarts unsuccessful executions of Standard workflows that didn't complete successfully in the last
      # 14 days. These include failed, aborted, or timed out executions. When you redrive an execution, it
      # continues the failed execution from the unsuccessful step and uses the same input. Step Functions
      # preserves the results and execution history of the successful steps, and doesn't rerun these steps
      # when you redrive an execution. Redriven executions use the same state machine definition and
      # execution ARN as the original execution attempt. For workflows that include an Inline Map or
      # Parallel state, RedriveExecution API action reschedules and redrives only the iterations and
      # branches that failed or aborted. To redrive a workflow that includes a Distributed Map state whose
      # Map Run failed, you must redrive the parent workflow . The parent workflow redrives all the
      # unsuccessful states, including a failed Map Run. If a Map Run was not started in the original
      # execution attempt, the redriven parent workflow starts the Map Run. This API action is not supported
      # by EXPRESS state machines. However, you can restart the unsuccessful executions of Express child
      # workflows in a Distributed Map by redriving its Map Run. When you redrive a Map Run, the Express
      # child workflows are rerun using the StartExecution API action. For more information, see Redriving
      # Map Runs . You can redrive executions if your original execution meets the following conditions: The
      # execution status isn't SUCCEEDED . Your workflow execution has not exceeded the redrivable period of
      # 14 days. Redrivable period refers to the time during which you can redrive a given execution. This
      # period starts from the day a state machine completes its execution. The workflow execution has not
      # exceeded the maximum open time of one year. For more information about state machine quotas, see
      # Quotas related to state machine executions . The execution event history count is less than 24,999.
      # Redriven executions append their event history to the existing event history. Make sure your
      # workflow execution contains less than 24,999 events to accommodate the ExecutionRedriven history
      # event and at least one other history event.
      def redrive_execution(
        execution_arn : String,
        client_token : String? = nil
      ) : Types::RedriveExecutionOutput
        input = Types::RedriveExecutionInput.new(execution_arn: execution_arn, client_token: client_token)
        redrive_execution(input)
      end
      def redrive_execution(input : Types::RedriveExecutionInput) : Types::RedriveExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::REDRIVE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RedriveExecutionOutput, "RedriveExecution")
      end

      # Used by activity workers, Task states using the callback pattern, and optionally Task states using
      # the job run pattern to report that the task identified by the taskToken failed. For an execution
      # with encryption enabled, Step Functions will encrypt the error and cause fields using the KMS key
      # for the execution role. A caller can mark a task as fail without using any KMS permissions in the
      # execution role if the caller provides a null value for both error and cause fields because no data
      # needs to be encrypted.
      def send_task_failure(
        task_token : String,
        cause : String? = nil,
        error : String? = nil
      ) : Types::SendTaskFailureOutput
        input = Types::SendTaskFailureInput.new(task_token: task_token, cause: cause, error: error)
        send_task_failure(input)
      end
      def send_task_failure(input : Types::SendTaskFailureInput) : Types::SendTaskFailureOutput
        request = Protocol::JsonRpc.build_request(Model::SEND_TASK_FAILURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendTaskFailureOutput, "SendTaskFailure")
      end

      # Used by activity workers and Task states using the callback pattern, and optionally Task states
      # using the job run pattern to report to Step Functions that the task represented by the specified
      # taskToken is still making progress. This action resets the Heartbeat clock. The Heartbeat threshold
      # is specified in the state machine's Amazon States Language definition ( HeartbeatSeconds ). This
      # action does not in itself create an event in the execution history. However, if the task times out,
      # the execution history contains an ActivityTimedOut entry for activities, or a TaskTimedOut entry for
      # tasks using the job run or callback pattern. The Timeout of a task, defined in the state machine's
      # Amazon States Language definition, is its maximum allowed duration, regardless of the number of
      # SendTaskHeartbeat requests received. Use HeartbeatSeconds to configure the timeout interval for
      # heartbeats.
      def send_task_heartbeat(
        task_token : String
      ) : Types::SendTaskHeartbeatOutput
        input = Types::SendTaskHeartbeatInput.new(task_token: task_token)
        send_task_heartbeat(input)
      end
      def send_task_heartbeat(input : Types::SendTaskHeartbeatInput) : Types::SendTaskHeartbeatOutput
        request = Protocol::JsonRpc.build_request(Model::SEND_TASK_HEARTBEAT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendTaskHeartbeatOutput, "SendTaskHeartbeat")
      end

      # Used by activity workers, Task states using the callback pattern, and optionally Task states using
      # the job run pattern to report that the task identified by the taskToken completed successfully.
      def send_task_success(
        output : String,
        task_token : String
      ) : Types::SendTaskSuccessOutput
        input = Types::SendTaskSuccessInput.new(output: output, task_token: task_token)
        send_task_success(input)
      end
      def send_task_success(input : Types::SendTaskSuccessInput) : Types::SendTaskSuccessOutput
        request = Protocol::JsonRpc.build_request(Model::SEND_TASK_SUCCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendTaskSuccessOutput, "SendTaskSuccess")
      end

      # Starts a state machine execution. A qualified state machine ARN can either refer to a Distributed
      # Map state defined within a state machine, a version ARN, or an alias ARN. The following are some
      # examples of qualified and unqualified state machine ARNs: The following qualified state machine ARN
      # refers to a Distributed Map state with a label mapStateLabel in a state machine named myStateMachine
      # . arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel If you provide a
      # qualified state machine ARN that refers to a Distributed Map state , the request fails with
      # ValidationException . The following qualified state machine ARN refers to an alias named PROD .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine:PROD&gt;
      # If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the
      # request starts execution for that version or alias. The following unqualified state machine ARN
      # refers to a state machine named myStateMachine .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine&gt;
      # If you start an execution with an unqualified state machine ARN, Step Functions uses the latest
      # revision of the state machine for the execution. To start executions of a state machine version ,
      # call StartExecution and provide the version ARN or the ARN of an alias that points to the version.
      # StartExecution is idempotent for STANDARD workflows. For a STANDARD workflow, if you call
      # StartExecution with the same name and input as a running execution, the call succeeds and return the
      # same response as the original request. If the execution is closed or if the input is different, it
      # returns a 400 ExecutionAlreadyExists error. You can reuse names after 90 days. StartExecution isn't
      # idempotent for EXPRESS workflows.
      def start_execution(
        state_machine_arn : String,
        input : String? = nil,
        name : String? = nil,
        trace_header : String? = nil
      ) : Types::StartExecutionOutput
        input = Types::StartExecutionInput.new(state_machine_arn: state_machine_arn, input: input, name: name, trace_header: trace_header)
        start_execution(input)
      end
      def start_execution(input : Types::StartExecutionInput) : Types::StartExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExecutionOutput, "StartExecution")
      end

      # Starts a Synchronous Express state machine execution. StartSyncExecution is not available for
      # STANDARD workflows. StartSyncExecution will return a 200 OK response, even if your execution fails,
      # because the status code in the API response doesn't reflect function errors. Error codes are
      # reserved for errors that prevent your execution from running, such as permissions errors, limit
      # errors, or issues with your state machine code and configuration. This API action isn't logged in
      # CloudTrail.
      def start_sync_execution(
        state_machine_arn : String,
        included_data : String? = nil,
        input : String? = nil,
        name : String? = nil,
        trace_header : String? = nil
      ) : Types::StartSyncExecutionOutput
        input = Types::StartSyncExecutionInput.new(state_machine_arn: state_machine_arn, included_data: included_data, input: input, name: name, trace_header: trace_header)
        start_sync_execution(input)
      end
      def start_sync_execution(input : Types::StartSyncExecutionInput) : Types::StartSyncExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::START_SYNC_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSyncExecutionOutput, "StartSyncExecution")
      end

      # Stops an execution. This API action is not supported by EXPRESS state machines. For an execution
      # with encryption enabled, Step Functions will encrypt the error and cause fields using the KMS key
      # for the execution role. A caller can stop an execution without using any KMS permissions in the
      # execution role if the caller provides a null value for both error and cause fields because no data
      # needs to be encrypted.
      def stop_execution(
        execution_arn : String,
        cause : String? = nil,
        error : String? = nil
      ) : Types::StopExecutionOutput
        input = Types::StopExecutionInput.new(execution_arn: execution_arn, cause: cause, error: error)
        stop_execution(input)
      end
      def stop_execution(input : Types::StopExecutionInput) : Types::StopExecutionOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopExecutionOutput, "StopExecution")
      end

      # Add a tag to a Step Functions resource. An array of key-value pairs. For more information, see Using
      # Cost Allocation Tags in the Amazon Web Services Billing and Cost Management User Guide , and
      # Controlling Access Using IAM Tags . Tags may only contain Unicode letters, digits, white space, or
      # these symbols: _ . : / = + - @ .
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Accepts the definition of a single state and executes it. You can test a state without creating a
      # state machine or updating an existing state machine. Using this API, you can test the following: A
      # state's input and output processing data flow An Amazon Web Services service integration request and
      # response An HTTP Task request and response You can call this API on only one state at a time. The
      # states that you can test include the following: All Task types except Activity Pass Wait Choice
      # Succeed Fail The TestState API assumes an IAM role which must contain the required IAM permissions
      # for the resources your state is accessing. For information about the permissions a state might need,
      # see IAM permissions to test a state . The TestState API can run for up to five minutes. If the
      # execution of a state exceeds this duration, it fails with the States.Timeout error. TestState only
      # supports the following when a mock is specified: Activity tasks , .sync or .waitForTaskToken service
      # integration patterns , Parallel , or Map states.
      def test_state(
        definition : String,
        context : String? = nil,
        input : String? = nil,
        inspection_level : String? = nil,
        mock : Types::MockInput? = nil,
        reveal_secrets : Bool? = nil,
        role_arn : String? = nil,
        state_configuration : Types::TestStateConfiguration? = nil,
        state_name : String? = nil,
        variables : String? = nil
      ) : Types::TestStateOutput
        input = Types::TestStateInput.new(definition: definition, context: context, input: input, inspection_level: inspection_level, mock: mock, reveal_secrets: reveal_secrets, role_arn: role_arn, state_configuration: state_configuration, state_name: state_name, variables: variables)
        test_state(input)
      end
      def test_state(input : Types::TestStateInput) : Types::TestStateOutput
        request = Protocol::JsonRpc.build_request(Model::TEST_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestStateOutput, "TestState")
      end

      # Remove a tag from a Step Functions resource
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates an in-progress Map Run's configuration to include changes to the settings that control
      # maximum concurrency and Map Run failure.
      def update_map_run(
        map_run_arn : String,
        max_concurrency : Int32? = nil,
        tolerated_failure_count : Int64? = nil,
        tolerated_failure_percentage : Float64? = nil
      ) : Types::UpdateMapRunOutput
        input = Types::UpdateMapRunInput.new(map_run_arn: map_run_arn, max_concurrency: max_concurrency, tolerated_failure_count: tolerated_failure_count, tolerated_failure_percentage: tolerated_failure_percentage)
        update_map_run(input)
      end
      def update_map_run(input : Types::UpdateMapRunInput) : Types::UpdateMapRunOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAP_RUN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMapRunOutput, "UpdateMapRun")
      end

      # Updates an existing state machine by modifying its definition , roleArn , loggingConfiguration , or
      # EncryptionConfiguration . Running executions will continue to use the previous definition and
      # roleArn . You must include at least one of definition or roleArn or you will receive a
      # MissingRequiredParameter error. A qualified state machine ARN refers to a Distributed Map state
      # defined within a state machine. For example, the qualified state machine ARN
      # arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel refers to a
      # Distributed Map state with a label mapStateLabel in the state machine named stateMachineName . A
      # qualified state machine ARN can either refer to a Distributed Map state defined within a state
      # machine, a version ARN, or an alias ARN. The following are some examples of qualified and
      # unqualified state machine ARNs: The following qualified state machine ARN refers to a Distributed
      # Map state with a label mapStateLabel in a state machine named myStateMachine .
      # arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel If you provide a
      # qualified state machine ARN that refers to a Distributed Map state , the request fails with
      # ValidationException . The following qualified state machine ARN refers to an alias named PROD .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine:PROD&gt;
      # If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the
      # request starts execution for that version or alias. The following unqualified state machine ARN
      # refers to a state machine named myStateMachine .
      # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine&gt;
      # After you update your state machine, you can set the publish parameter to true in the same action to
      # publish a new version . This way, you can opt-in to strict versioning of your state machine. Step
      # Functions assigns monotonically increasing integers for state machine versions, starting at version
      # number 1. All StartExecution calls within a few seconds use the updated definition and roleArn .
      # Executions started immediately after you call UpdateStateMachine may use the previous state machine
      # definition and roleArn .
      def update_state_machine(
        state_machine_arn : String,
        definition : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        logging_configuration : Types::LoggingConfiguration? = nil,
        publish : Bool? = nil,
        role_arn : String? = nil,
        tracing_configuration : Types::TracingConfiguration? = nil,
        version_description : String? = nil
      ) : Types::UpdateStateMachineOutput
        input = Types::UpdateStateMachineInput.new(state_machine_arn: state_machine_arn, definition: definition, encryption_configuration: encryption_configuration, logging_configuration: logging_configuration, publish: publish, role_arn: role_arn, tracing_configuration: tracing_configuration, version_description: version_description)
        update_state_machine(input)
      end
      def update_state_machine(input : Types::UpdateStateMachineInput) : Types::UpdateStateMachineOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STATE_MACHINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStateMachineOutput, "UpdateStateMachine")
      end

      # Updates the configuration of an existing state machine alias by modifying its description or
      # routingConfiguration . You must specify at least one of the description or routingConfiguration
      # parameters to update a state machine alias. UpdateStateMachineAlias is an idempotent API. Step
      # Functions bases the idempotency check on the stateMachineAliasArn , description , and
      # routingConfiguration parameters. Requests with the same parameters return an idempotent response.
      # This operation is eventually consistent. All StartExecution requests made within a few seconds use
      # the latest alias configuration. Executions started immediately after calling UpdateStateMachineAlias
      # may use the previous routing configuration. Related operations: CreateStateMachineAlias
      # DescribeStateMachineAlias ListStateMachineAliases DeleteStateMachineAlias
      def update_state_machine_alias(
        state_machine_alias_arn : String,
        description : String? = nil,
        routing_configuration : Array(Types::RoutingConfigurationListItem)? = nil
      ) : Types::UpdateStateMachineAliasOutput
        input = Types::UpdateStateMachineAliasInput.new(state_machine_alias_arn: state_machine_alias_arn, description: description, routing_configuration: routing_configuration)
        update_state_machine_alias(input)
      end
      def update_state_machine_alias(input : Types::UpdateStateMachineAliasInput) : Types::UpdateStateMachineAliasOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STATE_MACHINE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStateMachineAliasOutput, "UpdateStateMachineAlias")
      end

      # Validates the syntax of a state machine definition specified in Amazon States Language (ASL), a
      # JSON-based, structured language. You can validate that a state machine definition is correct without
      # creating a state machine resource. Suggested uses for ValidateStateMachineDefinition : Integrate
      # automated checks into your code review or Continuous Integration (CI) process to check state machine
      # definitions before starting deployments. Run validation from a Git pre-commit hook to verify the
      # definition before committing to your source repository. Validation will look for problems in your
      # state machine definition and return a result and a list of diagnostic elements . The result value
      # will be OK when your workflow definition can be successfully created or updated. Note the result can
      # be OK even when diagnostic warnings are present in the response. The result value will be FAIL when
      # the workflow definition contains errors that would prevent you from creating or updating your state
      # machine. The list of ValidateStateMachineDefinitionDiagnostic data elements can contain zero or more
      # WARNING and/or ERROR elements. The ValidateStateMachineDefinition API might add new diagnostics in
      # the future, adjust diagnostic codes, or change the message wording. Your automated processes should
      # only rely on the value of the result field value (OK, FAIL). Do not rely on the exact order, count,
      # or wording of diagnostic messages.
      def validate_state_machine_definition(
        definition : String,
        max_results : Int32? = nil,
        severity : String? = nil,
        type : String? = nil
      ) : Types::ValidateStateMachineDefinitionOutput
        input = Types::ValidateStateMachineDefinitionInput.new(definition: definition, max_results: max_results, severity: severity, type: type)
        validate_state_machine_definition(input)
      end
      def validate_state_machine_definition(input : Types::ValidateStateMachineDefinitionInput) : Types::ValidateStateMachineDefinitionOutput
        request = Protocol::JsonRpc.build_request(Model::VALIDATE_STATE_MACHINE_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ValidateStateMachineDefinitionOutput, "ValidateStateMachineDefinition")
      end
    end
  end
end
