require "json"
require "time"

module Aws
  module LaunchWizard
    module Types


      struct CreateDeploymentInput
        include JSON::Serializable

        # The name of the deployment pattern supported by a given workload. You can use the
        # ListWorkloadDeploymentPatterns operation to discover supported values for this parameter.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String

        # The name of the deployment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The settings specified for the deployment. These settings define how to deploy and configure your
        # resources created by the deployment. For more information about the specifications required for
        # creating a deployment for a SAP workload, see SAP deployment specifications . To retrieve the
        # specifications required to create a deployment for other workloads, use the
        # GetWorkloadDeploymentPattern operation.

        @[JSON::Field(key: "specifications")]
        getter specifications : Hash(String, String)

        # The name of the workload. You can use the ListWorkloads operation to discover supported values for
        # this parameter.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        # Checks whether you have the required permissions for the action, without actually making the
        # request, and provides an error response. If you have the required permissions, the error response is
        # DryRunOperation . Otherwise, it is UnauthorizedOperation .

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # The tags to add to the deployment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @deployment_pattern_name : String,
          @name : String,
          @specifications : Hash(String, String),
          @workload_name : String,
          @dry_run : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDeploymentOutput
        include JSON::Serializable

        # The ID of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        def initialize(
          @deployment_id : String? = nil
        )
        end
      end


      struct DeleteDeploymentInput
        include JSON::Serializable

        # The ID of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end


      struct DeleteDeploymentOutput
        include JSON::Serializable

        # The status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the deployment status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # A field that details a condition of the specifications for a deployment.

      struct DeploymentConditionalField
        include JSON::Serializable

        # The comparator of the condition. Valid values: Equal | NotEqual

        @[JSON::Field(key: "comparator")]
        getter comparator : String?

        # The name of the deployment condition.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the condition.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @comparator : String? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The data associated with a deployment.

      struct DeploymentData
        include JSON::Serializable

        # The time the deployment was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The time the deployment was deleted.

        @[JSON::Field(key: "deletedAt")]
        getter deleted_at : Time?

        # The Amazon Resource Name (ARN) of the deployment.

        @[JSON::Field(key: "deploymentArn")]
        getter deployment_arn : String?

        # The ID of the deployment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time the deployment was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The name of the deployment.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The pattern name of the deployment.

        @[JSON::Field(key: "patternName")]
        getter pattern_name : String?

        # The resource group of the deployment.

        @[JSON::Field(key: "resourceGroup")]
        getter resource_group : String?

        # The settings specified for the deployment. These settings define how to deploy and configure your
        # resources created by the deployment. For more information about the specifications required for
        # creating a deployment for a SAP workload, see SAP deployment specifications . To retrieve the
        # specifications required to create a deployment for other workloads, use the
        # GetWorkloadDeploymentPattern operation.

        @[JSON::Field(key: "specifications")]
        getter specifications : Hash(String, String)?

        # The status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Information about the tags attached to a deployment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        def initialize(
          @created_at : Time? = nil,
          @deleted_at : Time? = nil,
          @deployment_arn : String? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @pattern_name : String? = nil,
          @resource_group : String? = nil,
          @specifications : Hash(String, String)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # A summary of the deployment data.

      struct DeploymentDataSummary
        include JSON::Serializable

        # The time the deployment was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the deployment.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time the deployment was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The name of the deployment

        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the workload deployment pattern.

        @[JSON::Field(key: "patternName")]
        getter pattern_name : String?

        # The status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @pattern_name : String? = nil,
          @status : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # A summary of the deployment event data.

      struct DeploymentEventDataSummary
        include JSON::Serializable

        # The description of the deployment event.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the deployment event.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the deployment event.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason of the deployment event status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The timestamp of the deployment event.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # A filter name and value pair that is used to return more specific results from a describe operation.
      # Filters can be used to match a set of resources by specific criteria.

      struct DeploymentFilter
        include JSON::Serializable

        # The name of the filter. Filter names are case-sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values. Filter values are case-sensitive. If you specify multiple values for a filter,
        # the values are joined with an OR , and the request returns all results that match any of the
        # specified values.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes a deployment pattern version summary.

      struct DeploymentPatternVersionDataSummary
        include JSON::Serializable

        # The name of the deployment pattern.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String?

        # The name of the deployment pattern version.

        @[JSON::Field(key: "deploymentPatternVersionName")]
        getter deployment_pattern_version_name : String?

        # The description of the deployment pattern version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The URL of the documentation for the deployment pattern version.

        @[JSON::Field(key: "documentationUrl")]
        getter documentation_url : String?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        def initialize(
          @deployment_pattern_name : String? = nil,
          @deployment_pattern_version_name : String? = nil,
          @description : String? = nil,
          @documentation_url : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # A filter for deployment pattern versions. Use this filter to specify criteria for querying
      # deployment pattern versions in Launch Wizard.

      struct DeploymentPatternVersionFilter
        include JSON::Serializable

        # The name of the filter attribute. Specifies which attribute to filter on when querying deployment
        # pattern versions.

        @[JSON::Field(key: "name")]
        getter name : String

        # The values to filter by. Contains the specific values to match against when filtering deployment
        # pattern versions.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # A field that details a specification of a deployment pattern.

      struct DeploymentSpecificationsField
        include JSON::Serializable

        # The allowed values of the deployment specification.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)?

        # The conditionals used for the deployment specification.

        @[JSON::Field(key: "conditionals")]
        getter conditionals : Array(Types::DeploymentConditionalField)?

        # The description of the deployment specification.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the deployment specification.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates if the deployment specification is required.

        @[JSON::Field(key: "required")]
        getter required : String?

        def initialize(
          @allowed_values : Array(String)? = nil,
          @conditionals : Array(Types::DeploymentConditionalField)? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @required : String? = nil
        )
        end
      end


      struct GetDeploymentInput
        include JSON::Serializable

        # The ID of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end


      struct GetDeploymentOutput
        include JSON::Serializable

        # An object that details the deployment.

        @[JSON::Field(key: "deployment")]
        getter deployment : Types::DeploymentData?

        def initialize(
          @deployment : Types::DeploymentData? = nil
        )
        end
      end


      struct GetDeploymentPatternVersionInput
        include JSON::Serializable

        # The name of the deployment pattern. You can use the ListWorkloadDeploymentPatterns operation to
        # discover supported values for this parameter.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String

        # The name of the deployment pattern version.

        @[JSON::Field(key: "deploymentPatternVersionName")]
        getter deployment_pattern_version_name : String

        # The name of the workload. You can use the ListWorkloads operation to discover supported values for
        # this parameter.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @deployment_pattern_name : String,
          @deployment_pattern_version_name : String,
          @workload_name : String
        )
        end
      end


      struct GetDeploymentPatternVersionOutput
        include JSON::Serializable

        # The deployment pattern version.

        @[JSON::Field(key: "deploymentPatternVersion")]
        getter deployment_pattern_version : Types::DeploymentPatternVersionDataSummary?

        def initialize(
          @deployment_pattern_version : Types::DeploymentPatternVersionDataSummary? = nil
        )
        end
      end


      struct GetWorkloadDeploymentPatternInput
        include JSON::Serializable

        # The name of the deployment pattern.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @deployment_pattern_name : String,
          @workload_name : String
        )
        end
      end


      struct GetWorkloadDeploymentPatternOutput
        include JSON::Serializable

        # Details about the workload deployment pattern.

        @[JSON::Field(key: "workloadDeploymentPattern")]
        getter workload_deployment_pattern : Types::WorkloadDeploymentPatternData?

        def initialize(
          @workload_deployment_pattern : Types::WorkloadDeploymentPatternData? = nil
        )
        end
      end


      struct GetWorkloadInput
        include JSON::Serializable

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        def initialize(
          @workload_name : String
        )
        end
      end


      struct GetWorkloadOutput
        include JSON::Serializable

        # Information about the workload.

        @[JSON::Field(key: "workload")]
        getter workload : Types::WorkloadData?

        def initialize(
          @workload : Types::WorkloadData? = nil
        )
        end
      end

      # An internal error has occurred. Retry your request, but if the problem persists, contact us with
      # details by posting a question on re:Post .

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListDeploymentEventsInput
        include JSON::Serializable

        # The ID of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The maximum number of items to return for this request. To get the next page of items, make another
        # request with the token returned in the output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned from a previous paginated request. Pagination continues from the end of the items
        # returned by the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentEventsOutput
        include JSON::Serializable

        # Lists the deployment events.

        @[JSON::Field(key: "deploymentEvents")]
        getter deployment_events : Array(Types::DeploymentEventDataSummary)?

        # The token to include in another request to get the next page of items. This value is null when there
        # are no more items to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_events : Array(Types::DeploymentEventDataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentPatternVersionsInput
        include JSON::Serializable

        # The name of the deployment pattern. You can use the ListWorkloadDeploymentPatterns operation to
        # discover supported values for this parameter.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String

        # The name of the workload. You can use the ListWorkloads operation to discover supported values for
        # this parameter.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        # Filters to apply when listing deployment pattern versions.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::DeploymentPatternVersionFilter)?

        # The maximum number of deployment pattern versions to list.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_pattern_name : String,
          @workload_name : String,
          @filters : Array(Types::DeploymentPatternVersionFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentPatternVersionsOutput
        include JSON::Serializable

        # The deployment pattern versions.

        @[JSON::Field(key: "deploymentPatternVersions")]
        getter deployment_pattern_versions : Array(Types::DeploymentPatternVersionDataSummary)?

        # The token for the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_pattern_versions : Array(Types::DeploymentPatternVersionDataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsInput
        include JSON::Serializable

        # Filters to scope the results. The following filters are supported: WORKLOAD_NAME - The name used in
        # deployments. DEPLOYMENT_STATUS - COMPLETED | CREATING | DELETE_IN_PROGRESS | DELETE_INITIATING |
        # DELETE_FAILED | DELETED | FAILED | IN_PROGRESS | VALIDATING

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::DeploymentFilter)?

        # The maximum number of items to return for this request. To get the next page of items, make another
        # request with the token returned in the output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned from a previous paginated request. Pagination continues from the end of the items
        # returned by the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::DeploymentFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsOutput
        include JSON::Serializable

        # Lists the deployments.

        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::DeploymentDataSummary)?

        # The token to include in another request to get the next page of items. This value is null when there
        # are no more items to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::DeploymentDataSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # Information about the tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListWorkloadDeploymentPatternsInput
        include JSON::Serializable

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String

        # The maximum number of items to return for this request. To get the next page of items, make another
        # request with the token returned in the output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned from a previous paginated request. Pagination continues from the end of the items
        # returned by the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workload_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkloadDeploymentPatternsOutput
        include JSON::Serializable

        # The token to include in another request to get the next page of items. This value is null when there
        # are no more items to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Describes the workload deployment patterns.

        @[JSON::Field(key: "workloadDeploymentPatterns")]
        getter workload_deployment_patterns : Array(Types::WorkloadDeploymentPatternDataSummary)?

        def initialize(
          @next_token : String? = nil,
          @workload_deployment_patterns : Array(Types::WorkloadDeploymentPatternDataSummary)? = nil
        )
        end
      end


      struct ListWorkloadsInput
        include JSON::Serializable

        # The maximum number of items to return for this request. To get the next page of items, make another
        # request with the token returned in the output.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token returned from a previous paginated request. Pagination continues from the end of the items
        # returned by the previous request.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkloadsOutput
        include JSON::Serializable

        # The token to include in another request to get the next page of items. This value is null when there
        # are no more items to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about the workloads.

        @[JSON::Field(key: "workloads")]
        getter workloads : Array(Types::WorkloadDataSummary)?

        def initialize(
          @next_token : String? = nil,
          @workloads : Array(Types::WorkloadDataSummary)? = nil
        )
        end
      end

      # You have exceeded an Launch Wizard resource limit. For example, you might have too many deployments
      # in progress.

      struct ResourceLimitException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified workload or deployment resource can't be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tags to attach to the resource.

        @[JSON::Field(key: "tags")]
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


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Keys identifying the tags to remove.

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


      struct UpdateDeploymentInput
        include JSON::Serializable

        # The ID of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The settings specified for the deployment. These settings define how to deploy and configure your
        # resources created by the deployment. For more information about the specifications required for
        # creating a deployment for a SAP workload, see SAP deployment specifications . To retrieve the
        # specifications required to create a deployment for other workloads, use the
        # GetWorkloadDeploymentPattern operation.

        @[JSON::Field(key: "specifications")]
        getter specifications : Hash(String, String)

        # The name of the deployment pattern version.

        @[JSON::Field(key: "deploymentPatternVersionName")]
        getter deployment_pattern_version_name : String?

        # Checks whether you have the required permissions for the action, without actually making the
        # request, and provides an error response. If you have the required permissions, the error response is
        # DryRunOperation . Otherwise, it is UnauthorizedOperation .

        @[JSON::Field(key: "dryRun")]
        getter dry_run : Bool?

        # Forces the update even if validation warnings are present.

        @[JSON::Field(key: "force")]
        getter force : Bool?

        # The name of the workload version.

        @[JSON::Field(key: "workloadVersionName")]
        getter workload_version_name : String?

        def initialize(
          @deployment_id : String,
          @specifications : Hash(String, String),
          @deployment_pattern_version_name : String? = nil,
          @dry_run : Bool? = nil,
          @force : Bool? = nil,
          @workload_version_name : String? = nil
        )
        end
      end


      struct UpdateDeploymentOutput
        include JSON::Serializable

        # The deployment.

        @[JSON::Field(key: "deployment")]
        getter deployment : Types::DeploymentDataSummary?

        def initialize(
          @deployment : Types::DeploymentDataSummary? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a workload.

      struct WorkloadData
        include JSON::Serializable

        # The description of a workload.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of a workload.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The URL of a workload document.

        @[JSON::Field(key: "documentationUrl")]
        getter documentation_url : String?

        # The URL of a workload icon.

        @[JSON::Field(key: "iconUrl")]
        getter icon_url : String?

        # The status of a workload. You can list deployments in the DISABLED status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The message about a workload's status.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @documentation_url : String? = nil,
          @icon_url : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # Describes workload data.

      struct WorkloadDataSummary
        include JSON::Serializable

        # The display name of the workload data.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The status of the workload.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        def initialize(
          @display_name : String? = nil,
          @status : String? = nil,
          @workload_name : String? = nil
        )
        end
      end

      # The data that details a workload deployment pattern.

      struct WorkloadDeploymentPatternData
        include JSON::Serializable

        # The name of the deployment pattern.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String?

        # The version name of the deployment pattern.

        @[JSON::Field(key: "deploymentPatternVersionName")]
        getter deployment_pattern_version_name : String?

        # The description of the deployment pattern.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the deployment pattern.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The settings specified for the deployment. These settings define how to deploy and configure your
        # resources created by the deployment. For more information about the specifications required for
        # creating a deployment for a SAP workload, see SAP deployment specifications . To retrieve the
        # specifications required to create a deployment for other workloads, use the
        # GetWorkloadDeploymentPattern operation.

        @[JSON::Field(key: "specifications")]
        getter specifications : Array(Types::DeploymentSpecificationsField)?

        # The status of the deployment pattern.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the deployment pattern.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The workload name of the deployment pattern.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        # The workload version name of the deployment pattern.

        @[JSON::Field(key: "workloadVersionName")]
        getter workload_version_name : String?

        def initialize(
          @deployment_pattern_name : String? = nil,
          @deployment_pattern_version_name : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @specifications : Array(Types::DeploymentSpecificationsField)? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @workload_name : String? = nil,
          @workload_version_name : String? = nil
        )
        end
      end

      # Describes a workload deployment pattern.

      struct WorkloadDeploymentPatternDataSummary
        include JSON::Serializable

        # The name of a workload deployment pattern.

        @[JSON::Field(key: "deploymentPatternName")]
        getter deployment_pattern_name : String?

        # The version name of a workload deployment pattern.

        @[JSON::Field(key: "deploymentPatternVersionName")]
        getter deployment_pattern_version_name : String?

        # The description of a workload deployment pattern.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of a workload deployment pattern.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The status of a workload deployment pattern.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A message about a workload deployment pattern's status.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The name of the workload.

        @[JSON::Field(key: "workloadName")]
        getter workload_name : String?

        # The name of the workload deployment pattern version.

        @[JSON::Field(key: "workloadVersionName")]
        getter workload_version_name : String?

        def initialize(
          @deployment_pattern_name : String? = nil,
          @deployment_pattern_version_name : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @workload_name : String? = nil,
          @workload_version_name : String? = nil
        )
        end
      end
    end
  end
end
