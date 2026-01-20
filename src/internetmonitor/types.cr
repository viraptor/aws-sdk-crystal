require "json"
require "time"

module Aws
  module InternetMonitor
    module Types

      # You don't have sufficient permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon CloudWatch Internet Monitor calculates measurements about the availability for your
      # application's internet traffic between client locations and Amazon Web Services. Amazon Web Services
      # has substantial historical data about internet performance and availability between Amazon Web
      # Services services and different network providers and geographies. By applying statistical analysis
      # to the data, Internet Monitor can detect when the performance and availability for your application
      # has dropped, compared to an estimated baseline that's already calculated. To make it easier to see
      # those drops, we report that information to you in the form of health scores: a performance score and
      # an availability score. Availability in Internet Monitor represents the estimated percentage of
      # traffic that is not seeing an availability drop. For example, an availability score of 99% for an
      # end user and service location pair is equivalent to 1% of the traffic experiencing an availability
      # drop for that pair. For more information, see How Internet Monitor calculates performance and
      # availability scores in the Amazon CloudWatch Internet Monitor section of the Amazon CloudWatch User
      # Guide .

      struct AvailabilityMeasurement
        include JSON::Serializable

        # Experience scores, or health scores are calculated for different geographic and network provider
        # combinations (that is, different granularities) and also summed into global scores. If you view
        # performance or availability scores without filtering for any specific geography or service provider,
        # Amazon CloudWatch Internet Monitor provides global health scores. The Amazon CloudWatch Internet
        # Monitor chapter in the CloudWatch User Guide includes detailed information about how Internet
        # Monitor calculates health scores, including performance and availability scores, and when it creates
        # and resolves health events. For more information, see How Amazon Web Services calculates performance
        # and availability scores in the Amazon CloudWatch Internet Monitor section of the CloudWatch User
        # Guide .

        @[JSON::Field(key: "ExperienceScore")]
        getter experience_score : Float64?

        # The percentage of impact caused by a health event for client location traffic globally. For
        # information about how Internet Monitor calculates impact, see Inside Internet Monitor in the Amazon
        # CloudWatch Internet Monitor section of the Amazon CloudWatch User Guide.

        @[JSON::Field(key: "PercentOfClientLocationImpacted")]
        getter percent_of_client_location_impacted : Float64?

        # The impact on total traffic that a health event has, in increased latency or reduced availability.
        # This is the percentage of how much latency has increased or availability has decreased during the
        # event, compared to what is typical for traffic from this client location to the Amazon Web Services
        # location using this client network. For information about how Internet Monitor calculates impact,
        # see How Internet Monitor works in the Amazon CloudWatch Internet Monitor section of the Amazon
        # CloudWatch User Guide.

        @[JSON::Field(key: "PercentOfTotalTrafficImpacted")]
        getter percent_of_total_traffic_impacted : Float64?

        def initialize(
          @experience_score : Float64? = nil,
          @percent_of_client_location_impacted : Float64? = nil,
          @percent_of_total_traffic_impacted : Float64? = nil
        )
        end
      end

      # A bad request was received.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The impacted location, such as a city, that Amazon Web Services clients access application resources
      # from.

      struct ClientLocation
        include JSON::Serializable

        # The name of the internet service provider (ISP) or network (ASN).

        @[JSON::Field(key: "ASName")]
        getter as_name : String

        # The Autonomous System Number (ASN) of the network at an impacted location.

        @[JSON::Field(key: "ASNumber")]
        getter as_number : Int64

        # The name of the city where the internet event is located.

        @[JSON::Field(key: "City")]
        getter city : String

        # The name of the country where the internet event is located.

        @[JSON::Field(key: "Country")]
        getter country : String

        # The latitude where the internet event is located.

        @[JSON::Field(key: "Latitude")]
        getter latitude : Float64

        # The longitude where the internet event is located.

        @[JSON::Field(key: "Longitude")]
        getter longitude : Float64

        # The metro area where the health event is located. Metro indicates a metropolitan region in the
        # United States, such as the region around New York City. In non-US countries, this is a second-level
        # subdivision. For example, in the United Kingdom, it could be a county, a London borough, a unitary
        # authority, council area, and so on.

        @[JSON::Field(key: "Metro")]
        getter metro : String?

        # The subdivision location where the health event is located. The subdivision usually maps to states
        # in most countries (including the United States). For United Kingdom, it maps to a country (England,
        # Scotland, Wales) or province (Northern Ireland).

        @[JSON::Field(key: "Subdivision")]
        getter subdivision : String?

        def initialize(
          @as_name : String,
          @as_number : Int64,
          @city : String,
          @country : String,
          @latitude : Float64,
          @longitude : Float64,
          @metro : String? = nil,
          @subdivision : String? = nil
        )
        end
      end

      # The requested resource is in use.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateMonitorInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent
        # API request. Don't reuse the same client token for other API requests.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Defines the threshold percentages and other configuration information for when Amazon CloudWatch
        # Internet Monitor creates a health event. Internet Monitor creates a health event when an internet
        # issue that affects your application end users has a health score percentage that is at or below a
        # specific threshold, and, sometimes, when other criteria are met. If you don't set a health event
        # threshold, the default value is 95%. For more information, see Change health event thresholds in the
        # Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "HealthEventsConfig")]
        getter health_events_config : Types::HealthEventsConfig?

        # Publish internet measurements for Internet Monitor to an Amazon S3 bucket in addition to CloudWatch
        # Logs.

        @[JSON::Field(key: "InternetMeasurementsLogDelivery")]
        getter internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery?

        # The maximum number of city-networks to monitor for your resources. A city-network is the location
        # (city) where clients access your application resources from and the ASN or network provider, such as
        # an internet service provider (ISP), that clients access the resources through. Setting this limit
        # can help control billing costs. To learn more, see Choosing a city-network maximum value in the
        # Amazon CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "MaxCityNetworksToMonitor")]
        getter max_city_networks_to_monitor : Int32?

        # The resources to include in a monitor, which you provide as a set of Amazon Resource Names (ARNs).
        # Resources can be VPCs, NLBs, Amazon CloudFront distributions, or Amazon WorkSpaces directories. You
        # can add a combination of VPCs and CloudFront distributions, or you can add WorkSpaces directories,
        # or you can add NLBs. You can't add NLBs or WorkSpaces directories together with any other resources.
        # If you add only Amazon VPC resources, at least one VPC must have an Internet Gateway attached to it,
        # to make sure that it has internet connectivity.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        # The tags for a monitor. You can add a maximum of 50 tags in Internet Monitor.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The percentage of the internet-facing traffic for your application that you want to monitor with
        # this monitor. If you set a city-networks maximum, that limit overrides the traffic percentage that
        # you set. To learn more, see Choosing an application traffic percentage to monitor in the Amazon
        # CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "TrafficPercentageToMonitor")]
        getter traffic_percentage_to_monitor : Int32?

        def initialize(
          @monitor_name : String,
          @client_token : String? = nil,
          @health_events_config : Types::HealthEventsConfig? = nil,
          @internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery? = nil,
          @max_city_networks_to_monitor : Int32? = nil,
          @resources : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @traffic_percentage_to_monitor : Int32? = nil
        )
        end
      end


      struct CreateMonitorOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The status of a monitor.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @arn : String,
          @status : String
        )
        end
      end


      struct DeleteMonitorInput
        include JSON::Serializable

        # The name of the monitor to delete.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end


      struct DeleteMonitorOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A filter that you use with the results of a Amazon CloudWatch Internet Monitor query that you
      # created and ran. The query sets up a repository of data that is a subset of your application's
      # Internet Monitor data. FilterParameter is a string that defines how you want to filter the
      # repository of data to return a set of results, based on your criteria. The filter parameters that
      # you can specify depend on the query type that you used to create the repository, since each query
      # type returns a different set of Internet Monitor data. For each filter, you specify a field (such as
      # city ), an operator (such as not_equals , and a value or array of values (such as ["Seattle",
      # "Redmond"] ). Separate values in the array with commas. For more information about specifying filter
      # parameters, see Using the Amazon CloudWatch Internet Monitor query interface in the Amazon
      # CloudWatch Internet Monitor User Guide.

      struct FilterParameter
        include JSON::Serializable

        # A data field that you want to filter, to further scope your application's Internet Monitor data in a
        # repository that you created by running a query. A field might be city , for example. The field must
        # be one of the fields that was returned by the specific query that you used to create the repository.

        @[JSON::Field(key: "Field")]
        getter field : String?

        # The operator to use with the filter field and a value, such as not_equals .

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # One or more values to be used, together with the specified operator, to filter data for a query. For
        # example, you could specify an array of values such as ["Seattle", "Redmond"] . Values in the array
        # are separated by commas.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @field : String? = nil,
          @operator : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetHealthEventInput
        include JSON::Serializable

        # The internally-generated identifier of a health event. Because EventID contains the forward slash
        # (“/”) character, you must URL-encode the EventID field in the request URL.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The account ID for an account that you've set up cross-account sharing for in Amazon CloudWatch
        # Internet Monitor. You configure cross-account sharing by using Amazon CloudWatch Observability
        # Access Manager. For more information, see Internet Monitor cross-account observability in the Amazon
        # CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "LinkedAccountId")]
        getter linked_account_id : String?

        def initialize(
          @event_id : String,
          @monitor_name : String,
          @linked_account_id : String? = nil
        )
        end
      end


      struct GetHealthEventOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event.

        @[JSON::Field(key: "EventArn")]
        getter event_arn : String

        # The internally-generated identifier of a health event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The type of impairment of a specific health event.

        @[JSON::Field(key: "ImpactType")]
        getter impact_type : String

        # The locations affected by a health event.

        @[JSON::Field(key: "ImpactedLocations")]
        getter impacted_locations : Array(Types::ImpactedLocation)

        # The time when a health event was last updated or recalculated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # The time when a health event started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time

        # The status of a health event.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The time when a health event was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The time when a health event was resolved. If the health event is still active, the end time is not
        # set.

        @[JSON::Field(key: "EndedAt")]
        getter ended_at : Time?

        # The threshold percentage for a health score that determines, along with other configuration
        # information, when Internet Monitor creates a health event when there's an internet issue that
        # affects your application end users.

        @[JSON::Field(key: "HealthScoreThreshold")]
        getter health_score_threshold : Float64?

        # The impact on total traffic that a health event has, in increased latency or reduced availability.
        # This is the percentage of how much latency has increased or availability has decreased during the
        # event, compared to what is typical for traffic from this client location to the Amazon Web Services
        # location using this client network.

        @[JSON::Field(key: "PercentOfTotalTrafficImpacted")]
        getter percent_of_total_traffic_impacted : Float64?

        def initialize(
          @event_arn : String,
          @event_id : String,
          @impact_type : String,
          @impacted_locations : Array(Types::ImpactedLocation),
          @last_updated_at : Time,
          @started_at : Time,
          @status : String,
          @created_at : Time? = nil,
          @ended_at : Time? = nil,
          @health_score_threshold : Float64? = nil,
          @percent_of_total_traffic_impacted : Float64? = nil
        )
        end
      end


      struct GetInternetEventInput
        include JSON::Serializable

        # The EventId of the internet event to return information for.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        def initialize(
          @event_id : String
        )
        end
      end


      struct GetInternetEventOutput
        include JSON::Serializable

        # The impacted location, such as a city, where clients access Amazon Web Services application
        # resources.

        @[JSON::Field(key: "ClientLocation")]
        getter client_location : Types::ClientLocation

        # The Amazon Resource Name (ARN) of the internet event.

        @[JSON::Field(key: "EventArn")]
        getter event_arn : String

        # The internally-generated identifier of an internet event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The status of the internet event.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String

        # The type of network impairment.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The time when the internet event started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time

        # The time when the internet event ended. If the event hasn't ended yet, this value is empty.

        @[JSON::Field(key: "EndedAt")]
        getter ended_at : Time?

        def initialize(
          @client_location : Types::ClientLocation,
          @event_arn : String,
          @event_id : String,
          @event_status : String,
          @event_type : String,
          @started_at : Time,
          @ended_at : Time? = nil
        )
        end
      end


      struct GetMonitorInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The account ID for an account that you've set up cross-account sharing for in Amazon CloudWatch
        # Internet Monitor. You configure cross-account sharing by using Amazon CloudWatch Observability
        # Access Manager. For more information, see Internet Monitor cross-account observability in the Amazon
        # CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "LinkedAccountId")]
        getter linked_account_id : String?

        def initialize(
          @monitor_name : String,
          @linked_account_id : String? = nil
        )
        end
      end


      struct GetMonitorOutput
        include JSON::Serializable

        # The time when the monitor was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The last time that the monitor was modified.

        @[JSON::Field(key: "ModifiedAt")]
        getter modified_at : Time

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The resources monitored by the monitor. Resources are listed by their Amazon Resource Names (ARNs).

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)

        # The status of the monitor.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The list of health event threshold configurations. The threshold percentage for a health score
        # determines, along with other configuration information, when Internet Monitor creates a health event
        # when there's an internet issue that affects your application end users. For more information, see
        # Change health event thresholds in the Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "HealthEventsConfig")]
        getter health_events_config : Types::HealthEventsConfig?

        # Publish internet measurements for Internet Monitor to another location, such as an Amazon S3 bucket.
        # The measurements are also published to Amazon CloudWatch Logs.

        @[JSON::Field(key: "InternetMeasurementsLogDelivery")]
        getter internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery?

        # The maximum number of city-networks to monitor for your resources. A city-network is the location
        # (city) where clients access your application resources from and the ASN or network provider, such as
        # an internet service provider (ISP), that clients access the resources through. This limit can help
        # control billing costs. To learn more, see Choosing a city-network maximum value in the Amazon
        # CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "MaxCityNetworksToMonitor")]
        getter max_city_networks_to_monitor : Int32?

        # The health of the data processing for the monitor.

        @[JSON::Field(key: "ProcessingStatus")]
        getter processing_status : String?

        # Additional information about the health of the data processing for the monitor.

        @[JSON::Field(key: "ProcessingStatusInfo")]
        getter processing_status_info : String?

        # The tags that have been added to monitor.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The percentage of the internet-facing traffic for your application to monitor with this monitor. If
        # you set a city-networks maximum, that limit overrides the traffic percentage that you set. To learn
        # more, see Choosing an application traffic percentage to monitor in the Amazon CloudWatch Internet
        # Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "TrafficPercentageToMonitor")]
        getter traffic_percentage_to_monitor : Int32?

        def initialize(
          @created_at : Time,
          @modified_at : Time,
          @monitor_arn : String,
          @monitor_name : String,
          @resources : Array(String),
          @status : String,
          @health_events_config : Types::HealthEventsConfig? = nil,
          @internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery? = nil,
          @max_city_networks_to_monitor : Int32? = nil,
          @processing_status : String? = nil,
          @processing_status_info : String? = nil,
          @tags : Hash(String, String)? = nil,
          @traffic_percentage_to_monitor : Int32? = nil
        )
        end
      end


      struct GetQueryResultsInput
        include JSON::Serializable

        # The name of the monitor to return data for.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The ID of the query that you want to return data results for. A QueryId is an internally-generated
        # identifier for a specific query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @monitor_name : String,
          @query_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryResultsOutput
        include JSON::Serializable

        # The data results that the query returns. Data is returned in arrays, aligned with the Fields for the
        # query, which creates a repository of Amazon CloudWatch Internet Monitor information for your
        # application. Then, you can filter the information in the repository by using FilterParameters that
        # you define.

        @[JSON::Field(key: "Data")]
        getter data : Array(Array(String))

        # The fields that the query returns data for. Fields are name-data type pairs, such as
        # availability_score - float .

        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::QueryField)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @data : Array(Array(String)),
          @fields : Array(Types::QueryField),
          @next_token : String? = nil
        )
        end
      end


      struct GetQueryStatusInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The ID of the query that you want to return the status for. A QueryId is an internally-generated
        # dentifier for a specific query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @monitor_name : String,
          @query_id : String
        )
        end
      end


      struct GetQueryStatusOutput
        include JSON::Serializable

        # The current status for a query.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Information about a health event created in a monitor in Amazon CloudWatch Internet Monitor.

      struct HealthEvent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the event.

        @[JSON::Field(key: "EventArn")]
        getter event_arn : String

        # The internally-generated identifier of a specific network traffic impairment health event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The type of impairment for a health event.

        @[JSON::Field(key: "ImpactType")]
        getter impact_type : String

        # The locations impacted by the health event.

        @[JSON::Field(key: "ImpactedLocations")]
        getter impacted_locations : Array(Types::ImpactedLocation)

        # When the health event was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time

        # When a health event started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time

        # The status of a health event.

        @[JSON::Field(key: "Status")]
        getter status : String

        # When the health event was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The time when a health event ended. If the health event is still active, then the end time is not
        # set.

        @[JSON::Field(key: "EndedAt")]
        getter ended_at : Time?

        # The value of the threshold percentage for performance or availability that was configured when
        # Amazon CloudWatch Internet Monitor created the health event.

        @[JSON::Field(key: "HealthScoreThreshold")]
        getter health_score_threshold : Float64?

        # The impact on total traffic that a health event has, in increased latency or reduced availability.
        # This is the percentage of how much latency has increased or availability has decreased during the
        # event, compared to what is typical for traffic from this client location to the Amazon Web Services
        # location using this client network.

        @[JSON::Field(key: "PercentOfTotalTrafficImpacted")]
        getter percent_of_total_traffic_impacted : Float64?

        def initialize(
          @event_arn : String,
          @event_id : String,
          @impact_type : String,
          @impacted_locations : Array(Types::ImpactedLocation),
          @last_updated_at : Time,
          @started_at : Time,
          @status : String,
          @created_at : Time? = nil,
          @ended_at : Time? = nil,
          @health_score_threshold : Float64? = nil,
          @percent_of_total_traffic_impacted : Float64? = nil
        )
        end
      end

      # A complex type with the configuration information that determines the threshold and other conditions
      # for when Internet Monitor creates a health event for an overall performance or availability issue,
      # across an application's geographies. Defines the percentages, for overall performance scores and
      # availability scores for an application, that are the thresholds for when Amazon CloudWatch Internet
      # Monitor creates a health event. You can override the defaults to set a custom threshold for overall
      # performance or availability scores, or both. You can also set thresholds for local health scores,,
      # where Internet Monitor creates a health event when scores cross a threshold for one or more
      # city-networks, in addition to creating an event when an overall score crosses a threshold. If you
      # don't set a health event threshold, the default value is 95%. For local thresholds, you also set a
      # minimum percentage of overall traffic that is impacted by an issue before Internet Monitor creates
      # an event. In addition, you can disable local thresholds, for performance scores, availability
      # scores, or both. For more information, see Change health event thresholds in the Internet Monitor
      # section of the CloudWatch User Guide .

      struct HealthEventsConfig
        include JSON::Serializable

        # The configuration that determines the threshold and other conditions for when Internet Monitor
        # creates a health event for a local availability issue.

        @[JSON::Field(key: "AvailabilityLocalHealthEventsConfig")]
        getter availability_local_health_events_config : Types::LocalHealthEventsConfig?

        # The health event threshold percentage set for availability scores.

        @[JSON::Field(key: "AvailabilityScoreThreshold")]
        getter availability_score_threshold : Float64?

        # The configuration that determines the threshold and other conditions for when Internet Monitor
        # creates a health event for a local performance issue.

        @[JSON::Field(key: "PerformanceLocalHealthEventsConfig")]
        getter performance_local_health_events_config : Types::LocalHealthEventsConfig?

        # The health event threshold percentage set for performance scores.

        @[JSON::Field(key: "PerformanceScoreThreshold")]
        getter performance_score_threshold : Float64?

        def initialize(
          @availability_local_health_events_config : Types::LocalHealthEventsConfig? = nil,
          @availability_score_threshold : Float64? = nil,
          @performance_local_health_events_config : Types::LocalHealthEventsConfig? = nil,
          @performance_score_threshold : Float64? = nil
        )
        end
      end

      # Information about a location impacted by a health event in Amazon CloudWatch Internet Monitor.
      # Geographic regions are hierarchically categorized into country, subdivision, metro and city
      # geographic granularities. The geographic region is identified based on the IP address used at the
      # client locations.

      struct ImpactedLocation
        include JSON::Serializable

        # The name of the internet service provider (ISP) or network (ASN).

        @[JSON::Field(key: "ASName")]
        getter as_name : String

        # The Autonomous System Number (ASN) of the network at an impacted location.

        @[JSON::Field(key: "ASNumber")]
        getter as_number : Int64

        # The name of the country where the health event is located.

        @[JSON::Field(key: "Country")]
        getter country : String

        # The status of the health event at an impacted location.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The cause of the impairment. There are two types of network impairments: Amazon Web Services network
        # issues or internet issues. Internet issues are typically a problem with a network provider, like an
        # internet service provider (ISP).

        @[JSON::Field(key: "CausedBy")]
        getter caused_by : Types::NetworkImpairment?

        # The name of the city where the health event is located.

        @[JSON::Field(key: "City")]
        getter city : String?

        # The country code where the health event is located. The ISO 3166-2 codes for the country is
        # provided, when available.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # The calculated health at a specific location.

        @[JSON::Field(key: "InternetHealth")]
        getter internet_health : Types::InternetHealth?

        # The IPv4 prefixes at the client location that was impacted by the health event.

        @[JSON::Field(key: "Ipv4Prefixes")]
        getter ipv4_prefixes : Array(String)?

        # The latitude where the health event is located.

        @[JSON::Field(key: "Latitude")]
        getter latitude : Float64?

        # The longitude where the health event is located.

        @[JSON::Field(key: "Longitude")]
        getter longitude : Float64?

        # The metro area where the health event is located. Metro indicates a metropolitan region in the
        # United States, such as the region around New York City. In non-US countries, this is a second-level
        # subdivision. For example, in the United Kingdom, it could be a county, a London borough, a unitary
        # authority, council area, and so on.

        @[JSON::Field(key: "Metro")]
        getter metro : String?

        # The service location where the health event is located.

        @[JSON::Field(key: "ServiceLocation")]
        getter service_location : String?

        # The subdivision location where the health event is located. The subdivision usually maps to states
        # in most countries (including the United States). For United Kingdom, it maps to a country (England,
        # Scotland, Wales) or province (Northern Ireland).

        @[JSON::Field(key: "Subdivision")]
        getter subdivision : String?

        # The subdivision code where the health event is located. The ISO 3166-2 codes for country
        # subdivisions is provided, when available.

        @[JSON::Field(key: "SubdivisionCode")]
        getter subdivision_code : String?

        def initialize(
          @as_name : String,
          @as_number : Int64,
          @country : String,
          @status : String,
          @caused_by : Types::NetworkImpairment? = nil,
          @city : String? = nil,
          @country_code : String? = nil,
          @internet_health : Types::InternetHealth? = nil,
          @ipv4_prefixes : Array(String)? = nil,
          @latitude : Float64? = nil,
          @longitude : Float64? = nil,
          @metro : String? = nil,
          @service_location : String? = nil,
          @subdivision : String? = nil,
          @subdivision_code : String? = nil
        )
        end
      end

      # There was an internal server error.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An internal error occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A summary of information about an internet event in Amazon CloudWatch Internet Monitor. Internet
      # events are issues that cause performance degradation or availability problems for impacted Amazon
      # Web Services client locations. Internet Monitor displays information about recent global health
      # events, called internet events, on a global outages map that is available to all Amazon Web Services
      # customers.

      struct InternetEventSummary
        include JSON::Serializable

        # The impacted location, such as a city, that Amazon Web Services clients access application resources
        # from.

        @[JSON::Field(key: "ClientLocation")]
        getter client_location : Types::ClientLocation

        # The Amazon Resource Name (ARN) of the internet event.

        @[JSON::Field(key: "EventArn")]
        getter event_arn : String

        # The internally-generated identifier of an internet event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String

        # The status of an internet event.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String

        # The type of network impairment.

        @[JSON::Field(key: "EventType")]
        getter event_type : String

        # The time when an internet event started.

        @[JSON::Field(key: "StartedAt")]
        getter started_at : Time

        # The time when an internet event ended. If the event hasn't ended yet, this value is empty.

        @[JSON::Field(key: "EndedAt")]
        getter ended_at : Time?

        def initialize(
          @client_location : Types::ClientLocation,
          @event_arn : String,
          @event_id : String,
          @event_status : String,
          @event_type : String,
          @started_at : Time,
          @ended_at : Time? = nil
        )
        end
      end

      # Internet health includes measurements calculated by Amazon CloudWatch Internet Monitor about the
      # performance and availability for your application on the internet. Amazon Web Services has
      # substantial historical data about internet performance and availability between Amazon Web Services
      # services and different network providers and geographies. By applying statistical analysis to the
      # data, Internet Monitor can detect when the performance and availability for your application has
      # dropped, compared to an estimated baseline that's already calculated. To make it easier to see those
      # drops, Internet Monitor reports the information to you in the form of health scores: a performance
      # score and an availability score.

      struct InternetHealth
        include JSON::Serializable

        # Availability in Internet Monitor represents the estimated percentage of traffic that is not seeing
        # an availability drop. For example, an availability score of 99% for an end user and service location
        # pair is equivalent to 1% of the traffic experiencing an availability drop for that pair. For more
        # information, see How Internet Monitor calculates performance and availability scores in the Amazon
        # CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "Availability")]
        getter availability : Types::AvailabilityMeasurement?

        # Performance in Internet Monitor represents the estimated percentage of traffic that is not seeing a
        # performance drop. For example, a performance score of 99% for an end user and service location pair
        # is equivalent to 1% of the traffic experiencing a performance drop for that pair. For more
        # information, see How Internet Monitor calculates performance and availability scores in the Amazon
        # CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "Performance")]
        getter performance : Types::PerformanceMeasurement?

        def initialize(
          @availability : Types::AvailabilityMeasurement? = nil,
          @performance : Types::PerformanceMeasurement? = nil
        )
        end
      end

      # Publish internet measurements to an Amazon S3 bucket in addition to CloudWatch Logs.

      struct InternetMeasurementsLogDelivery
        include JSON::Serializable

        # The configuration information for publishing Internet Monitor internet measurements to Amazon S3.
        # The configuration includes the bucket name and (optionally) prefix for the S3 bucket to store the
        # measurements, and the delivery status. The delivery status is ENABLED or DISABLED , depending on
        # whether you choose to deliver internet measurements to S3 logs.

        @[JSON::Field(key: "S3Config")]
        getter s3_config : Types::S3Config?

        def initialize(
          @s3_config : Types::S3Config? = nil
        )
        end
      end

      # The request exceeded a service quota.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListHealthEventsInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The time when a health event ended. If the health event is still ongoing, then the end time is not
        # set.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The status of a health event.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String?

        # The account ID for an account that you've set up cross-account sharing for in Amazon CloudWatch
        # Internet Monitor. You configure cross-account sharing by using Amazon CloudWatch Observability
        # Access Manager. For more information, see Internet Monitor cross-account observability in the Amazon
        # CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "LinkedAccountId")]
        getter linked_account_id : String?

        # The number of health event objects that you want to return with this call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The time when a health event started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @monitor_name : String,
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @linked_account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListHealthEventsOutput
        include JSON::Serializable

        # A list of health events.

        @[JSON::Field(key: "HealthEvents")]
        getter health_events : Array(Types::HealthEvent)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @health_events : Array(Types::HealthEvent),
          @next_token : String? = nil
        )
        end
      end


      struct ListInternetEventsInput
        include JSON::Serializable

        # The end time of the time window that you want to get a list of internet events for.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # The status of an internet event.

        @[JSON::Field(key: "EventStatus")]
        getter event_status : String?

        # The type of network impairment.

        @[JSON::Field(key: "EventType")]
        getter event_type : String?

        # The number of query results that you want to return with this call.

        @[JSON::Field(key: "InternetEventMaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The start time of the time window that you want to get a list of internet events for.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @event_status : String? = nil,
          @event_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListInternetEventsOutput
        include JSON::Serializable

        # A set of internet events returned for the list operation.

        @[JSON::Field(key: "InternetEvents")]
        getter internet_events : Array(Types::InternetEventSummary)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @internet_events : Array(Types::InternetEventSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMonitorsInput
        include JSON::Serializable

        # A boolean option that you can set to TRUE to include monitors for linked accounts in a list of
        # monitors, when you've set up cross-account sharing in Amazon CloudWatch Internet Monitor. You
        # configure cross-account sharing by using Amazon CloudWatch Observability Access Manager. For more
        # information, see Internet Monitor cross-account observability in the Amazon CloudWatch Internet
        # Monitor User Guide.

        @[JSON::Field(key: "IncludeLinkedAccounts")]
        getter include_linked_accounts : Bool?

        # The number of monitor objects that you want to return with this call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The status of a monitor. This includes the status of the data processing for the monitor and the
        # status of the monitor itself. For information about the statuses for a monitor, see Monitor .

        @[JSON::Field(key: "MonitorStatus")]
        getter monitor_status : String?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @include_linked_accounts : Bool? = nil,
          @max_results : Int32? = nil,
          @monitor_status : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMonitorsOutput
        include JSON::Serializable

        # A list of monitors.

        @[JSON::Field(key: "Monitors")]
        getter monitors : Array(Types::Monitor)

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @monitors : Array(Types::Monitor),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # Tags for a resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A complex type with the configuration information that determines the threshold and other conditions
      # for when Internet Monitor creates a health event for a local performance or availability issue, when
      # scores cross a threshold for one or more city-networks. Defines the percentages, for performance
      # scores or availability scores, that are the local thresholds for when Amazon CloudWatch Internet
      # Monitor creates a health event. Also defines whether a local threshold is enabled or disabled, and
      # the minimum percentage of overall traffic that must be impacted by an issue before Internet Monitor
      # creates an event when a threshold is crossed for a local health score. If you don't set a local
      # health event threshold, the default value is 60%. For more information, see Change health event
      # thresholds in the Internet Monitor section of the CloudWatch User Guide .

      struct LocalHealthEventsConfig
        include JSON::Serializable

        # The health event threshold percentage set for a local health score.

        @[JSON::Field(key: "HealthScoreThreshold")]
        getter health_score_threshold : Float64?

        # The minimum percentage of overall traffic for an application that must be impacted by an issue
        # before Internet Monitor creates an event when a threshold is crossed for a local health score. If
        # you don't set a minimum traffic impact threshold, the default value is 0.1%.

        @[JSON::Field(key: "MinTrafficImpact")]
        getter min_traffic_impact : Float64?

        # The status of whether Internet Monitor creates a health event based on a threshold percentage set
        # for a local health score. The status can be ENABLED or DISABLED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @health_score_threshold : Float64? = nil,
          @min_traffic_impact : Float64? = nil,
          @status : String? = nil
        )
        end
      end

      # The description of and information about a monitor in Amazon CloudWatch Internet Monitor.

      struct Monitor
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The status of a monitor.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The health of data processing for the monitor.

        @[JSON::Field(key: "ProcessingStatus")]
        getter processing_status : String?

        def initialize(
          @monitor_arn : String,
          @monitor_name : String,
          @status : String,
          @processing_status : String? = nil
        )
        end
      end

      # An internet service provider (ISP) or network (ASN) in Amazon CloudWatch Internet Monitor.

      struct Network
        include JSON::Serializable

        # The name of the internet service provider (ISP) or network (ASN).

        @[JSON::Field(key: "ASName")]
        getter as_name : String

        # The Autonomous System Number (ASN) of the internet provider or network.

        @[JSON::Field(key: "ASNumber")]
        getter as_number : Int64

        def initialize(
          @as_name : String,
          @as_number : Int64
        )
        end
      end

      # Information about the network impairment for a specific network measured by Amazon CloudWatch
      # Internet Monitor.

      struct NetworkImpairment
        include JSON::Serializable

        # The combination of the Autonomous System Number (ASN) of the network and the name of the network.

        @[JSON::Field(key: "AsPath")]
        getter as_path : Array(Types::Network)

        # The type of network impairment.

        @[JSON::Field(key: "NetworkEventType")]
        getter network_event_type : String

        # The networks that could be impacted by a network impairment event.

        @[JSON::Field(key: "Networks")]
        getter networks : Array(Types::Network)

        def initialize(
          @as_path : Array(Types::Network),
          @network_event_type : String,
          @networks : Array(Types::Network)
        )
        end
      end

      # The request specifies something that doesn't exist.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon CloudWatch Internet Monitor calculates measurements about the performance for your
      # application's internet traffic between client locations and Amazon Web Services. Amazon Web Services
      # has substantial historical data about internet performance and availability between Amazon Web
      # Services services and different network providers and geographies. By applying statistical analysis
      # to the data, Internet Monitor can detect when the performance and availability for your application
      # has dropped, compared to an estimated baseline that's already calculated. To make it easier to see
      # those drops, we report that information to you in the form of health scores: a performance score and
      # an availability score. Performance in Internet Monitor represents the estimated percentage of
      # traffic that is not seeing a performance drop. For example, a performance score of 99% for an end
      # user and service location pair is equivalent to 1% of the traffic experiencing a performance drop
      # for that pair. For more information, see How Internet Monitor calculates performance and
      # availability scores in the Amazon CloudWatch Internet Monitor section of the CloudWatch User Guide .

      struct PerformanceMeasurement
        include JSON::Serializable

        # Experience scores, or health scores, are calculated for different geographic and network provider
        # combinations (that is, different granularities) and also totaled into global scores. If you view
        # performance or availability scores without filtering for any specific geography or service provider,
        # Amazon CloudWatch Internet Monitor provides global health scores. The Amazon CloudWatch Internet
        # Monitor chapter in the CloudWatch User Guide includes detailed information about how Internet
        # Monitor calculates health scores, including performance and availability scores, and when it creates
        # and resolves health events. For more information, see How Amazon Web Services calculates performance
        # and availability scores in the Amazon CloudWatch Internet Monitor section of the CloudWatch User
        # Guide .

        @[JSON::Field(key: "ExperienceScore")]
        getter experience_score : Float64?

        # How much performance impact was caused by a health event at a client location. For performance, this
        # is the percentage of how much latency increased during the event compared to typical performance for
        # traffic, from this client location to an Amazon Web Services location, using a specific client
        # network. For more information, see When Amazon Web Services creates and resolves health events in
        # the Amazon CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "PercentOfClientLocationImpacted")]
        getter percent_of_client_location_impacted : Float64?

        # The impact on total traffic that a health event has, in increased latency or reduced availability.
        # This is the percentage of how much latency has increased or availability has decreased during the
        # event, compared to what is typical for traffic from this client location to the Amazon Web Services
        # location using this client network. For more information, see When Amazon Web Services creates and
        # resolves health events in the Amazon CloudWatch Internet Monitor section of the CloudWatch User
        # Guide .

        @[JSON::Field(key: "PercentOfTotalTrafficImpacted")]
        getter percent_of_total_traffic_impacted : Float64?

        # This is the percentage of how much round-trip time increased during the event compared to typical
        # round-trip time for your application for traffic. For more information, see When Amazon Web Services
        # creates and resolves health events in the Amazon CloudWatch Internet Monitor section of the
        # CloudWatch User Guide .

        @[JSON::Field(key: "RoundTripTime")]
        getter round_trip_time : Types::RoundTripTime?

        def initialize(
          @experience_score : Float64? = nil,
          @percent_of_client_location_impacted : Float64? = nil,
          @percent_of_total_traffic_impacted : Float64? = nil,
          @round_trip_time : Types::RoundTripTime? = nil
        )
        end
      end

      # Defines a field to query for your application's Amazon CloudWatch Internet Monitor data. You create
      # a data repository by running a query of a specific type. Each QueryType includes a specific set of
      # fields and datatypes to retrieve data for.

      struct QueryField
        include JSON::Serializable

        # The name of a field to query your application's Amazon CloudWatch Internet Monitor data for, such as
        # availability_score .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The data type for a query field, which must correspond to the field you're defining for QueryField .
        # For example, if the query field name is availability_score , the data type is float .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The request specifies a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Round-trip time (RTT) is how long it takes for a request from the user to return a response to the
      # user. Amazon CloudWatch Internet Monitor calculates RTT at different percentiles: p50, p90, and p95.

      struct RoundTripTime
        include JSON::Serializable

        # RTT at the 50th percentile (p50).

        @[JSON::Field(key: "P50")]
        getter p50 : Float64?

        # RTT at the 90th percentile (p90).

        @[JSON::Field(key: "P90")]
        getter p90 : Float64?

        # RTT at the 95th percentile (p95).

        @[JSON::Field(key: "P95")]
        getter p95 : Float64?

        def initialize(
          @p50 : Float64? = nil,
          @p90 : Float64? = nil,
          @p95 : Float64? = nil
        )
        end
      end

      # The configuration for publishing Amazon CloudWatch Internet Monitor internet measurements to Amazon
      # S3. The configuration includes the bucket name and (optionally) prefix for the S3 bucket to store
      # the measurements, and the delivery status. The delivery status is ENABLED or DISABLED , depending on
      # whether you choose to deliver internet measurements to S3 logs.

      struct S3Config
        include JSON::Serializable

        # The Amazon S3 bucket name.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The Amazon S3 bucket prefix.

        @[JSON::Field(key: "BucketPrefix")]
        getter bucket_prefix : String?

        # The status of publishing Internet Monitor internet measurements to an Amazon S3 bucket.

        @[JSON::Field(key: "LogDeliveryStatus")]
        getter log_delivery_status : String?

        def initialize(
          @bucket_name : String? = nil,
          @bucket_prefix : String? = nil,
          @log_delivery_status : String? = nil
        )
        end
      end


      struct StartQueryInput
        include JSON::Serializable

        # The timestamp that is the end of the period that you want to retrieve data for with your query.

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The name of the monitor to query.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The type of query to run. The following are the three types of queries that you can run using the
        # Internet Monitor query interface: MEASUREMENTS : Provides availability score, performance score,
        # total traffic, and round-trip times, at 5 minute intervals. TOP_LOCATIONS : Provides availability
        # score, performance score, total traffic, and time to first byte (TTFB) information, for the top
        # location and ASN combinations that you're monitoring, by traffic volume. TOP_LOCATION_DETAILS :
        # Provides TTFB for Amazon CloudFront, your current configuration, and the best performing EC2
        # configuration, at 1 hour intervals. OVERALL_TRAFFIC_SUGGESTIONS : Provides TTFB, using a 30-day
        # weighted average, for all traffic in each Amazon Web Services location that is monitored.
        # OVERALL_TRAFFIC_SUGGESTIONS_DETAILS : Provides TTFB, using a 30-day weighted average, for each top
        # location, for a proposed Amazon Web Services location. Must provide an Amazon Web Services location
        # to search. ROUTING_SUGGESTIONS : Provides the predicted average round-trip time (RTT) from an IP
        # prefix toward an Amazon Web Services location for a DNS resolver. The RTT is calculated at one hour
        # intervals, over a one hour period. For lists of the fields returned with each query type and more
        # information about how each type of query is performed, see Using the Amazon CloudWatch Internet
        # Monitor query interface in the Amazon CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "QueryType")]
        getter query_type : String

        # The timestamp that is the beginning of the period that you want to retrieve data for with your
        # query.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        # The FilterParameters field that you use with Amazon CloudWatch Internet Monitor queries is a string
        # the defines how you want a query to be filtered. The filter parameters that you can specify depend
        # on the query type, since each query type returns a different set of Internet Monitor data. For more
        # information about specifying filter parameters, see Using the Amazon CloudWatch Internet Monitor
        # query interface in the Amazon CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "FilterParameters")]
        getter filter_parameters : Array(Types::FilterParameter)?

        # The account ID for an account that you've set up cross-account sharing for in Amazon CloudWatch
        # Internet Monitor. You configure cross-account sharing by using Amazon CloudWatch Observability
        # Access Manager. For more information, see Internet Monitor cross-account observability in the Amazon
        # CloudWatch Internet Monitor User Guide.

        @[JSON::Field(key: "LinkedAccountId")]
        getter linked_account_id : String?

        def initialize(
          @end_time : Time,
          @monitor_name : String,
          @query_type : String,
          @start_time : Time,
          @filter_parameters : Array(Types::FilterParameter)? = nil,
          @linked_account_id : String? = nil
        )
        end
      end


      struct StartQueryOutput
        include JSON::Serializable

        # The internally-generated identifier of a specific query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @query_id : String
        )
        end
      end


      struct StopQueryInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # The ID of the query that you want to stop. A QueryId is an internally-generated identifier for a
        # specific query.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        def initialize(
          @monitor_name : String,
          @query_id : String
        )
        end
      end


      struct StopQueryOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a tag that you add to a resource. Tags are supported only for
        # monitors in Amazon CloudWatch Internet Monitor.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tags that you add to a resource. You can add a maximum of 50 tags in Internet Monitor.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
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

      # There were too many requests.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for a tag you remove a resource from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tag keys that you remove from a resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMonitorInput
        include JSON::Serializable

        # The name of the monitor.

        @[JSON::Field(key: "MonitorName")]
        getter monitor_name : String

        # A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent
        # API request. You should not reuse the same client token for other API requests.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The list of health score thresholds. A threshold percentage for health scores, along with other
        # configuration information, determines when Internet Monitor creates a health event when there's an
        # internet issue that affects your application end users. For more information, see Change health
        # event thresholds in the Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "HealthEventsConfig")]
        getter health_events_config : Types::HealthEventsConfig?

        # Publish internet measurements for Internet Monitor to another location, such as an Amazon S3 bucket.
        # The measurements are also published to Amazon CloudWatch Logs.

        @[JSON::Field(key: "InternetMeasurementsLogDelivery")]
        getter internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery?

        # The maximum number of city-networks to monitor for your application. A city-network is the location
        # (city) where clients access your application resources from and the ASN or network provider, such as
        # an internet service provider (ISP), that clients access the resources through. Setting this limit
        # can help control billing costs.

        @[JSON::Field(key: "MaxCityNetworksToMonitor")]
        getter max_city_networks_to_monitor : Int32?

        # The resources to include in a monitor, which you provide as a set of Amazon Resource Names (ARNs).
        # Resources can be VPCs, NLBs, Amazon CloudFront distributions, or Amazon WorkSpaces directories. You
        # can add a combination of VPCs and CloudFront distributions, or you can add WorkSpaces directories,
        # or you can add NLBs. You can't add NLBs or WorkSpaces directories together with any other resources.
        # If you add only Amazon Virtual Private Clouds resources, at least one VPC must have an Internet
        # Gateway attached to it, to make sure that it has internet connectivity.

        @[JSON::Field(key: "ResourcesToAdd")]
        getter resources_to_add : Array(String)?

        # The resources to remove from a monitor, which you provide as a set of Amazon Resource Names (ARNs).

        @[JSON::Field(key: "ResourcesToRemove")]
        getter resources_to_remove : Array(String)?

        # The status for a monitor. The accepted values for Status with the UpdateMonitor API call are the
        # following: ACTIVE and INACTIVE . The following values are not accepted: PENDING , and ERROR .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The percentage of the internet-facing traffic for your application that you want to monitor with
        # this monitor. If you set a city-networks maximum, that limit overrides the traffic percentage that
        # you set. To learn more, see Choosing an application traffic percentage to monitor in the Amazon
        # CloudWatch Internet Monitor section of the CloudWatch User Guide .

        @[JSON::Field(key: "TrafficPercentageToMonitor")]
        getter traffic_percentage_to_monitor : Int32?

        def initialize(
          @monitor_name : String,
          @client_token : String? = nil,
          @health_events_config : Types::HealthEventsConfig? = nil,
          @internet_measurements_log_delivery : Types::InternetMeasurementsLogDelivery? = nil,
          @max_city_networks_to_monitor : Int32? = nil,
          @resources_to_add : Array(String)? = nil,
          @resources_to_remove : Array(String)? = nil,
          @status : String? = nil,
          @traffic_percentage_to_monitor : Int32? = nil
        )
        end
      end


      struct UpdateMonitorOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the monitor.

        @[JSON::Field(key: "MonitorArn")]
        getter monitor_arn : String

        # The status of a monitor.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @monitor_arn : String,
          @status : String
        )
        end
      end

      # Invalid request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
