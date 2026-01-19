module AwsSdk
  module Deadline
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

      # Assigns a farm membership level to a member.
      def associate_member_to_farm(
        farm_id : String,
        identity_store_id : String,
        membership_level : String,
        principal_id : String,
        principal_type : String
      ) : Protocol::Request
        input = Types::AssociateMemberToFarmRequest.new(farm_id: farm_id, identity_store_id: identity_store_id, membership_level: membership_level, principal_id: principal_id, principal_type: principal_type)
        associate_member_to_farm(input)
      end
      def associate_member_to_farm(input : Types::AssociateMemberToFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MEMBER_TO_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns a fleet membership level to a member.
      def associate_member_to_fleet(
        farm_id : String,
        fleet_id : String,
        identity_store_id : String,
        membership_level : String,
        principal_id : String,
        principal_type : String
      ) : Protocol::Request
        input = Types::AssociateMemberToFleetRequest.new(farm_id: farm_id, fleet_id: fleet_id, identity_store_id: identity_store_id, membership_level: membership_level, principal_id: principal_id, principal_type: principal_type)
        associate_member_to_fleet(input)
      end
      def associate_member_to_fleet(input : Types::AssociateMemberToFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MEMBER_TO_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns a job membership level to a member
      def associate_member_to_job(
        farm_id : String,
        identity_store_id : String,
        job_id : String,
        membership_level : String,
        principal_id : String,
        principal_type : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::AssociateMemberToJobRequest.new(farm_id: farm_id, identity_store_id: identity_store_id, job_id: job_id, membership_level: membership_level, principal_id: principal_id, principal_type: principal_type, queue_id: queue_id)
        associate_member_to_job(input)
      end
      def associate_member_to_job(input : Types::AssociateMemberToJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MEMBER_TO_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns a queue membership level to a member
      def associate_member_to_queue(
        farm_id : String,
        identity_store_id : String,
        membership_level : String,
        principal_id : String,
        principal_type : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::AssociateMemberToQueueRequest.new(farm_id: farm_id, identity_store_id: identity_store_id, membership_level: membership_level, principal_id: principal_id, principal_type: principal_type, queue_id: queue_id)
        associate_member_to_queue(input)
      end
      def associate_member_to_queue(input : Types::AssociateMemberToQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MEMBER_TO_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get Amazon Web Services credentials from the fleet role. The IAM permissions of the credentials are
      # scoped down to have read-only access.
      def assume_fleet_role_for_read(
        farm_id : String,
        fleet_id : String
      ) : Protocol::Request
        input = Types::AssumeFleetRoleForReadRequest.new(farm_id: farm_id, fleet_id: fleet_id)
        assume_fleet_role_for_read(input)
      end
      def assume_fleet_role_for_read(input : Types::AssumeFleetRoleForReadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_FLEET_ROLE_FOR_READ, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get credentials from the fleet role for a worker.
      def assume_fleet_role_for_worker(
        farm_id : String,
        fleet_id : String,
        worker_id : String
      ) : Protocol::Request
        input = Types::AssumeFleetRoleForWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id)
        assume_fleet_role_for_worker(input)
      end
      def assume_fleet_role_for_worker(input : Types::AssumeFleetRoleForWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_FLEET_ROLE_FOR_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets Amazon Web Services credentials from the queue role. The IAM permissions of the credentials are
      # scoped down to have read-only access.
      def assume_queue_role_for_read(
        farm_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::AssumeQueueRoleForReadRequest.new(farm_id: farm_id, queue_id: queue_id)
        assume_queue_role_for_read(input)
      end
      def assume_queue_role_for_read(input : Types::AssumeQueueRoleForReadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_QUEUE_ROLE_FOR_READ, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a user to assume a role for a queue.
      def assume_queue_role_for_user(
        farm_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::AssumeQueueRoleForUserRequest.new(farm_id: farm_id, queue_id: queue_id)
        assume_queue_role_for_user(input)
      end
      def assume_queue_role_for_user(input : Types::AssumeQueueRoleForUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_QUEUE_ROLE_FOR_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a worker to assume a queue role.
      def assume_queue_role_for_worker(
        farm_id : String,
        fleet_id : String,
        queue_id : String,
        worker_id : String
      ) : Protocol::Request
        input = Types::AssumeQueueRoleForWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, queue_id: queue_id, worker_id: worker_id)
        assume_queue_role_for_worker(input)
      end
      def assume_queue_role_for_worker(input : Types::AssumeQueueRoleForWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_QUEUE_ROLE_FOR_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get batched job details for a worker.
      def batch_get_job_entity(
        farm_id : String,
        fleet_id : String,
        identifiers : Array(Types::JobEntityIdentifiersUnion),
        worker_id : String
      ) : Protocol::Request
        input = Types::BatchGetJobEntityRequest.new(farm_id: farm_id, fleet_id: fleet_id, identifiers: identifiers, worker_id: worker_id)
        batch_get_job_entity(input)
      end
      def batch_get_job_entity(input : Types::BatchGetJobEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_JOB_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Copies a job template to an Amazon S3 bucket.
      def copy_job_template(
        farm_id : String,
        job_id : String,
        queue_id : String,
        target_s3_location : Types::S3Location
      ) : Protocol::Request
        input = Types::CopyJobTemplateRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, target_s3_location: target_s3_location)
        copy_job_template(input)
      end
      def copy_job_template(input : Types::CopyJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COPY_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a budget to set spending thresholds for your rendering activity.
      def create_budget(
        actions : Array(Types::BudgetActionToAdd),
        approximate_dollar_limit : Float64,
        display_name : String,
        farm_id : String,
        schedule : Types::BudgetSchedule,
        usage_tracking_resource : Types::UsageTrackingResource,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateBudgetRequest.new(actions: actions, approximate_dollar_limit: approximate_dollar_limit, display_name: display_name, farm_id: farm_id, schedule: schedule, usage_tracking_resource: usage_tracking_resource, client_token: client_token, description: description, tags: tags)
        create_budget(input)
      end
      def create_budget(input : Types::CreateBudgetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BUDGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a farm to allow space for queues and fleets. Farms are the space where the components of
      # your renders gather and are pieced together in the cloud. Farms contain budgets and allow you to
      # enforce permissions. Deadline Cloud farms are a useful container for large projects.
      def create_farm(
        display_name : String,
        client_token : String? = nil,
        description : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFarmRequest.new(display_name: display_name, client_token: client_token, description: description, kms_key_arn: kms_key_arn, tags: tags)
        create_farm(input)
      end
      def create_farm(input : Types::CreateFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a fleet. Fleets gather information relating to compute, or capacity, for renders within your
      # farms. You can choose to manage your own capacity or opt to have fleets fully managed by Deadline
      # Cloud.
      def create_fleet(
        configuration : Types::FleetConfiguration,
        display_name : String,
        farm_id : String,
        max_worker_count : Int32,
        role_arn : String,
        client_token : String? = nil,
        description : String? = nil,
        host_configuration : Types::HostConfiguration? = nil,
        min_worker_count : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFleetRequest.new(configuration: configuration, display_name: display_name, farm_id: farm_id, max_worker_count: max_worker_count, role_arn: role_arn, client_token: client_token, description: description, host_configuration: host_configuration, min_worker_count: min_worker_count, tags: tags)
        create_fleet(input)
      end
      def create_fleet(input : Types::CreateFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a job. A job is a set of instructions that Deadline Cloud uses to schedule and run work on
      # available workers. For more information, see Deadline Cloud jobs .
      def create_job(
        farm_id : String,
        priority : Int32,
        queue_id : String,
        attachments : Types::Attachments? = nil,
        client_token : String? = nil,
        max_failed_tasks_count : Int32? = nil,
        max_retries_per_task : Int32? = nil,
        max_worker_count : Int32? = nil,
        parameters : Hash(String, Types::JobParameter)? = nil,
        source_job_id : String? = nil,
        storage_profile_id : String? = nil,
        target_task_run_status : String? = nil,
        template : String? = nil,
        template_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateJobRequest.new(farm_id: farm_id, priority: priority, queue_id: queue_id, attachments: attachments, client_token: client_token, max_failed_tasks_count: max_failed_tasks_count, max_retries_per_task: max_retries_per_task, max_worker_count: max_worker_count, parameters: parameters, source_job_id: source_job_id, storage_profile_id: storage_profile_id, target_task_run_status: target_task_run_status, template: template, template_type: template_type)
        create_job(input)
      end
      def create_job(input : Types::CreateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a license endpoint to integrate your various licensed software used for rendering on
      # Deadline Cloud.
      def create_license_endpoint(
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_id : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLicenseEndpointRequest.new(security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_id: vpc_id, client_token: client_token, tags: tags)
        create_license_endpoint(input)
      end
      def create_license_endpoint(input : Types::CreateLicenseEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LICENSE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a limit that manages the distribution of shared resources, such as floating licenses. A
      # limit can throttle work assignments, help manage workloads, and track current usage. Before you use
      # a limit, you must associate the limit with one or more queues. You must add the
      # amountRequirementName to a step in a job template to declare the limit requirement.
      def create_limit(
        amount_requirement_name : String,
        display_name : String,
        farm_id : String,
        max_count : Int32,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateLimitRequest.new(amount_requirement_name: amount_requirement_name, display_name: display_name, farm_id: farm_id, max_count: max_count, client_token: client_token, description: description)
        create_limit(input)
      end
      def create_limit(input : Types::CreateLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services Deadline Cloud monitor that you can use to view your farms, queues,
      # and fleets. After you submit a job, you can track the progress of the tasks and steps that make up
      # the job, and then download the job's results.
      def create_monitor(
        display_name : String,
        identity_center_instance_arn : String,
        role_arn : String,
        subdomain : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMonitorRequest.new(display_name: display_name, identity_center_instance_arn: identity_center_instance_arn, role_arn: role_arn, subdomain: subdomain, client_token: client_token, tags: tags)
        create_monitor(input)
      end
      def create_monitor(input : Types::CreateMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a queue to coordinate the order in which jobs run on a farm. A queue can also specify where
      # to pull resources and indicate where to output completed jobs.
      def create_queue(
        display_name : String,
        farm_id : String,
        allowed_storage_profile_ids : Array(String)? = nil,
        client_token : String? = nil,
        default_budget_action : String? = nil,
        description : String? = nil,
        job_attachment_settings : Types::JobAttachmentSettings? = nil,
        job_run_as_user : Types::JobRunAsUser? = nil,
        required_file_system_location_names : Array(String)? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQueueRequest.new(display_name: display_name, farm_id: farm_id, allowed_storage_profile_ids: allowed_storage_profile_ids, client_token: client_token, default_budget_action: default_budget_action, description: description, job_attachment_settings: job_attachment_settings, job_run_as_user: job_run_as_user, required_file_system_location_names: required_file_system_location_names, role_arn: role_arn, tags: tags)
        create_queue(input)
      end
      def create_queue(input : Types::CreateQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an environment for a queue that defines how jobs in the queue run.
      def create_queue_environment(
        farm_id : String,
        priority : Int32,
        queue_id : String,
        template : String,
        template_type : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateQueueEnvironmentRequest.new(farm_id: farm_id, priority: priority, queue_id: queue_id, template: template, template_type: template_type, client_token: client_token)
        create_queue_environment(input)
      end
      def create_queue_environment(input : Types::CreateQueueEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between a queue and a fleet.
      def create_queue_fleet_association(
        farm_id : String,
        fleet_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::CreateQueueFleetAssociationRequest.new(farm_id: farm_id, fleet_id: fleet_id, queue_id: queue_id)
        create_queue_fleet_association(input)
      end
      def create_queue_fleet_association(input : Types::CreateQueueFleetAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE_FLEET_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a limit with a particular queue. After the limit is associated, all workers for jobs that
      # specify the limit associated with the queue are subject to the limit. You can't associate two limits
      # with the same amountRequirementName to the same queue.
      def create_queue_limit_association(
        farm_id : String,
        limit_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::CreateQueueLimitAssociationRequest.new(farm_id: farm_id, limit_id: limit_id, queue_id: queue_id)
        create_queue_limit_association(input)
      end
      def create_queue_limit_association(input : Types::CreateQueueLimitAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE_LIMIT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a storage profile that specifies the operating system, file type, and file location of
      # resources used on a farm.
      def create_storage_profile(
        display_name : String,
        farm_id : String,
        os_family : String,
        client_token : String? = nil,
        file_system_locations : Array(Types::FileSystemLocation)? = nil
      ) : Protocol::Request
        input = Types::CreateStorageProfileRequest.new(display_name: display_name, farm_id: farm_id, os_family: os_family, client_token: client_token, file_system_locations: file_system_locations)
        create_storage_profile(input)
      end
      def create_storage_profile(input : Types::CreateStorageProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STORAGE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a worker. A worker tells your instance how much processing power (vCPU), and memory (GiB)
      # you’ll need to assemble the digital assets held within a particular instance. You can specify
      # certain instance types to use, or let the worker know which instances types to exclude. Deadline
      # Cloud limits the number of workers to less than or equal to the fleet's maximum worker count. The
      # service maintains eventual consistency for the worker count. If you make multiple rapid calls to
      # CreateWorker before the field updates, you might exceed your fleet's maximum worker count. For
      # example, if your maxWorkerCount is 10 and you currently have 9 workers, making two quick
      # CreateWorker calls might successfully create 2 workers instead of 1, resulting in 11 total workers.
      def create_worker(
        farm_id : String,
        fleet_id : String,
        client_token : String? = nil,
        host_properties : Types::HostPropertiesRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, client_token: client_token, host_properties: host_properties, tags: tags)
        create_worker(input)
      end
      def create_worker(input : Types::CreateWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a budget.
      def delete_budget(
        budget_id : String,
        farm_id : String
      ) : Protocol::Request
        input = Types::DeleteBudgetRequest.new(budget_id: budget_id, farm_id: farm_id)
        delete_budget(input)
      end
      def delete_budget(input : Types::DeleteBudgetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BUDGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a farm.
      def delete_farm(
        farm_id : String
      ) : Protocol::Request
        input = Types::DeleteFarmRequest.new(farm_id: farm_id)
        delete_farm(input)
      end
      def delete_farm(input : Types::DeleteFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a fleet.
      def delete_fleet(
        farm_id : String,
        fleet_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteFleetRequest.new(farm_id: farm_id, fleet_id: fleet_id, client_token: client_token)
        delete_fleet(input)
      end
      def delete_fleet(input : Types::DeleteFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a license endpoint.
      def delete_license_endpoint(
        license_endpoint_id : String
      ) : Protocol::Request
        input = Types::DeleteLicenseEndpointRequest.new(license_endpoint_id: license_endpoint_id)
        delete_license_endpoint(input)
      end
      def delete_license_endpoint(input : Types::DeleteLicenseEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LICENSE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a limit from the specified farm. Before you delete a limit you must use the
      # DeleteQueueLimitAssociation operation to remove the association with any queues.
      def delete_limit(
        farm_id : String,
        limit_id : String
      ) : Protocol::Request
        input = Types::DeleteLimitRequest.new(farm_id: farm_id, limit_id: limit_id)
        delete_limit(input)
      end
      def delete_limit(input : Types::DeleteLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a metered product.
      def delete_metered_product(
        license_endpoint_id : String,
        product_id : String
      ) : Protocol::Request
        input = Types::DeleteMeteredProductRequest.new(license_endpoint_id: license_endpoint_id, product_id: product_id)
        delete_metered_product(input)
      end
      def delete_metered_product(input : Types::DeleteMeteredProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_METERED_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a Deadline Cloud monitor. After you delete a monitor, you can create a new one and attach
      # farms to the monitor.
      def delete_monitor(
        monitor_id : String
      ) : Protocol::Request
        input = Types::DeleteMonitorRequest.new(monitor_id: monitor_id)
        delete_monitor(input)
      end
      def delete_monitor(input : Types::DeleteMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a queue. You can't recover the jobs in a queue if you delete the queue. Deleting the queue
      # also deletes the jobs in that queue.
      def delete_queue(
        farm_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DeleteQueueRequest.new(farm_id: farm_id, queue_id: queue_id)
        delete_queue(input)
      end
      def delete_queue(input : Types::DeleteQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a queue environment.
      def delete_queue_environment(
        farm_id : String,
        queue_environment_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DeleteQueueEnvironmentRequest.new(farm_id: farm_id, queue_environment_id: queue_environment_id, queue_id: queue_id)
        delete_queue_environment(input)
      end
      def delete_queue_environment(input : Types::DeleteQueueEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a queue-fleet association.
      def delete_queue_fleet_association(
        farm_id : String,
        fleet_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DeleteQueueFleetAssociationRequest.new(farm_id: farm_id, fleet_id: fleet_id, queue_id: queue_id)
        delete_queue_fleet_association(input)
      end
      def delete_queue_fleet_association(input : Types::DeleteQueueFleetAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE_FLEET_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between a queue and a limit. You must use the UpdateQueueLimitAssociation
      # operation to set the status to STOP_LIMIT_USAGE_AND_COMPLETE_TASKS or
      # STOP_LIMIT_USAGE_AND_CANCEL_TASKS . The status does not change immediately. Use the
      # GetQueueLimitAssociation operation to see if the status changed to STOPPED before deleting the
      # association.
      def delete_queue_limit_association(
        farm_id : String,
        limit_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DeleteQueueLimitAssociationRequest.new(farm_id: farm_id, limit_id: limit_id, queue_id: queue_id)
        delete_queue_limit_association(input)
      end
      def delete_queue_limit_association(input : Types::DeleteQueueLimitAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE_LIMIT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a storage profile.
      def delete_storage_profile(
        farm_id : String,
        storage_profile_id : String
      ) : Protocol::Request
        input = Types::DeleteStorageProfileRequest.new(farm_id: farm_id, storage_profile_id: storage_profile_id)
        delete_storage_profile(input)
      end
      def delete_storage_profile(input : Types::DeleteStorageProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STORAGE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a worker.
      def delete_worker(
        farm_id : String,
        fleet_id : String,
        worker_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id)
        delete_worker(input)
      end
      def delete_worker(input : Types::DeleteWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member from a farm.
      def disassociate_member_from_farm(
        farm_id : String,
        principal_id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberFromFarmRequest.new(farm_id: farm_id, principal_id: principal_id)
        disassociate_member_from_farm(input)
      end
      def disassociate_member_from_farm(input : Types::DisassociateMemberFromFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER_FROM_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member from a fleet.
      def disassociate_member_from_fleet(
        farm_id : String,
        fleet_id : String,
        principal_id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberFromFleetRequest.new(farm_id: farm_id, fleet_id: fleet_id, principal_id: principal_id)
        disassociate_member_from_fleet(input)
      end
      def disassociate_member_from_fleet(input : Types::DisassociateMemberFromFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER_FROM_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member from a job.
      def disassociate_member_from_job(
        farm_id : String,
        job_id : String,
        principal_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberFromJobRequest.new(farm_id: farm_id, job_id: job_id, principal_id: principal_id, queue_id: queue_id)
        disassociate_member_from_job(input)
      end
      def disassociate_member_from_job(input : Types::DisassociateMemberFromJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER_FROM_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a member from a queue.
      def disassociate_member_from_queue(
        farm_id : String,
        principal_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DisassociateMemberFromQueueRequest.new(farm_id: farm_id, principal_id: principal_id, queue_id: queue_id)
        disassociate_member_from_queue(input)
      end
      def disassociate_member_from_queue(input : Types::DisassociateMemberFromQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBER_FROM_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a budget.
      def get_budget(
        budget_id : String,
        farm_id : String
      ) : Protocol::Request
        input = Types::GetBudgetRequest.new(budget_id: budget_id, farm_id: farm_id)
        get_budget(input)
      end
      def get_budget(input : Types::GetBudgetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BUDGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a farm.
      def get_farm(
        farm_id : String
      ) : Protocol::Request
        input = Types::GetFarmRequest.new(farm_id: farm_id)
        get_farm(input)
      end
      def get_farm(input : Types::GetFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a fleet.
      def get_fleet(
        farm_id : String,
        fleet_id : String
      ) : Protocol::Request
        input = Types::GetFleetRequest.new(farm_id: farm_id, fleet_id: fleet_id)
        get_fleet(input)
      end
      def get_fleet(input : Types::GetFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a Deadline Cloud job.
      def get_job(
        farm_id : String,
        job_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::GetJobRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id)
        get_job(input)
      end
      def get_job(input : Types::GetJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a licence endpoint.
      def get_license_endpoint(
        license_endpoint_id : String
      ) : Protocol::Request
        input = Types::GetLicenseEndpointRequest.new(license_endpoint_id: license_endpoint_id)
        get_license_endpoint(input)
      end
      def get_license_endpoint(input : Types::GetLicenseEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LICENSE_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specific limit.
      def get_limit(
        farm_id : String,
        limit_id : String
      ) : Protocol::Request
        input = Types::GetLimitRequest.new(farm_id: farm_id, limit_id: limit_id)
        get_limit(input)
      end
      def get_limit(input : Types::GetLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified monitor.
      def get_monitor(
        monitor_id : String
      ) : Protocol::Request
        input = Types::GetMonitorRequest.new(monitor_id: monitor_id)
        get_monitor(input)
      end
      def get_monitor(input : Types::GetMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a queue.
      def get_queue(
        farm_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::GetQueueRequest.new(farm_id: farm_id, queue_id: queue_id)
        get_queue(input)
      end
      def get_queue(input : Types::GetQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a queue environment.
      def get_queue_environment(
        farm_id : String,
        queue_environment_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::GetQueueEnvironmentRequest.new(farm_id: farm_id, queue_environment_id: queue_environment_id, queue_id: queue_id)
        get_queue_environment(input)
      end
      def get_queue_environment(input : Types::GetQueueEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUEUE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a queue-fleet association.
      def get_queue_fleet_association(
        farm_id : String,
        fleet_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::GetQueueFleetAssociationRequest.new(farm_id: farm_id, fleet_id: fleet_id, queue_id: queue_id)
        get_queue_fleet_association(input)
      end
      def get_queue_fleet_association(input : Types::GetQueueFleetAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUEUE_FLEET_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specific association between a queue and a limit.
      def get_queue_limit_association(
        farm_id : String,
        limit_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::GetQueueLimitAssociationRequest.new(farm_id: farm_id, limit_id: limit_id, queue_id: queue_id)
        get_queue_limit_association(input)
      end
      def get_queue_limit_association(input : Types::GetQueueLimitAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUEUE_LIMIT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a session.
      def get_session(
        farm_id : String,
        job_id : String,
        queue_id : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetSessionRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, session_id: session_id)
        get_session(input)
      end
      def get_session(input : Types::GetSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a session action for the job.
      def get_session_action(
        farm_id : String,
        job_id : String,
        queue_id : String,
        session_action_id : String
      ) : Protocol::Request
        input = Types::GetSessionActionRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, session_action_id: session_action_id)
        get_session_action(input)
      end
      def get_session_action(input : Types::GetSessionActionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a set of statistics for queues or farms. Before you can call the
      # GetSessionStatisticsAggregation operation, you must first call the
      # StartSessionsStatisticsAggregation operation. Statistics are available for 1 hour after you call the
      # StartSessionsStatisticsAggregation operation.
      def get_sessions_statistics_aggregation(
        aggregation_id : String,
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetSessionsStatisticsAggregationRequest.new(aggregation_id: aggregation_id, farm_id: farm_id, max_results: max_results, next_token: next_token)
        get_sessions_statistics_aggregation(input)
      end
      def get_sessions_statistics_aggregation(input : Types::GetSessionsStatisticsAggregationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSIONS_STATISTICS_AGGREGATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a step.
      def get_step(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String
      ) : Protocol::Request
        input = Types::GetStepRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id)
        get_step(input)
      end
      def get_step(input : Types::GetStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a storage profile.
      def get_storage_profile(
        farm_id : String,
        storage_profile_id : String
      ) : Protocol::Request
        input = Types::GetStorageProfileRequest.new(farm_id: farm_id, storage_profile_id: storage_profile_id)
        get_storage_profile(input)
      end
      def get_storage_profile(input : Types::GetStorageProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STORAGE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a storage profile for a queue.
      def get_storage_profile_for_queue(
        farm_id : String,
        queue_id : String,
        storage_profile_id : String
      ) : Protocol::Request
        input = Types::GetStorageProfileForQueueRequest.new(farm_id: farm_id, queue_id: queue_id, storage_profile_id: storage_profile_id)
        get_storage_profile_for_queue(input)
      end
      def get_storage_profile_for_queue(input : Types::GetStorageProfileForQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STORAGE_PROFILE_FOR_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a task.
      def get_task(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::GetTaskRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, task_id: task_id)
        get_task(input)
      end
      def get_task(input : Types::GetTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a worker.
      def get_worker(
        farm_id : String,
        fleet_id : String,
        worker_id : String
      ) : Protocol::Request
        input = Types::GetWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id)
        get_worker(input)
      end
      def get_worker(input : Types::GetWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of the available metered products.
      def list_available_metered_products(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAvailableMeteredProductsRequest.new(max_results: max_results, next_token: next_token)
        list_available_metered_products(input)
      end
      def list_available_metered_products(input : Types::ListAvailableMeteredProductsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AVAILABLE_METERED_PRODUCTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of budgets in a farm.
      def list_budgets(
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListBudgetsRequest.new(farm_id: farm_id, max_results: max_results, next_token: next_token, status: status)
        list_budgets(input)
      end
      def list_budgets(input : Types::ListBudgetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BUDGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the members of a farm.
      def list_farm_members(
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFarmMembersRequest.new(farm_id: farm_id, max_results: max_results, next_token: next_token)
        list_farm_members(input)
      end
      def list_farm_members(input : Types::ListFarmMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FARM_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists farms.
      def list_farms(
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal_id : String? = nil
      ) : Protocol::Request
        input = Types::ListFarmsRequest.new(max_results: max_results, next_token: next_token, principal_id: principal_id)
        list_farms(input)
      end
      def list_farms(input : Types::ListFarmsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FARMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists fleet members.
      def list_fleet_members(
        farm_id : String,
        fleet_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFleetMembersRequest.new(farm_id: farm_id, fleet_id: fleet_id, max_results: max_results, next_token: next_token)
        list_fleet_members(input)
      end
      def list_fleet_members(input : Types::ListFleetMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLEET_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists fleets.
      def list_fleets(
        farm_id : String,
        display_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal_id : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListFleetsRequest.new(farm_id: farm_id, display_name: display_name, max_results: max_results, next_token: next_token, principal_id: principal_id, status: status)
        list_fleets(input)
      end
      def list_fleets(input : Types::ListFleetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLEETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists members on a job.
      def list_job_members(
        farm_id : String,
        job_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobMembersRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_job_members(input)
      end
      def list_job_members(input : Types::ListJobMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists parameter definitions of a job.
      def list_job_parameter_definitions(
        farm_id : String,
        job_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobParameterDefinitionsRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_job_parameter_definitions(input)
      end
      def list_job_parameter_definitions(input : Types::ListJobParameterDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_PARAMETER_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists jobs.
      def list_jobs(
        farm_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal_id : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(farm_id: farm_id, queue_id: queue_id, max_results: max_results, next_token: next_token, principal_id: principal_id)
        list_jobs(input)
      end
      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists license endpoints.
      def list_license_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLicenseEndpointsRequest.new(max_results: max_results, next_token: next_token)
        list_license_endpoints(input)
      end
      def list_license_endpoints(input : Types::ListLicenseEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LICENSE_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of limits defined in the specified farm.
      def list_limits(
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLimitsRequest.new(farm_id: farm_id, max_results: max_results, next_token: next_token)
        list_limits(input)
      end
      def list_limits(input : Types::ListLimitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LIMITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists metered products.
      def list_metered_products(
        license_endpoint_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMeteredProductsRequest.new(license_endpoint_id: license_endpoint_id, max_results: max_results, next_token: next_token)
        list_metered_products(input)
      end
      def list_metered_products(input : Types::ListMeteredProductsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_METERED_PRODUCTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of your monitors in Deadline Cloud.
      def list_monitors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMonitorsRequest.new(max_results: max_results, next_token: next_token)
        list_monitors(input)
      end
      def list_monitors(input : Types::ListMonitorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MONITORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists queue environments.
      def list_queue_environments(
        farm_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListQueueEnvironmentsRequest.new(farm_id: farm_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_queue_environments(input)
      end
      def list_queue_environments(input : Types::ListQueueEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUE_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists queue-fleet associations.
      def list_queue_fleet_associations(
        farm_id : String,
        fleet_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        queue_id : String? = nil
      ) : Protocol::Request
        input = Types::ListQueueFleetAssociationsRequest.new(farm_id: farm_id, fleet_id: fleet_id, max_results: max_results, next_token: next_token, queue_id: queue_id)
        list_queue_fleet_associations(input)
      end
      def list_queue_fleet_associations(input : Types::ListQueueFleetAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUE_FLEET_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a list of the associations between queues and limits defined in a farm.
      def list_queue_limit_associations(
        farm_id : String,
        limit_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        queue_id : String? = nil
      ) : Protocol::Request
        input = Types::ListQueueLimitAssociationsRequest.new(farm_id: farm_id, limit_id: limit_id, max_results: max_results, next_token: next_token, queue_id: queue_id)
        list_queue_limit_associations(input)
      end
      def list_queue_limit_associations(input : Types::ListQueueLimitAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUE_LIMIT_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the members in a queue.
      def list_queue_members(
        farm_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListQueueMembersRequest.new(farm_id: farm_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_queue_members(input)
      end
      def list_queue_members(input : Types::ListQueueMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists queues.
      def list_queues(
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal_id : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListQueuesRequest.new(farm_id: farm_id, max_results: max_results, next_token: next_token, principal_id: principal_id, status: status)
        list_queues(input)
      end
      def list_queues(input : Types::ListQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists session actions.
      def list_session_actions(
        farm_id : String,
        job_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        session_id : String? = nil,
        task_id : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionActionsRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, max_results: max_results, next_token: next_token, session_id: session_id, task_id: task_id)
        list_session_actions(input)
      end
      def list_session_actions(input : Types::ListSessionActionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSION_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists sessions.
      def list_sessions(
        farm_id : String,
        job_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_sessions(input)
      end
      def list_sessions(input : Types::ListSessionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists sessions for a worker.
      def list_sessions_for_worker(
        farm_id : String,
        fleet_id : String,
        worker_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSessionsForWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id, max_results: max_results, next_token: next_token)
        list_sessions_for_worker(input)
      end
      def list_sessions_for_worker(input : Types::ListSessionsForWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SESSIONS_FOR_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists step consumers.
      def list_step_consumers(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStepConsumersRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, max_results: max_results, next_token: next_token)
        list_step_consumers(input)
      end
      def list_step_consumers(input : Types::ListStepConsumersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STEP_CONSUMERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the dependencies for a step.
      def list_step_dependencies(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStepDependenciesRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, max_results: max_results, next_token: next_token)
        list_step_dependencies(input)
      end
      def list_step_dependencies(input : Types::ListStepDependenciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STEP_DEPENDENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists steps for a job.
      def list_steps(
        farm_id : String,
        job_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStepsRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_steps(input)
      end
      def list_steps(input : Types::ListStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists storage profiles.
      def list_storage_profiles(
        farm_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStorageProfilesRequest.new(farm_id: farm_id, max_results: max_results, next_token: next_token)
        list_storage_profiles(input)
      end
      def list_storage_profiles(input : Types::ListStorageProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STORAGE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists storage profiles for a queue.
      def list_storage_profiles_for_queue(
        farm_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStorageProfilesForQueueRequest.new(farm_id: farm_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_storage_profiles_for_queue(input)
      end
      def list_storage_profiles_for_queue(input : Types::ListStorageProfilesForQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STORAGE_PROFILES_FOR_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for a resource.
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

      # Lists tasks for a job.
      def list_tasks(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTasksRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, max_results: max_results, next_token: next_token)
        list_tasks(input)
      end
      def list_tasks(input : Types::ListTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists workers.
      def list_workers(
        farm_id : String,
        fleet_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkersRequest.new(farm_id: farm_id, fleet_id: fleet_id, max_results: max_results, next_token: next_token)
        list_workers(input)
      end
      def list_workers(input : Types::ListWorkersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a metered product.
      def put_metered_product(
        license_endpoint_id : String,
        product_id : String
      ) : Protocol::Request
        input = Types::PutMeteredProductRequest.new(license_endpoint_id: license_endpoint_id, product_id: product_id)
        put_metered_product(input)
      end
      def put_metered_product(input : Types::PutMeteredProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_METERED_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for jobs.
      def search_jobs(
        farm_id : String,
        item_offset : Int32,
        queue_ids : Array(String),
        filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
        page_size : Int32? = nil,
        sort_expressions : Array(Types::SearchSortExpression)? = nil
      ) : Protocol::Request
        input = Types::SearchJobsRequest.new(farm_id: farm_id, item_offset: item_offset, queue_ids: queue_ids, filter_expressions: filter_expressions, page_size: page_size, sort_expressions: sort_expressions)
        search_jobs(input)
      end
      def search_jobs(input : Types::SearchJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for steps.
      def search_steps(
        farm_id : String,
        item_offset : Int32,
        queue_ids : Array(String),
        filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
        job_id : String? = nil,
        page_size : Int32? = nil,
        sort_expressions : Array(Types::SearchSortExpression)? = nil
      ) : Protocol::Request
        input = Types::SearchStepsRequest.new(farm_id: farm_id, item_offset: item_offset, queue_ids: queue_ids, filter_expressions: filter_expressions, job_id: job_id, page_size: page_size, sort_expressions: sort_expressions)
        search_steps(input)
      end
      def search_steps(input : Types::SearchStepsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_STEPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for tasks.
      def search_tasks(
        farm_id : String,
        item_offset : Int32,
        queue_ids : Array(String),
        filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
        job_id : String? = nil,
        page_size : Int32? = nil,
        sort_expressions : Array(Types::SearchSortExpression)? = nil
      ) : Protocol::Request
        input = Types::SearchTasksRequest.new(farm_id: farm_id, item_offset: item_offset, queue_ids: queue_ids, filter_expressions: filter_expressions, job_id: job_id, page_size: page_size, sort_expressions: sort_expressions)
        search_tasks(input)
      end
      def search_tasks(input : Types::SearchTasksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for workers.
      def search_workers(
        farm_id : String,
        fleet_ids : Array(String),
        item_offset : Int32,
        filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
        page_size : Int32? = nil,
        sort_expressions : Array(Types::SearchSortExpression)? = nil
      ) : Protocol::Request
        input = Types::SearchWorkersRequest.new(farm_id: farm_id, fleet_ids: fleet_ids, item_offset: item_offset, filter_expressions: filter_expressions, page_size: page_size, sort_expressions: sort_expressions)
        search_workers(input)
      end
      def search_workers(input : Types::SearchWorkersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_WORKERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an asynchronous request for getting aggregated statistics about queues and farms. Get the
      # statistics using the GetSessionsStatisticsAggregation operation. You can only have one running
      # aggregation for your Deadline Cloud farm. Call the GetSessionsStatisticsAggregation operation and
      # check the status field to see if an aggregation is running. Statistics are available for 1 hour
      # after you call the StartSessionsStatisticsAggregation operation.
      def start_sessions_statistics_aggregation(
        end_time : Time,
        farm_id : String,
        group_by : Array(String),
        resource_ids : Types::SessionsStatisticsResources,
        start_time : Time,
        statistics : Array(String),
        period : String? = nil,
        timezone : String? = nil
      ) : Protocol::Request
        input = Types::StartSessionsStatisticsAggregationRequest.new(end_time: end_time, farm_id: farm_id, group_by: group_by, resource_ids: resource_ids, start_time: start_time, statistics: statistics, period: period, timezone: timezone)
        start_sessions_statistics_aggregation(input)
      end
      def start_sessions_statistics_aggregation(input : Types::StartSessionsStatisticsAggregationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SESSIONS_STATISTICS_AGGREGATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource using the resource's ARN and desired tags.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a resource using the resource's ARN and tag to remove.
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

      # Updates a budget that sets spending thresholds for rendering activity.
      def update_budget(
        budget_id : String,
        farm_id : String,
        actions_to_add : Array(Types::BudgetActionToAdd)? = nil,
        actions_to_remove : Array(Types::BudgetActionToRemove)? = nil,
        approximate_dollar_limit : Float64? = nil,
        client_token : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        schedule : Types::BudgetSchedule? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateBudgetRequest.new(budget_id: budget_id, farm_id: farm_id, actions_to_add: actions_to_add, actions_to_remove: actions_to_remove, approximate_dollar_limit: approximate_dollar_limit, client_token: client_token, description: description, display_name: display_name, schedule: schedule, status: status)
        update_budget(input)
      end
      def update_budget(input : Types::UpdateBudgetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BUDGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a farm.
      def update_farm(
        farm_id : String,
        description : String? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFarmRequest.new(farm_id: farm_id, description: description, display_name: display_name)
        update_farm(input)
      end
      def update_farm(input : Types::UpdateFarmRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FARM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a fleet.
      def update_fleet(
        farm_id : String,
        fleet_id : String,
        client_token : String? = nil,
        configuration : Types::FleetConfiguration? = nil,
        description : String? = nil,
        display_name : String? = nil,
        host_configuration : Types::HostConfiguration? = nil,
        max_worker_count : Int32? = nil,
        min_worker_count : Int32? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFleetRequest.new(farm_id: farm_id, fleet_id: fleet_id, client_token: client_token, configuration: configuration, description: description, display_name: display_name, host_configuration: host_configuration, max_worker_count: max_worker_count, min_worker_count: min_worker_count, role_arn: role_arn)
        update_fleet(input)
      end
      def update_fleet(input : Types::UpdateFleetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLEET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a job. When you change the status of the job to ARCHIVED , the job can't be scheduled or
      # archived. An archived jobs and its steps and tasks are deleted after 120 days. The job can't be
      # recovered.
      def update_job(
        farm_id : String,
        job_id : String,
        queue_id : String,
        client_token : String? = nil,
        lifecycle_status : String? = nil,
        max_failed_tasks_count : Int32? = nil,
        max_retries_per_task : Int32? = nil,
        max_worker_count : Int32? = nil,
        priority : Int32? = nil,
        target_task_run_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateJobRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, client_token: client_token, lifecycle_status: lifecycle_status, max_failed_tasks_count: max_failed_tasks_count, max_retries_per_task: max_retries_per_task, max_worker_count: max_worker_count, priority: priority, target_task_run_status: target_task_run_status)
        update_job(input)
      end
      def update_job(input : Types::UpdateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of the specified limit.
      def update_limit(
        farm_id : String,
        limit_id : String,
        description : String? = nil,
        display_name : String? = nil,
        max_count : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateLimitRequest.new(farm_id: farm_id, limit_id: limit_id, description: description, display_name: display_name, max_count: max_count)
        update_limit(input)
      end
      def update_limit(input : Types::UpdateLimitRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LIMIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the settings for a Deadline Cloud monitor. You can modify one or all of the settings when
      # you call UpdateMonitor .
      def update_monitor(
        monitor_id : String,
        display_name : String? = nil,
        role_arn : String? = nil,
        subdomain : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMonitorRequest.new(monitor_id: monitor_id, display_name: display_name, role_arn: role_arn, subdomain: subdomain)
        update_monitor(input)
      end
      def update_monitor(input : Types::UpdateMonitorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MONITOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a queue.
      def update_queue(
        farm_id : String,
        queue_id : String,
        allowed_storage_profile_ids_to_add : Array(String)? = nil,
        allowed_storage_profile_ids_to_remove : Array(String)? = nil,
        client_token : String? = nil,
        default_budget_action : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        job_attachment_settings : Types::JobAttachmentSettings? = nil,
        job_run_as_user : Types::JobRunAsUser? = nil,
        required_file_system_location_names_to_add : Array(String)? = nil,
        required_file_system_location_names_to_remove : Array(String)? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQueueRequest.new(farm_id: farm_id, queue_id: queue_id, allowed_storage_profile_ids_to_add: allowed_storage_profile_ids_to_add, allowed_storage_profile_ids_to_remove: allowed_storage_profile_ids_to_remove, client_token: client_token, default_budget_action: default_budget_action, description: description, display_name: display_name, job_attachment_settings: job_attachment_settings, job_run_as_user: job_run_as_user, required_file_system_location_names_to_add: required_file_system_location_names_to_add, required_file_system_location_names_to_remove: required_file_system_location_names_to_remove, role_arn: role_arn)
        update_queue(input)
      end
      def update_queue(input : Types::UpdateQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the queue environment.
      def update_queue_environment(
        farm_id : String,
        queue_environment_id : String,
        queue_id : String,
        client_token : String? = nil,
        priority : Int32? = nil,
        template : String? = nil,
        template_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQueueEnvironmentRequest.new(farm_id: farm_id, queue_environment_id: queue_environment_id, queue_id: queue_id, client_token: client_token, priority: priority, template: template, template_type: template_type)
        update_queue_environment(input)
      end
      def update_queue_environment(input : Types::UpdateQueueEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a queue-fleet association.
      def update_queue_fleet_association(
        farm_id : String,
        fleet_id : String,
        queue_id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateQueueFleetAssociationRequest.new(farm_id: farm_id, fleet_id: fleet_id, queue_id: queue_id, status: status)
        update_queue_fleet_association(input)
      end
      def update_queue_fleet_association(input : Types::UpdateQueueFleetAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_FLEET_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of the queue. If you set the status to one of the STOP_LIMIT_USAGE* values, there
      # will be a delay before the status transitions to the STOPPED state.
      def update_queue_limit_association(
        farm_id : String,
        limit_id : String,
        queue_id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateQueueLimitAssociationRequest.new(farm_id: farm_id, limit_id: limit_id, queue_id: queue_id, status: status)
        update_queue_limit_association(input)
      end
      def update_queue_limit_association(input : Types::UpdateQueueLimitAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_LIMIT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a session.
      def update_session(
        farm_id : String,
        job_id : String,
        queue_id : String,
        session_id : String,
        target_lifecycle_status : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSessionRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, session_id: session_id, target_lifecycle_status: target_lifecycle_status, client_token: client_token)
        update_session(input)
      end
      def update_session(input : Types::UpdateSessionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a step.
      def update_step(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        target_task_run_status : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStepRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, target_task_run_status: target_task_run_status, client_token: client_token)
        update_step(input)
      end
      def update_step(input : Types::UpdateStepRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STEP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a storage profile.
      def update_storage_profile(
        farm_id : String,
        storage_profile_id : String,
        client_token : String? = nil,
        display_name : String? = nil,
        file_system_locations_to_add : Array(Types::FileSystemLocation)? = nil,
        file_system_locations_to_remove : Array(Types::FileSystemLocation)? = nil,
        os_family : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStorageProfileRequest.new(farm_id: farm_id, storage_profile_id: storage_profile_id, client_token: client_token, display_name: display_name, file_system_locations_to_add: file_system_locations_to_add, file_system_locations_to_remove: file_system_locations_to_remove, os_family: os_family)
        update_storage_profile(input)
      end
      def update_storage_profile(input : Types::UpdateStorageProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STORAGE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a task.
      def update_task(
        farm_id : String,
        job_id : String,
        queue_id : String,
        step_id : String,
        target_run_status : String,
        task_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTaskRequest.new(farm_id: farm_id, job_id: job_id, queue_id: queue_id, step_id: step_id, target_run_status: target_run_status, task_id: task_id, client_token: client_token)
        update_task(input)
      end
      def update_task(input : Types::UpdateTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a worker.
      def update_worker(
        farm_id : String,
        fleet_id : String,
        worker_id : String,
        capabilities : Types::WorkerCapabilities? = nil,
        host_properties : Types::HostPropertiesRequest? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkerRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id, capabilities: capabilities, host_properties: host_properties, status: status)
        update_worker(input)
      end
      def update_worker(input : Types::UpdateWorkerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the schedule for a worker.
      def update_worker_schedule(
        farm_id : String,
        fleet_id : String,
        worker_id : String,
        updated_session_actions : Hash(String, Types::UpdatedSessionActionInfo)? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkerScheduleRequest.new(farm_id: farm_id, fleet_id: fleet_id, worker_id: worker_id, updated_session_actions: updated_session_actions)
        update_worker_schedule(input)
      end
      def update_worker_schedule(input : Types::UpdateWorkerScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKER_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
