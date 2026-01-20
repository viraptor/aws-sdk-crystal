require "json"
require "time"

module AwsSdk
  module ResourceGroups
    module Types

      # The Resource Groups settings for this Amazon Web Services account.

      struct AccountSettings
        include JSON::Serializable

        # The desired target status of the group lifecycle events feature. If

        @[JSON::Field(key: "GroupLifecycleEventsDesiredStatus")]
        getter group_lifecycle_events_desired_status : String?

        # The current status of the group lifecycle events feature.

        @[JSON::Field(key: "GroupLifecycleEventsStatus")]
        getter group_lifecycle_events_status : String?

        # The text of any error message occurs during an attempt to turn group lifecycle events on or off.

        @[JSON::Field(key: "GroupLifecycleEventsStatusMessage")]
        getter group_lifecycle_events_status_message : String?

        def initialize(
          @group_lifecycle_events_desired_status : String? = nil,
          @group_lifecycle_events_status : String? = nil,
          @group_lifecycle_events_status_message : String? = nil
        )
        end
      end

      # The request includes one or more parameters that violate validation rules.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CancelTagSyncTaskInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the tag-sync task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String

        def initialize(
          @task_arn : String
        )
        end
      end


      struct CreateGroupInput
        include JSON::Serializable

        # The name of the group, which is the identifier of the group in other operations. You can't change
        # the name of a resource group after you create it. A resource group name can consist of letters,
        # numbers, hyphens, periods, and underscores. The name cannot start with AWS , aws , or any other
        # possible capitalization; these are reserved. A resource group name must be unique within each Amazon
        # Web Services Region in your Amazon Web Services account.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A configuration associates the resource group with an Amazon Web Services service and specifies how
        # the service can interact with the resources in the group. A configuration is an array of
        # GroupConfigurationItem elements. For details about the syntax of service configurations, see Service
        # configurations for Resource Groups . A resource group can contain either a Configuration or a
        # ResourceQuery , but not both.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Array(Types::GroupConfigurationItem)?

        # The critical rank of the application group on a scale of 1 to 10, with a rank of 1 being the most
        # critical, and a rank of 10 being least critical.

        @[JSON::Field(key: "Criticality")]
        getter criticality : Int32?

        # The description of the resource group. Descriptions can consist of letters, numbers, hyphens,
        # underscores, periods, and spaces.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application group, which you can change at any time.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # A name, email address or other identifier for the person or group who is considered as the owner of
        # this application group within your organization.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The resource query that determines which Amazon Web Services resources are members of this group.
        # For more information about resource queries, see Create a tag-based group in Resource Groups . A
        # resource group can contain either a ResourceQuery or a Configuration , but not both.

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The tags to add to the group. A tag is key-value pair string.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @configuration : Array(Types::GroupConfigurationItem)? = nil,
          @criticality : Int32? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @owner : String? = nil,
          @resource_query : Types::ResourceQuery? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGroupOutput
        include JSON::Serializable

        # The description of the resource group.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        # The service configuration associated with the resource group. For details about the syntax of a
        # service configuration, see Service configurations for Resource Groups .

        @[JSON::Field(key: "GroupConfiguration")]
        getter group_configuration : Types::GroupConfiguration?

        # The resource query associated with the group. For more information about resource queries, see
        # Create a tag-based group in Resource Groups .

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The tags associated with the group.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @group : Types::Group? = nil,
          @group_configuration : Types::GroupConfiguration? = nil,
          @resource_query : Types::ResourceQuery? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DeleteGroupInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group to delete.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Deprecated - don't use this parameter. Use Group instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group : String? = nil,
          @group_name : String? = nil
        )
        end
      end


      struct DeleteGroupOutput
        include JSON::Serializable

        # A full description of the deleted resource group.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end

      # A resource that failed to be added to or removed from a group.

      struct FailedResource
        include JSON::Serializable

        # The error code associated with the failure.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message text associated with the failure.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon resource name (ARN) of the resource that failed to be added or removed.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # The caller isn't authorized to make the request. Check permissions.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAccountSettingsOutput
        include JSON::Serializable

        # The current settings for the optional features in Resource Groups.

        @[JSON::Field(key: "AccountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end


      struct GetGroupConfigurationInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group for which you want to retrive the
        # service configuration.

        @[JSON::Field(key: "Group")]
        getter group : String?

        def initialize(
          @group : String? = nil
        )
        end
      end


      struct GetGroupConfigurationOutput
        include JSON::Serializable

        # A structure that describes the service configuration attached with the specified group. For details
        # about the service configuration syntax, see Service configurations for Resource Groups .

        @[JSON::Field(key: "GroupConfiguration")]
        getter group_configuration : Types::GroupConfiguration?

        def initialize(
          @group_configuration : Types::GroupConfiguration? = nil
        )
        end
      end


      struct GetGroupInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group to retrieve.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Deprecated - don't use this parameter. Use Group instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group : String? = nil,
          @group_name : String? = nil
        )
        end
      end


      struct GetGroupOutput
        include JSON::Serializable

        # A structure that contains the metadata details for the specified resource group. Use GetGroupQuery
        # and GetGroupConfiguration to get those additional details of the resource group.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end


      struct GetGroupQueryInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group to query.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Don't use this parameter. Use Group instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group : String? = nil,
          @group_name : String? = nil
        )
        end
      end


      struct GetGroupQueryOutput
        include JSON::Serializable

        # The resource query associated with the specified group. For more information about resource queries,
        # see Create a tag-based group in Resource Groups .

        @[JSON::Field(key: "GroupQuery")]
        getter group_query : Types::GroupQuery?

        def initialize(
          @group_query : Types::GroupQuery? = nil
        )
        end
      end


      struct GetTagSyncTaskInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the tag-sync task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String

        def initialize(
          @task_arn : String
        )
        end
      end


      struct GetTagSyncTaskOutput
        include JSON::Serializable

        # The timestamp of when the tag-sync task was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The specific error message in cases where the tag-sync task status is ERROR .

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon resource name (ARN) of the application group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        # The name of the application group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?


        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The Amazon resource name (ARN) of the role assumed by Resource Groups to tag and untag resources on
        # your behalf. For more information about this role, review Tag-sync required permissions .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The status of the tag-sync task. Valid values include: ACTIVE - The tag-sync task is actively
        # managing resources in the application by adding or removing the awsApplication tag from resources
        # when they are tagged or untagged with the specified tag key-value pair. ERROR - The tag-sync task is
        # not actively managing resources in the application. Review the ErrorMessage for more information
        # about resolving the error.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tag key.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # The tag value.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        # The Amazon resource name (ARN) of the tag-sync task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        def initialize(
          @created_at : Time? = nil,
          @error_message : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @resource_query : Types::ResourceQuery? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil,
          @task_arn : String? = nil
        )
        end
      end


      struct GetTagsInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group whose tags you want to retrieve.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct GetTagsOutput
        include JSON::Serializable

        # TheAmazon resource name (ARN) of the tagged resource group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The tags associated with the specified resource group.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A resource group that contains Amazon Web Services resources. You can assign resources to the group
      # by associating either of the following elements with the group: ResourceQuery - Use a resource query
      # to specify a set of tag keys and values. All resources in the same Amazon Web Services Region and
      # Amazon Web Services account that have those keys with the same values are included in the group. You
      # can add a resource query when you create the group, or later by using the PutGroupConfiguration
      # operation. GroupConfiguration - Use a service configuration to associate the group with an Amazon
      # Web Services service. The configuration specifies which resource types can be included in the group.

      struct Group
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String

        # The name of the resource group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A tag that defines the application group membership. This tag is only supported for application
        # groups.

        @[JSON::Field(key: "ApplicationTag")]
        getter application_tag : Hash(String, String)?

        # The critical rank of the application group on a scale of 1 to 10, with a rank of 1 being the most
        # critical, and a rank of 10 being least critical.

        @[JSON::Field(key: "Criticality")]
        getter criticality : Int32?

        # The description of the resource group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application group, which you can change at any time.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # A name, email address or other identifier for the person or group who is considered as the owner of
        # this application group within your organization.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @group_arn : String,
          @name : String,
          @application_tag : Hash(String, String)? = nil,
          @criticality : Int32? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @owner : String? = nil
        )
        end
      end

      # A service configuration associated with a resource group. The configuration options are determined
      # by the Amazon Web Services service that defines the Type , and specifies which resources can be
      # included in the group. You can add a service configuration when you create the group by using
      # CreateGroup , or later by using the PutGroupConfiguration operation. For details about group service
      # configuration syntax, see Service configurations for resource groups .

      struct GroupConfiguration
        include JSON::Serializable

        # The configuration currently associated with the group and in effect.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Array(Types::GroupConfigurationItem)?

        # If present, the reason why a request to update the group configuration failed.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # If present, the new configuration that is in the process of being applied to the group.

        @[JSON::Field(key: "ProposedConfiguration")]
        getter proposed_configuration : Array(Types::GroupConfigurationItem)?

        # The current status of an attempt to update the group configuration.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @configuration : Array(Types::GroupConfigurationItem)? = nil,
          @failure_reason : String? = nil,
          @proposed_configuration : Array(Types::GroupConfigurationItem)? = nil,
          @status : String? = nil
        )
        end
      end

      # An item in a group configuration. A group service configuration can have one or more items. For
      # details about group service configuration syntax, see Service configurations for resource groups .

      struct GroupConfigurationItem
        include JSON::Serializable

        # Specifies the type of group configuration item. Each item must have a unique value for type . For
        # the list of types that you can specify for a configuration item, see Supported resource types and
        # parameters .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A collection of parameters for this group configuration item. For the list of parameters that you
        # can use with each configuration item type, see Supported resource types and parameters .

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::GroupConfigurationParameter)?

        def initialize(
          @type : String,
          @parameters : Array(Types::GroupConfigurationParameter)? = nil
        )
        end
      end

      # A parameter for a group configuration item. For details about group service configuration syntax,
      # see Service configurations for resource groups .

      struct GroupConfigurationParameter
        include JSON::Serializable

        # The name of the group configuration parameter. For the list of parameters that you can use with each
        # configuration item type, see Supported resource types and parameters .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value or values to be used for the specified parameter. For the list of values you can use with
        # each parameter, see Supported resource types and parameters .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String,
          @values : Array(String)? = nil
        )
        end
      end

      # A filter collection that you can use to restrict the results from a List operation to only those you
      # want to include.

      struct GroupFilter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String

        # One or more filter values. Allowed filter values vary by group filter name, and are case-sensitive.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The unique identifiers for a resource group.

      struct GroupIdentifier
        include JSON::Serializable

        # The critical rank of the application group on a scale of 1 to 10, with a rank of 1 being the most
        # critical, and a rank of 10 being least critical.

        @[JSON::Field(key: "Criticality")]
        getter criticality : Int32?

        # The description of the application group.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application group, which you can change at any time.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The Amazon resource name (ARN) of the resource group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        # The name of the resource group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # A name, email address or other identifier for the person or group who is considered as the owner of
        # this group within your organization.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @criticality : Int32? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @owner : String? = nil
        )
        end
      end

      # A mapping of a query attached to a resource group that determines the Amazon Web Services resources
      # that are members of the group.

      struct GroupQuery
        include JSON::Serializable

        # The name of the resource group that is associated with the specified resource query.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String

        # The resource query that determines which Amazon Web Services resources are members of the associated
        # resource group.

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery

        def initialize(
          @group_name : String,
          @resource_query : Types::ResourceQuery
        )
        end
      end


      struct GroupResourcesInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group to add resources to.

        @[JSON::Field(key: "Group")]
        getter group : String

        # The list of Amazon resource names (ARNs) of the resources to be added to the group.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        def initialize(
          @group : String,
          @resource_arns : Array(String)
        )
        end
      end


      struct GroupResourcesOutput
        include JSON::Serializable

        # A list of Amazon resource names (ARNs) of any resources that this operation failed to add to the
        # group.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::FailedResource)?

        # A list of Amazon resource names (ARNs) of any resources that this operation is still in the process
        # adding to the group. These pending additions continue asynchronously. You can check the status of
        # pending additions by using the ListGroupResources operation, and checking the Resources array in the
        # response and the Status field of each object in that array.

        @[JSON::Field(key: "Pending")]
        getter pending : Array(Types::PendingResource)?

        # A list of Amazon resource names (ARNs) of the resources that this operation successfully added to
        # the group.

        @[JSON::Field(key: "Succeeded")]
        getter succeeded : Array(String)?

        def initialize(
          @failed : Array(Types::FailedResource)? = nil,
          @pending : Array(Types::PendingResource)? = nil,
          @succeeded : Array(String)? = nil
        )
        end
      end

      # The information about a grouping or ungrouping resource action.

      struct GroupingStatusesItem
        include JSON::Serializable

        # Describes the resource grouping action with values of GROUP or UNGROUP .

        @[JSON::Field(key: "Action")]
        getter action : String?

        # Specifies the error code that was raised.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A message that explains the ErrorCode .

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon resource name (ARN) of a resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Describes the resource grouping status with values of SUCCESS , FAILED , IN_PROGRESS , or SKIPPED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A timestamp of when the status was last updated.

        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @resource_arn : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An internal error occurred while processing the request. Try again later.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListGroupResourcesInput
        include JSON::Serializable

        # Filters, formatted as ResourceFilter objects, that you want to apply to a ListGroupResources
        # operation. Filters the results to include only those of the specified resource types. resource-type
        # - Filter resources by their type. Specify up to five resource types in the format
        # AWS::ServiceCode::ResourceType . For example, AWS::EC2::Instance , or AWS::S3::Bucket . When you
        # specify a resource-type filter for ListGroupResources , Resource Groups validates your filter
        # resource types against the types that are defined in the query associated with the group. For
        # example, if a group contains only S3 buckets because its query specifies only that resource type,
        # but your resource-type filter includes EC2 instances, AWS Resource Groups does not filter for EC2
        # instances. In this case, a ListGroupResources request returns a BadRequestException error with a
        # message similar to the following: The resource types specified as filters in the request are not
        # valid. The error includes a list of resource types that failed the validation because they are not
        # part of the query associated with the group. This validation doesn't occur when the group query
        # specifies AWS::AllSupported , because a group based on such a query can contain any of the allowed
        # resource types for the query type (tag-based or Amazon CloudFront stack-based queries).

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ResourceFilter)?

        # The name or the Amazon resource name (ARN) of the resource group.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Deprecated - don't use this parameter. Use the Group request field instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The total number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the maximum you specify, the NextToken response element is present and has a
        # value (is not null). Include that value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value provided by a previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ResourceFilter)? = nil,
          @group : String? = nil,
          @group_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure returned by the ListGroupResources operation that contains identity and group membership
      # status information for one of the resources in the group.

      struct ListGroupResourcesItem
        include JSON::Serializable


        @[JSON::Field(key: "Identifier")]
        getter identifier : Types::ResourceIdentifier?

        # A structure that contains the status of this resource's membership in the group. This field is
        # present in the response only if the group is of type AWS::EC2::HostManagement .

        @[JSON::Field(key: "Status")]
        getter status : Types::ResourceStatus?

        def initialize(
          @identifier : Types::ResourceIdentifier? = nil,
          @status : Types::ResourceStatus? = nil
        )
        end
      end


      struct ListGroupResourcesOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of QueryError objects. Each error contains an ErrorCode and Message . Possible values for
        # ErrorCode are CLOUDFORMATION_STACK_INACTIVE , CLOUDFORMATION_STACK_NOT_EXISTING ,
        # CLOUDFORMATION_STACK_UNASSUMABLE_ROLE and RESOURCE_TYPE_NOT_SUPPORTED .

        @[JSON::Field(key: "QueryErrors")]
        getter query_errors : Array(Types::QueryError)?

        # Deprecated - don't use this parameter. Use the Resources response field instead.

        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(Types::ResourceIdentifier)?

        # An array of resources from which you can determine each resource's identity, type, and group
        # membership status.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::ListGroupResourcesItem)?

        def initialize(
          @next_token : String? = nil,
          @query_errors : Array(Types::QueryError)? = nil,
          @resource_identifiers : Array(Types::ResourceIdentifier)? = nil,
          @resources : Array(Types::ListGroupResourcesItem)? = nil
        )
        end
      end

      # A filter name and value pair that is used to obtain more specific results from the list of grouping
      # statuses.

      struct ListGroupingStatusesFilter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String

        # One or more filter values. Allowed filter values vary by resource filter name, and are
        # case-sensitive.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end


      struct ListGroupingStatusesInput
        include JSON::Serializable

        # The application group identifier, expressed as an Amazon resource name (ARN) or the application
        # group name.

        @[JSON::Field(key: "Group")]
        getter group : String

        # The filter name and value pair that is used to return more specific results from a list of
        # resources.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ListGroupingStatusesFilter)?

        # The maximum number of resources and their statuses returned in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value provided by a previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group : String,
          @filters : Array(Types::ListGroupingStatusesFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupingStatusesOutput
        include JSON::Serializable

        # The application group identifier, expressed as an Amazon resource name (ARN) or the application
        # group name.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Returns details about the grouping or ungrouping status of the resources in the specified
        # application group.

        @[JSON::Field(key: "GroupingStatuses")]
        getter grouping_statuses : Array(Types::GroupingStatusesItem)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group : String? = nil,
          @grouping_statuses : Array(Types::GroupingStatusesItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsInput
        include JSON::Serializable

        # Filters, formatted as GroupFilter objects, that you want to apply to a ListGroups operation.
        # resource-type - Filter the results to include only those resource groups that have the specified
        # resource type in their ResourceTypeFilter . For example, AWS::EC2::Instance would return any
        # resource group with a ResourceTypeFilter that includes AWS::EC2::Instance . configuration-type -
        # Filter the results to include only those groups that have the specified configuration types
        # attached. The current supported values are: AWS::ResourceGroups::ApplicationGroup
        # AWS::AppRegistry::Application AWS::AppRegistry::ApplicationResourceGroup AWS::CloudFormation::Stack
        # AWS::EC2::CapacityReservationPool AWS::EC2::HostManagement AWS::NetworkFirewall::RuleGroup

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::GroupFilter)?

        # The total number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the maximum you specify, the NextToken response element is present and has a
        # value (is not null). Include that value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value provided by a previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::GroupFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsOutput
        include JSON::Serializable

        # A list of GroupIdentifier objects. Each identifier is an object that contains both the Name and the
        # GroupArn .

        @[JSON::Field(key: "GroupIdentifiers")]
        getter group_identifiers : Array(Types::GroupIdentifier)?

        # Deprecated - don't use this field. Use the GroupIdentifiers response field instead.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::Group)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_identifiers : Array(Types::GroupIdentifier)? = nil,
          @groups : Array(Types::Group)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns tag-sync tasks filtered by the Amazon resource name (ARN) or name of a specified application
      # group.

      struct ListTagSyncTasksFilter
        include JSON::Serializable

        # The Amazon resource name (ARN) of the application group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        # The name of the application group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @group_arn : String? = nil,
          @group_name : String? = nil
        )
        end
      end


      struct ListTagSyncTasksInput
        include JSON::Serializable

        # The Amazon resource name (ARN) or name of the application group for which you want to return a list
        # of tag-sync tasks.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ListTagSyncTasksFilter)?

        # The maximum number of results to be included in the response.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value provided by a previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ListTagSyncTasksFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagSyncTasksOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tag-sync tasks and information about each task.

        @[JSON::Field(key: "TagSyncTasks")]
        getter tag_sync_tasks : Array(Types::TagSyncTaskItem)?

        def initialize(
          @next_token : String? = nil,
          @tag_sync_tasks : Array(Types::TagSyncTaskItem)? = nil
        )
        end
      end

      # The request uses an HTTP method that isn't allowed for the specified resource.

      struct MethodNotAllowedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more of the specified resources don't exist.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that identifies a resource that is currently pending addition to the group as a member.
      # Adding a resource to a resource group happens asynchronously as a background task and this one isn't
      # completed yet.

      struct PendingResource
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource that's in a pending state.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end


      struct PutGroupConfigurationInput
        include JSON::Serializable

        # The new configuration to associate with the specified group. A configuration associates the resource
        # group with an Amazon Web Services service and specifies how the service can interact with the
        # resources in the group. A configuration is an array of GroupConfigurationItem elements. For
        # information about the syntax of a service configuration, see Service configurations for Resource
        # Groups . A resource group can contain either a Configuration or a ResourceQuery , but not both.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Array(Types::GroupConfigurationItem)?

        # The name or Amazon resource name (ARN) of the resource group with the configuration that you want to
        # update.

        @[JSON::Field(key: "Group")]
        getter group : String?

        def initialize(
          @configuration : Array(Types::GroupConfigurationItem)? = nil,
          @group : String? = nil
        )
        end
      end


      struct PutGroupConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A two-part error structure that can occur in ListGroupResources or SearchResources .

      struct QueryError
        include JSON::Serializable

        # Specifies the error code that was raised.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A message that explains the ErrorCode .

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A filter name and value pair that is used to obtain more specific results from a list of resources.

      struct ResourceFilter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "Name")]
        getter name : String

        # One or more filter values. Allowed filter values vary by resource filter name, and are
        # case-sensitive.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # A structure that contains the ARN of a resource and its resource type.

      struct ResourceIdentifier
        include JSON::Serializable

        # The Amazon resource name (ARN) of a resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # The resource type of a resource, such as AWS::EC2::Instance .

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @resource_arn : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The query you can use to define a resource group or a search for resources. A ResourceQuery
      # specifies both a query Type and a Query string as JSON string objects. See the examples section for
      # example JSON strings. For more information about creating a resource group with a resource query,
      # see Build queries and groups in Resource Groups in the Resource Groups User Guide When you combine
      # all of the elements together into a single string, any double quotes that are embedded inside
      # another double quote pair must be escaped by preceding the embedded double quote with a backslash
      # character (\). For example, a complete ResourceQuery parameter must be formatted like the following
      # CLI parameter example: --resource-query
      # '{"Type":"TAG_FILTERS_1_0","Query":"{\"ResourceTypeFilters\":[\"AWS::AllSupported\"],\"TagFilters\":[{\"Key\":\"Stage\",\"Values\":[\"Test\"]}]}"}'
      # In the preceding example, all of the double quote characters in the value part of the Query element
      # must be escaped because the value itself is surrounded by double quotes. For more information, see
      # Quoting strings in the Command Line Interface User Guide . For the complete list of resource types
      # that you can use in the array value for ResourceTypeFilters , see Resources you can use with
      # Resource Groups and Tag Editor in the Resource Groups User Guide . For example:
      # "ResourceTypeFilters":["AWS::S3::Bucket", "AWS::EC2::Instance"]

      struct ResourceQuery
        include JSON::Serializable

        # The query that defines a group or a search. The contents depends on the value of the Type element.
        # ResourceTypeFilters – Applies to all ResourceQuery objects of either Type . This element contains
        # one of the following two items: The value AWS::AllSupported . This causes the ResourceQuery to match
        # resources of any resource type that also match the query. A list (a JSON array) of resource type
        # identifiers that limit the query to only resources of the specified types. For the complete list of
        # resource types that you can use in the array value for ResourceTypeFilters , see Resources you can
        # use with Resource Groups and Tag Editor in the Resource Groups User Guide . Example:
        # "ResourceTypeFilters": ["AWS::AllSupported"] or "ResourceTypeFilters": ["AWS::EC2::Instance",
        # "AWS::S3::Bucket"] TagFilters – applicable only if Type = TAG_FILTERS_1_0 . The Query contains a
        # JSON string that represents a collection of simple tag filters. The JSON string uses a syntax
        # similar to the GetResources operation, but uses only the ResourceTypeFilters and TagFilters fields.
        # If you specify more than one tag key, only resources that match all tag keys, and at least one value
        # of each specified tag key, are returned in your query. If you specify more than one value for a tag
        # key, a resource matches the filter if it has a tag key value that matches any of the specified
        # values. For example, consider the following sample query for resources that have two tags, Stage and
        # Version , with two values each: [{"Stage":["Test","Deploy"]},{"Version":["1","2"]}] The results of
        # this resource query could include the following. An Amazon EC2 instance that has the following two
        # tags: {"Stage":"Deploy"} , and {"Version":"2"} An S3 bucket that has the following two tags:
        # {"Stage":"Test"} , and {"Version":"1"} The resource query results would not include the following
        # items in the results, however. An Amazon EC2 instance that has only the following tag:
        # {"Stage":"Deploy"} . The instance does not have all of the tag keys specified in the filter, so it
        # is excluded from the results. An RDS database that has the following two tags: {"Stage":"Archived"}
        # and {"Version":"4"} The database has all of the tag keys, but none of those keys has an associated
        # value that matches at least one of the specified values in the filter. Example: "TagFilters": [ {
        # "Key": "Stage", "Values": [ "Gamma", "Beta" ] } StackIdentifier – applicable only if Type =
        # CLOUDFORMATION_STACK_1_0 . The value of this parameter is the Amazon Resource Name (ARN) of the
        # CloudFormation stack whose resources you want included in the group.

        @[JSON::Field(key: "Query")]
        getter query : String

        # The type of the query to perform. This can have one of two values: CLOUDFORMATION_STACK_1_0:
        # Specifies that you want the group to contain the members of an CloudFormation stack. The Query
        # contains a StackIdentifier element with an Amazon resource name (ARN) for a CloudFormation stack.
        # TAG_FILTERS_1_0: Specifies that you want the group to include resource that have tags that match the
        # query.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @query : String,
          @type : String
        )
        end
      end

      # A structure that identifies the current group membership status for a resource. Adding a resource to
      # a resource group is performed asynchronously as a background task. A PENDING status indicates, for
      # this resource, that the process isn't completed yet.

      struct ResourceStatus
        include JSON::Serializable

        # The current status.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct SearchResourcesInput
        include JSON::Serializable

        # The search query, using the same formats that are supported for resource group definition. For more
        # information, see CreateGroup .

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery

        # The total number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value that is specific to the operation. If additional
        # items exist beyond the maximum you specify, the NextToken response element is present and has a
        # value (is not null). Include that value as the NextToken request parameter in the next call to the
        # operation to get the next part of the results. Note that the service might return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value provided by a previous call's NextToken response to indicate where the output should continue
        # from.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_query : Types::ResourceQuery,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchResourcesOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of QueryError objects. Each error contains an ErrorCode and Message . Possible values for
        # ErrorCode : CLOUDFORMATION_STACK_INACTIVE CLOUDFORMATION_STACK_NOT_EXISTING
        # CLOUDFORMATION_STACK_UNASSUMABLE_ROLE

        @[JSON::Field(key: "QueryErrors")]
        getter query_errors : Array(Types::QueryError)?

        # The ARNs and resource types of resources that are members of the group that you specified.

        @[JSON::Field(key: "ResourceIdentifiers")]
        getter resource_identifiers : Array(Types::ResourceIdentifier)?

        def initialize(
          @next_token : String? = nil,
          @query_errors : Array(Types::QueryError)? = nil,
          @resource_identifiers : Array(Types::ResourceIdentifier)? = nil
        )
        end
      end


      struct StartTagSyncTaskInput
        include JSON::Serializable

        # The Amazon resource name (ARN) or name of the application group for which you want to create a
        # tag-sync task.

        @[JSON::Field(key: "Group")]
        getter group : String

        # The Amazon resource name (ARN) of the role assumed by the service to tag and untag resources on your
        # behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The query you can use to create the tag-sync task. With this method, all resources matching the
        # query are added to the specified application group. A ResourceQuery specifies both a query Type and
        # a Query string as JSON string objects. For more information on defining a resource query for a
        # tag-sync task, see the tag-based query type in Types of resource group queries in Resource Groups
        # User Guide . When using the ResourceQuery parameter, you cannot use the TagKey and TagValue
        # parameters. When you combine all of the elements together into a single string, any double quotes
        # that are embedded inside another double quote pair must be escaped by preceding the embedded double
        # quote with a backslash character (\). For example, a complete ResourceQuery parameter must be
        # formatted like the following CLI parameter example: --resource-query
        # '{"Type":"TAG_FILTERS_1_0","Query":"{\"ResourceTypeFilters\":[\"AWS::AllSupported\"],\"TagFilters\":[{\"Key\":\"Stage\",\"Values\":[\"Test\"]}]}"}'
        # In the preceding example, all of the double quote characters in the value part of the Query element
        # must be escaped because the value itself is surrounded by double quotes. For more information, see
        # Quoting strings in the Command Line Interface User Guide . For the complete list of resource types
        # that you can use in the array value for ResourceTypeFilters , see Resources you can use with
        # Resource Groups and Tag Editor in the Resource Groups User Guide . For example:
        # "ResourceTypeFilters":["AWS::S3::Bucket", "AWS::EC2::Instance"]

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The tag key. Resources tagged with this tag key-value pair will be added to the application. If a
        # resource with this tag is later untagged, the tag-sync task removes the resource from the
        # application. When using the TagKey parameter, you must also specify the TagValue parameter. If you
        # specify a tag key-value pair, you can't use the ResourceQuery parameter.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # The tag value. Resources tagged with this tag key-value pair will be added to the application. If a
        # resource with this tag is later untagged, the tag-sync task removes the resource from the
        # application. When using the TagValue parameter, you must also specify the TagKey parameter. If you
        # specify a tag key-value pair, you can't use the ResourceQuery parameter.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        def initialize(
          @group : String,
          @role_arn : String,
          @resource_query : Types::ResourceQuery? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil
        )
        end
      end


      struct StartTagSyncTaskOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the application group for which you want to add or remove
        # resources.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        # The name of the application group to onboard and sync resources.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?


        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The Amazon resource name (ARN) of the role assumed by the service to tag and untag resources on your
        # behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The tag key of the tag-sync task.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # The tag value of the tag-sync task.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        # The Amazon resource name (ARN) of the new tag-sync task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        def initialize(
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @resource_query : Types::ResourceQuery? = nil,
          @role_arn : String? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil,
          @task_arn : String? = nil
        )
        end
      end


      struct TagInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group to which to add tags.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The tags to add to the specified resource group. A tag is a string-to-string map of key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the tagged resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The tags that have been added to the specified resource group.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The Amazon resource name (ARN) of the tag-sync task.

      struct TagSyncTaskItem
        include JSON::Serializable

        # The timestamp of when the tag-sync task was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The specific error message in cases where the tag-sync task status is Error .

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon resource name (ARN) of the application group.

        @[JSON::Field(key: "GroupArn")]
        getter group_arn : String?

        # The name of the application group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?


        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery?

        # The Amazon resource name (ARN) of the role assumed by the service to tag and untag resources on your
        # behalf.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The status of the tag-sync task. Valid values include: ACTIVE - The tag-sync task is actively
        # managing resources in the application by adding or removing the awsApplication tag from resources
        # when they are tagged or untagged with the specified tag key-value pair. ERROR - The tag-sync task is
        # not actively managing resources in the application. Review the ErrorMessage for more information
        # about resolving the error.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tag key.

        @[JSON::Field(key: "TagKey")]
        getter tag_key : String?

        # The tag value.

        @[JSON::Field(key: "TagValue")]
        getter tag_value : String?

        # The Amazon resource name (ARN) of the tag-sync task.

        @[JSON::Field(key: "TaskArn")]
        getter task_arn : String?

        def initialize(
          @created_at : Time? = nil,
          @error_message : String? = nil,
          @group_arn : String? = nil,
          @group_name : String? = nil,
          @resource_query : Types::ResourceQuery? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @tag_key : String? = nil,
          @tag_value : String? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # You've exceeded throttling limits by making too many requests in a period of time.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was rejected because it doesn't have valid credentials for the target resource.

      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UngroupResourcesInput
        include JSON::Serializable

        # The name or the Amazon resource name (ARN) of the resource group from which to remove the resources.

        @[JSON::Field(key: "Group")]
        getter group : String

        # The Amazon resource names (ARNs) of the resources to be removed from the group.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)

        def initialize(
          @group : String,
          @resource_arns : Array(String)
        )
        end
      end


      struct UngroupResourcesOutput
        include JSON::Serializable

        # A list of any resources that failed to be removed from the group by this operation.

        @[JSON::Field(key: "Failed")]
        getter failed : Array(Types::FailedResource)?

        # A list of any resources that are still in the process of being removed from the group by this
        # operation. These pending removals continue asynchronously. You can check the status of pending
        # removals by using the ListGroupResources operation. After the resource is successfully removed, it
        # no longer appears in the response.

        @[JSON::Field(key: "Pending")]
        getter pending : Array(Types::PendingResource)?

        # A list of resources that were successfully removed from the group by this operation.

        @[JSON::Field(key: "Succeeded")]
        getter succeeded : Array(String)?

        def initialize(
          @failed : Array(Types::FailedResource)? = nil,
          @pending : Array(Types::PendingResource)? = nil,
          @succeeded : Array(String)? = nil
        )
        end
      end


      struct UntagInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group from which to remove tags. The command removed
        # both the specified keys and any values associated with those keys.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The keys of the tags to be removed.

        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)

        def initialize(
          @arn : String,
          @keys : Array(String)
        )
        end
      end


      struct UntagOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource group from which tags have been removed.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The keys of the tags that were removed.

        @[JSON::Field(key: "Keys")]
        getter keys : Array(String)?

        def initialize(
          @arn : String? = nil,
          @keys : Array(String)? = nil
        )
        end
      end


      struct UpdateAccountSettingsInput
        include JSON::Serializable

        # Specifies whether you want to turn group lifecycle events on or off. You can't turn on group
        # lifecycle events if your resource groups quota is greater than 2,000.

        @[JSON::Field(key: "GroupLifecycleEventsDesiredStatus")]
        getter group_lifecycle_events_desired_status : String?

        def initialize(
          @group_lifecycle_events_desired_status : String? = nil
        )
        end
      end


      struct UpdateAccountSettingsOutput
        include JSON::Serializable

        # A structure that displays the status of the optional features in the account.

        @[JSON::Field(key: "AccountSettings")]
        getter account_settings : Types::AccountSettings?

        def initialize(
          @account_settings : Types::AccountSettings? = nil
        )
        end
      end


      struct UpdateGroupInput
        include JSON::Serializable

        # The critical rank of the application group on a scale of 1 to 10, with a rank of 1 being the most
        # critical, and a rank of 10 being least critical.

        @[JSON::Field(key: "Criticality")]
        getter criticality : Int32?

        # The new description that you want to update the resource group with. Descriptions can contain
        # letters, numbers, hyphens, underscores, periods, and spaces.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the application group, which you can change at any time.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The name or the ARN of the resource group to update.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Don't use this parameter. Use Group instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # A name, email address or other identifier for the person or group who is considered as the owner of
        # this application group within your organization.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        def initialize(
          @criticality : Int32? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @group : String? = nil,
          @group_name : String? = nil,
          @owner : String? = nil
        )
        end
      end


      struct UpdateGroupOutput
        include JSON::Serializable

        # The update description of the resource group.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end


      struct UpdateGroupQueryInput
        include JSON::Serializable

        # The resource query to determine which Amazon Web Services resources are members of this resource
        # group. A resource group can contain either a Configuration or a ResourceQuery , but not both.

        @[JSON::Field(key: "ResourceQuery")]
        getter resource_query : Types::ResourceQuery

        # The name or the Amazon resource name (ARN) of the resource group to query.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Don't use this parameter. Use Group instead.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        def initialize(
          @resource_query : Types::ResourceQuery,
          @group : String? = nil,
          @group_name : String? = nil
        )
        end
      end


      struct UpdateGroupQueryOutput
        include JSON::Serializable

        # The updated resource query associated with the resource group after the update.

        @[JSON::Field(key: "GroupQuery")]
        getter group_query : Types::GroupQuery?

        def initialize(
          @group_query : Types::GroupQuery? = nil
        )
        end
      end
    end
  end
end
