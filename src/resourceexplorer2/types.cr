require "json"
require "time"

module Aws
  module ResourceExplorer2
    module Types

      # The credentials that you used to call this operation don't have the minimum required permissions.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateDefaultViewInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view to set as the default for the Amazon Web Services Region
        # and Amazon Web Services account in which you call this operation. The specified view must already
        # exist in the called Region.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String

        def initialize(
          @view_arn : String
        )
        end
      end


      struct AssociateDefaultViewOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that the operation set as the default for queries made in
        # the Amazon Web Services Region and Amazon Web Services account in which you called this operation.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @view_arn : String? = nil
        )
        end
      end

      # A collection of error messages for any views that Amazon Web Services Resource Explorer couldn't
      # retrieve details.

      struct BatchGetViewError
        include JSON::Serializable

        # The description of the error for the specified view.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The Amazon resource name (ARN) of the view for which Resource Explorer failed to retrieve details.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String

        def initialize(
          @error_message : String,
          @view_arn : String
        )
        end
      end


      struct BatchGetViewInput
        include JSON::Serializable

        # A list of Amazon resource names (ARNs) that identify the views you want details for.

        @[JSON::Field(key: "ViewArns")]
        getter view_arns : Array(String)?

        def initialize(
          @view_arns : Array(String)? = nil
        )
        end
      end


      struct BatchGetViewOutput
        include JSON::Serializable

        # If any of the specified ARNs result in an error, then this structure describes the error.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetViewError)?

        # A structure with a list of objects with details for each of the specified views.

        @[JSON::Field(key: "Views")]
        getter views : Array(Types::View)?

        def initialize(
          @errors : Array(Types::BatchGetViewError)? = nil,
          @views : Array(Types::View)? = nil
        )
        end
      end

      # If you attempted to create a view, then the request failed because either you specified parameters
      # that didn’t match the original request, or you attempted to create a view with a name that already
      # exists in this Amazon Web Services Region. If you attempted to create an index, then the request
      # failed because either you specified parameters that didn't match the original request, or an index
      # already exists in the current Amazon Web Services Region. If you attempted to update an index type
      # to AGGREGATOR , then the request failed because you already have an AGGREGATOR index in a different
      # Amazon Web Services Region.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateIndexInput
        include JSON::Serializable

        # This value helps ensure idempotency. Resource Explorer uses this value to prevent the accidental
        # creation of duplicate versions. We recommend that you generate a UUID-type value to ensure the
        # uniqueness of your index.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The specified tags are attached only to the index created in this Amazon Web Services Region. The
        # tags aren't attached to any of the resources listed in the index.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateIndexOutput
        include JSON::Serializable

        # The ARN of the new local index for the Region. You can reference this ARN in IAM permission policies
        # to authorize the following operations: DeleteIndex | GetIndex | UpdateIndexType | CreateView

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and timestamp when the index was created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Indicates the current state of the index. You can check for changes to the state for asynchronous
        # operations by calling the GetIndex operation. The state can remain in the CREATING or UPDATING state
        # for several hours as Resource Explorer discovers the information about your resources and populates
        # the index.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreateResourceExplorerSetupInput
        include JSON::Serializable

        # A list of Amazon Web Services Regions where Resource Explorer should be configured. Each Region in
        # the list will have a user-owned index created.

        @[JSON::Field(key: "RegionList")]
        getter region_list : Array(String)

        # The name for the view to be created as part of the Resource Explorer setup. The view name must be
        # unique within the Amazon Web Services account and Region.

        @[JSON::Field(key: "ViewName")]
        getter view_name : String

        # A list of Amazon Web Services Regions that should be configured as aggregator Regions. Aggregator
        # Regions receive replicated index information from all other Regions where there is a user-owned
        # index.

        @[JSON::Field(key: "AggregatorRegions")]
        getter aggregator_regions : Array(String)?

        def initialize(
          @region_list : Array(String),
          @view_name : String,
          @aggregator_regions : Array(String)? = nil
        )
        end
      end


      struct CreateResourceExplorerSetupOutput
        include JSON::Serializable

        # The unique identifier for the setup task. Use this ID with GetResourceExplorerSetup to monitor the
        # progress of the configuration operation.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct CreateViewInput
        include JSON::Serializable

        # The name of the new view. This name appears in the list of views in Resource Explorer. The name must
        # be no more than 64 characters long, and can include letters, digits, and the dash (-) character. The
        # name must be unique within its Amazon Web Services Region.

        @[JSON::Field(key: "ViewName")]
        getter view_name : String

        # This value helps ensure idempotency. Resource Explorer uses this value to prevent the accidental
        # creation of duplicate versions. We recommend that you generate a UUID-type value to ensure the
        # uniqueness of your views.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An array of strings that specify which resources are included in the results of queries made using
        # this view. When you use this view in a Search operation, the filter string is combined with the
        # search's QueryString parameter using a logical AND operator. For information about the supported
        # syntax, see Search query reference for Resource Explorer in the Amazon Web Services Resource
        # Explorer User Guide . This query string in the context of this operation supports only filter
        # prefixes with optional operators . It doesn't support free-form text. For example, the string
        # region:us* service:ec2 -tag:stage=prod includes all Amazon EC2 resources in any Amazon Web Services
        # Region that begins with the letters us and is not tagged with a key Stage that has the value prod .

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # Specifies optional fields that you want included in search results from this view. It is a list of
        # objects that each describe a field to include. The default is an empty list, with no optional fields
        # included in the results.

        @[JSON::Field(key: "IncludedProperties")]
        getter included_properties : Array(Types::IncludedProperty)?

        # The root ARN of the account, an organizational unit (OU), or an organization ARN. If left empty, the
        # default is account.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # Tag key and value pairs that are attached to the view.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @view_name : String,
          @client_token : String? = nil,
          @filters : Types::SearchFilter? = nil,
          @included_properties : Array(Types::IncludedProperty)? = nil,
          @scope : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateViewOutput
        include JSON::Serializable

        # A structure that contains the details about the new view.

        @[JSON::Field(key: "View")]
        getter view : Types::View?

        def initialize(
          @view : Types::View? = nil
        )
        end
      end


      struct DeleteIndexInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index that you want to delete.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteIndexOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index that you successfully started the deletion process. This
        # operation is asynchronous. To check its status, call the GetIndex operation.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time when you last updated this index.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates the current state of the index.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @last_updated_at : Time? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteResourceExplorerSetupInput
        include JSON::Serializable

        # Specifies whether to delete Resource Explorer configuration from all Regions where it is currently
        # enabled. If this parameter is set to true , a value for RegionList must not be provided. Otherwise,
        # the operation fails with a ValidationException error.

        @[JSON::Field(key: "DeleteInAllRegions")]
        getter delete_in_all_regions : Bool?

        # A list of Amazon Web Services Regions from which to delete the Resource Explorer configuration. If
        # not specified, the operation uses the DeleteInAllRegions parameter to determine scope.

        @[JSON::Field(key: "RegionList")]
        getter region_list : Array(String)?

        def initialize(
          @delete_in_all_regions : Bool? = nil,
          @region_list : Array(String)? = nil
        )
        end
      end


      struct DeleteResourceExplorerSetupOutput
        include JSON::Serializable

        # The unique identifier for the deletion task. Use this ID with GetResourceExplorerSetup to monitor
        # the progress of the deletion operation.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct DeleteViewInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that you want to delete.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String

        def initialize(
          @view_arn : String
        )
        end
      end


      struct DeleteViewOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that you successfully deleted.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @view_arn : String? = nil
        )
        end
      end


      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an error that occurred during a Resource Explorer setup operation.

      struct ErrorDetails
        include JSON::Serializable

        # The error code that identifies the type of error that occurred.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # A human-readable description of the error that occurred.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetAccountLevelServiceConfigurationOutput
        include JSON::Serializable

        # Details about the organization, and whether configuration is ENABLED or DISABLED .

        @[JSON::Field(key: "OrgConfiguration")]
        getter org_configuration : Types::OrgConfiguration?

        def initialize(
          @org_configuration : Types::OrgConfiguration? = nil
        )
        end
      end


      struct GetDefaultViewOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that is the current default for the Amazon Web Services
        # Region in which you called this operation.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @view_arn : String? = nil
        )
        end
      end


      struct GetIndexOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time when the index was originally created.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The date and time when the index was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # This response value is present only if this index is Type=AGGREGATOR . A list of the Amazon Web
        # Services Regions that replicate their content to the index in this Region.

        @[JSON::Field(key: "ReplicatingFrom")]
        getter replicating_from : Array(String)?

        # This response value is present only if this index is Type=LOCAL . The Amazon Web Services Region
        # that contains the aggregator index, if one exists. If an aggregator index does exist then the Region
        # in which you called this operation replicates its index information to the Region specified in this
        # response value.

        @[JSON::Field(key: "ReplicatingTo")]
        getter replicating_to : Array(String)?

        # The current state of the index in this Amazon Web Services Region.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Tag key and value pairs that are attached to the index.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The type of the index in this Region. For information about the aggregator index and how it differs
        # from a local index, see Turning on cross-Region search by creating an aggregator index .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @replicating_from : Array(String)? = nil,
          @replicating_to : Array(String)? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetManagedViewInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the managed view.

        @[JSON::Field(key: "ManagedViewArn")]
        getter managed_view_arn : String

        def initialize(
          @managed_view_arn : String
        )
        end
      end


      struct GetManagedViewOutput
        include JSON::Serializable

        # Details about the specified managed view.

        @[JSON::Field(key: "ManagedView")]
        getter managed_view : Types::ManagedView?

        def initialize(
          @managed_view : Types::ManagedView? = nil
        )
        end
      end


      struct GetResourceExplorerSetupInput
        include JSON::Serializable

        # The unique identifier of the setup task to retrieve status information for. This ID is returned by
        # CreateResourceExplorerSetup or DeleteResourceExplorerSetup operations.

        @[JSON::Field(key: "TaskId")]
        getter task_id : String

        # The maximum number of Region status results to return in a single response. Valid values are between
        # 1 and 100 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token from a previous GetResourceExplorerSetup response. Use this token to retrieve
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @task_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetResourceExplorerSetupOutput
        include JSON::Serializable

        # The pagination token to use in a subsequent GetResourceExplorerSetup request to retrieve the next
        # set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Region status objects that describe the current state of Resource Explorer configuration
        # in each Region.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(Types::RegionStatus)?

        def initialize(
          @next_token : String? = nil,
          @regions : Array(Types::RegionStatus)? = nil
        )
        end
      end


      struct GetServiceIndexOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Resource Explorer index in the current Region.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The type of the index. Valid values are LOCAL (contains resources from the current Region only) or
        # AGGREGATOR (contains replicated resource information from all Regions).

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct GetServiceViewInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service view to retrieve details for.

        @[JSON::Field(key: "ServiceViewArn")]
        getter service_view_arn : String

        def initialize(
          @service_view_arn : String
        )
        end
      end


      struct GetServiceViewOutput
        include JSON::Serializable

        # A ServiceView object that contains the details and configuration of the requested service view.

        @[JSON::Field(key: "View")]
        getter view : Types::ServiceView

        def initialize(
          @view : Types::ServiceView
        )
        end
      end


      struct GetViewInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that you want information about.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String

        def initialize(
          @view_arn : String
        )
        end
      end


      struct GetViewOutput
        include JSON::Serializable

        # Tag key and value pairs that are attached to the view.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A structure that contains the details for the requested view.

        @[JSON::Field(key: "View")]
        getter view : Types::View?

        def initialize(
          @tags : Hash(String, String)? = nil,
          @view : Types::View? = nil
        )
        end
      end

      # Information about an additional property that describes a resource, that you can optionally include
      # in the view. This lets you view that property in search results, and filter your search results
      # based on the value of the property.

      struct IncludedProperty
        include JSON::Serializable

        # The name of the property that is included in this view. You can specify the following property names
        # for this field: tags

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # An index is the data store used by Amazon Web Services Resource Explorer to hold information about
      # your Amazon Web Services resources that the service discovers. Creating an index in an Amazon Web
      # Services Region turns on Resource Explorer and lets it discover your resources. By default, an index
      # is local , meaning that it contains information about resources in only the same Region as the
      # index. However, you can promote the index of one Region in the account by calling UpdateIndexType to
      # convert it into an aggregator index. The aggregator index receives a replicated copy of the index
      # information from all other Regions where Resource Explorer is turned on. This allows search
      # operations in that Region to return results from all Regions in the account.

      struct Index
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services Region in which the index exists.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The type of index. It can be one of the following values: LOCAL – The index contains information
        # about resources from only the same Amazon Web Services Region. AGGREGATOR – Resource Explorer
        # replicates copies of the indexed information about resources in all other Amazon Web Services
        # Regions to the aggregator index. This lets search results in the Region with the aggregator index to
        # include resources from all Regions in the account where Resource Explorer is turned on.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @region : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the status of a Resource Explorer index operation in a specific Region.

      struct IndexStatus
        include JSON::Serializable

        # Details about any error that occurred during the index operation.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?


        @[JSON::Field(key: "Index")]
        getter index : Types::Index?

        # The current status of the index operation. Valid values are SUCCEEDED , FAILED , IN_PROGRESS , or
        # SKIPPED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @error_details : Types::ErrorDetails? = nil,
          @index : Types::Index? = nil,
          @status : String? = nil
        )
        end
      end

      # The request failed because of internal service error. Try your request again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListIndexesForMembersInput
        include JSON::Serializable

        # The account IDs will limit the output to only indexes from these accounts.

        @[JSON::Field(key: "AccountIdList")]
        getter account_id_list : Array(String)

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @account_id_list : Array(String),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndexesForMembersOutput
        include JSON::Serializable

        # A structure that contains the details and status of each index.

        @[JSON::Field(key: "Indexes")]
        getter indexes : Array(Types::MemberIndex)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @indexes : Array(Types::MemberIndex)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndexesInput
        include JSON::Serializable

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If specified, limits the response to only information about the index in the specified list of
        # Amazon Web Services Regions.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        # If specified, limits the output to only indexes of the specified Type, either LOCAL or AGGREGATOR .
        # Use this option to discover the aggregator index for your account.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @regions : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListIndexesOutput
        include JSON::Serializable

        # A structure that contains the details and status of each index.

        @[JSON::Field(key: "Indexes")]
        getter indexes : Array(Types::Index)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @indexes : Array(Types::Index)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedViewsInput
        include JSON::Serializable

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies a service principal name. If specified, then the operation only returns the managed views
        # that are managed by the input service.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_principal : String? = nil
        )
        end
      end


      struct ListManagedViewsOutput
        include JSON::Serializable

        # The list of managed views available in the Amazon Web Services Region in which you called this
        # operation.

        @[JSON::Field(key: "ManagedViews")]
        getter managed_views : Array(String)?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @managed_views : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourcesInput
        include JSON::Serializable

        # An array of strings that specify which resources are included in the results of queries made using
        # this view. When you use this view in a Search operation, the filter string is combined with the
        # search's QueryString parameter using a logical AND operator. For information about the supported
        # syntax, see Search query reference for Resource Explorer in the Amazon Web Services Resource
        # Explorer User Guide . This query string in the context of this operation supports only filter
        # prefixes with optional operators . It doesn't support free-form text. For example, the string
        # region:us* service:ec2 -tag:stage=prod includes all Amazon EC2 resources in any Amazon Web Services
        # Region that begins with the letters us and is not tagged with a key Stage that has the value prod .

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours. The ListResources operation does not generate a
        # NextToken if you set MaxResults to 1000.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the Amazon resource name (ARN) of the view to use for the query. If you don't specify a
        # value for this parameter, then the operation automatically uses the default view for the Amazon Web
        # Services Region in which you called this operation. If the Region either doesn't have a default view
        # or if you don't have permission to use the default view, then the operation fails with a 401
        # Unauthorized exception.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @filters : Types::SearchFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @view_arn : String? = nil
        )
        end
      end


      struct ListResourcesOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of structures that describe the resources that match the query.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        # The Amazon resource name (ARN) of the view that this operation used to perform the search.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @view_arn : String? = nil
        )
        end
      end


      struct ListServiceIndexesInput
        include JSON::Serializable

        # The maximum number of index results to return in a single response. Valid values are between 1 and
        # 100 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token from a previous ListServiceIndexes response. Use this token to retrieve the
        # next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Amazon Web Services Regions to include in the search for indexes. If not specified,
        # indexes from all Regions are returned.

        @[JSON::Field(key: "Regions")]
        getter regions : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @regions : Array(String)? = nil
        )
        end
      end


      struct ListServiceIndexesOutput
        include JSON::Serializable

        # A list of Index objects that describe the Resource Explorer indexes found in the specified Regions.

        @[JSON::Field(key: "Indexes")]
        getter indexes : Array(Types::Index)?

        # The pagination token to use in a subsequent ListServiceIndexes request to retrieve the next set of
        # results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @indexes : Array(Types::Index)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceViewsInput
        include JSON::Serializable

        # The maximum number of service view results to return in a single response. Valid values are between
        # 1 and 50 .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token from a previous ListServiceViews response. Use this token to retrieve the next
        # set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceViewsOutput
        include JSON::Serializable

        # The pagination token to use in a subsequent ListServiceViews request to retrieve the next set of
        # results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of Amazon Resource Names (ARNs) for the service views available in the current Amazon Web
        # Services account.

        @[JSON::Field(key: "ServiceViews")]
        getter service_views : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @service_views : Array(String)? = nil
        )
        end
      end


      struct ListStreamingAccessForServicesInput
        include JSON::Serializable

        # The maximum number of streaming access entries to return in the response. If there are more results
        # available, the response includes a NextToken value that you can use in a subsequent call to get the
        # next set of results. The value must be between 1 and 50. If you don't specify a value, the default
        # is 50.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStreamingAccessForServicesOutput
        include JSON::Serializable

        # A list of Amazon Web Services services that have streaming access to your Resource Explorer data,
        # including details about when the access was granted.

        @[JSON::Field(key: "StreamingAccessForServices")]
        getter streaming_access_for_services : Array(Types::StreamingAccessDetails)

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @streaming_access_for_services : Array(Types::StreamingAccessDetails),
          @next_token : String? = nil
        )
        end
      end


      struct ListSupportedResourceTypesInput
        include JSON::Serializable

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSupportedResourceTypesOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of resource types supported by Resource Explorer.

        @[JSON::Field(key: "ResourceTypes")]
        getter resource_types : Array(Types::SupportedResourceType)?

        def initialize(
          @next_token : String? = nil,
          @resource_types : Array(Types::SupportedResourceType)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view or index that you want to attach tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The tag key and value pairs that you want to attach to the specified view or index.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListViewsInput
        include JSON::Serializable

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListViewsOutput
        include JSON::Serializable

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of views available in the Amazon Web Services Region in which you called this operation.

        @[JSON::Field(key: "Views")]
        getter views : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @views : Array(String)? = nil
        )
        end
      end

      # An Amazon Web Services-managed view is how other Amazon Web Services services can access resource
      # information indexed by Resource Explorer for your Amazon Web Services account or organization with
      # your consent. For more information, see Managed views .

      struct ManagedView
        include JSON::Serializable


        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # A structure that contains additional information about the managed view.

        @[JSON::Field(key: "IncludedProperties")]
        getter included_properties : Array(Types::IncludedProperty)?

        # The date and time when this managed view was last modified.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The Amazon resource name (ARN) of the managed view.

        @[JSON::Field(key: "ManagedViewArn")]
        getter managed_view_arn : String?

        # The name of the managed view.

        @[JSON::Field(key: "ManagedViewName")]
        getter managed_view_name : String?

        # The Amazon Web Services account that owns this managed view.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The resource policy that defines access to the managed view. To learn more about this policy, review
        # Managed views .

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        # An Amazon resource name (ARN) of an Amazon Web Services account or organization that specifies
        # whether this managed view includes resources from only the specified Amazon Web Services account or
        # all accounts in the specified organization.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The service principal of the Amazon Web Services service that created and manages the managed view.

        @[JSON::Field(key: "TrustedService")]
        getter trusted_service : String?

        # The version of the managed view.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @filters : Types::SearchFilter? = nil,
          @included_properties : Array(Types::IncludedProperty)? = nil,
          @last_updated_at : Time? = nil,
          @managed_view_arn : String? = nil,
          @managed_view_name : String? = nil,
          @owner : String? = nil,
          @resource_policy : String? = nil,
          @scope : String? = nil,
          @trusted_service : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An index is the data store used by Amazon Web Services Resource Explorer to hold information about
      # your Amazon Web Services resources that the service discovers.

      struct MemberIndex
        include JSON::Serializable

        # The account ID for the index.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon resource name (ARN) of the index.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services Region in which the index exists.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The type of index. It can be one of the following values: LOCAL – The index contains information
        # about resources from only the same Amazon Web Services Region. AGGREGATOR – Resource Explorer
        # replicates copies of the indexed information about resources in all other Amazon Web Services
        # Regions to the aggregator index. This lets search results in the Region with the aggregator index to
        # include resources from all Regions in the account where Resource Explorer is turned on.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @account_id : String? = nil,
          @arn : String? = nil,
          @region : String? = nil,
          @type : String? = nil
        )
        end
      end

      # This is a structure that contains the status of Amazon Web Services service access, and whether you
      # have a valid service-linked role to enable multi-account search for your organization.

      struct OrgConfiguration
        include JSON::Serializable

        # This value displays whether your Amazon Web Services service access is ENABLED or DISABLED .

        @[JSON::Field(key: "AWSServiceAccessStatus")]
        getter aws_service_access_status : String

        # This value shows whether or not you have a valid a service-linked role required to start the
        # multi-account search feature.

        @[JSON::Field(key: "ServiceLinkedRole")]
        getter service_linked_role : String?

        def initialize(
          @aws_service_access_status : String,
          @service_linked_role : String? = nil
        )
        end
      end

      # Contains information about the status of Resource Explorer configuration in a specific Amazon Web
      # Services Region.

      struct RegionStatus
        include JSON::Serializable

        # The status information for the Resource Explorer index in this Region.

        @[JSON::Field(key: "Index")]
        getter index : Types::IndexStatus?

        # The Amazon Web Services Region for which this status information applies.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The status information for the Resource Explorer view in this Region.

        @[JSON::Field(key: "View")]
        getter view : Types::ViewStatus?

        def initialize(
          @index : Types::IndexStatus? = nil,
          @region : String? = nil,
          @view : Types::ViewStatus? = nil
        )
        end
      end

      # A resource in Amazon Web Services that Amazon Web Services Resource Explorer has discovered, and for
      # which it has stored information in the index of the Amazon Web Services Region that contains the
      # resource.

      struct Resource
        include JSON::Serializable

        # The Amazon resource name (ARN) of the resource.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that Resource Explorer last queried this resource and updated the index with the
        # latest information about the resource.

        @[JSON::Field(key: "LastReportedAt")]
        getter last_reported_at : Time?

        # The Amazon Web Services account that owns the resource.

        @[JSON::Field(key: "OwningAccountId")]
        getter owning_account_id : String?

        # A structure with additional type-specific details about the resource. These properties can be added
        # by turning on integration between Resource Explorer and other Amazon Web Services services.

        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::ResourceProperty)?

        # The Amazon Web Services Region in which the resource was created and exists.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The type of the resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The Amazon Web Services service that owns the resource and is responsible for creating and updating
        # it.

        @[JSON::Field(key: "Service")]
        getter service : String?

        def initialize(
          @arn : String? = nil,
          @last_reported_at : Time? = nil,
          @owning_account_id : String? = nil,
          @properties : Array(Types::ResourceProperty)? = nil,
          @region : String? = nil,
          @resource_type : String? = nil,
          @service : String? = nil
        )
        end
      end

      # Information about the number of results that match the query. At this time, Amazon Web Services
      # Resource Explorer doesn't count more than 1,000 matches for any query. This structure provides
      # information about whether the query exceeded this limit. This field is included in every page when
      # you paginate the results.

      struct ResourceCount
        include JSON::Serializable

        # Indicates whether the TotalResources value represents an exhaustive count of search results. If True
        # , it indicates that the search was exhaustive. Every resource that matches the query was counted. If
        # False , then the search reached the limit of 1,000 matching results, and stopped counting.

        @[JSON::Field(key: "Complete")]
        getter complete : Bool?

        # The number of resources that match the search query. This value can't exceed 1,000. If there are
        # more than 1,000 resources that match the query, then only 1,000 are counted and the Complete field
        # is set to false. We recommend that you refine your query to return a smaller number of results.

        @[JSON::Field(key: "TotalResources")]
        getter total_resources : Int64?

        def initialize(
          @complete : Bool? = nil,
          @total_resources : Int64? = nil
        )
        end
      end

      # You specified a resource that doesn't exist. Check the ID or ARN that you used to identity the
      # resource, and try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that describes a property of a resource.

      struct ResourceProperty
        include JSON::Serializable

        # Details about this property. The content of this field is a JSON object that varies based on the
        # resource type.

        @[JSON::Field(key: "Data")]
        getter data : Types::Document?

        # The date and time that the information about this resource property was last updated.

        @[JSON::Field(key: "LastReportedAt")]
        getter last_reported_at : Time?

        # The name of this property of the resource.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @data : Types::Document? = nil,
          @last_reported_at : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A search filter defines which resources can be part of a search query result set.

      struct SearchFilter
        include JSON::Serializable

        # The string that contains the search keywords, prefixes, and operators to control the results that
        # can be returned by a Search operation. For more details, see Search query syntax .

        @[JSON::Field(key: "FilterString")]
        getter filter_string : String

        def initialize(
          @filter_string : String
        )
        end
      end


      struct SearchInput
        include JSON::Serializable

        # A string that includes keywords and filters that specify the resources that you want to include in
        # the results. For the complete syntax supported by the QueryString parameter, see Search query syntax
        # reference for Resource Explorer . The search is completely case insensitive. You can specify an
        # empty string to return all results up to the limit of 1,000 total results. The operation can return
        # only the first 1,000 results. If the resource you want is not included, then use a different value
        # for QueryString to refine the results.

        @[JSON::Field(key: "QueryString")]
        getter query_string : String

        # The maximum number of results that you want included on each page of the response. If you do not
        # include this parameter, it defaults to a value appropriate to the operation. If additional items
        # exist beyond those included in the current response, the NextToken response element is present and
        # has a value (is not null). Include that value as the NextToken request parameter in the next call to
        # the operation to get the next part of the results. An API operation can return fewer results than
        # the maximum even when there are more results available. You should check NextToken after every
        # operation to ensure that you receive all of the results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The parameter for receiving additional results if you receive a NextToken response in a previous
        # request. A NextToken response indicates that more output is available. Set this parameter to the
        # value of the previous call's NextToken response to indicate where the output should continue from.
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the Amazon resource name (ARN) of the view to use for the query. If you don't specify a
        # value for this parameter, then the operation automatically uses the default view for the Amazon Web
        # Services Region in which you called this operation. If the Region either doesn't have a default view
        # or if you don't have permission to use the default view, then the operation fails with a 401
        # Unauthorized exception.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @query_string : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @view_arn : String? = nil
        )
        end
      end


      struct SearchOutput
        include JSON::Serializable

        # The number of resources that match the query.

        @[JSON::Field(key: "Count")]
        getter count : Types::ResourceCount?

        # If present, indicates that more output is available than is included in the current response. Use
        # this value in the NextToken request parameter in a subsequent call to the operation to get the next
        # part of the output. You should repeat this until the NextToken response element comes back as null .
        # The pagination tokens expire after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of structures that describe the resources that match the query.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        # The Amazon resource name (ARN) of the view that this operation used to perform the search.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        def initialize(
          @count : Types::ResourceCount? = nil,
          @next_token : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @view_arn : String? = nil
        )
        end
      end

      # The request failed because it exceeds a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the service quota that was exceeded by the request.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The current value for the quota that the request tried to exceed.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @message : String,
          @name : String,
          @value : String
        )
        end
      end

      # Contains the configuration and properties of a Resource Explorer service view.

      struct ServiceView
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service view.

        @[JSON::Field(key: "ServiceViewArn")]
        getter service_view_arn : String


        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # A list of additional resource properties that are included in this view for search and filtering
        # purposes.

        @[JSON::Field(key: "IncludedProperties")]
        getter included_properties : Array(Types::IncludedProperty)?

        # The scope type of the service view, which determines what resources are included.

        @[JSON::Field(key: "ScopeType")]
        getter scope_type : String?

        # The name of the service view.

        @[JSON::Field(key: "ServiceViewName")]
        getter service_view_name : String?

        # The Amazon Web Services service that has streaming access to this view's data.

        @[JSON::Field(key: "StreamingAccessForService")]
        getter streaming_access_for_service : String?

        def initialize(
          @service_view_arn : String,
          @filters : Types::SearchFilter? = nil,
          @included_properties : Array(Types::IncludedProperty)? = nil,
          @scope_type : String? = nil,
          @service_view_name : String? = nil,
          @streaming_access_for_service : String? = nil
        )
        end
      end

      # Contains information about an Amazon Web Services service that has been granted streaming access to
      # your Resource Explorer data.

      struct StreamingAccessDetails
        include JSON::Serializable

        # The date and time when streaming access was granted to the Amazon Web Services service, in ISO 8601
        # format.

        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time

        # The service principal of the Amazon Web Services service that has streaming access to your Resource
        # Explorer data. A service principal is a unique identifier for an Amazon Web Services service.

        @[JSON::Field(key: "ServicePrincipal")]
        getter service_principal : String

        def initialize(
          @created_at : Time,
          @service_principal : String
        )
        end
      end

      # A structure that describes a resource type supported by Amazon Web Services Resource Explorer.

      struct SupportedResourceType
        include JSON::Serializable

        # The unique identifier of the resource type.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The Amazon Web Services service that is associated with the resource type. This is the primary
        # service that lets you create and interact with resources of this type.

        @[JSON::Field(key: "Service")]
        getter service : String?

        def initialize(
          @resource_type : String? = nil,
          @service : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the view or index that you want to attach tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag key and value pairs that you want to attach to the specified view or index.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request failed because you exceeded a rate limit for this operation. For more information, see
      # Quotas for Resource Explorer .

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The principal making the request isn't permitted to perform the operation.

      struct UnauthorizedException
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

        # The Amazon Resource Name (ARN) of the view or index that you want to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of the keys for the tags that you want to remove from the specified view or index.

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


      struct UpdateIndexTypeInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index that you want to update.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The type of the index. To understand the difference between LOCAL and AGGREGATOR , see Turning on
        # cross-Region search in the Amazon Web Services Resource Explorer User Guide .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @arn : String,
          @type : String
        )
        end
      end


      struct UpdateIndexTypeOutput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the index that you updated.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and timestamp when the index was last updated.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # Indicates the state of the request to update the index. This operation is asynchronous. Call the
        # GetIndex operation to check for changes.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Specifies the type of the specified index after the operation completes.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @last_updated_at : Time? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateViewInput
        include JSON::Serializable

        # The Amazon resource name (ARN) of the view that you want to modify.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String

        # An array of strings that specify which resources are included in the results of queries made using
        # this view. When you use this view in a Search operation, the filter string is combined with the
        # search's QueryString parameter using a logical AND operator. For information about the supported
        # syntax, see Search query reference for Resource Explorer in the Amazon Web Services Resource
        # Explorer User Guide . This query string in the context of this operation supports only filter
        # prefixes with optional operators . It doesn't support free-form text. For example, the string
        # region:us* service:ec2 -tag:stage=prod includes all Amazon EC2 resources in any Amazon Web Services
        # Region that begins with the letters us and is not tagged with a key Stage that has the value prod .

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # Specifies optional fields that you want included in search results from this view. It is a list of
        # objects that each describe a field to include. The default is an empty list, with no optional fields
        # included in the results.

        @[JSON::Field(key: "IncludedProperties")]
        getter included_properties : Array(Types::IncludedProperty)?

        def initialize(
          @view_arn : String,
          @filters : Types::SearchFilter? = nil,
          @included_properties : Array(Types::IncludedProperty)? = nil
        )
        end
      end


      struct UpdateViewOutput
        include JSON::Serializable

        # Details about the view that you changed with this operation.

        @[JSON::Field(key: "View")]
        getter view : Types::View?

        def initialize(
          @view : Types::View? = nil
        )
        end
      end

      # You provided an invalid value for one of the operation's parameters. Check the syntax for the
      # operation, and try again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # An array of the request fields that had validation errors.

        @[JSON::Field(key: "FieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # A structure that describes a request field with a validation error.

      struct ValidationExceptionField
        include JSON::Serializable

        # The name of the request field that had a validation error.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The validation error caused by the request field.

        @[JSON::Field(key: "ValidationIssue")]
        getter validation_issue : String

        def initialize(
          @name : String,
          @validation_issue : String
        )
        end
      end

      # A view is a structure that defines a set of filters that provide a view into the information in the
      # Amazon Web Services Resource Explorer index. The filters specify which information from the index is
      # visible to the users of the view. For example, you can specify filters that include only resources
      # that are tagged with the key "ENV" and the value "DEVELOPMENT" in the results returned by this view.
      # You could also create a second view that includes only resources that are tagged with "ENV" and
      # "PRODUCTION".

      struct View
        include JSON::Serializable

        # An array of SearchFilter objects that specify which resources can be included in the results of
        # queries made using this view.

        @[JSON::Field(key: "Filters")]
        getter filters : Types::SearchFilter?

        # A structure that contains additional information about the view.

        @[JSON::Field(key: "IncludedProperties")]
        getter included_properties : Array(Types::IncludedProperty)?

        # The date and time when this view was last modified.

        @[JSON::Field(key: "LastUpdatedAt")]
        getter last_updated_at : Time?

        # The Amazon Web Services account that owns this view.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # An Amazon resource name (ARN) of an Amazon Web Services account, an organization, or an
        # organizational unit (OU) that specifies whether this view includes resources from only the specified
        # Amazon Web Services account, all accounts in the specified organization, or all accounts in the
        # specified OU. If not specified, the value defaults to the Amazon Web Services account used to call
        # this operation.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        # The Amazon resource name (ARN) of the view.

        @[JSON::Field(key: "ViewArn")]
        getter view_arn : String?

        # The name of the view.

        @[JSON::Field(key: "ViewName")]
        getter view_name : String?

        def initialize(
          @filters : Types::SearchFilter? = nil,
          @included_properties : Array(Types::IncludedProperty)? = nil,
          @last_updated_at : Time? = nil,
          @owner : String? = nil,
          @scope : String? = nil,
          @view_arn : String? = nil,
          @view_name : String? = nil
        )
        end
      end

      # Contains information about the status of a Resource Explorer view operation in a specific Region.

      struct ViewStatus
        include JSON::Serializable

        # Details about any error that occurred during the view operation.

        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::ErrorDetails?

        # The current status of the view operation. Valid values are SUCCEEDED , FAILED , IN_PROGRESS , or
        # SKIPPED .

        @[JSON::Field(key: "Status")]
        getter status : String?


        @[JSON::Field(key: "View")]
        getter view : Types::View?

        def initialize(
          @error_details : Types::ErrorDetails? = nil,
          @status : String? = nil,
          @view : Types::View? = nil
        )
        end
      end
    end
  end
end
