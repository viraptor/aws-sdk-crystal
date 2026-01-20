module AwsSdk
  module Batch
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

      # Cancels a job in an Batch job queue. Jobs that are in a SUBMITTED , PENDING , or RUNNABLE state are
      # cancelled and the job status is updated to FAILED . A PENDING job is canceled after all dependency
      # jobs are completed. Therefore, it may take longer than expected to cancel a job in PENDING status.
      # When you try to cancel an array parent job in PENDING , Batch attempts to cancel all child jobs. The
      # array parent job is canceled when all child jobs are completed. Jobs that progressed to the STARTING
      # or RUNNING state aren't canceled. However, the API operation still succeeds, even if no job is
      # canceled. These jobs must be terminated with the TerminateJob operation.

      def cancel_job(
        job_id : String,
        reason : String
      ) : Protocol::Request
        input = Types::CancelJobRequest.new(job_id: job_id, reason: reason)
        cancel_job(input)
      end

      def cancel_job(input : Types::CancelJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Batch compute environment. You can create MANAGED or UNMANAGED compute environments.
      # MANAGED compute environments can use Amazon EC2 or Fargate resources. UNMANAGED compute environments
      # can only use EC2 resources. In a managed compute environment, Batch manages the capacity and
      # instance types of the compute resources within the environment. This is based on the compute
      # resource specification that you define or the launch template that you specify when you create the
      # compute environment. Either, you can choose to use EC2 On-Demand Instances and EC2 Spot Instances.
      # Or, you can use Fargate and Fargate Spot capacity in your managed compute environment. You can
      # optionally set a maximum price so that Spot Instances only launch when the Spot Instance price is
      # less than a specified percentage of the On-Demand price. In an unmanaged compute environment, you
      # can manage your own EC2 compute resources and have flexibility with how you configure your compute
      # resources. For example, you can use custom AMIs. However, you must verify that each of your AMIs
      # meet the Amazon ECS container instance AMI specification. For more information, see container
      # instance AMIs in the Amazon Elastic Container Service Developer Guide . After you created your
      # unmanaged compute environment, you can use the DescribeComputeEnvironments operation to find the
      # Amazon ECS cluster that's associated with it. Then, launch your container instances into that Amazon
      # ECS cluster. For more information, see Launching an Amazon ECS container instance in the Amazon
      # Elastic Container Service Developer Guide . Batch doesn't automatically upgrade the AMIs in a
      # compute environment after it's created. For more information on how to update a compute
      # environment's AMI, see Updating compute environments in the Batch User Guide .

      def create_compute_environment(
        compute_environment_name : String,
        type : String,
        compute_resources : Types::ComputeResource? = nil,
        context : String? = nil,
        eks_configuration : Types::EksConfiguration? = nil,
        service_role : String? = nil,
        state : String? = nil,
        tags : Hash(String, String)? = nil,
        unmanagedv_cpus : Int32? = nil
      ) : Protocol::Request
        input = Types::CreateComputeEnvironmentRequest.new(compute_environment_name: compute_environment_name, type: type, compute_resources: compute_resources, context: context, eks_configuration: eks_configuration, service_role: service_role, state: state, tags: tags, unmanagedv_cpus: unmanagedv_cpus)
        create_compute_environment(input)
      end

      def create_compute_environment(input : Types::CreateComputeEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPUTE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Batch consumable resource.

      def create_consumable_resource(
        consumable_resource_name : String,
        resource_type : String? = nil,
        tags : Hash(String, String)? = nil,
        total_quantity : Int64? = nil
      ) : Protocol::Request
        input = Types::CreateConsumableResourceRequest.new(consumable_resource_name: consumable_resource_name, resource_type: resource_type, tags: tags, total_quantity: total_quantity)
        create_consumable_resource(input)
      end

      def create_consumable_resource(input : Types::CreateConsumableResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONSUMABLE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Batch job queue. When you create a job queue, you associate one or more compute
      # environments to the queue and assign an order of preference for the compute environments. You also
      # set a priority to the job queue that determines the order that the Batch scheduler places jobs onto
      # its associated compute environments. For example, if a compute environment is associated with more
      # than one job queue, the job queue with a higher priority is given preference for scheduling jobs to
      # that compute environment.

      def create_job_queue(
        job_queue_name : String,
        priority : Int32,
        compute_environment_order : Array(Types::ComputeEnvironmentOrder)? = nil,
        job_queue_type : String? = nil,
        job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)? = nil,
        scheduling_policy_arn : String? = nil,
        service_environment_order : Array(Types::ServiceEnvironmentOrder)? = nil,
        state : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateJobQueueRequest.new(job_queue_name: job_queue_name, priority: priority, compute_environment_order: compute_environment_order, job_queue_type: job_queue_type, job_state_time_limit_actions: job_state_time_limit_actions, scheduling_policy_arn: scheduling_policy_arn, service_environment_order: service_environment_order, state: state, tags: tags)
        create_job_queue(input)
      end

      def create_job_queue(input : Types::CreateJobQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Batch scheduling policy.

      def create_scheduling_policy(
        name : String,
        fairshare_policy : Types::FairsharePolicy? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSchedulingPolicyRequest.new(name: name, fairshare_policy: fairshare_policy, tags: tags)
        create_scheduling_policy(input)
      end

      def create_scheduling_policy(input : Types::CreateSchedulingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEDULING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service environment for running service jobs. Service environments define capacity limits
      # for specific service types such as SageMaker Training jobs.

      def create_service_environment(
        capacity_limits : Array(Types::CapacityLimit),
        service_environment_name : String,
        service_environment_type : String,
        state : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateServiceEnvironmentRequest.new(capacity_limits: capacity_limits, service_environment_name: service_environment_name, service_environment_type: service_environment_type, state: state, tags: tags)
        create_service_environment(input)
      end

      def create_service_environment(input : Types::CreateServiceEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Batch compute environment. Before you can delete a compute environment, you must set its
      # state to DISABLED with the UpdateComputeEnvironment API operation and disassociate it from any job
      # queues with the UpdateJobQueue API operation. Compute environments that use Fargate resources must
      # terminate all active jobs on that compute environment before deleting the compute environment. If
      # this isn't done, the compute environment enters an invalid state.

      def delete_compute_environment(
        compute_environment : String
      ) : Protocol::Request
        input = Types::DeleteComputeEnvironmentRequest.new(compute_environment: compute_environment)
        delete_compute_environment(input)
      end

      def delete_compute_environment(input : Types::DeleteComputeEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPUTE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified consumable resource.

      def delete_consumable_resource(
        consumable_resource : String
      ) : Protocol::Request
        input = Types::DeleteConsumableResourceRequest.new(consumable_resource: consumable_resource)
        delete_consumable_resource(input)
      end

      def delete_consumable_resource(input : Types::DeleteConsumableResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONSUMABLE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified job queue. You must first disable submissions for a queue with the
      # UpdateJobQueue operation. All jobs in the queue are eventually terminated when you delete a job
      # queue. The jobs are terminated at a rate of about 16 jobs each second. It's not necessary to
      # disassociate compute environments from a queue before submitting a DeleteJobQueue request.

      def delete_job_queue(
        job_queue : String
      ) : Protocol::Request
        input = Types::DeleteJobQueueRequest.new(job_queue: job_queue)
        delete_job_queue(input)
      end

      def delete_job_queue(input : Types::DeleteJobQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified scheduling policy. You can't delete a scheduling policy that's used in any job
      # queues.

      def delete_scheduling_policy(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteSchedulingPolicyRequest.new(arn: arn)
        delete_scheduling_policy(input)
      end

      def delete_scheduling_policy(input : Types::DeleteSchedulingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Service environment. Before you can delete a service environment, you must first set its
      # state to DISABLED with the UpdateServiceEnvironment API operation and disassociate it from any job
      # queues with the UpdateJobQueue API operation.

      def delete_service_environment(
        service_environment : String
      ) : Protocol::Request
        input = Types::DeleteServiceEnvironmentRequest.new(service_environment: service_environment)
        delete_service_environment(input)
      end

      def delete_service_environment(input : Types::DeleteServiceEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters an Batch job definition. Job definitions are permanently deleted after 180 days.

      def deregister_job_definition(
        job_definition : String
      ) : Protocol::Request
        input = Types::DeregisterJobDefinitionRequest.new(job_definition: job_definition)
        deregister_job_definition(input)
      end

      def deregister_job_definition(input : Types::DeregisterJobDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_JOB_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more of your compute environments. If you're using an unmanaged compute
      # environment, you can use the DescribeComputeEnvironment operation to determine the ecsClusterArn
      # that you launch your Amazon ECS container instances into.

      def describe_compute_environments(
        compute_environments : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeComputeEnvironmentsRequest.new(compute_environments: compute_environments, max_results: max_results, next_token: next_token)
        describe_compute_environments(input)
      end

      def describe_compute_environments(input : Types::DescribeComputeEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_COMPUTE_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a description of the specified consumable resource.

      def describe_consumable_resource(
        consumable_resource : String
      ) : Protocol::Request
        input = Types::DescribeConsumableResourceRequest.new(consumable_resource: consumable_resource)
        describe_consumable_resource(input)
      end

      def describe_consumable_resource(input : Types::DescribeConsumableResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONSUMABLE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a list of job definitions. You can specify a status (such as ACTIVE ) to only return job
      # definitions that match that status.

      def describe_job_definitions(
        job_definition_name : String? = nil,
        job_definitions : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobDefinitionsRequest.new(job_definition_name: job_definition_name, job_definitions: job_definitions, max_results: max_results, next_token: next_token, status: status)
        describe_job_definitions(input)
      end

      def describe_job_definitions(input : Types::DescribeJobDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more of your job queues.

      def describe_job_queues(
        job_queues : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeJobQueuesRequest.new(job_queues: job_queues, max_results: max_results, next_token: next_token)
        describe_job_queues(input)
      end

      def describe_job_queues(input : Types::DescribeJobQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a list of Batch jobs.

      def describe_jobs(
        jobs : Array(String)
      ) : Protocol::Request
        input = Types::DescribeJobsRequest.new(jobs: jobs)
        describe_jobs(input)
      end

      def describe_jobs(input : Types::DescribeJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more of your scheduling policies.

      def describe_scheduling_policies(
        arns : Array(String)
      ) : Protocol::Request
        input = Types::DescribeSchedulingPoliciesRequest.new(arns: arns)
        describe_scheduling_policies(input)
      end

      def describe_scheduling_policies(input : Types::DescribeSchedulingPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCHEDULING_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes one or more of your service environments.

      def describe_service_environments(
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_environments : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeServiceEnvironmentsRequest.new(max_results: max_results, next_token: next_token, service_environments: service_environments)
        describe_service_environments(input)
      end

      def describe_service_environments(input : Types::DescribeServiceEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SERVICE_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The details of a service job.

      def describe_service_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeServiceJobRequest.new(job_id: job_id)
        describe_service_job(input)
      end

      def describe_service_job(input : Types::DescribeServiceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SERVICE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of the first 100 RUNNABLE jobs associated to a single job queue.

      def get_job_queue_snapshot(
        job_queue : String
      ) : Protocol::Request
        input = Types::GetJobQueueSnapshotRequest.new(job_queue: job_queue)
        get_job_queue_snapshot(input)
      end

      def get_job_queue_snapshot(input : Types::GetJobQueueSnapshotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_QUEUE_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Batch consumable resources.

      def list_consumable_resources(
        filters : Array(Types::KeyValuesPair)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConsumableResourcesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_consumable_resources(input)
      end

      def list_consumable_resources(input : Types::ListConsumableResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONSUMABLE_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Batch jobs. You must specify only one of the following items: A job queue ID to
      # return a list of jobs in that job queue A multi-node parallel job ID to return a list of nodes for
      # that job An array job ID to return a list of the children for that job You can filter the results by
      # job status with the jobStatus parameter. If you don't specify a status, only RUNNING jobs are
      # returned.

      def list_jobs(
        array_job_id : String? = nil,
        filters : Array(Types::KeyValuesPair)? = nil,
        job_queue : String? = nil,
        job_status : String? = nil,
        max_results : Int32? = nil,
        multi_node_job_id : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsRequest.new(array_job_id: array_job_id, filters: filters, job_queue: job_queue, job_status: job_status, max_results: max_results, multi_node_job_id: multi_node_job_id, next_token: next_token)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Batch jobs that require a specific consumable resource.

      def list_jobs_by_consumable_resource(
        consumable_resource : String,
        filters : Array(Types::KeyValuesPair)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsByConsumableResourceRequest.new(consumable_resource: consumable_resource, filters: filters, max_results: max_results, next_token: next_token)
        list_jobs_by_consumable_resource(input)
      end

      def list_jobs_by_consumable_resource(input : Types::ListJobsByConsumableResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS_BY_CONSUMABLE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Batch scheduling policies.

      def list_scheduling_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSchedulingPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_scheduling_policies(input)
      end

      def list_scheduling_policies(input : Types::ListSchedulingPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULING_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of service jobs for a specified job queue.

      def list_service_jobs(
        filters : Array(Types::KeyValuesPair)? = nil,
        job_queue : String? = nil,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServiceJobsRequest.new(filters: filters, job_queue: job_queue, job_status: job_status, max_results: max_results, next_token: next_token)
        list_service_jobs(input)
      end

      def list_service_jobs(input : Types::ListServiceJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICE_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for an Batch resource. Batch resources that support tags are compute environments,
      # jobs, job definitions, job queues, and scheduling policies. ARNs for child jobs of array and
      # multi-node parallel (MNP) jobs aren't supported.

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

      # Registers an Batch job definition.

      def register_job_definition(
        job_definition_name : String,
        type : String,
        consumable_resource_properties : Types::ConsumableResourceProperties? = nil,
        container_properties : Types::ContainerProperties? = nil,
        ecs_properties : Types::EcsProperties? = nil,
        eks_properties : Types::EksProperties? = nil,
        node_properties : Types::NodeProperties? = nil,
        parameters : Hash(String, String)? = nil,
        platform_capabilities : Array(String)? = nil,
        propagate_tags : Bool? = nil,
        retry_strategy : Types::RetryStrategy? = nil,
        scheduling_priority : Int32? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Types::JobTimeout? = nil
      ) : Protocol::Request
        input = Types::RegisterJobDefinitionRequest.new(job_definition_name: job_definition_name, type: type, consumable_resource_properties: consumable_resource_properties, container_properties: container_properties, ecs_properties: ecs_properties, eks_properties: eks_properties, node_properties: node_properties, parameters: parameters, platform_capabilities: platform_capabilities, propagate_tags: propagate_tags, retry_strategy: retry_strategy, scheduling_priority: scheduling_priority, tags: tags, timeout: timeout)
        register_job_definition(input)
      end

      def register_job_definition(input : Types::RegisterJobDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_JOB_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits an Batch job from a job definition. Parameters that are specified during SubmitJob override
      # parameters defined in the job definition. vCPU and memory requirements that are specified in the
      # resourceRequirements objects in the job definition are the exception. They can't be overridden this
      # way using the memory and vcpus parameters. Rather, you must specify updates to job definition
      # parameters in a resourceRequirements object that's included in the containerOverrides parameter. Job
      # queues with a scheduling policy are limited to 500 active share identifiers at a time. Jobs that run
      # on Fargate resources can't be guaranteed to run for more than 14 days. This is because, after 14
      # days, Fargate resources might become unavailable and job might be terminated.

      def submit_job(
        job_definition : String,
        job_name : String,
        job_queue : String,
        array_properties : Types::ArrayProperties? = nil,
        consumable_resource_properties_override : Types::ConsumableResourceProperties? = nil,
        container_overrides : Types::ContainerOverrides? = nil,
        depends_on : Array(Types::JobDependency)? = nil,
        ecs_properties_override : Types::EcsPropertiesOverride? = nil,
        eks_properties_override : Types::EksPropertiesOverride? = nil,
        node_overrides : Types::NodeOverrides? = nil,
        parameters : Hash(String, String)? = nil,
        propagate_tags : Bool? = nil,
        retry_strategy : Types::RetryStrategy? = nil,
        scheduling_priority_override : Int32? = nil,
        share_identifier : String? = nil,
        tags : Hash(String, String)? = nil,
        timeout : Types::JobTimeout? = nil
      ) : Protocol::Request
        input = Types::SubmitJobRequest.new(job_definition: job_definition, job_name: job_name, job_queue: job_queue, array_properties: array_properties, consumable_resource_properties_override: consumable_resource_properties_override, container_overrides: container_overrides, depends_on: depends_on, ecs_properties_override: ecs_properties_override, eks_properties_override: eks_properties_override, node_overrides: node_overrides, parameters: parameters, propagate_tags: propagate_tags, retry_strategy: retry_strategy, scheduling_priority_override: scheduling_priority_override, share_identifier: share_identifier, tags: tags, timeout: timeout)
        submit_job(input)
      end

      def submit_job(input : Types::SubmitJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBMIT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits a service job to a specified job queue to run on SageMaker AI. A service job is a unit of
      # work that you submit to Batch for execution on SageMaker AI.

      def submit_service_job(
        job_name : String,
        job_queue : String,
        service_job_type : String,
        service_request_payload : String,
        client_token : String? = nil,
        retry_strategy : Types::ServiceJobRetryStrategy? = nil,
        scheduling_priority : Int32? = nil,
        share_identifier : String? = nil,
        tags : Hash(String, String)? = nil,
        timeout_config : Types::ServiceJobTimeout? = nil
      ) : Protocol::Request
        input = Types::SubmitServiceJobRequest.new(job_name: job_name, job_queue: job_queue, service_job_type: service_job_type, service_request_payload: service_request_payload, client_token: client_token, retry_strategy: retry_strategy, scheduling_priority: scheduling_priority, share_identifier: share_identifier, tags: tags, timeout_config: timeout_config)
        submit_service_job(input)
      end

      def submit_service_job(input : Types::SubmitServiceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBMIT_SERVICE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource aren't specified in the request parameters, they aren't changed. When a resource is
      # deleted, the tags that are associated with that resource are deleted as well. Batch resources that
      # support tags are compute environments, jobs, job definitions, job queues, and scheduling policies.
      # ARNs for child jobs of array and multi-node parallel (MNP) jobs aren't supported.

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

      # Terminates a job in a job queue. Jobs that are in the STARTING or RUNNING state are terminated,
      # which causes them to transition to FAILED . Jobs that have not progressed to the STARTING state are
      # cancelled.

      def terminate_job(
        job_id : String,
        reason : String
      ) : Protocol::Request
        input = Types::TerminateJobRequest.new(job_id: job_id, reason: reason)
        terminate_job(input)
      end

      def terminate_job(input : Types::TerminateJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Terminates a service job in a job queue.

      def terminate_service_job(
        job_id : String,
        reason : String
      ) : Protocol::Request
        input = Types::TerminateServiceJobRequest.new(job_id: job_id, reason: reason)
        terminate_service_job(input)
      end

      def terminate_service_job(input : Types::TerminateServiceJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TERMINATE_SERVICE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes specified tags from an Batch resource.

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

      # Updates an Batch compute environment.

      def update_compute_environment(
        compute_environment : String,
        compute_resources : Types::ComputeResourceUpdate? = nil,
        context : String? = nil,
        service_role : String? = nil,
        state : String? = nil,
        unmanagedv_cpus : Int32? = nil,
        update_policy : Types::UpdatePolicy? = nil
      ) : Protocol::Request
        input = Types::UpdateComputeEnvironmentRequest.new(compute_environment: compute_environment, compute_resources: compute_resources, context: context, service_role: service_role, state: state, unmanagedv_cpus: unmanagedv_cpus, update_policy: update_policy)
        update_compute_environment(input)
      end

      def update_compute_environment(input : Types::UpdateComputeEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COMPUTE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a consumable resource.

      def update_consumable_resource(
        consumable_resource : String,
        client_token : String? = nil,
        operation : String? = nil,
        quantity : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateConsumableResourceRequest.new(consumable_resource: consumable_resource, client_token: client_token, operation: operation, quantity: quantity)
        update_consumable_resource(input)
      end

      def update_consumable_resource(input : Types::UpdateConsumableResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONSUMABLE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a job queue.

      def update_job_queue(
        job_queue : String,
        compute_environment_order : Array(Types::ComputeEnvironmentOrder)? = nil,
        job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)? = nil,
        priority : Int32? = nil,
        scheduling_policy_arn : String? = nil,
        service_environment_order : Array(Types::ServiceEnvironmentOrder)? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateJobQueueRequest.new(job_queue: job_queue, compute_environment_order: compute_environment_order, job_state_time_limit_actions: job_state_time_limit_actions, priority: priority, scheduling_policy_arn: scheduling_policy_arn, service_environment_order: service_environment_order, state: state)
        update_job_queue(input)
      end

      def update_job_queue(input : Types::UpdateJobQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_JOB_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a scheduling policy.

      def update_scheduling_policy(
        arn : String,
        fairshare_policy : Types::FairsharePolicy? = nil
      ) : Protocol::Request
        input = Types::UpdateSchedulingPolicyRequest.new(arn: arn, fairshare_policy: fairshare_policy)
        update_scheduling_policy(input)
      end

      def update_scheduling_policy(input : Types::UpdateSchedulingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEDULING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a service environment. You can update the state of a service environment from ENABLED to
      # DISABLED to prevent new service jobs from being placed in the service environment.

      def update_service_environment(
        service_environment : String,
        capacity_limits : Array(Types::CapacityLimit)? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateServiceEnvironmentRequest.new(service_environment: service_environment, capacity_limits: capacity_limits, state: state)
        update_service_environment(input)
      end

      def update_service_environment(input : Types::UpdateServiceEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
