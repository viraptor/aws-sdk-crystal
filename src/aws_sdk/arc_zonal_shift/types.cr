require "json"
require "time"

module AwsSdk
  module ARCZonalShift
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex structure that lists an autoshift that is currently active for a managed resource and
      # information about the autoshift. For more information, see How zonal autoshift and practice runs
      # work in the Amazon Application Recovery Controller Developer Guide.
      struct AutoshiftInResource
        include JSON::Serializable

        # The appliedStatus field specifies which application traffic shift is in effect for a resource when
        # there is more than one active traffic shift. There can be more than one application traffic shift in
        # progress at the same time - that is, practice run zonal shifts, customer-initiated zonal shifts, or
        # an autoshift. The appliedStatus field for a shift that is in progress for a resource can have one of
        # two values: APPLIED or NOT_APPLIED . The zonal shift or autoshift that is currently in effect for
        # the resource has an appliedStatus set to APPLIED . The overall principle for precedence is that
        # zonal shifts that you start as a customer take precedence autoshifts, which take precedence over
        # practice runs. That is, customer-initiated zonal shifts &gt; autoshifts &gt; practice run zonal
        # shifts. For more information, see How zonal autoshift and practice runs work in the Amazon
        # Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "appliedStatus")]
        getter applied_status : String

        # The Availability Zone (for example, use1-az1 ) that traffic is shifted away from for a resource,
        # when Amazon Web Services starts an autoshift. Until the autoshift ends, traffic for the resource is
        # instead directed to other Availability Zones in the Amazon Web Services Region. An autoshift can end
        # for a resource, for example, when Amazon Web Services ends the autoshift for the Availability Zone
        # or when you disable zonal autoshift for the resource.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # The time (UTC) when the autoshift started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @applied_status : String,
          @away_from : String,
          @start_time : Time
        )
        end
      end

      # Information about an autoshift. Amazon Web Services starts an autoshift to temporarily move traffic
      # for a resource away from an Availability Zone in an Amazon Web Services Region when Amazon Web
      # Services determines that there's an issue in the Availability Zone that could potentially affect
      # customers. You can configure zonal autoshift in ARC for managed resources in your Amazon Web
      # Services account in a Region. Supported Amazon Web Services resources are automatically registered
      # with ARC. Autoshifts are temporary. When the Availability Zone recovers, Amazon Web Services ends
      # the autoshift, and traffic for the resource is no longer directed to the other Availability Zones in
      # the Region. You can stop an autoshift for a resource by disabling zonal autoshift.
      struct AutoshiftSummary
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is shifted away from for a resource when
        # Amazon Web Services starts an autoshift. Until the autoshift ends, traffic for the resource is
        # instead directed to other Availability Zones in the Amazon Web Services Region. An autoshift can end
        # for a resource, for example, when Amazon Web Services ends the autoshift for the Availability Zone
        # or when you disable zonal autoshift for the resource.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # The time (in UTC) when the autoshift started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status for an autoshift.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time (in UTC) when the autoshift ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @away_from : String,
          @start_time : Time,
          @status : String,
          @end_time : Time? = nil
        )
        end
      end

      struct CancelPracticeRunRequest
        include JSON::Serializable

        # The identifier of a practice run zonal shift in Amazon Application Recovery Controller that you want
        # to cancel.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        def initialize(
          @zonal_shift_id : String
        )
        end
      end

      struct CancelPracticeRunResponse
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic was moved away from for a resource that
        # you specified for the practice run.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # The initial comment that you entered about the practice run. Be aware that this comment can be
        # overwritten by Amazon Web Services if the automatic check for balanced capacity fails. For more
        # information, see Capacity checks for practice runs in the Amazon Application Recovery Controller
        # Developer Guide.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The expiry time (expiration time) for an on-demand practice run zonal shift is 30 minutes from the
        # time when you start the practice run, unless you cancel it before that time. However, be aware that
        # the expiryTime field for practice run zonal shifts always has a value of 1 minute.
        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : Time

        # The identifier for the resource that you canceled a practice run zonal shift for. The identifier is
        # the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The time (UTC) when the zonal shift starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # A status for the practice run that you canceled (expected status is CANCELED ). The Status for a
        # practice run zonal shift can have one of the following values:
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of the practice run zonal shift in Amazon Application Recovery Controller that was
        # canceled.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        def initialize(
          @away_from : String,
          @comment : String,
          @expiry_time : Time,
          @resource_identifier : String,
          @start_time : Time,
          @status : String,
          @zonal_shift_id : String
        )
        end
      end

      struct CancelZonalShiftRequest
        include JSON::Serializable

        # The internally-generated identifier of a zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        def initialize(
          @zonal_shift_id : String
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the conflict exception.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The zonal shift ID associated with the conflict exception.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String?

        def initialize(
          @message : String,
          @reason : String,
          @zonal_shift_id : String? = nil
        )
        end
      end

      # A control condition is an alarm that you specify for a practice run. When you configure practice
      # runs with zonal autoshift for a resource, you specify Amazon CloudWatch alarms, which you create in
      # CloudWatch to use with the practice run. The alarms that you specify are an outcome alarm , to
      # monitor application health during practice runs and, optionally, a blocking alarm , to block
      # practice runs from starting or to interrupt a practice run in progress. Control condition alarms do
      # not apply for autoshifts. For more information, see Considerations when you configure zonal
      # autoshift in the Amazon Application Recovery Controller Developer Guide.
      struct ControlCondition
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for an Amazon CloudWatch alarm that you specify as a control
        # condition for a practice run.
        @[JSON::Field(key: "alarmIdentifier")]
        getter alarm_identifier : String

        # The type of alarm specified for a practice run. You can only specify Amazon CloudWatch alarms for
        # practice runs, so the only valid value is CLOUDWATCH .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @alarm_identifier : String,
          @type : String
        )
        end
      end

      struct CreatePracticeRunConfigurationRequest
        include JSON::Serializable

        # Outcome alarms for practice runs are alarms that you specify that end a practice run when one or
        # more of the alarms is in an ALARM state. Configure one or more of these alarms to monitor the health
        # of your application when traffic is shifted away from an Availability Zone during each practice run.
        # You should configure these alarms to go into an ALARM state if you want to stop a zonal shift, to
        # let traffic for the resource return to the original Availability Zone.
        @[JSON::Field(key: "outcomeAlarms")]
        getter outcome_alarms : Array(Types::ControlCondition)

        # The identifier of the resource that Amazon Web Services shifts traffic for with a practice run zonal
        # shift. The identifier is the Amazon Resource Name (ARN) for the resource. Amazon Application
        # Recovery Controller currently supports enabling the following resources for zonal shift and zonal
        # autoshift: Amazon EC2 Auto Scaling groups Amazon Elastic Kubernetes Service Application Load
        # Balancer Network Load Balancer
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # Optionally, you can allow ARC to start practice runs for specific windows of days and times. The
        # format for allowed windows is: DAY:HH:SS-DAY:HH:SS. Keep in mind, when you specify dates, that dates
        # and times for practice runs are in UTC. Also, be aware of potential time adjustments that might be
        # required for daylight saving time differences. Separate multiple allowed windows with spaces. For
        # example, say you want to allow practice runs only on Wednesdays and Fridays from noon to 5 p.m. For
        # this scenario, you could set the following recurring days and times as allowed windows, for example:
        # Wed-12:00-Wed:17:00 Fri-12:00-Fri:17:00 . The allowedWindows have to start and end on the same day.
        # Windows that span multiple days aren't supported.
        @[JSON::Field(key: "allowedWindows")]
        getter allowed_windows : Array(String)?

        # Optionally, you can block ARC from starting practice runs for a resource on specific calendar dates.
        # The format for blocked dates is: YYYY-MM-DD. Keep in mind, when you specify dates, that dates and
        # times for practice runs are in UTC. Separate multiple blocked dates with spaces. For example, if you
        # have an application update scheduled to launch on May 1, 2024, and you don't want practice runs to
        # shift traffic away at that time, you could set a blocked date for 2024-05-01 .
        @[JSON::Field(key: "blockedDates")]
        getter blocked_dates : Array(String)?

        # Optionally, you can block ARC from starting practice runs for specific windows of days and times.
        # The format for blocked windows is: DAY:HH:SS-DAY:HH:SS. Keep in mind, when you specify dates, that
        # dates and times for practice runs are in UTC. Also, be aware of potential time adjustments that
        # might be required for daylight saving time differences. Separate multiple blocked windows with
        # spaces. For example, say you run business report summaries three days a week. For this scenario, you
        # could set the following recurring days and times as blocked windows, for example:
        # Mon:00:00-Mon:10:00 Wed-20:30-Wed:21:30 Fri-20:30-Fri:21:30 . The blockedWindows have to start and
        # end on the same day. Windows that span multiple days aren't supported.
        @[JSON::Field(key: "blockedWindows")]
        getter blocked_windows : Array(String)?

        # Blocking alarms for practice runs are optional alarms that you can specify that block practice runs
        # when one or more of the alarms is in an ALARM state.
        @[JSON::Field(key: "blockingAlarms")]
        getter blocking_alarms : Array(Types::ControlCondition)?

        def initialize(
          @outcome_alarms : Array(Types::ControlCondition),
          @resource_identifier : String,
          @allowed_windows : Array(String)? = nil,
          @blocked_dates : Array(String)? = nil,
          @blocked_windows : Array(String)? = nil,
          @blocking_alarms : Array(Types::ControlCondition)? = nil
        )
        end
      end

      struct CreatePracticeRunConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you configured the practice run for.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the resource that you configured the practice run for.
        @[JSON::Field(key: "name")]
        getter name : String

        # A practice run configuration for a resource. Configurations include the outcome alarm that you
        # specify for practice runs, and, optionally, a blocking alarm and blocking dates and windows.
        @[JSON::Field(key: "practiceRunConfiguration")]
        getter practice_run_configuration : Types::PracticeRunConfiguration

        # The status for zonal autoshift for a resource. When you specify ENABLED for the autoshift status,
        # Amazon Web Services shifts traffic away from shifts away application resource traffic from an
        # Availability Zone, on your behalf, when internal telemetry indicates that there is an Availability
        # Zone impairment that could potentially impact customers. When you enable zonal autoshift, you must
        # also configure practice runs for the resource.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String

        def initialize(
          @arn : String,
          @name : String,
          @practice_run_configuration : Types::PracticeRunConfiguration,
          @zonal_autoshift_status : String
        )
        end
      end

      struct DeletePracticeRunConfigurationRequest
        include JSON::Serializable

        # The identifier for the resource that you want to delete the practice run configuration for. The
        # identifier is the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @resource_identifier : String
        )
        end
      end

      struct DeletePracticeRunConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you deleted the practice run for.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the resource that you deleted the practice run for.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of zonal autoshift for the resource.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String

        def initialize(
          @arn : String,
          @name : String,
          @zonal_autoshift_status : String
        )
        end
      end

      struct GetAutoshiftObserverNotificationStatusRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAutoshiftObserverNotificationStatusResponse
        include JSON::Serializable

        # The status of autoshift observer notification. If the status is ENABLED , ARC includes all autoshift
        # events when you use the Amazon EventBridge pattern Autoshift In Progress . When the status is
        # DISABLED , ARC includes only autoshift events for autoshifts when one or more of your resources is
        # included in the autoshift.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct GetManagedResourceRequest
        include JSON::Serializable

        # The identifier for the resource that Amazon Web Services shifts traffic for. The identifier is the
        # Amazon Resource Name (ARN) for the resource. Amazon Application Recovery Controller currently
        # supports enabling the following resources for zonal shift and zonal autoshift: Amazon EC2 Auto
        # Scaling groups Amazon Elastic Kubernetes Service Application Load Balancer Network Load Balancer
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @resource_identifier : String
        )
        end
      end

      struct GetManagedResourceResponse
        include JSON::Serializable

        # A collection of key-value pairs that indicate whether resources are active in Availability Zones or
        # not. The key name is the Availability Zone where the resource is deployed. The value is 1 or 0.
        @[JSON::Field(key: "appliedWeights")]
        getter applied_weights : Hash(String, Float64)

        # The zonal shifts that are currently active for a resource.
        @[JSON::Field(key: "zonalShifts")]
        getter zonal_shifts : Array(Types::ZonalShiftInResource)

        # The Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of the autoshifts that are active for the resource.
        @[JSON::Field(key: "autoshifts")]
        getter autoshifts : Array(Types::AutoshiftInResource)?

        # The name of the resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The practice run configuration for zonal autoshift that's associated with the resource.
        @[JSON::Field(key: "practiceRunConfiguration")]
        getter practice_run_configuration : Types::PracticeRunConfiguration?

        # The status for zonal autoshift for a resource. When the autoshift status is ENABLED , Amazon Web
        # Services shifts traffic for a resource away from an Availability Zone, on your behalf, when Amazon
        # Web Services determines that there's an issue in the Availability Zone that could potentially affect
        # customers.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String?

        def initialize(
          @applied_weights : Hash(String, Float64),
          @zonal_shifts : Array(Types::ZonalShiftInResource),
          @arn : String? = nil,
          @autoshifts : Array(Types::AutoshiftInResource)? = nil,
          @name : String? = nil,
          @practice_run_configuration : Types::PracticeRunConfiguration? = nil,
          @zonal_autoshift_status : String? = nil
        )
        end
      end

      # There was an internal server error.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListAutoshiftsRequest
        include JSON::Serializable

        # The number of objects that you want to return with this call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the autoshift.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListAutoshiftsResponse
        include JSON::Serializable

        # The items in the response list.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AutoshiftSummary)?

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AutoshiftSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedResourcesRequest
        include JSON::Serializable

        # The number of objects that you want to return with this call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListManagedResourcesResponse
        include JSON::Serializable

        # The items in the response list.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ManagedResourceSummary)

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ManagedResourceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListZonalShiftsRequest
        include JSON::Serializable

        # The number of objects that you want to return with this call.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier for the resource that you want to list zonal shifts for. The identifier is the Amazon
        # Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String?

        # A status for a zonal shift. The Status for a zonal shift can have one of the following values:
        # ACTIVE : The zonal shift has been started and is active. EXPIRED : The zonal shift has expired (the
        # expiry time was exceeded). CANCELED : The zonal shift was canceled.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListZonalShiftsResponse
        include JSON::Serializable

        # The items in the response list.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ZonalShiftSummary)?

        # Specifies that you want to receive the next page of results. Valid only if you received a nextToken
        # response in the previous request. If you did, it indicates that more output is available. Set this
        # parameter to the value provided by the previous call's nextToken response to request the next page
        # of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ZonalShiftSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A complex structure for a managed resource in an Amazon Web Services account with information about
      # zonal shifts and autoshifts. You can start a zonal shift in ARC for a managed resource to
      # temporarily move traffic for the resource away from an Availability Zone in an Amazon Web Services
      # Region. You can also configure zonal autoshift for a managed resource. At this time, managed
      # resources are Amazon EC2 Auto Scaling groups, Amazon Elastic Kubernetes Service, Network Load
      # Balancers, and Application Load Balancer.
      struct ManagedResourceSummary
        include JSON::Serializable

        # The Availability Zones that a resource is deployed in.
        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(String)

        # A collection of key-value pairs that indicate whether resources are active in Availability Zones or
        # not. The key name is the Availability Zone where the resource is deployed. The value is 1 or 0.
        @[JSON::Field(key: "appliedWeights")]
        getter applied_weights : Hash(String, Float64)?

        # The Amazon Resource Name (ARN) for the managed resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # An array of the autoshifts that have been completed for a resource.
        @[JSON::Field(key: "autoshifts")]
        getter autoshifts : Array(Types::AutoshiftInResource)?

        # The name of the managed resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # This status tracks whether a practice run configuration exists for a resource. When you configure a
        # practice run for a resource so that a practice run configuration exists, ARC sets this value to
        # ENABLED . If a you have not configured a practice run for the resource, or delete a practice run
        # configuration, ARC sets the value to DISABLED . ARC updates this status; you can't set a practice
        # run status to ENABLED or DISABLED .
        @[JSON::Field(key: "practiceRunStatus")]
        getter practice_run_status : String?

        # The status of autoshift for a resource. When you configure zonal autoshift for a resource, you can
        # set the value of the status to ENABLED or DISABLED .
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String?

        # An array of the zonal shifts for a resource.
        @[JSON::Field(key: "zonalShifts")]
        getter zonal_shifts : Array(Types::ZonalShiftInResource)?

        def initialize(
          @availability_zones : Array(String),
          @applied_weights : Hash(String, Float64)? = nil,
          @arn : String? = nil,
          @autoshifts : Array(Types::AutoshiftInResource)? = nil,
          @name : String? = nil,
          @practice_run_status : String? = nil,
          @zonal_autoshift_status : String? = nil,
          @zonal_shifts : Array(Types::ZonalShiftInResource)? = nil
        )
        end
      end

      # A practice run configuration for a resource includes the Amazon CloudWatch alarms that you've
      # specified for a practice run, as well as any blocked dates or blocked windows for the practice run.
      # When a resource has a practice run configuration, ARC shifts traffic for the resource weekly for
      # practice runs. Practice runs are required for zonal autoshift. The zonal shifts that ARC starts for
      # practice runs help you to ensure that shifting away traffic from an Availability Zone during an
      # autoshift is safe for your application. You can update or delete a practice run configuration.
      # Before you delete a practice run configuration, you must disable zonal autoshift for the resource. A
      # practice run configuration is required when zonal autoshift is enabled.
      struct PracticeRunConfiguration
        include JSON::Serializable

        # Outcome alarms for practice runs are alarms that you specify that end a practice run when one or
        # more of the alarms is in an ALARM state.
        @[JSON::Field(key: "outcomeAlarms")]
        getter outcome_alarms : Array(Types::ControlCondition)

        # An array of one or more windows of days and times that you can allow ARC to start practice runs for
        # a resource. For example, say you want to allow practice runs only on Wednesdays and Fridays from
        # noon to 5 p.m. For this scenario, you could set the following recurring days and times as allowed
        # windows, for example: Wed-12:00-Wed:17:00 Fri-12:00-Fri:17:00 . The allowedWindows have to start and
        # end on the same day. Windows that span multiple days aren't supported.
        @[JSON::Field(key: "allowedWindows")]
        getter allowed_windows : Array(String)?

        # An array of one or more dates that you can specify when Amazon Web Services does not start practice
        # runs for a resource. Specify blocked dates, in UTC, in the format YYYY-MM-DD , separated by spaces.
        @[JSON::Field(key: "blockedDates")]
        getter blocked_dates : Array(String)?

        # An array of one or more windows of days and times that you can block ARC from starting practice runs
        # for a resource. Specify the blocked windows in UTC, using the format DAY:HH:MM-DAY:HH:MM , separated
        # by spaces. For example, MON:18:30-MON:19:30 TUE:18:30-TUE:19:30 . The blockedWindows have to start
        # and end on the same day. Windows that span multiple days aren't supported.
        @[JSON::Field(key: "blockedWindows")]
        getter blocked_windows : Array(String)?

        # Blocking alarms for practice runs are optional alarms that you can specify that block practice runs
        # when one or more of the alarms is in an ALARM state.
        @[JSON::Field(key: "blockingAlarms")]
        getter blocking_alarms : Array(Types::ControlCondition)?

        def initialize(
          @outcome_alarms : Array(Types::ControlCondition),
          @allowed_windows : Array(String)? = nil,
          @blocked_dates : Array(String)? = nil,
          @blocked_windows : Array(String)? = nil,
          @blocking_alarms : Array(Types::ControlCondition)? = nil
        )
        end
      end

      # The input requested a resource that was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct StartPracticeRunRequest
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is shifted away from for the resource
        # that you specify for the practice run.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # The initial comment that you enter about the practice run. Be aware that this comment can be
        # overwritten by Amazon Web Services if the automatic check for balanced capacity fails. For more
        # information, see Capacity checks for practice runs in the Amazon Application Recovery Controller
        # Developer Guide.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The identifier for the resource that you want to start a practice run zonal shift for. The
        # identifier is the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @away_from : String,
          @comment : String,
          @resource_identifier : String
        )
        end
      end

      struct StartPracticeRunResponse
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is shifted away from for the resource
        # that you specify for the practice run.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # The initial comment that you enter about the practice run. Be aware that this comment can be
        # overwritten by Amazon Web Services if the automatic check for balanced capacity fails. For more
        # information, see Capacity checks for practice runs in the Amazon Application Recovery Controller
        # Developer Guide.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The expiry time (expiration time) for an on-demand practice run zonal shift is 30 minutes from the
        # time when you start the practice run, unless you cancel it before that time. However, be aware that
        # the expiryTime field for practice run zonal shifts always has a value of 1 minute.
        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : Time

        # The identifier for the resource that you want to shift traffic for. The identifier is the Amazon
        # Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The time (UTC) when the zonal shift starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # A status for the practice run (expected status is ACTIVE ).
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of a practice run zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        def initialize(
          @away_from : String,
          @comment : String,
          @expiry_time : Time,
          @resource_identifier : String,
          @start_time : Time,
          @status : String,
          @zonal_shift_id : String
        )
        end
      end

      struct StartZonalShiftRequest
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is moved away from for a resource when
        # you start a zonal shift. Until the zonal shift expires or you cancel it, traffic for the resource is
        # instead moved to other Availability Zones in the Amazon Web Services Region.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # A comment that you enter about the zonal shift. Only the latest comment is retained; no comment
        # history is maintained. A new comment overwrites any existing comment string.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The length of time that you want a zonal shift to be active, which ARC converts to an expiry time
        # (expiration time). Zonal shifts are temporary. You can set a zonal shift to be active initially for
        # up to three days (72 hours). If you want to still keep traffic away from an Availability Zone, you
        # can update the zonal shift and set a new expiration. You can also cancel a zonal shift, before it
        # expires, for example, if you're ready to restore traffic to the Availability Zone. To set a length
        # of time for a zonal shift to be active, specify a whole number, and then one of the following, with
        # no space: A lowercase letter m: To specify that the value is in minutes. A lowercase letter h: To
        # specify that the value is in hours. For example: 20h means the zonal shift expires in 20 hours. 120m
        # means the zonal shift expires in 120 minutes (2 hours).
        @[JSON::Field(key: "expiresIn")]
        getter expires_in : String

        # The identifier for the resource that Amazon Web Services shifts traffic for. The identifier is the
        # Amazon Resource Name (ARN) for the resource. Amazon Application Recovery Controller currently
        # supports enabling the following resources for zonal shift and zonal autoshift: Amazon EC2 Auto
        # Scaling groups Amazon Elastic Kubernetes Service Application Load Balancer Network Load Balancer
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        def initialize(
          @away_from : String,
          @comment : String,
          @expires_in : String,
          @resource_identifier : String
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateAutoshiftObserverNotificationStatusRequest
        include JSON::Serializable

        # The status to set for autoshift observer notification. If the status is ENABLED , ARC includes all
        # autoshift events when you use the Amazon EventBridge pattern Autoshift In Progress . When the status
        # is DISABLED , ARC includes only autoshift events for autoshifts when one or more of your resources
        # is included in the autoshift.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct UpdateAutoshiftObserverNotificationStatusResponse
        include JSON::Serializable

        # The status for autoshift observer notification.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct UpdatePracticeRunConfigurationRequest
        include JSON::Serializable

        # The identifier for the resource that you want to update the practice run configuration for. The
        # identifier is the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # Add, change, or remove windows of days and times for when you can, optionally, allow ARC to start a
        # practice run for a resource. The format for allowed windows is: DAY:HH:SS-DAY:HH:SS. Keep in mind,
        # when you specify dates, that dates and times for practice runs are in UTC. Also, be aware of
        # potential time adjustments that might be required for daylight saving time differences. Separate
        # multiple allowed windows with spaces. For example, say you want to allow practice runs only on
        # Wednesdays and Fridays from noon to 5 p.m. For this scenario, you could set the following recurring
        # days and times as allowed windows, for example: Wed-12:00-Wed:17:00 Fri-12:00-Fri:17:00 . The
        # allowedWindows have to start and end on the same day. Windows that span multiple days aren't
        # supported.
        @[JSON::Field(key: "allowedWindows")]
        getter allowed_windows : Array(String)?

        # Add, change, or remove blocked dates for a practice run in zonal autoshift. Optionally, you can
        # block practice runs for specific calendar dates. The format for blocked dates is: YYYY-MM-DD. Keep
        # in mind, when you specify dates, that dates and times for practice runs are in UTC. Separate
        # multiple blocked dates with spaces. For example, if you have an application update scheduled to
        # launch on May 1, 2024, and you don't want practice runs to shift traffic away at that time, you
        # could set a blocked date for 2024-05-01 .
        @[JSON::Field(key: "blockedDates")]
        getter blocked_dates : Array(String)?

        # Add, change, or remove windows of days and times for when you can, optionally, block ARC from
        # starting a practice run for a resource. The format for blocked windows is: DAY:HH:SS-DAY:HH:SS. Keep
        # in mind, when you specify dates, that dates and times for practice runs are in UTC. Also, be aware
        # of potential time adjustments that might be required for daylight saving time differences. Separate
        # multiple blocked windows with spaces. For example, say you run business report summaries three days
        # a week. For this scenario, you might set the following recurring days and times as blocked windows,
        # for example: MON-20:30-21:30 WED-20:30-21:30 FRI-20:30-21:30 .
        @[JSON::Field(key: "blockedWindows")]
        getter blocked_windows : Array(String)?

        # Add, change, or remove the Amazon CloudWatch alarms that you optionally specify as the blocking
        # alarms for practice runs.
        @[JSON::Field(key: "blockingAlarms")]
        getter blocking_alarms : Array(Types::ControlCondition)?

        # Specify one or more Amazon CloudWatch alarms as the outcome alarms for practice runs.
        @[JSON::Field(key: "outcomeAlarms")]
        getter outcome_alarms : Array(Types::ControlCondition)?

        def initialize(
          @resource_identifier : String,
          @allowed_windows : Array(String)? = nil,
          @blocked_dates : Array(String)? = nil,
          @blocked_windows : Array(String)? = nil,
          @blocking_alarms : Array(Types::ControlCondition)? = nil,
          @outcome_alarms : Array(Types::ControlCondition)? = nil
        )
        end
      end

      struct UpdatePracticeRunConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you updated the practice run for.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the resource that you updated the practice run for.
        @[JSON::Field(key: "name")]
        getter name : String

        # The practice run configuration that was updated.
        @[JSON::Field(key: "practiceRunConfiguration")]
        getter practice_run_configuration : Types::PracticeRunConfiguration

        # The zonal autoshift status for the resource that you updated the practice run for.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String

        def initialize(
          @arn : String,
          @name : String,
          @practice_run_configuration : Types::PracticeRunConfiguration,
          @zonal_autoshift_status : String
        )
        end
      end

      struct UpdateZonalAutoshiftConfigurationRequest
        include JSON::Serializable

        # The identifier for the resource that you want to update the zonal autoshift configuration for. The
        # identifier is the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The zonal autoshift status for the resource that you want to update the zonal autoshift
        # configuration for. Choose ENABLED to authorize Amazon Web Services to shift away resource traffic
        # for an application from an Availability Zone during events, on your behalf, to help reduce time to
        # recovery.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String

        def initialize(
          @resource_identifier : String,
          @zonal_autoshift_status : String
        )
        end
      end

      struct UpdateZonalAutoshiftConfigurationResponse
        include JSON::Serializable

        # The identifier for the resource that you updated the zonal autoshift configuration for. The
        # identifier is the Amazon Resource Name (ARN) for the resource.
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The updated zonal autoshift status for the resource.
        @[JSON::Field(key: "zonalAutoshiftStatus")]
        getter zonal_autoshift_status : String

        def initialize(
          @resource_identifier : String,
          @zonal_autoshift_status : String
        )
        end
      end

      struct UpdateZonalShiftRequest
        include JSON::Serializable

        # The identifier of a zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        # A comment that you enter about the zonal shift. Only the latest comment is retained; no comment
        # history is maintained. A new comment overwrites any existing comment string.
        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The length of time that you want a zonal shift to be active, which ARC converts to an expiry time
        # (expiration time). Zonal shifts are temporary. You can set a zonal shift to be active initially for
        # up to three days (72 hours). If you want to still keep traffic away from an Availability Zone, you
        # can update the zonal shift and set a new expiration. You can also cancel a zonal shift, before it
        # expires, for example, if you're ready to restore traffic to the Availability Zone. To set a length
        # of time for a zonal shift to be active, specify a whole number, and then one of the following, with
        # no space: A lowercase letter m: To specify that the value is in minutes. A lowercase letter h: To
        # specify that the value is in hours. For example: 20h means the zonal shift expires in 20 hours. 120m
        # means the zonal shift expires in 120 minutes (2 hours).
        @[JSON::Field(key: "expiresIn")]
        getter expires_in : String?

        def initialize(
          @zonal_shift_id : String,
          @comment : String? = nil,
          @expires_in : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation exception.
        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end

      struct ZonalShift
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is moved away from for a resource when
        # you start a zonal shift. Until the zonal shift expires or you cancel it, traffic for the resource is
        # instead moved to other Availability Zones in the Amazon Web Services Region.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # A comment that you enter about the zonal shift. Only the latest comment is retained; no comment
        # history is maintained. A new comment overwrites any existing comment string.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The expiry time (expiration time) for a customer-initiated zonal shift. A zonal shift is temporary
        # and must be set to expire when you start the zonal shift. You can initially set a zonal shift to
        # expire in a maximum of three days (72 hours). However, you can update a zonal shift to set a new
        # expiration at any time. When you start a zonal shift, you specify how long you want it to be active,
        # which ARC converts to an expiry time (expiration time). You can cancel a zonal shift when you're
        # ready to restore traffic to the Availability Zone, or just wait for it to expire. Or you can update
        # the zonal shift to specify another length of time to expire in.
        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : Time

        # The identifier for the resource that Amazon Web Services shifts traffic for. The identifier is the
        # Amazon Resource Name (ARN) for the resource. Amazon Application Recovery Controller currently
        # supports enabling the following resources for zonal shift and zonal autoshift: Amazon EC2 Auto
        # Scaling groups Amazon Elastic Kubernetes Service Application Load Balancer Network Load Balancer
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The time (UTC) when the zonal shift starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # A status for a zonal shift. The Status for a zonal shift can have one of the following values:
        # ACTIVE: The zonal shift has been started and is active. EXPIRED: The zonal shift has expired (the
        # expiry time was exceeded). CANCELED: The zonal shift was canceled.
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of a zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        def initialize(
          @away_from : String,
          @comment : String,
          @expiry_time : Time,
          @resource_identifier : String,
          @start_time : Time,
          @status : String,
          @zonal_shift_id : String
        )
        end
      end

      # A complex structure that lists the zonal shifts for a managed resource and their statuses for the
      # resource.
      struct ZonalShiftInResource
        include JSON::Serializable

        # The appliedStatus field specifies which application traffic shift is in effect for a resource when
        # there is more than one active traffic shift. There can be more than one application traffic shift in
        # progress at the same time - that is, practice run zonal shifts, customer-initiated zonal shifts, or
        # an autoshift. The appliedStatus field for a shift that is in progress for a resource can have one of
        # two values: APPLIED or NOT_APPLIED . The zonal shift or autoshift that is currently in effect for
        # the resource has an appliedStatus set to APPLIED . The overall principle for precedence is that
        # zonal shifts that you start as a customer take precedence autoshifts, which take precedence over
        # practice runs. That is, customer-initiated zonal shifts &gt; autoshifts &gt; practice run zonal
        # shifts. For more information, see How zonal autoshift and practice runs work in the Amazon
        # Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "appliedStatus")]
        getter applied_status : String

        # The Availability Zone (for example, use1-az1 ) that traffic is moved away from for a resource when
        # you start a zonal shift. Until the zonal shift expires or you cancel it, traffic for the resource is
        # instead moved to other Availability Zones in the Amazon Web Services Region.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # A comment that you enter for a customer-initiated zonal shift. Only the latest comment is retained;
        # no comment history is maintained. That is, a new comment overwrites any existing comment string.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The expiry time (expiration time) for a customer-initiated zonal shift. A zonal shift is temporary
        # and must be set to expire when you start the zonal shift. You can initially set a zonal shift to
        # expire in a maximum of three days (72 hours). However, you can update a zonal shift to set a new
        # expiration at any time. When you start a zonal shift, you specify how long you want it to be active,
        # which ARC converts to an expiry time (expiration time). You can cancel a zonal shift when you're
        # ready to restore traffic to the Availability Zone, or just wait for it to expire. Or you can update
        # the zonal shift to specify another length of time to expire in.
        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : Time

        # The identifier for the resource to include in a zonal shift. The identifier is the Amazon Resource
        # Name (ARN) for the resource. Amazon Application Recovery Controller currently supports enabling the
        # following resources for zonal shift and zonal autoshift: Amazon EC2 Auto Scaling groups Amazon
        # Elastic Kubernetes Service Application Load Balancer Network Load Balancer
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The time (UTC) when the zonal shift starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The identifier of a zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        # The outcome, or end state, returned for a practice run. The following values can be returned:
        # PENDING: Outcome value when a practice run is in progress. SUCCEEDED: Outcome value when the outcome
        # alarm specified for the practice run configuration does not go into an ALARM state during the
        # practice run, and the practice run was not interrupted before it completed the expected 30 minute
        # zonal shift. INTERRUPTED: Outcome value when the practice run was stopped before the expected 30
        # minute zonal shift duration, or there was another problem with the practice run that created an
        # inconclusive outcome. FAILED: Outcome value when the outcome alarm specified for the practice run
        # configuration goes into an ALARM state during the practice run, and the practice run was not
        # interrupted before it completed. CAPACITY_CHECK_FAILED: The check for balanced capacity across
        # Availability Zones for your load balancing and Auto Scaling group resources failed. For more
        # information about practice run outcomes, see Considerations when you configure zonal autoshift in
        # the Amazon Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "practiceRunOutcome")]
        getter practice_run_outcome : String?

        # Defines the zonal shift type.
        @[JSON::Field(key: "shiftType")]
        getter shift_type : String?

        def initialize(
          @applied_status : String,
          @away_from : String,
          @comment : String,
          @expiry_time : Time,
          @resource_identifier : String,
          @start_time : Time,
          @zonal_shift_id : String,
          @practice_run_outcome : String? = nil,
          @shift_type : String? = nil
        )
        end
      end

      # Lists information about zonal shifts in Amazon Application Recovery Controller, including zonal
      # shifts that you start yourself and zonal shifts that ARC starts on your behalf for practice runs
      # with zonal autoshift. Zonal shifts are temporary, including customer-initiated zonal shifts and the
      # zonal autoshift practice run zonal shifts that ARC starts weekly, on your behalf. A zonal shift that
      # a customer starts can be active for up to three days (72 hours). A practice run zonal shift has a 30
      # minute duration.
      struct ZonalShiftSummary
        include JSON::Serializable

        # The Availability Zone (for example, use1-az1 ) that traffic is moved away from for a resource when
        # you start a zonal shift. Until the zonal shift expires or you cancel it, traffic for the resource is
        # instead moved to other Availability Zones in the Amazon Web Services Region.
        @[JSON::Field(key: "awayFrom")]
        getter away_from : String

        # A comment that you enter about the zonal shift. Only the latest comment is retained; no comment
        # history is maintained. That is, a new comment overwrites any existing comment string.
        @[JSON::Field(key: "comment")]
        getter comment : String

        # The expiry time (expiration time) for a customer-initiated zonal shift. A zonal shift is temporary
        # and must be set to expire when you start the zonal shift. You can initially set a zonal shift to
        # expire in a maximum of three days (72 hours). However, you can update a zonal shift to set a new
        # expiration at any time. When you start a zonal shift, you specify how long you want it to be active,
        # which ARC converts to an expiry time (expiration time). You can cancel a zonal shift when you're
        # ready to restore traffic to the Availability Zone, or just wait for it to expire. Or you can update
        # the zonal shift to specify another length of time to expire in.
        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : Time

        # The identifier for the resource to include in a zonal shift. The identifier is the Amazon Resource
        # Name (ARN) for the resource. Amazon Application Recovery Controller currently supports enabling the
        # following resources for zonal shift and zonal autoshift: Amazon EC2 Auto Scaling groups Amazon
        # Elastic Kubernetes Service Application Load Balancers Network Load Balancers
        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String

        # The time (UTC) when the zonal shift starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # A status for a zonal shift. The Status for a zonal shift can have one of the following values:
        # ACTIVE: The zonal shift has been started and is active. EXPIRED: The zonal shift has expired (the
        # expiry time was exceeded). CANCELED: The zonal shift was canceled.
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of a zonal shift.
        @[JSON::Field(key: "zonalShiftId")]
        getter zonal_shift_id : String

        # The outcome, or end state, of a practice run. The following values can be returned: PENDING: Outcome
        # value when the practice run is in progress. SUCCEEDED: Outcome value when the outcome alarm
        # specified for the practice run configuration does not go into an ALARM state during the practice
        # run, and the practice run was not interrupted before it completed. INTERRUPTED: Outcome value when
        # the practice run did not run for the expected 30 minutes or there was another problem with the
        # practice run that created an inconclusive outcome. FAILED: Outcome value when the outcome alarm
        # specified for the practice run configuration goes into an ALARM state during the practice run, and
        # the practice run was not interrupted before it completed. CAPACITY_CHECK_FAILED: The check for
        # balanced capacity across Availability Zones for your load balancing and Auto Scaling group resources
        # failed. For more information about practice run outcomes, see Considerations when you configure
        # zonal autoshift in the Amazon Application Recovery Controller Developer Guide.
        @[JSON::Field(key: "practiceRunOutcome")]
        getter practice_run_outcome : String?

        # Defines the zonal shift type.
        @[JSON::Field(key: "shiftType")]
        getter shift_type : String?

        def initialize(
          @away_from : String,
          @comment : String,
          @expiry_time : Time,
          @resource_identifier : String,
          @start_time : Time,
          @status : String,
          @zonal_shift_id : String,
          @practice_run_outcome : String? = nil,
          @shift_type : String? = nil
        )
        end
      end
    end
  end
end
