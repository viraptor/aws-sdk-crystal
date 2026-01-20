module Aws
  module Synthetics
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associates a canary with a group. Using groups can help you with managing and automating your
      # canaries, and you can also view aggregated run results and statistics for all canaries in a group.
      # You must run this operation in the Region where the canary exists.

      def associate_resource(
        group_identifier : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::AssociateResourceRequest.new(group_identifier: group_identifier, resource_arn: resource_arn)
        associate_resource(input)
      end

      def associate_resource(input : Types::AssociateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a canary. Canaries are scripts that monitor your endpoints and APIs from the outside-in.
      # Canaries help you check the availability and latency of your web services and troubleshoot anomalies
      # by investigating load time data, screenshots of the UI, logs, and metrics. You can set up a canary
      # to run continuously or just once. Do not use CreateCanary to modify an existing canary. Use
      # UpdateCanary instead. To create canaries, you must have the CloudWatchSyntheticsFullAccess policy.
      # If you are creating a new IAM role for the canary, you also need the iam:CreateRole ,
      # iam:CreatePolicy and iam:AttachRolePolicy permissions. For more information, see Necessary Roles and
      # Permissions . Do not include secrets or proprietary information in your canary names. The canary
      # name makes up part of the Amazon Resource Name (ARN) for the canary, and the ARN is included in
      # outbound calls over the internet. For more information, see Security Considerations for Synthetics
      # Canaries .

      def create_canary(
        artifact_s3_location : String,
        code : Types::CanaryCodeInput,
        execution_role_arn : String,
        name : String,
        runtime_version : String,
        schedule : Types::CanaryScheduleInput,
        artifact_config : Types::ArtifactConfigInput? = nil,
        browser_configs : Array(Types::BrowserConfig)? = nil,
        failure_retention_period_in_days : Int32? = nil,
        provisioned_resource_cleanup : String? = nil,
        resources_to_replicate_tags : Array(String)? = nil,
        run_config : Types::CanaryRunConfigInput? = nil,
        success_retention_period_in_days : Int32? = nil,
        tags : Hash(String, String)? = nil,
        vpc_config : Types::VpcConfigInput? = nil
      ) : Protocol::Request
        input = Types::CreateCanaryRequest.new(artifact_s3_location: artifact_s3_location, code: code, execution_role_arn: execution_role_arn, name: name, runtime_version: runtime_version, schedule: schedule, artifact_config: artifact_config, browser_configs: browser_configs, failure_retention_period_in_days: failure_retention_period_in_days, provisioned_resource_cleanup: provisioned_resource_cleanup, resources_to_replicate_tags: resources_to_replicate_tags, run_config: run_config, success_retention_period_in_days: success_retention_period_in_days, tags: tags, vpc_config: vpc_config)
        create_canary(input)
      end

      def create_canary(input : Types::CreateCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a group which you can use to associate canaries with each other, including cross-Region
      # canaries. Using groups can help you with managing and automating your canaries, and you can also
      # view aggregated run results and statistics for all canaries in a group. Groups are global resources.
      # When you create a group, it is replicated across Amazon Web Services Regions, and you can view it
      # and add canaries to it from any Region. Although the group ARN format reflects the Region name where
      # it was created, a group is not constrained to any Region. This means that you can put canaries from
      # multiple Regions into the same group, and then use that group to view and manage all of those
      # canaries in a single view. Groups are supported in all Regions except the Regions that are disabled
      # by default. For more information about these Regions, see Enabling a Region . Each group can contain
      # as many as 10 canaries. You can have as many as 20 groups in your account. Any single canary can be
      # a member of up to 10 groups.

      def create_group(
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGroupRequest.new(name: name, tags: tags)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Permanently deletes the specified canary. If the canary's ProvisionedResourceCleanup field is set to
      # AUTOMATIC or you specify DeleteLambda in this operation as true , CloudWatch Synthetics also deletes
      # the Lambda functions and layers that are used by the canary. Other resources used and created by the
      # canary are not automatically deleted. After you delete a canary, you should also delete the
      # following: The CloudWatch alarms created for this canary. These alarms have a name of
      # Synthetics-Alarm- first-198-characters-of-canary-name - canaryId - alarm number Amazon S3 objects
      # and buckets, such as the canary's artifact location. IAM roles created for the canary. If they were
      # created in the console, these roles have the name role/service-role/CloudWatchSyntheticsRole-
      # First-21-Characters-of-CanaryName CloudWatch Logs log groups created for the canary. These logs
      # groups have the name /aws/lambda/cwsyn- First-21-Characters-of-CanaryName Before you delete a
      # canary, you might want to use GetCanary to display the information about this canary. Make note of
      # the information returned by this operation so that you can delete these resources after you delete
      # the canary.

      def delete_canary(
        name : String,
        delete_lambda : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteCanaryRequest.new(name: name, delete_lambda: delete_lambda)
        delete_canary(input)
      end

      def delete_canary(input : Types::DeleteCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a group. The group doesn't need to be empty to be deleted. If there are canaries in the
      # group, they are not deleted when you delete the group. Groups are a global resource that appear in
      # all Regions, but the request to delete a group must be made from its home Region. You can find the
      # home Region of a group within its ARN.

      def delete_group(
        group_identifier : String
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(group_identifier: group_identifier)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of the canaries in your account, along with full details about each
      # canary. This operation supports resource-level authorization using an IAM policy and the Names
      # parameter. If you specify the Names parameter, the operation is successful only if you have
      # authorization to view all the canaries that you specify in your request. If you do not have
      # permission to view any of the canaries, the request fails with a 403 response. You are required to
      # use the Names parameter if you are logged on to a user or role that has an IAM policy that restricts
      # which canaries that you are allowed to view. For more information, see Limiting a user to viewing
      # specific canaries .

      def describe_canaries(
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeCanariesRequest.new(max_results: max_results, names: names, next_token: next_token)
        describe_canaries(input)
      end

      def describe_canaries(input : Types::DescribeCanariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CANARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to see information from the most recent run of each canary that you have created.
      # This operation supports resource-level authorization using an IAM policy and the Names parameter. If
      # you specify the Names parameter, the operation is successful only if you have authorization to view
      # all the canaries that you specify in your request. If you do not have permission to view any of the
      # canaries, the request fails with a 403 response. You are required to use the Names parameter if you
      # are logged on to a user or role that has an IAM policy that restricts which canaries that you are
      # allowed to view. For more information, see Limiting a user to viewing specific canaries .

      def describe_canaries_last_run(
        browser_type : String? = nil,
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeCanariesLastRunRequest.new(browser_type: browser_type, max_results: max_results, names: names, next_token: next_token)
        describe_canaries_last_run(input)
      end

      def describe_canaries_last_run(input : Types::DescribeCanariesLastRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CANARIES_LAST_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of Synthetics canary runtime versions. For more information, see Canary Runtime
      # Versions .

      def describe_runtime_versions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRuntimeVersionsRequest.new(max_results: max_results, next_token: next_token)
        describe_runtime_versions(input)
      end

      def describe_runtime_versions(input : Types::DescribeRuntimeVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RUNTIME_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a canary from a group. You must run this operation in the Region where the canary exists.

      def disassociate_resource(
        group_identifier : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::DisassociateResourceRequest.new(group_identifier: group_identifier, resource_arn: resource_arn)
        disassociate_resource(input)
      end

      def disassociate_resource(input : Types::DisassociateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves complete information about one canary. You must specify the name of the canary that you
      # want. To get a list of canaries and their names, use DescribeCanaries .

      def get_canary(
        name : String,
        dry_run_id : String? = nil
      ) : Protocol::Request
        input = Types::GetCanaryRequest.new(name: name, dry_run_id: dry_run_id)
        get_canary(input)
      end

      def get_canary(input : Types::GetCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of runs for a specified canary.

      def get_canary_runs(
        name : String,
        dry_run_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        run_type : String? = nil
      ) : Protocol::Request
        input = Types::GetCanaryRunsRequest.new(name: name, dry_run_id: dry_run_id, max_results: max_results, next_token: next_token, run_type: run_type)
        get_canary_runs(input)
      end

      def get_canary_runs(input : Types::GetCanaryRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CANARY_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about one group. Groups are a global resource, so you can use this operation
      # from any Region.

      def get_group(
        group_identifier : String
      ) : Protocol::Request
        input = Types::GetGroupRequest.new(group_identifier: group_identifier)
        get_group(input)
      end

      def get_group(input : Types::GetGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the groups that the specified canary is associated with. The canary that you
      # specify must be in the current Region.

      def list_associated_groups(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedGroupsRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_associated_groups(input)
      end

      def list_associated_groups(input : Types::ListAssociatedGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of the ARNs of the canaries that are associated with the specified
      # group.

      def list_group_resources(
        group_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupResourcesRequest.new(group_identifier: group_identifier, max_results: max_results, next_token: next_token)
        list_group_resources(input)
      end

      def list_group_resources(input : Types::ListGroupResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all groups in the account, displaying their names, unique IDs, and ARNs. The
      # groups from all Regions are returned.

      def list_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a canary or group.

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

      # Use this operation to run a canary that has already been created. The frequency of the canary runs
      # is determined by the value of the canary's Schedule . To see a canary's schedule, use GetCanary .

      def start_canary(
        name : String
      ) : Protocol::Request
        input = Types::StartCanaryRequest.new(name: name)
        start_canary(input)
      end

      def start_canary(input : Types::StartCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to start a dry run for a canary that has already been created

      def start_canary_dry_run(
        name : String,
        artifact_config : Types::ArtifactConfigInput? = nil,
        artifact_s3_location : String? = nil,
        browser_configs : Array(Types::BrowserConfig)? = nil,
        code : Types::CanaryCodeInput? = nil,
        execution_role_arn : String? = nil,
        failure_retention_period_in_days : Int32? = nil,
        provisioned_resource_cleanup : String? = nil,
        run_config : Types::CanaryRunConfigInput? = nil,
        runtime_version : String? = nil,
        success_retention_period_in_days : Int32? = nil,
        visual_reference : Types::VisualReferenceInput? = nil,
        visual_references : Array(Types::VisualReferenceInput)? = nil,
        vpc_config : Types::VpcConfigInput? = nil
      ) : Protocol::Request
        input = Types::StartCanaryDryRunRequest.new(name: name, artifact_config: artifact_config, artifact_s3_location: artifact_s3_location, browser_configs: browser_configs, code: code, execution_role_arn: execution_role_arn, failure_retention_period_in_days: failure_retention_period_in_days, provisioned_resource_cleanup: provisioned_resource_cleanup, run_config: run_config, runtime_version: runtime_version, success_retention_period_in_days: success_retention_period_in_days, visual_reference: visual_reference, visual_references: visual_references, vpc_config: vpc_config)
        start_canary_dry_run(input)
      end

      def start_canary_dry_run(input : Types::StartCanaryDryRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CANARY_DRY_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the canary to prevent all future runs. If the canary is currently running,the run that is in
      # progress completes on its own, publishes metrics, and uploads artifacts, but it is not recorded in
      # Synthetics as a completed run. You can use StartCanary to start it running again with the canary’s
      # current schedule at any point in the future.

      def stop_canary(
        name : String
      ) : Protocol::Request
        input = Types::StopCanaryRequest.new(name: name)
        stop_canary(input)
      end

      def stop_canary(input : Types::StopCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified canary or group. Tags can help you
      # organize and categorize your resources. You can also use them to scope user permissions, by granting
      # a user permission to access or change only resources with certain tag values. Tags don't have any
      # semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters. You
      # can use the TagResource action with a resource that already has tags. If you specify a new tag key
      # for the resource, this tag is appended to the list of tags associated with the resource. If you
      # specify a tag key that is already associated with the resource, the new tag value that you specify
      # replaces the previous value for that tag. You can associate as many as 50 tags with a canary or
      # group.

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

      # Removes one or more tags from the specified resource.

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

      # Updates the configuration of a canary that has already been created. For multibrowser canaries, you
      # can add or remove browsers by updating the browserConfig list in the update call. For example: To
      # add Firefox to a canary that currently uses Chrome, specify browserConfigs as [CHROME, FIREFOX] To
      # remove Firefox and keep only Chrome, specify browserConfigs as [CHROME] You can't use this operation
      # to update the tags of an existing canary. To change the tags of an existing canary, use TagResource
      # . When you use the dryRunId field when updating a canary, the only other field you can provide is
      # the Schedule . Adding any other field will thrown an exception.

      def update_canary(
        name : String,
        artifact_config : Types::ArtifactConfigInput? = nil,
        artifact_s3_location : String? = nil,
        browser_configs : Array(Types::BrowserConfig)? = nil,
        code : Types::CanaryCodeInput? = nil,
        dry_run_id : String? = nil,
        execution_role_arn : String? = nil,
        failure_retention_period_in_days : Int32? = nil,
        provisioned_resource_cleanup : String? = nil,
        run_config : Types::CanaryRunConfigInput? = nil,
        runtime_version : String? = nil,
        schedule : Types::CanaryScheduleInput? = nil,
        success_retention_period_in_days : Int32? = nil,
        visual_reference : Types::VisualReferenceInput? = nil,
        visual_references : Array(Types::VisualReferenceInput)? = nil,
        vpc_config : Types::VpcConfigInput? = nil
      ) : Protocol::Request
        input = Types::UpdateCanaryRequest.new(name: name, artifact_config: artifact_config, artifact_s3_location: artifact_s3_location, browser_configs: browser_configs, code: code, dry_run_id: dry_run_id, execution_role_arn: execution_role_arn, failure_retention_period_in_days: failure_retention_period_in_days, provisioned_resource_cleanup: provisioned_resource_cleanup, run_config: run_config, runtime_version: runtime_version, schedule: schedule, success_retention_period_in_days: success_retention_period_in_days, visual_reference: visual_reference, visual_references: visual_references, vpc_config: vpc_config)
        update_canary(input)
      end

      def update_canary(input : Types::UpdateCanaryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CANARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
