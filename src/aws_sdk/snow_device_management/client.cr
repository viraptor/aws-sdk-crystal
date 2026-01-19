module AwsSdk
  module SnowDeviceManagement
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

      # Sends a cancel request for a specified task. You can cancel a task only if it's still in a QUEUED
      # state. Tasks that are already running can't be cancelled. A task might still run if it's processed
      # from the queue before the CancelTask operation changes the task's state.
      def cancel_task(
        task_id : String
      ) : Protocol::Request
        input = Types::CancelTaskInput.new(task_id: task_id)
        cancel_task(input)
      end
      def cancel_task(input : Types::CancelTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Instructs one or more devices to start a task, such as unlocking or rebooting.
      def create_task(
        command : Types::Command,
        targets : Array(String),
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTaskInput.new(command: command, targets: targets, client_token: client_token, description: description, tags: tags)
        create_task(input)
      end
      def create_task(input : Types::CreateTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks device-specific information, such as the device type, software version, IP addresses, and
      # lock status.
      def describe_device(
        managed_device_id : String
      ) : Protocol::Request
        input = Types::DescribeDeviceInput.new(managed_device_id: managed_device_id)
        describe_device(input)
      end
      def describe_device(input : Types::DescribeDeviceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks the current state of the Amazon EC2 instances. The output is similar to describeDevice , but
      # the results are sourced from the device cache in the Amazon Web Services Cloud and include a subset
      # of the available fields.
      def describe_device_ec2_instances(
        instance_ids : Array(String),
        managed_device_id : String
      ) : Protocol::Request
        input = Types::DescribeDeviceEc2Input.new(instance_ids: instance_ids, managed_device_id: managed_device_id)
        describe_device_ec2_instances(input)
      end
      def describe_device_ec2_instances(input : Types::DescribeDeviceEc2Input) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEVICE_EC2_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks the status of a remote task running on one or more target devices.
      def describe_execution(
        managed_device_id : String,
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeExecutionInput.new(managed_device_id: managed_device_id, task_id: task_id)
        describe_execution(input)
      end
      def describe_execution(input : Types::DescribeExecutionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks the metadata for a given task on a device.
      def describe_task(
        task_id : String
      ) : Protocol::Request
        input = Types::DescribeTaskInput.new(task_id: task_id)
        describe_task(input)
      end
      def describe_task(input : Types::DescribeTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the Amazon Web Services resources available for a device. Currently, Amazon EC2
      # instances are the only supported resource type.
      def list_device_resources(
        managed_device_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListDeviceResourcesInput.new(managed_device_id: managed_device_id, max_results: max_results, next_token: next_token, type: type)
        list_device_resources(input)
      end
      def list_device_resources(input : Types::ListDeviceResourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICE_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all devices on your Amazon Web Services account that have Amazon Web Services Snow
      # Device Management enabled in the Amazon Web Services Region where the command is run.
      def list_devices(
        job_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevicesInput.new(job_id: job_id, max_results: max_results, next_token: next_token)
        list_devices(input)
      end
      def list_devices(input : Types::ListDevicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of tasks for one or more target devices.
      def list_executions(
        task_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListExecutionsInput.new(task_id: task_id, max_results: max_results, next_token: next_token, state: state)
        list_executions(input)
      end
      def list_executions(input : Types::ListExecutionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags for a managed device or task.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tasks that can be filtered by state.
      def list_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListTasksInput.new(max_results: max_results, next_token: next_token, state: state)
        list_tasks(input)
      end
      def list_tasks(input : Types::ListTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or replaces tags on a device or task.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a device or task.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
