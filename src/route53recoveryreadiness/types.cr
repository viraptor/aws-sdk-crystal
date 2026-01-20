require "json"
require "time"

module Aws
  module Route53RecoveryReadiness
    module Types


      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a cell.

      struct CellOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the cell.

        @[JSON::Field(key: "cellArn")]
        getter cell_arn : String

        # The name of the cell.

        @[JSON::Field(key: "cellName")]
        getter cell_name : String

        # A list of cell ARNs.

        @[JSON::Field(key: "cells")]
        getter cells : Array(String)

        # The readiness scope for the cell, which can be a cell Amazon Resource Name (ARN) or a recovery group
        # ARN. This is a list but currently can have only one element.

        @[JSON::Field(key: "parentReadinessScopes")]
        getter parent_readiness_scopes : Array(String)

        # Tags on the resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cell_arn : String,
          @cell_name : String,
          @cells : Array(String),
          @parent_readiness_scopes : Array(String),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateCellRequest
        include JSON::Serializable


        @[JSON::Field(key: "cellName")]
        getter cell_name : String


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cell_name : String,
          @cells : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCellResponse
        include JSON::Serializable


        @[JSON::Field(key: "cellArn")]
        getter cell_arn : String?


        @[JSON::Field(key: "cellName")]
        getter cell_name : String?


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "parentReadinessScopes")]
        getter parent_readiness_scopes : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cell_arn : String? = nil,
          @cell_name : String? = nil,
          @cells : Array(String)? = nil,
          @parent_readiness_scopes : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCrossAccountAuthorizationRequest
        include JSON::Serializable


        @[JSON::Field(key: "crossAccountAuthorization")]
        getter cross_account_authorization : String

        def initialize(
          @cross_account_authorization : String
        )
        end
      end


      struct CreateCrossAccountAuthorizationResponse
        include JSON::Serializable


        @[JSON::Field(key: "crossAccountAuthorization")]
        getter cross_account_authorization : String?

        def initialize(
          @cross_account_authorization : String? = nil
        )
        end
      end


      struct CreateReadinessCheckRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @readiness_check_name : String,
          @resource_set_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateReadinessCheckResponse
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckArn")]
        getter readiness_check_arn : String?


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String?


        @[JSON::Field(key: "resourceSet")]
        getter resource_set : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @readiness_check_arn : String? = nil,
          @readiness_check_name : String? = nil,
          @resource_set : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRecoveryGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @recovery_group_name : String,
          @cells : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRecoveryGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "recoveryGroupArn")]
        getter recovery_group_arn : String?


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cells : Array(String)? = nil,
          @recovery_group_arn : String? = nil,
          @recovery_group_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateResourceSetRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String


        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_set_name : String,
          @resource_set_type : String,
          @resources : Array(Types::Resource),
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateResourceSetResponse
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetArn")]
        getter resource_set_arn : String?


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String?


        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String?


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_set_arn : String? = nil,
          @resource_set_name : String? = nil,
          @resource_set_type : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A component for DNS/routing control readiness checks and architecture checks.

      struct DNSTargetResource
        include JSON::Serializable

        # The domain name that acts as an ingress point to a portion of the customer application.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The hosted zone Amazon Resource Name (ARN) that contains the DNS record with the provided name of
        # the target resource.

        @[JSON::Field(key: "hostedZoneArn")]
        getter hosted_zone_arn : String?

        # The Route 53 record set ID that uniquely identifies a DNS record, given a name and a type.

        @[JSON::Field(key: "recordSetId")]
        getter record_set_id : String?

        # The type of DNS record of the target resource.

        @[JSON::Field(key: "recordType")]
        getter record_type : String?

        # The target resource of the DNS target resource.

        @[JSON::Field(key: "targetResource")]
        getter target_resource : Types::TargetResource?

        def initialize(
          @domain_name : String? = nil,
          @hosted_zone_arn : String? = nil,
          @record_set_id : String? = nil,
          @record_type : String? = nil,
          @target_resource : Types::TargetResource? = nil
        )
        end
      end


      struct DeleteCellRequest
        include JSON::Serializable


        @[JSON::Field(key: "cellName")]
        getter cell_name : String

        def initialize(
          @cell_name : String
        )
        end
      end


      struct DeleteCrossAccountAuthorizationRequest
        include JSON::Serializable


        @[JSON::Field(key: "crossAccountAuthorization")]
        getter cross_account_authorization : String

        def initialize(
          @cross_account_authorization : String
        )
        end
      end


      struct DeleteCrossAccountAuthorizationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteReadinessCheckRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String

        def initialize(
          @readiness_check_name : String
        )
        end
      end


      struct DeleteRecoveryGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String

        def initialize(
          @recovery_group_name : String
        )
        end
      end


      struct DeleteResourceSetRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String

        def initialize(
          @resource_set_name : String
        )
        end
      end


      struct GetArchitectureRecommendationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recovery_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetArchitectureRecommendationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "lastAuditTimestamp")]
        getter last_audit_timestamp : Time?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "recommendations")]
        getter recommendations : Array(Types::Recommendation)?

        def initialize(
          @last_audit_timestamp : Time? = nil,
          @next_token : String? = nil,
          @recommendations : Array(Types::Recommendation)? = nil
        )
        end
      end


      struct GetCellReadinessSummaryRequest
        include JSON::Serializable


        @[JSON::Field(key: "cellName")]
        getter cell_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cell_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetCellReadinessSummaryResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "readiness")]
        getter readiness : String?


        @[JSON::Field(key: "readinessChecks")]
        getter readiness_checks : Array(Types::ReadinessCheckSummary)?

        def initialize(
          @next_token : String? = nil,
          @readiness : String? = nil,
          @readiness_checks : Array(Types::ReadinessCheckSummary)? = nil
        )
        end
      end


      struct GetCellRequest
        include JSON::Serializable


        @[JSON::Field(key: "cellName")]
        getter cell_name : String

        def initialize(
          @cell_name : String
        )
        end
      end


      struct GetCellResponse
        include JSON::Serializable


        @[JSON::Field(key: "cellArn")]
        getter cell_arn : String?


        @[JSON::Field(key: "cellName")]
        getter cell_name : String?


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "parentReadinessScopes")]
        getter parent_readiness_scopes : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cell_arn : String? = nil,
          @cell_name : String? = nil,
          @cells : Array(String)? = nil,
          @parent_readiness_scopes : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetReadinessCheckRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String

        def initialize(
          @readiness_check_name : String
        )
        end
      end


      struct GetReadinessCheckResourceStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String


        @[JSON::Field(key: "resourceIdentifier")]
        getter resource_identifier : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @readiness_check_name : String,
          @resource_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetReadinessCheckResourceStatusResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "readiness")]
        getter readiness : String?


        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RuleResult)?

        def initialize(
          @next_token : String? = nil,
          @readiness : String? = nil,
          @rules : Array(Types::RuleResult)? = nil
        )
        end
      end


      struct GetReadinessCheckResponse
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckArn")]
        getter readiness_check_arn : String?


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String?


        @[JSON::Field(key: "resourceSet")]
        getter resource_set : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @readiness_check_arn : String? = nil,
          @readiness_check_name : String? = nil,
          @resource_set : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetReadinessCheckStatusRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @readiness_check_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetReadinessCheckStatusResponse
        include JSON::Serializable


        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "readiness")]
        getter readiness : String?


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::ResourceResult)?

        def initialize(
          @messages : Array(Types::Message)? = nil,
          @next_token : String? = nil,
          @readiness : String? = nil,
          @resources : Array(Types::ResourceResult)? = nil
        )
        end
      end


      struct GetRecoveryGroupReadinessSummaryRequest
        include JSON::Serializable


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @recovery_group_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetRecoveryGroupReadinessSummaryResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "readiness")]
        getter readiness : String?


        @[JSON::Field(key: "readinessChecks")]
        getter readiness_checks : Array(Types::ReadinessCheckSummary)?

        def initialize(
          @next_token : String? = nil,
          @readiness : String? = nil,
          @readiness_checks : Array(Types::ReadinessCheckSummary)? = nil
        )
        end
      end


      struct GetRecoveryGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String

        def initialize(
          @recovery_group_name : String
        )
        end
      end


      struct GetRecoveryGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "recoveryGroupArn")]
        getter recovery_group_arn : String?


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cells : Array(String)? = nil,
          @recovery_group_arn : String? = nil,
          @recovery_group_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetResourceSetRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String

        def initialize(
          @resource_set_name : String
        )
        end
      end


      struct GetResourceSetResponse
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetArn")]
        getter resource_set_arn : String?


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String?


        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String?


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_set_arn : String? = nil,
          @resource_set_name : String? = nil,
          @resource_set_type : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListCellsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCellsResponse
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(Types::CellOutput)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cells : Array(Types::CellOutput)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountAuthorizationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountAuthorizationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "crossAccountAuthorizations")]
        getter cross_account_authorizations : Array(String)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cross_account_authorizations : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReadinessChecksRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReadinessChecksResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "readinessChecks")]
        getter readiness_checks : Array(Types::ReadinessCheckOutput)?

        def initialize(
          @next_token : String? = nil,
          @readiness_checks : Array(Types::ReadinessCheckOutput)? = nil
        )
        end
      end


      struct ListRecoveryGroupsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecoveryGroupsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "recoveryGroups")]
        getter recovery_groups : Array(Types::RecoveryGroupOutput)?

        def initialize(
          @next_token : String? = nil,
          @recovery_groups : Array(Types::RecoveryGroupOutput)? = nil
        )
        end
      end


      struct ListResourceSetsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResourceSetsResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resourceSets")]
        getter resource_sets : Array(Types::ResourceSetOutput)?

        def initialize(
          @next_token : String? = nil,
          @resource_sets : Array(Types::ResourceSetOutput)? = nil
        )
        end
      end

      # Readiness rule information, including the resource type, rule ID, and rule description.

      struct ListRulesOutput
        include JSON::Serializable

        # The resource type that the readiness rule applies to.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The description of a readiness rule.

        @[JSON::Field(key: "ruleDescription")]
        getter rule_description : String

        # The ID for the readiness rule.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        def initialize(
          @resource_type : String,
          @rule_description : String,
          @rule_id : String
        )
        end
      end


      struct ListRulesRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct ListRulesResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::ListRulesOutput)?

        def initialize(
          @next_token : String? = nil,
          @rules : Array(Types::ListRulesOutput)? = nil
        )
        end
      end


      struct ListTagsForResourcesRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourcesResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information relating to readiness check status.

      struct Message
        include JSON::Serializable

        # The text of a readiness check message.

        @[JSON::Field(key: "messageText")]
        getter message_text : String?

        def initialize(
          @message_text : String? = nil
        )
        end
      end

      # The Network Load Balancer resource that a DNS target resource points to.

      struct NLBResource
        include JSON::Serializable

        # The Network Load Balancer resource Amazon Resource Name (ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The Route 53 resource that a DNS target resource record points to.

      struct R53ResourceRecord
        include JSON::Serializable

        # The DNS target domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The Route 53 Resource Record Set ID.

        @[JSON::Field(key: "recordSetId")]
        getter record_set_id : String?

        def initialize(
          @domain_name : String? = nil,
          @record_set_id : String? = nil
        )
        end
      end

      # A readiness check.

      struct ReadinessCheckOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with a readiness check.

        @[JSON::Field(key: "readinessCheckArn")]
        getter readiness_check_arn : String

        # Name of the resource set to be checked.

        @[JSON::Field(key: "resourceSet")]
        getter resource_set : String

        # Name of a readiness check.

        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @readiness_check_arn : String,
          @resource_set : String,
          @readiness_check_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary of all readiness check statuses in a recovery group, paginated in
      # GetRecoveryGroupReadinessSummary and GetCellReadinessSummary.

      struct ReadinessCheckSummary
        include JSON::Serializable

        # The readiness status of this readiness check.

        @[JSON::Field(key: "readiness")]
        getter readiness : String?

        # The name of a readiness check.

        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String?

        def initialize(
          @readiness : String? = nil,
          @readiness_check_name : String? = nil
        )
        end
      end

      # Recommendations that are provided to make an application more recovery resilient.

      struct Recommendation
        include JSON::Serializable

        # Text of the recommendations that are provided to make an application more recovery resilient.

        @[JSON::Field(key: "recommendationText")]
        getter recommendation_text : String

        def initialize(
          @recommendation_text : String
        )
        end
      end

      # A representation of the application, typically containing multiple cells.

      struct RecoveryGroupOutput
        include JSON::Serializable

        # A list of a cell's Amazon Resource Names (ARNs).

        @[JSON::Field(key: "cells")]
        getter cells : Array(String)

        # The Amazon Resource Name (ARN) for the recovery group.

        @[JSON::Field(key: "recoveryGroupArn")]
        getter recovery_group_arn : String

        # The name of the recovery group.

        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String

        # The tags associated with the recovery group.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cells : Array(String),
          @recovery_group_arn : String,
          @recovery_group_name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The resource element of a resource set.

      struct Resource
        include JSON::Serializable

        # The component identifier of the resource, generated when DNS target resource is used.

        @[JSON::Field(key: "componentId")]
        getter component_id : String?

        # The DNS target resource.

        @[JSON::Field(key: "dnsTargetResource")]
        getter dns_target_resource : Types::DNSTargetResource?

        # A list of recovery group Amazon Resource Names (ARNs) and cell ARNs that this resource is contained
        # within.

        @[JSON::Field(key: "readinessScopes")]
        getter readiness_scopes : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon Web Services resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @component_id : String? = nil,
          @dns_target_resource : Types::DNSTargetResource? = nil,
          @readiness_scopes : Array(String)? = nil,
          @resource_arn : String? = nil
        )
        end
      end


      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The result of a successful Resource request, with status for an individual resource.

      struct ResourceResult
        include JSON::Serializable

        # The time (UTC) that the resource was last checked for readiness, in ISO-8601 format.

        @[JSON::Field(key: "lastCheckedTimestamp")]
        getter last_checked_timestamp : Time

        # The readiness of a resource.

        @[JSON::Field(key: "readiness")]
        getter readiness : String

        # The component id of the resource.

        @[JSON::Field(key: "componentId")]
        getter component_id : String?

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @last_checked_timestamp : Time,
          @readiness : String,
          @component_id : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # A collection of resources of the same type.

      struct ResourceSetOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource set.

        @[JSON::Field(key: "resourceSetArn")]
        getter resource_set_arn : String

        # The name of the resource set.

        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String

        # The resource type of the resources in the resource set. Enter one of the following values for
        # resource type: AWS::ApiGateway::Stage, AWS::ApiGatewayV2::Stage, AWS::AutoScaling::AutoScalingGroup,
        # AWS::CloudWatch::Alarm, AWS::EC2::CustomerGateway, AWS::DynamoDB::Table, AWS::EC2::Volume,
        # AWS::ElasticLoadBalancing::LoadBalancer, AWS::ElasticLoadBalancingV2::LoadBalancer,
        # AWS::Lambda::Function, AWS::MSK::Cluster, AWS::RDS::DBCluster, AWS::Route53::HealthCheck,
        # AWS::SQS::Queue, AWS::SNS::Topic, AWS::SNS::Subscription, AWS::EC2::VPC, AWS::EC2::VPNConnection,
        # AWS::EC2::VPNGateway, AWS::Route53RecoveryReadiness::DNSTargetResource

        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String

        # A list of resource objects.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_set_arn : String,
          @resource_set_name : String,
          @resource_set_type : String,
          @resources : Array(Types::Resource),
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The result of a successful Rule request, with status for an individual rule.

      struct RuleResult
        include JSON::Serializable

        # The time the resource was last checked for readiness, in ISO-8601 format, UTC.

        @[JSON::Field(key: "lastCheckedTimestamp")]
        getter last_checked_timestamp : Time

        # Details about the resource's readiness.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::Message)

        # The readiness at rule level.

        @[JSON::Field(key: "readiness")]
        getter readiness : String

        # The identifier of the rule.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        def initialize(
          @last_checked_timestamp : Time,
          @messages : Array(Types::Message),
          @readiness : String,
          @rule_id : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The target resource that the Route 53 record points to.

      struct TargetResource
        include JSON::Serializable

        # The Network Load Balancer Resource.

        @[JSON::Field(key: "nLBResource")]
        getter nlb_resource : Types::NLBResource?

        # The Route 53 resource.

        @[JSON::Field(key: "r53Resource")]
        getter r53_resource : Types::R53ResourceRecord?

        def initialize(
          @nlb_resource : Types::NLBResource? = nil,
          @r53_resource : Types::R53ResourceRecord? = nil
        )
        end
      end


      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateCellRequest
        include JSON::Serializable


        @[JSON::Field(key: "cellName")]
        getter cell_name : String


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)

        def initialize(
          @cell_name : String,
          @cells : Array(String)
        )
        end
      end


      struct UpdateCellResponse
        include JSON::Serializable


        @[JSON::Field(key: "cellArn")]
        getter cell_arn : String?


        @[JSON::Field(key: "cellName")]
        getter cell_name : String?


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "parentReadinessScopes")]
        getter parent_readiness_scopes : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cell_arn : String? = nil,
          @cell_name : String? = nil,
          @cells : Array(String)? = nil,
          @parent_readiness_scopes : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateReadinessCheckRequest
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String

        def initialize(
          @readiness_check_name : String,
          @resource_set_name : String
        )
        end
      end


      struct UpdateReadinessCheckResponse
        include JSON::Serializable


        @[JSON::Field(key: "readinessCheckArn")]
        getter readiness_check_arn : String?


        @[JSON::Field(key: "readinessCheckName")]
        getter readiness_check_name : String?


        @[JSON::Field(key: "resourceSet")]
        getter resource_set : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @readiness_check_arn : String? = nil,
          @readiness_check_name : String? = nil,
          @resource_set : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateRecoveryGroupRequest
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String

        def initialize(
          @cells : Array(String),
          @recovery_group_name : String
        )
        end
      end


      struct UpdateRecoveryGroupResponse
        include JSON::Serializable


        @[JSON::Field(key: "cells")]
        getter cells : Array(String)?


        @[JSON::Field(key: "recoveryGroupArn")]
        getter recovery_group_arn : String?


        @[JSON::Field(key: "recoveryGroupName")]
        getter recovery_group_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cells : Array(String)? = nil,
          @recovery_group_arn : String? = nil,
          @recovery_group_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateResourceSetRequest
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String


        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)

        def initialize(
          @resource_set_name : String,
          @resource_set_type : String,
          @resources : Array(Types::Resource)
        )
        end
      end


      struct UpdateResourceSetResponse
        include JSON::Serializable


        @[JSON::Field(key: "resourceSetArn")]
        getter resource_set_arn : String?


        @[JSON::Field(key: "resourceSetName")]
        getter resource_set_name : String?


        @[JSON::Field(key: "resourceSetType")]
        getter resource_set_type : String?


        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_set_arn : String? = nil,
          @resource_set_name : String? = nil,
          @resource_set_type : String? = nil,
          @resources : Array(Types::Resource)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
