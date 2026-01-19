module AwsSdk
  module GameLiftStreams
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

      # Add locations that can host stream sessions. To add a location, the stream group must be in ACTIVE
      # status. You configure locations and their corresponding capacity for each stream group. Creating a
      # stream group in a location that's nearest to your end users can help minimize latency and improve
      # quality. This operation provisions stream capacity at the specified locations. By default, all
      # locations have 1 or 2 capacity, depending on the stream class option: 2 for 'High' and 1 for 'Ultra'
      # and 'Win2022'. This operation also copies the content files of all associated applications to an
      # internal S3 bucket at each location. This allows Amazon GameLift Streams to host performant stream
      # sessions.
      def add_stream_group_locations(
        identifier : String,
        location_configurations : Array(Types::LocationConfiguration)
      ) : Protocol::Request
        input = Types::AddStreamGroupLocationsInput.new(identifier: identifier, location_configurations: location_configurations)
        add_stream_group_locations(input)
      end
      def add_stream_group_locations(input : Types::AddStreamGroupLocationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_STREAM_GROUP_LOCATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you associate, or link, an application with a stream group, then Amazon GameLift Streams can
      # launch the application using the stream group's allocated compute resources. The stream group must
      # be in ACTIVE status. You can reverse this action by using DisassociateApplications . If a stream
      # group does not already have a linked application, Amazon GameLift Streams will automatically assign
      # the first application provided in ApplicationIdentifiers as the default.
      def associate_applications(
        application_identifiers : Array(String),
        identifier : String
      ) : Protocol::Request
        input = Types::AssociateApplicationsInput.new(application_identifiers: application_identifiers, identifier: identifier)
        associate_applications(input)
      end
      def associate_applications(input : Types::AssociateApplicationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an application resource in Amazon GameLift Streams, which specifies the application content
      # you want to stream, such as a game build or other software, and configures the settings to run it.
      # Before you create an application, upload your application content files to an Amazon Simple Storage
      # Service (Amazon S3) bucket. For more information, see Getting Started in the Amazon GameLift Streams
      # Developer Guide. Make sure that your files in the Amazon S3 bucket are the correct version you want
      # to use. If you change the files at a later time, you will need to create a new Amazon GameLift
      # Streams application. If the request is successful, Amazon GameLift Streams begins to create an
      # application and sets the status to INITIALIZED . When an application reaches READY status, you can
      # use the application to set up stream groups and start streams. To track application status, call
      # GetApplication .
      def create_application(
        application_source_uri : String,
        description : String,
        executable_path : String,
        runtime_environment : Types::RuntimeEnvironment,
        application_log_output_uri : String? = nil,
        application_log_paths : Array(String)? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationInput.new(application_source_uri: application_source_uri, description: description, executable_path: executable_path, runtime_environment: runtime_environment, application_log_output_uri: application_log_output_uri, application_log_paths: application_log_paths, client_token: client_token, tags: tags)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stream groups manage how Amazon GameLift Streams allocates resources and handles concurrent streams,
      # allowing you to effectively manage capacity and costs. Within a stream group, you specify an
      # application to stream, streaming locations and their capacity, and the stream class you want to use
      # when streaming applications to your end-users. A stream class defines the hardware configuration of
      # the compute resources that Amazon GameLift Streams will use when streaming, such as the CPU, GPU,
      # and memory. Stream capacity represents the number of concurrent streams that can be active at a
      # time. You set stream capacity per location, per stream group. The following capacity settings are
      # available: Always-on capacity : This setting, if non-zero, indicates minimum streaming capacity
      # which is allocated to you and is never released back to the service. You pay for this base level of
      # capacity at all times, whether used or idle. Maximum capacity : This indicates the maximum capacity
      # that the service can allocate for you. Newly created streams may take a few minutes to start.
      # Capacity is released back to the service when idle. You pay for capacity that is allocated to you
      # until it is released. Target-idle capacity : This indicates idle capacity which the service
      # pre-allocates and holds for you in anticipation of future activity. This helps to insulate your
      # users from capacity-allocation delays. You pay for capacity which is held in this intentional idle
      # state. Values for capacity must be whole number multiples of the tenancy value of the stream group's
      # stream class. To adjust the capacity of any ACTIVE stream group, call UpdateStreamGroup . If the
      # CreateStreamGroup request is successful, Amazon GameLift Streams assigns a unique ID to the stream
      # group resource and sets the status to ACTIVATING . It can take a few minutes for Amazon GameLift
      # Streams to finish creating the stream group while it searches for unallocated compute resources and
      # provisions them. When complete, the stream group status will be ACTIVE and you can start stream
      # sessions by using StartStreamSession . To check the stream group's status, call GetStreamGroup .
      # Stream groups should be recreated every 3-4 weeks to pick up important service updates and fixes.
      # Stream groups that are older than 180 days can no longer be updated with new application
      # associations. Stream groups expire when they are 365 days old, at which point they can no longer
      # stream sessions. The exact expiration date is indicated by the date value in the ExpiresAt field.
      def create_stream_group(
        description : String,
        stream_class : String,
        client_token : String? = nil,
        default_application_identifier : String? = nil,
        location_configurations : Array(Types::LocationConfiguration)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStreamGroupInput.new(description: description, stream_class: stream_class, client_token: client_token, default_application_identifier: default_application_identifier, location_configurations: location_configurations, tags: tags)
        create_stream_group(input)
      end
      def create_stream_group(input : Types::CreateStreamGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STREAM_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables clients to reconnect to a stream session while preserving all session state and data in the
      # disconnected session. This reconnection process can be initiated when a stream session is in either
      # PENDING_CLIENT_RECONNECTION or ACTIVE status. The process works as follows: Initial disconnect: When
      # a client disconnects or loses connection, the stream session transitions from CONNECTED to
      # PENDING_CLIENT_RECONNECTION Reconnection time window: Clients have ConnectionTimeoutSeconds (defined
      # in StartStreamSession ) to reconnect before session termination Your backend server must call
      # CreateStreamSessionConnection to initiate reconnection Session transitions to RECONNECTING status
      # Reconnection completion: On successful CreateStreamSessionConnection , session status changes to
      # ACTIVE Provide the new connection information to the requesting client Client must establish
      # connection within ConnectionTimeoutSeconds Session terminates automatically if client fails to
      # connect in time For more information about the stream session lifecycle, see Stream sessions in the
      # Amazon GameLift Streams Developer Guide . To begin re-connecting to an existing stream session,
      # specify the stream group ID and stream session ID that you want to reconnect to, and the signal
      # request to use with the stream.
      def create_stream_session_connection(
        identifier : String,
        signal_request : String,
        stream_session_identifier : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateStreamSessionConnectionInput.new(identifier: identifier, signal_request: signal_request, stream_session_identifier: stream_session_identifier, client_token: client_token)
        create_stream_session_connection(input)
      end
      def create_stream_session_connection(input : Types::CreateStreamSessionConnectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STREAM_SESSION_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently deletes an Amazon GameLift Streams application resource. This also deletes the
      # application content files stored with Amazon GameLift Streams. However, this does not delete the
      # original files that you uploaded to your Amazon S3 bucket; you can delete these any time after
      # Amazon GameLift Streams creates an application, which is the only time Amazon GameLift Streams
      # accesses your Amazon S3 bucket. You can only delete an application that meets the following
      # conditions: The application is in READY or ERROR status. You cannot delete an application that's in
      # PROCESSING or INITIALIZED status. The application is not the default application of any stream
      # groups. You must first delete the stream group by using DeleteStreamGroup . The application is not
      # linked to any stream groups. You must first unlink the stream group by using
      # DisassociateApplications . An application is not streaming in any ongoing stream session. You must
      # wait until the client ends the stream session or call TerminateStreamSession to end the stream. If
      # any active stream groups exist for this application, this request returns a ValidationException .
      def delete_application(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteApplicationInput.new(identifier: identifier)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently deletes all compute resources and information related to a stream group. To delete a
      # stream group, specify the unique stream group identifier. During the deletion process, the stream
      # group's status is DELETING . This operation stops streams in progress and prevents new streams from
      # starting. As a best practice, before deleting the stream group, call ListStreamSessions to check for
      # streams in progress and take action to stop them. When you delete a stream group, any application
      # associations referring to that stream group are automatically removed.
      def delete_stream_group(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteStreamGroupInput.new(identifier: identifier)
        delete_stream_group(input)
      end
      def delete_stream_group(input : Types::DeleteStreamGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STREAM_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you disassociate, or unlink, an application from a stream group, you can no longer stream this
      # application by using that stream group's allocated compute resources. Any streams in process will
      # continue until they terminate, which helps avoid interrupting an end-user's stream. Amazon GameLift
      # Streams will not initiate new streams in the stream group using the disassociated application. The
      # disassociate action does not affect the stream capacity of a stream group. To disassociate an
      # application, the stream group must be in ACTIVE status. If you disassociate the default application,
      # Amazon GameLift Streams will automatically choose a new default application from the remaining
      # associated applications. To change which application is the default application, call
      # UpdateStreamGroup and specify a new DefaultApplicationIdentifier .
      def disassociate_applications(
        application_identifiers : Array(String),
        identifier : String
      ) : Protocol::Request
        input = Types::DisassociateApplicationsInput.new(application_identifiers: application_identifiers, identifier: identifier)
        disassociate_applications(input)
      end
      def disassociate_applications(input : Types::DisassociateApplicationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Export the files that your application modifies or generates in a stream session, which can help you
      # debug or verify your application. When your application runs, it generates output files such as
      # logs, diagnostic information, crash dumps, save files, user data, screenshots, and so on. The files
      # can be defined by the engine or frameworks that your application uses, or information that you've
      # programmed your application to output. You can only call this action on a stream session that is in
      # progress, specifically in one of the following statuses ACTIVE , CONNECTED ,
      # PENDING_CLIENT_RECONNECTION , and RECONNECTING . You must provide an Amazon Simple Storage Service
      # (Amazon S3) bucket to store the files in. When the session ends, Amazon GameLift Streams produces a
      # compressed folder that contains all of the files and directories that were modified or created by
      # the application during the stream session. AWS uses your security credentials to authenticate and
      # authorize access to your Amazon S3 bucket. Amazon GameLift Streams collects the following generated
      # and modified files. Find them in the corresponding folders in the .zip archive. application/ : The
      # folder where your application or game is stored. profile/ : The user profile folder. temp/ : The
      # system temp folder. To verify the status of the exported files, use GetStreamSession. To delete the
      # files, delete the object in the S3 bucket.
      def export_stream_session_files(
        identifier : String,
        output_uri : String,
        stream_session_identifier : String
      ) : Protocol::Request
        input = Types::ExportStreamSessionFilesInput.new(identifier: identifier, output_uri: output_uri, stream_session_identifier: stream_session_identifier)
        export_stream_session_files(input)
      end
      def export_stream_session_files(input : Types::ExportStreamSessionFilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_STREAM_SESSION_FILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves properties for an Amazon GameLift Streams application resource. Specify the ID of the
      # application that you want to retrieve. If the operation is successful, it returns properties for the
      # requested application.
      def get_application(
        identifier : String
      ) : Protocol::Request
        input = Types::GetApplicationInput.new(identifier: identifier)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves properties for a Amazon GameLift Streams stream group resource. Specify the ID of the
      # stream group that you want to retrieve. If the operation is successful, it returns properties for
      # the requested stream group.
      def get_stream_group(
        identifier : String
      ) : Protocol::Request
        input = Types::GetStreamGroupInput.new(identifier: identifier)
        get_stream_group(input)
      end
      def get_stream_group(input : Types::GetStreamGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STREAM_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves properties for a Amazon GameLift Streams stream session resource. Specify the Amazon
      # Resource Name (ARN) of the stream session that you want to retrieve and its stream group ARN. If the
      # operation is successful, it returns properties for the requested resource.
      def get_stream_session(
        identifier : String,
        stream_session_identifier : String
      ) : Protocol::Request
        input = Types::GetStreamSessionInput.new(identifier: identifier, stream_session_identifier: stream_session_identifier)
        get_stream_session(input)
      end
      def get_stream_session(input : Types::GetStreamSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STREAM_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all Amazon GameLift Streams applications that are associated with the Amazon Web
      # Services account in use. This operation returns applications in all statuses, in no particular
      # order. You can paginate the results as needed.
      def list_applications(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsInput.new(max_results: max_results, next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of all Amazon GameLift Streams stream groups that are associated with the Amazon
      # Web Services account in use. This operation returns stream groups in all statuses, in no particular
      # order. You can paginate the results as needed.
      def list_stream_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamGroupsInput.new(max_results: max_results, next_token: next_token)
        list_stream_groups(input)
      end
      def list_stream_groups(input : Types::ListStreamGroupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAM_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of Amazon GameLift Streams stream sessions that a stream group is hosting. To
      # retrieve stream sessions, specify the stream group, and optionally filter by stream session status.
      # You can paginate the results as needed. This operation returns the requested stream sessions in no
      # particular order.
      def list_stream_sessions(
        identifier : String,
        export_files_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamSessionsInput.new(identifier: identifier, export_files_status: export_files_status, max_results: max_results, next_token: next_token, status: status)
        list_stream_sessions(input)
      end
      def list_stream_sessions(input : Types::ListStreamSessionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAM_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of Amazon GameLift Streams stream sessions that this user account has access to. In
      # the returned list of stream sessions, the ExportFilesMetadata property only shows the Status value.
      # To get the OutpurUri and StatusReason values, use GetStreamSession . We don't recommend using this
      # operation to regularly check stream session statuses because it's costly. Instead, to check status
      # updates for a specific stream session, use GetStreamSession .
      def list_stream_sessions_by_account(
        export_files_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListStreamSessionsByAccountInput.new(export_files_status: export_files_status, max_results: max_results, next_token: next_token, status: status)
        list_stream_sessions_by_account(input)
      end
      def list_stream_sessions_by_account(input : Types::ListStreamSessionsByAccountInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STREAM_SESSIONS_BY_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all tags assigned to a Amazon GameLift Streams resource. To list tags for a resource,
      # specify the ARN value for the resource. Learn more Tagging Amazon Web Services Resources in the
      # Amazon Web Services General Reference Amazon Web Services Tagging Strategies
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a set of remote locations from this stream group. To remove a location, the stream group
      # must be in ACTIVE status. When you remove a location, Amazon GameLift Streams releases allocated
      # compute resources in that location. Stream sessions can no longer start from removed locations in a
      # stream group. Amazon GameLift Streams also deletes the content files of all associated applications
      # that were in Amazon GameLift Streams's internal Amazon S3 bucket at this location. You cannot remove
      # the Amazon Web Services Region location where you initially created this stream group, known as the
      # primary location. However, you can set the stream capacity to zero to avoid incurring costs for
      # allocated compute resources in that location.
      def remove_stream_group_locations(
        identifier : String,
        locations : Array(String)
      ) : Protocol::Request
        input = Types::RemoveStreamGroupLocationsInput.new(identifier: identifier, locations: locations)
        remove_stream_group_locations(input)
      end
      def remove_stream_group_locations(input : Types::RemoveStreamGroupLocationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_STREAM_GROUP_LOCATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action initiates a new stream session and outputs connection information that clients can use
      # to access the stream. A stream session refers to an instance of a stream that Amazon GameLift
      # Streams transmits from the server to the end-user. A stream session runs on a compute resource that
      # a stream group has allocated. The start stream session process works as follows: Prerequisites: You
      # must have a stream group in ACTIVE status You must have idle or on-demand capacity in a stream group
      # in the location you want to stream from You must have at least one application associated to the
      # stream group (use AssociateApplications if needed) Start stream request: Your backend server calls
      # StartStreamSession to initiate connection Amazon GameLift Streams creates the stream session
      # resource, assigns an Amazon Resource Name (ARN) value, and begins searching for available stream
      # capacity to run the stream Session transitions to ACTIVATING status Placement completion: If Amazon
      # GameLift Streams is successful in finding capacity for the stream, the stream session status changes
      # to ACTIVE status and StartStreamSession returns stream connection information If Amazon GameLift
      # Streams was not successful in finding capacity within the placement timeout period (defined
      # according to the capacity type and platform type), the stream session status changes to ERROR status
      # and StartStreamSession returns a StatusReason of placementTimeout Connection completion: Provide the
      # new connection information to the requesting client Client must establish connection within
      # ConnectionTimeoutSeconds (specified in StartStreamSession parameters) Session terminates
      # automatically if client fails to connect in time For more information about the stream session
      # lifecycle, see Stream sessions in the Amazon GameLift Streams Developer Guide . Timeouts to be aware
      # of that affect a stream session: Placement timeout : The amount of time that Amazon GameLift Streams
      # has to find capacity for a stream request. Placement timeout varies based on the capacity type used
      # to fulfill your stream request: Always-on capacity : 75 seconds On-demand capacity : Linux/Proton
      # runtimes: 90 seconds Windows runtime: 10 minutes Connection timeout : The amount of time that Amazon
      # GameLift Streams waits for a client to connect to a stream session in ACTIVE status, or reconnect to
      # a stream session in PENDING_CLIENT_RECONNECTION status, the latter of which occurs when a client
      # disconnects or loses connection from a stream session. If no client connects before the timeout,
      # Amazon GameLift Streams terminates the stream session. This value is specified by
      # ConnectionTimeoutSeconds in the StartStreamSession parameters. Idle timeout : A stream session will
      # be terminated if no user input has been received for 60 minutes. Maximum session length : A stream
      # session will be terminated after this amount of time has elapsed since it started, regardless of any
      # existing client connections. This value is specified by SessionLengthSeconds in the
      # StartStreamSession parameters. To start a new stream session, specify a stream group ID and
      # application ID, along with the transport protocol and signal request to use with the stream session.
      # For stream groups that have multiple locations, provide a set of locations ordered by priority using
      # a Locations parameter. Amazon GameLift Streams will start a single stream session in the next
      # available location. An application must be finished replicating to a remote location before the
      # remote location can host a stream. To reconnect to a stream session after a client disconnects or
      # loses connection, use CreateStreamSessionConnection .
      def start_stream_session(
        application_identifier : String,
        identifier : String,
        protocol : String,
        signal_request : String,
        additional_environment_variables : Hash(String, String)? = nil,
        additional_launch_args : Array(String)? = nil,
        client_token : String? = nil,
        connection_timeout_seconds : Int32? = nil,
        description : String? = nil,
        locations : Array(String)? = nil,
        performance_stats_configuration : Types::PerformanceStatsConfiguration? = nil,
        session_length_seconds : Int32? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::StartStreamSessionInput.new(application_identifier: application_identifier, identifier: identifier, protocol: protocol, signal_request: signal_request, additional_environment_variables: additional_environment_variables, additional_launch_args: additional_launch_args, client_token: client_token, connection_timeout_seconds: connection_timeout_seconds, description: description, locations: locations, performance_stats_configuration: performance_stats_configuration, session_length_seconds: session_length_seconds, user_id: user_id)
        start_stream_session(input)
      end
      def start_stream_session(input : Types::StartStreamSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_STREAM_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags to a Amazon GameLift Streams resource. Use tags to organize Amazon Web
      # Services resources for a range of purposes. You can assign tags to the following Amazon GameLift
      # Streams resource types: Application StreamGroup Learn more Tagging Amazon Web Services Resources in
      # the Amazon Web Services General Reference Amazon Web Services Tagging Strategies
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently terminates an active stream session. When called, the stream session status changes to
      # TERMINATING . You can terminate a stream session in any status except ACTIVATING . If the stream
      # session is in ACTIVATING status, an exception is thrown.
      def terminate_stream_session(
        identifier : String,
        stream_session_identifier : String
      ) : Protocol::Request
        input = Types::TerminateStreamSessionInput.new(identifier: identifier, stream_session_identifier: stream_session_identifier)
        terminate_stream_session(input)
      end
      def terminate_stream_session(input : Types::TerminateStreamSessionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_STREAM_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from a Amazon GameLift Streams resource. To remove tags, specify the Amazon
      # GameLift Streams resource and a list of one or more tags to remove.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the mutable configuration settings for a Amazon GameLift Streams application resource. You
      # can change the Description , ApplicationLogOutputUri , and ApplicationLogPaths . To update
      # application settings, specify the application ID and provide the new values. If the operation is
      # successful, it returns the complete updated set of settings for the application.
      def update_application(
        identifier : String,
        application_log_output_uri : String? = nil,
        application_log_paths : Array(String)? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationInput.new(identifier: identifier, application_log_output_uri: application_log_output_uri, application_log_paths: application_log_paths, description: description)
        update_application(input)
      end
      def update_application(input : Types::UpdateApplicationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration settings for an Amazon GameLift Streams stream group resource. To update a
      # stream group, it must be in ACTIVE status. You can change the description, the set of locations, and
      # the requested capacity of a stream group per location. If you want to change the stream class,
      # create a new stream group. Stream capacity represents the number of concurrent streams that can be
      # active at a time. You set stream capacity per location, per stream group. The following capacity
      # settings are available: Always-on capacity : This setting, if non-zero, indicates minimum streaming
      # capacity which is allocated to you and is never released back to the service. You pay for this base
      # level of capacity at all times, whether used or idle. Maximum capacity : This indicates the maximum
      # capacity that the service can allocate for you. Newly created streams may take a few minutes to
      # start. Capacity is released back to the service when idle. You pay for capacity that is allocated to
      # you until it is released. Target-idle capacity : This indicates idle capacity which the service
      # pre-allocates and holds for you in anticipation of future activity. This helps to insulate your
      # users from capacity-allocation delays. You pay for capacity which is held in this intentional idle
      # state. Values for capacity must be whole number multiples of the tenancy value of the stream group's
      # stream class. To update a stream group, specify the stream group's Amazon Resource Name (ARN) and
      # provide the new values. If the request is successful, Amazon GameLift Streams returns the complete
      # updated metadata for the stream group. Expired stream groups cannot be updated.
      def update_stream_group(
        identifier : String,
        default_application_identifier : String? = nil,
        description : String? = nil,
        location_configurations : Array(Types::LocationConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateStreamGroupInput.new(identifier: identifier, default_application_identifier: default_application_identifier, description: description, location_configurations: location_configurations)
        update_stream_group(input)
      end
      def update_stream_group(input : Types::UpdateStreamGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STREAM_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
