module AwsSdk
  module ARCZonalShift
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Cancel an in-progress practice run zonal shift in Amazon Application Recovery Controller.

      def cancel_practice_run(
        zonal_shift_id : String
      ) : Protocol::Request
        input = Types::CancelPracticeRunRequest.new(zonal_shift_id: zonal_shift_id)
        cancel_practice_run(input)
      end

      def cancel_practice_run(input : Types::CancelPracticeRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_PRACTICE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancel a zonal shift in Amazon Application Recovery Controller. To cancel the zonal shift, specify
      # the zonal shift ID. A zonal shift can be one that you've started for a resource in your Amazon Web
      # Services account in an Amazon Web Services Region, or it can be a zonal shift started by a practice
      # run with zonal autoshift.

      def cancel_zonal_shift(
        zonal_shift_id : String
      ) : Protocol::Request
        input = Types::CancelZonalShiftRequest.new(zonal_shift_id: zonal_shift_id)
        cancel_zonal_shift(input)
      end

      def cancel_zonal_shift(input : Types::CancelZonalShiftRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ZONAL_SHIFT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A practice run configuration for zonal autoshift is required when you enable zonal autoshift. A
      # practice run configuration includes specifications for blocked dates and blocked time windows, and
      # for Amazon CloudWatch alarms that you create to use with practice runs. The alarms that you specify
      # are an outcome alarm , to monitor application health during practice runs and, optionally, a
      # blocking alarm , to block practice runs from starting. When a resource has a practice run
      # configuration, ARC starts zonal shifts for the resource weekly, to shift traffic for practice runs.
      # Practice runs help you to ensure that shifting away traffic from an Availability Zone during an
      # autoshift is safe for your application. For more information, see Considerations when you configure
      # zonal autoshift in the Amazon Application Recovery Controller Developer Guide.

      def create_practice_run_configuration(
        outcome_alarms : Array(Types::ControlCondition),
        resource_identifier : String,
        allowed_windows : Array(String)? = nil,
        blocked_dates : Array(String)? = nil,
        blocked_windows : Array(String)? = nil,
        blocking_alarms : Array(Types::ControlCondition)? = nil
      ) : Protocol::Request
        input = Types::CreatePracticeRunConfigurationRequest.new(outcome_alarms: outcome_alarms, resource_identifier: resource_identifier, allowed_windows: allowed_windows, blocked_dates: blocked_dates, blocked_windows: blocked_windows, blocking_alarms: blocking_alarms)
        create_practice_run_configuration(input)
      end

      def create_practice_run_configuration(input : Types::CreatePracticeRunConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRACTICE_RUN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the practice run configuration for a resource. Before you can delete a practice run
      # configuration for a resource., you must disable zonal autoshift for the resource. Practice runs must
      # be configured for zonal autoshift to be enabled.

      def delete_practice_run_configuration(
        resource_identifier : String
      ) : Protocol::Request
        input = Types::DeletePracticeRunConfigurationRequest.new(resource_identifier: resource_identifier)
        delete_practice_run_configuration(input)
      end

      def delete_practice_run_configuration(input : Types::DeletePracticeRunConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRACTICE_RUN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of the autoshift observer notification. Autoshift observer notifications notify
      # you through Amazon EventBridge when there is an autoshift event for zonal autoshift. The status can
      # be ENABLED or DISABLED . When ENABLED , a notification is sent when an autoshift is triggered. When
      # DISABLED , notifications are not sent.

      def get_autoshift_observer_notification_status : Protocol::Request
        input = Types::GetAutoshiftObserverNotificationStatusRequest.new
        get_autoshift_observer_notification_status(input)
      end

      def get_autoshift_observer_notification_status(input : Types::GetAutoshiftObserverNotificationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOSHIFT_OBSERVER_NOTIFICATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a resource that's been registered for zonal shifts with Amazon Application
      # Recovery Controller in this Amazon Web Services Region. Resources that are registered for zonal
      # shifts are managed resources in ARC. You can start zonal shifts and configure zonal autoshift for
      # managed resources.

      def get_managed_resource(
        resource_identifier : String
      ) : Protocol::Request
        input = Types::GetManagedResourceRequest.new(resource_identifier: resource_identifier)
        get_managed_resource(input)
      end

      def get_managed_resource(input : Types::GetManagedResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the autoshifts for an Amazon Web Services Region. By default, the call returns only ACTIVE
      # autoshifts. Optionally, you can specify the status parameter to return COMPLETED autoshifts.

      def list_autoshifts(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListAutoshiftsRequest.new(max_results: max_results, next_token: next_token, status: status)
        list_autoshifts(input)
      end

      def list_autoshifts(input : Types::ListAutoshiftsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOSHIFTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the resources in your Amazon Web Services account in this Amazon Web Services Region that
      # are managed for zonal shifts in Amazon Application Recovery Controller, and information about them.
      # The information includes the zonal autoshift status for the resource, as well as the Amazon Resource
      # Name (ARN), the Availability Zones that each resource is deployed in, and the resource name.

      def list_managed_resources(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedResourcesRequest.new(max_results: max_results, next_token: next_token)
        list_managed_resources(input)
      end

      def list_managed_resources(input : Types::ListManagedResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all active and completed zonal shifts in Amazon Application Recovery Controller in your Amazon
      # Web Services account in this Amazon Web Services Region. ListZonalShifts returns customer-initiated
      # zonal shifts, as well as practice run zonal shifts that ARC started on your behalf for zonal
      # autoshift. For more information about listing autoshifts, see "&gt;ListAutoshifts .

      def list_zonal_shifts(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListZonalShiftsRequest.new(max_results: max_results, next_token: next_token, resource_identifier: resource_identifier, status: status)
        list_zonal_shifts(input)
      end

      def list_zonal_shifts(input : Types::ListZonalShiftsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ZONAL_SHIFTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start an on-demand practice run zonal shift in Amazon Application Recovery Controller. With zonal
      # autoshift enabled, you can start an on-demand practice run to verify preparedness at any time.
      # Amazon Web Services also runs automated practice runs about weekly when you have enabled zonal
      # autoshift. For more information, see Considerations when you configure zonal autoshift in the Amazon
      # Application Recovery Controller Developer Guide.

      def start_practice_run(
        away_from : String,
        comment : String,
        resource_identifier : String
      ) : Protocol::Request
        input = Types::StartPracticeRunRequest.new(away_from: away_from, comment: comment, resource_identifier: resource_identifier)
        start_practice_run(input)
      end

      def start_practice_run(input : Types::StartPracticeRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PRACTICE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # You start a zonal shift to temporarily move load balancer traffic away from an Availability Zone in
      # an Amazon Web Services Region, to help your application recover immediately, for example, from a
      # developer's bad code deployment or from an Amazon Web Services infrastructure failure in a single
      # Availability Zone. You can start a zonal shift in ARC only for managed resources in your Amazon Web
      # Services account in an Amazon Web Services Region. Resources are automatically registered with ARC
      # by Amazon Web Services services. Amazon Application Recovery Controller currently supports enabling
      # the following resources for zonal shift and zonal autoshift: Amazon EC2 Auto Scaling groups Amazon
      # Elastic Kubernetes Service Application Load Balancer Network Load Balancer When you start a zonal
      # shift, traffic for the resource is no longer routed to the Availability Zone. The zonal shift is
      # created immediately in ARC. However, it can take a short time, typically up to a few minutes, for
      # existing, in-progress connections in the Availability Zone to complete. For more information, see
      # Zonal shift in the Amazon Application Recovery Controller Developer Guide.

      def start_zonal_shift(
        away_from : String,
        comment : String,
        expires_in : String,
        resource_identifier : String
      ) : Protocol::Request
        input = Types::StartZonalShiftRequest.new(away_from: away_from, comment: comment, expires_in: expires_in, resource_identifier: resource_identifier)
        start_zonal_shift(input)
      end

      def start_zonal_shift(input : Types::StartZonalShiftRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ZONAL_SHIFT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the status of autoshift observer notification. Autoshift observer notification enables you to
      # be notified, through Amazon EventBridge, when there is an autoshift event for zonal autoshift. If
      # the status is ENABLED , ARC includes all autoshift events when you use the EventBridge pattern
      # Autoshift In Progress . When the status is DISABLED , ARC includes only autoshift events for
      # autoshifts when one or more of your resources is included in the autoshift. For more information,
      # see Notifications for practice runs and autoshifts in the Amazon Application Recovery Controller
      # Developer Guide.

      def update_autoshift_observer_notification_status(
        status : String
      ) : Protocol::Request
        input = Types::UpdateAutoshiftObserverNotificationStatusRequest.new(status: status)
        update_autoshift_observer_notification_status(input)
      end

      def update_autoshift_observer_notification_status(input : Types::UpdateAutoshiftObserverNotificationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOSHIFT_OBSERVER_NOTIFICATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a practice run configuration to change one or more of the following: add, change, or remove
      # the blocking alarm; change the outcome alarm; or add, change, or remove blocking dates or time
      # windows.

      def update_practice_run_configuration(
        resource_identifier : String,
        allowed_windows : Array(String)? = nil,
        blocked_dates : Array(String)? = nil,
        blocked_windows : Array(String)? = nil,
        blocking_alarms : Array(Types::ControlCondition)? = nil,
        outcome_alarms : Array(Types::ControlCondition)? = nil
      ) : Protocol::Request
        input = Types::UpdatePracticeRunConfigurationRequest.new(resource_identifier: resource_identifier, allowed_windows: allowed_windows, blocked_dates: blocked_dates, blocked_windows: blocked_windows, blocking_alarms: blocking_alarms, outcome_alarms: outcome_alarms)
        update_practice_run_configuration(input)
      end

      def update_practice_run_configuration(input : Types::UpdatePracticeRunConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRACTICE_RUN_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The zonal autoshift configuration for a resource includes the practice run configuration and the
      # status for running autoshifts, zonal autoshift status. When a resource has a practice run
      # configuration, ARC starts weekly zonal shifts for the resource, to shift traffic away from an
      # Availability Zone. Weekly practice runs help you to make sure that your application can continue to
      # operate normally with the loss of one Availability Zone. You can update the zonal autoshift status
      # to enable or disable zonal autoshift. When zonal autoshift is ENABLED , you authorize Amazon Web
      # Services to shift away resource traffic for an application from an Availability Zone during events,
      # on your behalf, to help reduce time to recovery. Traffic is also shifted away for the required
      # weekly practice runs.

      def update_zonal_autoshift_configuration(
        resource_identifier : String,
        zonal_autoshift_status : String
      ) : Protocol::Request
        input = Types::UpdateZonalAutoshiftConfigurationRequest.new(resource_identifier: resource_identifier, zonal_autoshift_status: zonal_autoshift_status)
        update_zonal_autoshift_configuration(input)
      end

      def update_zonal_autoshift_configuration(input : Types::UpdateZonalAutoshiftConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ZONAL_AUTOSHIFT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an active zonal shift in Amazon Application Recovery Controller in your Amazon Web Services
      # account. You can update a zonal shift to set a new expiration, or edit or replace the comment for
      # the zonal shift.

      def update_zonal_shift(
        zonal_shift_id : String,
        comment : String? = nil,
        expires_in : String? = nil
      ) : Protocol::Request
        input = Types::UpdateZonalShiftRequest.new(zonal_shift_id: zonal_shift_id, comment: comment, expires_in: expires_in)
        update_zonal_shift(input)
      end

      def update_zonal_shift(input : Types::UpdateZonalShiftRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ZONAL_SHIFT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
