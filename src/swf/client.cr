module Aws
  module SWF
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

      # Returns the number of closed workflow executions within the given domain that meet the specified
      # filtering criteria. This operation is eventually consistent. The results are best effort and may not
      # exactly reflect recent updates and changes. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. Constrain the following parameters by using a Condition element with the
      # appropriate keys. tagFilter.tag : String constraint. The key is swf:tagFilter.tag . typeFilter.name
      # : String constraint. The key is swf:typeFilter.name . typeFilter.version : String constraint. The
      # key is swf:typeFilter.version . If the caller doesn't have sufficient permissions to invoke the
      # action, or the parameter values fall outside the specified constraints, the action fails. The
      # associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .

      def count_closed_workflow_executions(
        domain : String,
        close_status_filter : Types::CloseStatusFilter? = nil,
        close_time_filter : Types::ExecutionTimeFilter? = nil,
        execution_filter : Types::WorkflowExecutionFilter? = nil,
        start_time_filter : Types::ExecutionTimeFilter? = nil,
        tag_filter : Types::TagFilter? = nil,
        type_filter : Types::WorkflowTypeFilter? = nil
      ) : Types::WorkflowExecutionCount

        input = Types::CountClosedWorkflowExecutionsInput.new(domain: domain, close_status_filter: close_status_filter, close_time_filter: close_time_filter, execution_filter: execution_filter, start_time_filter: start_time_filter, tag_filter: tag_filter, type_filter: type_filter)
        count_closed_workflow_executions(input)
      end

      def count_closed_workflow_executions(input : Types::CountClosedWorkflowExecutionsInput) : Types::WorkflowExecutionCount
        request = Protocol::JsonRpc.build_request(Model::COUNT_CLOSED_WORKFLOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowExecutionCount, "CountClosedWorkflowExecutions")
      end

      # Returns the number of open workflow executions within the given domain that meet the specified
      # filtering criteria. This operation is eventually consistent. The results are best effort and may not
      # exactly reflect recent updates and changes. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. Constrain the following parameters by using a Condition element with the
      # appropriate keys. tagFilter.tag : String constraint. The key is swf:tagFilter.tag . typeFilter.name
      # : String constraint. The key is swf:typeFilter.name . typeFilter.version : String constraint. The
      # key is swf:typeFilter.version . If the caller doesn't have sufficient permissions to invoke the
      # action, or the parameter values fall outside the specified constraints, the action fails. The
      # associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .

      def count_open_workflow_executions(
        domain : String,
        start_time_filter : Types::ExecutionTimeFilter,
        execution_filter : Types::WorkflowExecutionFilter? = nil,
        tag_filter : Types::TagFilter? = nil,
        type_filter : Types::WorkflowTypeFilter? = nil
      ) : Types::WorkflowExecutionCount

        input = Types::CountOpenWorkflowExecutionsInput.new(domain: domain, start_time_filter: start_time_filter, execution_filter: execution_filter, tag_filter: tag_filter, type_filter: type_filter)
        count_open_workflow_executions(input)
      end

      def count_open_workflow_executions(input : Types::CountOpenWorkflowExecutionsInput) : Types::WorkflowExecutionCount
        request = Protocol::JsonRpc.build_request(Model::COUNT_OPEN_WORKFLOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowExecutionCount, "CountOpenWorkflowExecutions")
      end

      # Returns the estimated number of activity tasks in the specified task list. The count returned is an
      # approximation and isn't guaranteed to be exact. If you specify a task list that no activity task was
      # ever scheduled in then 0 is returned. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. Constrain the taskList.name parameter by using a Condition element with the
      # swf:taskList.name key to allow the action to access only certain task lists. If the caller doesn't
      # have sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def count_pending_activity_tasks(
        domain : String,
        task_list : Types::TaskList
      ) : Types::PendingTaskCount

        input = Types::CountPendingActivityTasksInput.new(domain: domain, task_list: task_list)
        count_pending_activity_tasks(input)
      end

      def count_pending_activity_tasks(input : Types::CountPendingActivityTasksInput) : Types::PendingTaskCount
        request = Protocol::JsonRpc.build_request(Model::COUNT_PENDING_ACTIVITY_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PendingTaskCount, "CountPendingActivityTasks")
      end

      # Returns the estimated number of decision tasks in the specified task list. The count returned is an
      # approximation and isn't guaranteed to be exact. If you specify a task list that no decision task was
      # ever scheduled in then 0 is returned. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. Constrain the taskList.name parameter by using a Condition element with the
      # swf:taskList.name key to allow the action to access only certain task lists. If the caller doesn't
      # have sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def count_pending_decision_tasks(
        domain : String,
        task_list : Types::TaskList
      ) : Types::PendingTaskCount

        input = Types::CountPendingDecisionTasksInput.new(domain: domain, task_list: task_list)
        count_pending_decision_tasks(input)
      end

      def count_pending_decision_tasks(input : Types::CountPendingDecisionTasksInput) : Types::PendingTaskCount
        request = Protocol::JsonRpc.build_request(Model::COUNT_PENDING_DECISION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PendingTaskCount, "CountPendingDecisionTasks")
      end

      # Deletes the specified activity type . Note: Prior to deletion, activity types must first be
      # deprecated . After an activity type has been deleted, you cannot schedule new activities of that
      # type. Activities that started before the type was deleted will continue to run. Access Control You
      # can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. Constrain the following parameters by using
      # a Condition element with the appropriate keys. activityType.name : String constraint. The key is
      # swf:activityType.name . activityType.version : String constraint. The key is
      # swf:activityType.version . If the caller doesn't have sufficient permissions to invoke the action,
      # or the parameter values fall outside the specified constraints, the action fails. The associated
      # event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def delete_activity_type(
        activity_type : Types::ActivityType,
        domain : String
      ) : Nil

        input = Types::DeleteActivityTypeInput.new(activity_type: activity_type, domain: domain)
        delete_activity_type(input)
      end

      def delete_activity_type(input : Types::DeleteActivityTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACTIVITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified workflow type . Note: Prior to deletion, workflow types must first be
      # deprecated . After a workflow type has been deleted, you cannot create new executions of that type.
      # Executions that started before the type was deleted will continue to run. Access Control You can use
      # IAM policies to control this action's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. Constrain the following parameters by using a
      # Condition element with the appropriate keys. workflowType.name : String constraint. The key is
      # swf:workflowType.name . workflowType.version : String constraint. The key is
      # swf:workflowType.version . If the caller doesn't have sufficient permissions to invoke the action,
      # or the parameter values fall outside the specified constraints, the action fails. The associated
      # event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def delete_workflow_type(
        domain : String,
        workflow_type : Types::WorkflowType
      ) : Nil

        input = Types::DeleteWorkflowTypeInput.new(domain: domain, workflow_type: workflow_type)
        delete_workflow_type(input)
      end

      def delete_workflow_type(input : Types::DeleteWorkflowTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKFLOW_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deprecates the specified activity type . After an activity type has been deprecated, you cannot
      # create new tasks of that activity type. Tasks of this type that were scheduled before the type was
      # deprecated continue to run. Access Control You can use IAM policies to control this action's access
      # to Amazon SWF resources as follows: Use a Resource element with the domain name to limit the action
      # to only specified domains. Use an Action element to allow or deny permission to call this action.
      # Constrain the following parameters by using a Condition element with the appropriate keys.
      # activityType.name : String constraint. The key is swf:activityType.name . activityType.version :
      # String constraint. The key is swf:activityType.version . If the caller doesn't have sufficient
      # permissions to invoke the action, or the parameter values fall outside the specified constraints,
      # the action fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED
      # . For details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in
      # the Amazon SWF Developer Guide .

      def deprecate_activity_type(
        activity_type : Types::ActivityType,
        domain : String
      ) : Nil

        input = Types::DeprecateActivityTypeInput.new(activity_type: activity_type, domain: domain)
        deprecate_activity_type(input)
      end

      def deprecate_activity_type(input : Types::DeprecateActivityTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEPRECATE_ACTIVITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deprecates the specified domain. After a domain has been deprecated it cannot be used to create new
      # workflow executions or register new types. However, you can still use visibility actions on this
      # domain. Deprecating a domain also deprecates all activity and workflow types registered in the
      # domain. Executions that were started before the domain was deprecated continues to run. This
      # operation is eventually consistent. The results are best effort and may not exactly reflect recent
      # updates and changes. Access Control You can use IAM policies to control this action's access to
      # Amazon SWF resources as follows: Use a Resource element with the domain name to limit the action to
      # only specified domains. Use an Action element to allow or deny permission to call this action. You
      # cannot use an IAM policy to constrain this action's parameters. If the caller doesn't have
      # sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def deprecate_domain(
        name : String
      ) : Nil

        input = Types::DeprecateDomainInput.new(name: name)
        deprecate_domain(input)
      end

      def deprecate_domain(input : Types::DeprecateDomainInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEPRECATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deprecates the specified workflow type . After a workflow type has been deprecated, you cannot
      # create new executions of that type. Executions that were started before the type was deprecated
      # continues to run. A deprecated workflow type may still be used when calling visibility actions. This
      # operation is eventually consistent. The results are best effort and may not exactly reflect recent
      # updates and changes. Access Control You can use IAM policies to control this action's access to
      # Amazon SWF resources as follows: Use a Resource element with the domain name to limit the action to
      # only specified domains. Use an Action element to allow or deny permission to call this action.
      # Constrain the following parameters by using a Condition element with the appropriate keys.
      # workflowType.name : String constraint. The key is swf:workflowType.name . workflowType.version :
      # String constraint. The key is swf:workflowType.version . If the caller doesn't have sufficient
      # permissions to invoke the action, or the parameter values fall outside the specified constraints,
      # the action fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED
      # . For details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in
      # the Amazon SWF Developer Guide .

      def deprecate_workflow_type(
        domain : String,
        workflow_type : Types::WorkflowType
      ) : Nil

        input = Types::DeprecateWorkflowTypeInput.new(domain: domain, workflow_type: workflow_type)
        deprecate_workflow_type(input)
      end

      def deprecate_workflow_type(input : Types::DeprecateWorkflowTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEPRECATE_WORKFLOW_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns information about the specified activity type. This includes configuration settings provided
      # when the type was registered and other general information about the type. Access Control You can
      # use IAM policies to control this action's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. Constrain the following parameters by using a
      # Condition element with the appropriate keys. activityType.name : String constraint. The key is
      # swf:activityType.name . activityType.version : String constraint. The key is
      # swf:activityType.version . If the caller doesn't have sufficient permissions to invoke the action,
      # or the parameter values fall outside the specified constraints, the action fails. The associated
      # event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def describe_activity_type(
        activity_type : Types::ActivityType,
        domain : String
      ) : Types::ActivityTypeDetail

        input = Types::DescribeActivityTypeInput.new(activity_type: activity_type, domain: domain)
        describe_activity_type(input)
      end

      def describe_activity_type(input : Types::DescribeActivityTypeInput) : Types::ActivityTypeDetail
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACTIVITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivityTypeDetail, "DescribeActivityType")
      end

      # Returns information about the specified domain, including description and status. Access Control You
      # can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. You cannot use an IAM policy to constrain
      # this action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def describe_domain(
        name : String
      ) : Types::DomainDetail

        input = Types::DescribeDomainInput.new(name: name)
        describe_domain(input)
      end

      def describe_domain(input : Types::DescribeDomainInput) : Types::DomainDetail
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DomainDetail, "DescribeDomain")
      end

      # Returns information about the specified workflow execution including its type and some statistics.
      # This operation is eventually consistent. The results are best effort and may not exactly reflect
      # recent updates and changes. Access Control You can use IAM policies to control this action's access
      # to Amazon SWF resources as follows: Use a Resource element with the domain name to limit the action
      # to only specified domains. Use an Action element to allow or deny permission to call this action.
      # You cannot use an IAM policy to constrain this action's parameters. If the caller doesn't have
      # sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def describe_workflow_execution(
        domain : String,
        execution : Types::WorkflowExecution
      ) : Types::WorkflowExecutionDetail

        input = Types::DescribeWorkflowExecutionInput.new(domain: domain, execution: execution)
        describe_workflow_execution(input)
      end

      def describe_workflow_execution(input : Types::DescribeWorkflowExecutionInput) : Types::WorkflowExecutionDetail
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKFLOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowExecutionDetail, "DescribeWorkflowExecution")
      end

      # Returns information about the specified workflow type . This includes configuration settings
      # specified when the type was registered and other information such as creation date, current status,
      # etc. Access Control You can use IAM policies to control this action's access to Amazon SWF resources
      # as follows: Use a Resource element with the domain name to limit the action to only specified
      # domains. Use an Action element to allow or deny permission to call this action. Constrain the
      # following parameters by using a Condition element with the appropriate keys. workflowType.name :
      # String constraint. The key is swf:workflowType.name . workflowType.version : String constraint. The
      # key is swf:workflowType.version . If the caller doesn't have sufficient permissions to invoke the
      # action, or the parameter values fall outside the specified constraints, the action fails. The
      # associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .

      def describe_workflow_type(
        domain : String,
        workflow_type : Types::WorkflowType
      ) : Types::WorkflowTypeDetail

        input = Types::DescribeWorkflowTypeInput.new(domain: domain, workflow_type: workflow_type)
        describe_workflow_type(input)
      end

      def describe_workflow_type(input : Types::DescribeWorkflowTypeInput) : Types::WorkflowTypeDetail
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKFLOW_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowTypeDetail, "DescribeWorkflowType")
      end

      # Returns the history of the specified workflow execution. The results may be split into multiple
      # pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the
      # initial call. This operation is eventually consistent. The results are best effort and may not
      # exactly reflect recent updates and changes. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. You cannot use an IAM policy to constrain this action's parameters. If the caller
      # doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the
      # specified constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def get_workflow_execution_history(
        domain : String,
        execution : Types::WorkflowExecution,
        maximum_page_size : Int32? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::History

        input = Types::GetWorkflowExecutionHistoryInput.new(domain: domain, execution: execution, maximum_page_size: maximum_page_size, next_page_token: next_page_token, reverse_order: reverse_order)
        get_workflow_execution_history(input)
      end

      def get_workflow_execution_history(input : Types::GetWorkflowExecutionHistoryInput) : Types::History
        request = Protocol::JsonRpc.build_request(Model::GET_WORKFLOW_EXECUTION_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::History, "GetWorkflowExecutionHistory")
      end

      # Returns information about all activities registered in the specified domain that match the specified
      # name and registration status. The result includes information like creation date, current status of
      # the activity, etc. The results may be split into multiple pages. To retrieve subsequent pages, make
      # the call again using the nextPageToken returned by the initial call. Access Control You can use IAM
      # policies to control this action's access to Amazon SWF resources as follows: Use a Resource element
      # with the domain name to limit the action to only specified domains. Use an Action element to allow
      # or deny permission to call this action. You cannot use an IAM policy to constrain this action's
      # parameters. If the caller doesn't have sufficient permissions to invoke the action, or the parameter
      # values fall outside the specified constraints, the action fails. The associated event attribute's
      # cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using
      # IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def list_activity_types(
        domain : String,
        registration_status : String,
        maximum_page_size : Int32? = nil,
        name : String? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::ActivityTypeInfos

        input = Types::ListActivityTypesInput.new(domain: domain, registration_status: registration_status, maximum_page_size: maximum_page_size, name: name, next_page_token: next_page_token, reverse_order: reverse_order)
        list_activity_types(input)
      end

      def list_activity_types(input : Types::ListActivityTypesInput) : Types::ActivityTypeInfos
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTIVITY_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivityTypeInfos, "ListActivityTypes")
      end

      # Returns a list of closed workflow executions in the specified domain that meet the filtering
      # criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call
      # again using the nextPageToken returned by the initial call. This operation is eventually consistent.
      # The results are best effort and may not exactly reflect recent updates and changes. Access Control
      # You can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. Constrain the following parameters by using
      # a Condition element with the appropriate keys. tagFilter.tag : String constraint. The key is
      # swf:tagFilter.tag . typeFilter.name : String constraint. The key is swf:typeFilter.name .
      # typeFilter.version : String constraint. The key is swf:typeFilter.version . If the caller doesn't
      # have sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def list_closed_workflow_executions(
        domain : String,
        close_status_filter : Types::CloseStatusFilter? = nil,
        close_time_filter : Types::ExecutionTimeFilter? = nil,
        execution_filter : Types::WorkflowExecutionFilter? = nil,
        maximum_page_size : Int32? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil,
        start_time_filter : Types::ExecutionTimeFilter? = nil,
        tag_filter : Types::TagFilter? = nil,
        type_filter : Types::WorkflowTypeFilter? = nil
      ) : Types::WorkflowExecutionInfos

        input = Types::ListClosedWorkflowExecutionsInput.new(domain: domain, close_status_filter: close_status_filter, close_time_filter: close_time_filter, execution_filter: execution_filter, maximum_page_size: maximum_page_size, next_page_token: next_page_token, reverse_order: reverse_order, start_time_filter: start_time_filter, tag_filter: tag_filter, type_filter: type_filter)
        list_closed_workflow_executions(input)
      end

      def list_closed_workflow_executions(input : Types::ListClosedWorkflowExecutionsInput) : Types::WorkflowExecutionInfos
        request = Protocol::JsonRpc.build_request(Model::LIST_CLOSED_WORKFLOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowExecutionInfos, "ListClosedWorkflowExecutions")
      end

      # Returns the list of domains registered in the account. The results may be split into multiple pages.
      # To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial
      # call. This operation is eventually consistent. The results are best effort and may not exactly
      # reflect recent updates and changes. Access Control You can use IAM policies to control this action's
      # access to Amazon SWF resources as follows: Use a Resource element with the domain name to limit the
      # action to only specified domains. The element must be set to arn:aws:swf::AccountID:domain/* , where
      # AccountID is the account ID, with no dashes. Use an Action element to allow or deny permission to
      # call this action. You cannot use an IAM policy to constrain this action's parameters. If the caller
      # doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the
      # specified constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def list_domains(
        registration_status : String,
        maximum_page_size : Int32? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::DomainInfos

        input = Types::ListDomainsInput.new(registration_status: registration_status, maximum_page_size: maximum_page_size, next_page_token: next_page_token, reverse_order: reverse_order)
        list_domains(input)
      end

      def list_domains(input : Types::ListDomainsInput) : Types::DomainInfos
        request = Protocol::JsonRpc.build_request(Model::LIST_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DomainInfos, "ListDomains")
      end

      # Returns a list of open workflow executions in the specified domain that meet the filtering criteria.
      # The results may be split into multiple pages. To retrieve subsequent pages, make the call again
      # using the nextPageToken returned by the initial call. This operation is eventually consistent. The
      # results are best effort and may not exactly reflect recent updates and changes. Access Control You
      # can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. Constrain the following parameters by using
      # a Condition element with the appropriate keys. tagFilter.tag : String constraint. The key is
      # swf:tagFilter.tag . typeFilter.name : String constraint. The key is swf:typeFilter.name .
      # typeFilter.version : String constraint. The key is swf:typeFilter.version . If the caller doesn't
      # have sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def list_open_workflow_executions(
        domain : String,
        start_time_filter : Types::ExecutionTimeFilter,
        execution_filter : Types::WorkflowExecutionFilter? = nil,
        maximum_page_size : Int32? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil,
        tag_filter : Types::TagFilter? = nil,
        type_filter : Types::WorkflowTypeFilter? = nil
      ) : Types::WorkflowExecutionInfos

        input = Types::ListOpenWorkflowExecutionsInput.new(domain: domain, start_time_filter: start_time_filter, execution_filter: execution_filter, maximum_page_size: maximum_page_size, next_page_token: next_page_token, reverse_order: reverse_order, tag_filter: tag_filter, type_filter: type_filter)
        list_open_workflow_executions(input)
      end

      def list_open_workflow_executions(input : Types::ListOpenWorkflowExecutionsInput) : Types::WorkflowExecutionInfos
        request = Protocol::JsonRpc.build_request(Model::LIST_OPEN_WORKFLOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowExecutionInfos, "ListOpenWorkflowExecutions")
      end

      # List tags for a given domain.

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

      # Returns information about workflow types in the specified domain. The results may be split into
      # multiple pages that can be retrieved by making the call repeatedly. Access Control You can use IAM
      # policies to control this action's access to Amazon SWF resources as follows: Use a Resource element
      # with the domain name to limit the action to only specified domains. Use an Action element to allow
      # or deny permission to call this action. You cannot use an IAM policy to constrain this action's
      # parameters. If the caller doesn't have sufficient permissions to invoke the action, or the parameter
      # values fall outside the specified constraints, the action fails. The associated event attribute's
      # cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using
      # IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def list_workflow_types(
        domain : String,
        registration_status : String,
        maximum_page_size : Int32? = nil,
        name : String? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::WorkflowTypeInfos

        input = Types::ListWorkflowTypesInput.new(domain: domain, registration_status: registration_status, maximum_page_size: maximum_page_size, name: name, next_page_token: next_page_token, reverse_order: reverse_order)
        list_workflow_types(input)
      end

      def list_workflow_types(input : Types::ListWorkflowTypesInput) : Types::WorkflowTypeInfos
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFLOW_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::WorkflowTypeInfos, "ListWorkflowTypes")
      end

      # Used by workers to get an ActivityTask from the specified activity taskList . This initiates a long
      # poll, where the service holds the HTTP connection open and responds as soon as a task becomes
      # available. The maximum time the service holds on to the request before responding is 60 seconds. If
      # no task is available within 60 seconds, the poll returns an empty result. An empty result, in this
      # context, means that an ActivityTask is returned, but that the value of taskToken is an empty string.
      # If a task is returned, the worker should use its type to identify and process it correctly. Workers
      # should set their client side socket timeout to at least 70 seconds (10 seconds higher than the
      # maximum time service may hold the poll request). Access Control You can use IAM policies to control
      # this action's access to Amazon SWF resources as follows: Use a Resource element with the domain name
      # to limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. Constrain the taskList.name parameter by using a Condition element with the
      # swf:taskList.name key to allow the action to access only certain task lists. If the caller doesn't
      # have sufficient permissions to invoke the action, or the parameter values fall outside the specified
      # constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def poll_for_activity_task(
        domain : String,
        task_list : Types::TaskList,
        identity : String? = nil
      ) : Types::ActivityTask

        input = Types::PollForActivityTaskInput.new(domain: domain, task_list: task_list, identity: identity)
        poll_for_activity_task(input)
      end

      def poll_for_activity_task(input : Types::PollForActivityTaskInput) : Types::ActivityTask
        request = Protocol::JsonRpc.build_request(Model::POLL_FOR_ACTIVITY_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivityTask, "PollForActivityTask")
      end

      # Used by deciders to get a DecisionTask from the specified decision taskList . A decision task may be
      # returned for any open workflow execution that is using the specified task list. The task includes a
      # paginated view of the history of the workflow execution. The decider should use the workflow type
      # and the history to determine how to properly handle the task. This action initiates a long poll,
      # where the service holds the HTTP connection open and responds as soon a task becomes available. If
      # no decision task is available in the specified task list before the timeout of 60 seconds expires,
      # an empty result is returned. An empty result, in this context, means that a DecisionTask is
      # returned, but that the value of taskToken is an empty string. Deciders should set their client side
      # socket timeout to at least 70 seconds (10 seconds higher than the timeout). Because the number of
      # workflow history events for a single workflow execution might be very large, the result returned
      # might be split up across a number of pages. To retrieve subsequent pages, make additional calls to
      # PollForDecisionTask using the nextPageToken returned by the initial call. Note that you do not call
      # GetWorkflowExecutionHistory with this nextPageToken . Instead, call PollForDecisionTask again.
      # Access Control You can use IAM policies to control this action's access to Amazon SWF resources as
      # follows: Use a Resource element with the domain name to limit the action to only specified domains.
      # Use an Action element to allow or deny permission to call this action. Constrain the taskList.name
      # parameter by using a Condition element with the swf:taskList.name key to allow the action to access
      # only certain task lists. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def poll_for_decision_task(
        domain : String,
        task_list : Types::TaskList,
        identity : String? = nil,
        maximum_page_size : Int32? = nil,
        next_page_token : String? = nil,
        reverse_order : Bool? = nil,
        start_at_previous_started_event : Bool? = nil
      ) : Types::DecisionTask

        input = Types::PollForDecisionTaskInput.new(domain: domain, task_list: task_list, identity: identity, maximum_page_size: maximum_page_size, next_page_token: next_page_token, reverse_order: reverse_order, start_at_previous_started_event: start_at_previous_started_event)
        poll_for_decision_task(input)
      end

      def poll_for_decision_task(input : Types::PollForDecisionTaskInput) : Types::DecisionTask
        request = Protocol::JsonRpc.build_request(Model::POLL_FOR_DECISION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DecisionTask, "PollForDecisionTask")
      end

      # Used by activity workers to report to the service that the ActivityTask represented by the specified
      # taskToken is still making progress. The worker can also specify details of the progress, for example
      # percent complete, using the details parameter. This action can also be used by the worker as a
      # mechanism to check if cancellation is being requested for the activity task. If a cancellation is
      # being attempted for the specified task, then the boolean cancelRequested flag returned by the
      # service is set to true . This action resets the taskHeartbeatTimeout clock. The taskHeartbeatTimeout
      # is specified in RegisterActivityType . This action doesn't in itself create an event in the workflow
      # execution history. However, if the task times out, the workflow execution history contains a
      # ActivityTaskTimedOut event that contains the information from the last heartbeat generated by the
      # activity worker. The taskStartToCloseTimeout of an activity type is the maximum duration of an
      # activity task, regardless of the number of RecordActivityTaskHeartbeat requests received. The
      # taskStartToCloseTimeout is also specified in RegisterActivityType . This operation is only useful
      # for long-lived activities to report liveliness of the task and to determine if a cancellation is
      # being attempted. If the cancelRequested flag returns true , a cancellation is being attempted. If
      # the worker can cancel the activity, it should respond with RespondActivityTaskCanceled . Otherwise,
      # it should ignore the cancellation request. Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. You cannot use an IAM policy to constrain this action's parameters. If the caller
      # doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the
      # specified constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def record_activity_task_heartbeat(
        task_token : String,
        details : String? = nil
      ) : Types::ActivityTaskStatus

        input = Types::RecordActivityTaskHeartbeatInput.new(task_token: task_token, details: details)
        record_activity_task_heartbeat(input)
      end

      def record_activity_task_heartbeat(input : Types::RecordActivityTaskHeartbeatInput) : Types::ActivityTaskStatus
        request = Protocol::JsonRpc.build_request(Model::RECORD_ACTIVITY_TASK_HEARTBEAT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ActivityTaskStatus, "RecordActivityTaskHeartbeat")
      end

      # Registers a new activity type along with its configuration settings in the specified domain. A
      # TypeAlreadyExists fault is returned if the type already exists in the domain. You cannot change any
      # configuration settings of the type after its registration, and it must be registered as a new
      # version. Access Control You can use IAM policies to control this action's access to Amazon SWF
      # resources as follows: Use a Resource element with the domain name to limit the action to only
      # specified domains. Use an Action element to allow or deny permission to call this action. Constrain
      # the following parameters by using a Condition element with the appropriate keys.
      # defaultTaskList.name : String constraint. The key is swf:defaultTaskList.name . name : String
      # constraint. The key is swf:name . version : String constraint. The key is swf:version . If the
      # caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def register_activity_type(
        domain : String,
        name : String,
        version : String,
        default_task_heartbeat_timeout : String? = nil,
        default_task_list : Types::TaskList? = nil,
        default_task_priority : String? = nil,
        default_task_schedule_to_close_timeout : String? = nil,
        default_task_schedule_to_start_timeout : String? = nil,
        default_task_start_to_close_timeout : String? = nil,
        description : String? = nil
      ) : Nil

        input = Types::RegisterActivityTypeInput.new(domain: domain, name: name, version: version, default_task_heartbeat_timeout: default_task_heartbeat_timeout, default_task_list: default_task_list, default_task_priority: default_task_priority, default_task_schedule_to_close_timeout: default_task_schedule_to_close_timeout, default_task_schedule_to_start_timeout: default_task_schedule_to_start_timeout, default_task_start_to_close_timeout: default_task_start_to_close_timeout, description: description)
        register_activity_type(input)
      end

      def register_activity_type(input : Types::RegisterActivityTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_ACTIVITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Registers a new domain. Access Control You can use IAM policies to control this action's access to
      # Amazon SWF resources as follows: You cannot use an IAM policy to control domain access for this
      # action. The name of the domain being registered is available as the resource of this action. Use an
      # Action element to allow or deny permission to call this action. You cannot use an IAM policy to
      # constrain this action's parameters. If the caller doesn't have sufficient permissions to invoke the
      # action, or the parameter values fall outside the specified constraints, the action fails. The
      # associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .

      def register_domain(
        name : String,
        workflow_execution_retention_period_in_days : String,
        description : String? = nil,
        tags : Array(Types::ResourceTag)? = nil
      ) : Nil

        input = Types::RegisterDomainInput.new(name: name, workflow_execution_retention_period_in_days: workflow_execution_retention_period_in_days, description: description, tags: tags)
        register_domain(input)
      end

      def register_domain(input : Types::RegisterDomainInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Registers a new workflow type and its configuration settings in the specified domain. The retention
      # period for the workflow history is set by the RegisterDomain action. If the type already exists,
      # then a TypeAlreadyExists fault is returned. You cannot change the configuration settings of a
      # workflow type once it is registered and it must be registered as a new version. Access Control You
      # can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. Constrain the following parameters by using
      # a Condition element with the appropriate keys. defaultTaskList.name : String constraint. The key is
      # swf:defaultTaskList.name . name : String constraint. The key is swf:name . version : String
      # constraint. The key is swf:version . If the caller doesn't have sufficient permissions to invoke the
      # action, or the parameter values fall outside the specified constraints, the action fails. The
      # associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .

      def register_workflow_type(
        domain : String,
        name : String,
        version : String,
        default_child_policy : String? = nil,
        default_execution_start_to_close_timeout : String? = nil,
        default_lambda_role : String? = nil,
        default_task_list : Types::TaskList? = nil,
        default_task_priority : String? = nil,
        default_task_start_to_close_timeout : String? = nil,
        description : String? = nil
      ) : Nil

        input = Types::RegisterWorkflowTypeInput.new(domain: domain, name: name, version: version, default_child_policy: default_child_policy, default_execution_start_to_close_timeout: default_execution_start_to_close_timeout, default_lambda_role: default_lambda_role, default_task_list: default_task_list, default_task_priority: default_task_priority, default_task_start_to_close_timeout: default_task_start_to_close_timeout, description: description)
        register_workflow_type(input)
      end

      def register_workflow_type(input : Types::RegisterWorkflowTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_WORKFLOW_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Records a WorkflowExecutionCancelRequested event in the currently running workflow execution
      # identified by the given domain, workflowId, and runId. This logically requests the cancellation of
      # the workflow execution as a whole. It is up to the decider to take appropriate actions when it
      # receives an execution history with this event. If the runId isn't specified, the
      # WorkflowExecutionCancelRequested event is recorded in the history of the current open workflow
      # execution with the specified workflowId in the domain. Because this action allows the workflow to
      # properly clean up and gracefully close, it should be used instead of TerminateWorkflowExecution when
      # possible. Access Control You can use IAM policies to control this action's access to Amazon SWF
      # resources as follows: Use a Resource element with the domain name to limit the action to only
      # specified domains. Use an Action element to allow or deny permission to call this action. You cannot
      # use an IAM policy to constrain this action's parameters. If the caller doesn't have sufficient
      # permissions to invoke the action, or the parameter values fall outside the specified constraints,
      # the action fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED
      # . For details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in
      # the Amazon SWF Developer Guide .

      def request_cancel_workflow_execution(
        domain : String,
        workflow_id : String,
        run_id : String? = nil
      ) : Nil

        input = Types::RequestCancelWorkflowExecutionInput.new(domain: domain, workflow_id: workflow_id, run_id: run_id)
        request_cancel_workflow_execution(input)
      end

      def request_cancel_workflow_execution(input : Types::RequestCancelWorkflowExecutionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::REQUEST_CANCEL_WORKFLOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used by workers to tell the service that the ActivityTask identified by the taskToken was
      # successfully canceled. Additional details can be provided using the details argument. These details
      # (if provided) appear in the ActivityTaskCanceled event added to the workflow history. Only use this
      # operation if the canceled flag of a RecordActivityTaskHeartbeat request returns true and if the
      # activity can be safely undone or abandoned. A task is considered open from the time that it is
      # scheduled until it is closed. Therefore a task is reported as open while a worker is processing it.
      # A task is closed after it has been specified in a call to RespondActivityTaskCompleted ,
      # RespondActivityTaskCanceled, RespondActivityTaskFailed , or the task has timed out . Access Control
      # You can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. You cannot use an IAM policy to constrain
      # this action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def respond_activity_task_canceled(
        task_token : String,
        details : String? = nil
      ) : Nil

        input = Types::RespondActivityTaskCanceledInput.new(task_token: task_token, details: details)
        respond_activity_task_canceled(input)
      end

      def respond_activity_task_canceled(input : Types::RespondActivityTaskCanceledInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESPOND_ACTIVITY_TASK_CANCELED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used by workers to tell the service that the ActivityTask identified by the taskToken completed
      # successfully with a result (if provided). The result appears in the ActivityTaskCompleted event in
      # the workflow history. If the requested task doesn't complete successfully, use
      # RespondActivityTaskFailed instead. If the worker finds that the task is canceled through the
      # canceled flag returned by RecordActivityTaskHeartbeat , it should cancel the task, clean up and then
      # call RespondActivityTaskCanceled . A task is considered open from the time that it is scheduled
      # until it is closed. Therefore a task is reported as open while a worker is processing it. A task is
      # closed after it has been specified in a call to RespondActivityTaskCompleted,
      # RespondActivityTaskCanceled , RespondActivityTaskFailed , or the task has timed out . Access Control
      # You can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. You cannot use an IAM policy to constrain
      # this action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def respond_activity_task_completed(
        task_token : String,
        result : String? = nil
      ) : Nil

        input = Types::RespondActivityTaskCompletedInput.new(task_token: task_token, result: result)
        respond_activity_task_completed(input)
      end

      def respond_activity_task_completed(input : Types::RespondActivityTaskCompletedInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESPOND_ACTIVITY_TASK_COMPLETED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used by workers to tell the service that the ActivityTask identified by the taskToken has failed
      # with reason (if specified). The reason and details appear in the ActivityTaskFailed event added to
      # the workflow history. A task is considered open from the time that it is scheduled until it is
      # closed. Therefore a task is reported as open while a worker is processing it. A task is closed after
      # it has been specified in a call to RespondActivityTaskCompleted , RespondActivityTaskCanceled ,
      # RespondActivityTaskFailed, or the task has timed out . Access Control You can use IAM policies to
      # control this action's access to Amazon SWF resources as follows: Use a Resource element with the
      # domain name to limit the action to only specified domains. Use an Action element to allow or deny
      # permission to call this action. You cannot use an IAM policy to constrain this action's parameters.
      # If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def respond_activity_task_failed(
        task_token : String,
        details : String? = nil,
        reason : String? = nil
      ) : Nil

        input = Types::RespondActivityTaskFailedInput.new(task_token: task_token, details: details, reason: reason)
        respond_activity_task_failed(input)
      end

      def respond_activity_task_failed(input : Types::RespondActivityTaskFailedInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESPOND_ACTIVITY_TASK_FAILED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used by deciders to tell the service that the DecisionTask identified by the taskToken has
      # successfully completed. The decisions argument specifies the list of decisions made while processing
      # the task. A DecisionTaskCompleted event is added to the workflow history. The executionContext
      # specified is attached to the event in the workflow execution history. Access Control If an IAM
      # policy grants permission to use RespondDecisionTaskCompleted , it can express permissions for the
      # list of decisions in the decisions parameter. Each of the decisions has one or more parameters, much
      # like a regular API call. To allow for policies to be as readable as possible, you can express
      # permissions on decisions as if they were actual API calls, including applying conditions to some
      # parameters. For more information, see Using IAM to Manage Access to Amazon SWF Workflows in the
      # Amazon SWF Developer Guide .

      def respond_decision_task_completed(
        task_token : String,
        decisions : Array(Types::Decision)? = nil,
        execution_context : String? = nil,
        task_list : Types::TaskList? = nil,
        task_list_schedule_to_start_timeout : String? = nil
      ) : Nil

        input = Types::RespondDecisionTaskCompletedInput.new(task_token: task_token, decisions: decisions, execution_context: execution_context, task_list: task_list, task_list_schedule_to_start_timeout: task_list_schedule_to_start_timeout)
        respond_decision_task_completed(input)
      end

      def respond_decision_task_completed(input : Types::RespondDecisionTaskCompletedInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESPOND_DECISION_TASK_COMPLETED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Records a WorkflowExecutionSignaled event in the workflow execution history and creates a decision
      # task for the workflow execution identified by the given domain, workflowId and runId. The event is
      # recorded with the specified user defined signalName and input (if provided). If a runId isn't
      # specified, then the WorkflowExecutionSignaled event is recorded in the history of the current open
      # workflow with the matching workflowId in the domain. If the specified workflow execution isn't open,
      # this method fails with UnknownResource . Access Control You can use IAM policies to control this
      # action's access to Amazon SWF resources as follows: Use a Resource element with the domain name to
      # limit the action to only specified domains. Use an Action element to allow or deny permission to
      # call this action. You cannot use an IAM policy to constrain this action's parameters. If the caller
      # doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the
      # specified constraints, the action fails. The associated event attribute's cause parameter is set to
      # OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to Manage Access to
      # Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def signal_workflow_execution(
        domain : String,
        signal_name : String,
        workflow_id : String,
        input : String? = nil,
        run_id : String? = nil
      ) : Nil

        input = Types::SignalWorkflowExecutionInput.new(domain: domain, signal_name: signal_name, workflow_id: workflow_id, input: input, run_id: run_id)
        signal_workflow_execution(input)
      end

      def signal_workflow_execution(input : Types::SignalWorkflowExecutionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SIGNAL_WORKFLOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts an execution of the workflow type in the specified domain using the provided workflowId and
      # input data. This action returns the newly started workflow execution. Access Control You can use IAM
      # policies to control this action's access to Amazon SWF resources as follows: Use a Resource element
      # with the domain name to limit the action to only specified domains. Use an Action element to allow
      # or deny permission to call this action. Constrain the following parameters by using a Condition
      # element with the appropriate keys. tagList.member.0 : The key is swf:tagList.member.0 .
      # tagList.member.1 : The key is swf:tagList.member.1 . tagList.member.2 : The key is
      # swf:tagList.member.2 . tagList.member.3 : The key is swf:tagList.member.3 . tagList.member.4 : The
      # key is swf:tagList.member.4 . taskList : String constraint. The key is swf:taskList.name .
      # workflowType.name : String constraint. The key is swf:workflowType.name . workflowType.version :
      # String constraint. The key is swf:workflowType.version . If the caller doesn't have sufficient
      # permissions to invoke the action, or the parameter values fall outside the specified constraints,
      # the action fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED
      # . For details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in
      # the Amazon SWF Developer Guide .

      def start_workflow_execution(
        domain : String,
        workflow_id : String,
        workflow_type : Types::WorkflowType,
        child_policy : String? = nil,
        execution_start_to_close_timeout : String? = nil,
        input : String? = nil,
        lambda_role : String? = nil,
        tag_list : Array(String)? = nil,
        task_list : Types::TaskList? = nil,
        task_priority : String? = nil,
        task_start_to_close_timeout : String? = nil
      ) : Types::Run

        input = Types::StartWorkflowExecutionInput.new(domain: domain, workflow_id: workflow_id, workflow_type: workflow_type, child_policy: child_policy, execution_start_to_close_timeout: execution_start_to_close_timeout, input: input, lambda_role: lambda_role, tag_list: tag_list, task_list: task_list, task_priority: task_priority, task_start_to_close_timeout: task_start_to_close_timeout)
        start_workflow_execution(input)
      end

      def start_workflow_execution(input : Types::StartWorkflowExecutionInput) : Types::Run
        request = Protocol::JsonRpc.build_request(Model::START_WORKFLOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::Run, "StartWorkflowExecution")
      end

      # Add a tag to a Amazon SWF domain. Amazon SWF supports a maximum of 50 tags per resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::ResourceTag)
      ) : Nil

        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Records a WorkflowExecutionTerminated event and forces closure of the workflow execution identified
      # by the given domain, runId, and workflowId. The child policy, registered with the workflow type or
      # specified when starting this execution, is applied to any open child workflow executions of this
      # workflow execution. If the identified workflow execution was in progress, it is terminated
      # immediately. If a runId isn't specified, then the WorkflowExecutionTerminated event is recorded in
      # the history of the current open workflow with the matching workflowId in the domain. You should
      # consider using RequestCancelWorkflowExecution action instead because it allows the workflow to
      # gracefully close while TerminateWorkflowExecution doesn't. Access Control You can use IAM policies
      # to control this action's access to Amazon SWF resources as follows: Use a Resource element with the
      # domain name to limit the action to only specified domains. Use an Action element to allow or deny
      # permission to call this action. You cannot use an IAM policy to constrain this action's parameters.
      # If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def terminate_workflow_execution(
        domain : String,
        workflow_id : String,
        child_policy : String? = nil,
        details : String? = nil,
        reason : String? = nil,
        run_id : String? = nil
      ) : Nil

        input = Types::TerminateWorkflowExecutionInput.new(domain: domain, workflow_id: workflow_id, child_policy: child_policy, details: details, reason: reason, run_id: run_id)
        terminate_workflow_execution(input)
      end

      def terminate_workflow_execution(input : Types::TerminateWorkflowExecutionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_WORKFLOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Undeprecates a previously deprecated activity type . After an activity type has been undeprecated,
      # you can create new tasks of that activity type. This operation is eventually consistent. The results
      # are best effort and may not exactly reflect recent updates and changes. Access Control You can use
      # IAM policies to control this action's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. Constrain the following parameters by using a
      # Condition element with the appropriate keys. activityType.name : String constraint. The key is
      # swf:activityType.name . activityType.version : String constraint. The key is
      # swf:activityType.version . If the caller doesn't have sufficient permissions to invoke the action,
      # or the parameter values fall outside the specified constraints, the action fails. The associated
      # event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def undeprecate_activity_type(
        activity_type : Types::ActivityType,
        domain : String
      ) : Nil

        input = Types::UndeprecateActivityTypeInput.new(activity_type: activity_type, domain: domain)
        undeprecate_activity_type(input)
      end

      def undeprecate_activity_type(input : Types::UndeprecateActivityTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNDEPRECATE_ACTIVITY_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Undeprecates a previously deprecated domain. After a domain has been undeprecated it can be used to
      # create new workflow executions or register new types. This operation is eventually consistent. The
      # results are best effort and may not exactly reflect recent updates and changes. Access Control You
      # can use IAM policies to control this action's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. You cannot use an IAM policy to constrain
      # this action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def undeprecate_domain(
        name : String
      ) : Nil

        input = Types::UndeprecateDomainInput.new(name: name)
        undeprecate_domain(input)
      end

      def undeprecate_domain(input : Types::UndeprecateDomainInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNDEPRECATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Undeprecates a previously deprecated workflow type . After a workflow type has been undeprecated,
      # you can create new executions of that type. This operation is eventually consistent. The results are
      # best effort and may not exactly reflect recent updates and changes. Access Control You can use IAM
      # policies to control this action's access to Amazon SWF resources as follows: Use a Resource element
      # with the domain name to limit the action to only specified domains. Use an Action element to allow
      # or deny permission to call this action. Constrain the following parameters by using a Condition
      # element with the appropriate keys. workflowType.name : String constraint. The key is
      # swf:workflowType.name . workflowType.version : String constraint. The key is
      # swf:workflowType.version . If the caller doesn't have sufficient permissions to invoke the action,
      # or the parameter values fall outside the specified constraints, the action fails. The associated
      # event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .

      def undeprecate_workflow_type(
        domain : String,
        workflow_type : Types::WorkflowType
      ) : Nil

        input = Types::UndeprecateWorkflowTypeInput.new(domain: domain, workflow_type: workflow_type)
        undeprecate_workflow_type(input)
      end

      def undeprecate_workflow_type(input : Types::UndeprecateWorkflowTypeInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNDEPRECATE_WORKFLOW_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Remove a tag from a Amazon SWF domain.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
