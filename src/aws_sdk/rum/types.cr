require "json"
require "time"

module AwsSdk
  module RUM
    module Types

      # You don't have sufficient permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A RUM app monitor collects telemetry data from your application and sends that data to RUM. The data
      # includes performance and reliability information such as page load time, client-side errors, and
      # user behavior.
      struct AppMonitor
        include JSON::Serializable

        # A structure that contains much of the configuration data for the app monitor.
        @[JSON::Field(key: "AppMonitorConfiguration")]
        getter app_monitor_configuration : Types::AppMonitorConfiguration?

        # The date and time that this app monitor was created.
        @[JSON::Field(key: "Created")]
        getter created : String?

        # Specifies whether this app monitor allows the web client to define and send custom events. For more
        # information about custom events, see Send custom events .
        @[JSON::Field(key: "CustomEvents")]
        getter custom_events : Types::CustomEvents?

        # A structure that contains information about whether this app monitor stores a copy of the telemetry
        # data that RUM collects using CloudWatch Logs.
        @[JSON::Field(key: "DataStorage")]
        getter data_storage : Types::DataStorage?

        # A structure that contains the configuration for how an app monitor can deobfuscate stack traces.
        @[JSON::Field(key: "DeobfuscationConfiguration")]
        getter deobfuscation_configuration : Types::DeobfuscationConfiguration?

        # The top-level internet domain name for which your application has administrative authority.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # List the domain names for which your application has administrative authority.
        @[JSON::Field(key: "DomainList")]
        getter domain_list : Array(String)?

        # The unique ID of this app monitor.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time of the most recent changes to this app monitor's configuration.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The name of the app monitor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The platform type for this app monitor. Valid values are Web for web applications , Android for
        # Android applications, and iOS for IOS applications.
        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The current state of the app monitor.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The list of tag keys and values associated with this app monitor.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @app_monitor_configuration : Types::AppMonitorConfiguration? = nil,
          @created : String? = nil,
          @custom_events : Types::CustomEvents? = nil,
          @data_storage : Types::DataStorage? = nil,
          @deobfuscation_configuration : Types::DeobfuscationConfiguration? = nil,
          @domain : String? = nil,
          @domain_list : Array(String)? = nil,
          @id : String? = nil,
          @last_modified : String? = nil,
          @name : String? = nil,
          @platform : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure contains much of the configuration data for the app monitor.
      struct AppMonitorConfiguration
        include JSON::Serializable

        # If you set this to true , the RUM web client sets two cookies, a session cookie and a user cookie.
        # The cookies allow the RUM web client to collect data relating to the number of users an application
        # has and the behavior of the application across a sequence of events. Cookies are stored in the
        # top-level domain of the current page.
        @[JSON::Field(key: "AllowCookies")]
        getter allow_cookies : Bool?

        # If you set this to true , RUM enables X-Ray tracing for the user sessions that RUM samples. RUM adds
        # an X-Ray trace header to allowed HTTP requests. It also records an X-Ray segment for allowed HTTP
        # requests. You can see traces and segments from these user sessions in the X-Ray console and the
        # CloudWatch ServiceLens console. For more information, see What is X-Ray?
        @[JSON::Field(key: "EnableXRay")]
        getter enable_x_ray : Bool?

        # A list of URLs in your website or application to exclude from RUM data collection. You can't include
        # both ExcludedPages and IncludedPages in the same operation.
        @[JSON::Field(key: "ExcludedPages")]
        getter excluded_pages : Array(String)?

        # A list of pages in your application that are to be displayed with a "favorite" icon in the
        # CloudWatch RUM console.
        @[JSON::Field(key: "FavoritePages")]
        getter favorite_pages : Array(String)?

        # The ARN of the guest IAM role that is attached to the Amazon Cognito identity pool that is used to
        # authorize the sending of data to RUM. It is possible that an app monitor does not have a value for
        # GuestRoleArn . For example, this can happen when you use the console to create an app monitor and
        # you allow CloudWatch RUM to create a new identity pool for Authorization. In this case, GuestRoleArn
        # is not present in the GetAppMonitor response because it is not stored by the service. If this issue
        # affects you, you can take one of the following steps: Use the Cloud Development Kit (CDK) to create
        # an identity pool and the associated IAM role, and use that for your app monitor. Make a separate
        # GetIdentityPoolRoles call to Amazon Cognito to retrieve the GuestRoleArn .
        @[JSON::Field(key: "GuestRoleArn")]
        getter guest_role_arn : String?

        # The ID of the Amazon Cognito identity pool that is used to authorize the sending of data to RUM.
        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # If this app monitor is to collect data from only certain pages in your application, this structure
        # lists those pages. You can't include both ExcludedPages and IncludedPages in the same operation.
        @[JSON::Field(key: "IncludedPages")]
        getter included_pages : Array(String)?

        # Specifies the portion of user sessions to use for RUM data collection. Choosing a higher portion
        # gives you more data but also incurs more costs. The range for this value is 0 to 1 inclusive.
        # Setting this to 1 means that 100% of user sessions are sampled, and setting it to 0.1 means that 10%
        # of user sessions are sampled. If you omit this parameter, the default of 0.1 is used, and 10% of
        # sessions will be sampled.
        @[JSON::Field(key: "SessionSampleRate")]
        getter session_sample_rate : Float64?

        # An array that lists the types of telemetry data that this app monitor is to collect. errors
        # indicates that RUM collects data about unhandled JavaScript errors raised by your application.
        # performance indicates that RUM collects performance data about how your application and its
        # resources are loaded and rendered. This includes Core Web Vitals. http indicates that RUM collects
        # data about HTTP errors thrown by your application.
        @[JSON::Field(key: "Telemetries")]
        getter telemetries : Array(String)?

        def initialize(
          @allow_cookies : Bool? = nil,
          @enable_x_ray : Bool? = nil,
          @excluded_pages : Array(String)? = nil,
          @favorite_pages : Array(String)? = nil,
          @guest_role_arn : String? = nil,
          @identity_pool_id : String? = nil,
          @included_pages : Array(String)? = nil,
          @session_sample_rate : Float64? = nil,
          @telemetries : Array(String)? = nil
        )
        end
      end

      # A structure that contains information about the RUM app monitor.
      struct AppMonitorDetails
        include JSON::Serializable

        # The unique ID of the app monitor.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the app monitor.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The version of the app monitor.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # A structure that includes some data about app monitors and their settings.
      struct AppMonitorSummary
        include JSON::Serializable

        # The date and time that the app monitor was created.
        @[JSON::Field(key: "Created")]
        getter created : String?

        # The unique ID of this app monitor.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time of the most recent changes to this app monitor's configuration.
        @[JSON::Field(key: "LastModified")]
        getter last_modified : String?

        # The name of this app monitor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The platform type for this app monitor. Valid values are Web for web applications, Android for
        # Android applications, and iOS for IOS applications.
        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The current state of this app monitor.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @created : String? = nil,
          @id : String? = nil,
          @last_modified : String? = nil,
          @name : String? = nil,
          @platform : String? = nil,
          @state : String? = nil
        )
        end
      end

      # A structure that defines one error caused by a BatchCreateRumMetricsDefinitions operation.
      struct BatchCreateRumMetricDefinitionsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message for this metric definition.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The metric definition that caused this error.
        @[JSON::Field(key: "MetricDefinition")]
        getter metric_definition : Types::MetricDefinitionRequest

        def initialize(
          @error_code : String,
          @error_message : String,
          @metric_definition : Types::MetricDefinitionRequest
        )
        end
      end

      struct BatchCreateRumMetricDefinitionsRequest
        include JSON::Serializable

        # The name of the CloudWatch RUM app monitor that is to send the metrics.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # The destination to send the metrics to. Valid values are CloudWatch and Evidently . If you specify
        # Evidently , you must also specify the Amazon Resource Name (ARN) of the CloudWatchEvidently
        # experiment that will receive the metrics and an IAM role that has permission to write to the
        # experiment.
        @[JSON::Field(key: "Destination")]
        getter destination : String

        # An array of structures which define the metrics that you want to send.
        @[JSON::Field(key: "MetricDefinitions")]
        getter metric_definitions : Array(Types::MetricDefinitionRequest)

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , do not use
        # this parameter. This parameter specifies the ARN of the Evidently experiment that is to receive the
        # metrics. You must have already defined this experiment as a valid destination. For more information,
        # see PutRumMetricsDestination .
        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @metric_definitions : Array(Types::MetricDefinitionRequest),
          @destination_arn : String? = nil
        )
        end
      end

      struct BatchCreateRumMetricDefinitionsResponse
        include JSON::Serializable

        # An array of error objects, if the operation caused any errors.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchCreateRumMetricDefinitionsError)

        # An array of structures that define the extended metrics.
        @[JSON::Field(key: "MetricDefinitions")]
        getter metric_definitions : Array(Types::MetricDefinition)?

        def initialize(
          @errors : Array(Types::BatchCreateRumMetricDefinitionsError),
          @metric_definitions : Array(Types::MetricDefinition)? = nil
        )
        end
      end

      # A structure that defines one error caused by a BatchCreateRumMetricsDefinitions operation.
      struct BatchDeleteRumMetricDefinitionsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # The error message for this metric definition.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The ID of the metric definition that caused this error.
        @[JSON::Field(key: "MetricDefinitionId")]
        getter metric_definition_id : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @metric_definition_id : String
        )
        end
      end

      struct BatchDeleteRumMetricDefinitionsRequest
        include JSON::Serializable

        # The name of the CloudWatch RUM app monitor that is sending these metrics.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # Defines the destination where you want to stop sending the specified metrics. Valid values are
        # CloudWatch and Evidently . If you specify Evidently , you must also specify the ARN of the
        # CloudWatchEvidently experiment that is to be the destination and an IAM role that has permission to
        # write to the experiment.
        @[JSON::Field(key: "destination")]
        getter destination : String

        # An array of structures which define the metrics that you want to stop sending.
        @[JSON::Field(key: "metricDefinitionIds")]
        getter metric_definition_ids : Array(String)

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , do not use
        # this parameter. This parameter specifies the ARN of the Evidently experiment that was receiving the
        # metrics that are being deleted.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @metric_definition_ids : Array(String),
          @destination_arn : String? = nil
        )
        end
      end

      struct BatchDeleteRumMetricDefinitionsResponse
        include JSON::Serializable

        # An array of error objects, if the operation caused any errors.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchDeleteRumMetricDefinitionsError)

        # The IDs of the metric definitions that were deleted.
        @[JSON::Field(key: "MetricDefinitionIds")]
        getter metric_definition_ids : Array(String)?

        def initialize(
          @errors : Array(Types::BatchDeleteRumMetricDefinitionsError),
          @metric_definition_ids : Array(String)? = nil
        )
        end
      end

      struct BatchGetRumMetricDefinitionsRequest
        include JSON::Serializable

        # The name of the CloudWatch RUM app monitor that is sending the metrics.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # The type of destination that you want to view metrics for. Valid values are CloudWatch and Evidently
        # .
        @[JSON::Field(key: "destination")]
        getter destination : String

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , do not use
        # this parameter. This parameter specifies the ARN of the Evidently experiment that corresponds to the
        # destination.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        # The maximum number of results to return in one operation. The default is 50. The maximum that you
        # can specify is 100. To retrieve the remaining results, make another call with the returned NextToken
        # value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use the token returned by the previous operation to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @destination_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct BatchGetRumMetricDefinitionsResponse
        include JSON::Serializable

        # An array of structures that display information about the metrics that are sent by the specified app
        # monitor to the specified destination.
        @[JSON::Field(key: "MetricDefinitions")]
        getter metric_definitions : Array(Types::MetricDefinition)?

        # A token that you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @metric_definitions : Array(Types::MetricDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # This operation attempted to create a resource that already exists.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the resource that is associated with the error.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The type of the resource that is associated with the error.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_name : String,
          @resource_type : String? = nil
        )
        end
      end

      struct CreateAppMonitorRequest
        include JSON::Serializable

        # A name for the app monitor.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A structure that contains much of the configuration data for the app monitor. If you are using
        # Amazon Cognito for authorization, you must include this structure in your request, and it must
        # include the ID of the Amazon Cognito identity pool to use for authorization. If you don't include
        # AppMonitorConfiguration , you must set up your own authorization method. For more information, see
        # Authorize your application to send data to Amazon Web Services . If you omit this argument, the
        # sample rate used for RUM is set to 10% of the user sessions.
        @[JSON::Field(key: "AppMonitorConfiguration")]
        getter app_monitor_configuration : Types::AppMonitorConfiguration?

        # Specifies whether this app monitor allows the web client to define and send custom events. If you
        # omit this parameter, custom events are DISABLED . For more information about custom events, see Send
        # custom events .
        @[JSON::Field(key: "CustomEvents")]
        getter custom_events : Types::CustomEvents?

        # Data collected by RUM is kept by RUM for 30 days and then deleted. This parameter specifies whether
        # RUM sends a copy of this telemetry data to Amazon CloudWatch Logs in your account. This enables you
        # to keep the telemetry data for more than 30 days, but it does incur Amazon CloudWatch Logs charges.
        # If you omit this parameter, the default is false .
        @[JSON::Field(key: "CwLogEnabled")]
        getter cw_log_enabled : Bool?

        # A structure that contains the configuration for how an app monitor can deobfuscate stack traces.
        @[JSON::Field(key: "DeobfuscationConfiguration")]
        getter deobfuscation_configuration : Types::DeobfuscationConfiguration?

        # The top-level internet domain name for which your application has administrative authority.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # List the domain names for which your application has administrative authority. The CreateAppMonitor
        # requires either the domain or the domain list.
        @[JSON::Field(key: "DomainList")]
        getter domain_list : Array(String)?

        # The platform type for the app monitor. Valid values are Web for web applications, Android for
        # Android applications, and iOS for IOS applications. If you omit this parameter, the default is Web .
        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # Assigns one or more tags (key-value pairs) to the app monitor. Tags can help you organize and
        # categorize your resources. You can also use them to scope user permissions by granting a user
        # permission to access or change only resources with certain tag values. Tags don't have any semantic
        # meaning to Amazon Web Services and are interpreted strictly as strings of characters. You can
        # associate as many as 50 tags with an app monitor. For more information, see Tagging Amazon Web
        # Services resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @app_monitor_configuration : Types::AppMonitorConfiguration? = nil,
          @custom_events : Types::CustomEvents? = nil,
          @cw_log_enabled : Bool? = nil,
          @deobfuscation_configuration : Types::DeobfuscationConfiguration? = nil,
          @domain : String? = nil,
          @domain_list : Array(String)? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAppMonitorResponse
        include JSON::Serializable

        # The unique ID of the new app monitor.
        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A structure that contains information about custom events for this app monitor.
      struct CustomEvents
        include JSON::Serializable

        # Specifies whether this app monitor allows the web client to define and send custom events. The
        # default is for custom events to be DISABLED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # A structure that contains the information about whether the app monitor stores copies of the data
      # that RUM collects in CloudWatch Logs. If it does, this structure also contains the name of the log
      # group.
      struct CwLog
        include JSON::Serializable

        # Indicated whether the app monitor stores copies of the data that RUM collects in CloudWatch Logs.
        @[JSON::Field(key: "CwLogEnabled")]
        getter cw_log_enabled : Bool?

        # The name of the log group where the copies are stored.
        @[JSON::Field(key: "CwLogGroup")]
        getter cw_log_group : String?

        def initialize(
          @cw_log_enabled : Bool? = nil,
          @cw_log_group : String? = nil
        )
        end
      end

      # A structure that contains information about whether this app monitor stores a copy of the telemetry
      # data that RUM collects using CloudWatch Logs.
      struct DataStorage
        include JSON::Serializable

        # A structure that contains the information about whether the app monitor stores copies of the data
        # that RUM collects in CloudWatch Logs. If it does, this structure also contains the name of the log
        # group.
        @[JSON::Field(key: "CwLog")]
        getter cw_log : Types::CwLog?

        def initialize(
          @cw_log : Types::CwLog? = nil
        )
        end
      end

      struct DeleteAppMonitorRequest
        include JSON::Serializable

        # The name of the app monitor to delete.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteAppMonitorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The app monitor that you want to remove the resource policy from.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies a specific policy revision to delete. Provide a PolicyRevisionId to ensure an atomic
        # delete operation. If the revision ID that you provide doesn't match the latest policy revision ID,
        # the request will be rejected with an InvalidPolicyRevisionIdException error.
        @[JSON::Field(key: "policyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @name : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        # The revision ID of the policy that was removed, if it had one.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_revision_id : String? = nil
        )
        end
      end

      struct DeleteRumMetricsDestinationRequest
        include JSON::Serializable

        # The name of the app monitor that is sending metrics to the destination that you want to delete.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # The type of destination to delete. Valid values are CloudWatch and Evidently .
        @[JSON::Field(key: "destination")]
        getter destination : String

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , do not use
        # this parameter. This parameter specifies the ARN of the Evidently experiment that corresponds to the
        # destination to delete.
        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @destination_arn : String? = nil
        )
        end
      end

      struct DeleteRumMetricsDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that contains the configuration for how an app monitor can deobfuscate stack traces.
      struct DeobfuscationConfiguration
        include JSON::Serializable

        # A structure that contains the configuration for how an app monitor can unminify JavaScript error
        # stack traces using source maps.
        @[JSON::Field(key: "JavaScriptSourceMaps")]
        getter java_script_source_maps : Types::JavaScriptSourceMaps?

        def initialize(
          @java_script_source_maps : Types::JavaScriptSourceMaps? = nil
        )
        end
      end

      struct GetAppMonitorDataRequest
        include JSON::Serializable

        # The name of the app monitor that collected the data that you want to retrieve.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A structure that defines the time range that you want to retrieve results from.
        @[JSON::Field(key: "TimeRange")]
        getter time_range : Types::TimeRange

        # An array of structures that you can use to filter the results to those that match one or more sets
        # of key-value pairs that you specify.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::QueryFilter)?

        # The maximum number of results to return in one operation.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use the token returned by the previous operation to request the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @time_range : Types::TimeRange,
          @filters : Array(Types::QueryFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAppMonitorDataResponse
        include JSON::Serializable

        # The events that RUM collected that match your request.
        @[JSON::Field(key: "Events")]
        getter events : Array(String)?

        # A token that you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetAppMonitorRequest
        include JSON::Serializable

        # The app monitor to retrieve information for.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetAppMonitorResponse
        include JSON::Serializable

        # A structure containing all the configuration information for the app monitor.
        @[JSON::Field(key: "AppMonitor")]
        getter app_monitor : Types::AppMonitor?

        def initialize(
          @app_monitor : Types::AppMonitor? = nil
        )
        end
      end

      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The name of the app monitor that is associated with the resource-based policy that you want to view.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The JSON policy document that you requested.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The revision ID information for this version of the policy document that you requested.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_document : String? = nil,
          @policy_revision_id : String? = nil
        )
        end
      end

      # Internal service exception.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The value of a parameter in the request caused an error.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The policy revision ID that you provided doeesn't match the latest policy revision ID.
      struct InvalidPolicyRevisionIdException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A structure that contains the configuration for how an app monitor can unminify JavaScript error
      # stack traces using source maps.
      struct JavaScriptSourceMaps
        include JSON::Serializable

        # Specifies whether JavaScript error stack traces should be unminified for this app monitor. The
        # default is for JavaScript error stack trace unminification to be DISABLED .
        @[JSON::Field(key: "Status")]
        getter status : String

        # The S3Uri of the bucket or folder that stores the source map files. It is required if status is
        # ENABLED.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        def initialize(
          @status : String,
          @s3_uri : String? = nil
        )
        end
      end

      struct ListAppMonitorsRequest
        include JSON::Serializable

        # The maximum number of results to return in one operation. The default is 50. The maximum that you
        # can specify is 100.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use the token returned by the previous operation to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppMonitorsResponse
        include JSON::Serializable

        # An array of structures that contain information about the returned app monitors.
        @[JSON::Field(key: "AppMonitorSummaries")]
        getter app_monitor_summaries : Array(Types::AppMonitorSummary)?

        # A token that you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @app_monitor_summaries : Array(Types::AppMonitorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRumMetricsDestinationsRequest
        include JSON::Serializable

        # The name of the app monitor associated with the destinations that you want to retrieve.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # The maximum number of results to return in one operation. The default is 50. The maximum that you
        # can specify is 100. To retrieve the remaining results, make another call with the returned NextToken
        # value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Use the token returned by the previous operation to request the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_monitor_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRumMetricsDestinationsResponse
        include JSON::Serializable

        # The list of CloudWatch RUM extended metrics destinations associated with the app monitor that you
        # specified.
        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::MetricDestinationSummary)?

        # A token that you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destinations : Array(Types::MetricDestinationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource that you want to see the tags of.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The ARN of the resource that you are viewing.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys and values associated with the resource you specified.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # The policy document that you specified is not formatted correctly.
      struct MalformedPolicyDocumentException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A structure that displays the definition of one extended metric that RUM sends to CloudWatch or
      # CloudWatch Evidently. For more information, see Additional metrics that you can send to CloudWatch
      # and CloudWatch Evidently .
      struct MetricDefinition
        include JSON::Serializable

        # The ID of this metric definition.
        @[JSON::Field(key: "MetricDefinitionId")]
        getter metric_definition_id : String

        # The name of the metric that is defined in this structure.
        @[JSON::Field(key: "Name")]
        getter name : String

        # This field is a map of field paths to dimension names. It defines the dimensions to associate with
        # this metric in CloudWatch The value of this field is used only if the metric destination is
        # CloudWatch . If the metric destination is Evidently , the value of DimensionKeys is ignored.
        @[JSON::Field(key: "DimensionKeys")]
        getter dimension_keys : Hash(String, String)?

        # The pattern that defines the metric. RUM checks events that happen in a user's session against the
        # pattern, and events that match the pattern are sent to the metric destination. If the metrics
        # destination is CloudWatch and the event also matches a value in DimensionKeys , then the metric is
        # published with the specified dimensions.
        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # If this metric definition is for a custom metric instead of an extended metric, this field displays
        # the metric namespace that the custom metric is published to.
        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # Use this field only if you are sending this metric to CloudWatch. It defines the CloudWatch metric
        # unit that this metric is measured in.
        @[JSON::Field(key: "UnitLabel")]
        getter unit_label : String?

        # The field within the event object that the metric value is sourced from.
        @[JSON::Field(key: "ValueKey")]
        getter value_key : String?

        def initialize(
          @metric_definition_id : String,
          @name : String,
          @dimension_keys : Hash(String, String)? = nil,
          @event_pattern : String? = nil,
          @namespace : String? = nil,
          @unit_label : String? = nil,
          @value_key : String? = nil
        )
        end
      end

      # Use this structure to define one extended metric or custom metric that RUM will send to CloudWatch
      # or CloudWatch Evidently. For more information, see Custom metrics and extended metrics that you can
      # send to CloudWatch and CloudWatch Evidently . This structure is validated differently for extended
      # metrics and custom metrics. For extended metrics that are sent to the AWS/RUM namespace, the
      # following validations apply: The Namespace parameter must be omitted or set to AWS/RUM . Only
      # certain combinations of values for Name , ValueKey , and EventPattern are valid. In addition to what
      # is displayed in the following list, the EventPattern can also include information used by the
      # DimensionKeys field. If Name is PerformanceNavigationDuration , then ValueKey must be
      # event_details.duration and the EventPattern must include
      # {"event_type":["com.amazon.rum.performance_navigation_event"]} If Name is
      # PerformanceResourceDuration , then ValueKey must be event_details.duration and the EventPattern must
      # include {"event_type":["com.amazon.rum.performance_resource_event"]} If Name is
      # NavigationSatisfiedTransaction , then ValueKey must be null and the EventPattern must include {
      # "event_type": ["com.amazon.rum.performance_navigation_event"], "event_details": { "duration": [{
      # "numeric": ["&gt;",2000] }] } } If Name is NavigationToleratedTransaction , then ValueKey must be
      # null and the EventPattern must include { "event_type":
      # ["com.amazon.rum.performance_navigation_event"], "event_details": { "duration": [{ "numeric":
      # ["&gt;=",2000,"&lt;"8000] }] } } If Name is NavigationFrustratedTransaction , then ValueKey must be
      # null and the EventPattern must include { "event_type":
      # ["com.amazon.rum.performance_navigation_event"], "event_details": { "duration": [{ "numeric":
      # ["&gt;=",8000] }] } } If Name is WebVitalsCumulativeLayoutShift , then ValueKey must be
      # event_details.value and the EventPattern must include
      # {"event_type":["com.amazon.rum.cumulative_layout_shift_event"]} If Name is WebVitalsFirstInputDelay
      # , then ValueKey must be event_details.value and the EventPattern must include
      # {"event_type":["com.amazon.rum.first_input_delay_event"]} If Name is WebVitalsLargestContentfulPaint
      # , then ValueKey must be event_details.value and the EventPattern must include
      # {"event_type":["com.amazon.rum.largest_contentful_paint_event"]} If Name is JsErrorCount , then
      # ValueKey must be null and the EventPattern must include
      # {"event_type":["com.amazon.rum.js_error_event"]} If Name is HttpErrorCount , then ValueKey must be
      # null and the EventPattern must include {"event_type":["com.amazon.rum.http_event"]} If Name is
      # SessionCount , then ValueKey must be null and the EventPattern must include
      # {"event_type":["com.amazon.rum.session_start_event"]} If Name is PageViewCount , then ValueKey must
      # be null and the EventPattern must include {"event_type":["com.amazon.rum.page_view_event"]} If Name
      # is Http4xxCount , then ValueKey must be null and the EventPattern must include {"event_type":
      # ["com.amazon.rum.http_event"],"event_details":{"response":{"status":[{"numeric":["&gt;=",400,"&lt;",500]}]}}}
      # } If Name is Http5xxCount , then ValueKey must be null and the EventPattern must include
      # {"event_type":
      # ["com.amazon.rum.http_event"],"event_details":{"response":{"status":[{"numeric":["&gt;=",500,"&lt;=",599]}]}}}
      # } For custom metrics, the following validation rules apply: The namespace can't be omitted and can't
      # be AWS/RUM . You can use the AWS/RUM namespace only for extended metrics. All dimensions listed in
      # the DimensionKeys field must be present in the value of EventPattern . The values that you specify
      # for ValueKey , EventPattern , and DimensionKeys must be fields in RUM events, so all first-level
      # keys in these fields must be one of the keys in the list later in this section. If you set a value
      # for EventPattern , it must be a JSON object. For every non-empty event_details , there must be a
      # non-empty event_type . If EventPattern contains an event_details field, it must also contain an
      # event_type . For every built-in event_type that you use, you must use a value for event_details that
      # corresponds to that event_type . For information about event details that correspond to event types,
      # see RUM event details . In EventPattern , any JSON array must contain only one value. Valid key
      # values for first-level keys in the ValueKey , EventPattern , and DimensionKeys fields: account_id
      # application_Id application_version application_name batch_id event_details event_id
      # event_interaction event_timestamp event_type event_version log_stream metadata sessionId
      # user_details userId
      struct MetricDefinitionRequest
        include JSON::Serializable

        # The name for the metric that is defined in this structure. For custom metrics, you can specify any
        # name that you like. For extended metrics, valid values are the following:
        # PerformanceNavigationDuration PerformanceResourceDuration NavigationSatisfiedTransaction
        # NavigationToleratedTransaction NavigationFrustratedTransaction WebVitalsCumulativeLayoutShift
        # WebVitalsFirstInputDelay WebVitalsLargestContentfulPaint JsErrorCount HttpErrorCount SessionCount
        @[JSON::Field(key: "Name")]
        getter name : String

        # Use this field only if you are sending the metric to CloudWatch. This field is a map of field paths
        # to dimension names. It defines the dimensions to associate with this metric in CloudWatch. For
        # extended metrics, valid values for the entries in this field are the following: "metadata.pageId":
        # "PageId" "metadata.browserName": "BrowserName" "metadata.deviceType": "DeviceType"
        # "metadata.osName": "OSName" "metadata.countryCode": "CountryCode" "event_details.fileType":
        # "FileType" For both extended metrics and custom metrics, all dimensions listed in this field must
        # also be included in EventPattern .
        @[JSON::Field(key: "DimensionKeys")]
        getter dimension_keys : Hash(String, String)?

        # The pattern that defines the metric, specified as a JSON object. RUM checks events that happen in a
        # user's session against the pattern, and events that match the pattern are sent to the metric
        # destination. When you define extended metrics, the metric definition is not valid if EventPattern is
        # omitted. Example event patterns: '{ "event_type": ["com.amazon.rum.js_error_event"], "metadata": {
        # "browserName": [ "Chrome", "Safari" ], } }' '{ "event_type":
        # ["com.amazon.rum.performance_navigation_event"], "metadata": { "browserName": [ "Chrome", "Firefox"
        # ] }, "event_details": { "duration": [{ "numeric": [ "&lt;", 2000 ] }] } }' '{ "event_type":
        # ["com.amazon.rum.performance_navigation_event"], "metadata": { "browserName": [ "Chrome", "Safari"
        # ], "countryCode": [ "US" ] }, "event_details": { "duration": [{ "numeric": [ "&gt;=", 2000, "&lt;",
        # 8000 ] }] } }' If the metrics destination is CloudWatch and the event also matches a value in
        # DimensionKeys , then the metric is published with the specified dimensions.
        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # If this structure is for a custom metric instead of an extended metrics, use this parameter to
        # define the metric namespace for that custom metric. Do not specify this parameter if this structure
        # is for an extended metric. You cannot use any string that starts with AWS/ for your namespace.
        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The CloudWatch metric unit to use for this metric. If you omit this field, the metric is recorded
        # with no unit.
        @[JSON::Field(key: "UnitLabel")]
        getter unit_label : String?

        # The field within the event object that the metric value is sourced from. If you omit this field, a
        # hardcoded value of 1 is pushed as the metric value. This is useful if you want to count the number
        # of events that the filter catches. If this metric is sent to CloudWatch Evidently, this field will
        # be passed to Evidently raw. Evidently will handle data extraction from the event.
        @[JSON::Field(key: "ValueKey")]
        getter value_key : String?

        def initialize(
          @name : String,
          @dimension_keys : Hash(String, String)? = nil,
          @event_pattern : String? = nil,
          @namespace : String? = nil,
          @unit_label : String? = nil,
          @value_key : String? = nil
        )
        end
      end

      # A structure that displays information about one destination that CloudWatch RUM sends extended
      # metrics to.
      struct MetricDestinationSummary
        include JSON::Serializable

        # Specifies whether the destination is CloudWatch or Evidently .
        @[JSON::Field(key: "Destination")]
        getter destination : String?

        # If the destination is Evidently , this specifies the ARN of the Evidently experiment that receives
        # the metrics.
        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        # This field appears only when the destination is Evidently . It specifies the ARN of the IAM role
        # that is used to write to the Evidently experiment that receives the metrics.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        def initialize(
          @destination : String? = nil,
          @destination_arn : String? = nil,
          @iam_role_arn : String? = nil
        )
        end
      end

      # The resource-based policy doesn't exist on this app monitor.
      struct PolicyNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The policy document is too large. The limit is 4 KB.
      struct PolicySizeLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The name of the app monitor that you want to apply this resource-based policy to. To find the names
        # of your app monitors, you can use the ListAppMonitors operation.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The JSON to use as the resource policy. The document can be up to 4 KB in size. For more information
        # about the contents and syntax for this policy, see Using resource-based policies with CloudWatch RUM
        # .
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # A string value that you can use to conditionally update your policy. You can provide the revision ID
        # of your existing policy to make mutating requests against that policy. When you assign a policy
        # revision ID, then later requests about that policy will be rejected with an
        # InvalidPolicyRevisionIdException error if they don't provide the correct current revision ID.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @name : String,
          @policy_document : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The JSON policy document that you specified.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The policy revision ID information that you specified.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_document : String? = nil,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutRumEventsRequest
        include JSON::Serializable

        # A structure that contains information about the app monitor that collected this telemetry
        # information.
        @[JSON::Field(key: "AppMonitorDetails")]
        getter app_monitor_details : Types::AppMonitorDetails

        # A unique identifier for this batch of RUM event data.
        @[JSON::Field(key: "BatchId")]
        getter batch_id : String

        # The ID of the app monitor that is sending this data.
        @[JSON::Field(key: "Id")]
        getter id : String

        # An array of structures that contain the telemetry event data.
        @[JSON::Field(key: "RumEvents")]
        getter rum_events : Array(Types::RumEvent)

        # A structure that contains information about the user session that this batch of events was collected
        # from.
        @[JSON::Field(key: "UserDetails")]
        getter user_details : Types::UserDetails

        # If the app monitor uses a resource-based policy that requires PutRumEvents requests to specify a
        # certain alias, specify that alias here. This alias will be compared to the rum:alias context key in
        # the resource-based policy. For more information, see Using resource-based policies with CloudWatch
        # RUM .
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        def initialize(
          @app_monitor_details : Types::AppMonitorDetails,
          @batch_id : String,
          @id : String,
          @rum_events : Array(Types::RumEvent),
          @user_details : Types::UserDetails,
          @alias : String? = nil
        )
        end
      end

      struct PutRumEventsResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct PutRumMetricsDestinationRequest
        include JSON::Serializable

        # The name of the CloudWatch RUM app monitor that will send the metrics.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # Defines the destination to send the metrics to. Valid values are CloudWatch and Evidently . If you
        # specify Evidently , you must also specify the ARN of the CloudWatchEvidently experiment that is to
        # be the destination and an IAM role that has permission to write to the experiment.
        @[JSON::Field(key: "Destination")]
        getter destination : String

        # Use this parameter only if Destination is Evidently . This parameter specifies the ARN of the
        # Evidently experiment that will receive the extended metrics.
        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , don't use
        # this parameter. This parameter specifies the ARN of an IAM role that RUM will assume to write to the
        # Evidently experiment that you are sending metrics to. This role must have permission to write to
        # that experiment. If you specify this parameter, you must be signed on to a role that has PassRole
        # permissions attached to it, to allow the role to be passed. The
        # CloudWatchAmazonCloudWatchRUMFullAccess policy doesn't include PassRole permissions.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @destination_arn : String? = nil,
          @iam_role_arn : String? = nil
        )
        end
      end

      struct PutRumMetricsDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that defines a key and values that you can use to filter the results. The only
      # performance events that are returned are those that have values matching the ones that you specify
      # in one of your QueryFilter structures. For example, you could specify Browser as the Name and
      # specify Chrome,Firefox as the Values to return events generated only from those browsers. Specifying
      # Invert as the Name works as a "not equal to" filter. For example, specify Invert as the Name and
      # specify Chrome as the value to return all events except events from user sessions with the Chrome
      # browser.
      struct QueryFilter
        include JSON::Serializable

        # The name of a key to search for. The filter returns only the events that match the Name and Values
        # that you specify. Valid values for Name are Browser | Device | Country | Page | OS | EventType |
        # Invert
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The values of the Name that are to be be included in the returned results.
        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Resource not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the resource that is associated with the error.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The type of the resource that is associated with the error.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_name : String,
          @resource_type : String? = nil
        )
        end
      end

      # A structure that contains the information for one performance event that RUM collects from a user
      # session with your application.
      struct RumEvent
        include JSON::Serializable

        # A string containing details about the event.
        @[JSON::Field(key: "details")]
        getter details : String

        # A unique ID for this event.
        @[JSON::Field(key: "id")]
        getter id : String

        # The exact time that this event occurred.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The JSON schema that denotes the type of event this is, such as a page load or a new session.
        @[JSON::Field(key: "type")]
        getter type : String

        # Metadata about this event, which contains a JSON serialization of the identity of the user for this
        # session. The user information comes from information such as the HTTP user-agent request header and
        # document interface.
        @[JSON::Field(key: "metadata")]
        getter metadata : String?

        def initialize(
          @details : String,
          @id : String,
          @timestamp : Time,
          @type : String,
          @metadata : String? = nil
        )
        end
      end

      # This request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch RUM resource that you're adding tags to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
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

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the service quota that was exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The value of a parameter in the request caused an error.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The ID of the service that is associated with the error.
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

      # A structure that defines the time range that you want to retrieve results from.
      struct TimeRange
        include JSON::Serializable

        # The beginning of the time range to retrieve performance events from.
        @[JSON::Field(key: "After")]
        getter after : Int64

        # The end of the time range to retrieve performance events from. If you omit this, the time range
        # extends to the time that this operation is performed.
        @[JSON::Field(key: "Before")]
        getter before : Int64?

        def initialize(
          @after : Int64,
          @before : Int64? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch RUM resource that you're removing tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
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

      struct UpdateAppMonitorRequest
        include JSON::Serializable

        # The name of the app monitor to update.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A structure that contains much of the configuration data for the app monitor. If you are using
        # Amazon Cognito for authorization, you must include this structure in your request, and it must
        # include the ID of the Amazon Cognito identity pool to use for authorization. If you don't include
        # AppMonitorConfiguration , you must set up your own authorization method. For more information, see
        # Authorize your application to send data to Amazon Web Services .
        @[JSON::Field(key: "AppMonitorConfiguration")]
        getter app_monitor_configuration : Types::AppMonitorConfiguration?

        # Specifies whether this app monitor allows the web client to define and send custom events. The
        # default is for custom events to be DISABLED . For more information about custom events, see Send
        # custom events .
        @[JSON::Field(key: "CustomEvents")]
        getter custom_events : Types::CustomEvents?

        # Data collected by RUM is kept by RUM for 30 days and then deleted. This parameter specifies whether
        # RUM sends a copy of this telemetry data to Amazon CloudWatch Logs in your account. This enables you
        # to keep the telemetry data for more than 30 days, but it does incur Amazon CloudWatch Logs charges.
        @[JSON::Field(key: "CwLogEnabled")]
        getter cw_log_enabled : Bool?

        # A structure that contains the configuration for how an app monitor can deobfuscate stack traces.
        @[JSON::Field(key: "DeobfuscationConfiguration")]
        getter deobfuscation_configuration : Types::DeobfuscationConfiguration?

        # The top-level internet domain name for which your application has administrative authority.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # List the domain names for which your application has administrative authority. The UpdateAppMonitor
        # allows either the domain or the domain list.
        @[JSON::Field(key: "DomainList")]
        getter domain_list : Array(String)?

        def initialize(
          @name : String,
          @app_monitor_configuration : Types::AppMonitorConfiguration? = nil,
          @custom_events : Types::CustomEvents? = nil,
          @cw_log_enabled : Bool? = nil,
          @deobfuscation_configuration : Types::DeobfuscationConfiguration? = nil,
          @domain : String? = nil,
          @domain_list : Array(String)? = nil
        )
        end
      end

      struct UpdateAppMonitorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRumMetricDefinitionRequest
        include JSON::Serializable

        # The name of the CloudWatch RUM app monitor that sends these metrics.
        @[JSON::Field(key: "AppMonitorName")]
        getter app_monitor_name : String

        # The destination to send the metrics to. Valid values are CloudWatch and Evidently . If you specify
        # Evidently , you must also specify the ARN of the CloudWatchEvidently experiment that will receive
        # the metrics and an IAM role that has permission to write to the experiment.
        @[JSON::Field(key: "Destination")]
        getter destination : String

        # A structure that contains the new definition that you want to use for this metric.
        @[JSON::Field(key: "MetricDefinition")]
        getter metric_definition : Types::MetricDefinitionRequest

        # The ID of the metric definition to update.
        @[JSON::Field(key: "MetricDefinitionId")]
        getter metric_definition_id : String

        # This parameter is required if Destination is Evidently . If Destination is CloudWatch , do not use
        # this parameter. This parameter specifies the ARN of the Evidently experiment that is to receive the
        # metrics. You must have already defined this experiment as a valid destination. For more information,
        # see PutRumMetricsDestination .
        @[JSON::Field(key: "DestinationArn")]
        getter destination_arn : String?

        def initialize(
          @app_monitor_name : String,
          @destination : String,
          @metric_definition : Types::MetricDefinitionRequest,
          @metric_definition_id : String,
          @destination_arn : String? = nil
        )
        end
      end

      struct UpdateRumMetricDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that contains information about the user session that this batch of events was collected
      # from.
      struct UserDetails
        include JSON::Serializable

        # The session ID that the performance events are from.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The ID of the user for this user session. This ID is generated by RUM and does not include any
        # personally identifiable information about the user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @session_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # One of the arguments for the request is not valid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
