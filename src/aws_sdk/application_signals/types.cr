require "json"
require "time"

module AwsSdk
  module ApplicationSignals
    module Types

      # You don't have sufficient permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that defines a filter for narrowing down results based on specific attribute values.
      # This can be used to filter services by platform, environment, or other service characteristics.
      struct AttributeFilter
        include JSON::Serializable

        # The name of the attribute to filter by, such as Platform , Environment , or BusinessUnit .
        @[JSON::Field(key: "AttributeFilterName")]
        getter attribute_filter_name : String

        # An array of values to match for the specified attribute. Services that have any of these values for
        # the attribute will be included in the results.
        @[JSON::Field(key: "AttributeFilterValues")]
        getter attribute_filter_values : Array(String)

        def initialize(
          @attribute_filter_name : String,
          @attribute_filter_values : Array(String)
        )
        end
      end

      # A structure that contains information about an audit finding, which represents an automated analysis
      # result about service behavior, performance issues, or potential problems identified through
      # heuristic algorithms.
      struct AuditFinding
        include JSON::Serializable

        # The key attributes that identify the service or entity this audit finding relates to. This is a
        # string-to-string map that includes fields like Type, Name, and Environment.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # An array of auditor results that contain the specific findings, descriptions, and severity levels
        # identified by different auditing algorithms.
        @[JSON::Field(key: "AuditorResults")]
        getter auditor_results : Array(Types::AuditorResult)?

        # A structure containing nodes and edges that represent the dependency relationships relevant to this
        # audit finding, helping to understand the context and potential impact.
        @[JSON::Field(key: "DependencyGraph")]
        getter dependency_graph : Types::DependencyGraph?

        # A structure containing metric data queries and time range information that provides context for the
        # audit finding through relevant performance metrics.
        @[JSON::Field(key: "MetricGraph")]
        getter metric_graph : Types::MetricGraph?

        # The name of the operation associated with this audit finding, if the finding is specific to a
        # particular service operation.
        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The type of audit finding.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key_attributes : Hash(String, String),
          @auditor_results : Array(Types::AuditorResult)? = nil,
          @dependency_graph : Types::DependencyGraph? = nil,
          @metric_graph : Types::MetricGraph? = nil,
          @operation : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that specifies the target entity for audit analysis, such as a service , SLO ,
      # service_operation , or canary .
      struct AuditTarget
        include JSON::Serializable

        # The specific data identifying the audit target entity.
        @[JSON::Field(key: "Data")]
        getter data : Types::AuditTargetEntity

        # The type of entity being audited, such as service , SLO , service_operation , or canary .
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @data : Types::AuditTargetEntity,
          @type : String
        )
        end
      end

      # A union structure that contains the specific entity information for different types of audit
      # targets.
      struct AuditTargetEntity
        include JSON::Serializable

        # Canary entity information when the audit target is a CloudWatch Synthetics canary.
        @[JSON::Field(key: "Canary")]
        getter canary : Types::CanaryEntity?

        # Service entity information when the audit target is a service.
        @[JSON::Field(key: "Service")]
        getter service : Types::ServiceEntity?

        # Service operation entity information when the audit target is a specific service operation.
        @[JSON::Field(key: "ServiceOperation")]
        getter service_operation : Types::ServiceOperationEntity?

        # SLO entity information when the audit target is a service level objective.
        @[JSON::Field(key: "Slo")]
        getter slo : Types::ServiceLevelObjectiveEntity?

        def initialize(
          @canary : Types::CanaryEntity? = nil,
          @service : Types::ServiceEntity? = nil,
          @service_operation : Types::ServiceOperationEntity? = nil,
          @slo : Types::ServiceLevelObjectiveEntity? = nil
        )
        end
      end

      # A structure that contains the result of an automated audit analysis, including the auditor name,
      # description of findings, additional data, and severity level.
      struct AuditorResult
        include JSON::Serializable

        # The name of the auditor algorithm that generated this result.
        @[JSON::Field(key: "Auditor")]
        getter auditor : String?

        # This is a string-to-string map. It contains additional data about the result of an automated audit
        # analysis.
        @[JSON::Field(key: "Data")]
        getter data : Hash(String, String)?

        # A detailed description of the audit finding, explaining what was observed and potential
        # implications.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The severity level of this audit finding, indicating the importance and potential impact of the
        # issue.
        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @auditor : String? = nil,
          @data : Hash(String, String)? = nil,
          @description : String? = nil,
          @severity : String? = nil
        )
        end
      end

      struct BatchGetServiceLevelObjectiveBudgetReportInput
        include JSON::Serializable

        # An array containing the IDs of the service level objectives that you want to include in the report.
        @[JSON::Field(key: "SloIds")]
        getter slo_ids : Array(String)

        # The date and time that you want the report to be for. It is expressed as the number of milliseconds
        # since Jan 1, 1970 00:00:00 UTC.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        def initialize(
          @slo_ids : Array(String),
          @timestamp : Time
        )
        end
      end

      struct BatchGetServiceLevelObjectiveBudgetReportOutput
        include JSON::Serializable

        # An array of structures, where each structure includes an error indicating that one of the requests
        # in the array was not valid.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ServiceLevelObjectiveBudgetReportError)

        # An array of structures, where each structure is one budget report.
        @[JSON::Field(key: "Reports")]
        getter reports : Array(Types::ServiceLevelObjectiveBudgetReport)

        # The date and time that the report is for. It is expressed as the number of milliseconds since Jan 1,
        # 1970 00:00:00 UTC.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        def initialize(
          @errors : Array(Types::ServiceLevelObjectiveBudgetReportError),
          @reports : Array(Types::ServiceLevelObjectiveBudgetReport),
          @timestamp : Time
        )
        end
      end

      # An array of structures, where each structure includes an error indicating that one of the requests
      # in the array was not valid.
      struct BatchUpdateExclusionWindowsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The SLO ID in the error.
        @[JSON::Field(key: "SloId")]
        getter slo_id : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @slo_id : String
        )
        end
      end

      struct BatchUpdateExclusionWindowsInput
        include JSON::Serializable

        # The list of SLO IDs to add or remove exclusion windows from.
        @[JSON::Field(key: "SloIds")]
        getter slo_ids : Array(String)

        # A list of exclusion windows to add to the specified SLOs. You can add up to 10 exclusion windows per
        # SLO.
        @[JSON::Field(key: "AddExclusionWindows")]
        getter add_exclusion_windows : Array(Types::ExclusionWindow)?

        # A list of exclusion windows to remove from the specified SLOs. The window configuration must match
        # an existing exclusion window.
        @[JSON::Field(key: "RemoveExclusionWindows")]
        getter remove_exclusion_windows : Array(Types::ExclusionWindow)?

        def initialize(
          @slo_ids : Array(String),
          @add_exclusion_windows : Array(Types::ExclusionWindow)? = nil,
          @remove_exclusion_windows : Array(Types::ExclusionWindow)? = nil
        )
        end
      end

      struct BatchUpdateExclusionWindowsOutput
        include JSON::Serializable

        # A list of errors that occurred while processing the request.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchUpdateExclusionWindowsError)

        # The list of SLO IDs that were successfully processed.
        @[JSON::Field(key: "SloIds")]
        getter slo_ids : Array(String)

        def initialize(
          @errors : Array(Types::BatchUpdateExclusionWindowsError),
          @slo_ids : Array(String)
        )
        end
      end

      # This object defines the length of the look-back window used to calculate one burn rate metric for
      # this SLO. The burn rate measures how fast the service is consuming the error budget, relative to the
      # attainment goal of the SLO. A burn rate of exactly 1 indicates that the SLO goal will be met
      # exactly. For example, if you specify 60 as the number of minutes in the look-back window, the burn
      # rate is calculated as the following: burn rate = error rate over the look-back window / (100% -
      # attainment goal percentage) For more information about burn rates, see Calculate burn rates .
      struct BurnRateConfiguration
        include JSON::Serializable

        # The number of minutes to use as the look-back window.
        @[JSON::Field(key: "LookBackWindowMinutes")]
        getter look_back_window_minutes : Int32

        def initialize(
          @look_back_window_minutes : Int32
        )
        end
      end

      # If the interval for this service level objective is a calendar interval, this structure contains the
      # interval specifications.
      struct CalendarInterval
        include JSON::Serializable

        # Specifies the duration of each calendar interval. For example, if Duration is 1 and DurationUnit is
        # MONTH , each interval is one month, aligned with the calendar.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32

        # Specifies the calendar interval unit.
        @[JSON::Field(key: "DurationUnit")]
        getter duration_unit : String

        # The date and time when you want the first interval to start. Be sure to choose a time that
        # configures the intervals the way that you want. For example, if you want weekly intervals starting
        # on Mondays at 6 a.m., be sure to specify a start time that is a Monday at 6 a.m. When used in a raw
        # HTTP Query API, it is formatted as be epoch time in seconds. For example: 1698778057 As soon as one
        # calendar interval ends, another automatically begins.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @duration : Int32,
          @duration_unit : String,
          @start_time : Time
        )
        end
      end

      # A structure that contains identifying information for a CloudWatch Synthetics canary entity used in
      # audit targeting.
      struct CanaryEntity
        include JSON::Serializable

        # The name of the CloudWatch Synthetics canary.
        @[JSON::Field(key: "CanaryName")]
        getter canary_name : String

        def initialize(
          @canary_name : String
        )
        end
      end

      # A structure that contains information about a change event that occurred for a service, such as a
      # deployment or configuration change.
      struct ChangeEvent
        include JSON::Serializable

        # The Amazon Web Services account ID where this change event occurred.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The type of change event that occurred, such as DEPLOYMENT .
        @[JSON::Field(key: "ChangeEventType")]
        getter change_event_type : String

        # The entity (service or resource) that was affected by this change event, including its key
        # attributes. This is a string-to-string map. It can include the following fields. Type designates the
        # type of object this is. ResourceType specifies the type of the resource. This field is used only
        # when the value of the Type field is Resource or AWS::Resource . Name specifies the name of the
        # object. This is used only if the value of the Type field is Service , RemoteService , or
        # AWS::Service . Identifier identifies the resource objects of this resource. This is used only if the
        # value of the Type field is Resource or AWS::Resource . Environment specifies the location where this
        # object is hosted, or what it belongs to. AwsAccountId specifies the account where this object is in.
        # Below is an example of a service. { "Type": "Service", "Name": "visits-service", "Environment":
        # "petclinic-test" } Below is an example of a resource. { "Type": "AWS::Resource", "ResourceType":
        # "AWS::DynamoDB::Table", "Identifier": "Customers" }
        @[JSON::Field(key: "Entity")]
        getter entity : Hash(String, String)

        # A unique identifier for this change event. For CloudTrail-based events, this is the CloudTrail event
        # id. For other events, this will be Unknown .
        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The Amazon Web Services region where this change event occurred.
        @[JSON::Field(key: "Region")]
        getter region : String

        # The timestamp when this change event occurred. When used in a raw HTTP Query API, it is formatted as
        # epoch time in seconds.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time

        # The name or description of this change event.
        @[JSON::Field(key: "EventName")]
        getter event_name : String?

        # The name of the user who initiated this change event, if available.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @account_id : String,
          @change_event_type : String,
          @entity : Hash(String, String),
          @event_id : String,
          @region : String,
          @timestamp : Time,
          @event_name : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # This operation attempted to create a resource that already exists.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateServiceLevelObjectiveInput
        include JSON::Serializable

        # A name for this SLO.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Use this array to create burn rates for this SLO. Each burn rate is a metric that indicates how fast
        # the service is consuming the error budget, relative to the attainment goal of the SLO.
        @[JSON::Field(key: "BurnRateConfigurations")]
        getter burn_rate_configurations : Array(Types::BurnRateConfiguration)?

        # An optional description for this SLO.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # This structure contains the attributes that determine the goal of the SLO.
        @[JSON::Field(key: "Goal")]
        getter goal : Types::Goal?

        # If this SLO is a request-based SLO, this structure defines the information about what performance
        # metric this SLO will monitor. You can't specify both RequestBasedSliConfig and SliConfig in the same
        # operation.
        @[JSON::Field(key: "RequestBasedSliConfig")]
        getter request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig?

        # If this SLO is a period-based SLO, this structure defines the information about what performance
        # metric this SLO will monitor. You can't specify both RequestBasedSliConfig and SliConfig in the same
        # operation.
        @[JSON::Field(key: "SliConfig")]
        getter sli_config : Types::ServiceLevelIndicatorConfig?

        # A list of key-value pairs to associate with the SLO. You can associate as many as 50 tags with an
        # SLO. To be able to associate tags with the SLO when you create the SLO, you must have the
        # cloudwatch:TagResource permission. Tags can help you organize and categorize your resources. You can
        # also use them to scope user permissions by granting a user permission to access or change only
        # resources with certain tag values.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @burn_rate_configurations : Array(Types::BurnRateConfiguration)? = nil,
          @description : String? = nil,
          @goal : Types::Goal? = nil,
          @request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig? = nil,
          @sli_config : Types::ServiceLevelIndicatorConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateServiceLevelObjectiveOutput
        include JSON::Serializable

        # A structure that contains information about the SLO that you just created.
        @[JSON::Field(key: "Slo")]
        getter slo : Types::ServiceLevelObjective

        def initialize(
          @slo : Types::ServiceLevelObjective
        )
        end
      end

      struct DeleteGroupingConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteServiceLevelObjectiveInput
        include JSON::Serializable

        # The ARN or name of the service level objective to delete.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteServiceLevelObjectiveOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName . When
      # creating a service dependency SLO, you must specify the KeyAttributes of the service, and the
      # DependencyConfig for the dependency. You can specify the OperationName of the service, from which it
      # calls the dependency. Alternatively, you can exclude OperationName and the SLO will monitor all of
      # the service's operations that call the dependency.
      struct DependencyConfig
        include JSON::Serializable

        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this is. ResourceType specifies the type of the resource. This field is used only when the
        # value of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This
        # is used only if the value of the Type field is Service , RemoteService , or AWS::Service .
        # Identifier identifies the resource objects of this resource. This is used only if the value of the
        # Type field is Resource or AWS::Resource . Environment specifies the location where this object is
        # hosted, or what it belongs to.
        @[JSON::Field(key: "DependencyKeyAttributes")]
        getter dependency_key_attributes : Hash(String, String)

        # The name of the called operation in the dependency.
        @[JSON::Field(key: "DependencyOperationName")]
        getter dependency_operation_name : String

        def initialize(
          @dependency_key_attributes : Hash(String, String),
          @dependency_operation_name : String
        )
        end
      end

      # A structure that represents the dependency relationships relevant to an audit finding, containing
      # nodes and edges that show how services and resources are connected.
      struct DependencyGraph
        include JSON::Serializable

        # An array of edges representing the connections and relationships between the nodes in the dependency
        # graph.
        @[JSON::Field(key: "Edges")]
        getter edges : Array(Types::Edge)?

        # An array of nodes representing the services, resources, or other entities in the dependency graph.
        @[JSON::Field(key: "Nodes")]
        getter nodes : Array(Types::Node)?

        def initialize(
          @edges : Array(Types::Edge)? = nil,
          @nodes : Array(Types::Node)? = nil
        )
        end
      end

      # A dimension is a name/value pair that is part of the identity of a metric. Because dimensions are
      # part of the unique identifier for a metric, whenever you add a unique name/value pair to one of your
      # metrics, you are creating a new variation of that metric. For example, many Amazon EC2 metrics
      # publish InstanceId as a dimension name, and the actual instance ID as the value for that dimension.
      # You can assign up to 30 dimensions to a metric.
      struct Dimension
        include JSON::Serializable

        # The name of the dimension. Dimension names must contain only ASCII characters, must include at least
        # one non-whitespace character, and cannot start with a colon ( : ). ASCII control characters are not
        # supported as part of dimension names.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the dimension. Dimension values must contain only ASCII characters and must include at
        # least one non-whitespace character. ASCII control characters are not supported as part of dimension
        # values.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # A structure that represents a connection between two nodes in a dependency graph, showing the
      # relationship and characteristics of the connection.
      struct Edge
        include JSON::Serializable

        # The type of connection between the nodes, indicating the nature of the relationship.
        @[JSON::Field(key: "ConnectionType")]
        getter connection_type : String?

        # The identifier of the destination node in this edge connection.
        @[JSON::Field(key: "DestinationNodeId")]
        getter destination_node_id : String?

        # The duration or latency associated with this connection, if applicable.
        @[JSON::Field(key: "Duration")]
        getter duration : Float64?

        # The identifier of the source node in this edge connection.
        @[JSON::Field(key: "SourceNodeId")]
        getter source_node_id : String?

        def initialize(
          @connection_type : String? = nil,
          @destination_node_id : String? = nil,
          @duration : Float64? = nil,
          @source_node_id : String? = nil
        )
        end
      end

      # The core SLO time window exclusion object that includes Window, StartTime, RecurrenceRule, and
      # Reason.
      struct ExclusionWindow
        include JSON::Serializable

        # The SLO time window exclusion .
        @[JSON::Field(key: "Window")]
        getter window : Types::Window

        # A description explaining why this time period should be excluded from SLO calculations.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The recurrence rule for the SLO time window exclusion. Supports both cron and rate expressions.
        @[JSON::Field(key: "RecurrenceRule")]
        getter recurrence_rule : Types::RecurrenceRule?

        # The start of the SLO time window exclusion. Defaults to current time if not specified.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @window : Types::Window,
          @reason : String? = nil,
          @recurrence_rule : Types::RecurrenceRule? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetServiceInput
        include JSON::Serializable

        # The end of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # Use this field to specify which service you want to retrieve information for. You must specify at
        # least the Type , Name , and Environment attributes. This is a string-to-string map. It can include
        # the following fields. Type designates the type of object this is. ResourceType specifies the type of
        # the resource. This field is used only when the value of the Type field is Resource or AWS::Resource
        # . Name specifies the name of the object. This is used only if the value of the Type field is Service
        # , RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource.
        # This is used only if the value of the Type field is Resource or AWS::Resource . Environment
        # specifies the location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # The start of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @key_attributes : Hash(String, String),
          @start_time : Time
        )
        end
      end

      struct GetServiceLevelObjectiveInput
        include JSON::Serializable

        # The ARN or name of the SLO that you want to retrieve information about. You can find the ARNs of
        # SLOs by using the ListServiceLevelObjectives operation.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetServiceLevelObjectiveOutput
        include JSON::Serializable

        # A structure containing the information about the SLO.
        @[JSON::Field(key: "Slo")]
        getter slo : Types::ServiceLevelObjective

        def initialize(
          @slo : Types::ServiceLevelObjective
        )
        end
      end

      struct GetServiceOutput
        include JSON::Serializable

        # The end time of the data included in the response. In a raw HTTP Query API, it is formatted as be
        # epoch time in seconds. For example: 1698778057 . This displays the time that Application Signals
        # used for the request. It might not match your request exactly, because it was rounded to the nearest
        # hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # A structure containing information about the service.
        @[JSON::Field(key: "Service")]
        getter service : Types::Service

        # The start time of the data included in the response. In a raw HTTP Query API, it is formatted as be
        # epoch time in seconds. For example: 1698778057 . This displays the time that Application Signals
        # used for the request. It might not match your request exactly, because it was rounded to the nearest
        # hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # An array of string-to-string maps that each contain information about one log group associated with
        # this service. Each string-to-string map includes the following fields: "Type": "AWS::Resource"
        # "ResourceType": "AWS::Logs::LogGroup" "Identifier": " name-of-log-group "
        @[JSON::Field(key: "LogGroupReferences")]
        getter log_group_references : Array(Hash(String, String))?

        def initialize(
          @end_time : Time,
          @service : Types::Service,
          @start_time : Time,
          @log_group_references : Array(Hash(String, String))? = nil
        )
        end
      end

      # This structure contains the attributes that determine the goal of an SLO. This includes the time
      # period for evaluation and the attainment threshold.
      struct Goal
        include JSON::Serializable

        # The threshold that determines if the goal is being met. If this is a period-based SLO, the
        # attainment goal is the percentage of good periods that meet the threshold requirements to the total
        # periods within the interval. For example, an attainment goal of 99.9% means that within your
        # interval, you are targeting 99.9% of the periods to be in healthy state. If this is a request-based
        # SLO, the attainment goal is the percentage of requests that must be successful to meet the
        # attainment goal. If you omit this parameter, 99 is used to represent 99% as the attainment goal.
        @[JSON::Field(key: "AttainmentGoal")]
        getter attainment_goal : Float64?

        # The time period used to evaluate the SLO. It can be either a calendar interval or rolling interval.
        # If you omit this parameter, a rolling interval of 7 days is used.
        @[JSON::Field(key: "Interval")]
        getter interval : Types::Interval?

        # The percentage of remaining budget over total budget that you want to get warnings for. If you omit
        # this parameter, the default of 50.0 is used.
        @[JSON::Field(key: "WarningThreshold")]
        getter warning_threshold : Float64?

        def initialize(
          @attainment_goal : Float64? = nil,
          @interval : Types::Interval? = nil,
          @warning_threshold : Float64? = nil
        )
        end
      end

      # A structure that defines how services should be grouped based on specific attributes. This includes
      # the friendly name for the grouping, the source keys to derive values from, and an optional default
      # value.
      struct GroupingAttributeDefinition
        include JSON::Serializable

        # The friendly name for this grouping attribute, such as BusinessUnit or Environment . This name is
        # used to identify the grouping in the console and APIs.
        @[JSON::Field(key: "GroupingName")]
        getter grouping_name : String

        # The default value to use for this grouping attribute when no value can be derived from the source
        # keys. This ensures all services have a grouping value even if the source data is missing.
        @[JSON::Field(key: "DefaultGroupingValue")]
        getter default_grouping_value : String?

        # An array of source keys used to derive the grouping attribute value from telemetry data, Amazon Web
        # Services tags, or other sources. For example, ["business_unit", "team"] would look for values in
        # those fields.
        @[JSON::Field(key: "GroupingSourceKeys")]
        getter grouping_source_keys : Array(String)?

        def initialize(
          @grouping_name : String,
          @default_grouping_value : String? = nil,
          @grouping_source_keys : Array(String)? = nil
        )
        end
      end

      # A structure that contains the complete grouping configuration for an account, including all defined
      # grouping attributes and metadata about when it was last updated.
      struct GroupingConfiguration
        include JSON::Serializable

        # An array of grouping attribute definitions that specify how services should be grouped based on
        # various attributes and source keys.
        @[JSON::Field(key: "GroupingAttributeDefinitions")]
        getter grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition)

        # The timestamp when this grouping configuration was last updated. When used in a raw HTTP Query API,
        # it is formatted as epoch time in seconds.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time

        def initialize(
          @grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition),
          @updated_at : Time
        )
        end
      end

      # The time period used to evaluate the SLO. It can be either a calendar interval or rolling interval.
      struct Interval
        include JSON::Serializable

        # If the interval is a calendar interval, this structure contains the interval specifications.
        @[JSON::Field(key: "CalendarInterval")]
        getter calendar_interval : Types::CalendarInterval?

        # If the interval is a rolling interval, this structure contains the interval specifications.
        @[JSON::Field(key: "RollingInterval")]
        getter rolling_interval : Types::RollingInterval?

        def initialize(
          @calendar_interval : Types::CalendarInterval? = nil,
          @rolling_interval : Types::RollingInterval? = nil
        )
        end
      end

      struct ListAuditFindingsInput
        include JSON::Serializable

        # A list of audit targets to filter the findings by. You can specify services, SLOs, or service
        # operations to limit the audit findings to specific entities.
        @[JSON::Field(key: "AuditTargets")]
        getter audit_targets : Array(Types::AuditTarget)

        # The end of the time period to retrieve audit findings for. When used in a raw HTTP Query API, it is
        # formatted as epoch time in seconds. For example, 1698778057
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time period to retrieve audit findings for. When used in a raw HTTP Query API, it
        # is formatted as epoch time in seconds. For example, 1698778057
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # A list of auditor names to filter the findings by. Only findings generated by the specified auditors
        # will be returned. The following auditors are available for configuration: slo - SloAuditor:
        # Identifies SLO violations and detects breached thresholds during the Assessment phase.
        # operation_metric - OperationMetricAuditor: Detects anomalies in service operation metrics from
        # Application Signals RED metrics during the Assessment phase Anomaly detection is not supported for
        # sparse metrics (those missing more than 80% of datapoints within the given time period).
        # service_quota - ServiceQuotaAuditor: Monitors resource utilization against service quotas during the
        # Assessment phase trace - TraceAuditor: Performs deep-dive analysis of distributed traces,
        # correlating traces with breached SLOs or abnormal RED metrics during the Analysis phase
        # dependency_metric - CriticalPathAuditor: Analyzes service dependency impacts and maps dependency
        # relationships from Application Signals RED metrics during the Analysis phase top_contributor -
        # TopContributorAuditor: Identifies infrastructure-level contributors to issues by analyzing EMF logs
        # of Application Signals RED metrics during the Analysis phase log - LogAuditor: Extracts insights
        # from application logs, categorizing error types and ranking severity by frequency during the
        # Analysis phase InitAuditor and Summarizer auditors are not configurable as they are automatically
        # triggered during the audit process.
        @[JSON::Field(key: "Auditors")]
        getter auditors : Array(String)?

        # The level of details of the audit findings. Supported values: BRIEF , DETAILED .
        @[JSON::Field(key: "DetailLevel")]
        getter detail_level : String?

        # The maximum number of audit findings to return in one operation. If you omit this parameter, the
        # default of 10 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of audit
        # findings.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @audit_targets : Array(Types::AuditTarget),
          @end_time : Time,
          @start_time : Time,
          @auditors : Array(String)? = nil,
          @detail_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAuditFindingsOutput
        include JSON::Serializable

        # An array of structures, where each structure contains information about one audit finding, including
        # the auditor results, severity, and associated metric and dependency graphs.
        @[JSON::Field(key: "AuditFindings")]
        getter audit_findings : Array(Types::AuditFinding)

        # The end of the time period that the returned audit findings apply to. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example, 1698778057
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # Include this value in your next use of this API to get the next set of audit findings.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The start of the time period that the returned audit findings apply to. When used in a raw HTTP
        # Query API, it is formatted as epoch time in seconds. For example, 1698778057
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @audit_findings : Array(Types::AuditFinding),
          @end_time : Time? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct ListEntityEventsInput
        include JSON::Serializable

        # The end of the time period to retrieve change events for. When used in a raw HTTP Query API, it is
        # formatted as epoch time in seconds. For example: 1698778057
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The entity for which to retrieve change events. This specifies the service, resource, or other
        # entity whose event history you want to examine. This is a string-to-string map. It can include the
        # following fields. Type designates the type of object this is. ResourceType specifies the type of the
        # resource. This field is used only when the value of the Type field is Resource or AWS::Resource .
        # Name specifies the name of the object. This is used only if the value of the Type field is Service ,
        # RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource. This
        # is used only if the value of the Type field is Resource or AWS::Resource . Environment specifies the
        # location where this object is hosted, or what it belongs to. AwsAccountId specifies the account
        # where this object is in. Below is an example of a service. { "Type": "Service", "Name":
        # "visits-service", "Environment": "petclinic-test" } Below is an example of a resource. { "Type":
        # "AWS::Resource", "ResourceType": "AWS::DynamoDB::Table", "Identifier": "Customers" }
        @[JSON::Field(key: "Entity")]
        getter entity : Hash(String, String)

        # The start of the time period to retrieve change events for. When used in a raw HTTP Query API, it is
        # formatted as epoch time in seconds. For example: 1698778057
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The maximum number of change events to return in one operation. If you omit this parameter, the
        # default of 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of change
        # events.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @entity : Hash(String, String),
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityEventsOutput
        include JSON::Serializable

        # An array of structures, where each structure contains information about one change event that
        # occurred for the specified entity during the requested time period.
        @[JSON::Field(key: "ChangeEvents")]
        getter change_events : Array(Types::ChangeEvent)

        # The end of the time period that the returned change events apply to. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example: 1698778057
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time period that the returned change events apply to. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example: 1698778057
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get the next set of change events.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @change_events : Array(Types::ChangeEvent),
          @end_time : Time,
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListGroupingAttributeDefinitionsInput
        include JSON::Serializable

        # The Amazon Web Services account ID to retrieve grouping attribute definitions for. Use this when
        # accessing grouping configurations from a different account in cross-account monitoring scenarios.
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String?

        # If you are using this operation in a monitoring account, specify true to include grouping attributes
        # from source accounts in the returned data.
        @[JSON::Field(key: "IncludeLinkedAccounts")]
        getter include_linked_accounts : Bool?

        # Include this value, if it was returned by the previous operation, to get the next set of grouping
        # attribute definitions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aws_account_id : String? = nil,
          @include_linked_accounts : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGroupingAttributeDefinitionsOutput
        include JSON::Serializable

        # An array of structures, where each structure contains information about one grouping attribute
        # definition, including the grouping name, source keys, and default values.
        @[JSON::Field(key: "GroupingAttributeDefinitions")]
        getter grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition)

        # Include this value in your next use of this API to get the next set of grouping attribute
        # definitions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The timestamp when the grouping configuration was last updated. When used in a raw HTTP Query API,
        # it is formatted as epoch time in seconds.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition),
          @next_token : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct ListServiceDependenciesInput
        include JSON::Serializable

        # The end of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested end time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # Use this field to specify which service you want to retrieve information for. You must specify at
        # least the Type , Name , and Environment attributes. This is a string-to-string map. It can include
        # the following fields. Type designates the type of object this is. ResourceType specifies the type of
        # the resource. This field is used only when the value of the Type field is Resource or AWS::Resource
        # . Name specifies the name of the object. This is used only if the value of the Type field is Service
        # , RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource.
        # This is used only if the value of the Type field is Resource or AWS::Resource . Environment
        # specifies the location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # The start of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # dependencies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @key_attributes : Hash(String, String),
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceDependenciesOutput
        include JSON::Serializable

        # The end of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # An array, where each object in the array contains information about one of the dependencies of this
        # service.
        @[JSON::Field(key: "ServiceDependencies")]
        getter service_dependencies : Array(Types::ServiceDependency)

        # The start of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get next set of service dependencies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @service_dependencies : Array(Types::ServiceDependency),
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceDependentsInput
        include JSON::Serializable

        # The end of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # Use this field to specify which service you want to retrieve information for. You must specify at
        # least the Type , Name , and Environment attributes. This is a string-to-string map. It can include
        # the following fields. Type designates the type of object this is. ResourceType specifies the type of
        # the resource. This field is used only when the value of the Type field is Resource or AWS::Resource
        # . Name specifies the name of the object. This is used only if the value of the Type field is Service
        # , RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource.
        # This is used only if the value of the Type field is Resource or AWS::Resource . Environment
        # specifies the location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # The start of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # dependents.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @key_attributes : Hash(String, String),
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceDependentsOutput
        include JSON::Serializable

        # The end of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # An array, where each object in the array contains information about one of the dependents of this
        # service.
        @[JSON::Field(key: "ServiceDependents")]
        getter service_dependents : Array(Types::ServiceDependent)

        # The start of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get next set of service dependents.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @service_dependents : Array(Types::ServiceDependent),
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceLevelObjectiveExclusionWindowsInput
        include JSON::Serializable

        # The ID of the SLO to list exclusion windows for.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # level objectives.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceLevelObjectiveExclusionWindowsOutput
        include JSON::Serializable

        # A list of exclusion windows configured for the SLO.
        @[JSON::Field(key: "ExclusionWindows")]
        getter exclusion_windows : Array(Types::ExclusionWindow)

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # level objectives.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @exclusion_windows : Array(Types::ExclusionWindow),
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceLevelObjectivesInput
        include JSON::Serializable

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # If you are using this operation in a monitoring account, specify true to include SLO from source
        # accounts in the returned data. When you are monitoring an account, you can use Amazon Web Services
        # account ID in KeyAttribute filter for service source account and SloOwnerawsaccountID for SLO source
        # account with IncludeLinkedAccounts to filter the returned data to only a single source account.
        @[JSON::Field(key: "IncludeLinkedAccounts")]
        getter include_linked_accounts : Bool?

        # You can use this optional field to specify which services you want to retrieve SLO information for.
        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this is. ResourceType specifies the type of the resource. This field is used only when the
        # value of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This
        # is used only if the value of the Type field is Service , RemoteService , or AWS::Service .
        # Identifier identifies the resource objects of this resource. This is used only if the value of the
        # Type field is Resource or AWS::Resource . Environment specifies the location where this object is
        # hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this optional field to only include SLOs with the specified metric source types in the output.
        # Supported types are: Service operation Service dependency CloudWatch metric
        @[JSON::Field(key: "MetricSourceTypes")]
        getter metric_source_types : Array(String)?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # level objectives.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the operation that this SLO is associated with.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        # SLO's Amazon Web Services account ID.
        @[JSON::Field(key: "SloOwnerAwsAccountId")]
        getter slo_owner_aws_account_id : String?

        def initialize(
          @dependency_config : Types::DependencyConfig? = nil,
          @include_linked_accounts : Bool? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @max_results : Int32? = nil,
          @metric_source_types : Array(String)? = nil,
          @next_token : String? = nil,
          @operation_name : String? = nil,
          @slo_owner_aws_account_id : String? = nil
        )
        end
      end

      struct ListServiceLevelObjectivesOutput
        include JSON::Serializable

        # Include this value in your next use of this API to get next set of service level objectives.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of structures, where each structure contains information about one SLO.
        @[JSON::Field(key: "SloSummaries")]
        getter slo_summaries : Array(Types::ServiceLevelObjectiveSummary)?

        def initialize(
          @next_token : String? = nil,
          @slo_summaries : Array(Types::ServiceLevelObjectiveSummary)? = nil
        )
        end
      end

      struct ListServiceOperationsInput
        include JSON::Serializable

        # The end of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested end time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # Use this field to specify which service you want to retrieve information for. You must specify at
        # least the Type , Name , and Environment attributes. This is a string-to-string map. It can include
        # the following fields. Type designates the type of object this is. ResourceType specifies the type of
        # the resource. This field is used only when the value of the Type field is Resource or AWS::Resource
        # . Name specifies the name of the object. This is used only if the value of the Type field is Service
        # , RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource.
        # This is used only if the value of the Type field is Resource or AWS::Resource . Environment
        # specifies the location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # The start of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # operations.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @key_attributes : Hash(String, String),
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceOperationsOutput
        include JSON::Serializable

        # The end of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # An array of structures that each contain information about one operation of this service.
        @[JSON::Field(key: "ServiceOperations")]
        getter service_operations : Array(Types::ServiceOperation)

        # The start of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get next set of service operations.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @service_operations : Array(Types::ServiceOperation),
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceStatesInput
        include JSON::Serializable

        # The end of the time period to retrieve service state information for. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example, 1698778057 .
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time period to retrieve service state information for. When used in a raw HTTP
        # Query API, it is formatted as epoch time in seconds. For example, 1698778057 .
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # A list of attribute filters to narrow down the services. You can filter by platform, environment, or
        # other service attributes.
        @[JSON::Field(key: "AttributeFilters")]
        getter attribute_filters : Array(Types::AttributeFilter)?

        # The Amazon Web Services account ID to filter service states by. Use this to limit results to
        # services from a specific account.
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String?

        # If you are using this operation in a monitoring account, specify true to include service states from
        # source accounts in the returned data.
        @[JSON::Field(key: "IncludeLinkedAccounts")]
        getter include_linked_accounts : Bool?

        # The maximum number of service states to return in one operation. If you omit this parameter, the
        # default of 20 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of service
        # states.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @attribute_filters : Array(Types::AttributeFilter)? = nil,
          @aws_account_id : String? = nil,
          @include_linked_accounts : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceStatesOutput
        include JSON::Serializable

        # The end of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example, 1698778057 .
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # An array of structures, where each structure contains information about the state of one service,
        # including its latest change events such as deployments.
        @[JSON::Field(key: "ServiceStates")]
        getter service_states : Array(Types::ServiceState)

        # The start of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as epoch time in seconds. For example, 1698778057 .
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get the next set of service states.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @service_states : Array(Types::ServiceState),
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesInput
        include JSON::Serializable

        # The end of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start of the time period to retrieve information about. When used in a raw HTTP Query API, it is
        # formatted as be epoch time in seconds. For example: 1698778057 Your requested start time will be
        # rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Amazon Web Services Account ID.
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String?

        # If you are using this operation in a monitoring account, specify true to include services from
        # source accounts in the returned data.
        @[JSON::Field(key: "IncludeLinkedAccounts")]
        getter include_linked_accounts : Bool?

        # The maximum number of results to return in one operation. If you omit this parameter, the default of
        # 50 is used.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include this value, if it was returned by the previous operation, to get the next set of services.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @aws_account_id : String? = nil,
          @include_linked_accounts : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesOutput
        include JSON::Serializable

        # The end of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # An array of structures, where each structure contains some information about a service. To get
        # complete information about a service, use GetService .
        @[JSON::Field(key: "ServiceSummaries")]
        getter service_summaries : Array(Types::ServiceSummary)

        # The start of the time period that the returned information applies to. When used in a raw HTTP Query
        # API, it is formatted as be epoch time in seconds. For example: 1698778057 This displays the time
        # that Application Signals used for the request. It might not match your request exactly, because it
        # was rounded to the nearest hour.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # Include this value in your next use of this API to get next set of services.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @service_summaries : Array(Types::ServiceSummary),
          @start_time : Time,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch resource that you want to view tags for. The ARN
        # format of an Application Signals SLO is arn:aws:cloudwatch: Region : account-id :slo: slo-name For
        # more information about ARN format, see Resource Types Defined by Amazon CloudWatch in the Amazon Web
        # Services General Reference .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tag keys and values associated with the resource you specified.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # This structure defines the metric used for a service level indicator, including the metric name,
      # namespace, and dimensions
      struct Metric
        include JSON::Serializable

        # An array of one or more dimensions to use to define the metric that you want to use. For more
        # information, see Dimensions .
        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        # The name of the metric to use.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The namespace of the metric. For more information, see Namespaces .
        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        def initialize(
          @dimensions : Array(Types::Dimension)? = nil,
          @metric_name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # Use this structure to define a metric or metric math expression that you want to use as for a
      # service level objective. Each MetricDataQuery in the MetricDataQueries array specifies either a
      # metric to retrieve, or a metric math expression to be performed on retrieved metrics. A single
      # MetricDataQueries array can include as many as 20 MetricDataQuery structures in the array. The 20
      # structures can include as many as 10 structures that contain a MetricStat parameter to retrieve a
      # metric, and as many as 10 structures that contain the Expression parameter to perform a math
      # expression. Of those Expression structures, exactly one must have true as the value for ReturnData .
      # The result of this expression used for the SLO. For more information about metric math expressions,
      # see CloudWatchUse metric math . Within each MetricDataQuery object, you must specify either
      # Expression or MetricStat but not both.
      struct MetricDataQuery
        include JSON::Serializable

        # A short name used to tie this object to the results in the response. This Id must be unique within a
        # MetricDataQueries array. If you are performing math expressions on this set of data, this name
        # represents that data and can serve as a variable in the metric math expression. The valid characters
        # are letters, numbers, and underscore. The first character must be a lowercase letter.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The ID of the account where this metric is located. If you are performing this operation in a
        # monitoring account, use this to specify which source account to retrieve this metric from.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # This field can contain a metric math expression to be performed on the other metrics that you are
        # retrieving within this MetricDataQueries structure. A math expression can use the Id of the other
        # metrics or queries to refer to those metrics, and can also use the Id of other expressions to use
        # the result of those expressions. For more information about metric math expressions, see Metric Math
        # Syntax and Functions in the Amazon CloudWatch User Guide . Within each MetricDataQuery object, you
        # must specify either Expression or MetricStat but not both.
        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A human-readable label for this metric or expression. This is especially useful if this is an
        # expression, so that you know what the value represents. If the metric or expression is shown in a
        # CloudWatch dashboard widget, the label is shown. If Label is omitted, CloudWatch generates a
        # default. You can put dynamic expressions into a label, so that it is more descriptive. For more
        # information, see Using Dynamic Labels .
        @[JSON::Field(key: "Label")]
        getter label : String?

        # A metric to be used directly for the SLO, or to be used in the math expression that will be used for
        # the SLO. Within one MetricDataQuery object, you must specify either Expression or MetricStat but not
        # both.
        @[JSON::Field(key: "MetricStat")]
        getter metric_stat : Types::MetricStat?

        # The granularity, in seconds, of the returned data points for this metric. For metrics with regular
        # resolution, a period can be as short as one minute (60 seconds) and must be a multiple of 60. For
        # high-resolution metrics that are collected at intervals of less than one minute, the period can be
        # 1, 5, 10, 30, 60, or any multiple of 60. High-resolution metrics are those metrics stored by a
        # PutMetricData call that includes a StorageResolution of 1 second. If the StartTime parameter
        # specifies a time stamp that is greater than 3 hours ago, you must specify the period as follows or
        # no data points in that time range is returned: Start time between 3 hours and 15 days ago - Use a
        # multiple of 60 seconds (1 minute). Start time between 15 and 63 days ago - Use a multiple of 300
        # seconds (5 minutes). Start time greater than 63 days ago - Use a multiple of 3600 seconds (1 hour).
        @[JSON::Field(key: "Period")]
        getter period : Int32?

        # Use this only if you are using a metric math expression for the SLO. Specify true for ReturnData for
        # only the one expression result to use as the alarm. For all other metrics and expressions in the
        # same CreateServiceLevelObjective operation, specify ReturnData as false .
        @[JSON::Field(key: "ReturnData")]
        getter return_data : Bool?

        def initialize(
          @id : String,
          @account_id : String? = nil,
          @expression : String? = nil,
          @label : String? = nil,
          @metric_stat : Types::MetricStat? = nil,
          @period : Int32? = nil,
          @return_data : Bool? = nil
        )
        end
      end

      # A structure that contains metric data queries and time range information that provides context for
      # audit findings through relevant performance metrics.
      struct MetricGraph
        include JSON::Serializable

        # The end time for the metric data included in this graph. When used in a raw HTTP Query API, it is
        # formatted as epoch time in seconds.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # An array of metric data queries that define the metrics to be retrieved and analyzed as part of the
        # audit finding context.
        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)?

        # The start time for the metric data included in this graph. When used in a raw HTTP Query API, it is
        # formatted as epoch time in seconds.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @metric_data_queries : Array(Types::MetricDataQuery)? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # This structure contains information about one CloudWatch metric associated with this entity
      # discovered by Application Signals.
      struct MetricReference
        include JSON::Serializable

        # The name of the metric.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # Used to display the appropriate statistics in the CloudWatch console.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String

        # The namespace of the metric. For more information, see CloudWatchNamespaces .
        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        # Amazon Web Services account ID.
        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # An array of one or more dimensions that further define the metric. For more information, see
        # CloudWatchDimensions .
        @[JSON::Field(key: "Dimensions")]
        getter dimensions : Array(Types::Dimension)?

        def initialize(
          @metric_name : String,
          @metric_type : String,
          @namespace : String,
          @account_id : String? = nil,
          @dimensions : Array(Types::Dimension)? = nil
        )
        end
      end

      # This structure defines the metric to be used as the service level indicator, along with the
      # statistics, period, and unit.
      struct MetricStat
        include JSON::Serializable

        # The metric to use as the service level indicator, including the metric name, namespace, and
        # dimensions.
        @[JSON::Field(key: "Metric")]
        getter metric : Types::Metric

        # The granularity, in seconds, to be used for the metric. For metrics with regular resolution, a
        # period can be as short as one minute (60 seconds) and must be a multiple of 60. For high-resolution
        # metrics that are collected at intervals of less than one minute, the period can be 1, 5, 10, 30, 60,
        # or any multiple of 60. High-resolution metrics are those metrics stored by a PutMetricData call that
        # includes a StorageResolution of 1 second.
        @[JSON::Field(key: "Period")]
        getter period : Int32

        # The statistic to use for comparison to the threshold. It can be any CloudWatch statistic or extended
        # statistic. For more information about statistics, see CloudWatch statistics definitions .
        @[JSON::Field(key: "Stat")]
        getter stat : String

        # If you omit Unit then all data that was collected with any unit is returned, along with the
        # corresponding units that were specified when the data was reported to CloudWatch. If you specify a
        # unit, the operation returns only data that was collected with that unit specified. If you specify a
        # unit that does not match the data collected, the results of the operation are null. CloudWatch does
        # not perform unit conversions.
        @[JSON::Field(key: "Unit")]
        getter unit : String?

        def initialize(
          @metric : Types::Metric,
          @period : Int32,
          @stat : String,
          @unit : String? = nil
        )
        end
      end

      # This structure defines the metric that is used as the "good request" or "bad request" value for a
      # request-based SLO. This value observed for the metric defined in TotalRequestCountMetric is divided
      # by the number found for MonitoredRequestCountMetric to determine the percentage of successful
      # requests that this SLO tracks.
      struct MonitoredRequestCountMetricDataQueries
        include JSON::Serializable

        # If you want to count "bad requests" to determine the percentage of successful requests for this
        # request-based SLO, specify the metric to use as "bad requests" in this structure.
        @[JSON::Field(key: "BadCountMetric")]
        getter bad_count_metric : Array(Types::MetricDataQuery)?

        # If you want to count "good requests" to determine the percentage of successful requests for this
        # request-based SLO, specify the metric to use as "good requests" in this structure.
        @[JSON::Field(key: "GoodCountMetric")]
        getter good_count_metric : Array(Types::MetricDataQuery)?

        def initialize(
          @bad_count_metric : Array(Types::MetricDataQuery)? = nil,
          @good_count_metric : Array(Types::MetricDataQuery)? = nil
        )
        end
      end

      # A structure that represents a node in a dependency graph, containing information about a service,
      # resource, or other entity and its characteristics.
      struct Node
        include JSON::Serializable

        # The key attributes that identify this node, including Type, Name, and Environment information.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # The name of the entity represented by this node.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for this node within the dependency graph.
        @[JSON::Field(key: "NodeId")]
        getter node_id : String

        # The duration or processing time associated with this node, if applicable.
        @[JSON::Field(key: "Duration")]
        getter duration : Float64?

        # The operation associated with this node, if applicable.
        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The status of the entity represented by this node.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of entity represented by this node, such as Service or Resource .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @key_attributes : Hash(String, String),
          @name : String,
          @node_id : String,
          @duration : Float64? = nil,
          @operation : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct PutGroupingConfigurationInput
        include JSON::Serializable

        # An array of grouping attribute definitions that specify how services should be grouped. Each
        # definition includes a friendly name, source keys to derive the grouping value from, and an optional
        # default value.
        @[JSON::Field(key: "GroupingAttributeDefinitions")]
        getter grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition)

        def initialize(
          @grouping_attribute_definitions : Array(Types::GroupingAttributeDefinition)
        )
        end
      end

      struct PutGroupingConfigurationOutput
        include JSON::Serializable

        # A structure containing the updated grouping configuration, including all grouping attribute
        # definitions and the timestamp when it was last updated.
        @[JSON::Field(key: "GroupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration

        def initialize(
          @grouping_configuration : Types::GroupingConfiguration
        )
        end
      end

      # The recurrence rule for the SLO time window exclusion .
      struct RecurrenceRule
        include JSON::Serializable

        # A cron or rate expression that specifies the schedule for the exclusion window.
        @[JSON::Field(key: "Expression")]
        getter expression : String

        def initialize(
          @expression : String
        )
        end
      end

      # This structure contains information about the performance metric that a request-based SLO monitors.
      struct RequestBasedServiceLevelIndicator
        include JSON::Serializable

        # A structure that contains information about the metric that the SLO monitors.
        @[JSON::Field(key: "RequestBasedSliMetric")]
        getter request_based_sli_metric : Types::RequestBasedServiceLevelIndicatorMetric

        # The arithmetic operation used when comparing the specified metric to the threshold.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # This value is the threshold that the observed metric values of the SLI metric are compared to.
        @[JSON::Field(key: "MetricThreshold")]
        getter metric_threshold : Float64?

        def initialize(
          @request_based_sli_metric : Types::RequestBasedServiceLevelIndicatorMetric,
          @comparison_operator : String? = nil,
          @metric_threshold : Float64? = nil
        )
        end
      end

      # This structure specifies the information about the service and the performance metric that a
      # request-based SLO is to monitor.
      struct RequestBasedServiceLevelIndicatorConfig
        include JSON::Serializable

        # Use this structure to specify the metric to be used for the SLO.
        @[JSON::Field(key: "RequestBasedSliMetricConfig")]
        getter request_based_sli_metric_config : Types::RequestBasedServiceLevelIndicatorMetricConfig

        # The arithmetic operation to use when comparing the specified metric to the threshold. This parameter
        # is required if this SLO is tracking the Latency metric.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # The value that the SLI metric is compared to. This parameter is required if this SLO is tracking the
        # Latency metric.
        @[JSON::Field(key: "MetricThreshold")]
        getter metric_threshold : Float64?

        def initialize(
          @request_based_sli_metric_config : Types::RequestBasedServiceLevelIndicatorMetricConfig,
          @comparison_operator : String? = nil,
          @metric_threshold : Float64? = nil
        )
        end
      end

      # This structure contains the information about the metric that is used for a request-based SLO.
      struct RequestBasedServiceLevelIndicatorMetric
        include JSON::Serializable

        # This structure defines the metric that is used as the "good request" or "bad request" value for a
        # request-based SLO. This value observed for the metric defined in TotalRequestCountMetric is divided
        # by the number found for MonitoredRequestCountMetric to determine the percentage of successful
        # requests that this SLO tracks.
        @[JSON::Field(key: "MonitoredRequestCountMetric")]
        getter monitored_request_count_metric : Types::MonitoredRequestCountMetricDataQueries

        # This structure defines the metric that is used as the "total requests" number for a request-based
        # SLO. The number observed for this metric is divided by the number of "good requests" or "bad
        # requests" that is observed for the metric defined in MonitoredRequestCountMetric .
        @[JSON::Field(key: "TotalRequestCountMetric")]
        getter total_request_count_metric : Array(Types::MetricDataQuery)

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # This is a string-to-string map that contains information about the type of object that this SLO is
        # related to. It can include the following fields. Type designates the type of object that this SLO is
        # related to. ResourceType specifies the type of the resource. This field is used only when the value
        # of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This is used
        # only if the value of the Type field is Service , RemoteService , or AWS::Service . Identifier
        # identifies the resource objects of this resource. This is used only if the value of the Type field
        # is Resource or AWS::Resource . Environment specifies the location where this object is hosted, or
        # what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # If the SLO monitors either the LATENCY or AVAILABILITY metric that Application Signals collects,
        # this field displays which of those metrics is used.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?

        # If the SLO monitors a specific operation of the service, this field displays that operation name.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        def initialize(
          @monitored_request_count_metric : Types::MonitoredRequestCountMetricDataQueries,
          @total_request_count_metric : Array(Types::MetricDataQuery),
          @dependency_config : Types::DependencyConfig? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @metric_type : String? = nil,
          @operation_name : String? = nil
        )
        end
      end

      # Use this structure to specify the information for the metric that a period-based SLO will monitor.
      struct RequestBasedServiceLevelIndicatorMetricConfig
        include JSON::Serializable

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # If this SLO is related to a metric collected by Application Signals, you must use this field to
        # specify which service the SLO metric is related to. To do so, you must specify at least the Type ,
        # Name , and Environment attributes. This is a string-to-string map. It can include the following
        # fields. Type designates the type of object this is. ResourceType specifies the type of the resource.
        # This field is used only when the value of the Type field is Resource or AWS::Resource . Name
        # specifies the name of the object. This is used only if the value of the Type field is Service ,
        # RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource. This
        # is used only if the value of the Type field is Resource or AWS::Resource . Environment specifies the
        # location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # If the SLO is to monitor either the LATENCY or AVAILABILITY metric that Application Signals
        # collects, use this field to specify which of those metrics is used.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?

        # Use this structure to define the metric that you want to use as the "good request" or "bad request"
        # value for a request-based SLO. This value observed for the metric defined in TotalRequestCountMetric
        # will be divided by the number found for MonitoredRequestCountMetric to determine the percentage of
        # successful requests that this SLO tracks.
        @[JSON::Field(key: "MonitoredRequestCountMetric")]
        getter monitored_request_count_metric : Types::MonitoredRequestCountMetricDataQueries?

        # If the SLO is to monitor a specific operation of the service, use this field to specify the name of
        # that operation.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        # Use this structure to define the metric that you want to use as the "total requests" number for a
        # request-based SLO. This result will be divided by the "good request" or "bad request" value defined
        # in MonitoredRequestCountMetric .
        @[JSON::Field(key: "TotalRequestCountMetric")]
        getter total_request_count_metric : Array(Types::MetricDataQuery)?

        def initialize(
          @dependency_config : Types::DependencyConfig? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @metric_type : String? = nil,
          @monitored_request_count_metric : Types::MonitoredRequestCountMetricDataQueries? = nil,
          @operation_name : String? = nil,
          @total_request_count_metric : Array(Types::MetricDataQuery)? = nil
        )
        end
      end

      # Resource not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Can't find the resource id.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type is not valid.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # If the interval for this SLO is a rolling interval, this structure contains the interval
      # specifications.
      struct RollingInterval
        include JSON::Serializable

        # Specifies the duration of each rolling interval. For example, if Duration is 7 and DurationUnit is
        # DAY , each rolling interval is seven days.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32

        # Specifies the rolling interval unit.
        @[JSON::Field(key: "DurationUnit")]
        getter duration_unit : String

        def initialize(
          @duration : Int32,
          @duration_unit : String
        )
        end
      end

      # This structure contains information about one of your services that was discovered by Application
      # Signals.
      struct Service
        include JSON::Serializable

        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this is. ResourceType specifies the type of the resource. This field is used only when the
        # value of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This
        # is used only if the value of the Type field is Service , RemoteService , or AWS::Service .
        # Identifier identifies the resource objects of this resource. This is used only if the value of the
        # Type field is Resource or AWS::Resource . Environment specifies the location where this object is
        # hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # An array of structures that each contain information about one metric associated with this service.
        @[JSON::Field(key: "MetricReferences")]
        getter metric_references : Array(Types::MetricReference)

        # This structure contains one or more string-to-string maps that help identify this service. It can
        # include platform attributes , application attributes , and telemetry attributes . Platform
        # attributes contain information the service's platform. PlatformType defines the hosted-in platform.
        # EKS.Cluster is the name of the Amazon EKS cluster. K8s.Cluster is the name of the self-hosted
        # Kubernetes cluster. K8s.Namespace is the name of the Kubernetes namespace in either Amazon EKS or
        # Kubernetes clusters. K8s.Workload is the name of the Kubernetes workload in either Amazon EKS or
        # Kubernetes clusters. K8s.Node is the name of the Kubernetes node in either Amazon EKS or Kubernetes
        # clusters. K8s.Pod is the name of the Kubernetes pod in either Amazon EKS or Kubernetes clusters.
        # EC2.AutoScalingGroup is the name of the Amazon EC2 Auto Scaling group. EC2.InstanceId is the ID of
        # the Amazon EC2 instance. Host is the name of the host, for all platform types. Application
        # attributes contain information about the application. AWS.Application is the application's name in
        # Amazon Web Services Service Catalog AppRegistry. AWS.Application.ARN is the application's ARN in
        # Amazon Web Services Service Catalog AppRegistry. Telemetry attributes contain telemetry information.
        # Telemetry.SDK is the fingerprint of the OpenTelemetry SDK version for instrumented services.
        # Telemetry.Agent is the fingerprint of the agent used to collect and send telemetry data.
        # Telemetry.Source Specifies the point of application where the telemetry was collected or specifies
        # what was used for the source of telemetry data.
        @[JSON::Field(key: "AttributeMaps")]
        getter attribute_maps : Array(Hash(String, String))?

        # An array of string-to-string maps that each contain information about one log group associated with
        # this service. Each string-to-string map includes the following fields: "Type": "AWS::Resource"
        # "ResourceType": "AWS::Logs::LogGroup" "Identifier": " name-of-log-group "
        @[JSON::Field(key: "LogGroupReferences")]
        getter log_group_references : Array(Hash(String, String))?

        # An array of service groups that this service belongs to, based on the configured grouping
        # attributes.
        @[JSON::Field(key: "ServiceGroups")]
        getter service_groups : Array(Types::ServiceGroup)?

        def initialize(
          @key_attributes : Hash(String, String),
          @metric_references : Array(Types::MetricReference),
          @attribute_maps : Array(Hash(String, String))? = nil,
          @log_group_references : Array(Hash(String, String))? = nil,
          @service_groups : Array(Types::ServiceGroup)? = nil
        )
        end
      end

      # This structure contains information about one dependency of this service.
      struct ServiceDependency
        include JSON::Serializable

        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this is. ResourceType specifies the type of the resource. This field is used only when the
        # value of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This
        # is used only if the value of the Type field is Service , RemoteService , or AWS::Service .
        # Identifier identifies the resource objects of this resource. This is used only if the value of the
        # Type field is Resource or AWS::Resource . Environment specifies the location where this object is
        # hosted, or what it belongs to.
        @[JSON::Field(key: "DependencyKeyAttributes")]
        getter dependency_key_attributes : Hash(String, String)

        # The name of the called operation in the dependency.
        @[JSON::Field(key: "DependencyOperationName")]
        getter dependency_operation_name : String

        # An array of structures that each contain information about one metric associated with this service
        # dependency that was discovered by Application Signals.
        @[JSON::Field(key: "MetricReferences")]
        getter metric_references : Array(Types::MetricReference)

        # The name of the operation in this service that calls the dependency.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String

        def initialize(
          @dependency_key_attributes : Hash(String, String),
          @dependency_operation_name : String,
          @metric_references : Array(Types::MetricReference),
          @operation_name : String
        )
        end
      end

      # This structure contains information about a service dependent that was discovered by Application
      # Signals. A dependent is an entity that invoked the specified service during the provided time range.
      # Dependents include other services, CloudWatch Synthetics canaries, and clients that are instrumented
      # with CloudWatch RUM app monitors.
      struct ServiceDependent
        include JSON::Serializable

        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this is. ResourceType specifies the type of the resource. This field is used only when the
        # value of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This
        # is used only if the value of the Type field is Service , RemoteService , or AWS::Service .
        # Identifier identifies the resource objects of this resource. This is used only if the value of the
        # Type field is Resource or AWS::Resource . Environment specifies the location where this object is
        # hosted, or what it belongs to.
        @[JSON::Field(key: "DependentKeyAttributes")]
        getter dependent_key_attributes : Hash(String, String)

        # An array of structures that each contain information about one metric associated with this service
        # dependent that was discovered by Application Signals.
        @[JSON::Field(key: "MetricReferences")]
        getter metric_references : Array(Types::MetricReference)

        # If the dependent invoker was a service that invoked it from an operation, the name of that dependent
        # operation is displayed here.
        @[JSON::Field(key: "DependentOperationName")]
        getter dependent_operation_name : String?

        # If the invoked entity is an operation on an entity, the name of that dependent operation is
        # displayed here.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        def initialize(
          @dependent_key_attributes : Hash(String, String),
          @metric_references : Array(Types::MetricReference),
          @dependent_operation_name : String? = nil,
          @operation_name : String? = nil
        )
        end
      end

      # A structure that contains identifying information for a service entity.
      struct ServiceEntity
        include JSON::Serializable

        # The Amazon Web Services account ID where the service is located. Provide this value only for
        # cross-account access.
        @[JSON::Field(key: "AwsAccountId")]
        getter aws_account_id : String?

        # The environment where the service is deployed.
        @[JSON::Field(key: "Environment")]
        getter environment : String?

        # The name of the service.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of the service entity.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @aws_account_id : String? = nil,
          @environment : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that represents a logical grouping of services based on shared attributes such as
      # business unit, environment, or entry point.
      struct ServiceGroup
        include JSON::Serializable

        # A unique identifier for this grouping attribute value, used for filtering and API operations.
        @[JSON::Field(key: "GroupIdentifier")]
        getter group_identifier : String

        # The name of the grouping attribute, such as BusinessUnit or Environment .
        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The source of the grouping attribute, such as TAG , OTEL , or DEFAULT .
        @[JSON::Field(key: "GroupSource")]
        getter group_source : String

        # The value of the grouping attribute for this service, such as Payments or Production .
        @[JSON::Field(key: "GroupValue")]
        getter group_value : String

        def initialize(
          @group_identifier : String,
          @group_name : String,
          @group_source : String,
          @group_value : String
        )
        end
      end

      # This structure contains information about the performance metric that a period-based SLO monitors.
      struct ServiceLevelIndicator
        include JSON::Serializable

        # The arithmetic operation used when comparing the specified metric to the threshold.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # The value that the SLI metric is compared to.
        @[JSON::Field(key: "MetricThreshold")]
        getter metric_threshold : Float64

        # A structure that contains information about the metric that the SLO monitors.
        @[JSON::Field(key: "SliMetric")]
        getter sli_metric : Types::ServiceLevelIndicatorMetric

        def initialize(
          @comparison_operator : String,
          @metric_threshold : Float64,
          @sli_metric : Types::ServiceLevelIndicatorMetric
        )
        end
      end

      # This structure specifies the information about the service and the performance metric that a
      # period-based SLO is to monitor.
      struct ServiceLevelIndicatorConfig
        include JSON::Serializable

        # The arithmetic operation to use when comparing the specified metric to the threshold.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # This parameter is used only when a request-based SLO tracks the Latency metric. Specify the
        # threshold value that the observed Latency metric values are to be compared to.
        @[JSON::Field(key: "MetricThreshold")]
        getter metric_threshold : Float64

        # Use this structure to specify the metric to be used for the SLO.
        @[JSON::Field(key: "SliMetricConfig")]
        getter sli_metric_config : Types::ServiceLevelIndicatorMetricConfig

        def initialize(
          @comparison_operator : String,
          @metric_threshold : Float64,
          @sli_metric_config : Types::ServiceLevelIndicatorMetricConfig
        )
        end
      end

      # This structure contains the information about the metric that is used for a period-based SLO.
      struct ServiceLevelIndicatorMetric
        include JSON::Serializable

        # If this SLO monitors a CloudWatch metric or the result of a CloudWatch metric math expression, this
        # structure includes the information about that metric or expression.
        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # This is a string-to-string map that contains information about the type of object that this SLO is
        # related to. It can include the following fields. Type designates the type of object that this SLO is
        # related to. ResourceType specifies the type of the resource. This field is used only when the value
        # of the Type field is Resource or AWS::Resource . Name specifies the name of the object. This is used
        # only if the value of the Type field is Service , RemoteService , or AWS::Service . Identifier
        # identifies the resource objects of this resource. This is used only if the value of the Type field
        # is Resource or AWS::Resource . Environment specifies the location where this object is hosted, or
        # what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # If the SLO monitors either the LATENCY or AVAILABILITY metric that Application Signals collects,
        # this field displays which of those metrics is used.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?

        # If the SLO monitors a specific operation of the service, this field displays that operation name.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        def initialize(
          @metric_data_queries : Array(Types::MetricDataQuery),
          @dependency_config : Types::DependencyConfig? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @metric_type : String? = nil,
          @operation_name : String? = nil
        )
        end
      end

      # Use this structure to specify the information for the metric that a period-based SLO will monitor.
      struct ServiceLevelIndicatorMetricConfig
        include JSON::Serializable

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # If this SLO is related to a metric collected by Application Signals, you must use this field to
        # specify which service the SLO metric is related to. To do so, you must specify at least the Type ,
        # Name , and Environment attributes. This is a string-to-string map. It can include the following
        # fields. Type designates the type of object this is. ResourceType specifies the type of the resource.
        # This field is used only when the value of the Type field is Resource or AWS::Resource . Name
        # specifies the name of the object. This is used only if the value of the Type field is Service ,
        # RemoteService , or AWS::Service . Identifier identifies the resource objects of this resource. This
        # is used only if the value of the Type field is Resource or AWS::Resource . Environment specifies the
        # location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # If this SLO monitors a CloudWatch metric or the result of a CloudWatch metric math expression, use
        # this structure to specify that metric or expression.
        @[JSON::Field(key: "MetricDataQueries")]
        getter metric_data_queries : Array(Types::MetricDataQuery)?

        # The name of the CloudWatch metric to use for the SLO, when using a custom metric rather than
        # Application Signals standard metrics.
        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # If the SLO is to monitor either the LATENCY or AVAILABILITY metric that Application Signals
        # collects, use this field to specify which of those metrics is used.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?

        # If the SLO is to monitor a specific operation of the service, use this field to specify the name of
        # that operation.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        # The number of seconds to use as the period for SLO evaluation. Your application's performance is
        # compared to the SLI during each period. For each period, the application is determined to have
        # either achieved or not achieved the necessary performance.
        @[JSON::Field(key: "PeriodSeconds")]
        getter period_seconds : Int32?

        # The statistic to use for comparison to the threshold. It can be any CloudWatch statistic or extended
        # statistic. For more information about statistics, see CloudWatch statistics definitions .
        @[JSON::Field(key: "Statistic")]
        getter statistic : String?

        def initialize(
          @dependency_config : Types::DependencyConfig? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @metric_data_queries : Array(Types::MetricDataQuery)? = nil,
          @metric_name : String? = nil,
          @metric_type : String? = nil,
          @operation_name : String? = nil,
          @period_seconds : Int32? = nil,
          @statistic : String? = nil
        )
        end
      end

      # A structure containing information about one service level objective (SLO) that has been created in
      # Application Signals. Creating SLOs can help you ensure your services are performing to the level
      # that you expect. SLOs help you set and track a specific target level for the reliability and
      # availability of your applications and services. Each SLO uses a service level indicator (SLI), which
      # is a key performance metric, to calculate how much underperformance can be tolerated before the goal
      # that you set for the SLO is not achieved.
      struct ServiceLevelObjective
        include JSON::Serializable

        # The ARN of this SLO.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date and time that this SLO was created. When used in a raw HTTP Query API, it is formatted as
        # yyyy-MM-dd'T'HH:mm:ss . For example, 2019-07-01T23:59:59 .
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time

        @[JSON::Field(key: "Goal")]
        getter goal : Types::Goal

        # The time that this SLO was most recently updated. When used in a raw HTTP Query API, it is formatted
        # as yyyy-MM-dd'T'HH:mm:ss . For example, 2019-07-01T23:59:59 .
        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time

        # The name of this SLO.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Each object in this array defines the length of the look-back window used to calculate one burn rate
        # metric for this SLO. The burn rate measures how fast the service is consuming the error budget,
        # relative to the attainment goal of the SLO.
        @[JSON::Field(key: "BurnRateConfigurations")]
        getter burn_rate_configurations : Array(Types::BurnRateConfiguration)?

        # The description that you created for this SLO.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Displays whether this is a period-based SLO or a request-based SLO.
        @[JSON::Field(key: "EvaluationType")]
        getter evaluation_type : String?

        # Displays the SLI metric source type for this SLO. Supported types are: Service operation Service
        # dependency CloudWatch metric
        @[JSON::Field(key: "MetricSourceType")]
        getter metric_source_type : String?

        # A structure containing information about the performance metric that this SLO monitors, if this is a
        # request-based SLO.
        @[JSON::Field(key: "RequestBasedSli")]
        getter request_based_sli : Types::RequestBasedServiceLevelIndicator?

        # A structure containing information about the performance metric that this SLO monitors, if this is a
        # period-based SLO.
        @[JSON::Field(key: "Sli")]
        getter sli : Types::ServiceLevelIndicator?

        def initialize(
          @arn : String,
          @created_time : Time,
          @goal : Types::Goal,
          @last_updated_time : Time,
          @name : String,
          @burn_rate_configurations : Array(Types::BurnRateConfiguration)? = nil,
          @description : String? = nil,
          @evaluation_type : String? = nil,
          @metric_source_type : String? = nil,
          @request_based_sli : Types::RequestBasedServiceLevelIndicator? = nil,
          @sli : Types::ServiceLevelIndicator? = nil
        )
        end
      end

      # A structure containing an SLO budget report that you have requested.
      struct ServiceLevelObjectiveBudgetReport
        include JSON::Serializable

        # The ARN of the SLO that this report is for.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The status of this SLO, as it relates to the error budget for the entire time interval. OK means
        # that the SLO had remaining budget above the warning threshold, as of the time that you specified in
        # TimeStamp . WARNING means that the SLO's remaining budget was below the warning threshold, as of the
        # time that you specified in TimeStamp . BREACHED means that the SLO's budget was exhausted, as of the
        # time that you specified in TimeStamp . INSUFFICIENT_DATA means that the specified start and end
        # times were before the SLO was created, or that attainment data is missing.
        @[JSON::Field(key: "BudgetStatus")]
        getter budget_status : String

        # The name of the SLO that this report is for.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A number between 0 and 100 that represents the success percentage of your application compared to
        # the goal set by the SLO. If this is a period-based SLO, the number is the percentage of time periods
        # that the service has attained the SLO's attainment goal, as of the time of the request. If this is a
        # request-based SLO, the number is the number of successful requests divided by the number of total
        # requests, multiplied by 100, during the time range that you specified in your request.
        @[JSON::Field(key: "Attainment")]
        getter attainment : Float64?

        # This field is displayed only for request-based SLOs. It displays the number of failed requests that
        # can be tolerated before any more successful requests occur, and still have the application meet its
        # SLO goal. This number can go up and down between different reports, based on both how many
        # successful requests and how many failed requests occur in that time.
        @[JSON::Field(key: "BudgetRequestsRemaining")]
        getter budget_requests_remaining : Int32?

        # The budget amount remaining before the SLO status becomes BREACHING , at the time specified in the
        # Timestemp parameter of the request. If this value is negative, then the SLO is already in BREACHING
        # status. This field is included only if the SLO is a period-based SLO.
        @[JSON::Field(key: "BudgetSecondsRemaining")]
        getter budget_seconds_remaining : Int32?

        # Displays whether this budget report is for a period-based SLO or a request-based SLO.
        @[JSON::Field(key: "EvaluationType")]
        getter evaluation_type : String?

        @[JSON::Field(key: "Goal")]
        getter goal : Types::Goal?

        @[JSON::Field(key: "RequestBasedSli")]
        getter request_based_sli : Types::RequestBasedServiceLevelIndicator?

        # A structure that contains information about the performance metric that this SLO monitors.
        @[JSON::Field(key: "Sli")]
        getter sli : Types::ServiceLevelIndicator?

        # This field is displayed only for request-based SLOs. It displays the total number of failed requests
        # that can be tolerated during the time range between the start of the interval and the time stamp
        # supplied in the budget report request. It is based on the total number of requests that occurred,
        # and the percentage specified in the attainment goal. If the number of failed requests matches this
        # number or is higher, then this SLO is currently breaching. This number can go up and down between
        # reports with different time stamps, based on both how many total requests occur.
        @[JSON::Field(key: "TotalBudgetRequests")]
        getter total_budget_requests : Int32?

        # The total number of seconds in the error budget for the interval. This field is included only if the
        # SLO is a period-based SLO.
        @[JSON::Field(key: "TotalBudgetSeconds")]
        getter total_budget_seconds : Int32?

        def initialize(
          @arn : String,
          @budget_status : String,
          @name : String,
          @attainment : Float64? = nil,
          @budget_requests_remaining : Int32? = nil,
          @budget_seconds_remaining : Int32? = nil,
          @evaluation_type : String? = nil,
          @goal : Types::Goal? = nil,
          @request_based_sli : Types::RequestBasedServiceLevelIndicator? = nil,
          @sli : Types::ServiceLevelIndicator? = nil,
          @total_budget_requests : Int32? = nil,
          @total_budget_seconds : Int32? = nil
        )
        end
      end

      # A structure containing information about one error that occurred during a
      # BatchGetServiceLevelObjectiveBudgetReport operation.
      struct ServiceLevelObjectiveBudgetReportError
        include JSON::Serializable

        # The ARN of the SLO that this error is related to.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The error code for this error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The message for this error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The name of the SLO that this error is related to.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @arn : String,
          @error_code : String,
          @error_message : String,
          @name : String
        )
        end
      end

      # A structure that contains identifying information for a service level objective entity.
      struct ServiceLevelObjectiveEntity
        include JSON::Serializable

        # The ARN of the service level objective. The SLO must be provided with ARN for cross-account access.
        @[JSON::Field(key: "SloArn")]
        getter slo_arn : String?

        # The name of the service level objective.
        @[JSON::Field(key: "SloName")]
        getter slo_name : String?

        def initialize(
          @slo_arn : String? = nil,
          @slo_name : String? = nil
        )
        end
      end

      # A structure that contains information about one service level objective (SLO) created in Application
      # Signals.
      struct ServiceLevelObjectiveSummary
        include JSON::Serializable

        # The ARN of this service level objective.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The name of the service level objective.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The date and time that this service level objective was created. It is expressed as the number of
        # milliseconds since Jan 1, 1970 00:00:00 UTC.
        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # Identifies the dependency using the DependencyKeyAttributes and DependencyOperationName .
        @[JSON::Field(key: "DependencyConfig")]
        getter dependency_config : Types::DependencyConfig?

        # Displays whether this is a period-based SLO or a request-based SLO.
        @[JSON::Field(key: "EvaluationType")]
        getter evaluation_type : String?

        # This is a string-to-string map. It can include the following fields. Type designates the type of
        # object this service level objective is for. ResourceType specifies the type of the resource. This
        # field is used only when the value of the Type field is Resource or AWS::Resource . Name specifies
        # the name of the object. This is used only if the value of the Type field is Service , RemoteService
        # , or AWS::Service . Identifier identifies the resource objects of this resource. This is used only
        # if the value of the Type field is Resource or AWS::Resource . Environment specifies the location
        # where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)?

        # Displays the SLI metric source type for this SLO. Supported types are: Service operation Service
        # dependency CloudWatch metric
        @[JSON::Field(key: "MetricSourceType")]
        getter metric_source_type : String?

        # If this service level objective is specific to a single operation, this field displays the name of
        # that operation.
        @[JSON::Field(key: "OperationName")]
        getter operation_name : String?

        def initialize(
          @arn : String,
          @name : String,
          @created_time : Time? = nil,
          @dependency_config : Types::DependencyConfig? = nil,
          @evaluation_type : String? = nil,
          @key_attributes : Hash(String, String)? = nil,
          @metric_source_type : String? = nil,
          @operation_name : String? = nil
        )
        end
      end

      # This structure contains information about an operation discovered by Application Signals. An
      # operation is a specific function performed by a service that was discovered by Application Signals,
      # and is often an API that is called by an upstream dependent.
      struct ServiceOperation
        include JSON::Serializable

        # An array of structures that each contain information about one metric associated with this service
        # operation that was discovered by Application Signals.
        @[JSON::Field(key: "MetricReferences")]
        getter metric_references : Array(Types::MetricReference)

        # The name of the operation, discovered by Application Signals.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @metric_references : Array(Types::MetricReference),
          @name : String
        )
        end
      end

      # A structure that contains identifying information for a service operation entity.
      struct ServiceOperationEntity
        include JSON::Serializable

        # The type of metric associated with this service operation.
        @[JSON::Field(key: "MetricType")]
        getter metric_type : String?

        # The name of the operation.
        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The service entity that contains this operation.
        @[JSON::Field(key: "Service")]
        getter service : Types::ServiceEntity?

        def initialize(
          @metric_type : String? = nil,
          @operation : String? = nil,
          @service : Types::ServiceEntity? = nil
        )
        end
      end

      # This request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A structure that contains information about the current state of a service, including its latest
      # change events such as deployments and other state-changing activities.
      struct ServiceState
        include JSON::Serializable

        # An array containing the most recent change events for this service, such as deployments, with
        # information about when they occurred and who initiated them.
        @[JSON::Field(key: "LatestChangeEvents")]
        getter latest_change_events : Array(Types::ChangeEvent)

        # The key attributes that identify this service, including Type, Name, and Environment information.
        @[JSON::Field(key: "Service")]
        getter service : Hash(String, String)

        # The attribute filters that were applied when retrieving this service state information.
        @[JSON::Field(key: "AttributeFilters")]
        getter attribute_filters : Array(Types::AttributeFilter)?

        def initialize(
          @latest_change_events : Array(Types::ChangeEvent),
          @service : Hash(String, String),
          @attribute_filters : Array(Types::AttributeFilter)? = nil
        )
        end
      end

      # This structure contains information about one of your services that was discovered by Application
      # Signals
      struct ServiceSummary
        include JSON::Serializable

        # This is a string-to-string map that help identify the objects discovered by Application Signals. It
        # can include the following fields. Type designates the type of object this is. ResourceType specifies
        # the type of the resource. This field is used only when the value of the Type field is Resource or
        # AWS::Resource . Name specifies the name of the object. This is used only if the value of the Type
        # field is Service , RemoteService , or AWS::Service . Identifier identifies the resource objects of
        # this resource. This is used only if the value of the Type field is Resource or AWS::Resource .
        # Environment specifies the location where this object is hosted, or what it belongs to.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Hash(String, String)

        # An array of structures that each contain information about one metric associated with this service.
        @[JSON::Field(key: "MetricReferences")]
        getter metric_references : Array(Types::MetricReference)

        # This structure contains one or more string-to-string maps that help identify this service. It can
        # include platform attributes , application attributes , and telemetry attributes . Platform
        # attributes contain information the service's platform. PlatformType defines the hosted-in platform.
        # EKS.Cluster is the name of the Amazon EKS cluster. K8s.Cluster is the name of the self-hosted
        # Kubernetes cluster. K8s.Namespace is the name of the Kubernetes namespace in either Amazon EKS or
        # Kubernetes clusters. K8s.Workload is the name of the Kubernetes workload in either Amazon EKS or
        # Kubernetes clusters. K8s.Node is the name of the Kubernetes node in either Amazon EKS or Kubernetes
        # clusters. K8s.Pod is the name of the Kubernetes pod in either Amazon EKS or Kubernetes clusters.
        # EC2.AutoScalingGroup is the name of the Amazon EC2 Auto Scaling group. EC2.InstanceId is the ID of
        # the Amazon EC2 instance. Host is the name of the host, for all platform types. Application
        # attributes contain information about the application. AWS.Application is the application's name in
        # Amazon Web Services Service Catalog AppRegistry. AWS.Application.ARN is the application's ARN in
        # Amazon Web Services Service Catalog AppRegistry. Telemetry attributes contain telemetry information.
        # Telemetry.SDK is the fingerprint of the OpenTelemetry SDK version for instrumented services.
        # Telemetry.Agent is the fingerprint of the agent used to collect and send telemetry data.
        # Telemetry.Source Specifies the point of application where the telemetry was collected or specifies
        # what was used for the source of telemetry data.
        @[JSON::Field(key: "AttributeMaps")]
        getter attribute_maps : Array(Hash(String, String))?

        # An array of service groups that this service belongs to, based on the configured grouping
        # attributes.
        @[JSON::Field(key: "ServiceGroups")]
        getter service_groups : Array(Types::ServiceGroup)?

        def initialize(
          @key_attributes : Hash(String, String),
          @metric_references : Array(Types::MetricReference),
          @attribute_maps : Array(Hash(String, String))? = nil,
          @service_groups : Array(Types::ServiceGroup)? = nil
        )
        end
      end

      struct StartDiscoveryInput
        include JSON::Serializable

        def initialize
        end
      end

      struct StartDiscoveryOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A key-value pair associated with a resource. Tags can help you organize and categorize your
      # resources.
      struct Tag
        include JSON::Serializable

        # A string that you can use to assign a value. The combination of tag keys and values can help you
        # organize and categorize your resources.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the specified tag key.
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

        # The Amazon Resource Name (ARN) of the CloudWatch resource that you want to set tags for. The ARN
        # format of an Application Signals SLO is arn:aws:cloudwatch: Region : account-id :slo: slo-name For
        # more information about ARN format, see Resource Types Defined by Amazon CloudWatch in the Amazon Web
        # Services General Reference .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the alarm.
        @[JSON::Field(key: "Tags")]
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

      # The request was throttled because of quota limits.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch resource that you want to delete tags from. The ARN
        # format of an Application Signals SLO is arn:aws:cloudwatch: Region : account-id :slo: slo-name For
        # more information about ARN format, see Resource Types Defined by Amazon CloudWatch in the Amazon Web
        # Services General Reference .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
        @[JSON::Field(key: "TagKeys")]
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

      struct UpdateServiceLevelObjectiveInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or name of the service level objective that you want to update.
        @[JSON::Field(key: "Id")]
        getter id : String

        # Use this array to create burn rates for this SLO. Each burn rate is a metric that indicates how fast
        # the service is consuming the error budget, relative to the attainment goal of the SLO.
        @[JSON::Field(key: "BurnRateConfigurations")]
        getter burn_rate_configurations : Array(Types::BurnRateConfiguration)?

        # An optional description for the SLO.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A structure that contains the attributes that determine the goal of the SLO. This includes the time
        # period for evaluation and the attainment threshold.
        @[JSON::Field(key: "Goal")]
        getter goal : Types::Goal?

        # If this SLO is a request-based SLO, this structure defines the information about what performance
        # metric this SLO will monitor. You can't specify both SliConfig and RequestBasedSliConfig in the same
        # operation.
        @[JSON::Field(key: "RequestBasedSliConfig")]
        getter request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig?

        # If this SLO is a period-based SLO, this structure defines the information about what performance
        # metric this SLO will monitor.
        @[JSON::Field(key: "SliConfig")]
        getter sli_config : Types::ServiceLevelIndicatorConfig?

        def initialize(
          @id : String,
          @burn_rate_configurations : Array(Types::BurnRateConfiguration)? = nil,
          @description : String? = nil,
          @goal : Types::Goal? = nil,
          @request_based_sli_config : Types::RequestBasedServiceLevelIndicatorConfig? = nil,
          @sli_config : Types::ServiceLevelIndicatorConfig? = nil
        )
        end
      end

      struct UpdateServiceLevelObjectiveOutput
        include JSON::Serializable

        # A structure that contains information about the SLO that you just updated.
        @[JSON::Field(key: "Slo")]
        getter slo : Types::ServiceLevelObjective

        def initialize(
          @slo : Types::ServiceLevelObjective
        )
        end
      end

      # The resource is not valid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The object that defines the time length of an exclusion window.
      struct Window
        include JSON::Serializable

        # The number of time units for the exclusion window length.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32

        # The unit of time for the exclusion window duration. Valid values: MINUTE, HOUR, DAY, MONTH.
        @[JSON::Field(key: "DurationUnit")]
        getter duration_unit : String

        def initialize(
          @duration : Int32,
          @duration_unit : String
        )
        end
      end
    end
  end
end
