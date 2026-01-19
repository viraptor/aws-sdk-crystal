module AwsSdk
  module Scheduler
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

      # Creates the specified schedule.
      def create_schedule(
        flexible_time_window : Types::FlexibleTimeWindow,
        name : String,
        schedule_expression : String,
        target : Types::Target,
        action_after_completion : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        end_date : Time? = nil,
        group_name : String? = nil,
        kms_key_arn : String? = nil,
        schedule_expression_timezone : String? = nil,
        start_date : Time? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::CreateScheduleInput.new(flexible_time_window: flexible_time_window, name: name, schedule_expression: schedule_expression, target: target, action_after_completion: action_after_completion, client_token: client_token, description: description, end_date: end_date, group_name: group_name, kms_key_arn: kms_key_arn, schedule_expression_timezone: schedule_expression_timezone, start_date: start_date, state: state)
        create_schedule(input)
      end
      def create_schedule(input : Types::CreateScheduleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the specified schedule group.
      def create_schedule_group(
        name : String,
        client_token : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateScheduleGroupInput.new(name: name, client_token: client_token, tags: tags)
        create_schedule_group(input)
      end
      def create_schedule_group(input : Types::CreateScheduleGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEDULE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified schedule.
      def delete_schedule(
        name : String,
        client_token : String? = nil,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteScheduleInput.new(name: name, client_token: client_token, group_name: group_name)
        delete_schedule(input)
      end
      def delete_schedule(input : Types::DeleteScheduleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified schedule group. Deleting a schedule group results in EventBridge Scheduler
      # deleting all schedules associated with the group. When you delete a group, it remains in a DELETING
      # state until all of its associated schedules are deleted. Schedules associated with the group that
      # are set to run while the schedule group is in the process of being deleted might continue to invoke
      # their targets until the schedule group and its associated schedules are deleted. This operation is
      # eventually consistent.
      def delete_schedule_group(
        name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteScheduleGroupInput.new(name: name, client_token: client_token)
        delete_schedule_group(input)
      end
      def delete_schedule_group(input : Types::DeleteScheduleGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEDULE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified schedule.
      def get_schedule(
        name : String,
        group_name : String? = nil
      ) : Protocol::Request
        input = Types::GetScheduleInput.new(name: name, group_name: group_name)
        get_schedule(input)
      end
      def get_schedule(input : Types::GetScheduleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the specified schedule group.
      def get_schedule_group(
        name : String
      ) : Protocol::Request
        input = Types::GetScheduleGroupInput.new(name: name)
        get_schedule_group(input)
      end
      def get_schedule_group(input : Types::GetScheduleGroupInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEDULE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of your schedule groups.
      def list_schedule_groups(
        max_results : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScheduleGroupsInput.new(max_results: max_results, name_prefix: name_prefix, next_token: next_token)
        list_schedule_groups(input)
      end
      def list_schedule_groups(input : Types::ListScheduleGroupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULE_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of your EventBridge Scheduler schedules.
      def list_schedules(
        group_name : String? = nil,
        max_results : Int32? = nil,
        name_prefix : String? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListSchedulesInput.new(group_name: group_name, max_results: max_results, name_prefix: name_prefix, next_token: next_token, state: state)
        list_schedules(input)
      end
      def list_schedules(input : Types::ListSchedulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEDULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags associated with the Scheduler resource.
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

      # Assigns one or more tags (key-value pairs) to the specified EventBridge Scheduler resource. You can
      # only assign tags to schedule groups.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified EventBridge Scheduler schedule group.
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

      # Updates the specified schedule. When you call UpdateSchedule , EventBridge Scheduler uses all
      # values, including empty values, specified in the request and overrides the existing schedule. This
      # is by design. This means that if you do not set an optional field in your request, that field will
      # be set to its system-default value after the update. Before calling this operation, we recommend
      # that you call the GetSchedule API operation and make a note of all optional parameters for your
      # UpdateSchedule call.
      def update_schedule(
        flexible_time_window : Types::FlexibleTimeWindow,
        name : String,
        schedule_expression : String,
        target : Types::Target,
        action_after_completion : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        end_date : Time? = nil,
        group_name : String? = nil,
        kms_key_arn : String? = nil,
        schedule_expression_timezone : String? = nil,
        start_date : Time? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateScheduleInput.new(flexible_time_window: flexible_time_window, name: name, schedule_expression: schedule_expression, target: target, action_after_completion: action_after_completion, client_token: client_token, description: description, end_date: end_date, group_name: group_name, kms_key_arn: kms_key_arn, schedule_expression_timezone: schedule_expression_timezone, start_date: start_date, state: state)
        update_schedule(input)
      end
      def update_schedule(input : Types::UpdateScheduleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
