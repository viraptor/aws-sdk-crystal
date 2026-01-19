require "json"

module AwsSdk
  module OAM
    module Types

      # A resource was in an inconsistent state during an update or a deletion.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      struct CreateLinkInput
        include JSON::Serializable

        # Specify a friendly human-readable name to use to identify this source account when you are viewing
        # data from it in the monitoring account. You can use a custom label or use the following variables:
        # $AccountName is the name of the account $AccountEmail is the globally unique email address of the
        # account $AccountEmailNoDomain is the email address of the account without the domain name In the
        # Amazon Web Services GovCloud (US-East) and Amazon Web Services GovCloud (US-West) Regions, the only
        # supported option is to use custom labels, and the $AccountName , $AccountEmail , and
        # $AccountEmailNoDomain variables all resolve as account-id instead of the specified variable.
        @[JSON::Field(key: "LabelTemplate")]
        getter label_template : String

        # An array of strings that define which types of data that the source account shares with the
        # monitoring account.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)

        # The ARN of the sink to use to create this link. You can use ListSinks to find the ARNs of sinks. For
        # more information about sinks, see CreateSink .
        @[JSON::Field(key: "SinkIdentifier")]
        getter sink_identifier : String

        # Use this structure to optionally create filters that specify that only some metric namespaces or log
        # groups are to be shared from the source account to the monitoring account.
        @[JSON::Field(key: "LinkConfiguration")]
        getter link_configuration : Types::LinkConfiguration?

        # Assigns one or more tags (key-value pairs) to the link. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. For more information about using tags to
        # control access, see Controlling access to Amazon Web Services resources using tags .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @label_template : String,
          @resource_types : Array(String),
          @sink_identifier : String,
          @link_configuration : Types::LinkConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateLinkOutput
        include JSON::Serializable

        # The ARN of the link that is newly created.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the link ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The label that you assigned to this link. If the labelTemplate includes variables, this field
        # displays the variables resolved to their actual values.
        @[JSON::Field(key: "Label")]
        getter label : String?

        # The exact label template that you specified, with the variables not resolved.
        @[JSON::Field(key: "LabelTemplate")]
        getter label_template : String?

        # This structure includes filters that specify which metric namespaces and which log groups are shared
        # from the source account to the monitoring account.
        @[JSON::Field(key: "LinkConfiguration")]
        getter link_configuration : Types::LinkConfiguration?

        # The resource types supported by this link.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The ARN of the sink that is used for this link.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The tags assigned to the link.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @label : String? = nil,
          @label_template : String? = nil,
          @link_configuration : Types::LinkConfiguration? = nil,
          @resource_types : Array(String)? = nil,
          @sink_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSinkInput
        include JSON::Serializable

        # A name for the sink.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Assigns one or more tags (key-value pairs) to the link. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. For more information about using tags to
        # control access, see Controlling access to Amazon Web Services resources using tags .
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSinkOutput
        include JSON::Serializable

        # The ARN of the sink that is newly created.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the sink.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags assigned to the sink.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DeleteLinkInput
        include JSON::Serializable

        # The ARN of the link to delete.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteLinkOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSinkInput
        include JSON::Serializable

        # The ARN of the sink to delete.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct DeleteSinkOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct GetLinkInput
        include JSON::Serializable

        # The ARN of the link to retrieve information for.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Specifies whether to include the tags associated with the link in the response. When IncludeTags is
        # set to true and the caller has the required permission, oam:ListTagsForResource , the API will
        # return the tags for the specified resource. If the caller doesn't have the required permission,
        # oam:ListTagsForResource , the API will raise an exception. The default value is false .
        @[JSON::Field(key: "IncludeTags")]
        getter include_tags : Bool?

        def initialize(
          @identifier : String,
          @include_tags : Bool? = nil
        )
        end
      end

      struct GetLinkOutput
        include JSON::Serializable

        # The ARN of the link.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the link ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The label that you assigned to this link, with the variables resolved to their actual values.
        @[JSON::Field(key: "Label")]
        getter label : String?

        # The exact label template that was specified when the link was created, with the template variables
        # not resolved.
        @[JSON::Field(key: "LabelTemplate")]
        getter label_template : String?

        # This structure includes filters that specify which metric namespaces and which log groups are shared
        # from the source account to the monitoring account.
        @[JSON::Field(key: "LinkConfiguration")]
        getter link_configuration : Types::LinkConfiguration?

        # The resource types supported by this link.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The ARN of the sink that is used for this link.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The tags assigned to the link.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @label : String? = nil,
          @label_template : String? = nil,
          @link_configuration : Types::LinkConfiguration? = nil,
          @resource_types : Array(String)? = nil,
          @sink_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetSinkInput
        include JSON::Serializable

        # The ARN of the sink to retrieve information for.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Specifies whether to include the tags associated with the sink in the response. When IncludeTags is
        # set to true and the caller has the required permission, oam:ListTagsForResource , the API will
        # return the tags for the specified resource. If the caller doesn't have the required permission,
        # oam:ListTagsForResource , the API will raise an exception. The default value is false .
        @[JSON::Field(key: "IncludeTags")]
        getter include_tags : Bool?

        def initialize(
          @identifier : String,
          @include_tags : Bool? = nil
        )
        end
      end

      struct GetSinkOutput
        include JSON::Serializable

        # The ARN of the sink.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the sink.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The tags assigned to the sink.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetSinkPolicyInput
        include JSON::Serializable

        # The ARN of the sink to retrieve the policy of.
        @[JSON::Field(key: "SinkIdentifier")]
        getter sink_identifier : String

        def initialize(
          @sink_identifier : String
        )
        end
      end

      struct GetSinkPolicyOutput
        include JSON::Serializable

        # The policy that you specified, in JSON format.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The ARN of the sink.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "SinkId")]
        getter sink_id : String?

        def initialize(
          @policy : String? = nil,
          @sink_arn : String? = nil,
          @sink_id : String? = nil
        )
        end
      end

      # Unexpected error while processing the request. Retry the request.
      struct InternalServiceFault
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      # A parameter is specified incorrectly.
      struct InvalidParameterException
        include JSON::Serializable

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @amzn_error_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Use this structure to optionally create filters that specify that only some metric namespaces or log
      # groups are to be shared from the source account to the monitoring account.
      struct LinkConfiguration
        include JSON::Serializable

        # Use this structure to filter which log groups are to send log events from the source account to the
        # monitoring account.
        @[JSON::Field(key: "LogGroupConfiguration")]
        getter log_group_configuration : Types::LogGroupConfiguration?

        # Use this structure to filter which metric namespaces are to be shared from the source account to the
        # monitoring account.
        @[JSON::Field(key: "MetricConfiguration")]
        getter metric_configuration : Types::MetricConfiguration?

        def initialize(
          @log_group_configuration : Types::LogGroupConfiguration? = nil,
          @metric_configuration : Types::MetricConfiguration? = nil
        )
        end
      end

      struct ListAttachedLinksInput
        include JSON::Serializable

        # The ARN of the sink that you want to retrieve links for.
        @[JSON::Field(key: "SinkIdentifier")]
        getter sink_identifier : String

        # Limits the number of returned links to the specified number.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. You received this token from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @sink_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that contains information about one link attached to this monitoring account sink.
      struct ListAttachedLinksItem
        include JSON::Serializable

        # The label that was assigned to this link at creation, with the variables resolved to their actual
        # values.
        @[JSON::Field(key: "Label")]
        getter label : String?

        # The ARN of the link.
        @[JSON::Field(key: "LinkArn")]
        getter link_arn : String?

        # The resource types supported by this link.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @label : String? = nil,
          @link_arn : String? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end

      struct ListAttachedLinksOutput
        include JSON::Serializable

        # An array of structures that contain the information about the attached links.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListAttachedLinksItem)

        # The token to use when requesting the next set of links.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListAttachedLinksItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListLinksInput
        include JSON::Serializable

        # Limits the number of returned links to the specified number.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. You received this token from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that contains information about one of this source account's links to a monitoring
      # account.
      struct ListLinksItem
        include JSON::Serializable

        # The ARN of the link.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the link ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The label that was assigned to this link at creation, with the variables resolved to their actual
        # values.
        @[JSON::Field(key: "Label")]
        getter label : String?

        # The resource types supported by this link.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The ARN of the sink that this link is attached to.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @label : String? = nil,
          @resource_types : Array(String)? = nil,
          @sink_arn : String? = nil
        )
        end
      end

      struct ListLinksOutput
        include JSON::Serializable

        # An array of structures that contain the information about the returned links.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListLinksItem)

        # The token to use when requesting the next set of links.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListLinksItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListSinksInput
        include JSON::Serializable

        # Limits the number of returned links to the specified number.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of items to return. You received this token from a previous call.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A structure that contains information about one of this monitoring account's sinks.
      struct ListSinksItem
        include JSON::Serializable

        # The ARN of the sink.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the sink.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct ListSinksOutput
        include JSON::Serializable

        # An array of structures that contain the information about the returned sinks.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ListSinksItem)

        # The token to use when requesting the next set of sinks.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ListSinksItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the resource that you want to view tags for. The ARN format of a sink is arn:aws:oam:
        # Region : account-id :sink/ sink-id The ARN format of a link is arn:aws:oam: Region : account-id
        # :link/ link-id For more information about ARN format, see CloudWatch Logs resources and operations .
        # Unlike tagging permissions in other Amazon Web Services services, to retrieve the list of tags for
        # links or sinks you must have the oam:RequestTag permission. The aws:ReguestTag permission does not
        # allow you to tag and untag links and sinks.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags associated with the requested resource.&gt;
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure contains the Filter parameter which you can use to specify which log groups are to
      # share log events from this source account to the monitoring account.
      struct LogGroupConfiguration
        include JSON::Serializable

        # Use this field to specify which log groups are to share their log events with the monitoring
        # account. Use the term LogGroupName and one or more of the following operands. Use single quotation
        # marks (') around log group names. The matching of log group names is case sensitive. Each filter has
        # a limit of five conditional operands. Conditional operands are AND and OR . = and != AND OR LIKE and
        # NOT LIKE . These can be used only as prefix searches. Include a % at the end of the string that you
        # want to search for and include. IN and NOT IN , using parentheses ( ) Examples: LogGroupName IN
        # ('This-Log-Group', 'Other-Log-Group') includes only the log groups with names This-Log-Group and
        # Other-Log-Group . LogGroupName NOT IN ('Private-Log-Group', 'Private-Log-Group-2') includes all log
        # groups except the log groups with names Private-Log-Group and Private-Log-Group-2 . LogGroupName
        # LIKE 'aws/lambda/%' OR LogGroupName LIKE 'AWSLogs%' includes all log groups that have names that
        # start with aws/lambda/ or AWSLogs . If you are updating a link that uses filters, you can specify *
        # as the only value for the filter parameter to delete the filter and share all log groups with the
        # monitoring account.
        @[JSON::Field(key: "Filter")]
        getter filter : String

        def initialize(
          @filter : String
        )
        end
      end

      # This structure contains the Filter parameter which you can use to specify which metric namespaces
      # are to be shared from this source account to the monitoring account.
      struct MetricConfiguration
        include JSON::Serializable

        # Use this field to specify which metrics are to be shared with the monitoring account. Use the term
        # Namespace and one or more of the following operands. Use single quotation marks (') around namespace
        # names. The matching of namespace names is case sensitive. Each filter has a limit of five
        # conditional operands. Conditional operands are AND and OR . = and != AND OR LIKE and NOT LIKE .
        # These can be used only as prefix searches. Include a % at the end of the string that you want to
        # search for and include. IN and NOT IN , using parentheses ( ) Examples: Namespace NOT LIKE 'AWS/%'
        # includes only namespaces that don't start with AWS/ , such as custom namespaces. Namespace IN
        # ('AWS/EC2', 'AWS/ELB', 'AWS/S3') includes only the metrics in the EC2, Elastic Load Balancing, and
        # Amazon S3 namespaces. Namespace = 'AWS/EC2' OR Namespace NOT LIKE 'AWS/%' includes only the EC2
        # namespace and your custom namespaces. If you are updating a link that uses filters, you can specify
        # * as the only value for the filter parameter to delete the filter and share all metric namespaces
        # with the monitoring account.
        @[JSON::Field(key: "Filter")]
        getter filter : String

        def initialize(
          @filter : String
        )
        end
      end

      # A required parameter is missing from the request.
      struct MissingRequiredParameterException
        include JSON::Serializable

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @amzn_error_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct PutSinkPolicyInput
        include JSON::Serializable

        # The JSON policy to use. If you are updating an existing policy, the entire existing policy is
        # replaced by what you specify here. The policy must be in JSON string format with quotation marks
        # escaped and no newlines. For examples of different types of policies, see the Examples section on
        # this page.
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The ARN of the sink to attach this policy to.
        @[JSON::Field(key: "SinkIdentifier")]
        getter sink_identifier : String

        def initialize(
          @policy : String,
          @sink_identifier : String
        )
        end
      end

      struct PutSinkPolicyOutput
        include JSON::Serializable

        # The policy that you specified.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The ARN of the sink.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "SinkId")]
        getter sink_id : String?

        def initialize(
          @policy : String? = nil,
          @sink_arn : String? = nil,
          @sink_id : String? = nil
        )
        end
      end

      # The request references a resource that does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the exception.
        @[JSON::Field(key: "x-amzn-ErrorType")]
        getter amzn_error_type : String?

        def initialize(
          @message : String? = nil,
          @amzn_error_type : String? = nil
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the resource that you're adding tags to. The ARN format of a sink is arn:aws:oam: Region
        # : account-id :sink/ sink-id The ARN format of a link is arn:aws:oam: Region : account-id :link/
        # link-id For more information about ARN format, see CloudWatch Logs resources and operations .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A resource can have no more than 50 tags.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the resource that you're removing tags from. The ARN format of a sink is arn:aws:oam:
        # Region : account-id :sink/ sink-id The ARN format of a link is arn:aws:oam: Region : account-id
        # :link/ link-id For more information about ARN format, see CloudWatch Logs resources and operations .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateLinkInput
        include JSON::Serializable

        # The ARN of the link that you want to update.
        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # An array of strings that define which types of data that the source account will send to the
        # monitoring account. Your input here replaces the current set of data types that are shared.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)

        # Specifies whether to include the tags associated with the link in the response after the update
        # operation. When IncludeTags is set to true and the caller has the required permission,
        # oam:ListTagsForResource , the API will return the tags for the specified resource. If the caller
        # doesn't have the required permission, oam:ListTagsForResource , the API will raise an exception. The
        # default value is false .
        @[JSON::Field(key: "IncludeTags")]
        getter include_tags : Bool?

        # Use this structure to filter which metric namespaces and which log groups are to be shared from the
        # source account to the monitoring account.
        @[JSON::Field(key: "LinkConfiguration")]
        getter link_configuration : Types::LinkConfiguration?

        def initialize(
          @identifier : String,
          @resource_types : Array(String),
          @include_tags : Bool? = nil,
          @link_configuration : Types::LinkConfiguration? = nil
        )
        end
      end

      struct UpdateLinkOutput
        include JSON::Serializable

        # The ARN of the link that you have updated.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The random ID string that Amazon Web Services generated as part of the sink ARN.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The label assigned to this link, with the variables resolved to their actual values.
        @[JSON::Field(key: "Label")]
        getter label : String?

        # The exact label template that was specified when the link was created, with the template variables
        # not resolved.
        @[JSON::Field(key: "LabelTemplate")]
        getter label_template : String?

        # This structure includes filters that specify which metric namespaces and which log groups are shared
        # from the source account to the monitoring account.
        @[JSON::Field(key: "LinkConfiguration")]
        getter link_configuration : Types::LinkConfiguration?

        # The resource types now supported by this link.
        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(String)?

        # The ARN of the sink that is used for this link.
        @[JSON::Field(key: "SinkArn")]
        getter sink_arn : String?

        # The tags assigned to the link.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @label : String? = nil,
          @label_template : String? = nil,
          @link_configuration : Types::LinkConfiguration? = nil,
          @resource_types : Array(String)? = nil,
          @sink_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The value of a parameter in the request caused an error.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
