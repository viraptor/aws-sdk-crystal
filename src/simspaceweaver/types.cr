require "json"
require "time"

module Aws
  module SimSpaceWeaver
    module Types


      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon CloudWatch Logs log group for the simulation. For more information about log groups, see
      # Working with log groups and log streams in the Amazon CloudWatch Logs User Guide .

      struct CloudWatchLogsLogGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon CloudWatch Logs log group for the simulation. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference . For more information about log groups, see Working with log groups and log streams in
        # the Amazon CloudWatch Logs User Guide .

        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateSnapshotInput
        include JSON::Serializable

        # The Amazon S3 bucket and optional folder (object key prefix) where SimSpace Weaver creates the
        # snapshot file. The Amazon S3 bucket must be in the same Amazon Web Services Region as the
        # simulation.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::S3Destination

        # The name of the simulation.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        def initialize(
          @destination : Types::S3Destination,
          @simulation : String
        )
        end
      end


      struct CreateSnapshotOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteAppInput
        include JSON::Serializable

        # The name of the app.

        @[JSON::Field(key: "app")]
        getter app : String

        # The name of the domain of the app.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the simulation of the app.

        @[JSON::Field(key: "simulation")]
        getter simulation : String

        def initialize(
          @app : String,
          @domain : String,
          @simulation : String
        )
        end
      end


      struct DeleteAppOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSimulationInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "simulation")]
        getter simulation : String

        def initialize(
          @simulation : String
        )
        end
      end


      struct DeleteSimulationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAppInput
        include JSON::Serializable

        # The name of the app.

        @[JSON::Field(key: "app")]
        getter app : String

        # The name of the domain of the app.

        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the simulation of the app.

        @[JSON::Field(key: "simulation")]
        getter simulation : String

        def initialize(
          @app : String,
          @domain : String,
          @simulation : String
        )
        end
      end


      struct DescribeAppOutput
        include JSON::Serializable

        # The description of the app.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the domain of the app.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # Information about the network endpoint for the custom app. You can use the endpoint to connect to
        # the custom app.

        @[JSON::Field(key: "EndpointInfo")]
        getter endpoint_info : Types::SimulationAppEndpointInfo?


        @[JSON::Field(key: "LaunchOverrides")]
        getter launch_overrides : Types::LaunchOverrides?

        # The name of the app.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the simulation of the app.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String?

        # The current lifecycle state of the custom app.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The desired lifecycle state of the custom app.

        @[JSON::Field(key: "TargetStatus")]
        getter target_status : String?

        def initialize(
          @description : String? = nil,
          @domain : String? = nil,
          @endpoint_info : Types::SimulationAppEndpointInfo? = nil,
          @launch_overrides : Types::LaunchOverrides? = nil,
          @name : String? = nil,
          @simulation : String? = nil,
          @status : String? = nil,
          @target_status : String? = nil
        )
        end
      end


      struct DescribeSimulationInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "simulation")]
        getter simulation : String

        def initialize(
          @simulation : String
        )
        end
      end


      struct DescribeSimulationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the simulation. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the simulation was created, expressed as the number of seconds and milliseconds in UTC
        # since the Unix epoch (0:0:0.000, January 1, 1970).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The description of the simulation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A universally unique identifier (UUID) for this simulation.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # A collection of additional state information, such as domain and clock configuration.

        @[JSON::Field(key: "LiveSimulationState")]
        getter live_simulation_state : Types::LiveSimulationState?

        # Settings that control how SimSpace Weaver handles your simulation log data.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # The maximum running time of the simulation, specified as a number of minutes (m or M), hours (h or
        # H), or days (d or D). The simulation stops when it reaches this limit. The maximum value is 14D , or
        # its equivalent in the other units. The default value is 14D . A value equivalent to 0 makes the
        # simulation immediately transition to Stopping as soon as it reaches Started .

        @[JSON::Field(key: "MaximumDuration")]
        getter maximum_duration : String?

        # The name of the simulation.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that the simulation
        # assumes to perform actions. For more information about ARNs, see Amazon Resource Names (ARNs) in the
        # Amazon Web Services General Reference . For more information about IAM roles, see IAM roles in the
        # Identity and Access Management User Guide .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # An error message that SimSpace Weaver returns only if there is a problem with the simulation schema.

        @[JSON::Field(key: "SchemaError")]
        getter schema_error : String?

        # The location of the simulation schema in Amazon Simple Storage Service (Amazon S3). For more
        # information about Amazon S3, see the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "SchemaS3Location")]
        getter schema_s3_location : Types::S3Location?


        @[JSON::Field(key: "SnapshotS3Location")]
        getter snapshot_s3_location : Types::S3Location?

        # An error message that SimSpace Weaver returns only if a problem occurs when the simulation is in the
        # STARTING state.

        @[JSON::Field(key: "StartError")]
        getter start_error : String?

        # The current lifecycle state of the simulation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The desired lifecycle state of the simulation.

        @[JSON::Field(key: "TargetStatus")]
        getter target_status : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @execution_id : String? = nil,
          @live_simulation_state : Types::LiveSimulationState? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @maximum_duration : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @schema_error : String? = nil,
          @schema_s3_location : Types::S3Location? = nil,
          @snapshot_s3_location : Types::S3Location? = nil,
          @start_error : String? = nil,
          @status : String? = nil,
          @target_status : String? = nil
        )
        end
      end

      # A collection of app instances that run the same executable app code and have the same launch options
      # and commands. For more information about domains, see Key concepts: Domains in the SimSpace Weaver
      # User Guide .

      struct Domain
        include JSON::Serializable

        # The type of lifecycle management for apps in the domain. Indicates whether apps in this domain are
        # managed (SimSpace Weaver starts and stops the apps) or unmanaged (you must start and stop the apps).
        # Lifecycle types PerWorker – Managed: SimSpace Weaver starts one app on each worker.
        # BySpatialSubdivision – Managed: SimSpace Weaver starts one app for each spatial partition. ByRequest
        # – Unmanaged: You use the StartApp API to start the apps and use the StopApp API to stop the apps.

        @[JSON::Field(key: "Lifecycle")]
        getter lifecycle : String?

        # The name of the domain.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @lifecycle : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Options that apply when the app starts. These options override default behavior.

      struct LaunchOverrides
        include JSON::Serializable

        # App launch commands and command line parameters that override the launch command configured in the
        # simulation schema.

        @[JSON::Field(key: "LaunchCommands")]
        getter launch_commands : Array(String)?

        def initialize(
          @launch_commands : Array(String)? = nil
        )
        end
      end


      struct ListAppsInput
        include JSON::Serializable

        # The name of the simulation that you want to list apps for.

        @[JSON::Field(key: "simulation")]
        getter simulation : String

        # The name of the domain that you want to list apps for.

        @[JSON::Field(key: "domain")]
        getter domain : String?

        # The maximum number of apps to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If SimSpace Weaver returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @simulation : String,
          @domain : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAppsOutput
        include JSON::Serializable

        # The list of apps for the given simulation and domain.

        @[JSON::Field(key: "Apps")]
        getter apps : Array(Types::SimulationAppMetadata)?

        # If SimSpace Weaver returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @apps : Array(Types::SimulationAppMetadata)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSimulationsInput
        include JSON::Serializable

        # The maximum number of simulations to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If SimSpace Weaver returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSimulationsOutput
        include JSON::Serializable

        # If SimSpace Weaver returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of simulations.

        @[JSON::Field(key: "Simulations")]
        getter simulations : Array(Types::SimulationMetadata)?

        def initialize(
          @next_token : String? = nil,
          @simulations : Array(Types::SimulationMetadata)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. For more information about ARNs, see Amazon Resource
        # Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags for the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of additional state information, such as domain and clock configuration.

      struct LiveSimulationState
        include JSON::Serializable

        # A list of simulation clocks. At this time, a simulation has only one clock.

        @[JSON::Field(key: "Clocks")]
        getter clocks : Array(Types::SimulationClock)?

        # A list of domains for the simulation. For more information about domains, see Key concepts: Domains
        # in the SimSpace Weaver User Guide .

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::Domain)?

        def initialize(
          @clocks : Array(Types::SimulationClock)? = nil,
          @domains : Array(Types::Domain)? = nil
        )
        end
      end

      # The location where SimSpace Weaver sends simulation log data.

      struct LogDestination
        include JSON::Serializable

        # An Amazon CloudWatch Logs log group that stores simulation log data. For more information about log
        # groups, see Working with log groups and log streams in the Amazon CloudWatch Logs User Guide .

        @[JSON::Field(key: "CloudWatchLogsLogGroup")]
        getter cloud_watch_logs_log_group : Types::CloudWatchLogsLogGroup?

        def initialize(
          @cloud_watch_logs_log_group : Types::CloudWatchLogsLogGroup? = nil
        )
        end
      end

      # The logging configuration for a simulation.

      struct LoggingConfiguration
        include JSON::Serializable

        # A list of the locations where SimSpace Weaver sends simulation log data.

        @[JSON::Field(key: "Destinations")]
        getter destinations : Array(Types::LogDestination)?

        def initialize(
          @destinations : Array(Types::LogDestination)? = nil
        )
        end
      end


      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An Amazon S3 bucket and optional folder (object key prefix) where SimSpace Weaver creates a file.

      struct S3Destination
        include JSON::Serializable

        # The name of an Amazon S3 bucket. For more information about buckets, see Creating, configuring, and
        # working with Amazon S3 buckets in the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # A string prefix for an Amazon S3 object key. It's usually a folder name. For more information about
        # folders in Amazon S3, see Organizing objects in the Amazon S3 console using folders in the Amazon
        # Simple Storage Service User Guide .

        @[JSON::Field(key: "ObjectKeyPrefix")]
        getter object_key_prefix : String?

        def initialize(
          @bucket_name : String,
          @object_key_prefix : String? = nil
        )
        end
      end

      # A location in Amazon Simple Storage Service (Amazon S3) where SimSpace Weaver stores simulation
      # data, such as your app .zip files and schema file. For more information about Amazon S3, see the
      # Amazon Simple Storage Service User Guide .

      struct S3Location
        include JSON::Serializable

        # The name of an Amazon S3 bucket. For more information about buckets, see Creating, configuring, and
        # working with Amazon S3 buckets in the Amazon Simple Storage Service User Guide .

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The key name of an object in Amazon S3. For more information about Amazon S3 objects and object
        # keys, see Uploading, downloading, and working with objects in Amazon S3 in the Amazon Simple Storage
        # Service User Guide .

        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String

        def initialize(
          @bucket_name : String,
          @object_key : String
        )
        end
      end


      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the network endpoint that you can use to connect to your custom or service app.
      # For more information about SimSpace Weaver apps, see Key concepts: Apps in the SimSpace Weaver User
      # Guide ..

      struct SimulationAppEndpointInfo
        include JSON::Serializable

        # The IP address of the app. SimSpace Weaver dynamically assigns this IP address when the app starts.

        @[JSON::Field(key: "Address")]
        getter address : String?

        # The inbound TCP/UDP port numbers of the app. The combination of an IP address and a port number form
        # a network endpoint.

        @[JSON::Field(key: "IngressPortMappings")]
        getter ingress_port_mappings : Array(Types::SimulationAppPortMapping)?

        def initialize(
          @address : String? = nil,
          @ingress_port_mappings : Array(Types::SimulationAppPortMapping)? = nil
        )
        end
      end

      # A collection of metadata about the app.

      struct SimulationAppMetadata
        include JSON::Serializable

        # The domain of the app. For more information about domains, see Key concepts: Domains in the SimSpace
        # Weaver User Guide .

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The name of the app.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the simulation of the app.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String?

        # The current status of the app.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The desired status of the app.

        @[JSON::Field(key: "TargetStatus")]
        getter target_status : String?

        def initialize(
          @domain : String? = nil,
          @name : String? = nil,
          @simulation : String? = nil,
          @status : String? = nil,
          @target_status : String? = nil
        )
        end
      end

      # A collection of TCP/UDP ports for a custom or service app.

      struct SimulationAppPortMapping
        include JSON::Serializable

        # The TCP/UDP port number of the running app. SimSpace Weaver dynamically assigns this port number
        # when the app starts. SimSpace Weaver maps the Declared port to the Actual port. Clients connect to
        # the app using the app's IP address and the Actual port number.

        @[JSON::Field(key: "Actual")]
        getter actual : Int32?

        # The TCP/UDP port number of the app, declared in the simulation schema. SimSpace Weaver maps the
        # Declared port to the Actual port. The source code for the app should bind to the Declared port.

        @[JSON::Field(key: "Declared")]
        getter declared : Int32?

        def initialize(
          @actual : Int32? = nil,
          @declared : Int32? = nil
        )
        end
      end

      # Status information about the simulation clock.

      struct SimulationClock
        include JSON::Serializable

        # The current status of the simulation clock.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The desired status of the simulation clock.

        @[JSON::Field(key: "TargetStatus")]
        getter target_status : String?

        def initialize(
          @status : String? = nil,
          @target_status : String? = nil
        )
        end
      end

      # A collection of data about the simulation.

      struct SimulationMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the simulation. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the simulation was created, expressed as the number of seconds and milliseconds in UTC
        # since the Unix epoch (0:0:0.000, January 1, 1970).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The name of the simulation.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the simulation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The desired status of the simulation.

        @[JSON::Field(key: "TargetStatus")]
        getter target_status : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @target_status : String? = nil
        )
        end
      end


      struct StartAppInput
        include JSON::Serializable

        # The name of the domain of the app.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The name of the app.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the simulation of the app.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        # A value that you provide to ensure that repeated calls to this API operation using the same
        # parameters complete only once. A ClientToken is also known as an idempotency token . A ClientToken
        # expires after 24 hours.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the app.

        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LaunchOverrides")]
        getter launch_overrides : Types::LaunchOverrides?

        def initialize(
          @domain : String,
          @name : String,
          @simulation : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @launch_overrides : Types::LaunchOverrides? = nil
        )
        end
      end


      struct StartAppOutput
        include JSON::Serializable

        # The name of the domain of the app.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The name of the app.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the simulation of the app.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String?

        def initialize(
          @domain : String? = nil,
          @name : String? = nil,
          @simulation : String? = nil
        )
        end
      end


      struct StartClockInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        def initialize(
          @simulation : String
        )
        end
      end


      struct StartClockOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StartSimulationInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that the simulation
        # assumes to perform actions. For more information about ARNs, see Amazon Resource Names (ARNs) in the
        # Amazon Web Services General Reference . For more information about IAM roles, see IAM roles in the
        # Identity and Access Management User Guide .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A value that you provide to ensure that repeated calls to this API operation using the same
        # parameters complete only once. A ClientToken is also known as an idempotency token . A ClientToken
        # expires after 24 hours.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the simulation.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The maximum running time of the simulation, specified as a number of minutes (m or M), hours (h or
        # H), or days (d or D). The simulation stops when it reaches this limit. The maximum value is 14D , or
        # its equivalent in the other units. The default value is 14D . A value equivalent to 0 makes the
        # simulation immediately transition to Stopping as soon as it reaches Started .

        @[JSON::Field(key: "MaximumDuration")]
        getter maximum_duration : String?

        # The location of the simulation schema in Amazon Simple Storage Service (Amazon S3). For more
        # information about Amazon S3, see the Amazon Simple Storage Service User Guide . Provide a
        # SchemaS3Location to start your simulation from a schema. If you provide a SchemaS3Location then you
        # can't provide a SnapshotS3Location .

        @[JSON::Field(key: "SchemaS3Location")]
        getter schema_s3_location : Types::S3Location?

        # The location of the snapshot .zip file in Amazon Simple Storage Service (Amazon S3). For more
        # information about Amazon S3, see the Amazon Simple Storage Service User Guide . Provide a
        # SnapshotS3Location to start your simulation from a snapshot. The Amazon S3 bucket must be in the
        # same Amazon Web Services Region as the simulation. If you provide a SnapshotS3Location then you
        # can't provide a SchemaS3Location .

        @[JSON::Field(key: "SnapshotS3Location")]
        getter snapshot_s3_location : Types::S3Location?

        # A list of tags for the simulation. For more information about tags, see Tagging Amazon Web Services
        # resources in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @maximum_duration : String? = nil,
          @schema_s3_location : Types::S3Location? = nil,
          @snapshot_s3_location : Types::S3Location? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartSimulationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the simulation. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time when the simulation was created, expressed as the number of seconds and milliseconds in UTC
        # since the Unix epoch (0:0:0.000, January 1, 1970).

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # A universally unique identifier (UUID) for this simulation.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @execution_id : String? = nil
        )
        end
      end


      struct StopAppInput
        include JSON::Serializable

        # The name of the app.

        @[JSON::Field(key: "App")]
        getter app : String

        # The name of the domain of the app.

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The name of the simulation of the app.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        def initialize(
          @app : String,
          @domain : String,
          @simulation : String
        )
        end
      end


      struct StopAppOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StopClockInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        def initialize(
          @simulation : String
        )
        end
      end


      struct StopClockOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StopSimulationInput
        include JSON::Serializable

        # The name of the simulation.

        @[JSON::Field(key: "Simulation")]
        getter simulation : String

        def initialize(
          @simulation : String
        )
        end
      end


      struct StopSimulationOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to add tags to. For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags to apply to the resource.

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


      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from. For more
        # information about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General
        # Reference .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource.

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


      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
