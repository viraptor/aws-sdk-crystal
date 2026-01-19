module AwsSdk
  module AIOps
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

      # Creates an investigation group in your account. Creating an investigation group is a one-time setup
      # task for each Region in your account. It is a necessary task to be able to perform investigations.
      # Settings in the investigation group help you centrally manage the common properties of your
      # investigations, such as the following: Who can access the investigations Whether investigation data
      # is encrypted with a customer managed Key Management Service key. How long investigations and their
      # data are retained by default. Currently, you can have one investigation group in each Region in your
      # account. Each investigation in a Region is a part of the investigation group in that Region To
      # create an investigation group and set up CloudWatch investigations, you must be signed in to an IAM
      # principal that has either the AIOpsConsoleAdminPolicy or the AdministratorAccess IAM policy
      # attached, or to an account that has similar permissions. You can configure CloudWatch alarms to
      # start investigations and add events to investigations. If you create your investigation group with
      # CreateInvestigationGroup and you want to enable alarms to do this, you must use
      # PutInvestigationGroupPolicy to create a resource policy that grants this permission to CloudWatch
      # alarms. For more information about configuring CloudWatch alarms, see Using Amazon CloudWatch alarms
      def create_investigation_group(
        name : String,
        role_arn : String,
        chatbot_notification_channel : Hash(String, Array(String))? = nil,
        cross_account_configurations : Array(Types::CrossAccountConfiguration)? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        is_cloud_trail_event_history_enabled : Bool? = nil,
        retention_in_days : Int64? = nil,
        tag_key_boundaries : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateInvestigationGroupInput.new(name: name, role_arn: role_arn, chatbot_notification_channel: chatbot_notification_channel, cross_account_configurations: cross_account_configurations, encryption_configuration: encryption_configuration, is_cloud_trail_event_history_enabled: is_cloud_trail_event_history_enabled, retention_in_days: retention_in_days, tag_key_boundaries: tag_key_boundaries, tags: tags)
        create_investigation_group(input)
      end
      def create_investigation_group(input : Types::CreateInvestigationGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INVESTIGATION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified investigation group from your account. You can currently have one
      # investigation group per Region in your account. After you delete an investigation group, you can
      # later create a new investigation group in the same Region.
      def delete_investigation_group(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteInvestigationGroupRequest.new(identifier: identifier)
        delete_investigation_group(input)
      end
      def delete_investigation_group(input : Types::DeleteInvestigationGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INVESTIGATION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the IAM resource policy from being associated with the investigation group that you specify.
      def delete_investigation_group_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteInvestigationGroupPolicyRequest.new(identifier: identifier)
        delete_investigation_group_policy(input)
      end
      def delete_investigation_group_policy(input : Types::DeleteInvestigationGroupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INVESTIGATION_GROUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the configuration information for the specified investigation group.
      def get_investigation_group(
        identifier : String
      ) : Protocol::Request
        input = Types::GetInvestigationGroupRequest.new(identifier: identifier)
        get_investigation_group(input)
      end
      def get_investigation_group(input : Types::GetInvestigationGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVESTIGATION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the JSON of the IAM resource policy associated with the specified investigation group in a
      # string. For example,
      # {\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"aiops.alarms.cloudwatch.amazonaws.com\"},\"Action\":[\"aiops:CreateInvestigation\",\"aiops:CreateInvestigationEvent\"],\"Resource\":\"*\",\"Condition\":{\"StringEquals\":{\"aws:SourceAccount\":\"111122223333\"},\"ArnLike\":{\"aws:SourceArn\":\"arn:aws:cloudwatch:us-east-1:111122223333:alarm:*\"}}}]}
      # .
      def get_investigation_group_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::GetInvestigationGroupPolicyRequest.new(identifier: identifier)
        get_investigation_group_policy(input)
      end
      def get_investigation_group_policy(input : Types::GetInvestigationGroupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVESTIGATION_GROUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the ARN and name of each investigation group in the account.
      def list_investigation_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvestigationGroupsInput.new(max_results: max_results, next_token: next_token)
        list_investigation_groups(input)
      end
      def list_investigation_groups(input : Types::ListInvestigationGroupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVESTIGATION_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a CloudWatch investigations resource. Currently, investigation
      # groups support tagging.
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

      # Creates an IAM resource policy and assigns it to the specified investigation group. If you create
      # your investigation group with CreateInvestigationGroup and you want to enable CloudWatch alarms to
      # create investigations and add events to investigations, you must use this operation to create a
      # policy similar to this example. { "Version": "2008-10-17", "Statement": [ { "Effect": "Allow",
      # "Principal": { "Service": "aiops.alarms.cloudwatch.amazonaws.com" }, "Action": [
      # "aiops:CreateInvestigation", "aiops:CreateInvestigationEvent" ], "Resource": "*", "Condition": {
      # "StringEquals": { "aws:SourceAccount": "account-id" }, "ArnLike": { "aws:SourceArn":
      # "arn:aws:cloudwatch:region:account-id:alarm:*" } } } ] }
      def put_investigation_group_policy(
        identifier : String,
        policy : String
      ) : Protocol::Request
        input = Types::PutInvestigationGroupPolicyRequest.new(identifier: identifier, policy: policy)
        put_investigation_group_policy(input)
      end
      def put_investigation_group_policy(input : Types::PutInvestigationGroupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INVESTIGATION_GROUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified resource. Tags can help you organize and
      # categorize your resources. You can also use them to scope user permissions by granting a user
      # permission to access or change only resources with certain tag values. Tags don't have any semantic
      # meaning to Amazon Web Services and are interpreted strictly as strings of characters. You can
      # associate as many as 50 tags with a resource.
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

      # Updates the configuration of the specified investigation group.
      def update_investigation_group(
        identifier : String,
        chatbot_notification_channel : Hash(String, Array(String))? = nil,
        cross_account_configurations : Array(Types::CrossAccountConfiguration)? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil,
        is_cloud_trail_event_history_enabled : Bool? = nil,
        role_arn : String? = nil,
        tag_key_boundaries : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateInvestigationGroupRequest.new(identifier: identifier, chatbot_notification_channel: chatbot_notification_channel, cross_account_configurations: cross_account_configurations, encryption_configuration: encryption_configuration, is_cloud_trail_event_history_enabled: is_cloud_trail_event_history_enabled, role_arn: role_arn, tag_key_boundaries: tag_key_boundaries)
        update_investigation_group(input)
      end
      def update_investigation_group(input : Types::UpdateInvestigationGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INVESTIGATION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
