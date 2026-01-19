require "json"
require "time"

module AwsSdk
  module TrustedAdvisor
    module Types

      # Exception that access has been denied due to insufficient access
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Summary of an AccountRecommendationLifecycle for an Organization Recommendation
      struct AccountRecommendationLifecycleSummary
        include JSON::Serializable

        # The AWS account ID
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Recommendation ARN
        @[JSON::Field(key: "accountRecommendationArn")]
        getter account_recommendation_arn : String?

        # When the Recommendation was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The lifecycle stage from AWS Trusted Advisor Priority
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # Reason for the lifecycle stage change
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String?

        # Reason code for the lifecycle state change
        @[JSON::Field(key: "updateReasonCode")]
        getter update_reason_code : String?

        # The person on whose behalf a Technical Account Manager (TAM) updated the recommendation. This
        # information is only available when a Technical Account Manager takes an action on a recommendation
        # managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOf")]
        getter updated_on_behalf_of : String?

        # The job title of the person on whose behalf a Technical Account Manager (TAM) updated the
        # recommendation. This information is only available when a Technical Account Manager takes an action
        # on a recommendation managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOfJobTitle")]
        getter updated_on_behalf_of_job_title : String?

        def initialize(
          @account_id : String? = nil,
          @account_recommendation_arn : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @update_reason : String? = nil,
          @update_reason_code : String? = nil,
          @updated_on_behalf_of : String? = nil,
          @updated_on_behalf_of_job_title : String? = nil
        )
        end
      end

      struct BatchUpdateRecommendationResourceExclusionRequest
        include JSON::Serializable

        # A list of recommendation resource ARNs and exclusion status to update
        @[JSON::Field(key: "recommendationResourceExclusions")]
        getter recommendation_resource_exclusions : Array(Types::RecommendationResourceExclusion)

        def initialize(
          @recommendation_resource_exclusions : Array(Types::RecommendationResourceExclusion)
        )
        end
      end

      struct BatchUpdateRecommendationResourceExclusionResponse
        include JSON::Serializable

        # A list of recommendation resource ARNs whose exclusion status failed to update, if any
        @[JSON::Field(key: "batchUpdateRecommendationResourceExclusionErrors")]
        getter batch_update_recommendation_resource_exclusion_errors : Array(Types::UpdateRecommendationResourceExclusionError)

        def initialize(
          @batch_update_recommendation_resource_exclusion_errors : Array(Types::UpdateRecommendationResourceExclusionError)
        )
        end
      end

      # A summary of an AWS Trusted Advisor Check
      struct CheckSummary
        include JSON::Serializable

        # The ARN of the AWS Trusted Advisor Check
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The AWS Services that the Check applies to
        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(String)

        # A description of what the AWS Trusted Advisor Check is monitoring
        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier of the AWS Trusted Advisor Check
        @[JSON::Field(key: "id")]
        getter id : String

        # The column headings for the metadata returned in the resource
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The name of the AWS Trusted Advisor Check
        @[JSON::Field(key: "name")]
        getter name : String

        # The Recommendation pillars that the AWS Trusted Advisor Check falls under
        @[JSON::Field(key: "pillars")]
        getter pillars : Array(String)

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @arn : String,
          @aws_services : Array(String),
          @description : String,
          @id : String,
          @metadata : Hash(String, String),
          @name : String,
          @pillars : Array(String),
          @source : String
        )
        end
      end

      # Exception that the request was denied due to conflictions in state
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct GetOrganizationRecommendationRequest
        include JSON::Serializable

        # The Recommendation identifier
        @[JSON::Field(key: "organizationRecommendationIdentifier")]
        getter organization_recommendation_identifier : String

        def initialize(
          @organization_recommendation_identifier : String
        )
        end
      end

      struct GetOrganizationRecommendationResponse
        include JSON::Serializable

        # The Recommendation
        @[JSON::Field(key: "organizationRecommendation")]
        getter organization_recommendation : Types::OrganizationRecommendation?

        def initialize(
          @organization_recommendation : Types::OrganizationRecommendation? = nil
        )
        end
      end

      struct GetRecommendationRequest
        include JSON::Serializable

        # The Recommendation identifier
        @[JSON::Field(key: "recommendationIdentifier")]
        getter recommendation_identifier : String

        def initialize(
          @recommendation_identifier : String
        )
        end
      end

      struct GetRecommendationResponse
        include JSON::Serializable

        # The Recommendation
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::Recommendation?

        def initialize(
          @recommendation : Types::Recommendation? = nil
        )
        end
      end

      # Exception to notify that an unexpected internal error occurred during processing of the request
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListChecksRequest
        include JSON::Serializable

        # The aws service associated with the check
        @[JSON::Field(key: "awsService")]
        getter aws_service : String?

        # The ISO 639-1 code for the language that you want your checks to appear in.
        @[JSON::Field(key: "language")]
        getter language : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The pillar of the check
        @[JSON::Field(key: "pillar")]
        getter pillar : String?

        # The source of the check
        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @aws_service : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pillar : String? = nil,
          @source : String? = nil
        )
        end
      end

      struct ListChecksResponse
        include JSON::Serializable

        # The list of Checks
        @[JSON::Field(key: "checkSummaries")]
        getter check_summaries : Array(Types::CheckSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @check_summaries : Array(Types::CheckSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationAccountsRequest
        include JSON::Serializable

        # The Recommendation identifier
        @[JSON::Field(key: "organizationRecommendationIdentifier")]
        getter organization_recommendation_identifier : String

        # An account affected by this organization recommendation
        @[JSON::Field(key: "affectedAccountId")]
        getter affected_account_id : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @organization_recommendation_identifier : String,
          @affected_account_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationAccountsResponse
        include JSON::Serializable

        # The account recommendations lifecycles that are applicable to the Recommendation
        @[JSON::Field(key: "accountRecommendationLifecycleSummaries")]
        getter account_recommendation_lifecycle_summaries : Array(Types::AccountRecommendationLifecycleSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_recommendation_lifecycle_summaries : Array(Types::AccountRecommendationLifecycleSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationResourcesRequest
        include JSON::Serializable

        # The AWS Organization organization's Recommendation identifier
        @[JSON::Field(key: "organizationRecommendationIdentifier")]
        getter organization_recommendation_identifier : String

        # An account affected by this organization recommendation
        @[JSON::Field(key: "affectedAccountId")]
        getter affected_account_id : String?

        # The exclusion status of the resource
        @[JSON::Field(key: "exclusionStatus")]
        getter exclusion_status : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The AWS Region code of the resource
        @[JSON::Field(key: "regionCode")]
        getter region_code : String?

        # The status of the resource
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @organization_recommendation_identifier : String,
          @affected_account_id : String? = nil,
          @exclusion_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @region_code : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationResourcesResponse
        include JSON::Serializable

        # A list of Recommendation Resources
        @[JSON::Field(key: "organizationRecommendationResourceSummaries")]
        getter organization_recommendation_resource_summaries : Array(Types::OrganizationRecommendationResourceSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @organization_recommendation_resource_summaries : Array(Types::OrganizationRecommendationResourceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationsRequest
        include JSON::Serializable

        # After the last update of the Recommendation
        @[JSON::Field(key: "afterLastUpdatedAt")]
        getter after_last_updated_at : Time?

        # The aws service associated with the Recommendation
        @[JSON::Field(key: "awsService")]
        getter aws_service : String?

        # Before the last update of the Recommendation
        @[JSON::Field(key: "beforeLastUpdatedAt")]
        getter before_last_updated_at : Time?

        # The check identifier of the Recommendation
        @[JSON::Field(key: "checkIdentifier")]
        getter check_identifier : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The pillar of the Recommendation
        @[JSON::Field(key: "pillar")]
        getter pillar : String?

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String?

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the Recommendation
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @after_last_updated_at : Time? = nil,
          @aws_service : String? = nil,
          @before_last_updated_at : Time? = nil,
          @check_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pillar : String? = nil,
          @source : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListOrganizationRecommendationsResponse
        include JSON::Serializable

        # The list of Recommendations
        @[JSON::Field(key: "organizationRecommendationSummaries")]
        getter organization_recommendation_summaries : Array(Types::OrganizationRecommendationSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @organization_recommendation_summaries : Array(Types::OrganizationRecommendationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecommendationResourcesRequest
        include JSON::Serializable

        # The Recommendation identifier
        @[JSON::Field(key: "recommendationIdentifier")]
        getter recommendation_identifier : String

        # The exclusion status of the resource
        @[JSON::Field(key: "exclusionStatus")]
        getter exclusion_status : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The AWS Region code of the resource
        @[JSON::Field(key: "regionCode")]
        getter region_code : String?

        # The status of the resource
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @recommendation_identifier : String,
          @exclusion_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @region_code : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListRecommendationResourcesResponse
        include JSON::Serializable

        # A list of Recommendation Resources
        @[JSON::Field(key: "recommendationResourceSummaries")]
        getter recommendation_resource_summaries : Array(Types::RecommendationResourceSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recommendation_resource_summaries : Array(Types::RecommendationResourceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListRecommendationsRequest
        include JSON::Serializable

        # After the last update of the Recommendation
        @[JSON::Field(key: "afterLastUpdatedAt")]
        getter after_last_updated_at : Time?

        # The aws service associated with the Recommendation
        @[JSON::Field(key: "awsService")]
        getter aws_service : String?

        # Before the last update of the Recommendation
        @[JSON::Field(key: "beforeLastUpdatedAt")]
        getter before_last_updated_at : Time?

        # The check identifier of the Recommendation
        @[JSON::Field(key: "checkIdentifier")]
        getter check_identifier : String?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The pillar of the Recommendation
        @[JSON::Field(key: "pillar")]
        getter pillar : String?

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String?

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the Recommendation
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @after_last_updated_at : Time? = nil,
          @aws_service : String? = nil,
          @before_last_updated_at : Time? = nil,
          @check_identifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pillar : String? = nil,
          @source : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListRecommendationsResponse
        include JSON::Serializable

        # The list of Recommendations
        @[JSON::Field(key: "recommendationSummaries")]
        getter recommendation_summaries : Array(Types::RecommendationSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recommendation_summaries : Array(Types::RecommendationSummary),
          @next_token : String? = nil
        )
        end
      end

      # A Recommendation for accounts within an Organization
      struct OrganizationRecommendation
        include JSON::Serializable

        # The ARN of the Recommendation
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A description for AWS Trusted Advisor recommendations
        @[JSON::Field(key: "description")]
        getter description : String

        # The ID which identifies where the Recommendation was produced
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the AWS Trusted Advisor Recommendation
        @[JSON::Field(key: "name")]
        getter name : String

        # The Pillars that the Recommendation is optimizing
        @[JSON::Field(key: "pillars")]
        getter pillars : Array(String)

        # An aggregation of all resources
        @[JSON::Field(key: "resourcesAggregates")]
        getter resources_aggregates : Types::RecommendationResourcesAggregates

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the Recommendation was automated or generated by AWS Trusted Advisor Priority
        @[JSON::Field(key: "type")]
        getter type : String

        # The AWS Services that the Recommendation applies to
        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(String)?

        # The AWS Trusted Advisor Check ARN that relates to the Recommendation
        @[JSON::Field(key: "checkArn")]
        getter check_arn : String?

        # When the Recommendation was created, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The creator, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # When the Recommendation was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The lifecycle stage from AWS Trusted Advisor Priority
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # The pillar aggregations for cost savings
        @[JSON::Field(key: "pillarSpecificAggregates")]
        getter pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates?

        # When the Recommendation was resolved
        @[JSON::Field(key: "resolvedAt")]
        getter resolved_at : Time?

        # Reason for the lifecycle stage change
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String?

        # Reason code for the lifecycle state change
        @[JSON::Field(key: "updateReasonCode")]
        getter update_reason_code : String?

        # The person on whose behalf a Technical Account Manager (TAM) updated the recommendation. This
        # information is only available when a Technical Account Manager takes an action on a recommendation
        # managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOf")]
        getter updated_on_behalf_of : String?

        # The job title of the person on whose behalf a Technical Account Manager (TAM) updated the
        # recommendation. This information is only available when a Technical Account Manager takes an action
        # on a recommendation managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOfJobTitle")]
        getter updated_on_behalf_of_job_title : String?

        def initialize(
          @arn : String,
          @description : String,
          @id : String,
          @name : String,
          @pillars : Array(String),
          @resources_aggregates : Types::RecommendationResourcesAggregates,
          @source : String,
          @status : String,
          @type : String,
          @aws_services : Array(String)? = nil,
          @check_arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates? = nil,
          @resolved_at : Time? = nil,
          @update_reason : String? = nil,
          @update_reason_code : String? = nil,
          @updated_on_behalf_of : String? = nil,
          @updated_on_behalf_of_job_title : String? = nil
        )
        end
      end

      # Organization Recommendation Resource Summary
      struct OrganizationRecommendationResourceSummary
        include JSON::Serializable

        # The ARN of the Recommendation Resource
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The AWS resource identifier
        @[JSON::Field(key: "awsResourceId")]
        getter aws_resource_id : String

        # The ID of the Recommendation Resource
        @[JSON::Field(key: "id")]
        getter id : String

        # When the Recommendation Resource was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # Metadata associated with the Recommendation Resource
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The Recommendation ARN
        @[JSON::Field(key: "recommendationArn")]
        getter recommendation_arn : String

        # The AWS Region code that the Recommendation Resource is in
        @[JSON::Field(key: "regionCode")]
        getter region_code : String

        # The current status of the Recommendation Resource
        @[JSON::Field(key: "status")]
        getter status : String

        # The AWS account ID
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The exclusion status of the Recommendation Resource
        @[JSON::Field(key: "exclusionStatus")]
        getter exclusion_status : String?

        def initialize(
          @arn : String,
          @aws_resource_id : String,
          @id : String,
          @last_updated_at : Time,
          @metadata : Hash(String, String),
          @recommendation_arn : String,
          @region_code : String,
          @status : String,
          @account_id : String? = nil,
          @exclusion_status : String? = nil
        )
        end
      end

      # Summary of recommendation for accounts within an Organization
      struct OrganizationRecommendationSummary
        include JSON::Serializable

        # The ARN of the Recommendation
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID which identifies where the Recommendation was produced
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the AWS Trusted Advisor Recommendation
        @[JSON::Field(key: "name")]
        getter name : String

        # The Pillars that the Recommendation is optimizing
        @[JSON::Field(key: "pillars")]
        getter pillars : Array(String)

        # An aggregation of all resources
        @[JSON::Field(key: "resourcesAggregates")]
        getter resources_aggregates : Types::RecommendationResourcesAggregates

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the Recommendation was automated or generated by AWS Trusted Advisor Priority
        @[JSON::Field(key: "type")]
        getter type : String

        # The AWS Services that the Recommendation applies to
        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(String)?

        # The AWS Trusted Advisor Check ARN that relates to the Recommendation
        @[JSON::Field(key: "checkArn")]
        getter check_arn : String?

        # When the Recommendation was created, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # When the Recommendation was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The lifecycle stage from AWS Trusted Advisor Priority
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # The pillar aggregations for cost savings
        @[JSON::Field(key: "pillarSpecificAggregates")]
        getter pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @pillars : Array(String),
          @resources_aggregates : Types::RecommendationResourcesAggregates,
          @source : String,
          @status : String,
          @type : String,
          @aws_services : Array(String)? = nil,
          @check_arn : String? = nil,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates? = nil
        )
        end
      end

      # A Recommendation for an Account
      struct Recommendation
        include JSON::Serializable

        # The ARN of the Recommendation
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A description for AWS Trusted Advisor recommendations
        @[JSON::Field(key: "description")]
        getter description : String

        # The ID which identifies where the Recommendation was produced
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the AWS Trusted Advisor Recommendation
        @[JSON::Field(key: "name")]
        getter name : String

        # The Pillars that the Recommendation is optimizing
        @[JSON::Field(key: "pillars")]
        getter pillars : Array(String)

        # An aggregation of all resources
        @[JSON::Field(key: "resourcesAggregates")]
        getter resources_aggregates : Types::RecommendationResourcesAggregates

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the Recommendation was automated or generated by AWS Trusted Advisor Priority
        @[JSON::Field(key: "type")]
        getter type : String

        # The AWS Services that the Recommendation applies to
        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(String)?

        # The AWS Trusted Advisor Check ARN that relates to the Recommendation
        @[JSON::Field(key: "checkArn")]
        getter check_arn : String?

        # When the Recommendation was created, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The creator, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # When the Recommendation was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The lifecycle stage from AWS Trusted Advisor Priority
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # The pillar aggregations for cost savings
        @[JSON::Field(key: "pillarSpecificAggregates")]
        getter pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates?

        # When the Recommendation was resolved
        @[JSON::Field(key: "resolvedAt")]
        getter resolved_at : Time?

        # Reason for the lifecycle stage change
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String?

        # Reason code for the lifecycle state change
        @[JSON::Field(key: "updateReasonCode")]
        getter update_reason_code : String?

        # The person on whose behalf a Technical Account Manager (TAM) updated the recommendation. This
        # information is only available when a Technical Account Manager takes an action on a recommendation
        # managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOf")]
        getter updated_on_behalf_of : String?

        # The job title of the person on whose behalf a Technical Account Manager (TAM) updated the
        # recommendation. This information is only available when a Technical Account Manager takes an action
        # on a recommendation managed by AWS Trusted Advisor Priority
        @[JSON::Field(key: "updatedOnBehalfOfJobTitle")]
        getter updated_on_behalf_of_job_title : String?

        def initialize(
          @arn : String,
          @description : String,
          @id : String,
          @name : String,
          @pillars : Array(String),
          @resources_aggregates : Types::RecommendationResourcesAggregates,
          @source : String,
          @status : String,
          @type : String,
          @aws_services : Array(String)? = nil,
          @check_arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates? = nil,
          @resolved_at : Time? = nil,
          @update_reason : String? = nil,
          @update_reason_code : String? = nil,
          @updated_on_behalf_of : String? = nil,
          @updated_on_behalf_of_job_title : String? = nil
        )
        end
      end

      # Cost optimizing aggregates for a Recommendation
      struct RecommendationCostOptimizingAggregates
        include JSON::Serializable

        # The estimated monthly savings
        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Float64

        # The estimated percently monthly savings
        @[JSON::Field(key: "estimatedPercentMonthlySavings")]
        getter estimated_percent_monthly_savings : Float64

        def initialize(
          @estimated_monthly_savings : Float64,
          @estimated_percent_monthly_savings : Float64
        )
        end
      end

      # Recommendation pillar aggregates
      struct RecommendationPillarSpecificAggregates
        include JSON::Serializable

        # Cost optimizing aggregates
        @[JSON::Field(key: "costOptimizing")]
        getter cost_optimizing : Types::RecommendationCostOptimizingAggregates?

        def initialize(
          @cost_optimizing : Types::RecommendationCostOptimizingAggregates? = nil
        )
        end
      end

      # The request entry for Recommendation Resource exclusion. Each entry is a combination of
      # Recommendation Resource ARN and corresponding exclusion status
      struct RecommendationResourceExclusion
        include JSON::Serializable

        # The ARN of the Recommendation Resource
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The exclusion status
        @[JSON::Field(key: "isExcluded")]
        getter is_excluded : Bool

        def initialize(
          @arn : String,
          @is_excluded : Bool
        )
        end
      end

      # Summary of a Recommendation Resource
      struct RecommendationResourceSummary
        include JSON::Serializable

        # The ARN of the Recommendation Resource
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The AWS resource identifier
        @[JSON::Field(key: "awsResourceId")]
        getter aws_resource_id : String

        # The ID of the Recommendation Resource
        @[JSON::Field(key: "id")]
        getter id : String

        # When the Recommendation Resource was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # Metadata associated with the Recommendation Resource
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The Recommendation ARN
        @[JSON::Field(key: "recommendationArn")]
        getter recommendation_arn : String

        # The AWS Region code that the Recommendation Resource is in
        @[JSON::Field(key: "regionCode")]
        getter region_code : String

        # The current status of the Recommendation Resource
        @[JSON::Field(key: "status")]
        getter status : String

        # The exclusion status of the Recommendation Resource
        @[JSON::Field(key: "exclusionStatus")]
        getter exclusion_status : String?

        def initialize(
          @arn : String,
          @aws_resource_id : String,
          @id : String,
          @last_updated_at : Time,
          @metadata : Hash(String, String),
          @recommendation_arn : String,
          @region_code : String,
          @status : String,
          @exclusion_status : String? = nil
        )
        end
      end

      # Aggregation of Recommendation Resources
      struct RecommendationResourcesAggregates
        include JSON::Serializable

        # The number of AWS resources that were flagged to have errors according to the Trusted Advisor check
        @[JSON::Field(key: "errorCount")]
        getter error_count : Int64

        # The number of AWS resources that were flagged to be OK according to the Trusted Advisor check
        @[JSON::Field(key: "okCount")]
        getter ok_count : Int64

        # The number of AWS resources that were flagged to have warning according to the Trusted Advisor check
        @[JSON::Field(key: "warningCount")]
        getter warning_count : Int64

        def initialize(
          @error_count : Int64,
          @ok_count : Int64,
          @warning_count : Int64
        )
        end
      end

      # Summary of Recommendation for an Account
      struct RecommendationSummary
        include JSON::Serializable

        # The ARN of the Recommendation
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID which identifies where the Recommendation was produced
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the AWS Trusted Advisor Recommendation
        @[JSON::Field(key: "name")]
        getter name : String

        # The Pillars that the Recommendation is optimizing
        @[JSON::Field(key: "pillars")]
        getter pillars : Array(String)

        # An aggregation of all resources
        @[JSON::Field(key: "resourcesAggregates")]
        getter resources_aggregates : Types::RecommendationResourcesAggregates

        # The source of the Recommendation
        @[JSON::Field(key: "source")]
        getter source : String

        # The status of the Recommendation
        @[JSON::Field(key: "status")]
        getter status : String

        # Whether the Recommendation was automated or generated by AWS Trusted Advisor Priority
        @[JSON::Field(key: "type")]
        getter type : String

        # The AWS Services that the Recommendation applies to
        @[JSON::Field(key: "awsServices")]
        getter aws_services : Array(String)?

        # The AWS Trusted Advisor Check ARN that relates to the Recommendation
        @[JSON::Field(key: "checkArn")]
        getter check_arn : String?

        # When the Recommendation was created, if created by AWS Trusted Advisor Priority
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # When the Recommendation was last updated
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The lifecycle stage from AWS Trusted Advisor Priority
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # The pillar aggregations for cost savings
        @[JSON::Field(key: "pillarSpecificAggregates")]
        getter pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @pillars : Array(String),
          @resources_aggregates : Types::RecommendationResourcesAggregates,
          @source : String,
          @status : String,
          @type : String,
          @aws_services : Array(String)? = nil,
          @check_arn : String? = nil,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @pillar_specific_aggregates : Types::RecommendationPillarSpecificAggregates? = nil
        )
        end
      end

      # Exception that the requested resource has not been found
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Exception to notify that requests are being throttled
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UpdateOrganizationRecommendationLifecycleRequest
        include JSON::Serializable

        # The new lifecycle stage
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String

        # The Recommendation identifier for AWS Trusted Advisor Priority recommendations
        @[JSON::Field(key: "organizationRecommendationIdentifier")]
        getter organization_recommendation_identifier : String

        # Reason for the lifecycle stage change
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String?

        # Reason code for the lifecycle state change
        @[JSON::Field(key: "updateReasonCode")]
        getter update_reason_code : String?

        def initialize(
          @lifecycle_stage : String,
          @organization_recommendation_identifier : String,
          @update_reason : String? = nil,
          @update_reason_code : String? = nil
        )
        end
      end

      struct UpdateRecommendationLifecycleRequest
        include JSON::Serializable

        # The new lifecycle stage
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String

        # The Recommendation identifier for AWS Trusted Advisor Priority recommendations
        @[JSON::Field(key: "recommendationIdentifier")]
        getter recommendation_identifier : String

        # Reason for the lifecycle stage change
        @[JSON::Field(key: "updateReason")]
        getter update_reason : String?

        # Reason code for the lifecycle state change
        @[JSON::Field(key: "updateReasonCode")]
        getter update_reason_code : String?

        def initialize(
          @lifecycle_stage : String,
          @recommendation_identifier : String,
          @update_reason : String? = nil,
          @update_reason_code : String? = nil
        )
        end
      end

      # The error entry for Recommendation Resource exclusion. Each entry is a combination of Recommendation
      # Resource ARN, error code and error message
      struct UpdateRecommendationResourceExclusionError
        include JSON::Serializable

        # The ARN of the Recommendation Resource
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The error code
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @arn : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Exception that the request failed to satisfy service constraints
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
