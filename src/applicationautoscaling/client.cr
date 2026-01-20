module Aws
  module ApplicationAutoScaling
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

      # Deletes the specified scaling policy for an Application Auto Scaling scalable target. Deleting a
      # step scaling policy deletes the underlying alarm action, but does not delete the CloudWatch alarm
      # associated with the scaling policy, even if it no longer has an associated action. For more
      # information, see Delete a step scaling policy and Delete a target tracking scaling policy in the
      # Application Auto Scaling User Guide .

      def delete_scaling_policy(
        policy_name : String,
        resource_id : String,
        scalable_dimension : String,
        service_namespace : String
      ) : Types::DeleteScalingPolicyResponse

        input = Types::DeleteScalingPolicyRequest.new(policy_name: policy_name, resource_id: resource_id, scalable_dimension: scalable_dimension, service_namespace: service_namespace)
        delete_scaling_policy(input)
      end

      def delete_scaling_policy(input : Types::DeleteScalingPolicyRequest) : Types::DeleteScalingPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteScalingPolicyResponse, "DeleteScalingPolicy")
      end

      # Deletes the specified scheduled action for an Application Auto Scaling scalable target. For more
      # information, see Delete a scheduled action in the Application Auto Scaling User Guide .

      def delete_scheduled_action(
        resource_id : String,
        scalable_dimension : String,
        scheduled_action_name : String,
        service_namespace : String
      ) : Types::DeleteScheduledActionResponse

        input = Types::DeleteScheduledActionRequest.new(resource_id: resource_id, scalable_dimension: scalable_dimension, scheduled_action_name: scheduled_action_name, service_namespace: service_namespace)
        delete_scheduled_action(input)
      end

      def delete_scheduled_action(input : Types::DeleteScheduledActionRequest) : Types::DeleteScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteScheduledActionResponse, "DeleteScheduledAction")
      end

      # Deregisters an Application Auto Scaling scalable target when you have finished using it. To see
      # which resources have been registered, use DescribeScalableTargets . Deregistering a scalable target
      # deletes the scaling policies and the scheduled actions that are associated with it.

      def deregister_scalable_target(
        resource_id : String,
        scalable_dimension : String,
        service_namespace : String
      ) : Types::DeregisterScalableTargetResponse

        input = Types::DeregisterScalableTargetRequest.new(resource_id: resource_id, scalable_dimension: scalable_dimension, service_namespace: service_namespace)
        deregister_scalable_target(input)
      end

      def deregister_scalable_target(input : Types::DeregisterScalableTargetRequest) : Types::DeregisterScalableTargetResponse
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_SCALABLE_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterScalableTargetResponse, "DeregisterScalableTarget")
      end

      # Gets information about the scalable targets in the specified namespace. You can filter the results
      # using ResourceIds and ScalableDimension .

      def describe_scalable_targets(
        service_namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_ids : Array(String)? = nil,
        scalable_dimension : String? = nil
      ) : Types::DescribeScalableTargetsResponse

        input = Types::DescribeScalableTargetsRequest.new(service_namespace: service_namespace, max_results: max_results, next_token: next_token, resource_ids: resource_ids, scalable_dimension: scalable_dimension)
        describe_scalable_targets(input)
      end

      def describe_scalable_targets(input : Types::DescribeScalableTargetsRequest) : Types::DescribeScalableTargetsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALABLE_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalableTargetsResponse, "DescribeScalableTargets")
      end

      # Provides descriptive information about the scaling activities in the specified namespace from the
      # previous six weeks. You can filter the results using ResourceId and ScalableDimension . For
      # information about viewing scaling activities using the Amazon Web Services CLI, see Scaling
      # activities for Application Auto Scaling .

      def describe_scaling_activities(
        service_namespace : String,
        include_not_scaled_activities : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_id : String? = nil,
        scalable_dimension : String? = nil
      ) : Types::DescribeScalingActivitiesResponse

        input = Types::DescribeScalingActivitiesRequest.new(service_namespace: service_namespace, include_not_scaled_activities: include_not_scaled_activities, max_results: max_results, next_token: next_token, resource_id: resource_id, scalable_dimension: scalable_dimension)
        describe_scaling_activities(input)
      end

      def describe_scaling_activities(input : Types::DescribeScalingActivitiesRequest) : Types::DescribeScalingActivitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALING_ACTIVITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalingActivitiesResponse, "DescribeScalingActivities")
      end

      # Describes the Application Auto Scaling scaling policies for the specified service namespace. You can
      # filter the results using ResourceId , ScalableDimension , and PolicyNames . For more information,
      # see Target tracking scaling policies and Step scaling policies in the Application Auto Scaling User
      # Guide .

      def describe_scaling_policies(
        service_namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        policy_names : Array(String)? = nil,
        resource_id : String? = nil,
        scalable_dimension : String? = nil
      ) : Types::DescribeScalingPoliciesResponse

        input = Types::DescribeScalingPoliciesRequest.new(service_namespace: service_namespace, max_results: max_results, next_token: next_token, policy_names: policy_names, resource_id: resource_id, scalable_dimension: scalable_dimension)
        describe_scaling_policies(input)
      end

      def describe_scaling_policies(input : Types::DescribeScalingPoliciesRequest) : Types::DescribeScalingPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCALING_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScalingPoliciesResponse, "DescribeScalingPolicies")
      end

      # Describes the Application Auto Scaling scheduled actions for the specified service namespace. You
      # can filter the results using the ResourceId , ScalableDimension , and ScheduledActionNames
      # parameters. For more information, see Scheduled scaling in the Application Auto Scaling User Guide .

      def describe_scheduled_actions(
        service_namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_id : String? = nil,
        scalable_dimension : String? = nil,
        scheduled_action_names : Array(String)? = nil
      ) : Types::DescribeScheduledActionsResponse

        input = Types::DescribeScheduledActionsRequest.new(service_namespace: service_namespace, max_results: max_results, next_token: next_token, resource_id: resource_id, scalable_dimension: scalable_dimension, scheduled_action_names: scheduled_action_names)
        describe_scheduled_actions(input)
      end

      def describe_scheduled_actions(input : Types::DescribeScheduledActionsRequest) : Types::DescribeScheduledActionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SCHEDULED_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeScheduledActionsResponse, "DescribeScheduledActions")
      end

      # Retrieves the forecast data for a predictive scaling policy. Load forecasts are predictions of the
      # hourly load values using historical load data from CloudWatch and an analysis of historical trends.
      # Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an
      # hourly basis, based on the hourly load forecast. A minimum of 24 hours of data is required to create
      # the initial forecasts. However, having a full 14 days of historical data results in more accurate
      # forecasts.

      def get_predictive_scaling_forecast(
        end_time : Time,
        policy_name : String,
        resource_id : String,
        scalable_dimension : String,
        service_namespace : String,
        start_time : Time
      ) : Types::GetPredictiveScalingForecastResponse

        input = Types::GetPredictiveScalingForecastRequest.new(end_time: end_time, policy_name: policy_name, resource_id: resource_id, scalable_dimension: scalable_dimension, service_namespace: service_namespace, start_time: start_time)
        get_predictive_scaling_forecast(input)
      end

      def get_predictive_scaling_forecast(input : Types::GetPredictiveScalingForecastRequest) : Types::GetPredictiveScalingForecastResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PREDICTIVE_SCALING_FORECAST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPredictiveScalingForecastResponse, "GetPredictiveScalingForecast")
      end

      # Returns all the tags on the specified Application Auto Scaling scalable target. For general
      # information about tags, including the format and syntax, see Tagging your Amazon Web Services
      # resources in the Amazon Web Services General Reference .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Creates or updates a scaling policy for an Application Auto Scaling scalable target. Each scalable
      # target is identified by a service namespace, resource ID, and scalable dimension. A scaling policy
      # applies to the scalable target identified by those three attributes. You cannot create a scaling
      # policy until you have registered the resource as a scalable target. Multiple scaling policies can be
      # in force at the same time for the same scalable target. You can have one or more target tracking
      # scaling policies, one or more step scaling policies, or both. However, there is a chance that
      # multiple policies could conflict, instructing the scalable target to scale out or in at the same
      # time. Application Auto Scaling gives precedence to the policy that provides the largest capacity for
      # both scale out and scale in. For example, if one policy increases capacity by 3, another policy
      # increases capacity by 200 percent, and the current capacity is 10, Application Auto Scaling uses the
      # policy with the highest calculated capacity (200% of 10 = 20) and scales out to 30. We recommend
      # caution, however, when using target tracking scaling policies with step scaling policies because
      # conflicts between these policies can cause undesirable behavior. For example, if the step scaling
      # policy initiates a scale-in activity before the target tracking policy is ready to scale in, the
      # scale-in activity will not be blocked. After the scale-in activity completes, the target tracking
      # policy could instruct the scalable target to scale out again. For more information, see Target
      # tracking scaling policies , Step scaling policies , and Predictive scaling policies in the
      # Application Auto Scaling User Guide . If a scalable target is deregistered, the scalable target is
      # no longer available to use scaling policies. Any scaling policies that were specified for the
      # scalable target are deleted.

      def put_scaling_policy(
        policy_name : String,
        resource_id : String,
        scalable_dimension : String,
        service_namespace : String,
        policy_type : String? = nil,
        predictive_scaling_policy_configuration : Types::PredictiveScalingPolicyConfiguration? = nil,
        step_scaling_policy_configuration : Types::StepScalingPolicyConfiguration? = nil,
        target_tracking_scaling_policy_configuration : Types::TargetTrackingScalingPolicyConfiguration? = nil
      ) : Types::PutScalingPolicyResponse

        input = Types::PutScalingPolicyRequest.new(policy_name: policy_name, resource_id: resource_id, scalable_dimension: scalable_dimension, service_namespace: service_namespace, policy_type: policy_type, predictive_scaling_policy_configuration: predictive_scaling_policy_configuration, step_scaling_policy_configuration: step_scaling_policy_configuration, target_tracking_scaling_policy_configuration: target_tracking_scaling_policy_configuration)
        put_scaling_policy(input)
      end

      def put_scaling_policy(input : Types::PutScalingPolicyRequest) : Types::PutScalingPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SCALING_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutScalingPolicyResponse, "PutScalingPolicy")
      end

      # Creates or updates a scheduled action for an Application Auto Scaling scalable target. Each scalable
      # target is identified by a service namespace, resource ID, and scalable dimension. A scheduled action
      # applies to the scalable target identified by those three attributes. You cannot create a scheduled
      # action until you have registered the resource as a scalable target. When you specify start and end
      # times with a recurring schedule using a cron expression or rates, they form the boundaries for when
      # the recurring action starts and stops. To update a scheduled action, specify the parameters that you
      # want to change. If you don't specify start and end times, the old values are deleted. For more
      # information, see Scheduled scaling in the Application Auto Scaling User Guide . If a scalable target
      # is deregistered, the scalable target is no longer available to run scheduled actions. Any scheduled
      # actions that were specified for the scalable target are deleted.

      def put_scheduled_action(
        resource_id : String,
        scalable_dimension : String,
        scheduled_action_name : String,
        service_namespace : String,
        end_time : Time? = nil,
        scalable_target_action : Types::ScalableTargetAction? = nil,
        schedule : String? = nil,
        start_time : Time? = nil,
        timezone : String? = nil
      ) : Types::PutScheduledActionResponse

        input = Types::PutScheduledActionRequest.new(resource_id: resource_id, scalable_dimension: scalable_dimension, scheduled_action_name: scheduled_action_name, service_namespace: service_namespace, end_time: end_time, scalable_target_action: scalable_target_action, schedule: schedule, start_time: start_time, timezone: timezone)
        put_scheduled_action(input)
      end

      def put_scheduled_action(input : Types::PutScheduledActionRequest) : Types::PutScheduledActionResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SCHEDULED_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutScheduledActionResponse, "PutScheduledAction")
      end

      # Registers or updates a scalable target, which is the resource that you want to scale. Scalable
      # targets are uniquely identified by the combination of resource ID, scalable dimension, and
      # namespace, which represents some capacity dimension of the underlying service. When you register a
      # new scalable target, you must specify values for the minimum and maximum capacity. If the specified
      # resource is not active in the target service, this operation does not change the resource's current
      # capacity. Otherwise, it changes the resource's current capacity to a value that is inside of this
      # range. If you add a scaling policy, current capacity is adjustable within the specified range when
      # scaling starts. Application Auto Scaling scaling policies will not scale capacity to values that are
      # outside of the minimum and maximum range. After you register a scalable target, you do not need to
      # register it again to use other Application Auto Scaling operations. To see which resources have been
      # registered, use DescribeScalableTargets . You can also view the scaling policies for a service
      # namespace by using DescribeScalableTargets . If you no longer need a scalable target, you can
      # deregister it by using DeregisterScalableTarget . To update a scalable target, specify the
      # parameters that you want to change. Include the parameters that identify the scalable target:
      # resource ID, scalable dimension, and namespace. Any parameters that you don't specify are not
      # changed by this update request. If you call the RegisterScalableTarget API operation to create a
      # scalable target, there might be a brief delay until the operation achieves eventual consistency .
      # You might become aware of this brief delay if you get unexpected errors when performing sequential
      # operations. The typical strategy is to retry the request, and some Amazon Web Services SDKs include
      # automatic backoff and retry logic. If you call the RegisterScalableTarget API operation to update an
      # existing scalable target, Application Auto Scaling retrieves the current capacity of the resource.
      # If it's below the minimum capacity or above the maximum capacity, Application Auto Scaling adjusts
      # the capacity of the scalable target to place it within these bounds, even if you don't include the
      # MinCapacity or MaxCapacity request parameters.

      def register_scalable_target(
        resource_id : String,
        scalable_dimension : String,
        service_namespace : String,
        max_capacity : Int32? = nil,
        min_capacity : Int32? = nil,
        role_arn : String? = nil,
        suspended_state : Types::SuspendedState? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::RegisterScalableTargetResponse

        input = Types::RegisterScalableTargetRequest.new(resource_id: resource_id, scalable_dimension: scalable_dimension, service_namespace: service_namespace, max_capacity: max_capacity, min_capacity: min_capacity, role_arn: role_arn, suspended_state: suspended_state, tags: tags)
        register_scalable_target(input)
      end

      def register_scalable_target(input : Types::RegisterScalableTargetRequest) : Types::RegisterScalableTargetResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_SCALABLE_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterScalableTargetResponse, "RegisterScalableTarget")
      end

      # Adds or edits tags on an Application Auto Scaling scalable target. Each tag consists of a tag key
      # and a tag value, which are both case-sensitive strings. To add a tag, specify a new tag key and a
      # tag value. To edit a tag, specify an existing tag key and a new tag value. You can use this
      # operation to tag an Application Auto Scaling scalable target, but you cannot tag a scaling policy or
      # scheduled action. You can also add tags to an Application Auto Scaling scalable target while
      # creating it ( RegisterScalableTarget ). For general information about tags, including the format and
      # syntax, see Tagging your Amazon Web Services resources in the Amazon Web Services General Reference
      # . Use tags to control access to a scalable target. For more information, see Tagging support for
      # Application Auto Scaling in the Application Auto Scaling User Guide .

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes tags from an Application Auto Scaling scalable target. To delete a tag, specify the tag key
      # and the Application Auto Scaling scalable target.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end
    end
  end
end
