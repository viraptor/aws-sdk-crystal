module AwsSdk
  module MigrationHub
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Associates a created artifact of an AWS cloud resource, the target receiving the migration, with the
      # migration task performed by a migration tool. This API has the following traits: Migration tools can
      # call the AssociateCreatedArtifact operation to indicate which AWS artifact is associated with a
      # migration task. The created artifact name must be provided in ARN (Amazon Resource Name) format
      # which will contain information about type and region; for example:
      # arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b . Examples of the AWS resource behind the
      # created artifact are, AMI's, EC2 instance, or DMS endpoint, etc.

      def associate_created_artifact(
        created_artifact : Types::CreatedArtifact,
        migration_task_name : String,
        progress_update_stream : String,
        dry_run : Bool? = nil
      ) : Types::AssociateCreatedArtifactResult

        input = Types::AssociateCreatedArtifactRequest.new(created_artifact: created_artifact, migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, dry_run: dry_run)
        associate_created_artifact(input)
      end

      def associate_created_artifact(input : Types::AssociateCreatedArtifactRequest) : Types::AssociateCreatedArtifactResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_CREATED_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateCreatedArtifactResult, "AssociateCreatedArtifact")
      end

      # Associates a discovered resource ID from Application Discovery Service with a migration task.

      def associate_discovered_resource(
        discovered_resource : Types::DiscoveredResource,
        migration_task_name : String,
        progress_update_stream : String,
        dry_run : Bool? = nil
      ) : Types::AssociateDiscoveredResourceResult

        input = Types::AssociateDiscoveredResourceRequest.new(discovered_resource: discovered_resource, migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, dry_run: dry_run)
        associate_discovered_resource(input)
      end

      def associate_discovered_resource(input : Types::AssociateDiscoveredResourceRequest) : Types::AssociateDiscoveredResourceResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_DISCOVERED_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateDiscoveredResourceResult, "AssociateDiscoveredResource")
      end

      # Associates a source resource with a migration task. For example, the source resource can be a source
      # server, an application, or a migration wave.

      def associate_source_resource(
        migration_task_name : String,
        progress_update_stream : String,
        source_resource : Types::SourceResource,
        dry_run : Bool? = nil
      ) : Types::AssociateSourceResourceResult

        input = Types::AssociateSourceResourceRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, source_resource: source_resource, dry_run: dry_run)
        associate_source_resource(input)
      end

      def associate_source_resource(input : Types::AssociateSourceResourceRequest) : Types::AssociateSourceResourceResult
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_SOURCE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateSourceResourceResult, "AssociateSourceResource")
      end

      # Creates a progress update stream which is an AWS resource used for access control as well as a
      # namespace for migration task names that is implicitly linked to your AWS account. It must uniquely
      # identify the migration tool as it is used for all updates made by the tool; however, it does not
      # need to be unique for each AWS account because it is scoped to the AWS account.

      def create_progress_update_stream(
        progress_update_stream_name : String,
        dry_run : Bool? = nil
      ) : Types::CreateProgressUpdateStreamResult

        input = Types::CreateProgressUpdateStreamRequest.new(progress_update_stream_name: progress_update_stream_name, dry_run: dry_run)
        create_progress_update_stream(input)
      end

      def create_progress_update_stream(input : Types::CreateProgressUpdateStreamRequest) : Types::CreateProgressUpdateStreamResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROGRESS_UPDATE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProgressUpdateStreamResult, "CreateProgressUpdateStream")
      end

      # Deletes a progress update stream, including all of its tasks, which was previously created as an AWS
      # resource used for access control. This API has the following traits: The only parameter needed for
      # DeleteProgressUpdateStream is the stream name (same as a CreateProgressUpdateStream call). The call
      # will return, and a background process will asynchronously delete the stream and all of its resources
      # (tasks, associated resources, resource attributes, created artifacts). If the stream takes time to
      # be deleted, it might still show up on a ListProgressUpdateStreams call. CreateProgressUpdateStream ,
      # ImportMigrationTask , NotifyMigrationTaskState , and all Associate[*] APIs related to the tasks
      # belonging to the stream will throw "InvalidInputException" if the stream of the same name is in the
      # process of being deleted. Once the stream and all of its resources are deleted,
      # CreateProgressUpdateStream for a stream of the same name will succeed, and that stream will be an
      # entirely new logical resource (without any resources associated with the old stream).

      def delete_progress_update_stream(
        progress_update_stream_name : String,
        dry_run : Bool? = nil
      ) : Types::DeleteProgressUpdateStreamResult

        input = Types::DeleteProgressUpdateStreamRequest.new(progress_update_stream_name: progress_update_stream_name, dry_run: dry_run)
        delete_progress_update_stream(input)
      end

      def delete_progress_update_stream(input : Types::DeleteProgressUpdateStreamRequest) : Types::DeleteProgressUpdateStreamResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROGRESS_UPDATE_STREAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProgressUpdateStreamResult, "DeleteProgressUpdateStream")
      end

      # Gets the migration status of an application.

      def describe_application_state(
        application_id : String
      ) : Types::DescribeApplicationStateResult

        input = Types::DescribeApplicationStateRequest.new(application_id: application_id)
        describe_application_state(input)
      end

      def describe_application_state(input : Types::DescribeApplicationStateRequest) : Types::DescribeApplicationStateResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APPLICATION_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeApplicationStateResult, "DescribeApplicationState")
      end

      # Retrieves a list of all attributes associated with a specific migration task.

      def describe_migration_task(
        migration_task_name : String,
        progress_update_stream : String
      ) : Types::DescribeMigrationTaskResult

        input = Types::DescribeMigrationTaskRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream)
        describe_migration_task(input)
      end

      def describe_migration_task(input : Types::DescribeMigrationTaskRequest) : Types::DescribeMigrationTaskResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MIGRATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMigrationTaskResult, "DescribeMigrationTask")
      end

      # Disassociates a created artifact of an AWS resource with a migration task performed by a migration
      # tool that was previously associated. This API has the following traits: A migration user can call
      # the DisassociateCreatedArtifacts operation to disassociate a created AWS Artifact from a migration
      # task. The created artifact name must be provided in ARN (Amazon Resource Name) format which will
      # contain information about type and region; for example:
      # arn:aws:ec2:us-east-1:488216288981:image/ami-6d0ba87b . Examples of the AWS resource behind the
      # created artifact are, AMI's, EC2 instance, or RDS instance, etc.

      def disassociate_created_artifact(
        created_artifact_name : String,
        migration_task_name : String,
        progress_update_stream : String,
        dry_run : Bool? = nil
      ) : Types::DisassociateCreatedArtifactResult

        input = Types::DisassociateCreatedArtifactRequest.new(created_artifact_name: created_artifact_name, migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, dry_run: dry_run)
        disassociate_created_artifact(input)
      end

      def disassociate_created_artifact(input : Types::DisassociateCreatedArtifactRequest) : Types::DisassociateCreatedArtifactResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_CREATED_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateCreatedArtifactResult, "DisassociateCreatedArtifact")
      end

      # Disassociate an Application Discovery Service discovered resource from a migration task.

      def disassociate_discovered_resource(
        configuration_id : String,
        migration_task_name : String,
        progress_update_stream : String,
        dry_run : Bool? = nil
      ) : Types::DisassociateDiscoveredResourceResult

        input = Types::DisassociateDiscoveredResourceRequest.new(configuration_id: configuration_id, migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, dry_run: dry_run)
        disassociate_discovered_resource(input)
      end

      def disassociate_discovered_resource(input : Types::DisassociateDiscoveredResourceRequest) : Types::DisassociateDiscoveredResourceResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_DISCOVERED_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateDiscoveredResourceResult, "DisassociateDiscoveredResource")
      end

      # Removes the association between a source resource and a migration task.

      def disassociate_source_resource(
        migration_task_name : String,
        progress_update_stream : String,
        source_resource_name : String,
        dry_run : Bool? = nil
      ) : Types::DisassociateSourceResourceResult

        input = Types::DisassociateSourceResourceRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, source_resource_name: source_resource_name, dry_run: dry_run)
        disassociate_source_resource(input)
      end

      def disassociate_source_resource(input : Types::DisassociateSourceResourceRequest) : Types::DisassociateSourceResourceResult
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_SOURCE_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateSourceResourceResult, "DisassociateSourceResource")
      end

      # Registers a new migration task which represents a server, database, etc., being migrated to AWS by a
      # migration tool. This API is a prerequisite to calling the NotifyMigrationTaskState API as the
      # migration tool must first register the migration task with Migration Hub.

      def import_migration_task(
        migration_task_name : String,
        progress_update_stream : String,
        dry_run : Bool? = nil
      ) : Types::ImportMigrationTaskResult

        input = Types::ImportMigrationTaskRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, dry_run: dry_run)
        import_migration_task(input)
      end

      def import_migration_task(input : Types::ImportMigrationTaskRequest) : Types::ImportMigrationTaskResult
        request = Protocol::JsonRpc.build_request(Model::IMPORT_MIGRATION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportMigrationTaskResult, "ImportMigrationTask")
      end

      # Lists all the migration statuses for your applications. If you use the optional ApplicationIds
      # parameter, only the migration statuses for those applications will be returned.

      def list_application_states(
        application_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApplicationStatesResult

        input = Types::ListApplicationStatesRequest.new(application_ids: application_ids, max_results: max_results, next_token: next_token)
        list_application_states(input)
      end

      def list_application_states(input : Types::ListApplicationStatesRequest) : Types::ListApplicationStatesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_APPLICATION_STATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApplicationStatesResult, "ListApplicationStates")
      end

      # Lists the created artifacts attached to a given migration task in an update stream. This API has the
      # following traits: Gets the list of the created artifacts while migration is taking place. Shows the
      # artifacts created by the migration tool that was associated by the AssociateCreatedArtifact API.
      # Lists created artifacts in a paginated interface.

      def list_created_artifacts(
        migration_task_name : String,
        progress_update_stream : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCreatedArtifactsResult

        input = Types::ListCreatedArtifactsRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, max_results: max_results, next_token: next_token)
        list_created_artifacts(input)
      end

      def list_created_artifacts(input : Types::ListCreatedArtifactsRequest) : Types::ListCreatedArtifactsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_CREATED_ARTIFACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCreatedArtifactsResult, "ListCreatedArtifacts")
      end

      # Lists discovered resources associated with the given MigrationTask .

      def list_discovered_resources(
        migration_task_name : String,
        progress_update_stream : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDiscoveredResourcesResult

        input = Types::ListDiscoveredResourcesRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, max_results: max_results, next_token: next_token)
        list_discovered_resources(input)
      end

      def list_discovered_resources(input : Types::ListDiscoveredResourcesRequest) : Types::ListDiscoveredResourcesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DISCOVERED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDiscoveredResourcesResult, "ListDiscoveredResources")
      end

      # This is a paginated API that returns all the migration-task states for the specified
      # MigrationTaskName and ProgressUpdateStream .

      def list_migration_task_updates(
        migration_task_name : String,
        progress_update_stream : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMigrationTaskUpdatesResult

        input = Types::ListMigrationTaskUpdatesRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, max_results: max_results, next_token: next_token)
        list_migration_task_updates(input)
      end

      def list_migration_task_updates(input : Types::ListMigrationTaskUpdatesRequest) : Types::ListMigrationTaskUpdatesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_MIGRATION_TASK_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMigrationTaskUpdatesResult, "ListMigrationTaskUpdates")
      end

      # Lists all, or filtered by resource name, migration tasks associated with the user account making
      # this call. This API has the following traits: Can show a summary list of the most recent migration
      # tasks. Can show a summary list of migration tasks associated with a given discovered resource. Lists
      # migration tasks in a paginated interface.

      def list_migration_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_name : String? = nil
      ) : Types::ListMigrationTasksResult

        input = Types::ListMigrationTasksRequest.new(max_results: max_results, next_token: next_token, resource_name: resource_name)
        list_migration_tasks(input)
      end

      def list_migration_tasks(input : Types::ListMigrationTasksRequest) : Types::ListMigrationTasksResult
        request = Protocol::JsonRpc.build_request(Model::LIST_MIGRATION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMigrationTasksResult, "ListMigrationTasks")
      end

      # Lists progress update streams associated with the user account making this call.

      def list_progress_update_streams(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProgressUpdateStreamsResult

        input = Types::ListProgressUpdateStreamsRequest.new(max_results: max_results, next_token: next_token)
        list_progress_update_streams(input)
      end

      def list_progress_update_streams(input : Types::ListProgressUpdateStreamsRequest) : Types::ListProgressUpdateStreamsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_PROGRESS_UPDATE_STREAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProgressUpdateStreamsResult, "ListProgressUpdateStreams")
      end

      # Lists all the source resource that are associated with the specified MigrationTaskName and
      # ProgressUpdateStream .

      def list_source_resources(
        migration_task_name : String,
        progress_update_stream : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSourceResourcesResult

        input = Types::ListSourceResourcesRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, max_results: max_results, next_token: next_token)
        list_source_resources(input)
      end

      def list_source_resources(input : Types::ListSourceResourcesRequest) : Types::ListSourceResourcesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_SOURCE_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSourceResourcesResult, "ListSourceResources")
      end

      # Sets the migration state of an application. For a given application identified by the value passed
      # to ApplicationId , its status is set or updated by passing one of three values to Status :
      # NOT_STARTED | IN_PROGRESS | COMPLETED .

      def notify_application_state(
        application_id : String,
        status : String,
        dry_run : Bool? = nil,
        update_date_time : Time? = nil
      ) : Types::NotifyApplicationStateResult

        input = Types::NotifyApplicationStateRequest.new(application_id: application_id, status: status, dry_run: dry_run, update_date_time: update_date_time)
        notify_application_state(input)
      end

      def notify_application_state(input : Types::NotifyApplicationStateRequest) : Types::NotifyApplicationStateResult
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_APPLICATION_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyApplicationStateResult, "NotifyApplicationState")
      end

      # Notifies Migration Hub of the current status, progress, or other detail regarding a migration task.
      # This API has the following traits: Migration tools will call the NotifyMigrationTaskState API to
      # share the latest progress and status. MigrationTaskName is used for addressing updates to the
      # correct target. ProgressUpdateStream is used for access control and to provide a namespace for each
      # migration tool.

      def notify_migration_task_state(
        migration_task_name : String,
        next_update_seconds : Int32,
        progress_update_stream : String,
        task : Types::Task,
        update_date_time : Time,
        dry_run : Bool? = nil
      ) : Types::NotifyMigrationTaskStateResult

        input = Types::NotifyMigrationTaskStateRequest.new(migration_task_name: migration_task_name, next_update_seconds: next_update_seconds, progress_update_stream: progress_update_stream, task: task, update_date_time: update_date_time, dry_run: dry_run)
        notify_migration_task_state(input)
      end

      def notify_migration_task_state(input : Types::NotifyMigrationTaskStateRequest) : Types::NotifyMigrationTaskStateResult
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_MIGRATION_TASK_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyMigrationTaskStateResult, "NotifyMigrationTaskState")
      end

      # Provides identifying details of the resource being migrated so that it can be associated in the
      # Application Discovery Service repository. This association occurs asynchronously after
      # PutResourceAttributes returns. Keep in mind that subsequent calls to PutResourceAttributes will
      # override previously stored attributes. For example, if it is first called with a MAC address, but
      # later, it is desired to add an IP address, it will then be required to call it with both the IP and
      # MAC addresses to prevent overriding the MAC address. Note the instructions regarding the special use
      # case of the ResourceAttributeList parameter when specifying any "VM" related value. Because this is
      # an asynchronous call, it will always return 200, whether an association occurs or not. To confirm if
      # an association was found based on the provided details, call ListDiscoveredResources .

      def put_resource_attributes(
        migration_task_name : String,
        progress_update_stream : String,
        resource_attribute_list : Array(Types::ResourceAttribute),
        dry_run : Bool? = nil
      ) : Types::PutResourceAttributesResult

        input = Types::PutResourceAttributesRequest.new(migration_task_name: migration_task_name, progress_update_stream: progress_update_stream, resource_attribute_list: resource_attribute_list, dry_run: dry_run)
        put_resource_attributes(input)
      end

      def put_resource_attributes(input : Types::PutResourceAttributesRequest) : Types::PutResourceAttributesResult
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourceAttributesResult, "PutResourceAttributes")
      end
    end
  end
end
