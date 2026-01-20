require "json"
require "time"

module Aws
  module GameLiftStreams
    module Types

      # You don't have the required permissions to access this Amazon GameLift Streams resource. Correct the
      # permissions before you try again.

      struct AccessDeniedException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct AddStreamGroupLocationsInput
        include JSON::Serializable

        # A stream group to add the specified locations to. This value is an Amazon Resource Name (ARN) or ID
        # that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A set of one or more locations and the streaming capacity for each location.

        @[JSON::Field(key: "LocationConfigurations")]
        getter location_configurations : Array(Types::LocationConfiguration)

        def initialize(
          @identifier : String,
          @location_configurations : Array(Types::LocationConfiguration)
        )
        end
      end


      struct AddStreamGroupLocationsOutput
        include JSON::Serializable

        # This value is an Amazon Resource Name (ARN) or ID that uniquely identifies the stream group
        # resource. Example ARN: arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .
        # Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # This value is set of locations, including their name, current status, and capacities. A location can
        # be in one of the following states: ACTIVATING : Amazon GameLift Streams is preparing the location.
        # You cannot stream from, scale the capacity of, or remove this location yet. ACTIVE : The location is
        # provisioned with initial capacity. You can now stream from, scale the capacity of, or remove this
        # location. ERROR : Amazon GameLift Streams failed to set up this location. The StatusReason field
        # describes the error. You can remove this location and try to add it again. REMOVING : Amazon
        # GameLift Streams is working to remove this location. This will release all provisioned capacity for
        # this location in this stream group.

        @[JSON::Field(key: "Locations")]
        getter locations : Array(Types::LocationState)

        def initialize(
          @identifier : String,
          @locations : Array(Types::LocationState)
        )
        end
      end

      # Describes an application resource that represents a collection of content for streaming with Amazon
      # GameLift Streams. To retrieve additional application details, call GetApplication .

      struct ApplicationSummary
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that's assigned to an application resource and uniquely identifies the
        # application across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS
        # Region]:[AWS account]:application/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the application. You can edit this value.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An ID that uniquely identifies the application resource. Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Configuration settings that identify the operating system for an application resource. This can also
        # include a compatibility layer and other drivers. A runtime environment can be one of the following:
        # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
        # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
        # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
        # Version=20230704 )

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : Types::RuntimeEnvironment?

        # The current status of the application resource. Possible statuses include the following: INITIALIZED
        # : Amazon GameLift Streams has received the request and is initiating the work flow to create an
        # application. PROCESSING : The create application work flow is in process. Amazon GameLift Streams is
        # copying the content and caching for future deployment in a stream group. READY : The application is
        # ready to deploy in a stream group. ERROR : An error occurred when setting up the application. For
        # more information about the error, call GetApplication and refer to StatusReason . DELETING : Amazon
        # GameLift Streams is in the process of deleting the application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @runtime_environment : Types::RuntimeEnvironment? = nil,
          @status : String? = nil
        )
        end
      end


      struct AssociateApplicationsInput
        include JSON::Serializable

        # A set of applications to associate with the stream group. This value is a set of either Amazon
        # Resource Names (ARN) or IDs that uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationIdentifiers")]
        getter application_identifiers : Array(String)

        # A stream group to associate to the applications. This value is an Amazon Resource Name (ARN) or ID
        # that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @application_identifiers : Array(String),
          @identifier : String
        )
        end
      end


      struct AssociateApplicationsOutput
        include JSON::Serializable

        # A set of applications that are associated to the stream group. This value is a set of Amazon
        # Resource Names (ARNs) that uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationArns")]
        getter application_arns : Array(String)?

        # A stream group that is associated to the applications. This value is an Amazon Resource Name (ARN)
        # that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @application_arns : Array(String)? = nil,
          @arn : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      struct ConflictException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateApplicationInput
        include JSON::Serializable

        # The location of the content that you want to stream. Enter an Amazon S3 URI to a bucket that
        # contains your game or other application. The location can have a multi-level prefix structure, but
        # it must include all the files needed to run the content. Amazon GameLift Streams copies everything
        # under the specified location. This value is immutable. To designate a different content location,
        # create a new application. The Amazon S3 bucket and the Amazon GameLift Streams application must be
        # in the same Amazon Web Services Region.

        @[JSON::Field(key: "ApplicationSourceUri")]
        getter application_source_uri : String

        # A human-readable label for the application. You can update this value later.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The relative path and file name of the executable file that Amazon GameLift Streams will stream.
        # Specify a path relative to the location set in ApplicationSourceUri . The file must be contained
        # within the application's root folder. For Windows applications, the file must be a valid Windows
        # executable or batch file with a filename ending in .exe, .cmd, or .bat. For Linux applications, the
        # file must be a valid Linux binary executable or a script that contains an initial interpreter line
        # starting with a shebang (' #! ').

        @[JSON::Field(key: "ExecutablePath")]
        getter executable_path : String

        # Configuration settings that identify the operating system for an application resource. This can also
        # include a compatibility layer and other drivers. A runtime environment can be one of the following:
        # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
        # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
        # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
        # Version=20230704 )

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : Types::RuntimeEnvironment

        # An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to save application logs.
        # Required if you specify one or more ApplicationLogPaths . The log bucket must have permissions that
        # give Amazon GameLift Streams access to write the log files. For more information, see Application
        # log bucket permission policy in the Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "ApplicationLogOutputUri")]
        getter application_log_output_uri : String?

        # Locations of log files that your content generates during a stream session. Enter path values that
        # are relative to the ApplicationSourceUri location. You can specify up to 10 log paths. Amazon
        # GameLift Streams uploads designated log files to the Amazon S3 bucket that you specify in
        # ApplicationLogOutputUri at the end of a stream session. To retrieve stored log files, call
        # GetStreamSession and get the LogFileLocationUri .

        @[JSON::Field(key: "ApplicationLogPaths")]
        getter application_log_paths : Array(String)?

        # A unique identifier that represents a client request. The request is idempotent, which ensures that
        # an API request completes only once. When users send a request, Amazon GameLift Streams automatically
        # populates this field.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A list of labels to assign to the new application resource. Tags are developer-defined key-value
        # pairs. Tagging Amazon Web Services resources is useful for resource management, access management
        # and cost allocation. See Tagging Amazon Web Services Resources in the Amazon Web Services General
        # Reference . You can use TagResource to add tags, UntagResource to remove tags, and
        # ListTagsForResource to view tags on existing resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_source_uri : String,
          @description : String,
          @executable_path : String,
          @runtime_environment : Types::RuntimeEnvironment,
          @application_log_output_uri : String? = nil,
          @application_log_paths : Array(String)? = nil,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that's assigned to an application resource and uniquely identifies it
        # across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS Region]:[AWS
        # account]:application/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to save application logs.
        # Required if you specify one or more ApplicationLogPaths .

        @[JSON::Field(key: "ApplicationLogOutputUri")]
        getter application_log_output_uri : String?

        # Locations of log files that your content generates during a stream session. Amazon GameLift Streams
        # uploads log files to the Amazon S3 bucket that you specify in ApplicationLogOutputUri at the end of
        # a stream session. To retrieve stored log files, call GetStreamSession and get the LogFileLocationUri
        # .

        @[JSON::Field(key: "ApplicationLogPaths")]
        getter application_log_paths : Array(String)?

        # The original Amazon S3 location of uploaded stream content for the application.

        @[JSON::Field(key: "ApplicationSourceUri")]
        getter application_source_uri : String?

        # A newly created application is not associated to any stream groups. This value is empty.

        @[JSON::Field(key: "AssociatedStreamGroups")]
        getter associated_stream_groups : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the application. You can edit this value.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The relative path and file name of the executable file that launches the content for streaming.

        @[JSON::Field(key: "ExecutablePath")]
        getter executable_path : String?

        # A unique ID value that is assigned to the resource when it's created. Format example: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # A set of replication statuses for each location.

        @[JSON::Field(key: "ReplicationStatuses")]
        getter replication_statuses : Array(Types::ReplicationStatus)?

        # Configuration settings that identify the operating system for an application resource. This can also
        # include a compatibility layer and other drivers. A runtime environment can be one of the following:
        # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
        # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
        # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
        # Version=20230704 )

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : Types::RuntimeEnvironment?

        # The current status of the application resource. Possible statuses include the following: INITIALIZED
        # : Amazon GameLift Streams has received the request and is initiating the work flow to create an
        # application. PROCESSING : The create application work flow is in process. Amazon GameLift Streams is
        # copying the content and caching for future deployment in a stream group. READY : The application is
        # ready to deploy in a stream group. ERROR : An error occurred when setting up the application. See
        # StatusReason for more information. DELETING : Amazon GameLift Streams is in the process of deleting
        # the application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the status reason when the application is in ERROR status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @arn : String,
          @application_log_output_uri : String? = nil,
          @application_log_paths : Array(String)? = nil,
          @application_source_uri : String? = nil,
          @associated_stream_groups : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @executable_path : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @replication_statuses : Array(Types::ReplicationStatus)? = nil,
          @runtime_environment : Types::RuntimeEnvironment? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct CreateStreamGroupInput
        include JSON::Serializable

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The target stream quality for sessions that are hosted in this stream group. Set a stream class that
        # is appropriate to the type of content that you're streaming. Stream class determines the type of
        # computing resources Amazon GameLift Streams uses and impacts the cost of streaming. The following
        # options are available: A stream class can be one of the following: gen6n_pro_win2022 (NVIDIA, pro)
        # Supports applications with extremely high 3D scene complexity which require maximum resources. Runs
        # applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with Unreal
        # Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen6n_pro (NVIDIA, pro) Supports applications with extremely high 3D scene complexity which require
        # maximum resources. Uses dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference
        # frame rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1
        # concurrent stream session gen6n_ultra_win2022 (NVIDIA, ultra) Supports applications with high 3D
        # scene complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses
        # dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen6n_medium (NVIDIA, medium) Supports applications with moderate 3D scene complexity. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM Tenancy: Supports up to 4 concurrent stream sessions
        # gen6n_small (NVIDIA, small) Supports applications with lightweight 3D scene complexity and low CPU
        # usage. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM Tenancy: Supports up to 12 concurrent stream
        # sessions gen5n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene
        # complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60
        # fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen5n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen5n_ultra (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity. Uses
        # dedicated NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen4n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity.
        # Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with
        # Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen4n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen4n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses dedicated
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session

        @[JSON::Field(key: "StreamClass")]
        getter stream_class : String

        # A unique identifier that represents a client request. The request is idempotent, which ensures that
        # an API request completes only once. When users send a request, Amazon GameLift Streams automatically
        # populates this field.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The unique identifier of the Amazon GameLift Streams application that you want to set as the default
        # application in a stream group. The application that you specify must be in READY status. The default
        # application is pre-cached on always-on compute resources, reducing stream startup times. Other
        # applications are automatically cached as needed. If you do not link an application when you create a
        # stream group, you will need to link one later, before you can start streaming, using
        # AssociateApplications . This value is an Amazon Resource Name (ARN) or ID that uniquely identifies
        # the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "DefaultApplicationIdentifier")]
        getter default_application_identifier : String?

        # A set of one or more locations and the streaming capacity for each location.

        @[JSON::Field(key: "LocationConfigurations")]
        getter location_configurations : Array(Types::LocationConfiguration)?

        # A list of labels to assign to the new stream group resource. Tags are developer-defined key-value
        # pairs. Tagging Amazon Web Services resources is useful for resource management, access management
        # and cost allocation. See Tagging Amazon Web Services Resources in the Amazon Web Services General
        # Reference . You can use TagResource to add tags, UntagResource to remove tags, and
        # ListTagsForResource to view tags on existing resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @stream_class : String,
          @client_token : String? = nil,
          @default_application_identifier : String? = nil,
          @location_configurations : Array(Types::LocationConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateStreamGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is assigned to the stream group resource and that uniquely
        # identifies the group across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS
        # Region]:[AWS account]:streamgroup/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A set of applications that this stream group is associated to. You can stream any of these
        # applications by using this stream group. This value is a set of Amazon Resource Names (ARNs) that
        # uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "AssociatedApplications")]
        getter associated_applications : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The default Amazon GameLift Streams application that is associated with this stream group.

        @[JSON::Field(key: "DefaultApplication")]
        getter default_application : Types::DefaultApplication?

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time at which this stream group expires. Timestamps are expressed using in ISO8601 format, such
        # as: 2022-12-27T22:29:40+00:00 (UTC). After this time, you will no longer be able to update this
        # stream group or use it to start stream sessions. Only Get and Delete operations will work on an
        # expired stream group.

        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : Time?

        # A unique ID value that is assigned to the resource when it's created. Format example: sg-1AB2C3De4 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # This value is the set of locations, including their name, current status, and capacities. A location
        # can be in one of the following states: ACTIVATING : Amazon GameLift Streams is preparing the
        # location. You cannot stream from, scale the capacity of, or remove this location yet. ACTIVE : The
        # location is provisioned with initial capacity. You can now stream from, scale the capacity of, or
        # remove this location. ERROR : Amazon GameLift Streams failed to set up this location. The
        # StatusReason field describes the error. You can remove this location and try to add it again.
        # REMOVING : Amazon GameLift Streams is working to remove this location. This will release all
        # provisioned capacity for this location in this stream group.

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        # The current status of the stream group resource. Possible statuses include the following: ACTIVATING
        # : The stream group is deploying and isn't ready to host streams. ACTIVE : The stream group is ready
        # to host streams. ACTIVE_WITH_ERRORS : One or more locations in the stream group are in an error
        # state. Verify the details of individual locations and remove any locations which are in error.
        # DELETING : Amazon GameLift Streams is in the process of deleting the stream group. ERROR : An error
        # occurred when the stream group deployed. See StatusReason (returned by CreateStreamGroup ,
        # GetStreamGroup , and UpdateStreamGroup ) for more information. EXPIRED : The stream group is expired
        # and can no longer host streams. This typically occurs when a stream group is 365 days old, as
        # indicated by the value of ExpiresAt . Create a new stream group to resume streaming capabilities.
        # UPDATING_LOCATIONS : One or more locations in the stream group are in the process of updating
        # (either activating or deleting).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason that the stream group is in ERROR status. The possible reasons can
        # be one of the following: internalError : The request can't process right now because of an issue
        # with the server. Try again later. noAvailableInstances : Amazon GameLift Streams does not currently
        # have enough available capacity to fulfill your request. Wait a few minutes and retry the request as
        # capacity can shift frequently. You can also try to make the request using a different stream class
        # or in another region.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The target stream quality for the stream group. A stream class can be one of the following:
        # gen6n_pro_win2022 (NVIDIA, pro) Supports applications with extremely high 3D scene complexity which
        # require maximum resources. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_pro (NVIDIA, pro) Supports applications with extremely high 3D scene complexity
        # which require maximum resources. Uses dedicated NVIDIA L4 Tensor Core GPU. Reference resolution:
        # 1080p Reference frame rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy:
        # Supports 1 concurrent stream session gen6n_ultra_win2022 (NVIDIA, ultra) Supports applications with
        # high 3D scene complexity. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses
        # dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen6n_medium (NVIDIA, medium) Supports applications with moderate 3D scene complexity. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM Tenancy: Supports up to 4 concurrent stream sessions
        # gen6n_small (NVIDIA, small) Supports applications with lightweight 3D scene complexity and low CPU
        # usage. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM Tenancy: Supports up to 12 concurrent stream
        # sessions gen5n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene
        # complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60
        # fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen5n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen5n_ultra (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity. Uses
        # dedicated NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen4n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity.
        # Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with
        # Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen4n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen4n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses dedicated
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session

        @[JSON::Field(key: "StreamClass")]
        getter stream_class : String?

        def initialize(
          @arn : String,
          @associated_applications : Array(String)? = nil,
          @created_at : Time? = nil,
          @default_application : Types::DefaultApplication? = nil,
          @description : String? = nil,
          @expires_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @location_states : Array(Types::LocationState)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stream_class : String? = nil
        )
        end
      end


      struct CreateStreamSessionConnectionInput
        include JSON::Serializable

        # Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .
        # The stream group that you want to run this stream session with. The stream group must be in ACTIVE
        # status.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A WebRTC ICE offer string to use when initializing a WebRTC connection. The offer is a very long
        # JSON string. Provide the string as a text value in quotes. The offer must be newly generated, not
        # the same offer provided to StartStreamSession .

        @[JSON::Field(key: "SignalRequest")]
        getter signal_request : String

        # Amazon Resource Name (ARN) or ID that uniquely identifies the stream session resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567 . Example
        # ID: ABC123def4567 . The stream session must be in PENDING_CLIENT_RECONNECTION or ACTIVE status.

        @[JSON::Field(key: "StreamSessionIdentifier")]
        getter stream_session_identifier : String

        # A unique identifier that represents a client request. The request is idempotent, which ensures that
        # an API request completes only once. When users send a request, Amazon GameLift Streams automatically
        # populates this field.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @identifier : String,
          @signal_request : String,
          @stream_session_identifier : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateStreamSessionConnectionOutput
        include JSON::Serializable

        # The WebRTC answer string that the stream server generates in response to the SignalRequest .

        @[JSON::Field(key: "SignalResponse")]
        getter signal_response : String?

        def initialize(
          @signal_response : String? = nil
        )
        end
      end

      # Represents the default Amazon GameLift Streams application that a stream group hosts.

      struct DefaultApplication
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An ID that uniquely identifies the application resource. Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct DeleteApplicationInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteStreamGroupInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DisassociateApplicationsInput
        include JSON::Serializable

        # A set of applications that you want to disassociate from the stream group. This value is a set of
        # either Amazon Resource Names (ARN) or IDs that uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationIdentifiers")]
        getter application_identifiers : Array(String)

        # A stream group to disassociate these applications from. This value is an Amazon Resource Name (ARN)
        # or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @application_identifiers : Array(String),
          @identifier : String
        )
        end
      end


      struct DisassociateApplicationsOutput
        include JSON::Serializable

        # A set of applications that are disassociated from this stream group. This value is a set of Amazon
        # Resource Names (ARNs) that uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationArns")]
        getter application_arns : Array(String)?

        # An Amazon Resource Name (ARN) that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @application_arns : Array(String)? = nil,
          @arn : String? = nil
        )
        end
      end

      # Provides details about the stream session's exported files.

      struct ExportFilesMetadata
        include JSON::Serializable

        # The S3 bucket URI where Amazon GameLift Streams uploaded the set of compressed exported files for a
        # stream session. Amazon GameLift Streams generates a ZIP file name based on the stream session
        # metadata. Alternatively, you can provide a custom file name with a .zip file extension. Example 1:
        # If you provide an S3 URI called s3://amzn-s3-demo-destination-bucket/MyGame_Session1.zip , then
        # Amazon GameLift Streams will save the files at that location. Example 2: If you provide an S3 URI
        # called s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/ , then Amazon GameLift
        # Streams will save the files at
        # s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/YYYYMMDD-HHMMSS-appId-sg-Id-sessionId.zip
        # or another similar name.

        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String?

        # The result of the ExportStreamSessionFiles operation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason the export is in FAILED status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @output_uri : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct ExportStreamSessionFilesInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The S3 bucket URI where Amazon GameLift Streams uploads the set of compressed exported files for
        # this stream session. Amazon GameLift Streams generates a ZIP file name based on the stream session
        # metadata. Alternatively, you can provide a custom file name with a .zip file extension. Example 1:
        # If you provide an S3 URI called s3://amzn-s3-demo-destination-bucket/MyGame_Session1.zip , then
        # Amazon GameLift Streams will save the files at that location. Example 2: If you provide an S3 URI
        # called s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/ , then Amazon GameLift
        # Streams will save the files at
        # s3://amzn-s3-demo-destination-bucket/MyGameSessions_ExportedFiles/YYYYMMDD-HHMMSS-appId-sg-Id-sessionId.zip
        # or another similar name.

        @[JSON::Field(key: "OutputUri")]
        getter output_uri : String

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream session resource. Example
        # ARN: arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567 .
        # Example ID: ABC123def4567 .

        @[JSON::Field(key: "StreamSessionIdentifier")]
        getter stream_session_identifier : String

        def initialize(
          @identifier : String,
          @output_uri : String,
          @stream_session_identifier : String
        )
        end
      end


      struct ExportStreamSessionFilesOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetApplicationInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that's assigned to an application resource and uniquely identifies it
        # across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS Region]:[AWS
        # account]:application/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to save application logs.
        # Required if you specify one or more ApplicationLogPaths .

        @[JSON::Field(key: "ApplicationLogOutputUri")]
        getter application_log_output_uri : String?

        # Locations of log files that your content generates during a stream session. Amazon GameLift Streams
        # uploads log files to the Amazon S3 bucket that you specify in ApplicationLogOutputUri at the end of
        # a stream session. To retrieve stored log files, call GetStreamSession and get the LogFileLocationUri
        # .

        @[JSON::Field(key: "ApplicationLogPaths")]
        getter application_log_paths : Array(String)?

        # The original Amazon S3 location of uploaded stream content for the application.

        @[JSON::Field(key: "ApplicationSourceUri")]
        getter application_source_uri : String?

        # A set of stream groups that this application is associated with. You can use any of these stream
        # groups to stream your application. This value is a set of Amazon Resource Names (ARNs) that uniquely
        # identify stream group resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .

        @[JSON::Field(key: "AssociatedStreamGroups")]
        getter associated_stream_groups : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the application. You can edit this value.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The relative path and file name of the executable file that launches the content for streaming.

        @[JSON::Field(key: "ExecutablePath")]
        getter executable_path : String?

        # A unique ID value that is assigned to the resource when it's created. Format example: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # A set of replication statuses for each location.

        @[JSON::Field(key: "ReplicationStatuses")]
        getter replication_statuses : Array(Types::ReplicationStatus)?

        # Configuration settings that identify the operating system for an application resource. This can also
        # include a compatibility layer and other drivers. A runtime environment can be one of the following:
        # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
        # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
        # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
        # Version=20230704 )

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : Types::RuntimeEnvironment?

        # The current status of the application resource. Possible statuses include the following: INITIALIZED
        # : Amazon GameLift Streams has received the request and is initiating the work flow to create an
        # application. PROCESSING : The create application work flow is in process. Amazon GameLift Streams is
        # copying the content and caching for future deployment in a stream group. READY : The application is
        # ready to deploy in a stream group. ERROR : An error occurred when setting up the application. See
        # StatusReason for more information. DELETING : Amazon GameLift Streams is in the process of deleting
        # the application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the status reason when the application is in ERROR status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @arn : String,
          @application_log_output_uri : String? = nil,
          @application_log_paths : Array(String)? = nil,
          @application_source_uri : String? = nil,
          @associated_stream_groups : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @executable_path : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @replication_statuses : Array(Types::ReplicationStatus)? = nil,
          @runtime_environment : Types::RuntimeEnvironment? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetStreamGroupInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetStreamGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is assigned to the stream group resource and that uniquely
        # identifies the group across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS
        # Region]:[AWS account]:streamgroup/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A set of applications that this stream group is associated to. You can stream any of these
        # applications by using this stream group. This value is a set of Amazon Resource Names (ARNs) that
        # uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "AssociatedApplications")]
        getter associated_applications : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The default Amazon GameLift Streams application that is associated with this stream group.

        @[JSON::Field(key: "DefaultApplication")]
        getter default_application : Types::DefaultApplication?

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time at which this stream group expires. Timestamps are expressed using in ISO8601 format, such
        # as: 2022-12-27T22:29:40+00:00 (UTC). After this time, you will no longer be able to update this
        # stream group or use it to start stream sessions. Only Get and Delete operations will work on an
        # expired stream group.

        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : Time?

        # A unique ID value that is assigned to the resource when it's created. Format example: sg-1AB2C3De4 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # This value is the set of locations, including their name, current status, and capacities. A location
        # can be in one of the following states: ACTIVATING : Amazon GameLift Streams is preparing the
        # location. You cannot stream from, scale the capacity of, or remove this location yet. ACTIVE : The
        # location is provisioned with initial capacity. You can now stream from, scale the capacity of, or
        # remove this location. ERROR : Amazon GameLift Streams failed to set up this location. The
        # StatusReason field describes the error. You can remove this location and try to add it again.
        # REMOVING : Amazon GameLift Streams is working to remove this location. This will release all
        # provisioned capacity for this location in this stream group.

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        # The current status of the stream group resource. Possible statuses include the following: ACTIVATING
        # : The stream group is deploying and isn't ready to host streams. ACTIVE : The stream group is ready
        # to host streams. ACTIVE_WITH_ERRORS : One or more locations in the stream group are in an error
        # state. Verify the details of individual locations and remove any locations which are in error.
        # DELETING : Amazon GameLift Streams is in the process of deleting the stream group. ERROR : An error
        # occurred when the stream group deployed. See StatusReason (returned by CreateStreamGroup ,
        # GetStreamGroup , and UpdateStreamGroup ) for more information. EXPIRED : The stream group is expired
        # and can no longer host streams. This typically occurs when a stream group is 365 days old, as
        # indicated by the value of ExpiresAt . Create a new stream group to resume streaming capabilities.
        # UPDATING_LOCATIONS : One or more locations in the stream group are in the process of updating
        # (either activating or deleting).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason that the stream group is in ERROR status. The possible reasons can
        # be one of the following: internalError : The request can't process right now because of an issue
        # with the server. Try again later. noAvailableInstances : Amazon GameLift Streams does not currently
        # have enough available capacity to fulfill your request. Wait a few minutes and retry the request as
        # capacity can shift frequently. You can also try to make the request using a different stream class
        # or in another region.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The target stream quality for the stream group. A stream class can be one of the following:
        # gen6n_pro_win2022 (NVIDIA, pro) Supports applications with extremely high 3D scene complexity which
        # require maximum resources. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_pro (NVIDIA, pro) Supports applications with extremely high 3D scene complexity
        # which require maximum resources. Uses dedicated NVIDIA L4 Tensor Core GPU. Reference resolution:
        # 1080p Reference frame rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy:
        # Supports 1 concurrent stream session gen6n_ultra_win2022 (NVIDIA, ultra) Supports applications with
        # high 3D scene complexity. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses
        # dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen6n_medium (NVIDIA, medium) Supports applications with moderate 3D scene complexity. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM Tenancy: Supports up to 4 concurrent stream sessions
        # gen6n_small (NVIDIA, small) Supports applications with lightweight 3D scene complexity and low CPU
        # usage. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM Tenancy: Supports up to 12 concurrent stream
        # sessions gen5n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene
        # complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60
        # fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen5n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen5n_ultra (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity. Uses
        # dedicated NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen4n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity.
        # Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with
        # Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen4n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen4n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses dedicated
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session

        @[JSON::Field(key: "StreamClass")]
        getter stream_class : String?

        def initialize(
          @arn : String,
          @associated_applications : Array(String)? = nil,
          @created_at : Time? = nil,
          @default_application : Types::DefaultApplication? = nil,
          @description : String? = nil,
          @expires_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @location_states : Array(Types::LocationState)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stream_class : String? = nil
        )
        end
      end


      struct GetStreamSessionInput
        include JSON::Serializable

        # The stream group that runs this stream session. This value is an Amazon Resource Name (ARN) or ID
        # that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream session resource. Example
        # ARN: arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567 .
        # Example ID: ABC123def4567 .

        @[JSON::Field(key: "StreamSessionIdentifier")]
        getter stream_session_identifier : String

        def initialize(
          @identifier : String,
          @stream_session_identifier : String
        )
        end
      end


      struct GetStreamSessionOutput
        include JSON::Serializable

        # A set of options that you can use to control the stream session runtime environment, expressed as a
        # set of key-value pairs. You can use this to configure the application or stream session details. You
        # can also provide custom environment variables that Amazon GameLift Streams passes to your game
        # client. If you want to debug your application with environment variables, we recommend that you do
        # so in a local environment outside of Amazon GameLift Streams. For more information, refer to the
        # Compatibility Guidance in the troubleshooting section of the Developer Guide.
        # AdditionalEnvironmentVariables and AdditionalLaunchArgs have similar purposes.
        # AdditionalEnvironmentVariables passes data using environment variables; while AdditionalLaunchArgs
        # passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalEnvironmentVariables")]
        getter additional_environment_variables : Hash(String, String)?

        # A list of CLI arguments that are sent to the streaming server when a stream session launches. You
        # can use this to configure the application or stream session details. You can also provide custom
        # arguments that Amazon GameLift Streams passes to your game client. AdditionalEnvironmentVariables
        # and AdditionalLaunchArgs have similar purposes. AdditionalEnvironmentVariables passes data using
        # environment variables; while AdditionalLaunchArgs passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalLaunchArgs")]
        getter additional_launch_args : Array(String)?

        # The application streaming in this session. This value is an Amazon Resource Name (ARN) that uniquely
        # identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The Amazon Resource Name (ARN) that's assigned to a stream session resource. When combined with the
        # stream group resource ID, this value uniquely identifies the stream session across all Amazon Web
        # Services Regions. Format is arn:aws:gameliftstreams:[AWS Region]:[AWS account]:streamsession/[stream
        # group resource ID]/[stream session resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The length of time that Amazon GameLift Streams should wait for a client to connect or reconnect to
        # the stream session. This time span starts when the stream session reaches ACTIVE or
        # PENDING_CLIENT_RECONNECTION state. If no client connects (or reconnects) before the timeout, Amazon
        # GameLift Streams terminates the stream session.

        @[JSON::Field(key: "ConnectionTimeoutSeconds")]
        getter connection_timeout_seconds : Int32?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the stream session. You can update this value at any time.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Provides details about the stream session's exported files.

        @[JSON::Field(key: "ExportFilesMetadata")]
        getter export_files_metadata : Types::ExportFilesMetadata?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The location where Amazon GameLift Streams hosts and streams your application. For example,
        # us-east-1 . For a complete list of locations that Amazon GameLift Streams supports, refer to
        # Regions, quotas, and limitations in the Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Access location for log files that your content generates during a stream session. These log files
        # are uploaded to cloud storage location at the end of a stream session. The Amazon GameLift Streams
        # application resource defines which log files to upload.

        @[JSON::Field(key: "LogFileLocationUri")]
        getter log_file_location_uri : String?

        # The performance stats configuration for the stream session

        @[JSON::Field(key: "PerformanceStatsConfiguration")]
        getter performance_stats_configuration : Types::PerformanceStatsConfiguration?

        # The data transfer protocol in use with the stream session.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The maximum duration of a session. Amazon GameLift Streams will automatically terminate a session
        # after this amount of time has elapsed, regardless of any existing client connections.

        @[JSON::Field(key: "SessionLengthSeconds")]
        getter session_length_seconds : Int32?

        # The WebRTC ICE offer string that a client generates to initiate a connection to the stream session.

        @[JSON::Field(key: "SignalRequest")]
        getter signal_request : String?

        # The WebRTC answer string that the stream server generates in response to the SignalRequest .

        @[JSON::Field(key: "SignalResponse")]
        getter signal_response : String?

        # The current status of the stream session. A stream session is ready for a client to connect when in
        # ACTIVE status. ACTIVATING : The stream session is starting and preparing to stream. ACTIVE : The
        # stream session is ready and waiting for a client connection. A client has ConnectionTimeoutSeconds
        # (specified in StartStreamSession ) from when the session reaches ACTIVE state to establish a
        # connection. If no client connects within this timeframe, the session automatically terminates.
        # CONNECTED : The stream session has a connected client. A session will automatically terminate if
        # there is no user input for 60 minutes, or if the maximum length of a session specified by
        # SessionLengthSeconds in StartStreamSession is exceeded. ERROR : The stream session failed to
        # activate. See StatusReason (returned by GetStreamSession and StartStreamSession ) for more
        # information. PENDING_CLIENT_RECONNECTION : A client has recently disconnected and the stream session
        # is waiting for the client to reconnect. A client has ConnectionTimeoutSeconds (specified in
        # StartStreamSession ) from when the session reaches PENDING_CLIENT_RECONNECTION state to re-establish
        # a connection. If no client connects within this timeframe, the session automatically terminates.
        # RECONNECTING : A client has initiated a reconnect to a session that was in
        # PENDING_CLIENT_RECONNECTION state. TERMINATING : The stream session is ending. TERMINATED : The
        # stream session has ended.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason the stream session is in ERROR status or TERMINATED status. ERROR
        # status reasons: applicationLogS3DestinationError : Could not write the application log to the Amazon
        # S3 bucket that is configured for the streaming application. Make sure the bucket still exists.
        # internalError : An internal service error occurred. Start a new stream session to continue
        # streaming. invalidSignalRequest : The WebRTC signal request that was sent is not valid. When
        # starting or reconnecting to a stream session, use generateSignalRequest in the Amazon GameLift
        # Streams Web SDK to generate a new signal request. placementTimeout : Amazon GameLift Streams could
        # not find available stream capacity to start a stream session. Increase the stream capacity in the
        # stream group or wait until capacity becomes available. TERMINATED status reasons: apiTerminated :
        # The stream session was terminated by an API call to TerminateStreamSession . applicationExit : The
        # streaming application exited or crashed. The stream session was terminated because the application
        # is no longer running. connectionTimeout : The stream session was terminated because the client
        # failed to connect within the connection timeout period specified by ConnectionTimeoutSeconds .
        # idleTimeout : The stream session was terminated because it exceeded the idle timeout period of 60
        # minutes with no user input activity. maxSessionLengthTimeout : The stream session was terminated
        # because it exceeded the maximum session length timeout period specified by SessionLengthSeconds .
        # reconnectionTimeout : The stream session was terminated because the client failed to reconnect
        # within the reconnection timeout period specified by ConnectionTimeoutSeconds after losing
        # connection.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The unique identifier for the Amazon GameLift Streams stream group that is hosting the stream
        # session. Format example: sg-1AB2C3De4 .

        @[JSON::Field(key: "StreamGroupId")]
        getter stream_group_id : String?

        # An opaque, unique identifier for an end-user, defined by the developer.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The URL of an S3 bucket that stores Amazon GameLift Streams WebSDK files. The URL is used to
        # establish connection with the client.

        @[JSON::Field(key: "WebSdkProtocolUrl")]
        getter web_sdk_protocol_url : String?

        def initialize(
          @additional_environment_variables : Hash(String, String)? = nil,
          @additional_launch_args : Array(String)? = nil,
          @application_arn : String? = nil,
          @arn : String? = nil,
          @connection_timeout_seconds : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @export_files_metadata : Types::ExportFilesMetadata? = nil,
          @last_updated_at : Time? = nil,
          @location : String? = nil,
          @log_file_location_uri : String? = nil,
          @performance_stats_configuration : Types::PerformanceStatsConfiguration? = nil,
          @protocol : String? = nil,
          @session_length_seconds : Int32? = nil,
          @signal_request : String? = nil,
          @signal_response : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stream_group_id : String? = nil,
          @user_id : String? = nil,
          @web_sdk_protocol_url : String? = nil
        )
        end
      end

      # The service encountered an internal error and is unable to complete the request.

      struct InternalServerException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListApplicationsInput
        include JSON::Serializable

        # The number of results to return. Use this parameter with NextToken to return results in sequential
        # pages. Default value is 25 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that marks the start of the next set of results. Use this token when you retrieve results
        # as sequential pages. To get the first page of results, omit a token value. To get the remaining
        # pages, provide the token returned with the previous result set.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsOutput
        include JSON::Serializable

        # A collection of Amazon GameLift Streams applications that are associated with the Amazon Web
        # Services account in use. Each item includes application metadata and status.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ApplicationSummary)?

        # A token that marks the start of the next sequential page of results. If an operation doesn't return
        # a token, you've reached the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStreamGroupsInput
        include JSON::Serializable

        # The number of results to return. Use this parameter with NextToken to return results in sequential
        # pages. Default value is 25 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that marks the start of the next set of results. Use this token when you retrieve results as
        # sequential pages. To get the first page of results, omit a token value. To get the remaining pages,
        # provide the token returned with the previous result set.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStreamGroupsOutput
        include JSON::Serializable

        # A collection of Amazon GameLift Streams stream groups that are associated with the Amazon Web
        # Services account in use. Each item includes stream group metadata and status, but doesn't include
        # capacity information.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::StreamGroupSummary)?

        # A token that marks the start of the next sequential page of results. If an operation doesn't return
        # a token, you've reached the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::StreamGroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStreamSessionsByAccountInput
        include JSON::Serializable

        # Filter by the exported files status. You can specify one status in each request to retrieve only
        # sessions that currently have that exported files status.

        @[JSON::Field(key: "ExportFilesStatus")]
        getter export_files_status : String?

        # The number of results to return. Use this parameter with NextToken to return results in sequential
        # pages. Default value is 25 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that marks the start of the next set of results. Use this token when you retrieve results
        # as sequential pages. To get the first page of results, omit a token value. To get the remaining
        # pages, provide the token returned with the previous result set.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter by the stream session status. You can specify one status in each request to retrieve only
        # sessions that are currently in that status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @export_files_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListStreamSessionsByAccountOutput
        include JSON::Serializable

        # A collection of Amazon GameLift Streams stream sessions that are associated with a stream group and
        # returned in response to a list request. Each item includes stream session metadata and status.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::StreamSessionSummary)?

        # A token that marks the start of the next sequential page of results. If an operation doesn't return
        # a token, you've reached the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::StreamSessionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStreamSessionsInput
        include JSON::Serializable

        # The unique identifier of a Amazon GameLift Streams stream group to retrieve the stream session for.
        # You can use either the stream group ID or the Amazon Resource Name (ARN) .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Filter by the exported files status. You can specify one status in each request to retrieve only
        # sessions that currently have that exported files status. Exported files can be in one of the
        # following states: SUCCEEDED : The exported files are successfully stored in an S3 bucket. FAILED :
        # The session ended but Amazon GameLift Streams couldn't collect and upload the files to S3. PENDING :
        # Either the stream session is still in progress, or uploading the exported files to the S3 bucket is
        # in progress.

        @[JSON::Field(key: "ExportFilesStatus")]
        getter export_files_status : String?

        # The number of results to return. Use this parameter with NextToken to return results in sequential
        # pages. Default value is 25 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that marks the start of the next set of results. Use this token when you retrieve results
        # as sequential pages. To get the first page of results, omit a token value. To get the remaining
        # pages, provide the token returned with the previous result set.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filter by the stream session status. You can specify one status in each request to retrieve only
        # sessions that are currently in that status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @identifier : String,
          @export_files_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListStreamSessionsOutput
        include JSON::Serializable

        # A collection of Amazon GameLift Streams stream sessions that are associated with a stream group and
        # returned in response to a list request. Each item includes stream session metadata and status.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::StreamSessionSummary)?

        # A token that marks the start of the next sequential page of results. If an operation doesn't return
        # a token, you've reached the end of the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::StreamSessionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that you want to retrieve tags for. To get an Amazon GameLift Streams
        # resource ARN, call a List or Get operation for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A collection of tags that have been assigned to the specified resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Configuration settings that define a stream group's stream capacity for a location. When configuring
      # a location for the first time, you must specify a numeric value for at least one of the two capacity
      # types. To update the capacity for an existing stream group, call UpdateStreamGroup . To add a new
      # location and specify its capacity, call AddStreamGroupLocations .

      struct LocationConfiguration
        include JSON::Serializable

        # A location's name. For example, us-east-1 . For a complete list of locations that Amazon GameLift
        # Streams supports, refer to Regions, quotas, and limitations in the Amazon GameLift Streams Developer
        # Guide .

        @[JSON::Field(key: "LocationName")]
        getter location_name : String

        # This setting, if non-zero, indicates minimum streaming capacity which is allocated to you and is
        # never released back to the service. You pay for this base level of capacity at all times, whether
        # used or idle.

        @[JSON::Field(key: "AlwaysOnCapacity")]
        getter always_on_capacity : Int32?

        # This indicates the maximum capacity that the service can allocate for you. Newly created streams may
        # take a few minutes to start. Capacity is released back to the service when idle. You pay for
        # capacity that is allocated to you until it is released.

        @[JSON::Field(key: "MaximumCapacity")]
        getter maximum_capacity : Int32?

        # This field is deprecated. Use MaximumCapacity instead. This parameter cannot be used with
        # MaximumCapacity or TargetIdleCapacity in the same location configuration. The streaming capacity
        # that Amazon GameLift Streams can allocate in response to stream requests, and then de-allocate when
        # the session has terminated. This offers a cost control measure at the expense of a greater startup
        # time (typically under 5 minutes). Default is 0 when creating a stream group or adding a location.

        @[JSON::Field(key: "OnDemandCapacity")]
        getter on_demand_capacity : Int32?

        # This indicates idle capacity which the service pre-allocates and holds for you in anticipation of
        # future activity. This helps to insulate your users from capacity-allocation delays. You pay for
        # capacity which is held in this intentional idle state.

        @[JSON::Field(key: "TargetIdleCapacity")]
        getter target_idle_capacity : Int32?

        def initialize(
          @location_name : String,
          @always_on_capacity : Int32? = nil,
          @maximum_capacity : Int32? = nil,
          @on_demand_capacity : Int32? = nil,
          @target_idle_capacity : Int32? = nil
        )
        end
      end

      # Represents a location and its corresponding stream capacity and status.

      struct LocationState
        include JSON::Serializable

        # This value is the stream capacity that Amazon GameLift Streams has provisioned in a stream group
        # that can respond immediately to stream requests. It includes resources that are currently streaming
        # and resources that are idle and ready to respond to stream requests. When target-idle capacity is
        # configured, the idle resources include the capacity buffer maintained beyond ongoing sessions. You
        # pay for this capacity whether it's in use or not. After making changes to capacity, it can take a
        # few minutes for the allocated capacity count to reflect the change while compute resources are
        # allocated or deallocated. Similarly, when allocated on-demand capacity is no longer needed, it can
        # take a few minutes for Amazon GameLift Streams to spin down the allocated capacity.

        @[JSON::Field(key: "AllocatedCapacity")]
        getter allocated_capacity : Int32?

        # This setting, if non-zero, indicates minimum streaming capacity which is allocated to you and is
        # never released back to the service. You pay for this base level of capacity at all times, whether
        # used or idle.

        @[JSON::Field(key: "AlwaysOnCapacity")]
        getter always_on_capacity : Int32?

        # This value is the amount of allocated capacity that is not currently streaming. It represents the
        # stream group's ability to respond immediately to new stream requests with near-instant startup time.

        @[JSON::Field(key: "IdleCapacity")]
        getter idle_capacity : Int32?

        # A location's name. For example, us-east-1 . For a complete list of locations that Amazon GameLift
        # Streams supports, refer to Regions, quotas, and limitations in the Amazon GameLift Streams Developer
        # Guide .

        @[JSON::Field(key: "LocationName")]
        getter location_name : String?

        # This indicates the maximum capacity that the service can allocate for you. Newly created streams may
        # take a few minutes to start. Capacity is released back to the service when idle. You pay for
        # capacity that is allocated to you until it is released.

        @[JSON::Field(key: "MaximumCapacity")]
        getter maximum_capacity : Int32?

        # The streaming capacity that Amazon GameLift Streams can allocate in response to stream requests, and
        # then de-allocate when the session has terminated. This offers a cost control measure at the expense
        # of a greater startup time (typically under 5 minutes). Default is 0 when creating a stream group or
        # adding a location.

        @[JSON::Field(key: "OnDemandCapacity")]
        getter on_demand_capacity : Int32?

        # This value is the always-on capacity that you most recently requested for a stream group. You
        # request capacity separately for each location in a stream group. In response to an increase in
        # requested capacity, Amazon GameLift Streams attempts to provision compute resources to make the
        # stream group's allocated capacity meet requested capacity. When always-on capacity is decreased, it
        # can take a few minutes to deprovision allocated capacity to match the requested capacity.

        @[JSON::Field(key: "RequestedCapacity")]
        getter requested_capacity : Int32?

        # This value is set of locations, including their name, current status, and capacities. A location can
        # be in one of the following states: ACTIVATING : Amazon GameLift Streams is preparing the location.
        # You cannot stream from, scale the capacity of, or remove this location yet. ACTIVE : The location is
        # provisioned with initial capacity. You can now stream from, scale the capacity of, or remove this
        # location. ERROR : Amazon GameLift Streams failed to set up this location. The StatusReason field
        # describes the error. You can remove this location and try to add it again. REMOVING : Amazon
        # GameLift Streams is working to remove this location. This will release all provisioned capacity for
        # this location in this stream group.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # This indicates idle capacity which the service pre-allocates and holds for you in anticipation of
        # future activity. This helps to insulate your users from capacity-allocation delays. You pay for
        # capacity which is held in this intentional idle state.

        @[JSON::Field(key: "TargetIdleCapacity")]
        getter target_idle_capacity : Int32?

        def initialize(
          @allocated_capacity : Int32? = nil,
          @always_on_capacity : Int32? = nil,
          @idle_capacity : Int32? = nil,
          @location_name : String? = nil,
          @maximum_capacity : Int32? = nil,
          @on_demand_capacity : Int32? = nil,
          @requested_capacity : Int32? = nil,
          @status : String? = nil,
          @target_idle_capacity : Int32? = nil
        )
        end
      end

      # Configuration settings for sharing the stream session's performance stats with the client

      struct PerformanceStatsConfiguration
        include JSON::Serializable

        # Performance stats for the session are streamed to the client when set to true . Defaults to false .

        @[JSON::Field(key: "SharedWithClient")]
        getter shared_with_client : Bool?

        def initialize(
          @shared_with_client : Bool? = nil
        )
        end
      end


      struct RemoveStreamGroupLocationsInput
        include JSON::Serializable

        # A stream group to remove the specified locations from. This value is an Amazon Resource Name (ARN)
        # or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # A set of locations to remove this stream group. For example, us-east-1 . For a complete list of
        # locations that Amazon GameLift Streams supports, refer to Regions, quotas, and limitations in the
        # Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "locations")]
        getter locations : Array(String)

        def initialize(
          @identifier : String,
          @locations : Array(String)
        )
        end
      end

      # Represents the status of the replication of an application to a location. An application cannot be
      # streamed from a location until it has finished replicating there.

      struct ReplicationStatus
        include JSON::Serializable

        # A location's name. For example, us-east-1 . For a complete list of locations that Amazon GameLift
        # Streams supports, refer to Regions, quotas, and limitations in the Amazon GameLift Streams Developer
        # Guide .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The current status of the replication process.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @location : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The resource specified in the request was not found. Correct the request before you try again.

      struct ResourceNotFoundException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration settings that identify the operating system for an application resource. This can also
      # include a compatibility layer and other drivers. A runtime environment can be one of the following:
      # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
      # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
      # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
      # Version=20230704 )

      struct RuntimeEnvironment
        include JSON::Serializable

        # The operating system and other drivers. For Proton, this also includes the Proton compatibility
        # layer.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Versioned container environment for the application operating system.

        @[JSON::Field(key: "Version")]
        getter version : String

        def initialize(
          @type : String,
          @version : String
        )
        end
      end

      # The request would cause the resource to exceed an allowed service quota. Resolve the issue before
      # you try again.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct StartStreamSessionInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The stream group to run this stream session with. This value is an Amazon Resource Name (ARN) or ID
        # that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The data transport protocol to use for the stream session.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # A WebRTC ICE offer string to use when initializing a WebRTC connection. Typically, the offer is a
        # very long JSON string. Provide the string as a text value in quotes. Amazon GameLift Streams also
        # supports setting the field to "NO_CLIENT_CONNECTION". This will create a session without needing any
        # browser request or Web SDK integration. The session starts up as usual and waits for a reconnection
        # from a browser, which is accomplished using CreateStreamSessionConnection .

        @[JSON::Field(key: "SignalRequest")]
        getter signal_request : String

        # A set of options that you can use to control the stream session runtime environment, expressed as a
        # set of key-value pairs. You can use this to configure the application or stream session details. You
        # can also provide custom environment variables that Amazon GameLift Streams passes to your game
        # client. If you want to debug your application with environment variables, we recommend that you do
        # so in a local environment outside of Amazon GameLift Streams. For more information, refer to the
        # Compatibility Guidance in the troubleshooting section of the Developer Guide.
        # AdditionalEnvironmentVariables and AdditionalLaunchArgs have similar purposes.
        # AdditionalEnvironmentVariables passes data using environment variables; while AdditionalLaunchArgs
        # passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalEnvironmentVariables")]
        getter additional_environment_variables : Hash(String, String)?

        # A list of CLI arguments that are sent to the streaming server when a stream session launches. You
        # can use this to configure the application or stream session details. You can also provide custom
        # arguments that Amazon GameLift Streams passes to your game client. AdditionalEnvironmentVariables
        # and AdditionalLaunchArgs have similar purposes. AdditionalEnvironmentVariables passes data using
        # environment variables; while AdditionalLaunchArgs passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalLaunchArgs")]
        getter additional_launch_args : Array(String)?

        # A unique identifier that represents a client request. The request is idempotent, which ensures that
        # an API request completes only once. When users send a request, Amazon GameLift Streams automatically
        # populates this field.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Length of time (in seconds) that Amazon GameLift Streams should wait for a client to connect or
        # reconnect to the stream session. Applies to both connection and reconnection scenarios. This time
        # span starts when the stream session reaches ACTIVE state. If no client connects before the timeout,
        # Amazon GameLift Streams terminates the stream session. Default value is 120.

        @[JSON::Field(key: "ConnectionTimeoutSeconds")]
        getter connection_timeout_seconds : Int32?

        # A human-readable label for the stream session. You can update this value later.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of locations, in order of priority, where you want Amazon GameLift Streams to start a stream
        # from. For example, us-east-1 . Amazon GameLift Streams selects the location with the next available
        # capacity to start a single stream session in. If this value is empty, Amazon GameLift Streams
        # attempts to start a stream session in the primary location. For a complete list of locations that
        # Amazon GameLift Streams supports, refer to Regions, quotas, and limitations in the Amazon GameLift
        # Streams Developer Guide .

        @[JSON::Field(key: "Locations")]
        getter locations : Array(String)?

        # Configuration settings for sharing the stream session's performance stats with the client

        @[JSON::Field(key: "PerformanceStatsConfiguration")]
        getter performance_stats_configuration : Types::PerformanceStatsConfiguration?

        # The maximum duration of a session. Amazon GameLift Streams will automatically terminate a session
        # after this amount of time has elapsed, regardless of any existing client connections. Default value
        # is 43200 (12 hours).

        @[JSON::Field(key: "SessionLengthSeconds")]
        getter session_length_seconds : Int32?

        # An opaque, unique identifier for an end-user, defined by the developer.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @application_identifier : String,
          @identifier : String,
          @protocol : String,
          @signal_request : String,
          @additional_environment_variables : Hash(String, String)? = nil,
          @additional_launch_args : Array(String)? = nil,
          @client_token : String? = nil,
          @connection_timeout_seconds : Int32? = nil,
          @description : String? = nil,
          @locations : Array(String)? = nil,
          @performance_stats_configuration : Types::PerformanceStatsConfiguration? = nil,
          @session_length_seconds : Int32? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct StartStreamSessionOutput
        include JSON::Serializable

        # A set of options that you can use to control the stream session runtime environment, expressed as a
        # set of key-value pairs. You can use this to configure the application or stream session details. You
        # can also provide custom environment variables that Amazon GameLift Streams passes to your game
        # client. If you want to debug your application with environment variables, we recommend that you do
        # so in a local environment outside of Amazon GameLift Streams. For more information, refer to the
        # Compatibility Guidance in the troubleshooting section of the Developer Guide.
        # AdditionalEnvironmentVariables and AdditionalLaunchArgs have similar purposes.
        # AdditionalEnvironmentVariables passes data using environment variables; while AdditionalLaunchArgs
        # passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalEnvironmentVariables")]
        getter additional_environment_variables : Hash(String, String)?

        # A list of CLI arguments that are sent to the streaming server when a stream session launches. You
        # can use this to configure the application or stream session details. You can also provide custom
        # arguments that Amazon GameLift Streams passes to your game client. AdditionalEnvironmentVariables
        # and AdditionalLaunchArgs have similar purposes. AdditionalEnvironmentVariables passes data using
        # environment variables; while AdditionalLaunchArgs passes data using command-line arguments.

        @[JSON::Field(key: "AdditionalLaunchArgs")]
        getter additional_launch_args : Array(String)?

        # The application streaming in this session. This value is an Amazon Resource Name (ARN) that uniquely
        # identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The Amazon Resource Name (ARN) that's assigned to a stream session resource. When combined with the
        # stream group resource ID, this value uniquely identifies the stream session across all Amazon Web
        # Services Regions. Format is arn:aws:gameliftstreams:[AWS Region]:[AWS account]:streamsession/[stream
        # group resource ID]/[stream session resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The length of time that Amazon GameLift Streams should wait for a client to connect or reconnect to
        # the stream session. This time span starts when the stream session reaches ACTIVE or
        # PENDING_CLIENT_RECONNECTION state. If no client connects (or reconnects) before the timeout, Amazon
        # GameLift Streams terminates the stream session.

        @[JSON::Field(key: "ConnectionTimeoutSeconds")]
        getter connection_timeout_seconds : Int32?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the stream session. You can update this value at any time.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Provides details about the stream session's exported files.

        @[JSON::Field(key: "ExportFilesMetadata")]
        getter export_files_metadata : Types::ExportFilesMetadata?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The location where Amazon GameLift Streams hosts and streams your application. For example,
        # us-east-1 . For a complete list of locations that Amazon GameLift Streams supports, refer to
        # Regions, quotas, and limitations in the Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # Access location for log files that your content generates during a stream session. These log files
        # are uploaded to cloud storage location at the end of a stream session. The Amazon GameLift Streams
        # application resource defines which log files to upload.

        @[JSON::Field(key: "LogFileLocationUri")]
        getter log_file_location_uri : String?

        # The performance stats configuration for the stream session

        @[JSON::Field(key: "PerformanceStatsConfiguration")]
        getter performance_stats_configuration : Types::PerformanceStatsConfiguration?

        # The data transfer protocol in use with the stream session.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The maximum duration of a session. Amazon GameLift Streams will automatically terminate a session
        # after this amount of time has elapsed, regardless of any existing client connections.

        @[JSON::Field(key: "SessionLengthSeconds")]
        getter session_length_seconds : Int32?

        # The WebRTC ICE offer string that a client generates to initiate a connection to the stream session.

        @[JSON::Field(key: "SignalRequest")]
        getter signal_request : String?

        # The WebRTC answer string that the stream server generates in response to the SignalRequest .

        @[JSON::Field(key: "SignalResponse")]
        getter signal_response : String?

        # The current status of the stream session. A stream session is ready for a client to connect when in
        # ACTIVE status. ACTIVATING : The stream session is starting and preparing to stream. ACTIVE : The
        # stream session is ready and waiting for a client connection. A client has ConnectionTimeoutSeconds
        # (specified in StartStreamSession ) from when the session reaches ACTIVE state to establish a
        # connection. If no client connects within this timeframe, the session automatically terminates.
        # CONNECTED : The stream session has a connected client. A session will automatically terminate if
        # there is no user input for 60 minutes, or if the maximum length of a session specified by
        # SessionLengthSeconds in StartStreamSession is exceeded. ERROR : The stream session failed to
        # activate. See StatusReason (returned by GetStreamSession and StartStreamSession ) for more
        # information. PENDING_CLIENT_RECONNECTION : A client has recently disconnected and the stream session
        # is waiting for the client to reconnect. A client has ConnectionTimeoutSeconds (specified in
        # StartStreamSession ) from when the session reaches PENDING_CLIENT_RECONNECTION state to re-establish
        # a connection. If no client connects within this timeframe, the session automatically terminates.
        # RECONNECTING : A client has initiated a reconnect to a session that was in
        # PENDING_CLIENT_RECONNECTION state. TERMINATING : The stream session is ending. TERMINATED : The
        # stream session has ended.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason the stream session is in ERROR status or TERMINATED status. ERROR
        # status reasons: applicationLogS3DestinationError : Could not write the application log to the Amazon
        # S3 bucket that is configured for the streaming application. Make sure the bucket still exists.
        # internalError : An internal service error occurred. Start a new stream session to continue
        # streaming. invalidSignalRequest : The WebRTC signal request that was sent is not valid. When
        # starting or reconnecting to a stream session, use generateSignalRequest in the Amazon GameLift
        # Streams Web SDK to generate a new signal request. placementTimeout : Amazon GameLift Streams could
        # not find available stream capacity to start a stream session. Increase the stream capacity in the
        # stream group or wait until capacity becomes available. TERMINATED status reasons: apiTerminated :
        # The stream session was terminated by an API call to TerminateStreamSession . applicationExit : The
        # streaming application exited or crashed. The stream session was terminated because the application
        # is no longer running. connectionTimeout : The stream session was terminated because the client
        # failed to connect within the connection timeout period specified by ConnectionTimeoutSeconds .
        # idleTimeout : The stream session was terminated because it exceeded the idle timeout period of 60
        # minutes with no user input activity. maxSessionLengthTimeout : The stream session was terminated
        # because it exceeded the maximum session length timeout period specified by SessionLengthSeconds .
        # reconnectionTimeout : The stream session was terminated because the client failed to reconnect
        # within the reconnection timeout period specified by ConnectionTimeoutSeconds after losing
        # connection.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The unique identifier for the Amazon GameLift Streams stream group that is hosting the stream
        # session. Format example: sg-1AB2C3De4 .

        @[JSON::Field(key: "StreamGroupId")]
        getter stream_group_id : String?

        # An opaque, unique identifier for an end-user, defined by the developer.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The URL of an S3 bucket that stores Amazon GameLift Streams WebSDK files. The URL is used to
        # establish connection with the client.

        @[JSON::Field(key: "WebSdkProtocolUrl")]
        getter web_sdk_protocol_url : String?

        def initialize(
          @additional_environment_variables : Hash(String, String)? = nil,
          @additional_launch_args : Array(String)? = nil,
          @application_arn : String? = nil,
          @arn : String? = nil,
          @connection_timeout_seconds : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @export_files_metadata : Types::ExportFilesMetadata? = nil,
          @last_updated_at : Time? = nil,
          @location : String? = nil,
          @log_file_location_uri : String? = nil,
          @performance_stats_configuration : Types::PerformanceStatsConfiguration? = nil,
          @protocol : String? = nil,
          @session_length_seconds : Int32? = nil,
          @signal_request : String? = nil,
          @signal_response : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stream_group_id : String? = nil,
          @user_id : String? = nil,
          @web_sdk_protocol_url : String? = nil
        )
        end
      end

      # Describes a Amazon GameLift Streams stream group resource for hosting content streams. To retrieve
      # additional stream group details, call GetStreamGroup .

      struct StreamGroupSummary
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Object that identifies the Amazon GameLift Streams application to stream with this stream group.

        @[JSON::Field(key: "DefaultApplication")]
        getter default_application : Types::DefaultApplication?

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time at which this stream group expires. Timestamps are expressed using in ISO8601 format, such
        # as: 2022-12-27T22:29:40+00:00 (UTC). After this time, you will no longer be able to update this
        # stream group or use it to start stream sessions. Only Get and Delete operations will work on an
        # expired stream group.

        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : Time?

        # An ID that uniquely identifies the stream group resource. Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The current status of the stream group resource. Possible statuses include the following: ACTIVATING
        # : The stream group is deploying and isn't ready to host streams. ACTIVE : The stream group is ready
        # to host streams. ACTIVE_WITH_ERRORS : One or more locations in the stream group are in an error
        # state. Verify the details of individual locations and remove any locations which are in error.
        # DELETING : Amazon GameLift Streams is in the process of deleting the stream group. ERROR : An error
        # occurred when the stream group deployed. See StatusReason (returned by CreateStreamGroup ,
        # GetStreamGroup , and UpdateStreamGroup ) for more information. EXPIRED : The stream group is expired
        # and can no longer host streams. This typically occurs when a stream group is 365 days old, as
        # indicated by the value of ExpiresAt . Create a new stream group to resume streaming capabilities.
        # UPDATING_LOCATIONS : One or more locations in the stream group are in the process of updating
        # (either activating or deleting).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The target stream quality for the stream group. A stream class can be one of the following:
        # gen6n_pro_win2022 (NVIDIA, pro) Supports applications with extremely high 3D scene complexity which
        # require maximum resources. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_pro (NVIDIA, pro) Supports applications with extremely high 3D scene complexity
        # which require maximum resources. Uses dedicated NVIDIA L4 Tensor Core GPU. Reference resolution:
        # 1080p Reference frame rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy:
        # Supports 1 concurrent stream session gen6n_ultra_win2022 (NVIDIA, ultra) Supports applications with
        # high 3D scene complexity. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses
        # dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen6n_medium (NVIDIA, medium) Supports applications with moderate 3D scene complexity. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM Tenancy: Supports up to 4 concurrent stream sessions
        # gen6n_small (NVIDIA, small) Supports applications with lightweight 3D scene complexity and low CPU
        # usage. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM Tenancy: Supports up to 12 concurrent stream
        # sessions gen5n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene
        # complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60
        # fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen5n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen5n_ultra (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity. Uses
        # dedicated NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen4n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity.
        # Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with
        # Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen4n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen4n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses dedicated
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session

        @[JSON::Field(key: "StreamClass")]
        getter stream_class : String?

        def initialize(
          @arn : String,
          @created_at : Time? = nil,
          @default_application : Types::DefaultApplication? = nil,
          @description : String? = nil,
          @expires_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @stream_class : String? = nil
        )
        end
      end

      # Describes an Amazon GameLift Streams stream session. To retrieve additional details for the stream
      # session, call GetStreamSession .

      struct StreamSessionSummary
        include JSON::Serializable

        # An Amazon Resource Name (ARN) that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # An Amazon Resource Name (ARN) that uniquely identifies the stream session resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567 .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Provides details about the stream session's exported files.

        @[JSON::Field(key: "ExportFilesMetadata")]
        getter export_files_metadata : Types::ExportFilesMetadata?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The location where Amazon GameLift Streams hosts and streams your application. For example,
        # us-east-1 . For a complete list of locations that Amazon GameLift Streams supports, refer to
        # Regions, quotas, and limitations in the Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "Location")]
        getter location : String?

        # The data transfer protocol in use with the stream session.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        # The current status of the stream session resource. ACTIVATING : The stream session is starting and
        # preparing to stream. ACTIVE : The stream session is ready and waiting for a client connection. A
        # client has ConnectionTimeoutSeconds (specified in StartStreamSession ) from when the session reaches
        # ACTIVE state to establish a connection. If no client connects within this timeframe, the session
        # automatically terminates. CONNECTED : The stream session has a connected client. A session will
        # automatically terminate if there is no user input for 60 minutes, or if the maximum length of a
        # session specified by SessionLengthSeconds in StartStreamSession is exceeded. ERROR : The stream
        # session failed to activate. See StatusReason (returned by GetStreamSession and StartStreamSession )
        # for more information. PENDING_CLIENT_RECONNECTION : A client has recently disconnected and the
        # stream session is waiting for the client to reconnect. A client has ConnectionTimeoutSeconds
        # (specified in StartStreamSession ) from when the session reaches PENDING_CLIENT_RECONNECTION state
        # to re-establish a connection. If no client connects within this timeframe, the session automatically
        # terminates. RECONNECTING : A client has initiated a reconnect to a session that was in
        # PENDING_CLIENT_RECONNECTION state. TERMINATING : The stream session is ending. TERMINATED : The
        # stream session has ended.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason the stream session is in ERROR status or TERMINATED status. ERROR
        # status reasons: applicationLogS3DestinationError : Could not write the application log to the Amazon
        # S3 bucket that is configured for the streaming application. Make sure the bucket still exists.
        # internalError : An internal service error occurred. Start a new stream session to continue
        # streaming. invalidSignalRequest : The WebRTC signal request that was sent is not valid. When
        # starting or reconnecting to a stream session, use generateSignalRequest in the Amazon GameLift
        # Streams Web SDK to generate a new signal request. placementTimeout : Amazon GameLift Streams could
        # not find available stream capacity to start a stream session. Increase the stream capacity in the
        # stream group or wait until capacity becomes available. TERMINATED status reasons: apiTerminated :
        # The stream session was terminated by an API call to TerminateStreamSession . applicationExit : The
        # streaming application exited or crashed. The stream session was terminated because the application
        # is no longer running. connectionTimeout : The stream session was terminated because the client
        # failed to connect within the connection timeout period specified by ConnectionTimeoutSeconds .
        # idleTimeout : The stream session was terminated because it exceeded the idle timeout period of 60
        # minutes with no user input activity. maxSessionLengthTimeout : The stream session was terminated
        # because it exceeded the maximum session length timeout period specified by SessionLengthSeconds .
        # reconnectionTimeout : The stream session was terminated because the client failed to reconnect
        # within the reconnection timeout period specified by ConnectionTimeoutSeconds after losing
        # connection.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # An opaque, unique identifier for an end-user, defined by the developer.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @application_arn : String? = nil,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @export_files_metadata : Types::ExportFilesMetadata? = nil,
          @last_updated_at : Time? = nil,
          @location : String? = nil,
          @protocol : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @user_id : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon GameLift Streams resource that you want to apply tags
        # to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags, in the form of key-value pairs, to assign to the specified Amazon GameLift Streams
        # resource.

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


      struct TerminateStreamSessionInput
        include JSON::Serializable

        # Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .
        # The stream group that runs this stream session.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Amazon Resource Name (ARN) or ID that uniquely identifies the stream session resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamsession/sg-1AB2C3De4/ABC123def4567 . Example
        # ID: ABC123def4567 .

        @[JSON::Field(key: "StreamSessionIdentifier")]
        getter stream_session_identifier : String

        def initialize(
          @identifier : String,
          @stream_session_identifier : String
        )
        end
      end

      # The request was denied due to request throttling. Retry the request after the suggested wait time.

      struct ThrottlingException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon GameLift Streams resource that you want to remove tags
        # from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the specified Amazon GameLift Streams resource.

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


      struct UpdateApplicationInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to save application logs.
        # Required if you specify one or more ApplicationLogPaths . The log bucket must have permissions that
        # give Amazon GameLift Streams access to write the log files. For more information, see Application
        # log bucket permission policy in the Amazon GameLift Streams Developer Guide .

        @[JSON::Field(key: "ApplicationLogOutputUri")]
        getter application_log_output_uri : String?

        # Locations of log files that your content generates during a stream session. Enter path values that
        # are relative to the ApplicationSourceUri location. You can specify up to 10 log paths. Amazon
        # GameLift Streams uploads designated log files to the Amazon S3 bucket that you specify in
        # ApplicationLogOutputUri at the end of a stream session. To retrieve stored log files, call
        # GetStreamSession and get the LogFileLocationUri .

        @[JSON::Field(key: "ApplicationLogPaths")]
        getter application_log_paths : Array(String)?

        # A human-readable label for the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @identifier : String,
          @application_log_output_uri : String? = nil,
          @application_log_paths : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateApplicationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that's assigned to an application resource and uniquely identifies it
        # across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS Region]:[AWS
        # account]:application/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An Amazon S3 URI to a bucket where you would like Amazon GameLift Streams to save application logs.
        # Required if you specify one or more ApplicationLogPaths .

        @[JSON::Field(key: "ApplicationLogOutputUri")]
        getter application_log_output_uri : String?

        # Locations of log files that your content generates during a stream session. Amazon GameLift Streams
        # uploads log files to the Amazon S3 bucket that you specify in ApplicationLogOutputUri at the end of
        # a stream session. To retrieve stored log files, call GetStreamSession and get the LogFileLocationUri
        # .

        @[JSON::Field(key: "ApplicationLogPaths")]
        getter application_log_paths : Array(String)?

        # The original Amazon S3 location of uploaded stream content for the application.

        @[JSON::Field(key: "ApplicationSourceUri")]
        getter application_source_uri : String?

        # A set of stream groups that this application is associated with. You can use any of these stream
        # groups to stream your application. This value is a set of Amazon Resource Names (ARNs) that uniquely
        # identify stream group resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 .

        @[JSON::Field(key: "AssociatedStreamGroups")]
        getter associated_stream_groups : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # A human-readable label for the application. You can edit this value.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The relative path and file name of the executable file that launches the content for streaming.

        @[JSON::Field(key: "ExecutablePath")]
        getter executable_path : String?

        # A unique ID value that is assigned to the resource when it's created. Format example: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # A set of replication statuses for each location.

        @[JSON::Field(key: "ReplicationStatuses")]
        getter replication_statuses : Array(Types::ReplicationStatus)?

        # Configuration settings that identify the operating system for an application resource. This can also
        # include a compatibility layer and other drivers. A runtime environment can be one of the following:
        # For Linux applications Ubuntu 22.04 LTS ( Type=UBUNTU, Version=22_04_LTS ) For Windows applications
        # Microsoft Windows Server 2022 Base ( Type=WINDOWS, Version=2022 ) Proton 9.0-2 ( Type=PROTON,
        # Version=20250516 ) Proton 8.0-5 ( Type=PROTON, Version=20241007 ) Proton 8.0-2c ( Type=PROTON,
        # Version=20230704 )

        @[JSON::Field(key: "RuntimeEnvironment")]
        getter runtime_environment : Types::RuntimeEnvironment?

        # The current status of the application resource. Possible statuses include the following: INITIALIZED
        # : Amazon GameLift Streams has received the request and is initiating the work flow to create an
        # application. PROCESSING : The create application work flow is in process. Amazon GameLift Streams is
        # copying the content and caching for future deployment in a stream group. READY : The application is
        # ready to deploy in a stream group. ERROR : An error occurred when setting up the application. See
        # StatusReason for more information. DELETING : Amazon GameLift Streams is in the process of deleting
        # the application.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the status reason when the application is in ERROR status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @arn : String,
          @application_log_output_uri : String? = nil,
          @application_log_paths : Array(String)? = nil,
          @application_source_uri : String? = nil,
          @associated_stream_groups : Array(String)? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @executable_path : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @replication_statuses : Array(Types::ReplicationStatus)? = nil,
          @runtime_environment : Types::RuntimeEnvironment? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct UpdateStreamGroupInput
        include JSON::Serializable

        # An Amazon Resource Name (ARN) or ID that uniquely identifies the stream group resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:streamgroup/sg-1AB2C3De4 . Example ID: sg-1AB2C3De4 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # The unique identifier of the Amazon GameLift Streams application that you want to set as the default
        # application in a stream group. The application that you specify must be in READY status. The default
        # application is pre-cached on always-on compute resources, reducing stream startup times. Other
        # applications are automatically cached as needed. Note that this parameter only sets the default
        # application in a stream group. To associate a new application to an existing stream group, you must
        # use AssociateApplications . When you switch default applications in a stream group, it can take up
        # to a few hours for the new default application to be pre-cached. This value is an Amazon Resource
        # Name (ARN) or ID that uniquely identifies the application resource. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 . Example ID: a-9ZY8X7Wv6 .

        @[JSON::Field(key: "DefaultApplicationIdentifier")]
        getter default_application_identifier : String?

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A set of one or more locations and the streaming capacity for each location.

        @[JSON::Field(key: "LocationConfigurations")]
        getter location_configurations : Array(Types::LocationConfiguration)?

        def initialize(
          @identifier : String,
          @default_application_identifier : String? = nil,
          @description : String? = nil,
          @location_configurations : Array(Types::LocationConfiguration)? = nil
        )
        end
      end


      struct UpdateStreamGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is assigned to the stream group resource and that uniquely
        # identifies the group across all Amazon Web Services Regions. Format is arn:aws:gameliftstreams:[AWS
        # Region]:[AWS account]:streamgroup/[resource ID] .

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A set of applications that this stream group is associated with. You can stream any of these
        # applications with the stream group. This value is a set of Amazon Resource Names (ARNs) that
        # uniquely identify application resources. Example ARN:
        # arn:aws:gameliftstreams:us-west-2:111122223333:application/a-9ZY8X7Wv6 .

        @[JSON::Field(key: "AssociatedApplications")]
        getter associated_applications : Array(String)?

        # A timestamp that indicates when this resource was created. Timestamps are expressed using in ISO8601
        # format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The default Amazon GameLift Streams application that is associated with this stream group.

        @[JSON::Field(key: "DefaultApplication")]
        getter default_application : Types::DefaultApplication?

        # A descriptive label for the stream group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time at which this stream group expires. Timestamps are expressed using in ISO8601 format, such
        # as: 2022-12-27T22:29:40+00:00 (UTC). After this time, you will no longer be able to update this
        # stream group or use it to start stream sessions. Only Get and Delete operations will work on an
        # expired stream group.

        @[JSON::Field(key: "ExpiresAt")]
        getter expires_at : Time?

        # A unique ID value that is assigned to the resource when it's created. Format example: sg-1AB2C3De4 .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A timestamp that indicates when this resource was last updated. Timestamps are expressed using in
        # ISO8601 format, such as: 2022-12-27T22:29:40+00:00 (UTC).

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # This value is set of locations, including their name, current status, and capacities. A location can
        # be in one of the following states: ACTIVATING : Amazon GameLift Streams is preparing the location.
        # You cannot stream from, scale the capacity of, or remove this location yet. ACTIVE : The location is
        # provisioned with initial capacity. You can now stream from, scale the capacity of, or remove this
        # location. ERROR : Amazon GameLift Streams failed to set up this location. The StatusReason field
        # describes the error. You can remove this location and try to add it again. REMOVING : Amazon
        # GameLift Streams is working to remove this location. This will release all provisioned capacity for
        # this location in this stream group.

        @[JSON::Field(key: "LocationStates")]
        getter location_states : Array(Types::LocationState)?

        # The current status of the stream group resource. Possible statuses include the following: ACTIVATING
        # : The stream group is deploying and isn't ready to host streams. ACTIVE : The stream group is ready
        # to host streams. ACTIVE_WITH_ERRORS : One or more locations in the stream group are in an error
        # state. Verify the details of individual locations and remove any locations which are in error.
        # DELETING : Amazon GameLift Streams is in the process of deleting the stream group. ERROR : An error
        # occurred when the stream group deployed. See StatusReason (returned by CreateStreamGroup ,
        # GetStreamGroup , and UpdateStreamGroup ) for more information. EXPIRED : The stream group is expired
        # and can no longer host streams. This typically occurs when a stream group is 365 days old, as
        # indicated by the value of ExpiresAt . Create a new stream group to resume streaming capabilities.
        # UPDATING_LOCATIONS : One or more locations in the stream group are in the process of updating
        # (either activating or deleting).

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A short description of the reason that the stream group is in ERROR status. The possible reasons can
        # be one of the following: internalError : The request can't process right now because of an issue
        # with the server. Try again later. noAvailableInstances : Amazon GameLift Streams does not currently
        # have enough available capacity to fulfill your request. Wait a few minutes and retry the request as
        # capacity can shift frequently. You can also try to make the request using a different stream class
        # or in another region.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The target stream quality for the stream group. A stream class can be one of the following:
        # gen6n_pro_win2022 (NVIDIA, pro) Supports applications with extremely high 3D scene complexity which
        # require maximum resources. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_pro (NVIDIA, pro) Supports applications with extremely high 3D scene complexity
        # which require maximum resources. Uses dedicated NVIDIA L4 Tensor Core GPU. Reference resolution:
        # 1080p Reference frame rate: 60 fps Workload specifications: 16 vCPUs, 64 GB RAM, 24 GB VRAM Tenancy:
        # Supports 1 concurrent stream session gen6n_ultra_win2022 (NVIDIA, ultra) Supports applications with
        # high 3D scene complexity. Runs applications on Microsoft Windows Server 2022 Base and supports
        # DirectX 12. Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and
        # anti-cheat technology. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame
        # rate: 60 fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent
        # stream session gen6n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses
        # dedicated NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen6n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen6n_medium (NVIDIA, medium) Supports applications with moderate 3D scene complexity. Uses NVIDIA
        # L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 2 vCPUs, 8 GB RAM, 6 GB VRAM Tenancy: Supports up to 4 concurrent stream sessions
        # gen6n_small (NVIDIA, small) Supports applications with lightweight 3D scene complexity and low CPU
        # usage. Uses NVIDIA L4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 1 vCPUs, 4 GB RAM, 2 GB VRAM Tenancy: Supports up to 12 concurrent stream
        # sessions gen5n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene
        # complexity. Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12.
        # Compatible with Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat
        # technology. Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60
        # fps Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen5n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity.
        # Uses NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 12 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen5n_ultra (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity. Uses
        # dedicated NVIDIA A10G Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps
        # Workload specifications: 8 vCPUs, 32 GB RAM, 24 GB VRAM Tenancy: Supports 1 concurrent stream
        # session gen4n_win2022 (NVIDIA, ultra) Supports applications with extremely high 3D scene complexity.
        # Runs applications on Microsoft Windows Server 2022 Base and supports DirectX 12. Compatible with
        # Unreal Engine versions up through 5.6, 32 and 64-bit applications, and anti-cheat technology. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session
        # gen4n_high (NVIDIA, high) Supports applications with moderate to high 3D scene complexity. Uses
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 4 vCPUs, 16 GB RAM, 8 GB VRAM Tenancy: Supports up to 2 concurrent stream sessions
        # gen4n_ultra (NVIDIA, ultra) Supports applications with high 3D scene complexity. Uses dedicated
        # NVIDIA T4 Tensor Core GPU. Reference resolution: 1080p Reference frame rate: 60 fps Workload
        # specifications: 8 vCPUs, 32 GB RAM, 16 GB VRAM Tenancy: Supports 1 concurrent stream session

        @[JSON::Field(key: "StreamClass")]
        getter stream_class : String?

        def initialize(
          @arn : String,
          @associated_applications : Array(String)? = nil,
          @created_at : Time? = nil,
          @default_application : Types::DefaultApplication? = nil,
          @description : String? = nil,
          @expires_at : Time? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @location_states : Array(Types::LocationState)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stream_class : String? = nil
        )
        end
      end

      # One or more parameter values in the request fail to satisfy the specified constraints. Correct the
      # invalid parameter values before retrying the request.

      struct ValidationException
        include JSON::Serializable

        # Description of the error.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
